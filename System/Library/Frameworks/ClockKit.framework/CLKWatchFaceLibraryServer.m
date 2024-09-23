@implementation CLKWatchFaceLibraryServer

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__CLKWatchFaceLibraryServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___sharedServer;
}

void __43__CLKWatchFaceLibraryServer_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedServer;
  sharedInstance___sharedServer = (uint64_t)v1;

}

- (void)dealloc
{
  objc_super v3;

  -[CLKWatchFaceLibraryServer _clearConnection](self, "_clearConnection");
  v3.receiver = self;
  v3.super_class = (Class)CLKWatchFaceLibraryServer;
  -[CLKWatchFaceLibraryServer dealloc](&v3, sel_dealloc);
}

- (void)_queue_setupConnectionIfNeeded
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (!self->_connection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.ClockKit.CLKWatchFaceLibrary"));
    connection = self->_connection;
    self->_connection = v3;

    v5 = self->_connection;
    CLKWatchFaceLibraryServerInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = self->_connection;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __59__CLKWatchFaceLibraryServer__queue_setupConnectionIfNeeded__block_invoke;
    v11 = &unk_24CBF9088;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", &v8);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &__block_literal_global_0, v8, v9, v10, v11);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __59__CLKWatchFaceLibraryServer__queue_setupConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearConnection");

}

- (void)_clearConnection
{
  NSXPCConnection *connection;

  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
  connection = self->_connection;
  self->_connection = 0;

}

- (void)openWatchFaceURLWithBookmarkData:(id)a3 sourceApplicationBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSXPCConnection *connection;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CLKWatchFaceLibraryServer _queue_setupConnectionIfNeeded](self, "_queue_setupConnectionIfNeeded");
  connection = self->_connection;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __114__CLKWatchFaceLibraryServer_openWatchFaceURLWithBookmarkData_sourceApplicationBundleIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_24CBF90D0;
  v15 = v8;
  v12 = v8;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "openWatchFaceURLWithBookmarkData:sourceApplicationBundleIdentifier:completionHandler:", v10, v9, v12);

}

void __114__CLKWatchFaceLibraryServer_openWatchFaceURLWithBookmarkData_sourceApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  CLKLoggingObjectForDomain(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __114__CLKWatchFaceLibraryServer_openWatchFaceURLWithBookmarkData_sourceApplicationBundleIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)validateFaceType:(id)a3 faceBundleId:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSXPCConnection *connection;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CLKWatchFaceLibraryServer _queue_setupConnectionIfNeeded](self, "_queue_setupConnectionIfNeeded");
  connection = self->_connection;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__CLKWatchFaceLibraryServer_validateFaceType_faceBundleId_completionHandler___block_invoke;
  v14[3] = &unk_24CBF90D0;
  v15 = v8;
  v12 = v8;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "validateFaceType:faceBundleId:completionHandler:", v10, v9, v12);

}

void __77__CLKWatchFaceLibraryServer_validateFaceType_faceBundleId_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  CLKLoggingObjectForDomain(9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__CLKWatchFaceLibraryServer_validateFaceType_faceBundleId_completionHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __114__CLKWatchFaceLibraryServer_openWatchFaceURLWithBookmarkData_sourceApplicationBundleIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a2, a3, "openWatchFaceURLWithBookmarkData: Error: %@", a5, a6, a7, a8, 2u);
}

void __77__CLKWatchFaceLibraryServer_validateFaceType_faceBundleId_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a2, a3, "validateFaceType: faceBundleId: Error: %@", a5, a6, a7, a8, 2u);
}

@end
