@implementation SOKerberosAgentContext

- (SOKerberosAgentContext)initWithProfile:(id)a3
{
  id v5;
  SOKerberosAgentContext *v6;
  NSOperationQueue *v7;
  NSOperationQueue *contextNetworkWorkQueue;
  void *v9;
  void *v10;
  void *v11;
  NSOperationQueue *v12;
  NSOperationQueue *contextKerberosWorkQueue;
  void *v14;
  void *v15;
  void *v16;
  SOKerberosRealmSettings *v17;
  void *v18;
  uint64_t v19;
  SOKerberosRealmSettings *settings;
  SOKerberosExtensionData *v21;
  void *v22;
  uint64_t v23;
  SOKerberosExtensionData *extensionData;
  SONetworkIdentity *v25;
  void *v26;
  uint64_t v27;
  SONetworkIdentity *identity;
  SOADSiteDiscovery *v29;
  void *v30;
  uint64_t v31;
  SOADSiteDiscovery *siteDiscovery;
  SOAuthorizationWrapper *v33;
  SOAuthorizationWrapper *authWrapper;
  SOAuthorizationWrapper *v35;
  SOAuthorizationWrapper *receivedTGTAuthWrapper;
  SOAuthorizationWrapper *v37;
  SOAuthorizationWrapper *passwordSyncAuthWrapper;
  SOAuthorizationWrapper *v39;
  SOAuthorizationWrapper *passwordChangeAuthWrapper;
  objc_super v42;

  v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SOKerberosAgentContext;
  v6 = -[SOKerberosAgentContext init](&v42, sel_init);
  if (v6)
  {
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    contextNetworkWorkQueue = v6->_contextNetworkWorkQueue;
    v6->_contextNetworkWorkQueue = v7;

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "realm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.kerberosextension.%@.network"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v6->_contextNetworkWorkQueue, "setName:", v11);

    -[NSOperationQueue setSuspended:](v6->_contextNetworkWorkQueue, "setSuspended:", 1);
    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    contextKerberosWorkQueue = v6->_contextKerberosWorkQueue;
    v6->_contextKerberosWorkQueue = v12;

    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "realm");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("com.apple.kerberosextension.%@.kerberos"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v6->_contextKerberosWorkQueue, "setName:", v16);

    -[NSOperationQueue setSuspended:](v6->_contextKerberosWorkQueue, "setSuspended:", 1);
    objc_storeStrong((id *)&v6->_profile, a3);
    v17 = [SOKerberosRealmSettings alloc];
    objc_msgSend(v5, "realm");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SOKerberosRealmSettings initWithRealm:](v17, "initWithRealm:", v18);
    settings = v6->_settings;
    v6->_settings = (SOKerberosRealmSettings *)v19;

    v21 = [SOKerberosExtensionData alloc];
    objc_msgSend(v5, "extensionData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[SOKerberosExtensionData initWithDictionary:](v21, "initWithDictionary:", v22);
    extensionData = v6->_extensionData;
    v6->_extensionData = (SOKerberosExtensionData *)v23;

    v25 = [SONetworkIdentity alloc];
    objc_msgSend(v5, "realm");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[SONetworkIdentity initForRealm:bundleIdentifier:auditToken:](v25, "initForRealm:bundleIdentifier:auditToken:", v26, 0, 0);
    identity = v6->_identity;
    v6->_identity = (SONetworkIdentity *)v27;

    v29 = [SOADSiteDiscovery alloc];
    -[SOFullProfile realm](v6->_profile, "realm");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[SOADSiteDiscovery initWithRealm:](v29, "initWithRealm:", v30);
    siteDiscovery = v6->_siteDiscovery;
    v6->_siteDiscovery = (SOADSiteDiscovery *)v31;

    v33 = objc_alloc_init(SOAuthorizationWrapper);
    authWrapper = v6->_authWrapper;
    v6->_authWrapper = v33;

    v35 = objc_alloc_init(SOAuthorizationWrapper);
    receivedTGTAuthWrapper = v6->_receivedTGTAuthWrapper;
    v6->_receivedTGTAuthWrapper = v35;

    v37 = objc_alloc_init(SOAuthorizationWrapper);
    passwordSyncAuthWrapper = v6->_passwordSyncAuthWrapper;
    v6->_passwordSyncAuthWrapper = v37;

    v39 = objc_alloc_init(SOAuthorizationWrapper);
    passwordChangeAuthWrapper = v6->_passwordChangeAuthWrapper;
    v6->_passwordChangeAuthWrapper = v39;

    *(_WORD *)&v6->_authRequestPending = 0;
  }

  return v6;
}

- (BOOL)authRequestPending
{
  SOKerberosAgentContext *v2;
  BOOL authRequestPending;

  v2 = self;
  objc_sync_enter(v2);
  authRequestPending = v2->_authRequestPending;
  objc_sync_exit(v2);

  return authRequestPending;
}

- (void)setAuthRequestPending:(BOOL)a3
{
  SOKerberosAgentContext *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_authRequestPending = a3;
  objc_sync_exit(obj);

}

- (NSOperationQueue)contextNetworkWorkQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (NSOperationQueue)contextKerberosWorkQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (SOFullProfile)profile
{
  return (SOFullProfile *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProfile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (SOKerberosRealmSettings)settings
{
  return (SOKerberosRealmSettings *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SOKerberosExtensionData)extensionData
{
  return (SOKerberosExtensionData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensionData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (SONetworkIdentity)identity
{
  return (SONetworkIdentity *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (SOADSiteDiscovery)siteDiscovery
{
  return (SOADSiteDiscovery *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSiteDiscovery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (SOAuthorizationWrapper)authWrapper
{
  return (SOAuthorizationWrapper *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAuthWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (SOAuthorizationWrapper)receivedTGTAuthWrapper
{
  return (SOAuthorizationWrapper *)objc_getProperty(self, a2, 80, 1);
}

- (void)setReceivedTGTAuthWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (SOAuthorizationWrapper)passwordSyncAuthWrapper
{
  return (SOAuthorizationWrapper *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPasswordSyncAuthWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (SOAuthorizationWrapper)passwordChangeAuthWrapper
{
  return (SOAuthorizationWrapper *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPasswordChangeAuthWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)discoveryInProgress
{
  return self->_discoveryInProgress;
}

- (void)setDiscoveryInProgress:(BOOL)a3
{
  self->_discoveryInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordChangeAuthWrapper, 0);
  objc_storeStrong((id *)&self->_passwordSyncAuthWrapper, 0);
  objc_storeStrong((id *)&self->_receivedTGTAuthWrapper, 0);
  objc_storeStrong((id *)&self->_authWrapper, 0);
  objc_storeStrong((id *)&self->_siteDiscovery, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_contextKerberosWorkQueue, 0);
  objc_storeStrong((id *)&self->_contextNetworkWorkQueue, 0);
}

@end
