@implementation NSXPCConnection(Metadata)

- (__CFString)aaf_processName
{
  int v1;
  void *v2;
  char *v3;
  void *v4;
  int v5;
  size_t v7;
  _OWORD v8[40];
  int v9[2];
  int v10;
  int v11;
  _BYTE buffer[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(a1, "processIdentifier");
  if (proc_name(v1, buffer, 0x20u) < 1)
  {
    *(_QWORD *)v9 = 0xE00000001;
    v10 = 1;
    v11 = v1;
    v7 = 648;
    memset(v8, 0, 512);
    v5 = sysctl(v9, 4u, v8, &v7, 0, 0);
    v4 = 0;
    if (v5)
      return (__CFString *)v4;
    if (!BYTE3(v8[15]))
      return CFSTR("exited?");
    v3 = (char *)&v8[15] + 3;
    v2 = (void *)MEMORY[0x1E0CB3940];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = buffer;
  }
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (__CFString *)v4;
}

- (id)aaf_bundleID
{
  __SecTask *v2;
  __SecTask *v3;
  CFStringRef v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFErrorRef error;
  audit_token_t token;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  __SecTask *v28;
  __int16 v29;
  CFErrorRef v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "auditToken");
  v2 = SecTaskCreateWithAuditToken(0, &token);
  if (v2)
  {
    v3 = v2;
    error = 0;
    v4 = SecTaskCopySigningIdentifier(v2, &error);
    v5 = (void *)v4;
    if (error)
    {
      _AAFLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v26 = a1;
        v27 = 2112;
        v28 = v3;
        v29 = 2112;
        v30 = error;
        _os_log_error_impl(&dword_1D51A2000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to copy signing ID from task (%@) with error (%@)", buf, 0x20u);
      }

      CFRelease(error);
      if (!v5)
        goto LABEL_15;
      CFRelease(v5);
    }
    else
    {
      if (v4)
      {
LABEL_15:
        CFRelease(v3);
        goto LABEL_16;
      }
      _AAFLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NSXPCConnection(Metadata) aaf_bundleID].cold.2((uint64_t)a1, v14, v15, v16, v17, v18, v19, v20);

    }
    v5 = 0;
    goto LABEL_15;
  }
  _AAFLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[NSXPCConnection(Metadata) aaf_bundleID].cold.1((uint64_t)a1, v7, v8, v9, v10, v11, v12, v13);

  v5 = 0;
LABEL_16:
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN-%0000x"), arc4random_uniform(0xFFFFu));
    v21 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v21;
  }
  return v5;
}

- (void)aaf_bundleID
{
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, a2, a3, "%@: Failed to retrieve signing ID (using framework-provided identifier)", a5, a6, a7, a8, 2u);
}

@end
