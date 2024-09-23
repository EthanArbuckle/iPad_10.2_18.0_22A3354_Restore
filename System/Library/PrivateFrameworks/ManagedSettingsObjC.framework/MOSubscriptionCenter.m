@implementation MOSubscriptionCenter

void __36__MOSubscriptionCenter_sharedCenter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCenter__sharedCenter;
  sharedCenter__sharedCenter = v0;

}

- (MOSubscriptionCenter)init
{
  MOSubscriptionCenter *v2;
  uint64_t v3;
  NSMutableDictionary *effectiveSubscriptions;
  uint64_t v5;
  MOPassthroughSubject *effectiveSubject;
  uint64_t v7;
  NSObject *subscriptionLock;
  uint64_t v9;
  NSObject *connectionLock;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MOSubscriptionCenter;
  v2 = -[MOSubscriptionCenter init](&v12, sel_init);
  v3 = objc_opt_new();
  effectiveSubscriptions = v2->_effectiveSubscriptions;
  v2->_effectiveSubscriptions = (NSMutableDictionary *)v3;

  v5 = objc_opt_new();
  effectiveSubject = v2->_effectiveSubject;
  v2->_effectiveSubject = (MOPassthroughSubject *)v5;

  v7 = objc_opt_new();
  subscriptionLock = v2->_subscriptionLock;
  v2->_subscriptionLock = v7;

  v9 = objc_opt_new();
  connectionLock = v2->_connectionLock;
  v2->_connectionLock = v9;

  return v2;
}

+ (MOSubscriptionCenter)sharedCenter
{
  if (sharedCenter_onceToken != -1)
    dispatch_once(&sharedCenter_onceToken, &__block_literal_global_3);
  return (MOSubscriptionCenter *)(id)sharedCenter__sharedCenter;
}

- (MOPassthroughSubject)effectiveSubject
{
  return self->_effectiveSubject;
}

- (void)subscribeForEffectiveChanges:(id)a3 identifier:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v11, "count"))
  {
    v7 = self->_subscriptionLock;
    objc_sync_enter(v7);
    -[MOSubscriptionCenter effectiveInterestedGroups](self, "effectiveInterestedGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_effectiveSubscriptions, "setObject:forKeyedSubscript:", v11, v6);
    -[MOSubscriptionCenter effectiveInterestedGroups](self, "effectiveInterestedGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToSet:", v9);

    objc_sync_exit(v7);
    if ((v10 & 1) == 0)
      -[MOSubscriptionCenter updateSubscription](self, "updateSubscription");
  }
  else
  {
    -[MOSubscriptionCenter unsubscribeFromEffectiveChanges:](self, "unsubscribeFromEffectiveChanges:", v6);
  }

}

- (NSSet)effectiveInterestedGroups
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MOSubscriptionCenter effectiveSubscriptions](self, "effectiveSubscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "unionSet:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_msgSend(v4, "copy");
  return (NSSet *)v10;
}

- (NSMutableDictionary)effectiveSubscriptions
{
  return self->_effectiveSubscriptions;
}

- (void)updateSubscription
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MOSubscriptionCenter *v9;

  v3 = self->_subscriptionLock;
  objc_sync_enter(v3);
  -[MOSubscriptionCenter effectiveInterestedGroups](self, "effectiveInterestedGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  -[MOSubscriptionCenter xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__MOSubscriptionCenter_updateSubscription__block_invoke;
  v7[3] = &unk_1E675E958;
  v8 = v4;
  v9 = self;
  v6 = v4;
  +[MOXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v5, 1, v7);

}

- (NSXPCConnection)xpcConnection
{
  NSObject *v3;
  NSXPCConnection *currentConnection;
  NSXPCConnection **p_currentConnection;
  id v6;
  uint64_t v7;
  NSXPCConnection *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = self->_connectionLock;
  objc_sync_enter(v3);
  p_currentConnection = &self->_currentConnection;
  currentConnection = self->_currentConnection;
  if (!currentConnection)
  {
    v6 = +[MOManagedSettingsAgentPublisherConnection newConnectionWithExportedObject:](MOManagedSettingsAgentPublisherConnection, "newConnectionWithExportedObject:", self);
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__MOSubscriptionCenter_xpcConnection__block_invoke;
    v12[3] = &unk_1E675E388;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "setInterruptionHandler:", v12);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __37__MOSubscriptionCenter_xpcConnection__block_invoke_2;
    v10[3] = &unk_1E675E388;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v6, "setInvalidationHandler:", v10);
    objc_storeStrong((id *)p_currentConnection, v6);
    objc_msgSend(v6, "activate");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    currentConnection = *p_currentConnection;
  }
  v8 = currentConnection;
  objc_sync_exit(v3);

  return v8;
}

void __42__MOSubscriptionCenter_updateSubscription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "count");
    +[MOLogger subscription](MOLogger, "subscription");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v10 = *(_QWORD *)(a1 + 32);
        v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Subscribing for effective changes in groups: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(v5, "subscribeToEffectiveChangesForGroups:objC:", *(_QWORD *)(a1 + 32), 1);
    }
    else
    {
      if (v9)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Clearing effective settings change subscriptions", (uint8_t *)&v12, 2u);
      }

      objc_msgSend(v5, "clearEffectiveSubscription:", 1);
      objc_msgSend(*(id *)(a1 + 40), "clearCurrentConnectionAndInvalidate:", 1);
    }
  }
  else
  {
    +[MOLogger subscription](MOLogger, "subscription");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __42__MOSubscriptionCenter_updateSubscription__block_invoke_cold_1((uint64_t)v6, v11);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[MOSubscriptionCenter clearCurrentConnectionAndInvalidate:](self, "clearCurrentConnectionAndInvalidate:", 1);
  v3.receiver = self;
  v3.super_class = (Class)MOSubscriptionCenter;
  -[MOSubscriptionCenter dealloc](&v3, sel_dealloc);
}

void __37__MOSubscriptionCenter_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearCurrentConnectionAndInvalidate:", 1);
  objc_msgSend(WeakRetained, "updateSubscription");

}

void __37__MOSubscriptionCenter_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearCurrentConnectionAndInvalidate:", 0);

}

- (void)clearCurrentConnectionAndInvalidate:(BOOL)a3
{
  _BOOL4 v3;
  NSXPCConnection *currentConnection;
  NSObject *obj;

  v3 = a3;
  obj = self->_connectionLock;
  objc_sync_enter(obj);
  if (v3)
  {
    -[NSXPCConnection setInvalidationHandler:](self->_currentConnection, "setInvalidationHandler:", 0);
    -[NSXPCConnection invalidate](self->_currentConnection, "invalidate");
  }
  currentConnection = self->_currentConnection;
  self->_currentConnection = 0;

  objc_sync_exit(obj);
}

- (void)unsubscribeFromEffectiveChanges:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  v4 = self->_subscriptionLock;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_effectiveSubscriptions, "objectForKeyedSubscript:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MOSubscriptionCenter effectiveInterestedGroups](self, "effectiveInterestedGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_effectiveSubscriptions, "setObject:forKeyedSubscript:", 0, v9);
    -[MOSubscriptionCenter effectiveInterestedGroups](self, "effectiveInterestedGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToSet:", v7);

    objc_sync_exit(v4);
    if ((v8 & 1) == 0)
      -[MOSubscriptionCenter updateSubscription](self, "updateSubscription");
  }
  else
  {
    objc_sync_exit(v4);

  }
}

- (void)effectiveSettingsChangedForGroups:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    +[MOLogger subscription](MOLogger, "subscription");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1B4020000, v5, OS_LOG_TYPE_DEFAULT, "Effective settings changed for groups: %{public}@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__MOSubscriptionCenter_effectiveSettingsChangedForGroups___block_invoke;
    v6[3] = &unk_1E675E980;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __58__MOSubscriptionCenter_effectiveSettingsChangedForGroups___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "effectiveSubject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendValue:", *(_QWORD *)(a1 + 40));

}

- (NSObject)subscriptionLock
{
  return self->_subscriptionLock;
}

- (NSXPCConnection)currentConnection
{
  return self->_currentConnection;
}

- (void)setCurrentConnection:(id)a3
{
  objc_storeStrong((id *)&self->_currentConnection, a3);
}

- (NSObject)connectionLock
{
  return self->_connectionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong((id *)&self->_subscriptionLock, 0);
  objc_storeStrong((id *)&self->_effectiveSubscriptions, 0);
  objc_storeStrong((id *)&self->_effectiveSubject, 0);
}

void __42__MOSubscriptionCenter_updateSubscription__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B4020000, a2, OS_LOG_TYPE_ERROR, "Unable to obtain remote object proxy: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
