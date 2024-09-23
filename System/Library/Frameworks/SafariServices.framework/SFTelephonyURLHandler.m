@implementation SFTelephonyURLHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_59);
  return (id)sharedInstance_handler;
}

void __39__SFTelephonyURLHandler_sharedInstance__block_invoke()
{
  SFTelephonyURLHandler *v0;
  void *v1;

  v0 = objc_alloc_init(SFTelephonyURLHandler);
  v1 = (void *)sharedInstance_handler;
  sharedInstance_handler = (uint64_t)v0;

}

- (SFTelephonyURLHandler)init
{
  SFTelephonyURLHandler *v2;
  NSMutableSet *v3;
  NSMutableSet *pendingRequests;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFTelephonyURLHandler;
  v2 = -[SFTelephonyURLHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v3;

  }
  return v2;
}

- (BOOL)openURLForDialRequest:(id)a3 withScene:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  SFTelephonyURLRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v10)
    {
      v11 = -[SFTelephonyURLRequest initWithCompletionHandler:]([SFTelephonyURLRequest alloc], "initWithCompletionHandler:", v10);
      -[SFTelephonyURLRequest successNotificationName](v11, "successNotificationName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSuccessNotification:", v12);

      -[SFTelephonyURLRequest failureNotificationName](v11, "failureNotificationName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFailureNotification:", v13);

      -[SFTelephonyURLHandler addObserverForRequest:](self, "addObserverForRequest:", v11);
    }
    objc_msgSend(v8, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openURL:options:completionHandler:", v14, 0, 0);

    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)addObserverForRequest:(id)a3
{
  id v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v6;
  __CFNotificationCenter *v7;
  __CFString *v8;
  id v9;

  v4 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  objc_msgSend(v4, "failureNotificationName");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)dialRequestNotificationHandler, v6, 0, (CFNotificationSuspensionBehavior)1028);

  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  objc_msgSend(v4, "successNotificationName");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(v7, self, (CFNotificationCallback)dialRequestNotificationHandler, v8, 0, (CFNotificationSuspensionBehavior)1028);

  -[SFTelephonyURLHandler pendingRequests](self, "pendingRequests");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v4);

}

- (void)removeObserverForRequest:(id)a3
{
  id v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v6;
  __CFNotificationCenter *v7;
  __CFString *v8;
  id v9;

  v4 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  objc_msgSend(v4, "successNotificationName");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v6, 0);

  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  objc_msgSend(v4, "failureNotificationName");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(v7, self, v8, 0);

  -[SFTelephonyURLHandler pendingRequests](self, "pendingRequests");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v4);

}

- (NSMutableSet)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

@end
