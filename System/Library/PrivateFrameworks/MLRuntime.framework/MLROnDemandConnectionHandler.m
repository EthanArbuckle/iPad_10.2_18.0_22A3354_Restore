@implementation MLROnDemandConnectionHandler

- (MLROnDemandConnectionHandler)initWithPrincipalObject:(id)a3
{
  id v5;
  MLROnDemandConnectionHandler *v6;
  MLROnDemandConnectionHandler *v7;
  MLROnDemandConnectionHandler *v8;
  NSObject *v9;
  objc_super v11;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_254AAF780) & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)MLROnDemandConnectionHandler;
    v6 = -[MLROnDemandConnectionHandler init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_pluginPrincipal, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[MLROnDemandConnectionHandler initWithPrincipalObject:].cold.1((uint64_t)v5, v9);

    v8 = 0;
  }

  return v8;
}

- (id)principalObject
{
  return self->_pluginPrincipal;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  objc_msgSend(v4, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AABA58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v5);

  -[MLROnDemandConnectionHandler setXpcConnection:](self, "setXpcConnection:", v4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__MLROnDemandConnectionHandler_shouldAcceptXPCConnection___block_invoke;
  v8[3] = &unk_24CB92578;
  v8[4] = self;
  v6 = (void *)MEMORY[0x212BD8258](v8);
  objc_msgSend(v4, "setInterruptionHandler:", v6);
  objc_msgSend(v4, "setInvalidationHandler:", v6);
  objc_msgSend(v4, "resume");

  return 1;
}

void __58__MLROnDemandConnectionHandler_shouldAcceptXPCConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2112F5000, v2, OS_LOG_TYPE_INFO, "%@ cancelling", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLROnDemandConnectionHandler pluginPrincipal](self, "pluginPrincipal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n{\nprincipal class: %@\n}"), v5, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)performTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)MEMORY[0x24BE2D178];
  -[MLROnDemandConnectionHandler xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v8, "hasOnDemandLaunchEntitlement:", v9);

  if ((v8 & 1) != 0)
  {
    -[MLROnDemandConnectionHandler performTaskInternal:completionHandler:](self, "performTaskInternal:completionHandler:", v6, v7);
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Missing launch entitlement with expected plugID=%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BE2D188];
    v19 = *MEMORY[0x24BDD0FC8];
    v20[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 8014, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLROnDemandConnectionHandler performTask:completionHandler:].cold.1();

    v7[2](v7, 0, v17);
  }

}

- (void)performTaskInternal:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, NSObject *);
  void *v8;
  MLROnDemandTaskPerforming *pluginPrincipal;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, NSObject *))a4;
  if (v7)
  {
    -[MLROnDemandConnectionHandler principalObject](self, "principalObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      pluginPrincipal = self->_pluginPrincipal;
      v17 = 0;
      -[MLROnDemandTaskPerforming performTask:error:](pluginPrincipal, "performTask:error:", v6, &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BE2D188];
      v18 = *MEMORY[0x24BDD0FC8];
      v19[0] = CFSTR("Invalid principal class.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1, v14);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = 0;
    }
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v11)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MLROnDemandConnectionHandler performTaskInternal:completionHandler:].cold.3();

      v7[2](v7, 0, v11);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[MLROnDemandConnectionHandler performTaskInternal:completionHandler:].cold.2();

      ((void (**)(id, void *, NSObject *))v7)[2](v7, v10, 0);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MLROnDemandConnectionHandler performTaskInternal:completionHandler:].cold.1(v11);
  }

}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnection, a3);
}

- (MLROnDemandTaskPerforming)pluginPrincipal
{
  return self->_pluginPrincipal;
}

- (void)setPluginPrincipal:(id)a3
{
  objc_storeStrong((id *)&self->_pluginPrincipal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginPrincipal, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithPrincipalObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_6();
  v4 = v3;
  _os_log_fault_impl(&dword_2112F5000, a2, OS_LOG_TYPE_FAULT, "Unsupported principal object type = %@.", v5, 0xCu);

}

- (void)performTask:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Fail to performTask: error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performTaskInternal:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2112F5000, log, OS_LOG_TYPE_ERROR, "Fail to performTask: nil handler", v1, 2u);
}

- (void)performTaskInternal:completionHandler:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_2112F5000, v0, OS_LOG_TYPE_DEBUG, "Return result=%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)performTaskInternal:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Fail to execute task with error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
