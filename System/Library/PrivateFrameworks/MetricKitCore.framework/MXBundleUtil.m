@implementation MXBundleUtil

- (id)bundleIDFromAuditToken:(id *)a3
{
  __int128 v4;
  __SecTask *v5;
  __SecTask *v6;
  __CFString *v7;
  NSObject *logHandle;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  audit_token_t cf;

  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v4;
  v5 = SecTaskCreateWithAuditToken(0, &cf);
  if (v5)
  {
    v6 = v5;
    *(_QWORD *)cf.val = 0;
    v7 = (__CFString *)SecTaskCopySigningIdentifier(v5, (CFErrorRef *)&cf);
    if (*(_QWORD *)cf.val)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        -[MXBundleUtil bundleIDFromAuditToken:].cold.1((uint64_t)&cf, logHandle, v9, v10, v11, v12, v13, v14);
      CFRelease(*(CFTypeRef *)cf.val);
    }
    if (v7)
      CFRelease(v7);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (MXBundleUtil)init
{
  MXBundleUtil *v2;
  os_log_t v3;
  OS_os_log *logHandle;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MXBundleUtil;
  v2 = -[MXBundleUtil init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.metrickit", "bundle.utility");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v3;

    if (!v2->_logHandle)
      objc_storeStrong((id *)&v2->_logHandle, MEMORY[0x24BDACB70]);
  }
  return v2;
}

- (id)bundleIDFromPid:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BYTE buffer[4096];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", buffer, proc_pidpath(a3, buffer, 0x1000u), 4);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    -[MXBundleUtil _bundleIDFromURL:](self, "_bundleIDFromURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)teamIDFromAuditToken:(id *)a3
{
  __int128 v4;
  SecTaskRef v5;
  SecTaskRef v6;
  void *v7;
  NSObject *logHandle;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  audit_token_t cf;

  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v4;
  v5 = SecTaskCreateWithAuditToken(0, &cf);
  if (v5)
  {
    v6 = v5;
    *(_QWORD *)cf.val = 0;
    v7 = (void *)SecTaskCopyTeamIdentifier();
    if (*(_QWORD *)cf.val)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        -[MXBundleUtil teamIDFromAuditToken:].cold.1((uint64_t)&cf, logHandle, v9, v10, v11, v12, v13, v14);
      CFRelease(*(CFTypeRef *)cf.val);
    }
    if (v7)
      CFRelease(v7);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isAppExtensionFromBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *logHandle;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v4 = a3;
  if (v4)
  {
    v18 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v4, &v18);
    v6 = v18;
    if (v6)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        -[MXBundleUtil isAppExtensionFromBundleID:].cold.2((uint64_t)v4, logHandle, v6);
    }
    v8 = v5 != 0;

  }
  else
  {
    v9 = self->_logHandle;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MXBundleUtil isAppExtensionFromBundleID:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    v8 = 0;
  }

  return v8;
}

- (id)mainAppBundleIDforExtension:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *logHandle;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;

  v4 = a3;
  if (v4)
  {
    v19 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v4, &v19);
    v6 = v19;
    if (v6)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        -[MXBundleUtil isAppExtensionFromBundleID:].cold.2((uint64_t)v4, logHandle, v6);
      v8 = 0;
    }
    else
    {
      objc_msgSend(v5, "containingBundleRecord");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = self->_logHandle;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MXBundleUtil isAppExtensionFromBundleID:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    v8 = 0;
  }

  return v8;
}

- (BOOL)isAppInstalledForBundleID:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInstalled");

  return v5;
}

- (id)_bundleIDFromURL:(id)a3
{
  __CFBundle *Unique;
  __CFBundle *v4;
  void *v5;

  if (a3 && (Unique = (__CFBundle *)_CFBundleCreateUnique()) != 0)
  {
    v4 = Unique;
    CFBundleGetIdentifier(Unique);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
}

- (void)bundleIDFromAuditToken:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21E837000, a2, a3, "Error getting signingIdentifier: %@", a5, a6, a7, a8, 2u);
}

- (void)teamIDFromAuditToken:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21E837000, a2, a3, "Error getting teamIdentifier: %@", a5, a6, a7, a8, 2u);
}

- (void)isAppExtensionFromBundleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21E837000, a1, a3, "bundleID passed to isAppExtension function is nil", a5, a6, a7, a8, 0);
}

- (void)isAppExtensionFromBundleID:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a2;
  objc_msgSend(a3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7(&dword_21E837000, v6, v7, "Failed to create bundle record for bundleID %@ and error %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_10();
}

@end
