@implementation NSXPCConnection(Metadata)

- (__CFString)processName
{
  int v1;
  __CFString *v2;
  size_t v4;
  _OWORD v5[40];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 648;
  memset(v5, 0, 512);
  dword_253E71E1C = objc_msgSend(a1, "processIdentifier");
  v1 = sysctl(processName_name, 4u, v5, &v4, 0, 0);
  v2 = CFSTR("unknown");
  if (!v1 && BYTE3(v5[15]))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (char *)&v5[15] + 3);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)bundleID
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

  v31 = *MEMORY[0x24BDAC8D0];
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
      _CDPLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v26 = a1;
        v27 = 2112;
        v28 = v3;
        v29 = 2112;
        v30 = error;
        _os_log_error_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_ERROR, "\"%@: Failed to copy signing ID from task (%@) with error (%@)\", buf, 0x20u);
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
      _CDPLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NSXPCConnection(Metadata) bundleID].cold.2((uint64_t)a1, v14, v15, v16, v17, v18, v19, v20);

    }
    v5 = 0;
    goto LABEL_15;
  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[NSXPCConnection(Metadata) bundleID].cold.1((uint64_t)a1, v7, v8, v9, v10, v11, v12, v13);

  v5 = 0;
LABEL_16:
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UNKNOWN-%0000x"), arc4random_uniform(0xFFFFu));
    v21 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v21;
  }
  return v5;
}

- (void)bundleID
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"%@: Failed to retrieve signing ID (using framework-provided identifier)\", a5, a6, a7, a8, 2u);
}

@end
