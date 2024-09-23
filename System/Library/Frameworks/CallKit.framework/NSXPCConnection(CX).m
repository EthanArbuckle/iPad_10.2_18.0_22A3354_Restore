@implementation NSXPCConnection(CX)

- (id)cx_applicationIdentifier
{
  void *v1;
  id v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("application-identifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (__CFString)cx_bundleIdentifier
{
  __SecTask *v1;
  __SecTask *v2;
  __CFString *v3;
  audit_token_t v5[2];

  memset(&v5[1], 0, sizeof(audit_token_t));
  objc_msgSend(a1, "auditToken");
  v5[0] = v5[1];
  v1 = SecTaskCreateWithAuditToken(0, v5);
  if (!v1)
    return (__CFString *)0;
  v2 = v1;
  v3 = (__CFString *)SecTaskCopySigningIdentifier(v1, 0);
  CFRelease(v2);
  return v3;
}

- (id)cx_developerTeamIdentifier
{
  void *v1;
  id v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.developer.team-identifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)cx_processName
{
  void *v1;
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (proc_name(objc_msgSend(a1, "processIdentifier", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0),
         &v3,
         0x100u) < 1)
  {
    v1 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (uint64_t)cx_isProcessOnDemandInstallCapable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.developer.on-demand-install-capable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (id)cx_capabilities
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.callkit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }

  return v2;
}

- (uint64_t)cx_clientSandboxCanAccessFileURL:()CX
{
  id v4;
  char v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  int v9;
  int *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  __int128 v33;
  __int128 v34;
  _BYTE buf[32];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(a1, "auditToken");
  if ((objc_msgSend(v4, "isFileURL") & 1) != 0)
  {
    v32 = 0;
    v5 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", &v32);
    v6 = v32;
    if ((v5 & 1) != 0)
    {
      v7 = objc_retainAutorelease(v4);
      if (objc_msgSend(v7, "fileSystemRepresentation"))
      {
        *(_OWORD *)buf = v33;
        *(_OWORD *)&buf[16] = v34;
        if (!sandbox_check_by_audit_token())
        {
          v30 = 1;
          goto LABEL_15;
        }
        CXDefaultLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *__error();
          v10 = __error();
          v11 = strerror(*v10);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v9;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = v11;
          _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Client sandbox does not have access to the given file! (Error %i: %s)", buf, 0x12u);
        }
      }
      else
      {
        CXDefaultLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[NSXPCConnection(CX) cx_clientSandboxCanAccessFileURL:].cold.1((uint64_t)v7, v8, v24, v25, v26, v27, v28, v29);
      }
    }
    else
    {
      CXDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[NSXPCConnection(CX) cx_clientSandboxCanAccessFileURL:].cold.2((uint64_t)v6, v8, v18, v19, v20, v21, v22, v23);
    }

  }
  else
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSXPCConnection(CX) cx_clientSandboxCanAccessFileURL:].cold.3((uint64_t)v4, v6, v12, v13, v14, v15, v16, v17);
  }
  v30 = 0;
LABEL_15:

  return v30;
}

- (void)cx_clientSandboxCanAccessFileURL:()CX .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Could not get file system representation for URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cx_clientSandboxCanAccessFileURL:()CX .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "URL resource is not reachable: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cx_clientSandboxCanAccessFileURL:()CX .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "URL is not a file system URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
