@implementation NSXPCConnection(CPAdditions)

- (id)cp_clientProcessName
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

- (__CFString)cp_clientProcessBundleIdentifier
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

- (uint64_t)cp_clientSandboxCanAccessFileURL:()CPAdditions
{
  id v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v10;
  __int128 v11;
  __int128 v12;

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "auditToken");
  if ((objc_msgSend(v4, "isFileURL") & 1) != 0)
  {
    v10 = 0;
    v5 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", &v10);
    v6 = v10;
    if ((v5 & 1) != 0)
    {
      if (objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"))
      {
        if (!sandbox_check_by_audit_token())
        {
          v8 = 1;
          goto LABEL_15;
        }
        CPDefaultLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[NSXPCConnection(CPAdditions) cp_clientSandboxCanAccessFileURL:].cold.2(v7);
      }
      else
      {
        CPDefaultLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[NSXPCConnection(CPAdditions) cp_clientSandboxCanAccessFileURL:].cold.1();
      }
    }
    else
    {
      CPDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[NSXPCConnection(CPAdditions) cp_clientSandboxCanAccessFileURL:].cold.3();
    }

  }
  else
  {
    CPDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSXPCConnection(CPAdditions) cp_clientSandboxCanAccessFileURL:].cold.4();
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (void)cp_clientSandboxCanAccessFileURL:()CPAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ACCCC000, v0, v1, "%s Could not get file system representation for URL: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)cp_clientSandboxCanAccessFileURL:()CPAdditions .cold.2(NSObject *a1)
{
  int v2;
  int *v3;
  char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3 = __error();
  v4 = strerror(*v3);
  v5 = 136315650;
  v6 = "-[NSXPCConnection(CPAdditions) cp_clientSandboxCanAccessFileURL:]";
  v7 = 1024;
  v8 = v2;
  v9 = 2080;
  v10 = v4;
  _os_log_error_impl(&dword_1ACCCC000, a1, OS_LOG_TYPE_ERROR, "%s Client sandbox does not have access to the given file! (Error %i: %s)", (uint8_t *)&v5, 0x1Cu);
}

- (void)cp_clientSandboxCanAccessFileURL:()CPAdditions .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ACCCC000, v0, v1, "%s URL resource is not reachable: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)cp_clientSandboxCanAccessFileURL:()CPAdditions .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ACCCC000, v0, v1, "%s URL is not a file system URL: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
