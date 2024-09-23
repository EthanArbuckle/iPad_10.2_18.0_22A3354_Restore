@implementation MAAutoAssetAuthorizationPolicy

+ (id)_existingSandboxExtensions
{
  if (_existingSandboxExtensions_existingSandboxExtensionsOnceToken != -1)
    dispatch_once(&_existingSandboxExtensions_existingSandboxExtensionsOnceToken, &__block_literal_global_8);
  return (id)_existingSandboxExtensions_activeExtensions;
}

void __60__MAAutoAssetAuthorizationPolicy__existingSandboxExtensions__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)_existingSandboxExtensions_activeExtensions;
  _existingSandboxExtensions_activeExtensions = (uint64_t)v0;

}

+ (BOOL)consumeSandboxExtension:(id)a3 forPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  +[MAAutoAssetAuthorizationPolicy _existingSandboxExtensions](MAAutoAssetAuthorizationPolicy, "_existingSandboxExtensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 && objc_msgSend(v7, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v5;
      _os_log_impl(&dword_1AE33B000, v10, OS_LOG_TYPE_DEFAULT, "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) found existing consumed sandbox extension for path %{public}@", (uint8_t *)&v15, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MAAutoAssetAuthorizationPolicy consumeSandboxExtension:forPath:].cold.1((uint64_t)v5, v10);
    goto LABEL_15;
  }
  v11 = sandbox_extension_consume();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (v11 == -1)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MAAutoAssetAuthorizationPolicy consumeSandboxExtension:forPath:].cold.2((uint64_t)v5, v10);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1AE33B000, v10, OS_LOG_TYPE_DEFAULT, "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) consumed sandbox extension for path %{public}@", (uint8_t *)&v15, 0xCu);
  }

  if (v5)
    objc_msgSend(v8, "addObject:", v5);
LABEL_16:

  return 1;
}

+ (void)consumeSandboxExtension:(uint64_t)a1 forPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1AE33B000, a2, OS_LOG_TYPE_ERROR, "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) unable to consume sandbox extension as there is no extension available for path %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)consumeSandboxExtension:(uint64_t)a1 forPath:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int *v4;
  char *v5;
  int v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = __error();
  v5 = strerror(*v4);
  v6 = *__error();
  v7 = 136315650;
  v8 = v5;
  v9 = 1024;
  v10 = v6;
  v11 = 2114;
  v12 = a1;
  _os_log_error_impl(&dword_1AE33B000, a2, OS_LOG_TYPE_ERROR, "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) unable to consume sandbox extension with errno %s (%d) for path %{public}@", (uint8_t *)&v7, 0x1Cu);
}

@end
