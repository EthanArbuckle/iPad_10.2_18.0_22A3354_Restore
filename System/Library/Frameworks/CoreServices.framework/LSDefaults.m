@implementation LSDefaults

void __48___LSDefaults_markLocalizationsStoredInDatabase__block_invoke(uint64_t a1)
{
  id v1;

  if (objc_msgSend(*(id *)(a1 + 32), "isAppleInternal"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    markLocalizationsStoredInDatabase_result = objc_msgSend(v1, "BOOLForKey:", CFSTR("LSMarkLocalizationsStoredInDatabase"));

  }
}

void __37___LSDefaults_preferredLocalizations__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)preferredLocalizations_bundleLocalizations;
  preferredLocalizations_bundleLocalizations = v0;

}

void __37___LSDefaults_preferredLocalizations__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForInfoDictionaryKey:", CFSTR("CFBundleAllowMixedLocalizations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v4;
  if (v4)
  {
    v2 = objc_opt_respondsToSelector();
    v1 = v4;
    if ((v2 & 1) != 0)
    {
      v3 = objc_msgSend(v4, "BOOLValue");
      v1 = v4;
      preferredLocalizations_useUserLangList = v3;
    }
  }

}

uint64_t __45___LSDefaults_proxyUIDForCurrentEffectiveUID__block_invoke(uint64_t a1)
{
  uint64_t result;

  if (getuid() || (result = objc_msgSend(*(id *)(a1 + 32), "isInXCTestRigInsecure"), (_DWORD)result))
  {
    result = _CFGetEUID();
    proxyUIDForCurrentEffectiveUID_euid = result;
    proxyUIDForCurrentEffectiveUID_hasEUID = 1;
  }
  return result;
}

id __33___LSDefaults_systemContainerURL__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 75))
  {
    _LSDefaultsBaseSystemContainerURL();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches"), 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);

    }
  }
  else
  {
    emitSandboxExceptionAndMaybeAbortForSneakyURLUsage();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id __31___LSDefaults_userContainerURL__block_invoke(uint64_t a1)
{
  uint64_t path;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  char v34;
  id v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 75))
  {
    emitSandboxExceptionAndMaybeAbortForSneakyURLUsage();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (!container_query_create())
    goto LABEL_30;
  container_query_set_class();
  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  if (!container_query_get_single_result())
  {
    container_query_get_last_error();
    v37 = (void *)container_error_copy_unlocalized_description();
    _LSDefaultLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      __31___LSDefaults_userContainerURL__block_invoke_cold_2((uint64_t)v37, v38, v39, v40, v41, v42, v43, v44);

    free(v37);
    goto LABEL_30;
  }
  path = container_get_path();
  _LSDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!path)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __31___LSDefaults_userContainerURL__block_invoke_cold_3(v3, v45, v46, v47, v48, v49, v50, v51);

LABEL_30:
    container_query_free();
    goto LABEL_31;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __31___LSDefaults_userContainerURL__block_invoke_cold_8(path, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", path, 1, 0);
  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = container_copy_sandbox_token();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = sandbox_extension_consume();
    if (v14 < 0)
    {
      v32 = *__error();
      _LSDefaultLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __31___LSDefaults_userContainerURL__block_invoke_cold_7(v32, v16);
    }
    else
    {
      v15 = v14;
      _LSDefaultLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __31___LSDefaults_userContainerURL__block_invoke_cold_6(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    free(v13);
  }
  else
  {
    _LSDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __31___LSDefaults_userContainerURL__block_invoke_cold_5(v24, v25, v26, v27, v28, v29, v30, v31);

  }
  container_query_free();
  if (!v11)
  {
LABEL_31:
    _LSDefaultLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      __31___LSDefaults_userContainerURL__block_invoke_cold_1(v52, v53, v54, v55, v56, v57, v58, v59);

    abort();
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  v34 = objc_msgSend(v33, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v60);
  v35 = v60;

  if ((v34 & 1) == 0)
  {
    _LSDefaultLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      __31___LSDefaults_userContainerURL__block_invoke_cold_4((uint64_t)v35, v36);

  }
  return v11;
}

id __38___LSDefaults_systemGroupContainerURL__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v6;
  uint64_t v7;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 75))
  {
    v7 = 1;
    v1 = container_system_group_path_for_identifier();
    if (v1)
    {
      v2 = (void *)v1;
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v1, 1, 0);
      objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches"), 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      free(v2);
      return v4;
    }
    else
    {
      _LSDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __38___LSDefaults_systemGroupContainerURL__block_invoke_cold_1(&v7, v6);

      return 0;
    }
  }
  else
  {
    emitSandboxExceptionAndMaybeAbortForSneakyURLUsage();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __31___LSDefaults_simulatorRootURL__block_invoke()
{
  char *v0;
  uint64_t v1;
  void *v2;

  v0 = getenv("SIMULATOR_ROOT");
  if (v0)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v0, 1, 0);
    v2 = (void *)simulatorRootURL_result;
    simulatorRootURL_result = v1;

  }
}

void __38___LSDefaults_simulatorRuntimeVersion__block_invoke()
{
  char *v0;
  uint64_t v1;
  void *v2;

  v0 = getenv("SIMULATOR_RUNTIME_VERSION");
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)simulatorRuntimeVersion_result;
    simulatorRuntimeVersion_result = v1;

  }
}

void __43___LSDefaults_simulatorRuntimeBuildVersion__block_invoke()
{
  char *v0;
  uint64_t v1;
  void *v2;

  v0 = getenv("SIMULATOR_RUNTIME_BUILD_VERSION");
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)simulatorRuntimeBuildVersion_result;
    simulatorRuntimeBuildVersion_result = v1;

  }
}

const char *__41___LSDefaults_classesWithNameForXCTests___block_invoke(uint64_t a1, Class cls)
{
  const char *result;
  const char *Name;

  result = class_getName(cls);
  if (result)
  {
    Name = class_getName(cls);
    result = (const char *)strcmp(Name, *(const char **)(a1 + 40));
    if (!(_DWORD)result)
      return (const char *)(id)objc_msgSend(*(id *)(a1 + 32), "setByAddingObject:", cls);
  }
  return result;
}

void __42___LSDefaults_alwaysUseDebugOpenWithMenus__block_invoke(uint64_t a1)
{
  id v1;

  if (objc_msgSend(*(id *)(a1 + 32), "isAppleInternal"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    alwaysUseDebugOpenWithMenus_result = objc_msgSend(v1, "BOOLForKey:", CFSTR("LSAlwaysUseDebugOpenWithMenus"));

  }
}

void __28___LSDefaults_isRegionChina__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  _BOOL4 v3;
  void *v4;

  v0 = (void *)MEMORY[0x186DAE7A0]();
  v1 = (void *)MGCopyAnswer();
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("CH")) == 0;
    isRegionChina_result = v3;
    if (v3)
      goto LABEL_9;
  }
  else if (isRegionChina_result)
  {
    goto LABEL_9;
  }
  if (__LSDefaultsGetSharedInstance_onceToken != -1)
    dispatch_once(&__LSDefaultsGetSharedInstance_onceToken, &__block_literal_global_26);
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance_sharedInstance, "isAppleInternal"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    isRegionChina_result = objc_msgSend(v4, "BOOLForKey:", CFSTR("LSLocalizeLikeChina"));

  }
LABEL_9:

  objc_autoreleasePoolPop(v0);
}

id __25___LSDefaults_HMACSecret__block_invoke()
{
  _BYTE bytes[32];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, bytes);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", bytes, 32);
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_20(&dword_182882000, a1, a3, "Could not get user container URL! Must abort.", a5, a6, a7, a8, 0);
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "Error executing executing container lookup query: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "%{public}s: NULL getting container path", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "NSURL *_LSDefaultsUserContainerURL(void)";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "%{public}s: NSFileManager failed to create user container URL directory: %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "%{public}s: NULL getting container sandbox token", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_4(&dword_182882000, a2, a3, "%{public}s: consumed sandbox token for container, handle = %llu", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_7(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "NSURL *_LSDefaultsUserContainerURL(void)";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to consume container sandbox token, errno = %{darwin.errno}d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_4(&dword_182882000, a2, a3, "%{public}s: got user container URL %{private}s from containermanagerd", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1();
}

void __38___LSDefaults_systemGroupContainerURL__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t error_description;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v5 = 136446722;
  v6 = "NSURL *_LSDefaultsSystemGroupContainerURL(void)";
  v7 = 2048;
  v8 = v3;
  v9 = 2082;
  error_description = container_get_error_description();
  OUTLINED_FUNCTION_4_5(&dword_182882000, a2, v4, "%{public}s: error %llu getting container path: %{public}s", (uint8_t *)&v5);
}

@end
