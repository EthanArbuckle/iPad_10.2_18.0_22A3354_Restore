@implementation _LSAppLinkOpenState

- (const)auditToken
{
  if (self->_auditToken.__engaged_)
    return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&self->_auditToken;
  else
    return 0;
}

- (void)setAuditToken:(id *)a3
{
  _BOOL4 engaged;
  __int128 v4;
  NSXPCConnection *XPCConnection;

  if (a3)
  {
    engaged = self->_auditToken.__engaged_;
    v4 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)&self->_auditToken.var0.__null_state_ = *(_OWORD *)a3->var0;
    *(_OWORD *)&self->_auditToken.var0.val[4] = v4;
    if (!engaged)
      self->_auditToken.__engaged_ = 1;
  }
  else if (self->_auditToken.__engaged_)
  {
    self->_auditToken.__engaged_ = 0;
  }
  XPCConnection = self->_XPCConnection;
  self->_XPCConnection = 0;

}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void)setXPCConnection:(id)a3
{
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  _BOOL4 engaged;
  NSXPCConnection *XPCConnection;
  __int128 v8;
  __int128 v9;

  v4 = (NSXPCConnection *)a3;
  v5 = v4;
  if (v4)
  {
    -[NSXPCConnection auditToken](v4, "auditToken");
    engaged = self->_auditToken.__engaged_;
    *(_OWORD *)&self->_auditToken.var0.__null_state_ = v8;
    *(_OWORD *)&self->_auditToken.var0.val[4] = v9;
    if (!engaged)
      self->_auditToken.__engaged_ = 1;
  }
  else if (self->_auditToken.__engaged_)
  {
    self->_auditToken.__engaged_ = 0;
  }
  XPCConnection = self->_XPCConnection;
  self->_XPCConnection = v5;

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)_LSAppLinkOpenState;
  -[_LSAppLinkOpenState description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSAppLinkOpenState URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSAppLinkOpenState browserState](self, "browserState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[_LSAppLinkOpenState openConfiguration](self, "openConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { URL = %@, browserState = %lu, openconfig = %@ }"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSURL copy](self->_URL, "copy");
    v6 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v5;

    v7 = -[NSString copy](self->_bundleIdentifier, "copy");
    v8 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v7;

    v9 = -[_LSOpenConfiguration copy](self->_openConfiguration, "copy");
    v10 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v9;

    v11 = -[NSDictionary copy](self->_browserState, "copy");
    v12 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v11;

    objc_storeStrong((id *)(v4 + 48), self->_XPCConnection);
    *(_BYTE *)(v4 + 56) = self->_includeLinksForCallingApplication;
  }
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_LSAppLinkOpenState URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("URL"));

  -[_LSAppLinkOpenState openConfiguration](self, "openConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("openConfiguration"));

  -[_LSAppLinkOpenState browserState](self, "browserState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("browserState"));

  objc_msgSend(v7, "encodeBool:forKey:", -[_LSAppLinkOpenState includeLinksForCallingApplication](self, "includeLinksForCallingApplication"), CFSTR("includeLinksForCallingApplication"));
}

- (_LSAppLinkOpenState)initWithCoder:(id)a3
{
  id v4;
  _LSAppLinkOpenState *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[_LSAppLinkOpenState init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSAppLinkOpenState setURL:](v5, "setURL:", v6);

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openConfiguration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSAppLinkOpenState setOpenConfiguration:](v5, "setOpenConfiguration:", v7);

    v8 = objc_opt_class();
    XNSGetPropertyListClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v8, v9, CFSTR("browserState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSAppLinkOpenState setBrowserState:](v5, "setBrowserState:", v10);

    -[_LSAppLinkOpenState setIncludeLinksForCallingApplication:](v5, "setIncludeLinksForCallingApplication:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeLinksForCallingApplication")));
  }

  return v5;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (_LSOpenConfiguration)openConfiguration
{
  return (_LSOpenConfiguration *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOpenConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)browserState
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBrowserState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)includeLinksForCallingApplication
{
  return self->_includeLinksForCallingApplication;
}

- (void)setIncludeLinksForCallingApplication:(BOOL)a3
{
  self->_includeLinksForCallingApplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserState, 0);
  objc_storeStrong((id *)&self->_openConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_XPCConnection, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 40) = 0;
  return self;
}

@end
