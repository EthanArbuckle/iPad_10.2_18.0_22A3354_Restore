@implementation GEONavdPeer

- (GEONavdPeer)initWithXPCConnection:(id)a3
{
  id v4;
  GEONavdPeer *v5;
  GEONavdPeer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEONavdPeer;
  v5 = -[GEONavdPeer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[GEONavdPeer updateConnection:](v5, "updateConnection:", v4);

  return v6;
}

- (void)updateConnection:(id)a3
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  GEONavdClientInfo *v9;
  GEOApplicationAuditToken *v10;
  GEONavdClientInfo *v11;
  GEONavdClientInfo *clientInfo;
  GEONavdClientInfo *v13;
  GEONavdClientInfo *v14;
  _BYTE buffer[1024];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  self->_expectingUpdates = 0;
  v6 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  -[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("application-identifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [GEONavdClientInfo alloc];
    v10 = -[GEOApplicationAuditToken initWithProxiedExternalApplicationBundleId:]([GEOApplicationAuditToken alloc], "initWithProxiedExternalApplicationBundleId:", v8);
    v11 = -[GEONavdClientInfo initWithCanonicalName:instanceId:auditToken:](v9, "initWithCanonicalName:instanceId:auditToken:", v8, v6, v10);
    clientInfo = self->_clientInfo;
    self->_clientInfo = v11;

  }
  else
  {
    buffer[0] = 0;
    proc_name(v6, buffer, 0x400u);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", buffer, 4);
    v13 = -[GEONavdClientInfo initWithCanonicalName:instanceId:]([GEONavdClientInfo alloc], "initWithCanonicalName:instanceId:", v8, v6);
    v14 = self->_clientInfo;
    self->_clientInfo = v13;

  }
}

- (BOOL)hasEntitlement:(id)a3
{
  __CFString *v4;
  NSMutableDictionary *entitlementCache;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSXPCConnection *connection;
  __SecTask *v12;
  __SecTask *v13;
  CFTypeRef v14;
  CFTypeID v15;
  NSMutableDictionary *v16;
  void *v17;
  audit_token_t token;
  audit_token_t v20;

  v4 = (__CFString *)a3;
  if (self->_connection)
  {
    entitlementCache = self->_entitlementCache;
    if (!entitlementCache)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = self->_entitlementCache;
      self->_entitlementCache = v6;

      entitlementCache = self->_entitlementCache;
    }
    -[NSMutableDictionary objectForKey:](entitlementCache, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      LOBYTE(v10) = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      memset(&v20, 0, sizeof(v20));
      connection = self->_connection;
      if (connection)
        -[NSXPCConnection auditToken](connection, "auditToken");
      token = v20;
      v12 = SecTaskCreateWithAuditToken(0, &token);
      if (v12)
      {
        v13 = v12;
        *(_QWORD *)token.val = 0;
        v14 = SecTaskCopyValueForEntitlement(v12, v4, (CFErrorRef *)&token);
        if (*(_QWORD *)token.val)
        {
          NSLog(CFSTR("Unable to get entitlements for peer. Error: %@"), *(_QWORD *)token.val);
          CFRelease(*(CFTypeRef *)token.val);
        }
        if (v14)
        {
          v15 = CFGetTypeID(v14);
          v10 = v15 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v14) != 0;
          CFRelease(v14);
        }
        else
        {
          v10 = 0;
        }
        CFRelease(v13);
      }
      else
      {
        NSLog(CFSTR("Unable to create security task from audit token"));
        v10 = 0;
      }
      v16 = self->_entitlementCache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, v4);

    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)description
{
  return -[GEONavdClientInfo canonicalName](self->_clientInfo, "canonicalName");
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (GEONavdClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (BOOL)expectingUpdates
{
  return self->_expectingUpdates;
}

- (void)setExpectingUpdates:(BOOL)a3
{
  self->_expectingUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_entitlementCache, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
