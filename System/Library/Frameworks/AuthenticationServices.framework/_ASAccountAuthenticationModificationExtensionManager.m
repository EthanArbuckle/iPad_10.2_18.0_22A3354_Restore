@implementation _ASAccountAuthenticationModificationExtensionManager

- (_ASAccountAuthenticationModificationExtensionManager)init
{
  id v2;
  id v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_ASAccountAuthenticationModificationExtensionManager;
  v2 = -[_ASAccountAuthenticationModificationExtensionManager init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.AuthenticationServices.%@.%p"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.AuthenticationServices.ReadOnly.%@.%p"), objc_opt_class(), v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create_with_target_V2((const char *)objc_msgSend(v6, "UTF8String"), 0, *((dispatch_queue_t *)v2 + 1));
    v8 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v7;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v9;

    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v11;

    v13 = v2;
  }

  return (_ASAccountAuthenticationModificationExtensionManager *)v2;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_extensionMatchingToken)
    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:");
  v3.receiver = self;
  v3.super_class = (Class)_ASAccountAuthenticationModificationExtensionManager;
  -[_ASAccountAuthenticationModificationExtensionManager dealloc](&v3, sel_dealloc);
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69___ASAccountAuthenticationModificationExtensionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedManager;
}

- (void)_beginExtensionDiscovery
{
  void *v3;
  void *v4;
  void *v5;
  id extensionMatchingToken;
  _QWORD v7[4];
  id v8;
  id location;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_extensionMatchingToken)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x24BDD1550];
    v10 = *MEMORY[0x24BDD0C48];
    v11[0] = *MEMORY[0x24BE83088];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke;
    v7[3] = &unk_24C94F968;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "beginMatchingExtensionsWithAttributes:completion:", v4, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    extensionMatchingToken = self->_extensionMatchingToken;
    self->_extensionMatchingToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_endExtensionDiscovery
{
  id extensionMatchingToken;
  NSDictionary *domainToExtension;
  NSArray *extensions;

  if (self->_extensionMatchingToken)
  {
    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:");
    extensionMatchingToken = self->_extensionMatchingToken;
    self->_extensionMatchingToken = 0;

    domainToExtension = self->_domainToExtension;
    self->_domainToExtension = 0;

    extensions = self->_extensions;
    self->_extensions = 0;

  }
}

- (void)_buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *dataConstructionQueue;
  id v18;
  _ASAccountAuthenticationModificationExtensionManager *v19;
  uint64_t v20;
  _QWORD block[5];
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v19 = self;
  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    v20 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x24BE83038];
        objc_msgSend(v10, "domain", v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "domainByStrippingSubdomainWildcardPrefixIfNecessary:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(MEMORY[0x24BE83038], "domainIsProhibitedForSavingCredentials:", v13) & 1) == 0)
        {
          objc_msgSend(v13, "safari_highLevelDomainFromHost");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14
            && (!objc_msgSend(MEMORY[0x24BE83038], "highLevelDomainHasSuiteOfAssociatedApps:", v14)
             || objc_msgSend(v10, "service") == 7))
          {
            v23 = 0;
            objc_msgSend(v10, "appID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();

            v16 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              -[_ASAccountAuthenticationModificationExtensionManager _buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries:].cold.1(v28, v16, v10, &v29);
            v8 = v20;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v7);
  }

  dataConstructionQueue = v19->_dataConstructionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __129___ASAccountAuthenticationModificationExtensionManager__buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries___block_invoke;
  block[3] = &unk_24C94F5F8;
  block[4] = v19;
  v22 = v4;
  v18 = v4;
  dispatch_async(dataConstructionQueue, block);

}

- (void)extensionForDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  NSObject *readOnlyQueue;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[NSUserDefaults BOOLForKey:](self->_mobileSafariUserDefaults, "BOOLForKey:", CFSTR("EnableSFAppAccountAuthenticationModificationExtension"));
  if (!objc_msgSend(v6, "containsString:", CFSTR("apple.com")) || v8)
  {
    objc_initWeak(&location, self);
    readOnlyQueue = self->_readOnlyQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __93___ASAccountAuthenticationModificationExtensionManager_extensionForDomain_completionHandler___block_invoke;
    v10[3] = &unk_24C94F990;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    v11 = v6;
    dispatch_async(readOnlyQueue, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)addChangeObserver:(id)a3
{
  id v4;
  NSObject *dataConstructionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dataConstructionQueue = self->_dataConstructionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74___ASAccountAuthenticationModificationExtensionManager_addChangeObserver___block_invoke;
  v7[3] = &unk_24C94F5F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dataConstructionQueue, v7);

}

- (void)removeChangeObserver:(id)a3
{
  id v4;
  NSObject *dataConstructionQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dataConstructionQueue = self->_dataConstructionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77___ASAccountAuthenticationModificationExtensionManager_removeChangeObserver___block_invoke;
  block[3] = &unk_24C94F5F8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dataConstructionQueue, block);

}

- (void)_notifyObservers:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _ASAccountAuthenticationModificationExtensionManager *v9;

  v4 = (void *)objc_msgSend(a3, "copy");
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73___ASAccountAuthenticationModificationExtensionManager__notifyObservers___block_invoke;
  v7[3] = &unk_24C94F5F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileSafariUserDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_domainToExtension, 0);
  objc_storeStrong(&self->_extensionMatchingToken, 0);
  objc_storeStrong((id *)&self->_readOnlyQueue, 0);
  objc_storeStrong((id *)&self->_dataConstructionQueue, 0);
}

- (void)_buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "appID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl(&dword_20E4D9000, v7, OS_LOG_TYPE_ERROR, "Could not retrieve bundle identifier from %@", a1, 0xCu);

}

@end
