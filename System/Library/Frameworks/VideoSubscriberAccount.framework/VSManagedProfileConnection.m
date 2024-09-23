@implementation VSManagedProfileConnection

+ (id)sharedConnection
{
  if (sharedConnection___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedConnection___vs_lazy_init_predicate, &__block_literal_global_26);
  return (id)sharedConnection___vs_lazy_init_variable;
}

void __46__VSManagedProfileConnection_sharedConnection__block_invoke()
{
  VSManagedProfileConnection *v0;
  void *v1;

  v0 = objc_alloc_init(VSManagedProfileConnection);
  v1 = (void *)sharedConnection___vs_lazy_init_variable;
  sharedConnection___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSManagedProfileConnection)init
{
  VSManagedProfileConnection *v2;
  uint64_t v3;
  MCProfileConnection *profileConnection;
  dispatch_queue_t v5;
  OS_dispatch_queue *notificationQueue;
  NSMutableSet *v7;
  NSMutableSet *observers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSManagedProfileConnection;
  v2 = -[VSManagedProfileConnection init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = (MCProfileConnection *)v3;

    v5 = dispatch_queue_create(0, 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observers = v2->_observers;
    v2->_observers = v7;

  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[VSManagedProfileConnection notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VSManagedProfileConnection_registerObserver___block_invoke;
  block[3] = &unk_1E939F138;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __47__VSManagedProfileConnection_registerObserver___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[VSManagedProfileConnection notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VSManagedProfileConnection_unregisterObserver___block_invoke;
  block[3] = &unk_1E939F138;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __49__VSManagedProfileConnection_unregisterObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (id)providerUniqueID
{
  void *v2;
  void *v3;

  -[VSManagedProfileConnection profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceOrganizationVendorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userToken
{
  void *v2;
  void *v3;

  -[VSManagedProfileConnection profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tvProviderUserToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)refreshProfileWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (int64_t)analyticsAllowed
{
  void *v3;
  int64_t v4;

  -[VSManagedProfileConnection profileConnection](self, "profileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VSManagedProfileConnection BOOLForManagedConfigurationBool:](self, "BOOLForManagedConfigurationBool:", objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FC0]));

  return v4;
}

- (int64_t)appInstallationAllowed
{
  void *v3;
  int64_t v4;

  -[VSManagedProfileConnection profileConnection](self, "profileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VSManagedProfileConnection BOOLForManagedConfigurationBool:](self, "BOOLForManagedConfigurationBool:", objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F08]));

  return v4;
}

- (int64_t)UIAppInstallationAllowed
{
  void *v3;
  int64_t v4;

  -[VSManagedProfileConnection profileConnection](self, "profileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VSManagedProfileConnection BOOLForManagedConfigurationBool:](self, "BOOLForManagedConfigurationBool:", objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47188]));

  return v4;
}

- (int64_t)accountModificationAllowed
{
  void *v3;
  int64_t v4;

  -[VSManagedProfileConnection profileConnection](self, "profileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VSManagedProfileConnection BOOLForManagedConfigurationBool:](self, "BOOLForManagedConfigurationBool:", objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]));

  return v4;
}

- (int64_t)TVProviderModificationAllowed
{
  void *v3;
  int64_t v4;

  -[VSManagedProfileConnection profileConnection](self, "profileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VSManagedProfileConnection BOOLForManagedConfigurationBool:](self, "BOOLForManagedConfigurationBool:", objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47160]));

  return v4;
}

- (int64_t)maximumAppsRating
{
  void *v2;
  void *v3;
  int64_t v4;

  -[VSManagedProfileConnection profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveValueForSetting:", *MEMORY[0x1E0D470B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)BOOLForManagedConfigurationBool:(int)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[VSManagedProfileConnection notificationQueue](self, "notificationQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__VSManagedProfileConnection_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke;
  block[3] = &unk_1E939EE88;
  block[4] = self;
  dispatch_async(v5, block);

}

void __103__VSManagedProfileConnection_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "profileConnectionSettingsChanged:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void)setProfileConnection:(id)a3
{
  objc_storeStrong((id *)&self->_profileConnection, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
}

@end
