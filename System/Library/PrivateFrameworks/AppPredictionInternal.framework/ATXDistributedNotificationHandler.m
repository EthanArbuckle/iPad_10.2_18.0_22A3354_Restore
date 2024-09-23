@implementation ATXDistributedNotificationHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14 != -1)
    dispatch_once(&sharedInstance_onceToken_14, &__block_literal_global_251);
  return (id)sharedInstance_handler;
}

void __51__ATXDistributedNotificationHandler_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_handler;
  sharedInstance_handler = v0;

}

- (ATXDistributedNotificationHandler)init
{
  ATXDistributedNotificationHandler *v2;
  uint64_t v3;
  NSMutableSet *recentNotifications;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXDistributedNotificationHandler;
  v2 = -[ATXDistributedNotificationHandler init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recentNotifications = v2->_recentNotifications;
    v2->_recentNotifications = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:suspensionBehavior:", v2, sel__notificationFired_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, 0);
    objc_msgSend(v5, "addObserver:selector:name:object:suspensionBehavior:", v2, sel__notificationFired_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ATXDistributedNotificationHandler;
  -[ATXDistributedNotificationHandler dealloc](&v4, sel_dealloc);
}

- (void)_notificationFired:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__ATXDistributedNotificationHandler__notificationFired___block_invoke;
  v6[3] = &unk_1E82DACB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__ATXDistributedNotificationHandler__notificationFired___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_repostNotificationFromSource:name:userInfo:", CFSTR("distributed notification"), v4, v3);

}

- (void)_pruneOldRecents
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "ATXDistributedNotificationHandler: removing %ld old notifications", (uint8_t *)&v3, 0xCu);
}

BOOL __53__ATXDistributedNotificationHandler__pruneOldRecents__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a2, "timestamp");
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return vabdd_f64(v3, v4) > 10.0;
}

- (void)_repostNotificationFromSource:(id)a3 name:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  _ATXDistributedNotification *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ATXDistributedNotificationHandler _pruneOldRecents](self, "_pruneOldRecents");
  v11 = -[_ATXDistributedNotification initWithName:userInfo:]([_ATXDistributedNotification alloc], "initWithName:userInfo:", v9, v10);
  if (-[NSMutableSet containsObject:](self->_recentNotifications, "containsObject:", v11))
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543874;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v13 = "ATXDistributedNotificationHandler: dropping duplicate event (%{public}@) %{public}@; userInfo=%@";
LABEL_6:
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", v9, 0, v10);

    -[NSMutableSet addObject:](self->_recentNotifications, "addObject:", v11);
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543874;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v13 = "ATXDistributedNotificationHandler: handled event (%{public}@) %{public}@; userInfo=%@";
      goto LABEL_6;
    }
  }

}

- (void)registerXPCHandler
{
  NSObject *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C80D38];
  v3 = MEMORY[0x1E0C80D38];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__ATXDistributedNotificationHandler_registerXPCHandler__block_invoke;
  v4[3] = &unk_1E82EB998;
  objc_copyWeak(&v5, &location);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v2, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__ATXDistributedNotificationHandler_registerXPCHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  xpc_object_t xdict;

  xdict = a2;
  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(xdict, "UserInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_repostNotificationFromSource:name:userInfo:", CFSTR("XPC stream"), v5, v7);

  objc_autoreleasePoolPop(v4);
  v9 = (id)objc_opt_self();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentNotifications, 0);
}

@end
