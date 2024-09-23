@implementation CPInstrumentClusterController

+ (id)_clusterProvidingInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7E48);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_hostSetAttributedInactiveVariants_, 0, 0);

  return v2;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPInstrumentClusterController;
  return -[CPInstrumentClusterController init](&v3, sel_init);
}

- (void)setInstrumentClusterWindow:(id)a3
{
  UIWindow *v5;
  UIWindow *instrumentClusterWindow;
  void *v7;
  void *v8;
  UIWindow *v9;

  v5 = (UIWindow *)a3;
  if (self->_instrumentClusterWindow != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_instrumentClusterWindow, a3);
    instrumentClusterWindow = self->_instrumentClusterWindow;
    -[CPInstrumentClusterController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (instrumentClusterWindow)
      objc_msgSend(v7, "instrumentClusterControllerDidConnectWindow:", v9);
    else
      objc_msgSend(v7, "instrumentClusterControllerDidDisconnectWindow:", v9);

    v5 = v9;
  }

}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (self->_instrumentClusterWindow)
      objc_msgSend(obj, "instrumentClusterControllerDidConnectWindow:");
  }

}

- (void)setSpeedLimitSetting:(unint64_t)a3
{
  id v5;

  if (self->_speedLimitSetting != a3)
  {
    self->_speedLimitSetting = a3;
    -[CPInstrumentClusterController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instrumentClusterController:didChangeSpeedLimitSetting:", self, a3);

  }
}

- (void)setCompassSetting:(unint64_t)a3
{
  id v5;

  if (self->_compassSetting != a3)
  {
    self->_compassSetting = a3;
    -[CPInstrumentClusterController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instrumentClusterController:didChangeCompassSetting:", self, a3);

  }
}

- (void)setInactiveDescriptionVariants:(NSArray *)inactiveDescriptionVariants
{
  NSArray *v4;
  NSArray *v5;
  id v6;

  v4 = (NSArray *)-[NSArray copy](inactiveDescriptionVariants, "copy");
  v5 = self->_inactiveDescriptionVariants;
  self->_inactiveDescriptionVariants = v4;

  -[CPInstrumentClusterController instrumentClusterProvider](self, "instrumentClusterProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hostSetInactiveVariants:", self->_inactiveDescriptionVariants);

}

- (void)setAttributedInactiveDescriptionVariants:(NSArray *)attributedInactiveDescriptionVariants
{
  NSArray *v4;
  NSArray *v5;
  id v6;

  v4 = (NSArray *)-[NSArray copy](attributedInactiveDescriptionVariants, "copy");
  v5 = self->_attributedInactiveDescriptionVariants;
  self->_attributedInactiveDescriptionVariants = v4;

  -[CPInstrumentClusterController instrumentClusterProvider](self, "instrumentClusterProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hostSetAttributedInactiveVariants:", self->_attributedInactiveDescriptionVariants);

}

- (void)_invalidate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CPInstrumentClusterController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CPInstrumentClusterController setConnection:](self, "setConnection:", 0);
  -[CPInstrumentClusterController setInstrumentClusterProvider:](self, "setInstrumentClusterProvider:", 0);
  -[CPInstrumentClusterController instrumentClusterWindow](self, "instrumentClusterWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CPInstrumentClusterController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CPInstrumentClusterController instrumentClusterWindow](self, "instrumentClusterWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "instrumentClusterControllerDidDisconnectWindow:", v5);

  }
}

- (void)_sceneConnect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (CPCurrentProcessHasTemplateEntitlement()
    && (objc_msgSend(v5, "settings"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    CarPlayFrameworkGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "_sceneIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v9;
      _os_log_impl(&dword_20D6F4000, v8, OS_LOG_TYPE_DEFAULT, "Connecting to listener endpoint for scene identifier: %{public}@", (uint8_t *)&v20, 0xCu);

    }
    v10 = objc_alloc_init(MEMORY[0x24BDD19A0]);
    objc_msgSend(v5, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "templateEndpoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject _setEndpoint:](v10, "_setEndpoint:", v12);

    -[CPInstrumentClusterController _connectToListenerEndpoint:](self, "_connectToListenerEndpoint:", v10);
  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CPInstrumentClusterController _sceneConnect:].cold.1(v10, v13, v14, v15, v16, v17, v18, v19);
  }

}

- (void)_connectToListenerEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v4);
  objc_msgSend((id)objc_opt_class(), "_clusterProvidingInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke;
  v12[3] = &unk_24C77C7E8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "setInterruptionHandler:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_56;
  v10[3] = &unk_24C77C7E8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setInvalidationHandler:", v10);
  objc_msgSend(v5, "resume");
  -[CPInstrumentClusterController setConnection:](self, "setConnection:", v5);
  objc_msgSend(v5, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPInstrumentClusterController setInstrumentClusterProvider:](self, "setInstrumentClusterProvider:", v8);

  -[CPInstrumentClusterController instrumentClusterProvider](self, "instrumentClusterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hostConnectToClient");

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke(uint64_t a1)
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
    __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_56(uint64_t a1)
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
    __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_56_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIWindow)instrumentClusterWindow
{
  return self->_instrumentClusterWindow;
}

- (CPInstrumentClusterSetting)speedLimitSetting
{
  return self->_speedLimitSetting;
}

- (CPInstrumentClusterSetting)compassSetting
{
  return self->_compassSetting;
}

- (NSArray)inactiveDescriptionVariants
{
  return self->_inactiveDescriptionVariants;
}

- (NSArray)attributedInactiveDescriptionVariants
{
  return self->_attributedInactiveDescriptionVariants;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (CPInstrumentClusterProviding)instrumentClusterProvider
{
  return self->_instrumentClusterProvider;
}

- (void)setInstrumentClusterProvider:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentClusterProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentClusterProvider, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_attributedInactiveDescriptionVariants, 0);
  objc_storeStrong((id *)&self->_inactiveDescriptionVariants, 0);
  objc_storeStrong((id *)&self->_instrumentClusterWindow, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_sceneConnect:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, a1, a3, "Not attempting endpoint connection.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, a1, a3, "Cluster connection interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_56_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, a1, a3, "Cluster connection invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
