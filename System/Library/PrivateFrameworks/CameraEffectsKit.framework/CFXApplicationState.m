@implementation CFXApplicationState

+ (void)beginMonitoringApplicationState
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CFXApplicationState_beginMonitoringApplicationState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

id __54__CFXApplicationState_beginMonitoringApplicationState__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "sharedInstance");
}

+ (CFXApplicationState)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__CFXApplicationState_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (CFXApplicationState *)(id)sharedInstance_s_sharedInstance;
}

void __37__CFXApplicationState_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_s_sharedInstance;
  sharedInstance_s_sharedInstance = (uint64_t)v1;

}

- (void)dealloc
{
  objc_super v3;

  -[CFXApplicationState unregisterForEvents](self, "unregisterForEvents");
  v3.receiver = self;
  v3.super_class = (Class)CFXApplicationState;
  -[CFXApplicationState dealloc](&v3, sel_dealloc);
}

- (CFXApplicationState)init
{
  CFXApplicationState *v2;
  CFXApplicationState *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CFXApplicationState;
  v2 = -[CFXApplicationState init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CFXApplicationState setApplicationState:](v2, "setApplicationState:", 0);
    -[CFXApplicationState registerForEvents](v3, "registerForEvents");
  }
  return v3;
}

- (void)registerForEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!-[CFXApplicationState isRegisteredForEvents](self, "isRegisteredForEvents"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x24BDF75D8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x24BDF7528], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x24BDD0C28], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x24BDD0C10], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x24BDD0C18], 0);

    -[CFXApplicationState setIsRegisteredForEvents:](self, "setIsRegisteredForEvents:", 1);
  }
}

- (void)unregisterForEvents
{
  void *v3;

  if (-[CFXApplicationState isRegisteredForEvents](self, "isRegisteredForEvents"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    -[CFXApplicationState setIsRegisteredForEvents:](self, "setIsRegisteredForEvents:", 0);
  }
}

- (void)applicationWillResignActive:(id)a3
{
  -[CFXApplicationState setApplicationState:](self, "setApplicationState:", 1);
}

- (void)applicationDidBecomeActive:(id)a3
{
  -[CFXApplicationState setApplicationState:](self, "setApplicationState:", 0);
}

- (void)applicationDidEnterBackground:(id)a3
{
  -[CFXApplicationState setApplicationState:](self, "setApplicationState:", 2);
}

- (int64_t)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(int64_t)a3
{
  self->_applicationState = a3;
}

- (BOOL)isRegisteredForEvents
{
  return self->_isRegisteredForEvents;
}

- (void)setIsRegisteredForEvents:(BOOL)a3
{
  self->_isRegisteredForEvents = a3;
}

@end
