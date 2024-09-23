@implementation CNContactProviderSupportManager

- (CNContactProviderSupportManager)initWithAuditToken:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CNContactProviderSupportManager *v13;
  NSString *v14;
  NSString *clientBundleIdentifier;
  NSString *v16;
  _TtC8Contacts28CNContactProviderSupportHost *v17;
  _TtC8Contacts28CNContactProviderSupportHost *providerHost;
  uint64_t v19;
  CNContactProviderSupportModerator *moderator;
  void *v21;
  CNContactProviderSupportManager *v22;
  objc_super v24;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_3 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_52_1);
    v5 = CNGuardOSLog_cn_once_object_0_3;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT))
      -[CNContactProviderSupportManager initWithAuditToken:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v24.receiver = self;
  v24.super_class = (Class)CNContactProviderSupportManager;
  v13 = -[CNContactProviderSupportManager init](&v24, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D13998], "bundleIdentifierForAuditToken:", v4);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    clientBundleIdentifier = v13->_clientBundleIdentifier;
    v13->_clientBundleIdentifier = v14;
    v16 = v14;

    v17 = objc_alloc_init(_TtC8Contacts28CNContactProviderSupportHost);
    providerHost = v13->_providerHost;
    v13->_providerHost = v17;

    +[CNContactProviderSupportModerator sharedInstance](CNContactProviderSupportModerator, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    moderator = v13->_moderator;
    v13->_moderator = (CNContactProviderSupportModerator *)v19;

    objc_msgSend(MEMORY[0x1E0D13B68], "offMainThreadScheduler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "performBlock:", &__block_literal_global_49);
    v22 = v13;
  }

  return v13;
}

void __54__CNContactProviderSupportManager_initWithAuditToken___block_invoke()
{
  +[CNContactProviderSupportCache sharedCache](_TtC8Contacts29CNContactProviderSupportCache, "sharedCache");

}

+ (BOOL)isConnectionForContactProvider:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.contactsd.contact-provider"));

  return v4;
}

+ (void)invalidateCache
{
  id v2;

  +[CNContactProviderSupportCache sharedCache](_TtC8Contacts29CNContactProviderSupportCache, "sharedCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateCache");

}

- (id)requestHostDomainCommand:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v27;
  int v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v6 = a3;
  objc_msgSend(v6, "commandType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("FetchDomainEnabled"));

  if (v8)
  {
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactProviderSupportManager isProviderDomainEnabledWithBundleIdentifier:](self, "isProviderDomainEnabledWithBundleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_3:
    v11 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v6, "commandType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("FetchDomainContainerIdentifier"));

  if (v13)
  {
    -[CNContactProviderSupportManager providerContainer](self, "providerContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  objc_msgSend(v6, "commandType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("SynchronizeDomain"));

  if (v17)
  {
    objc_msgSend(v6, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    -[CNContactProviderSupportManager synchronizeProviderDomainUsingSession:error:](self, "synchronizeProviderDomainUsingSession:error:", v18, &v46);
    v11 = v46;
  }
  else
  {
    objc_msgSend(v6, "commandType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("InvalidateExtension"));

    if (v20)
    {
      objc_msgSend(v6, "domainIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      -[CNContactProviderSupportManager invalidateExtensionForDomain:bundleIdentifier:error:](self, "invalidateExtensionForDomain:bundleIdentifier:error:", v18, v21, &v45);
      v22 = v45;
    }
    else
    {
      objc_msgSend(v6, "commandType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("ResetEnumeration"));

      if (v24)
      {
        objc_msgSend(v6, "domainIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        -[CNContactProviderSupportManager resetEnumerationForDomain:bundleIdentifier:error:](self, "resetEnumerationForDomain:bundleIdentifier:error:", v18, v21, &v44);
        v22 = v44;
      }
      else
      {
        objc_msgSend(v6, "commandType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("AddDomain"));

        if ((v28 & 1) != 0)
          goto LABEL_23;
        objc_msgSend(v6, "commandType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("RemoveDomain"));

        if ((v30 & 1) != 0
          || (objc_msgSend(v6, "commandType"),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("FetchDomains")),
              v31,
              (v32 & 1) != 0))
        {
LABEL_23:
          v10 = 0;
          goto LABEL_3;
        }
        objc_msgSend(v6, "commandType");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("EnableDomain"));

        if (v34)
        {
          objc_msgSend(v6, "domainIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          -[CNContactProviderSupportManager enableDomain:bundleIdentifier:shouldSynchronize:error:](self, "enableDomain:bundleIdentifier:shouldSynchronize:error:", v18, v21, objc_msgSend(v6, "shouldSynchronize"), &v43);
          v22 = v43;
        }
        else
        {
          objc_msgSend(v6, "commandType");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("DisableDomain"));

          if (!v36)
          {
            objc_msgSend(v6, "commandType");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("FetchAllDomainsCount"));

            if (v38)
            {
              -[CNContactProviderSupportManager fetchExtensionCount](self, "fetchExtensionCount");
              v39 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v6, "commandType");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("FetchAllDomains"));

              if (!v41)
              {
                +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1002);
                v11 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_14;
              }
              -[CNContactProviderSupportManager fetchExtensionItems](self, "fetchExtensionItems");
              v39 = objc_claimAutoreleasedReturnValue();
            }
            v10 = (void *)v39;
            goto LABEL_3;
          }
          objc_msgSend(v6, "domainIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          -[CNContactProviderSupportManager disableDomain:bundleIdentifier:error:](self, "disableDomain:bundleIdentifier:error:", v18, v21, &v42);
          v22 = v42;
        }
      }
    }
    v11 = v22;

  }
LABEL_14:
  v10 = 0;
LABEL_15:
  v25 = v10;
  v15 = v25;
  if (a4 && !v25)
    *a4 = objc_retainAutorelease(v11);

LABEL_19:
  return v15;
}

- (CNContainer)providerContainer
{
  void *v3;
  void *v4;

  -[CNContactProviderSupportManager clientBundleIdentifier](self, "clientBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportManager providerContainerWithBundleIdentifier:](self, "providerContainerWithBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContainer *)v4;
}

- (id)providerContainerWithBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CNContactProviderSupportManager getActualBundleIdentifier:](self, "getActualBundleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportManager providerHost](self, "providerHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerContainerFor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)synchronizeProviderDomainUsingSession:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;

  v6 = a3;
  if (!v6)
  {
    if (CNGuardOSLog_cn_once_token_0_3 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_52_1);
    v7 = CNGuardOSLog_cn_once_object_0_3;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT))
      -[CNContactProviderSupportManager synchronizeProviderDomainUsingSession:error:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  -[CNContactProviderSupportManager moderator](self, "moderator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportManager clientBundleIdentifier](self, "clientBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportManager providerHost](self, "providerHost");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "synchronizeProviderDomainUsingSession:bundleIdentifier:providerHost:", v6, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13B60], "resultWithFuture:timeout:", v18, 1800.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isSuccess");
  if ((v20 & 1) == 0)
  {
    objc_msgSend(v19, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a4)
      *a4 = objc_retainAutorelease(v21);

  }
  return v20;
}

- (BOOL)invalidateExtensionForDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;

  v8 = a3;
  -[CNContactProviderSupportManager getActualBundleIdentifier:](self, "getActualBundleIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  -[CNContactProviderSupportManager providerHost](self, "providerHost");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorOnlyCompletionHandlerAdapter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateExtensionFor:bundleIdentifier:completionHandler:", v8, v9, v12);

  v13 = (void *)MEMORY[0x1E0D13B60];
  objc_msgSend(v10, "future");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultWithFuture:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  v17 = objc_msgSend(v16, "isSuccess");
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v16, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a5)
      *a5 = objc_retainAutorelease(v18);

  }
  return v17;
}

- (BOOL)resetEnumerationForDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;

  v8 = a3;
  -[CNContactProviderSupportManager getActualBundleIdentifier:](self, "getActualBundleIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  -[CNContactProviderSupportManager providerHost](self, "providerHost");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorOnlyCompletionHandlerAdapter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resetEnumerationFor:bundleIdentifier:completionHandler:", v8, v9, v12);

  v13 = (void *)MEMORY[0x1E0D13B60];
  objc_msgSend(v10, "future");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultWithFuture:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  v17 = objc_msgSend(v16, "isSuccess");
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v16, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a5)
      *a5 = objc_retainAutorelease(v18);

  }
  return v17;
}

- (id)isProviderDomainEnabledWithBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[CNContactProviderSupportManager providerContainerWithBundleIdentifier:](self, "providerContainerWithBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)enableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  void *v24;

  v7 = a5;
  v10 = a3;
  -[CNContactProviderSupportManager getActualBundleIdentifier:](self, "getActualBundleIdentifier:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportManager isProviderDomainEnabledWithBundleIdentifier:](self, "isProviderDomainEnabledWithBundleIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (a4)
    v14 = 0;
  else
    v14 = v13 ^ 1u;
  v15 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  -[CNContactProviderSupportManager providerHost](self, "providerHost");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorOnlyCompletionHandlerAdapter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enableExtensionFor:bundleIdentifier:showPrompt:shouldSynchronize:completionHandler:", v10, v11, v14, v7, v17);

  v18 = (void *)MEMORY[0x1E0D13B60];
  objc_msgSend(v15, "future");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resultWithFuture:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v20;
  v22 = objc_msgSend(v21, "isSuccess");
  if ((v22 & 1) == 0)
  {
    objc_msgSend(v21, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a6)
      *a6 = objc_retainAutorelease(v23);

  }
  return v22;
}

- (BOOL)disableDomain:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;

  v8 = a3;
  -[CNContactProviderSupportManager getActualBundleIdentifier:](self, "getActualBundleIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  -[CNContactProviderSupportManager providerHost](self, "providerHost");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorOnlyCompletionHandlerAdapter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "disableExtensionFor:bundleIdentifier:completionHandler:", v8, v9, v12);

  v13 = (void *)MEMORY[0x1E0D13B60];
  objc_msgSend(v10, "future");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultWithFuture:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  v17 = objc_msgSend(v16, "isSuccess");
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v16, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a5)
      *a5 = objc_retainAutorelease(v18);

  }
  return v17;
}

- (id)getActualBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  if (!v4)
  {
    -[CNContactProviderSupportManager clientBundleIdentifier](self, "clientBundleIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)fetchExtensionCount
{
  void *v2;
  void *v3;

  -[CNContactProviderSupportManager providerHost](self, "providerHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fetchExtensionItems
{
  void *v2;
  void *v3;

  -[CNContactProviderSupportManager providerHost](self, "providerHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (_TtC8Contacts28CNContactProviderSupportHost)providerHost
{
  return self->_providerHost;
}

- (void)setProviderHost:(id)a3
{
  objc_storeStrong((id *)&self->_providerHost, a3);
}

- (CNContactProviderSupportModerator)moderator
{
  return self->_moderator;
}

- (void)setModerator:(id)a3
{
  objc_storeStrong((id *)&self->_moderator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moderator, 0);
  objc_storeStrong((id *)&self->_providerHost, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
}

- (void)initWithAuditToken:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F8BD000, a1, a3, "parameter ‘cnAuditToken’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)synchronizeProviderDomainUsingSession:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F8BD000, a1, a3, "parameter ‘session’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
