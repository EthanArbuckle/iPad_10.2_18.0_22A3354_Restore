@implementation APXPCConnection

- (id)remoteObjectProxy
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_connection(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectProxy(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)invalidate
{
  NSObject *v3;
  NSXPCConnection *connection;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  NSString *bundleID;
  int v11;
  const char *v12;
  __int16 v13;
  NSXPCConnection *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x32uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    v11 = 136643075;
    v12 = "-[APXPCConnection invalidate]";
    v13 = 2048;
    v14 = connection;
    _os_log_impl(&dword_1CF251000, v3, OS_LOG_TYPE_INFO, "%{sensitive}s: invalidating connection %p", (uint8_t *)&v11, 0x16u);
  }

  v8 = self->_connection;
  if (v8)
  {
    objc_msgSend_invalidate(v8, v5, v6, v7);
    v9 = self->_connection;
    self->_connection = 0;

  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    self->_bundleID = 0;

  }
}

- (NSString)bundleID
{
  uint64_t v2;
  uint64_t v3;
  NSString *bundleID;
  NSXPCConnection *connection;
  __SecTask *v7;
  __SecTask *v8;
  __CFString *v9;
  NSObject *v10;
  char *v11;
  char *v12;
  NSObject *v13;
  char *v14;
  char *v15;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSString *v23;
  NSObject *v24;
  NSString *v25;
  char *v26;
  char *v27;
  CFErrorRef error;
  audit_token_t token;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  CFErrorRef v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  bundleID = self->_bundleID;
  if (bundleID)
    return bundleID;
  connection = self->_connection;
  if (connection)
    objc_msgSend_auditToken(connection, a2, v2, v3);
  else
    memset(&token, 0, sizeof(token));
  v7 = SecTaskCreateWithAuditToken(0, &token);
  if (v7)
  {
    v8 = v7;
    error = 0;
    v9 = (__CFString *)SecTaskCopySigningIdentifier(v7, &error);
    if (error)
    {
      APLogForCategory(0x32uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v31 = v11;
        v12 = v11;
        _os_log_impl(&dword_1CF251000, v10, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to copy signing ID.", buf, 0xCu);

      }
      CFRelease(error);
      if (v9)
        CFRelease(v9);
    }
    else
    {
      APLogForCategory(0x32uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v9)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_connection(self, v19, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136643331;
          v31 = "-[APXPCConnection bundleID]";
          v32 = 2114;
          v33 = (CFErrorRef)v9;
          v34 = 2114;
          v35 = v22;
          _os_log_impl(&dword_1CF251000, v18, OS_LOG_TYPE_INFO, "%{sensitive}s: SecTaskCopySigningIdentifier returned bundleID %{public}@ for connection %{public}@", buf, 0x20u);

        }
        v23 = self->_bundleID;
        self->_bundleID = &v9->isa;

        APLogForCategory(0x32uLL);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = self->_bundleID;
          *(_DWORD *)buf = 136643075;
          v31 = "-[APXPCConnection bundleID]";
          v32 = 2114;
          v33 = (CFErrorRef)v25;
          _os_log_impl(&dword_1CF251000, v24, OS_LOG_TYPE_INFO, "%{sensitive}s: bundleID is now %{public}@", buf, 0x16u);
        }

      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v26 = (char *)objc_opt_class();
          *(_DWORD *)buf = 138478083;
          v31 = v26;
          v32 = 2114;
          v33 = error;
          v27 = v26;
          _os_log_impl(&dword_1CF251000, v18, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to retrieve signing ID. %{public}@", buf, 0x16u);

        }
      }
    }
    CFRelease(v8);
    bundleID = self->_bundleID;
    return bundleID;
  }
  APLogForCategory(0x32uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = (char *)objc_opt_class();
    *(_DWORD *)buf = 138477827;
    v31 = v14;
    v15 = v14;
    _os_log_impl(&dword_1CF251000, v13, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to allocate security task.", buf, 0xCu);

  }
  return (NSString *)0;
}

- (BOOL)hasEntitlement:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  id v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_msgSend_connection(self, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForEntitlement_(v8, v9, (uint64_t)v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_BOOLValue(v11, v12, v13, v14);

  }
  else
  {
    APLogForCategory(0x32uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 138477827;
      v20 = (id)objc_opt_class();
      v17 = v20;
      _os_log_impl(&dword_1CF251000, v16, OS_LOG_TYPE_ERROR, "[%{private}@] Caller did not provide an entitlement to check.", (uint8_t *)&v19, 0xCu);

    }
    v15 = 0;
  }

  return v15;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (APXPCConnection)initWithConnection:(id)a3
{
  id v5;
  APXPCConnection *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APXPCConnection;
  -[APXPCConnection self](&v9, sel_self);
  v6 = (APXPCConnection *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    APLogForCategory(0x32uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136643075;
      v11 = "-[APXPCConnection initWithConnection:]";
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_1CF251000, v7, OS_LOG_TYPE_INFO, "%{sensitive}s: Initializing connection %p", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v6;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  uint64_t v3;
  uint64_t v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)objc_msgSend_auditToken(result, a3, v3, v4);
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (int)processIdentifier
{
  return ((uint64_t (*)(NSXPCConnection *, char *))MEMORY[0x1E0DE7D20])(self->_connection, sel_processIdentifier);
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

@end
