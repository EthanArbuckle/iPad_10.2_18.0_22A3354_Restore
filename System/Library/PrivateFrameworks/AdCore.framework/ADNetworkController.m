@implementation ADNetworkController

- (void)_checkForNetworkAndNotify
{
  ADNetworkController *v2;
  void *v3;
  ADNetworkController *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_isUpdating)
  {
    obj->_isUpdating = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Checking for the network and sending a notification."), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v3, 0);

    obj->_networkType = 0;
    -[ADNetworkController _checkForNetwork](obj, "_checkForNetwork");
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_9);
    v2 = obj;
    obj->_isUpdating = 0;
  }
  objc_sync_exit(v2);

}

- (void)_checkForNetwork
{
  void *v3;
  unsigned int reachabilityFlags;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t networkType;
  __CFString *v10;
  void *v11;
  __CFString *v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Looking up network type."), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("ToroLogging"), v3, 0);

  reachabilityFlags = self->_reachabilityFlags;
  if ((reachabilityFlags & 2) != 0)
  {
    self->_networkType = 2;
    if ((reachabilityFlags & 0x40000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kSCNetworkReachabilityFlagsIsWWAN is true! We are NOT on WiFi"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("ToroLogging"), v6, 0);

      self->_networkType = -[ADNetworkController cellNetworkType](self, "cellNetworkType");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kSCNetworkReachabilityFlagsIsWWAN is false! We are on WiFi"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("ToroLogging"), v5, 0);

    }
  }
  if (!self->_networkType)
    self->_networkType = -[ADNetworkController cellNetworkType](self, "cellNetworkType");
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  networkType = self->_networkType;
  if (networkType >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_networkType);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E82B2018[networkType];
  }
  v12 = v10;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@] Network has a type of: %@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("ToroLogging"), v11, 0);

}

- (int)cellNetworkType
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0CA6E38]);
  -[ADNetworkController getDataContext:](self, "getDataContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "getDataStatus:error:", v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find cell network type due no data or error: %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdSettingsLogging"), v9, 16);

  }
  v10 = -[ADNetworkController dataIndicatorToConnection:](self, "dataIndicatorToConnection:", objc_msgSend(v5, "indicator"));

  return v10;
}

- (id)getDataContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;

  v8 = 0;
  objc_msgSend(a3, "getPreferredDataSubscriptionContextSync:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = v4;
  if (!v3 || v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find telephone subscription context due to error: %@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdSettingsLogging"), v6, 16);

  }
  return v3;
}

- (int)dataIndicatorToConnection:(int)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v11[13];
  _QWORD v12[14];

  v3 = *(_QWORD *)&a3;
  v12[13] = *MEMORY[0x1E0C80C00];
  v4 = (void *)dataIndicatorToConnection__indicatorToConnectionDictionary;
  if (!dataIndicatorToConnection__indicatorToConnectionDictionary)
  {
    v11[0] = &unk_1E82BE6B0;
    v11[1] = &unk_1E82BE6E0;
    v12[0] = &unk_1E82BE6C8;
    v12[1] = &unk_1E82BE6F8;
    v11[2] = &unk_1E82BE710;
    v11[3] = &unk_1E82BE740;
    v12[2] = &unk_1E82BE728;
    v12[3] = &unk_1E82BE758;
    v11[4] = &unk_1E82BE770;
    v11[5] = &unk_1E82BE7A0;
    v12[4] = &unk_1E82BE788;
    v12[5] = &unk_1E82BE7B8;
    v11[6] = &unk_1E82BE7D0;
    v11[7] = &unk_1E82BE800;
    v12[6] = &unk_1E82BE7E8;
    v12[7] = &unk_1E82BE818;
    v11[8] = &unk_1E82BE830;
    v11[9] = &unk_1E82BE860;
    v12[8] = &unk_1E82BE848;
    v12[9] = &unk_1E82BE848;
    v11[10] = &unk_1E82BE878;
    v11[11] = &unk_1E82BE890;
    v12[10] = &unk_1E82BE848;
    v12[11] = &unk_1E82BE848;
    v11[12] = &unk_1E82BE8A8;
    v12[12] = &unk_1E82BE848;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 13);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)dataIndicatorToConnection__indicatorToConnectionDictionary;
    dataIndicatorToConnection__indicatorToConnectionDictionary = v5;

    v4 = (void *)dataIndicatorToConnection__indicatorToConnectionDictionary;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  return v9;
}

uint64_t __46__ADNetworkController_sharedNetworkController__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___ADNetworkController;
  v1 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedNetworkController_sharedNetworkController;
  sharedNetworkController_sharedNetworkController = v1;

  return objc_msgSend((id)sharedNetworkController_sharedNetworkController, "start");
}

- (void)_updateStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];

  v3 = a3;
  if (-[ADNetworkController canReachTheNetwork](self, "canReachTheNetwork") != a3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_opt_class();
    v7 = CFSTR("is not");
    if (v3)
      v7 = CFSTR("is");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@] Network %@ connected."), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v8, 0);

    -[ADNetworkController setCanReachTheNetwork:](self, "setCanReachTheNetwork:", v3);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__ADNetworkController__updateStatus___block_invoke;
    block[3] = &unk_1E82B1FD8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)start
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  __SCNetworkReachability *v6;
  const __CFString *v7;
  void *v8;
  SCNetworkReachabilityContext context;
  _QWORD block[5];

  -[ADNetworkController setCanReachTheNetwork:](self, "setCanReachTheNetwork:", 0);
  self->_isUpdating = 0;
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ap.adprivacyd.networkwatcher", 0);
  queue = self->_queue;
  self->_queue = v3;

  v5 = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__ADNetworkController_start__block_invoke;
  block[3] = &unk_1E82B1FD8;
  block[4] = self;
  dispatch_async(v5, block);
  if (!self->_reachability)
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = self;
    v6 = SCNetworkReachabilityCreateWithName((CFAllocatorRef)*MEMORY[0x1E0C9AE00], "apple.com");
    self->_reachability = v6;
    if (!v6)
    {
      v7 = CFSTR("[%@] Unable to create reachability object.");
      goto LABEL_7;
    }
    if (!SCNetworkReachabilitySetCallback(v6, (SCNetworkReachabilityCallBack)_reachabilityDidChange, &context)
      || !SCNetworkReachabilitySetDispatchQueue(self->_reachability, (dispatch_queue_t)self->_queue))
    {
      v7 = CFSTR("[%@] Could not set reachability callback or queue.");
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("iAdInternalLogging"), v8, 16);

      self->_reachabilityFlags = 0;
    }
  }
}

- (void)setCanReachTheNetwork:(BOOL)a3
{
  self->_canReachTheNetwork = a3;
}

- (BOOL)canReachTheNetwork
{
  return self->_canReachTheNetwork;
}

void __48__ADNetworkController__checkForNetworkAndNotify__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("ADNetworkDidChangeNotification"), 0);

}

uint64_t __37__ADNetworkController__updateStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkForNetworkAndNotify");
}

uint64_t __28__ADNetworkController_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkForNetworkAndNotify");
}

+ (id)sharedNetworkController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ADNetworkController_sharedNetworkController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedNetworkController_onceToken != -1)
    dispatch_once(&sharedNetworkController_onceToken, block);
  return (id)sharedNetworkController_sharedNetworkController;
}

- (int)networkType
{
  ADNetworkController *v2;
  int networkType;

  v2 = self;
  objc_sync_enter(v2);
  networkType = v2->_networkType;
  if (!networkType)
  {
    -[ADNetworkController _checkForNetworkAndNotify](v2, "_checkForNetworkAndNotify");
    networkType = v2->_networkType;
  }
  objc_sync_exit(v2);

  return networkType;
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationTimer, 0);
}

@end
