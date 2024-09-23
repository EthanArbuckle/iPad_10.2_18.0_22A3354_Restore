@implementation DKSandboxExtension

+ (id)issueSandboxExtensionForFile:(id)a3 toAuditToken:(id *)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  $115C4C562B26FF47E01F9F4EA65B5887 v10;

  objc_msgSend(a3, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  v10 = *a4;
  v8 = sandbox_extension_issue_file_to_process();

  if (v8)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v8, *(_OWORD *)v10.var0, *(_OWORD *)&v10.var0[4]);
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsKit.SandboxExtensionError"), *__error(), 0, *(_OWORD *)v10.var0, *(_OWORD *)&v10.var0[4]);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)issueSandboxExtensionsForFiles:(id)a3 toAuditToken:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE buf[32];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v25;
    *(_QWORD *)&v9 = 138412546;
    v22 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        v23 = 0;
        v14 = *(_OWORD *)&a4->var0[4];
        *(_OWORD *)buf = *(_OWORD *)a4->var0;
        *(_OWORD *)&buf[16] = v14;
        +[DKSandboxExtension issueSandboxExtensionForFile:toAuditToken:error:](DKSandboxExtension, "issueSandboxExtensionForFile:toAuditToken:error:", v13, buf, &v23, v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v23;
        DiagnosticsKitLogHandleForCategory(2);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v15)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "path");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v19;
            _os_log_impl(&dword_22DE4C000, v18, OS_LOG_TYPE_DEFAULT, "[Sandbox] Issued sandbox extension for file: %@", buf, 0xCu);

          }
          objc_msgSend(v6, "addObject:", v15);
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "path");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            *(_QWORD *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v16;
            _os_log_error_impl(&dword_22DE4C000, v18, OS_LOG_TYPE_ERROR, "[Sandbox] Error issuing sandbox extension for file: %@ \n%@", buf, 0x16u);

          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  return v6;
}

+ (id)consumeSandboxExtensionWithToken:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v5 = sandbox_extension_consume();
  if (v5 == -1)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsKit.SandboxExtensionError"), *__error(), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      *a4 = v7;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", v5);
  }
  return v6;
}

+ (id)consumeSandboxExtensionsWithTokens:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    *(_QWORD *)&v7 = 138412546;
    v17 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v18 = 0;
        +[DKSandboxExtension consumeSandboxExtensionWithToken:error:](DKSandboxExtension, "consumeSandboxExtensionWithToken:error:", v11, &v18, v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;
        DiagnosticsKitLogHandleForCategory(1);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v12;
            _os_log_impl(&dword_22DE4C000, v15, OS_LOG_TYPE_DEFAULT, "[Sandbox] Consumed sandbox extension, handle: %@", buf, 0xCu);
          }

          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v24 = 0;
            v25 = 2112;
            v26 = v13;
            _os_log_error_impl(&dword_22DE4C000, v15, OS_LOG_TYPE_ERROR, "[Sandbox] Failed to consume sandbox extension with handle: %@ \n%@", buf, 0x16u);
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

  return v4;
}

+ (BOOL)releaseSandboxExtensionWithHandle:(id)a3 error:(id *)a4
{
  int v5;
  int v6;

  objc_msgSend(a3, "longLongValue");
  v5 = sandbox_extension_release();
  v6 = v5;
  if (a4 && v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsKit.SandboxExtensionError"), *__error(), 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

+ (void)releaseSandboxExtensionsWithHandles:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138412546;
    v14 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v15 = 0;
        v10 = +[DKSandboxExtension releaseSandboxExtensionWithHandle:error:](DKSandboxExtension, "releaseSandboxExtensionWithHandle:error:", v9, &v15, v14);
        v11 = v15;
        DiagnosticsKitLogHandleForCategory(1);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v10)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v9;
            _os_log_impl(&dword_22DE4C000, v13, OS_LOG_TYPE_DEFAULT, "[Sandbox] Released sandbox extension with handle: %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v14;
          v21 = v9;
          v22 = 2112;
          v23 = v11;
          _os_log_error_impl(&dword_22DE4C000, v13, OS_LOG_TYPE_ERROR, "[Sandbox] Failed to release sandbox extension with handle: %@ \n%@", buf, 0x16u);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }

}

@end
