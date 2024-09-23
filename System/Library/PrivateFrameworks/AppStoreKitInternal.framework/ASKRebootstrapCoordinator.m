@implementation ASKRebootstrapCoordinator

+ (ASKRebootstrapCoordinator)sharedCoordinator
{
  if (sharedCoordinator_onceToken != -1)
    dispatch_once(&sharedCoordinator_onceToken, &__block_literal_global_7);
  return (ASKRebootstrapCoordinator *)(id)sharedCoordinator_sharedCoordinator;
}

- (id)registerCleanupHandler:(id)a3
{
  id v4;
  ASKStorefrontChangeHandlerToken *v5;
  void *v6;

  v4 = a3;
  v5 = -[ASKStorefrontChangeHandlerToken initWithHandler:]([ASKStorefrontChangeHandlerToken alloc], "initWithHandler:", v4);

  -[ASKRebootstrapCoordinator handlerTokens](self, "handlerTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  return v5;
}

- (NSHashTable)handlerTokens
{
  return self->_handlerTokens;
}

- (void)setAppBootstrapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

void __46__ASKRebootstrapCoordinator_sharedCoordinator__block_invoke()
{
  ASKRebootstrapCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(ASKRebootstrapCoordinator);
  v1 = (void *)sharedCoordinator_sharedCoordinator;
  sharedCoordinator_sharedCoordinator = (uint64_t)v0;

}

- (ASKRebootstrapCoordinator)init
{
  ASKRebootstrapCoordinator *v2;
  ASKStorefrontChangeProvider *v3;
  uint64_t v4;
  ASKStorefrontChangeProvider *changeObserver;
  uint64_t v6;
  NSHashTable *handlerTokens;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ASKRebootstrapCoordinator;
  v2 = -[ASKRebootstrapCoordinator init](&v15, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = [ASKStorefrontChangeProvider alloc];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __33__ASKRebootstrapCoordinator_init__block_invoke;
    v12 = &unk_1E9DC1CF8;
    objc_copyWeak(&v13, &location);
    v4 = -[ASKStorefrontChangeProvider initWithBlock:](v3, "initWithBlock:", &v9);
    changeObserver = v2->_changeObserver;
    v2->_changeObserver = (ASKStorefrontChangeProvider *)v4;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable", v9, v10, v11, v12);
    v6 = objc_claimAutoreleasedReturnValue();
    handlerTokens = v2->_handlerTokens;
    v2->_handlerTokens = (NSHashTable *)v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__ASKRebootstrapCoordinator_init__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0CFDAF0], "ask_generalLogConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D8328000, v3, OS_LOG_TYPE_DEBUG, "Storefront change detected", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_scheduleNotification, 0, 0);

}

- (void)scheduleNotification
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_notify, 0);
  if (-[ASKRebootstrapCoordinator delayCount](self, "delayCount"))
  {
    objc_msgSend(MEMORY[0x1E0CFDAF0], "ask_generalLogConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D8328000, v4, OS_LOG_TYPE_DEBUG, "Deferring storefront change notification", v6, 2u);
    }

    -[ASKRebootstrapCoordinator setHasPendingNotification:](self, "setHasPendingNotification:", 1);
  }
  else
  {
    v7[0] = *MEMORY[0x1E0C99860];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASKRebootstrapCoordinator performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_notify, 0, v5, 1.0);

  }
}

- (void)notify
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(void);
  void *v10;
  void (**v11)(void);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ASKRebootstrapCoordinator handlerTokens](self, "handlerTokens", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "handler");
        v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v9[2]();

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[ASKRebootstrapCoordinator appBootstrapHandler](self, "appBootstrapHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ASKRebootstrapCoordinator appBootstrapHandler](self, "appBootstrapHandler");
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11[2]();

  }
}

- (void)beginDelayingNotifications
{
  -[ASKRebootstrapCoordinator setDelayCount:](self, "setDelayCount:", -[ASKRebootstrapCoordinator delayCount](self, "delayCount") + 1);
}

- (void)endDelayingNotifications
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[ASKRebootstrapCoordinator delayCount](self, "delayCount"))
  {
    -[ASKRebootstrapCoordinator setDelayCount:](self, "setDelayCount:", -[ASKRebootstrapCoordinator delayCount](self, "delayCount") - 1);
    if (!-[ASKRebootstrapCoordinator delayCount](self, "delayCount"))
    {
      if (-[ASKRebootstrapCoordinator hasPendingNotification](self, "hasPendingNotification"))
      {
        objc_msgSend(MEMORY[0x1E0CFDAF0], "ask_generalLogConfig");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v3, "OSLogObject");
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v5 = 0;
          _os_log_impl(&dword_1D8328000, v4, OS_LOG_TYPE_DEBUG, "Flushing deferred storefront change notification", v5, 2u);
        }

        -[ASKRebootstrapCoordinator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_notify, 0, 0.0);
        -[ASKRebootstrapCoordinator setHasPendingNotification:](self, "setHasPendingNotification:", 0);
      }
    }
  }
}

- (ASKStorefrontChangeProvider)changeObserver
{
  return self->_changeObserver;
}

- (id)appBootstrapHandler
{
  return self->_appBootstrapHandler;
}

- (int64_t)delayCount
{
  return self->_delayCount;
}

- (void)setDelayCount:(int64_t)a3
{
  self->_delayCount = a3;
}

- (BOOL)hasPendingNotification
{
  return self->_hasPendingNotification;
}

- (void)setHasPendingNotification:(BOOL)a3
{
  self->_hasPendingNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appBootstrapHandler, 0);
  objc_storeStrong((id *)&self->_handlerTokens, 0);
  objc_storeStrong((id *)&self->_changeObserver, 0);
}

@end
