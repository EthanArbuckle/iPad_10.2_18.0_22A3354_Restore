@implementation _DASExtensionRemoteContext

- (_DASExtensionRemoteContext)init
{
  _DASExtensionRemoteContext *v2;
  os_log_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DASExtensionRemoteContext;
  v2 = -[_DASExtensionRemoteContext init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.duetactivityscheduler", "extensionContext");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

  }
  return v2;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_4);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_47);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

- (id)hostContextWithError:(id *)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  -[_DASExtensionRemoteContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___DASExtensionRemoteContext_hostContextWithError___block_invoke;
  v8[3] = &unk_1E624C078;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (_DASExtension)extension
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39___DASExtensionRemoteContext_extension__block_invoke;
  block[3] = &unk_1E624B598;
  block[4] = self;
  if (extension_onceToken != -1)
    dispatch_once(&extension_onceToken, block);
  return (_DASExtension *)(id)extension_extension;
}

- (id)createExtensionRunnerWithClassName:(id)a3
{
  NSString *v4;
  void *v5;
  char v6;
  Class v7;
  objc_class *v8;
  id v9;
  NSObject *v10;
  int v12;
  objc_class *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "extensionRunnerClassAllowList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if ((v6 & 1) != 0)
    {
      v7 = NSClassFromString(v4);
      if (v7)
      {
        v8 = v7;
        if ((-[objc_class conformsToProtocol:](v7, "conformsToProtocol:", &unk_1EEEDF5B0) & 1) != 0)
        {
          v9 = objc_alloc_init(v8);
          -[_DASExtensionRemoteContext log](self, "log");
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v12 = 138543362;
            v13 = v8;
            _os_log_impl(&dword_1B0DF4000, v10, OS_LOG_TYPE_INFO, "Created _DASExtensionRunner of class %{public}@", (uint8_t *)&v12, 0xCu);
          }
          goto LABEL_15;
        }
        -[_DASExtensionRemoteContext log](self, "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[_DASExtensionRemoteContext createExtensionRunnerWithClassName:].cold.2();
      }
      else
      {
        -[_DASExtensionRemoteContext log](self, "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[_DASExtensionRemoteContext createExtensionRunnerWithClassName:].cold.1();
      }
    }
    else
    {
      -[_DASExtensionRemoteContext log](self, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_DASExtensionRemoteContext createExtensionRunnerWithClassName:].cold.3();
    }
    v9 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

+ (id)extensionRunnerClassAllowList
{
  return &unk_1E6259598;
}

- (void)performActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ExtensionRunnerClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DASExtensionRemoteContext createExtensionRunnerWithClassName:](self, "createExtensionRunnerWithClassName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASExtensionRemoteContext log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1B0DF4000, v9, OS_LOG_TYPE_DEFAULT, "Remote extension performing activity %@ with runner %@.", buf, 0x16u);

  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("Extension Execution Queue", v11);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___DASExtensionRemoteContext_performActivity___block_invoke;
  block[3] = &unk_1E624BD68;
  block[4] = self;
  v16 = v8;
  v17 = v4;
  v13 = v4;
  v14 = v8;
  dispatch_async(v12, block);

}

- (void)suspend
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  -[_DASExtensionRemoteContext log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0DF4000, v3, OS_LOG_TYPE_DEFAULT, "Request for extension to stop activity", v5, 2u);
  }

  -[_DASExtensionRemoteContext extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)createExtensionRunnerWithClassName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B0DF4000, v0, v1, "Info.plist key %{public}@ has value \"%{public}@\", but no class with that name was found.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)createExtensionRunnerWithClassName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B0DF4000, v0, v1, "Info.plist key %{public}@ has value \"%{public}@\", but that class doesn't conform to the MLBackgroundDataSource protocol", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)createExtensionRunnerWithClassName:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B0DF4000, v0, v1, "Info.plist key %{public}@ has value \"%{public}@\", which is not an allowed extension runner class.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
