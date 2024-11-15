@implementation ACCFeatureAudioProduct

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ACCFeatureAudioProduct_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, block);
  return (id)sharedManager_sharedInstance;
}

void __39__ACCFeatureAudioProduct_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = v1;

}

- (id)_init
{
  ACCFeatureAudioProduct *v3;
  NSMutableSet *v4;
  NSMutableSet *endpoints;
  uint64_t v6;
  NSXPCConnection *xpcConnection;
  void *v8;
  objc_super v10;

  init_logging();
  v10.receiver = self;
  v10.super_class = (Class)ACCFeatureAudioProduct;
  v3 = -[ACCFeatureAudioProduct init](&v10, sel_init);
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    endpoints = v3->_endpoints;
    v3->_endpoints = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.coreaccessories.ACCFeatureAudioProductService"));
    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = (NSXPCConnection *)v6;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550ED950);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v3->_xpcConnection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](v3->_xpcConnection, "resume");
  }
  return v3;
}

- (void)_connectToACCFeatureAudioProduct
{
  OUTLINED_FUNCTION_3(&dword_21A66C000, a1, a3, "Already have connection to ACCFeatureAudioProduct!", a5, a6, a7, a8, 0);
}

- (void)_disconnectFromACCFeatureAudioProduct
{
  OUTLINED_FUNCTION_3(&dword_21A66C000, a1, a3, "No connection to ACCFeatureAudioProduct, skip!", a5, a6, a7, a8, 0);
}

- (void)accessoryAttached:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21A66C000, v10, OS_LOG_TYPE_INFO, "accessoryAttached: %@ connection: %@", (uint8_t *)&v11, 0x16u);
  }

  -[NSMutableSet addObject:](self->_endpoints, "addObject:", v6);
  if (-[NSMutableSet count](self->_endpoints, "count"))
    -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct](self, "_connectToACCFeatureAudioProduct");

}

- (void)accessoryDetached:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21A66C000, v10, OS_LOG_TYPE_INFO, "accessoryDetached: %@ connection: %@", (uint8_t *)&v11, 0x16u);
  }

  -[NSMutableSet removeObject:](self->_endpoints, "removeObject:", v6);
  if (!-[NSMutableSet count](self->_endpoints, "count"))
    -[ACCFeatureAudioProduct _disconnectFromACCFeatureAudioProduct](self, "_disconnectFromACCFeatureAudioProduct");

}

- (void)processAudioProductCerts:(id)a3 forModel:(id)a4 firstConnectionAfterPair:(BOOL)a5 connection:(id)a6 endpoint:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  NSXPCConnection *v19;
  NSObject *v20;
  id v21;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  NSXPCConnection *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v9 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (gLogObjects)
    v16 = gNumLogObjects < 1;
  else
    v16 = 1;
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  else
  {
    v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%lu certs"), objc_msgSend(v12, "count"));
    v19 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v28 = v19;
    v29 = 2112;
    v30 = v13;
    v31 = 2112;
    v32 = v14;
    v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_21A66C000, v18, OS_LOG_TYPE_DEFAULT, "processAudioProductCerts: %@ forModel: %@ connection: %@ endpoint: %@", buf, 0x2Au);

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct].cold.1();
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    xpcConnection = self->_xpcConnection;
    *(_DWORD *)buf = 138412290;
    v28 = xpcConnection;
    _os_log_impl(&dword_21A66C000, v20, OS_LOG_TYPE_INFO, "processAudioProductCerts:forModel:endpoint: _xpcConnection %@", buf, 0xCu);
  }

  v23 = self->_xpcConnection;
  if (v23)
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v23, "remoteObjectProxyWithErrorHandler:", &__block_literal_global);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __105__ACCFeatureAudioProduct_processAudioProductCerts_forModel_firstConnectionAfterPair_connection_endpoint___block_invoke_11;
    v25[3] = &unk_24DD03408;
    v26 = v15;
    objc_msgSend(v24, "processAudioProductCerts:forModel:firstConnectionAfterPair:connection:endpoint:completionHandler:", v12, v13, v9, v14, v26, v25);

  }
}

void __105__ACCFeatureAudioProduct_processAudioProductCerts_forModel_firstConnectionAfterPair_connection_endpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    __105__ACCFeatureAudioProduct_processAudioProductCerts_forModel_firstConnectionAfterPair_connection_endpoint___block_invoke_cold_1((uint64_t)v2, v5);

}

void __105__ACCFeatureAudioProduct_processAudioProductCerts_forModel_firstConnectionAfterPair_connection_endpoint___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeatureAudioProduct _connectToACCFeatureAudioProduct].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_21A66C000, v6, OS_LOG_TYPE_DEFAULT, "processAudioProductCerts: %@, error %@", (uint8_t *)&v8, 0x16u);
  }

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSMutableSet)endpoints
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __105__ACCFeatureAudioProduct_processAudioProductCerts_forModel_firstConnectionAfterPair_connection_endpoint___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_21A66C000, a2, OS_LOG_TYPE_FAULT, "can't invoke remote object %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
