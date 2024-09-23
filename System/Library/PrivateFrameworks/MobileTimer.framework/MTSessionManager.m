@implementation MTSessionManager

+ (void)warmUp
{
  NSObject *v3;
  id v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = a1;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ warming...", (uint8_t *)&v6, 0xCu);
  }

  v4 = MTSessionServerInterface();
  v5 = MTSessionClientInterface();
}

id __36__MTSessionManager_initWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v2 = a2;
  MTSessionServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MTSessionClientInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTXPCConnectionInfo infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:](MTXPCConnectionInfo, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", CFSTR("com.apple.MobileTimer.sessionserver"), v3, v4, v5, CFSTR("com.apple.MTSessionServer.wakeup"), 0, 4096);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v2);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__MTSessionManager_initWithMetrics___block_invoke_2;
  v9[3] = &unk_1E39CBC38;
  objc_copyWeak(&v10, &location);
  +[MTXPCConnectionProvider providerWithConnectionInfo:reconnectHandler:](MTXPCConnectionProvider, "providerWithConnectionInfo:reconnectHandler:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (MTSessionManagerExportedObject)exportedObject
{
  return self->_exportedObject;
}

- (MTSessionManager)init
{
  MTMetrics *v3;
  MTSessionManager *v4;

  v3 = objc_alloc_init(MTMetrics);
  v4 = -[MTSessionManager initWithMetrics:](self, "initWithMetrics:", v3);

  return v4;
}

- (MTSessionManager)initWithMetrics:(id)a3
{
  return (MTSessionManager *)-[MTSessionManager _initWithConnectionProvidingBlock:metrics:](self, "_initWithConnectionProvidingBlock:metrics:", &__block_literal_global_41, a3);
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MTSessionManager _initWithConnectionProvidingBlock:metrics:notificationCenter:](self, "_initWithConnectionProvidingBlock:metrics:notificationCenter:", v8, v7, v9);

  return v10;
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  void (**v8)(id, MTSessionManager *);
  id v9;
  id v10;
  MTSessionManager *v11;
  NSObject *v12;
  MTSessionManagerExportedObject *v13;
  MTSessionManagerExportedObject *exportedObject;
  uint64_t v15;
  MTXPCConnectionProvider *connectionProvider;
  objc_super v18;
  uint8_t buf[4];
  MTSessionManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, MTSessionManager *))a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MTSessionManager;
  v11 = -[MTSessionManager init](&v18, sel_init);
  if (v11)
  {
    MTLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeStrong((id *)&v11->_notificationCenter, a5);
    v13 = -[MTSessionManagerExportedObject initWithSessionManager:]([MTSessionManagerExportedObject alloc], "initWithSessionManager:", v11);
    exportedObject = v11->_exportedObject;
    v11->_exportedObject = v13;

    objc_storeStrong((id *)&v11->_metrics, a4);
    v8[2](v8, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    connectionProvider = v11->_connectionProvider;
    v11->_connectionProvider = (MTXPCConnectionProvider *)v15;

  }
  return v11;
}

uint64_t __38__MTSessionManager_endAlertingSession__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "endAlertingSession");
}

- (void)endAlertingSession
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  MTSessionManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ending alerting session", buf, 0xCu);
  }

  -[MTSessionManager connectionProvider](self, "connectionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MTSessionManager_endAlertingSession__block_invoke_2;
  v5[3] = &unk_1E39CC2D8;
  v5[4] = self;
  objc_msgSend(v4, "performRemoteBlock:withErrorHandler:", &__block_literal_global_13_0, v5);

}

- (MTXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

void __36__MTSessionManager_initWithMetrics___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reconnect");

}

- (MTSessionManager)initWithConnectionProvider:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  MTSessionManager *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__MTSessionManager_initWithConnectionProvider_metrics___block_invoke;
  v10[3] = &unk_1E39CE910;
  v11 = v6;
  v7 = v6;
  v8 = -[MTSessionManager _initWithConnectionProvidingBlock:metrics:](self, "_initWithConnectionProvidingBlock:metrics:", v10, a4);

  return v8;
}

id __55__MTSessionManager_initWithConnectionProvider_metrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MTSessionManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  id v8;
  id v9;
  MTSessionManager *v10;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__MTSessionManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke;
  v12[3] = &unk_1E39CE910;
  v13 = v8;
  v9 = v8;
  v10 = -[MTSessionManager _initWithConnectionProvidingBlock:metrics:notificationCenter:](self, "_initWithConnectionProvidingBlock:metrics:notificationCenter:", v12, a4, a5);

  return v10;
}

id __74__MTSessionManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MTSessionManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  -[MTXPCConnectionProvider invalidate](self->_connectionProvider, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)MTSessionManager;
  -[MTSessionManager dealloc](&v4, sel_dealloc);
}

- (void)reconnect
{
  id v2;

  -[MTSessionManager connectionProvider](self, "connectionProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performRemoteBlock:withErrorHandler:", &__block_literal_global_12_0, 0);

}

uint64_t __29__MTSessionManager_reconnect__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "checkIn");
}

void __38__MTSessionManager_endAlertingSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__MTSessionManager_endAlertingSession__block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong((id *)&self->_exportedObject, a3);
}

- (MTMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
}

void __38__MTSessionManager_endAlertingSession__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ ending alerting session failed with error %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
