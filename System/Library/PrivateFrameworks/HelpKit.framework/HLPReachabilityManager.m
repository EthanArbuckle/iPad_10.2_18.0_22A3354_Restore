@implementation HLPReachabilityManager

+ (id)defaultManager
{
  if (defaultManager_predicate != -1)
    dispatch_once(&defaultManager_predicate, &__block_literal_global_3);
  return (id)defaultManager_gSharedManager;
}

void __40__HLPReachabilityManager_defaultManager__block_invoke()
{
  HLPReachabilityManager *v0;
  void *v1;

  v0 = objc_alloc_init(HLPReachabilityManager);
  v1 = (void *)defaultManager_gSharedManager;
  defaultManager_gSharedManager = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[HLPReachabilityManager stopNotifier](self, "stopNotifier");
  v3.receiver = self;
  v3.super_class = (Class)HLPReachabilityManager;
  -[HLPReachabilityManager dealloc](&v3, sel_dealloc);
}

- (HLPReachabilityManager)init
{
  HLPReachabilityManager *v2;
  uint64_t v3;
  HLPReachability *internetReachability;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HLPReachabilityManager;
  v2 = -[HLPReachabilityManager init](&v6, sel_init);
  if (v2)
  {
    +[HLPReachability reachabilityForInternetConnection](HLPReachability, "reachabilityForInternetConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    internetReachability = v2->_internetReachability;
    v2->_internetReachability = (HLPReachability *)v3;

    v2->_internetActive = -[HLPReachability currentReachabilityStatus](v2->_internetReachability, "currentReachabilityStatus") != 0;
  }
  return v2;
}

- (BOOL)isNetworkError:(id)a3
{
  return !self->_internetActive || objc_msgSend(a3, "code") == -1009;
}

- (void)startNotifier
{
  const __CFString *hostName;
  HLPReachability *v4;
  HLPReachability *hostReachability;
  void *v6;

  if (!self->_notifying)
  {
    self->_notifying = 1;
    if (!self->_hostReachability)
    {
      if (self->_hostName)
        hostName = (const __CFString *)self->_hostName;
      else
        hostName = CFSTR("www.apple.com");
      +[HLPReachability reachabilityWithHostName:](HLPReachability, "reachabilityWithHostName:", hostName);
      v4 = (HLPReachability *)objc_claimAutoreleasedReturnValue();
      hostReachability = self->_hostReachability;
      self->_hostReachability = v4;

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_reachabilityChanged_, kHLPReachabilityChangedNotification[0], 0);

    -[HLPReachability startNotifier](self->_internetReachability, "startNotifier");
    -[HLPReachability startNotifier](self->_hostReachability, "startNotifier");
  }
}

- (void)stopNotifier
{
  void *v3;

  if (self->_notifying)
  {
    self->_notifying = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    -[HLPReachability stopNotifier](self->_internetReachability, "stopNotifier");
    -[HLPReachability stopNotifier](self->_hostReachability, "stopNotifier");
    -[HLPReachabilityManager setReachabilityInitialized:](self, "setReachabilityInitialized:", 0);
  }
}

- (void)reachabilityChanged:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  _BOOL8 hostActive;
  id v7;

  -[HLPReachabilityManager setReachabilityInitialized:](self, "setReachabilityInitialized:", 1);
  v4 = -[HLPReachability currentReachabilityStatus](self->_internetReachability, "currentReachabilityStatus");
  if (v4 <= 2)
    self->_internetActive = 0x10100u >> (8 * v4);
  v5 = -[HLPReachability currentReachabilityStatus](self->_hostReachability, "currentReachabilityStatus");
  if (v5 <= 2)
    self->_hostActive = 0x10100u >> (8 * v5);
  if (!self->_internetActive)
  {
    if (!-[HLPReachabilityManager connected](self, "connected"))
      return;
    hostActive = 0;
    goto LABEL_10;
  }
  hostActive = self->_hostActive;
  if (-[HLPReachabilityManager connected](self, "connected") != hostActive)
  {
LABEL_10:
    -[HLPReachabilityManager setConnected:](self, "setConnected:", hostActive);
    -[HLPReachabilityManager delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reachabilityManagerConnectionStatusChanged:connected:", self, -[HLPReachabilityManager connected](self, "connected"));

  }
}

- (BOOL)reachabilityInitialized
{
  return self->_reachabilityInitialized;
}

- (void)setReachabilityInitialized:(BOOL)a3
{
  self->_reachabilityInitialized = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)internetActive
{
  return self->_internetActive;
}

- (void)setInternetActive:(BOOL)a3
{
  self->_internetActive = a3;
}

- (HLPReachabilityManagerDelegate)delegate
{
  return (HLPReachabilityManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HLPReachability)internetReachability
{
  return self->_internetReachability;
}

- (void)setInternetReachability:(id)a3
{
  objc_storeStrong((id *)&self->_internetReachability, a3);
}

- (HLPReachability)hostReachability
{
  return self->_hostReachability;
}

- (void)setHostReachability:(id)a3
{
  objc_storeStrong((id *)&self->_hostReachability, a3);
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
  objc_storeStrong((id *)&self->_hostName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_hostReachability, 0);
  objc_storeStrong((id *)&self->_internetReachability, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
