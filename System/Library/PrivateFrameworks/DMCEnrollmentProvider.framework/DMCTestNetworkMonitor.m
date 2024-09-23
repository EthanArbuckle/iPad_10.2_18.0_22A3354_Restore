@implementation DMCTestNetworkMonitor

- (DMCTestNetworkMonitor)initWithNetworkAvailableHandler:(id)a3
{
  id v4;
  DMCTestNetworkMonitor *v5;
  DMCTestNetworkMonitor *v6;
  uint64_t v7;
  id availableHanlder;
  _QWORD v10[4];
  DMCTestNetworkMonitor *v11;
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMCTestNetworkMonitor;
  v5 = -[DMCTestNetworkMonitor init](&v13, sel_init);
  if (v5)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__DMCTestNetworkMonitor_initWithNetworkAvailableHandler___block_invoke;
    v10[3] = &unk_24D52E618;
    v12 = v4;
    v6 = v5;
    v11 = v6;
    v7 = MEMORY[0x2199F7854](v10);
    availableHanlder = v6->_availableHanlder;
    v6->_availableHanlder = (id)v7;

  }
  return v5;
}

uint64_t __57__DMCTestNetworkMonitor_initWithNetworkAvailableHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)startMonitoring
{
  void *v3;
  __SCNetworkReachability *v4;
  __SCNetworkReachability *reachability;
  __CFRunLoop *Main;
  SCNetworkReachabilityContext v7;
  SCNetworkReachabilityFlags flags;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  if (!self->_reachability)
  {
    v9[0] = CFSTR("nodename");
    v9[1] = CFSTR("ResolverBypass");
    v10[0] = CFSTR("www.apple.com");
    v10[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (__SCNetworkReachability *)SCNetworkReachabilityCreateWithOptions();
    self->_reachability = v4;
    flags = 0;
    SCNetworkReachabilityGetFlags(v4, &flags);
    if (!-[DMCTestNetworkMonitor verifyNetworkFlags:](self, "verifyNetworkFlags:", flags))
    {
      v7.version = 0;
      memset(&v7.retain, 0, 24);
      v7.info = self;
      SCNetworkReachabilitySetCallback(self->_reachability, (SCNetworkReachabilityCallBack)_networkReachabilityCallback, &v7);
      reachability = self->_reachability;
      Main = CFRunLoopGetMain();
      SCNetworkReachabilityScheduleWithRunLoop(reachability, Main, (CFStringRef)*MEMORY[0x24BDBD598]);
    }

  }
}

- (BOOL)verifyNetworkFlags:(unsigned int)a3
{
  _BOOL4 v4;
  NSObject *v5;
  void (**v6)(void);
  __SCNetworkReachability *reachability;
  __CFRunLoop *Main;
  uint8_t v10[16];

  v4 = -[DMCTestNetworkMonitor isNetworkAvailableWithFlags:](self, "isNetworkAvailableWithFlags:", *(_QWORD *)&a3);
  if (v4)
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_216358000, v5, OS_LOG_TYPE_DEFAULT, "Network is available.", v10, 2u);
    }
    -[DMCTestNetworkMonitor availableHanlder](self, "availableHanlder");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    -[DMCTestNetworkMonitor setAvailableHanlder:](self, "setAvailableHanlder:", 0);
    SCNetworkReachabilitySetCallback(self->_reachability, 0, 0);
    reachability = self->_reachability;
    Main = CFRunLoopGetMain();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachability, Main, (CFStringRef)*MEMORY[0x24BDBD598]);
    CFRelease(self->_reachability);
  }
  return v4;
}

- (BOOL)isNetworkAvailableWithFlags:(unsigned int)a3
{
  return (a3 >> 1) & 1;
}

- (__SCNetworkReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(__SCNetworkReachability *)a3
{
  self->_reachability = a3;
}

- (id)availableHanlder
{
  return self->_availableHanlder;
}

- (void)setAvailableHanlder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_availableHanlder, 0);
}

@end
