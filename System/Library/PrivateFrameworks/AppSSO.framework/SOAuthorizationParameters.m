@implementation SOAuthorizationParameters

- (SOAuthorizationParameters)init
{
  SOAuthorizationParameters *v2;
  void *v3;
  objc_class *v4;
  SOAuthorizationParametersCore *v5;
  SOAuthorizationParametersCore *authorizationParametersCore;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)SOAuthorizationParameters;
  v2 = -[SOAuthorizationParameters init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getSOAuthorizationParametersCoreClass_softClass;
    v13 = getSOAuthorizationParametersCoreClass_softClass;
    if (!getSOAuthorizationParametersCoreClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getSOAuthorizationParametersCoreClass_block_invoke;
      v9[3] = &unk_24C80C0B8;
      v9[4] = &v10;
      __getSOAuthorizationParametersCoreClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (SOAuthorizationParametersCore *)objc_alloc_init(v4);
    authorizationParametersCore = v2->_authorizationParametersCore;
    v2->_authorizationParametersCore = v5;

    -[SOAuthorizationParameters setUseInternalExtensions:](v2, "setUseInternalExtensions:", 1);
  }
  return v2;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)operation
{
  void *v2;
  void *v3;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOperation:", v4);

}

- (NSURL)url
{
  void *v2;
  void *v3;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setUrl:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUrl:", v4);

}

- (NSDictionary)httpHeaders
{
  void *v2;
  void *v3;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "httpHeaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setHttpHeaders:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHttpHeaders:", v4);

}

- (NSData)httpBody
{
  void *v2;
  void *v3;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "httpBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setHttpBody:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHttpBody:", v4);

}

- (NSData)auditTokenData
{
  void *v2;
  void *v3;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auditTokenData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setAuditTokenData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuditTokenData:", v4);

}

- (BOOL)useInternalExtensions
{
  void *v2;
  char v3;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useInternalExtensions");

  return v3;
}

- (void)setUseInternalExtensions:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseInternalExtensions:", v3);

}

- (int64_t)responseCode
{
  void *v2;
  int64_t v3;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "responseCode");

  return v3;
}

- (void)setResponseCode:(int64_t)a3
{
  id v4;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponseCode:", a3);

}

- (BOOL)isCFNetworkInterception
{
  void *v2;
  char v3;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCFNetworkInterception");

  return v3;
}

- (void)setCFNetworkInterception:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCfNetworkInterception:", v3);

}

- (BOOL)canShowOnCoverScreen
{
  void *v2;
  char v3;

  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowOnCoverScreen");

  return v3;
}

- (void)setShowOnCoverScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SOAuthorizationParameters authorizationParametersCore](self, "authorizationParametersCore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowOnCoverScreen:", v3);

}

- (NSString)impersonationBundleIdentifier
{
  return self->_impersonationBundleIdentifier;
}

- (void)setImpersonationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impersonationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationParametersCore, 0);
}

- (SOAuthorizationParametersCore)authorizationParametersCore
{
  return self->_authorizationParametersCore;
}

@end
