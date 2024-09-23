@implementation CNContactProviderSupport

+ (CNContactProviderSupport)sharedInstance
{
  if (sharedInstance_cn_once_token_0_1 != -1)
    dispatch_once(&sharedInstance_cn_once_token_0_1, &__block_literal_global_81);
  return (CNContactProviderSupport *)(id)sharedInstance_cn_once_object_0_1;
}

void __42__CNContactProviderSupport_sharedInstance__block_invoke()
{
  CNContactProviderSupport *v0;
  void *v1;

  v0 = -[CNContactProviderSupport initWithDomainIdentifier:]([CNContactProviderSupport alloc], "initWithDomainIdentifier:", &stru_1E29FF900);
  v1 = (void *)sharedInstance_cn_once_object_0_1;
  sharedInstance_cn_once_object_0_1 = (uint64_t)v0;

}

- (CNContactProviderSupport)initWithDomainIdentifier:(id)a3
{
  id v5;
  CNContactProviderSupport *v6;
  CNContactProviderSupport *v7;
  CNContactStore *providerStore;
  uint64_t v9;
  CNXPCContactsSupport *contactsSupport;
  CNContactStoreConfiguration *v11;
  CNContactStore *v12;
  CNContactStore *v13;
  CNUnfairLock *v14;
  CNUnfairLock *lock;
  CNContactProviderSupport *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNContactProviderSupport;
  v6 = -[CNContactProviderSupport init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_domainIdentifier, a3);
    providerStore = v7->_providerStore;
    v7->_providerStore = 0;

    +[CNXPCContactsSupport sharedInstance](CNXPCContactsSupport, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    contactsSupport = v7->_contactsSupport;
    v7->_contactsSupport = (CNXPCContactsSupport *)v9;

    v11 = objc_alloc_init(CNContactStoreConfiguration);
    -[CNContactStoreConfiguration setIsContactProvider:](v11, "setIsContactProvider:", 1);
    -[CNContactStoreConfiguration setUseOutOfProcessMapperExclusively:](v11, "setUseOutOfProcessMapperExclusively:", 1);
    v12 = -[CNContactStore initWithConfiguration:]([CNContactStore alloc], "initWithConfiguration:", v11);
    v13 = v7->_providerStore;
    v7->_providerStore = v12;

    v14 = (CNUnfairLock *)objc_alloc_init(MEMORY[0x1E0D13BD8]);
    lock = v7->_lock;
    v7->_lock = v14;

    v16 = v7;
  }

  return v7;
}

- (NSString)domainContainerIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[CNContactProviderSupport isDomainEnabled](self, "isDomainEnabled"))
  {
    -[CNContactProviderSupport domainIdentifier](self, "domainIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactProviderSupportDomainCommand fetchContainerIdentifierForDomain:](CNContactProviderSupportDomainCommand, "fetchContainerIdentifierForDomain:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactProviderSupport contactsSupport](self, "contactsSupport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestProviderDomainCommand:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (BOOL)isDomainEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNContactProviderSupport domainIdentifier](self, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactProviderSupportDomainCommand fetchDomainEnabled:](CNContactProviderSupportDomainCommand, "fetchDomainEnabled:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactProviderSupport contactsSupport](self, "contactsSupport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestProviderDomainCommand:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "BOOLValue");
  return (char)v5;
}

- (CNContactStore)contactStore
{
  CNContactStore *v3;

  if (-[CNContactProviderSupport isDomainEnabled](self, "isDomainEnabled"))
    v3 = self->_providerStore;
  else
    v3 = 0;
  return v3;
}

- (void)enableDomainWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactProviderSupport domainIdentifier](self, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactProviderSupportDomainCommand enableDomain:](CNContactProviderSupportDomainCommand, "enableDomain:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactProviderSupport requestProviderDomainCommand:completionHandler:](self, "requestProviderDomainCommand:completionHandler:", v6, v4);
}

- (void)disableDomainWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactProviderSupport domainIdentifier](self, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactProviderSupportDomainCommand disableDomain:](CNContactProviderSupportDomainCommand, "disableDomain:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactProviderSupport requestProviderDomainCommand:completionHandler:](self, "requestProviderDomainCommand:completionHandler:", v6, v4);
}

- (void)synchronizeDomainUsingSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CNContactProviderSupportSession *v8;
  CNContactProviderSupportSession *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  if (!-[CNContactProviderSupport isSessionRunning](self, "isSessionRunning"))
  {
    if (v6)
      v8 = (CNContactProviderSupportSession *)v6;
    else
      v8 = objc_alloc_init(CNContactProviderSupportSession);
    v9 = v8;
    -[CNContactProviderSupport startSession:](self, "startSession:", v8);
    -[CNContactProviderSupport domainIdentifier](self, "domainIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactProviderSupportDomainCommand synchronizeDomain:usingSession:](CNContactProviderSupportDomainCommand, "synchronizeDomain:usingSession:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__CNContactProviderSupport_synchronizeDomainUsingSession_completionHandler___block_invoke;
    v12[3] = &unk_1E29FBB90;
    v12[4] = self;
    v13 = v7;
    -[CNContactProviderSupport requestProviderDomainCommand:completionHandler:](self, "requestProviderDomainCommand:completionHandler:", v11, v12);

  }
}

uint64_t __76__CNContactProviderSupport_synchronizeDomainUsingSession_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)invalidateExtensionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactProviderSupport domainIdentifier](self, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactProviderSupportDomainCommand invalidateExtensionForDomain:](CNContactProviderSupportDomainCommand, "invalidateExtensionForDomain:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactProviderSupport requestProviderDomainCommand:completionHandler:](self, "requestProviderDomainCommand:completionHandler:", v6, v4);
}

- (void)resetEnumerationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactProviderSupport domainIdentifier](self, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactProviderSupportDomainCommand resetEnumerationForDomain:](CNContactProviderSupportDomainCommand, "resetEnumerationForDomain:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactProviderSupport requestProviderDomainCommand:completionHandler:](self, "requestProviderDomainCommand:completionHandler:", v6, v4);
}

- (void)startSession:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactProviderSupport lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  CNRunWithLock();

}

uint64_t __41__CNContactProviderSupport_startSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentSession:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isSessionRunning
{
  void *v2;
  void *v3;

  -[CNContactProviderSupport lock](self, "lock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNResultWithLock();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

id __44__CNContactProviderSupport_isSessionRunning__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithInt:", v2 != 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)endSession
{
  void *v2;

  -[CNContactProviderSupport lock](self, "lock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNRunWithLock();

}

uint64_t __38__CNContactProviderSupport_endSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentSession:", 0);
}

+ (BOOL)addDomain:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[CNContactProviderSupport sharedInstance](CNContactProviderSupport, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "addDomain:error:", v5, a4);

  return (char)a4;
}

+ (BOOL)removeDomain:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[CNContactProviderSupport sharedInstance](CNContactProviderSupport, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "removeDomain:error:", v5, a4);

  return (char)a4;
}

+ (id)domainsWithError:(id *)a3
{
  void *v4;
  void *v5;

  +[CNContactProviderSupport sharedInstance](CNContactProviderSupport, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainsWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)allDomainsCountWithError:(id *)a3
{
  void *v4;
  int64_t v5;

  +[CNContactProviderSupport sharedInstance](CNContactProviderSupport, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allDomainsCountWithError:", a3);

  return v5;
}

+ (id)allDomainsWithError:(id *)a3
{
  void *v4;
  void *v5;

  +[CNContactProviderSupport sharedInstance](CNContactProviderSupport, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allDomainsWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)enableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;

  v7 = a5;
  v9 = a4;
  v10 = a3;
  +[CNContactProviderSupport sharedInstance](CNContactProviderSupport, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "instanceEnableDomain:bundleIdentifier:shouldSynchronize:error:", v10, v9, v7, a6);

  return (char)a6;
}

+ (BOOL)disableDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  +[CNContactProviderSupport sharedInstance](CNContactProviderSupport, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "instanceDisableDomain:bundleIdentifier:error:", v8, v7, a5);

  return (char)a5;
}

- (BOOL)addDomain:(id)a3 error:(id *)a4
{
  void *v6;

  +[CNContactProviderSupportDomainCommand addDomain:](CNContactProviderSupportDomainCommand, "addDomain:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CNContactProviderSupport requestProviderDomainCommand:error:](self, "requestProviderDomainCommand:error:", v6, a4);

  return (char)a4;
}

- (BOOL)removeDomain:(id)a3 error:(id *)a4
{
  void *v6;

  +[CNContactProviderSupportDomainCommand removeDomain:](CNContactProviderSupportDomainCommand, "removeDomain:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CNContactProviderSupport requestProviderDomainCommand:error:](self, "requestProviderDomainCommand:error:", v6, a4);

  return (char)a4;
}

- (id)domainsWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNContactProviderSupport domainIdentifier](self, "domainIdentifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactProviderSupportDomainCommand fetchDomainEnabled:](CNContactProviderSupportDomainCommand, "fetchDomainEnabled:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactProviderSupport contactsSupport](self, "contactsSupport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestProviderDomainCommand:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)allDomainsCountWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  id v11;

  +[CNContactProviderSupportDomainCommand fetchAllDomainsCount](CNContactProviderSupportDomainCommand, "fetchAllDomainsCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupport contactsSupport](self, "contactsSupport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "requestProviderDomainCommand:error:", v5, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (a3)
    *a3 = objc_retainAutorelease(v8);
  if (v7)
    v9 = objc_msgSend(v7, "integerValue");
  else
    v9 = 0;

  return v9;
}

- (id)allDomainsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v12;

  +[CNContactProviderSupportDomainCommand fetchAllDomains](CNContactProviderSupportDomainCommand, "fetchAllDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupport contactsSupport](self, "contactsSupport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "requestProviderDomainCommand:error:", v5, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  v9 = v7;
  v10 = v9;
  if (a3 && !v9)
    *a3 = objc_retainAutorelease(v8);

  return v10;
}

- (BOOL)instanceEnableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5 error:(id *)a6
{
  void *v8;

  +[CNContactProviderSupportDomainCommand enableDomain:bundleIdentifier:shouldSynchronize:](CNContactProviderSupportDomainCommand, "enableDomain:bundleIdentifier:shouldSynchronize:", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[CNContactProviderSupport requestProviderDomainCommand:error:](self, "requestProviderDomainCommand:error:", v8, a6);

  return (char)a6;
}

- (BOOL)instanceDisableDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  void *v7;

  +[CNContactProviderSupportDomainCommand disableDomain:bundleIdentifier:](CNContactProviderSupportDomainCommand, "disableDomain:bundleIdentifier:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[CNContactProviderSupport requestProviderDomainCommand:error:](self, "requestProviderDomainCommand:error:", v7, a5);

  return (char)a5;
}

- (BOOL)requestProviderDomainCommand:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v11;

  v6 = a3;
  -[CNContactProviderSupport contactsSupport](self, "contactsSupport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = (id)objc_msgSend(v7, "requestProviderDomainCommand:error:", v6, &v11);
  v9 = v11;

  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);

  return v9 == 0;
}

- (void)requestProviderDomainCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D13B68], "offMainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__CNContactProviderSupport_requestProviderDomainCommand_completionHandler___block_invoke;
  v11[3] = &unk_1E29FBBB8;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "performBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __75__CNContactProviderSupport_requestProviderDomainCommand_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "contactsSupport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v5 = (id)objc_msgSend(v3, "requestProviderDomainCommand:error:", v4, &v8);
  v6 = v8;

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);

}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (CNContactStore)providerStore
{
  return self->_providerStore;
}

- (void)setProviderStore:(id)a3
{
  objc_storeStrong((id *)&self->_providerStore, a3);
}

- (CNXPCContactsSupport)contactsSupport
{
  return self->_contactsSupport;
}

- (void)setContactsSupport:(id)a3
{
  objc_storeStrong((id *)&self->_contactsSupport, a3);
}

- (CNUnfairLock)lock
{
  return (CNUnfairLock *)objc_getProperty(self, a2, 32, 1);
}

- (CNContactProviderSupportSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_contactsSupport, 0);
  objc_storeStrong((id *)&self->_providerStore, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end
