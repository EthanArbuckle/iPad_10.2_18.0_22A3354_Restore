@implementation CPDashboardController

+ (id)_dashboardProvidingInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7DE8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_hostSetShortcutButtons_completion_, 0, 0);

  return v2;
}

+ (id)_dashboardClientInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E2130);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPDashboardController;
  return -[CPDashboardController init](&v3, sel_init);
}

- (void)setShortcutButtons:(NSArray *)shortcutButtons
{
  NSArray *v4;
  NSObject *v5;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  int v9;
  CPDashboardController *v10;
  __int16 v11;
  NSArray *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = shortcutButtons;
  CarPlayFrameworkGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "%@: Setting shortcut buttons: %@", (uint8_t *)&v9, 0x16u);
  }

  v6 = (NSArray *)-[NSArray copy](v4, "copy");
  v7 = self->_shortcutButtons;
  self->_shortcutButtons = v6;

  -[CPDashboardController dashboardProvider](self, "dashboardProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hostSetShortcutButtons:completion:", v4, &__block_literal_global_14);

}

- (void)_sceneConnect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (CPCurrentProcessHasMapsEntitlement()
    && (objc_msgSend(v5, "settings"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v5, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "templateEndpoint");
    v9 = objc_claimAutoreleasedReturnValue();

    CarPlayFrameworkGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "_identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v11;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_20D6F4000, v10, OS_LOG_TYPE_DEFAULT, "Connecting to dashboard listener endpoint for scene identifier: %{public}@ endpoint %@", (uint8_t *)&v20, 0x16u);

    }
    v12 = objc_alloc_init(MEMORY[0x24BDD19A0]);
    objc_msgSend(v12, "_setEndpoint:", v9);
    -[CPDashboardController _connectToListenerEndpoint:](self, "_connectToListenerEndpoint:", v12);

  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CPDashboardController _sceneConnect:].cold.1(v9, v13, v14, v15, v16, v17, v18, v19);
  }

}

- (void)_connectToListenerEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v4);
  objc_msgSend((id)objc_opt_class(), "_dashboardProvidingInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);
  objc_msgSend((id)objc_opt_class(), "_dashboardClientInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);
  objc_msgSend(v5, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__CPDashboardController__connectToListenerEndpoint___block_invoke;
  v12[3] = &unk_24C77C7E8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "setInterruptionHandler:", v12);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __52__CPDashboardController__connectToListenerEndpoint___block_invoke_57;
  v10[3] = &unk_24C77C7E8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setInvalidationHandler:", v10);
  objc_msgSend(v5, "resume");
  -[CPDashboardController setConnection:](self, "setConnection:", v5);
  objc_msgSend(v5, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPDashboardController setDashboardProvider:](self, "setDashboardProvider:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __52__CPDashboardController__connectToListenerEndpoint___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  CarPlayFrameworkGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __52__CPDashboardController__connectToListenerEndpoint___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __52__CPDashboardController__connectToListenerEndpoint___block_invoke_57(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  CarPlayFrameworkGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __52__CPDashboardController__connectToListenerEndpoint___block_invoke_57_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

- (void)_invalidate
{
  void *v3;

  -[CPDashboardController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CPDashboardController setConnection:](self, "setConnection:", 0);
  -[CPDashboardController setDashboardProvider:](self, "setDashboardProvider:", 0);
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__CPDashboardController_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __58__CPDashboardController_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__8;
  v20 = __Block_byref_object_dispose__8;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "shortcutButtons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __58__CPDashboardController_handleActionForControlIdentifier___block_invoke_58;
  v13 = &unk_24C77DB08;
  v14 = *(id *)(a1 + 40);
  v15 = &v16;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v10);

  if (v17[5])
  {
    CarPlayFrameworkGeneralLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = v17[5];
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v23 = v5;
      v24 = 2112;
      v25 = v4;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    objc_msgSend((id)v17[5], "handlePrimaryAction", v10, v11, v12, v13);
  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_INFO, "%@: No button found for control identifier: %@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v16, 8);

}

void __58__CPDashboardController_handleActionForControlIdentifier___block_invoke_58(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (NSArray)shortcutButtons
{
  return self->_shortcutButtons;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (CPDashboardProviding)dashboardProvider
{
  return self->_dashboardProvider;
}

- (void)setDashboardProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashboardProvider, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_shortcutButtons, 0);
}

- (void)_sceneConnect:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, a1, a3, "Not attempting dashboard endpoint connection.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __52__CPDashboardController__connectToListenerEndpoint___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, a1, a3, "Dashboard connection interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __52__CPDashboardController__connectToListenerEndpoint___block_invoke_57_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, a1, a3, "Dashboard connection invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
