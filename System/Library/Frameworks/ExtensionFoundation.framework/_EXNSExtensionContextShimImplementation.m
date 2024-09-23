@implementation _EXNSExtensionContextShimImplementation

+ (id)makeContextWithSceneSession:(id)a3
{
  id v3;
  _EXNSExtensionContextShimImplementation *v4;
  _EXDecoderHack *v5;
  _EXNSExtensionContextShimImplementation *v6;
  _EXDecoderHack *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _EXNSExtensionContextShimImplementation *v13;

  v3 = a3;
  v4 = -[_EXNSExtensionContextShimImplementation initWithSceneSession:]([_EXNSExtensionContextShimImplementation alloc], "initWithSceneSession:", v3);
  v5 = [_EXDecoderHack alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71___EXNSExtensionContextShimImplementation_makeContextWithSceneSession___block_invoke;
  v12[3] = &unk_1E2CFCE80;
  v13 = v4;
  v6 = v4;
  v7 = -[_EXDecoderHack initWithContextFactory:](v5, "initWithContextFactory:", v12);
  objc_msgSend(v3, "extension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "internalRep");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "extensionContextClass")), "initWithCoder:", v7);

  return v10;
}

- (_EXNSExtensionContextShimImplementation)initWithSceneSession:(id)a3
{
  id v4;
  _EXNSExtensionContextShimImplementation *v5;
  uint64_t v6;
  NSUUID *UUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXNSExtensionContextShimImplementation;
  v5 = -[_EXNSExtensionContextShimImplementation init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_storeWeak((id *)&v5->_sceneSession, v4);
  }

  return v5;
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[_EXNSExtensionContextShimImplementation sceneSession](self, "sceneSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeXPCConnectionWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)invalidate
{
  id v2;

  -[_EXNSExtensionContextShimImplementation sceneSession](self, "sceneSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (BOOL)shoudAcceptConnection:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL result;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;

  v3 = a3;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315650;
    v7 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXNSExtensionContextShimImplementation.m";
    v8 = 1024;
    v9 = 89;
    v10 = 2080;
    v11 = "-[_EXNSExtensionContextShimImplementation shoudAcceptConnection:]";
    _os_log_fault_impl(&dword_190C25000, v4, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported method: %s", (uint8_t *)&v6, 0x1Cu);
  }

  __break(1u);
  return result;
}

- (void)beginContextRequest:(id)a3 endpoint:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  _EXDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = 136315650;
    v12 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Int"
          "ernal/Shim/EXNSExtensionContextShimImplementation.m";
    v13 = 1024;
    v14 = 96;
    v15 = 2080;
    v16 = "-[_EXNSExtensionContextShimImplementation beginContextRequest:endpoint:reply:]";
    _os_log_fault_impl(&dword_190C25000, v10, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported method: %s", (uint8_t *)&v11, 0x1Cu);
  }

  __break(1u);
}

- (void)cancelRequestWithError:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;

  v3 = a3;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315650;
    v6 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXNSExtensionContextShimImplementation.m";
    v7 = 1024;
    v8 = 101;
    v9 = 2080;
    v10 = "-[_EXNSExtensionContextShimImplementation cancelRequestWithError:]";
    _os_log_fault_impl(&dword_190C25000, v4, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported method: %s", (uint8_t *)&v5, 0x1Cu);
  }

  __break(1u);
}

- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;

  v5 = a3;
  v6 = a4;
  _EXDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    v8 = 136315650;
    v9 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXNSExtensionContextShimImplementation.m";
    v10 = 1024;
    v11 = 105;
    v12 = 2080;
    v13 = "-[_EXNSExtensionContextShimImplementation completeRequestReturningItems:completionHandler:]";
    _os_log_fault_impl(&dword_190C25000, v7, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported method: %s", (uint8_t *)&v8, 0x1Cu);
  }

  __break(1u);
}

- (_EXNSExtensionContextShimImplementation)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5 extensionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _EXNSExtensionContextShimImplementation *result;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  _EXDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    v15 = 136315650;
    v16 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Int"
          "ernal/Shim/EXNSExtensionContextShimImplementation.m";
    v17 = 1024;
    v18 = 110;
    v19 = 2080;
    v20 = "-[_EXNSExtensionContextShimImplementation initWithInputItems:listenerEndpoint:contextUUID:extensionContext:]";
    _os_log_fault_impl(&dword_190C25000, v13, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported initializer: %s", (uint8_t *)&v15, 0x1Cu);
  }

  __break(1u);
  return result;
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (NSArray)inputItems
{
  NSObject *v2;
  NSArray *result;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;

  _EXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXNSExtensionContextShimImplementation.m";
    v6 = 1024;
    v7 = 120;
    v8 = 2080;
    v9 = "-[_EXNSExtensionContextShimImplementation inputItems]";
    _os_log_fault_impl(&dword_190C25000, v2, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported property access: %s", (uint8_t *)&v4, 0x1Cu);
  }

  __break(1u);
  return result;
}

- (id)_principalObject
{
  return self->__principalObject;
}

- (NSXPCConnection)_auxiliaryConnection
{
  NSObject *v2;
  NSXPCConnection *result;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;

  _EXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v4 = 136315650;
    v5 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXNSExtensionContextShimImplementation.m";
    v6 = 1024;
    v7 = 134;
    v8 = 2080;
    v9 = "-[_EXNSExtensionContextShimImplementation _auxiliaryConnection]";
    _os_log_fault_impl(&dword_190C25000, v2, OS_LOG_TYPE_FAULT, "%s - %d: Unsupported property access: %s", (uint8_t *)&v4, 0x1Cu);
  }

  __break(1u);
  return result;
}

- (NSUUID)_UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)_requestCleanUpBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)_setRequestCleanUpBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)__principalObject
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)set__principalObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_extensionHostAuditToken, 32, 1, 0);
  return result;
}

- (_EXNSExtensionShimExtension)extension
{
  return (_EXNSExtensionShimExtension *)objc_loadWeakRetained((id *)&self->_extension);
}

- (void)setExtension:(id)a3
{
  objc_storeWeak((id *)&self->_extension, a3);
}

- (_EXSceneSession)sceneSession
{
  return (_EXSceneSession *)objc_loadWeakRetained((id *)&self->_sceneSession);
}

- (void)setSceneSession:(id)a3
{
  objc_storeWeak((id *)&self->_sceneSession, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneSession);
  objc_destroyWeak((id *)&self->_extension);
  objc_storeStrong(&self->__principalObject, 0);
  objc_storeStrong(&self->_requestCleanUpBlock, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
