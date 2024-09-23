@implementation CXServiceClient

- (CXServiceClient)initWithConnection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  CXServiceClient *v13;
  CXServiceClient *v14;
  CXServiceClient *v15;
  uint64_t v16;
  NSString *bundleIdentifier;
  uint64_t v18;
  NSURL *bundleURL;
  void *v20;
  uint64_t v21;
  NSString *localizedName;
  objc_super v24;

  v5 = a3;
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "cx_applicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v7, "cx_applicationRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v7, "cx_capabilities");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "cx_backgroundModeOptions");
        v12 = objc_msgSend(v10, "containsObject:", CFSTR("private-provider-api"));
        if ((v12 & 1) != 0 || v11)
        {
          v24.receiver = self;
          v24.super_class = (Class)CXServiceClient;
          v14 = -[CXServiceClient init](&v24, sel_init);
          v15 = v14;
          if (v14)
          {
            v14->_backgroundModeOptions = v11;
            objc_msgSend(v9, "bundleIdentifier");
            v16 = objc_claimAutoreleasedReturnValue();
            bundleIdentifier = v15->_bundleIdentifier;
            v15->_bundleIdentifier = (NSString *)v16;

            objc_msgSend(v9, "URL");
            v18 = objc_claimAutoreleasedReturnValue();
            bundleURL = v15->_bundleURL;
            v15->_bundleURL = (NSURL *)v18;

            objc_storeStrong((id *)&v15->_connection, a3);
            objc_storeStrong((id *)&v15->_identifier, v8);
            objc_msgSend(v9, "localizedName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "copy");
            localizedName = v15->_localizedName;
            v15->_localizedName = (NSString *)v21;

            v15->_permittedToUsePrivateAPI = v12;
          }
          self = v15;
          v13 = self;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)invalidate
{
  id v2;

  -[CXServiceClient connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  void *v5;
  void *v6;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  id v8;

  -[CXServiceClient connection](self, "connection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "realToken");
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (BOOL)isConnected
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CXServiceClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isPermittedToUseBluetoothAccessories
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0DB1088], (const void *)*MEMORY[0x1E0C9AE40]);
  -[CXServiceClient auditToken](self, "auditToken");
  LOBYTE(self) = TCCAccessCheckAuditToken() != 0;
  CFRelease(Mutable);
  return (char)self;
}

- (int)processIdentifier
{
  void *v2;
  void *v3;
  int v4;

  -[CXServiceClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pid");

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXServiceClient identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isConnected);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v6, -[CXServiceClient isConnected](self, "isConnected"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_processIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v7, -[CXServiceClient processIdentifier](self, "processIdentifier"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isPermittedToUsePublicAPI);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v8, -[CXServiceClient isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isPermittedToUsePrivateAPI);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v9, -[CXServiceClient isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"));

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CXServiceClientDelegate)delegate
{
  return (CXServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  return self->_permittedToUsePrivateAPI;
}

- (int64_t)backgroundModeOptions
{
  return self->_backgroundModeOptions;
}

- (BSServiceConnectionHost)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
