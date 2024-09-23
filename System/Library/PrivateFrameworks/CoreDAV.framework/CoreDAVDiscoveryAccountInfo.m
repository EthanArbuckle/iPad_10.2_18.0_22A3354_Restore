@implementation CoreDAVDiscoveryAccountInfo

- (CoreDAVDiscoveryAccountInfo)initWithAccountInfoProvider:(id)a3
{
  id v4;
  CoreDAVDiscoveryAccountInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVDiscoveryAccountInfo;
  v5 = -[CoreDAVDiscoveryAccountInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryAccountInfo setScheme:](v5, "setScheme:", v6);

    objc_msgSend(v4, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryAccountInfo setHost:](v5, "setHost:", v7);

    -[CoreDAVDiscoveryAccountInfo setPort:](v5, "setPort:", objc_msgSend(v4, "port"));
    objc_msgSend(v4, "serverRoot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryAccountInfo setServerRoot:](v5, "setServerRoot:", v8);

    objc_msgSend(v4, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryAccountInfo setUser:](v5, "setUser:", v9);

    objc_msgSend(v4, "password");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryAccountInfo setPassword:](v5, "setPassword:", v10);

    objc_msgSend(v4, "userAgentHeader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryAccountInfo setUserAgentHeader:](v5, "setUserAgentHeader:", v11);

    objc_msgSend(v4, "accountID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryAccountInfo setAccountID:](v5, "setAccountID:", v12);

    -[CoreDAVDiscoveryAccountInfo setBackingAccountInfoProvider:](v5, "setBackingAccountInfoProvider:", v4);
  }

  return v5;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVDiscoveryAccountInfo;
  -[CoreDAVDiscoveryAccountInfo description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVDiscoveryAccountInfo scheme](self, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Scheme: [%@]"), v5);

  -[CoreDAVDiscoveryAccountInfo host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Host: [%@]"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Port: [%ld]"), -[CoreDAVDiscoveryAccountInfo port](self, "port"));
  -[CoreDAVDiscoveryAccountInfo serverRoot](self, "serverRoot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Server root: [%@]"), v7);

  -[CoreDAVDiscoveryAccountInfo user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  User: [%@]"), v8);

  -[CoreDAVDiscoveryAccountInfo accountID](self, "accountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Account ID: [%@]"), v9);

  -[CoreDAVDiscoveryAccountInfo principalURL](self, "principalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Principal URL: [%@]"), v10);

  -[CoreDAVDiscoveryAccountInfo serverHeaders](self, "serverHeaders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Server headers: [%@]"), v11);

  -[CoreDAVDiscoveryAccountInfo serverComplianceClasses](self, "serverComplianceClasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Server compliance classes: [%@]"), v12);

  -[CoreDAVDiscoveryAccountInfo userAgentHeader](self, "userAgentHeader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  User agent header: [%@]"), v13);

  return (NSString *)v3;
}

- (id)url
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[CoreDAVDiscoveryAccountInfo port](self, "port"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CoreDAVDiscoveryAccountInfo port](self, "port"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)MEMORY[0x24BDBCF48];
  -[CoreDAVDiscoveryAccountInfo scheme](self, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVDiscoveryAccountInfo user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVDiscoveryAccountInfo host](self, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVDiscoveryAccountInfo serverRoot](self, "serverRoot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CDVURLWithScheme:user:password:host:port:path:", v5, v6, 0, v7, v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)promptUserForNewCoreDAVPasswordWithCompletionBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CoreDAVDiscoveryAccountInfo setShouldFailAllTasks:](self, "setShouldFailAllTasks:", 1);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 2);
    v4 = v5;
  }

}

- (id)additionalHeaderValues
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CoreDAVAccountInfoProvider additionalHeaderValues](self->_backingAccountInfoProvider, "additionalHeaderValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)clientTokenRequestedByServer
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CoreDAVAccountInfoProvider clientTokenRequestedByServer](self->_backingAccountInfoProvider, "clientTokenRequestedByServer");
}

- (id)clientToken
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CoreDAVAccountInfoProvider clientToken](self->_backingAccountInfoProvider, "clientToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)clientCertificateInfoProvider
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CoreDAVAccountInfoProvider clientCertificateInfoProvider](self->_backingAccountInfoProvider, "clientCertificateInfoProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)oauthInfoProvider
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CoreDAVAccountInfoProvider oauthInfoProvider](self->_backingAccountInfoProvider, "oauthInfoProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)handleTrustChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  char v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = -[CoreDAVAccountInfoProvider handleTrustChallenge:completionHandler:](self->_backingAccountInfoProvider, "handleTrustChallenge:completionHandler:", v6, v7);
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logHandleForAccountInfoProvider:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_209602000, v11, OS_LOG_TYPE_INFO, "BackingAccountInfoProvider doesn't know how to handle a trust challenge, so we're just going to have to cancel.", v13, 2u);
    }

    v7[2](v7, 2, 0);
    v8 = 0;
  }

  return v8;
}

- (BOOL)handleCertificateError:(id)a3
{
  return -[CoreDAVAccountInfoProvider handleCertificateError:](self->_backingAccountInfoProvider, "handleCertificateError:", a3);
}

- (BOOL)shouldTurnModalOnBadPassword
{
  return 0;
}

- (BOOL)shouldRetryUnauthorizedTask:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[CoreDAVAccountInfoProvider shouldRetryUnauthorizedTask:](self->_backingAccountInfoProvider, "shouldRetryUnauthorizedTask:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldTryRenewingCredential
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CoreDAVAccountInfoProvider shouldTryRenewingCredential](self->_backingAccountInfoProvider, "shouldTryRenewingCredential");
  else
    return 0;
}

- (BOOL)renewCredential
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CoreDAVAccountInfoProvider renewCredential](self->_backingAccountInfoProvider, "renewCredential");
  else
    return 0;
}

- (BOOL)handleAuthenticateAgainstProtectionSpace:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "authenticationMethod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[CoreDAVAccountInfoProvider handleAuthenticateAgainstProtectionSpace:](self->_backingAccountInfoProvider, "handleAuthenticateAgainstProtectionSpace:", v4);
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || !os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v5;
    v16 = 2114;
    v17 = v10;
    v11 = "_backingAccountInfoProvider: Can authenticate against protection space %{public}@? %{public}@";
LABEL_14:
    _os_log_impl(&dword_209602000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v14, 0x16u);

LABEL_15:
    goto LABEL_16;
  }
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB7408]))
  {
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB7410]) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB73F0]) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB73F8]);
    }
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (!v12 || !os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v5;
    v16 = 2114;
    v17 = v10;
    v11 = "CoreDAVDiscoveryAccountInfo: Can authenticate against protection space %{public}@? %{public}@";
    goto LABEL_14;
  }
  LOBYTE(v6) = objc_opt_respondsToSelector();
LABEL_16:

  return v6 & 1;
}

- (BOOL)handleShouldUseCredentialStorage
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CoreDAVAccountInfoProvider handleShouldUseCredentialStorage](self->_backingAccountInfoProvider, "handleShouldUseCredentialStorage");
  else
    return 1;
}

- (BOOL)shouldHandleHTTPCookiesForURL:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[CoreDAVAccountInfoProvider shouldHandleHTTPCookiesForURL:](self->_backingAccountInfoProvider, "shouldHandleHTTPCookiesForURL:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldSendClientInfoHeaderForURL:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[CoreDAVAccountInfoProvider shouldSendClientInfoHeaderForURL:](self->_backingAccountInfoProvider, "shouldSendClientInfoHeaderForURL:", v4);
  else
    v5 = 0;

  return v5;
}

- (__CFURLStorageSession)copyStorageSession
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (__CFURLStorageSession *)-[CoreDAVAccountInfoProvider copyStorageSession](self->_backingAccountInfoProvider, "copyStorageSession");
  else
    return 0;
}

- (BOOL)shouldUseOpportunisticSockets
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CoreDAVAccountInfoProvider shouldUseOpportunisticSockets](self->_backingAccountInfoProvider, "shouldUseOpportunisticSockets");
  else
    return 0;
}

- (id)getAppleIDSession
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CoreDAVAccountInfoProvider getAppleIDSession](self->_backingAccountInfoProvider, "getAppleIDSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)customConnectionProperties
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CoreDAVAccountInfoProvider customConnectionProperties](self->_backingAccountInfoProvider, "customConnectionProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (void)setScheme:(id)a3
{
  objc_storeStrong((id *)&self->_scheme, a3);
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (int64_t)port
{
  return self->_port;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (NSString)serverRoot
{
  return self->_serverRoot;
}

- (void)setServerRoot:(id)a3
{
  objc_storeStrong((id *)&self->_serverRoot, a3);
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_storeStrong((id *)&self->_user, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSData)identityPersist
{
  return self->_identityPersist;
}

- (void)setIdentityPersist:(id)a3
{
  objc_storeStrong((id *)&self->_identityPersist, a3);
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (void)setPrincipalURL:(id)a3
{
  objc_storeStrong((id *)&self->_principalURL, a3);
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (BOOL)shouldFailAllTasks
{
  return self->_shouldFailAllTasks;
}

- (void)setShouldFailAllTasks:(BOOL)a3
{
  self->_shouldFailAllTasks = a3;
}

- (CoreDAVAccountInfoProvider)backingAccountInfoProvider
{
  return self->_backingAccountInfoProvider;
}

- (void)setBackingAccountInfoProvider:(id)a3
{
  objc_storeStrong((id *)&self->_backingAccountInfoProvider, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDictionary)serverHeaders
{
  return self->_serverHeaders;
}

- (void)setServerHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_serverHeaders, a3);
}

- (NSSet)serverComplianceClasses
{
  return self->_serverComplianceClasses;
}

- (void)setServerComplianceClasses:(id)a3
{
  objc_storeStrong((id *)&self->_serverComplianceClasses, a3);
}

- (NSString)userAgentHeader
{
  return self->_userAgentHeader;
}

- (void)setUserAgentHeader:(id)a3
{
  objc_storeStrong((id *)&self->_userAgentHeader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAccountInfoProvider, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_userAgentHeader, 0);
  objc_storeStrong((id *)&self->_serverComplianceClasses, 0);
  objc_storeStrong((id *)&self->_serverHeaders, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
  objc_storeStrong((id *)&self->_identityPersist, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_serverRoot, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
}

@end
