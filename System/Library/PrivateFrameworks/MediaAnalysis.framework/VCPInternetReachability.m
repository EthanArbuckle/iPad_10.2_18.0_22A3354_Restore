@implementation VCPInternetReachability

- (VCPInternetReachability)init
{
  VCPInternetReachability *v2;
  VCPInternetReachability *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *callbackQueue;
  const __SCNetworkReachability *v6;
  NSObject *v7;
  VCPInternetReachability *v8;
  _QWORD block[4];
  VCPInternetReachability *v11;
  uint8_t buf[16];
  SCNetworkReachabilityContext context;
  objc_super v14;
  sockaddr address;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCPInternetReachability;
  v2 = -[VCPInternetReachability init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&address.sa_len = 528;
    *(_QWORD *)&address.sa_data[6] = 0;
    context.version = 0;
    context.info = v2;
    memset(&context.retain, 0, 24);
    v4 = dispatch_queue_create("com.apple.mediaanalysis.reachability", 0);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v4;

    if (v3->_callbackQueue
      && (v6 = SCNetworkReachabilityCreateWithAddress(0, &address), (v3->_reachability = v6) != 0)
      && SCNetworkReachabilitySetCallback(v6, (SCNetworkReachabilityCallBack)ReachabilityCallback, &context)
      && SCNetworkReachabilitySetDispatchQueue(v3->_reachability, (dispatch_queue_t)v3->_callbackQueue))
    {
      v7 = v3->_callbackQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__VCPInternetReachability_init__block_invoke;
      block[3] = &unk_1E6B15468;
      v11 = v3;
      dispatch_sync(v7, block);

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Reachability initialization failed; assuming no connection",
          buf,
          2u);
      }
      v3->_hasWifiOrEthernetConnection = 0;
    }
    v8 = v3;
  }

  return v3;
}

void __31__VCPInternetReachability_init__block_invoke(uint64_t a1)
{
  uint8_t v2[12];
  SCNetworkReachabilityFlags flags;

  flags = 0;
  if (SCNetworkReachabilityGetFlags(*(SCNetworkReachabilityRef *)(*(_QWORD *)(a1 + 32) + 16), &flags))
  {
    objc_msgSend(*(id *)(a1 + 32), "setReachabilityForFlags:update:", flags, 0);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Reachability flags invalid; assuming no connection",
        v2,
        2u);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  }
}

+ (id)sharedInstance
{
  if (+[VCPInternetReachability sharedInstance]::once != -1)
    dispatch_once(&+[VCPInternetReachability sharedInstance]::once, &__block_literal_global_3);
  return (id)+[VCPInternetReachability sharedInstance]::instance;
}

void __41__VCPInternetReachability_sharedInstance__block_invoke()
{
  VCPInternetReachability *v0;
  void *v1;

  v0 = objc_alloc_init(VCPInternetReachability);
  v1 = (void *)+[VCPInternetReachability sharedInstance]::instance;
  +[VCPInternetReachability sharedInstance]::instance = (uint64_t)v0;

}

- (void)dealloc
{
  __SCNetworkReachability *reachability;
  objc_super v4;

  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetDispatchQueue(reachability, 0);
    CFRelease(self->_reachability);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPInternetReachability;
  -[VCPInternetReachability dealloc](&v4, sel_dealloc);
}

- (void)setReachabilityForFlags:(unsigned int)a3 update:(BOOL)a4
{
  _BOOL4 v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0)
    v5 = 0;
  if ((a3 & 4) == 0)
    v5 = 1;
  if ((a3 & 0x40000) != 0)
    v5 = 0;
  if ((a3 & 2) == 0)
    v5 = 0;
  if (!a4 || self->_hasWifiOrEthernetConnection != v5)
  {
    self->_hasWifiOrEthernetConnection = v5;
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      if (self->_hasWifiOrEthernetConnection)
        v6 = "C";
      else
        v6 = "Not c";
      v7 = 136315138;
      v8 = v6;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%sonnected to internet via WiFi/Ethernet", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)hasWifiOrEthernetConnection
{
  return self->_hasWifiOrEthernetConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
