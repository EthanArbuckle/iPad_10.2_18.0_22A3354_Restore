@implementation _ANESandboxingHelper

+ (id)issueSandboxExtensionForModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "modelURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sandboxExtensionPathForModelURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)gLogger_0;
  if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_DEBUG))
  {
    v16 = v10;
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = v17;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl(&dword_1D3352000, v16, OS_LOG_TYPE_DEBUG, "%@: model=%@ modelPathStr=%@", (uint8_t *)&v20, 0x20u);

  }
  objc_msgSend((id)objc_opt_class(), "issueSandboxExtensionForPath:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANEStrings noSandboxExtension](_ANEStrings, "noSandboxExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    v14 = (void *)gLogger_0;
    if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_DEBUG))
    {
      v18 = v14;
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v19;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v11;
      _os_log_debug_impl(&dword_1D3352000, v18, OS_LOG_TYPE_DEBUG, "%@: model=%@ sandboxExtension=%@", (uint8_t *)&v20, 0x20u);

    }
  }

  return v11;
}

+ (id)sandboxExtensionPathForModelURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "hasDirectoryPath"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (BOOL)canAccessPathAt:(id)a3 methodName:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3620];
  v9 = a3;
  objc_msgSend(v8, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if (a5 && (v11 & 1) == 0)
  {
    +[_ANEErrors fileAccessErrorForMethod:](_ANEErrors, "fileAccessErrorForMethod:", v7);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (int64_t)consumeSandboxExtension:(id)a3 forModel:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  objc_msgSend(v7, "modelURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sandboxExtensionPathForModelURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend((id)objc_opt_class(), "consumeSandboxExtension:forPath:error:", v8, v11, a5);
  return v12;
}

+ (BOOL)releaseSandboxExtension:(id)a3 handle:(int64_t)a4
{
  return a4 < 0 || sandbox_extension_release() != -1;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  +[_ANELog common](_ANELog, "common");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)gLogger_0;
  gLogger_0 = v2;

}

+ (id)issueSandboxExtensionForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[_ANEStrings systemLibraryPath](_ANEStrings, "systemLibraryPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hasPrefix:", v7);

  if (+[_ANEDeviceInfo isInternalBuild](_ANEDeviceInfo, "isInternalBuild"))
  {
    +[_ANEStrings internalLibraryPath](_ANEStrings, "internalLibraryPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "hasPrefix:", v9);

  }
  else
  {
    v10 = 0;
  }
  +[_ANEStrings noSandboxExtension](_ANEStrings, "noSandboxExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v14 = objc_msgSend(v12, "canAccessPathAt:methodName:error:", v6, v13, &v27);
  v15 = v27;

  if (!v14)
  {
    v19 = (void *)gLogger_0;
    if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_ERROR))
    {
      v25 = v19;
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v26;
      v30 = 2112;
      v31 = v6;
      v32 = 2112;
      v33 = v15;
      _os_log_error_impl(&dword_1D3352000, v25, OS_LOG_TYPE_ERROR, "%@: Inaccessible file (%@) : error=%@", buf, 0x20u);

      if (!a4)
        goto LABEL_13;
    }
    else if (!a4)
    {
      goto LABEL_13;
    }
    *a4 = objc_retainAutorelease(v15);
    goto LABEL_13;
  }
  if (((v8 | v10) & 1) == 0)
  {
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v16 = sandbox_extension_issue_file();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
      v18 = objc_claimAutoreleasedReturnValue();

      free(v17);
      v11 = (void *)v18;
    }
    else
    {
      v20 = (void *)gLogger_0;
      if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_ERROR))
        +[_ANESandboxingHelper issueSandboxExtensionForPath:error:].cold.1(v20, a2);
    }
  }
LABEL_13:
  v21 = (void *)gLogger_0;
  if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_DEBUG))
  {
    v23 = v21;
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = v24;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v11;
    _os_log_debug_impl(&dword_1D3352000, v23, OS_LOG_TYPE_DEBUG, "%@: pathStr=%@ sandboxExtension=%@", buf, 0x20u);

  }
  return v11;
}

+ (int64_t)consumeSandboxExtension:(id)a3 forPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int *v16;
  char *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  NSObject *v24;
  void *v25;
  NSObject *log;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v10 = objc_retainAutorelease(v8);
    objc_msgSend(v10, "UTF8String");
    v11 = sandbox_extension_consume();
    v12 = (void *)gLogger_0;
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_DEBUG))
        +[_ANESandboxingHelper consumeSandboxExtension:forPath:error:].cold.2(v12, a2);
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_INFO))
    {
      log = v12;
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *__error();
      v16 = __error();
      v17 = strerror(*v16);
      *(_DWORD *)buf = 138413058;
      v29 = v14;
      v30 = 2112;
      v31 = v10;
      v32 = 1024;
      LODWORD(v33[0]) = v15;
      WORD2(v33[0]) = 2080;
      *(_QWORD *)((char *)v33 + 6) = v17;
      _os_log_impl(&dword_1D3352000, log, OS_LOG_TYPE_INFO, "%@: Sandbox extension(%@) consume failed (errno=%d) : %s", buf, 0x26u);

    }
    v18 = (void *)objc_opt_class();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v20 = objc_msgSend(v18, "canAccessPathAt:methodName:error:", v9, v19, &v27);
    v21 = v27;

    if ((v20 & 1) == 0 && (v22 = (void *)gLogger_0, os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_ERROR)))
    {
      v24 = v22;
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v25;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33[0] = v21;
      _os_log_error_impl(&dword_1D3352000, v24, OS_LOG_TYPE_ERROR, "%@: Inaccessible file (%@) : error=%@", buf, 0x20u);

      if (!a5)
        goto LABEL_14;
    }
    else if (!a5)
    {
LABEL_14:

      goto LABEL_15;
    }
    *a5 = objc_retainAutorelease(v21);
    goto LABEL_14;
  }
  v13 = (void *)gLogger_0;
  if (os_log_type_enabled((os_log_t)gLogger_0, OS_LOG_TYPE_DEBUG))
    +[_ANESandboxingHelper consumeSandboxExtension:forPath:error:].cold.1(v13, a2);
  v11 = -1;
LABEL_15:

  return v11;
}

+ (void)issueSandboxExtensionForPath:(void *)a1 error:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(&dword_1D3352000, v3, OS_LOG_TYPE_ERROR, "%@: sandbox_extension_issue_file() returned NULL. path=%@", v5, 0x16u);

  OUTLINED_FUNCTION_2();
}

+ (void)consumeSandboxExtension:(void *)a1 forPath:(const char *)a2 error:.cold.1(void *a1, const char *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1D3352000, v3, OS_LOG_TYPE_DEBUG, "%@: Sandbox extension is nil/not valid", (uint8_t *)&v5, 0xCu);

}

+ (void)consumeSandboxExtension:(void *)a1 forPath:(const char *)a2 error:.cold.2(void *a1, const char *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  _os_log_debug_impl(&dword_1D3352000, v3, OS_LOG_TYPE_DEBUG, "%@: Sandbox extension(%@) consumed", v5, 0x16u);

  OUTLINED_FUNCTION_2();
}

@end
