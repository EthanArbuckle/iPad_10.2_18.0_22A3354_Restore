@implementation _ASWebsiteNameProvider

- (_ASWebsiteNameProvider)init
{
  return (_ASWebsiteNameProvider *)-[_ASWebsiteNameProvider _initWithShouldLoadQuirksList:](self, "_initWithShouldLoadQuirksList:", 0);
}

- (id)initForPasswordManager
{
  return -[_ASWebsiteNameProvider _initWithShouldLoadQuirksList:](self, "_initWithShouldLoadQuirksList:", 1);
}

- (id)test_initWithWebsiteNameDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = -[_ASWebsiteNameProvider _initWithShouldLoadQuirksList:](self, "_initWithShouldLoadQuirksList:", 0);
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (id)_initWithShouldLoadQuirksList:(BOOL)a3
{
  _BOOL4 v3;
  _ASWebsiteNameProvider *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  void *v13;
  void *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *databaseQueue;
  uint64_t v18;
  WBSSQLiteDatabase *database;
  uint64_t v20;
  NSOperationQueue *websiteFetchingQueue;
  void *v22;
  uint64_t v23;
  WBSPasswordManagerWebsiteMetadataStore *websiteMetadataStore;
  NSMutableDictionary *v25;
  NSMutableDictionary *cachedWebsiteNamesFromDatabase;
  NSMutableDictionary *v27;
  NSMutableDictionary *cachedWebsiteNamesFromKeychain;
  uint64_t v29;
  WBSPrivacyProxyAvailabilityManager *availabilityManager;
  id *v31;
  void *v32;
  id v33;
  void *v34;
  dispatch_queue_t v35;
  OS_dispatch_queue *internalQueueForCachedWebsiteNames;
  _ASWebsiteNameProvider *v37;
  id result;
  void *v39;
  void *v40;
  objc_super v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v3 = a3;
  v41.receiver = self;
  v41.super_class = (Class)_ASWebsiteNameProvider;
  v4 = -[_ASWebsiteNameProvider init](&v41, sel_init);
  if (!v4)
    goto LABEL_17;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "as_authenticationServicesBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("WebsiteNamesForPasswordManager"), CFSTR("json"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x24BE82D88]);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_autoFillQuirksDownloadDirectoryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = objc_msgSend(v7, "initWithDataFormat:builtInListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:", 1, v6, v9, CFSTR("WebsiteNamesForPasswordManager"), CFSTR("1"), CFSTR("WebsiteNameProviderLastUpdateTime"), 86400.0, v10, objc_opt_class());
    remotelyUpdatableDataController = v4->_remotelyUpdatableDataController;
    v4->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v11;

    -[WBSRemotelyUpdatableDataController setDelegate:](v4->_remotelyUpdatableDataController, "setDelegate:", v4);
    -[WBSRemotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:](v4->_remotelyUpdatableDataController, "setShouldAttemptToUpdateConfiguration:", 1);
    objc_msgSend(MEMORY[0x24BDD1488], "as_authenticationServicesBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLForResource:withExtension:", CFSTR("WebsiteNamesForPasswordManager"), CFSTR("sqlite"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(17, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create_with_target_V2("com.apple.AuthenticationServices._ASWebsiteNameProvider._databaseQueue", 0, v15);
    databaseQueue = v4->_databaseQueue;
    v4->_databaseQueue = (OS_dispatch_queue *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE82D90]), "initWithURL:queue:", v14, v4->_databaseQueue);
    database = v4->_database;
    v4->_database = (WBSSQLiteDatabase *)v18;

  }
  v20 = objc_opt_new();
  websiteFetchingQueue = v4->_websiteFetchingQueue;
  v4->_websiteFetchingQueue = (NSOperationQueue *)v20;

  -[NSOperationQueue setQualityOfService:](v4->_websiteFetchingQueue, "setQualityOfService:", 17);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.%@.%p.websiteFetchingQueue"), objc_opt_class(), v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue setName:](v4->_websiteFetchingQueue, "setName:", v22);

  -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_websiteFetchingQueue, "setMaxConcurrentOperationCount:", 3);
  v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE82D38]), "initWithMetadataEntryClass:", objc_opt_class());
  websiteMetadataStore = v4->_websiteMetadataStore;
  v4->_websiteMetadataStore = (WBSPasswordManagerWebsiteMetadataStore *)v23;

  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  cachedWebsiteNamesFromDatabase = v4->_cachedWebsiteNamesFromDatabase;
  v4->_cachedWebsiteNamesFromDatabase = v25;

  v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  cachedWebsiteNamesFromKeychain = v4->_cachedWebsiteNamesFromKeychain;
  v4->_cachedWebsiteNamesFromKeychain = v27;

  if (isProcessAllowedToFetchWebsiteNames(void)::onceToken != -1)
    dispatch_once(&isProcessAllowedToFetchWebsiteNames(void)::onceToken, &__block_literal_global_238);
  if (!isProcessAllowedToFetchWebsiteNames(void)::isProcessAllowedToFetchWebsiteNames)
  {
LABEL_16:
    -[_ASWebsiteNameProvider _suspendOrResumeWebsiteFetchingOperationQueue](v4, "_suspendOrResumeWebsiteFetchingOperationQueue");
    v35 = dispatch_queue_create("com.apple.AuthenticationServices._ASWebsiteNameProvider", 0);
    internalQueueForCachedWebsiteNames = v4->_internalQueueForCachedWebsiteNames;
    v4->_internalQueueForCachedWebsiteNames = (OS_dispatch_queue *)v35;

    v37 = v4;
LABEL_17:

    return v4;
  }
  getWBSPrivacyProxyAvailabilityManagerClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(getWBSPrivacyProxyAvailabilityManagerClass(), "sharedManager");
    v29 = objc_claimAutoreleasedReturnValue();
    availabilityManager = v4->_availabilityManager;
    v4->_availabilityManager = (WBSPrivacyProxyAvailabilityManager *)v29;
  }
  else
  {
    availabilityManager = v4->_availabilityManager;
    v4->_availabilityManager = 0;
  }

  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v31 = (id *)getWBSPrivacyProxyChangeNotificationSymbolLoc(void)::ptr;
  v45 = getWBSPrivacyProxyChangeNotificationSymbolLoc(void)::ptr;
  if (!getWBSPrivacyProxyChangeNotificationSymbolLoc(void)::ptr)
  {
    v32 = SafariSharedUILibrary();
    v31 = (id *)dlsym(v32, "WBSPrivacyProxyChangeNotification");
    v43[3] = (uint64_t)v31;
    getWBSPrivacyProxyChangeNotificationSymbolLoc(void)::ptr = (uint64_t)v31;
  }
  _Block_object_dispose(&v42, 8);
  if (v31)
  {
    v33 = *v31;
    if (v33)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObserver:selector:name:object:", v4, sel__privacyProxyDidChange_, v33, v4->_availabilityManager);

    }
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNotificationName getWBSPrivacyProxyChangeNotification()");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("_ASSafariSharedUISoftLinking.h"), 24, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)prewarm
{
  WBSPasswordManagerWebsiteMetadataStore *websiteMetadataStore;
  _QWORD v3[5];

  websiteMetadataStore = self->_websiteMetadataStore;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33___ASWebsiteNameProvider_prewarm__block_invoke;
  v3[3] = &unk_24C950298;
  v3[4] = self;
  -[WBSPasswordManagerWebsiteMetadataStore allMetadataWithCompletionHandler:](websiteMetadataStore, "allMetadataWithCompletionHandler:", v3);
}

- (void)dealloc
{
  WBSSQLiteDatabase *v3;
  WBSSQLiteDatabase *v4;
  NSObject *databaseQueue;
  objc_super v6;
  _QWORD block[4];
  WBSSQLiteDatabase *v8;

  -[WBSRemotelyUpdatableDataController prepareForTermination](self->_remotelyUpdatableDataController, "prepareForTermination");
  v3 = self->_database;
  v4 = v3;
  if (v3)
  {
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33___ASWebsiteNameProvider_dealloc__block_invoke;
    block[3] = &unk_24C9502C0;
    v8 = v3;
    dispatch_async(databaseQueue, block);

  }
  v6.receiver = self;
  v6.super_class = (Class)_ASWebsiteNameProvider;
  -[_ASWebsiteNameProvider dealloc](&v6, sel_dealloc);
}

- (void)beginLoadingBuiltInAndRemotelyUpdatableWebsiteNames
{
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  _QWORD v3[5];

  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __77___ASWebsiteNameProvider_beginLoadingBuiltInAndRemotelyUpdatableWebsiteNames__block_invoke;
  v3[3] = &unk_24C9502E8;
  v3[4] = self;
  -[WBSRemotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:](remotelyUpdatableDataController, "accessSnapshotLoadingItIfNeeded:", v3);
}

- (void)prepareForTermination
{
  -[WBSRemotelyUpdatableDataController prepareForTermination](self->_remotelyUpdatableDataController, "prepareForTermination");
}

- (void)test_waitUntilBuiltInAndRemotelyUpdatableWebsiteNamesAreLoaded
{
  -[WBSRemotelyUpdatableDataController accessCurrentSnapshot:](self->_remotelyUpdatableDataController, "accessCurrentSnapshot:", &__block_literal_global_11);
}

- (void)debug_fetchWebsiteNamesForDomains:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _ASWebsiteNameFetchOperation *v12;
  NSOperationQueue *websiteFetchingQueue;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSOperationQueue setSuspended:](self->_websiteFetchingQueue, "setSuspended:", 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        v12 = -[_ASWebsiteNameFetchOperation initWithDomain:metadataEntry:provider:]([_ASWebsiteNameFetchOperation alloc], "initWithDomain:metadataEntry:provider:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11), 0, self);
        -[NSOperationQueue addOperation:](self->_websiteFetchingQueue, "addOperation:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  objc_initWeak(&location, self);
  websiteFetchingQueue = self->_websiteFetchingQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78___ASWebsiteNameProvider_debug_fetchWebsiteNamesForDomains_completionHandler___block_invoke;
  v15[3] = &unk_24C950350;
  objc_copyWeak(&v17, &location);
  v14 = v7;
  v16 = v14;
  -[NSOperationQueue addBarrierBlock:](websiteFetchingQueue, "addBarrierBlock:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)setIsForTesting:(BOOL)a3
{
  if (self->_isForTesting != a3)
  {
    self->_isForTesting = a3;
    if (a3)
      -[NSOperationQueue setSuspended:](self->_websiteFetchingQueue, "setSuspended:", 0);
  }
}

- (void)debug_deleteAllPersistedData
{
  -[WBSPasswordManagerWebsiteMetadataStore debug_deleteAllPersistedDataWithCompletionHandler:](self->_websiteMetadataStore, "debug_deleteAllPersistedDataWithCompletionHandler:", &__block_literal_global_100);
}

+ (id)_undesirableCharactersCharacterSet
{
  void *v2;

  {
    v2 = (void *)+[_ASWebsiteNameProvider _undesirableCharactersCharacterSet]::undesirableCharactersCharacterSet;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("©®™℠"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASWebsiteNameProvider _undesirableCharactersCharacterSet]::undesirableCharactersCharacterSet = (uint64_t)v2;
  }
  return v2;
}

+ (id)_bestTitleFromCandidateTitles:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56___ASWebsiteNameProvider__bestTitleFromCandidateTitles___block_invoke;
  v10[3] = &__block_descriptor_40_e18_q16__0__NSString_8l;
  v10[4] = a1;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56___ASWebsiteNameProvider__bestTitleFromCandidateTitles___block_invoke_2;
  v8[3] = &unk_24C9503D8;
  v9 = (id)MEMORY[0x212BBEFEC](v10);
  v5 = v9;
  objc_msgSend(v4, "safari_maximumUsingComparator:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)siteNameForDomain:(id)a3 fromBusinessName:(id)a4 title:(id)a5 openGraphSiteName:(id)a6 applicationName:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;

  v12 = a4;
  v29 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x24BDBCF48];
  v28 = v12;
  objc_msgSend(CFSTR("https://"), "stringByAppendingString:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLWithString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "_siteNameFromTitle:withURL:", v12, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_candidateWebsiteNameHasObviousFlaw:", v19) & 1) == 0)
  {
    objc_msgSend(a1, "_trimErrantLeadingAndTrailingCharacters:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v20);

  }
  v21 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
  objc_msgSend(v21, "setOriginalURL:", v17);
  objc_msgSend(v21, "setTitle:", v29);
  objc_msgSend(v21, "setSiteName:", v13);
  objc_msgSend(a1, "_candidateWebsiteNameForLinkMetadata:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_candidateWebsiteNameHasObviousFlaw:", v22) & 1) == 0)
  {
    objc_msgSend(a1, "_trimErrantLeadingAndTrailingCharacters:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v23);

  }
  objc_msgSend(a1, "_siteNameFromTitle:withURL:", v14, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_candidateWebsiteNameHasObviousFlaw:", v24) & 1) == 0)
  {
    objc_msgSend(a1, "_trimErrantLeadingAndTrailingCharacters:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v25);

  }
  objc_msgSend(a1, "_bestTitleFromCandidateTitles:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (void)fetchWebsiteNameForDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDDA8C0]);
  objc_msgSend(v8, "setTimeout:", 5.0);
  objc_msgSend(v8, "setShouldFetchSubresources:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "setRequirePrivateRelayForAllNetworkTraffic:", 1);
  v9 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(CFSTR("https://"), "stringByAppendingString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[_ASWebsiteNameProvider fetchWebsiteNameForDomain:completionHandler:].cold.1((uint64_t)v6, v12);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke;
  v15[3] = &unk_24C950400;
  v13 = v6;
  v16 = v13;
  v14 = v7;
  v17 = v14;
  v18 = a1;
  objc_msgSend(v8, "startFetchingMetadataForURL:completionHandler:", v11, v15);

}

+ (id)_candidateWebsiteNameForLinkMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "siteName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "originalURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_siteNameFromOpenGraphSiteName:withURL:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = v7;
    else
      v8 = v5;
    v9 = v8;
  }
  else
  {
    objc_msgSend(v4, "originalTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v9 = 0;
        goto LABEL_10;
      }
    }
    objc_msgSend(v4, "originalURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_siteNameFromTitle:withURL:", v7, v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v9;
}

+ (BOOL)_candidateWebsiteNameHasObviousFlaw:(id)a3
{
  id v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 - 33 >= 0xFFFFFFFFFFFFFFE0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(&unk_24C96DF30, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v7)
    {
      v5 = 0;
      goto LABEL_3;
    }
    v8 = *(_QWORD *)v16;
LABEL_6:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(&unk_24C96DF30);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      v11 = objc_msgSend(v10, "length");
      if (v4 >= v11)
      {
        objc_msgSend(v3, "substringToIndex:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v10, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(&unk_24C96DF30, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v5 = 0;
        if (v7)
          goto LABEL_6;
        goto LABEL_3;
      }
    }
  }
  v5 = 1;
LABEL_3:

  return v5;
}

+ (id)_trimErrantLeadingAndTrailingCharacters:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "safari_stringByTrimmingWhitespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_commonTitleDelimiters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = (void *)+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::prefixesToRemove;
  if (!+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::prefixesToRemove)
  {
    objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_127);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::prefixesToRemove;
    +[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::prefixesToRemove = v9;

    v7 = (void *)+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::prefixesToRemove;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(v4, "safari_substringFromPrefix:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {

          v4 = (void *)v15;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_13:

  if (!+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::suffixesToRemove)
  {
    objc_msgSend(a1, "_commonTitleDelimiters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safari_mapObjectsUsingBlock:", &__block_literal_global_128);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::suffixesToRemove;
    +[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::suffixesToRemove = v18;

  }
  v20 = objc_msgSend(v4, "length");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = (id)+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::suffixesToRemove;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v33;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        v26 = objc_msgSend(v25, "length");
        v27 = v20 - v26;
        if (v20 > v26)
        {
          objc_msgSend(v4, "substringFromIndex:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v25, "isEqualToString:", v28);

          if (v29)
          {
            objc_msgSend(v4, "substringWithRange:", 0, v27);
            v30 = objc_claimAutoreleasedReturnValue();

            v4 = (void *)v30;
            goto LABEL_26;
          }
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_26:

  return v4;
}

+ (id)websiteNameForLinkMetadata:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_candidateWebsiteNameForLinkMetadata:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_candidateWebsiteNameHasObviousFlaw:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "_trimErrantLeadingAndTrailingCharacters:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_siteNameFromOpenGraphSiteName:(id)a3 withURL:(id)a4
{
  objc_msgSend(a1, "_siteNameFromTitleLikeString:withURL:useHostAndTitlePrefixMatch:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_siteNameFromTitle:(id)a3 withURL:(id)a4
{
  objc_msgSend(a1, "_siteNameFromTitleLikeString:withURL:useHostAndTitlePrefixMatch:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_siteNameFromTitleLikeString:(id)a3 withURL:(id)a4 useHostAndTitlePrefixMatch:(BOOL)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  float v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  float v33;
  void *v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  void *v40;
  float v41;
  float v42;
  void *v43;
  id v44;
  void *v45;
  unint64_t v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  char v54;
  _BOOL4 v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v55 = a5;
  v67 = *MEMORY[0x24BDAC8D0];
  v60 = a3;
  v56 = a4;
  objc_msgSend(v56, "_lp_highLevelDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v56, "_lp_simplifiedStringForDisplayOnly:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "lowercaseString");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  objc_msgSend(v61, "_lp_hostByStrippingTopLevelDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend(a1, "_commonTitleDelimiters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (!v11)
  {

    v57 = 0;
    goto LABEL_37;
  }
  v57 = 0;
  v58 = *(_QWORD *)v63;
  v12 = 0.0;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v63 != v58)
        objc_enumerationMutation(v10);
      objc_msgSend(v60, "componentsSeparatedByString:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      if (v15 >= 3)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "lowercaseString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v17) = objc_msgSend(v19, "isEqualToString:", v9);

        if ((v17 & 1) != 0)
        {
          v22 = v18;
        }
        else
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v15 - 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v21 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "lowercaseString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v21) = objc_msgSend(v23, "isEqualToString:", v9);

          if ((v21 & 1) == 0)
          {

            goto LABEL_14;
          }

        }
        goto LABEL_44;
      }
LABEL_14:
      if (objc_msgSend(v14, "count") == 2)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByTrimmingCharactersInSet:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "lowercaseString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lowercaseString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_lp_similarityToString:", v61);
        v32 = v31;
        objc_msgSend(v29, "_lp_similarityToString:", v9);
        if (v32 <= v33)
          v34 = v9;
        else
          v34 = v61;
        objc_msgSend(v29, "_lp_similarityToString:", v34);
        v36 = v35;
        objc_msgSend(v30, "_lp_similarityToString:", v61);
        v38 = v37;
        objc_msgSend(v30, "_lp_similarityToString:", v9);
        if (v38 <= v39)
          v40 = v9;
        else
          v40 = v61;
        objc_msgSend(v30, "_lp_similarityToString:", v40);
        if (v36 <= v41)
          v42 = v41;
        else
          v42 = v36;
        if (v42 <= v12)
        {
          v42 = v12;
        }
        else
        {
          if (v36 <= v41)
            v43 = v28;
          else
            v43 = v26;
          v44 = v43;

          v57 = v44;
        }

        v12 = v42;
      }

      v10 = v59;
    }
    v11 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    if (v11)
      continue;
    break;
  }

  if (v57 && v12 >= 0.6)
  {
    v22 = v57;

    goto LABEL_45;
  }
LABEL_37:
  objc_msgSend(v61, "uppercaseString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v45, "isEqualToString:", v60) & 1) == 0 && (objc_msgSend(v61, "isEqualToString:", v60) & 1) == 0)
  {
    v47 = objc_msgSend(v60, "length");
    if (v47 >= objc_msgSend(v61, "length"))
    {
      objc_msgSend(v60, "substringToIndex:", objc_msgSend(v61, "length"));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lowercaseString");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isEqualToString:", v61);

      if ((v49 & 1) != 0)
        goto LABEL_40;

    }
    objc_msgSend(v60, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C955390);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "lowercaseString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v51, "isEqualToString:", v9))
    {
      v22 = v60;
LABEL_56:

      goto LABEL_40;
    }
    if (v55)
    {
      v52 = objc_msgSend(v60, "length");
      if (v52 >= objc_msgSend(v9, "length"))
      {
        objc_msgSend(v60, "substringToIndex:", objc_msgSend(v9, "length"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lowercaseString");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isEqualToString:", v9);

        if ((v54 & 1) != 0)
          goto LABEL_56;

      }
    }
    v22 = 0;
    goto LABEL_56;
  }
  v22 = 0;
LABEL_40:

LABEL_44:
LABEL_45:

  return v22;
}

+ (id)_commonTitleDelimiters
{
  return &unk_24C96DF48;
}

- (BOOL)_openDatabaseIfNeeded
{
  NSObject *databaseQueue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (!self->_database)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  databaseQueue = self->_databaseQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47___ASWebsiteNameProvider__openDatabaseIfNeeded__block_invoke;
  v5[3] = &unk_24C950488;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(databaseQueue, v5);
  v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setWebsiteNameConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_websiteNameConsumer, a3);
  -[_ASWebsiteNameProvider _suspendOrResumeWebsiteFetchingOperationQueue](self, "_suspendOrResumeWebsiteFetchingOperationQueue");
}

- (id)knownWebsiteNameForDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *internalQueueForCachedWebsiteNames;
  uint64_t v10;
  id v11;
  NSObject *databaseQueue;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  WBSPasswordManagerWebsiteMetadataStore *websiteMetadataStore;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD block[5];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[_ASWebsiteNameDictionary websiteNameForDomain:](self->_websiteNameDictionary, "websiteNameForDomain:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
LABEL_22:

      goto LABEL_23;
    }
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__0;
    v42 = __Block_byref_object_dispose__0;
    v43 = 0;
    internalQueueForCachedWebsiteNames = self->_internalQueueForCachedWebsiteNames;
    v10 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke;
    block[3] = &unk_24C9504B0;
    v37 = &v38;
    block[4] = self;
    v11 = v4;
    v36 = v11;
    dispatch_sync(internalQueueForCachedWebsiteNames, block);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (id)v39[5];
LABEL_21:

      _Block_object_dispose(&v38, 8);
      goto LABEL_22;
    }
    if (-[_ASWebsiteNameProvider _openDatabaseIfNeeded](self, "_openDatabaseIfNeeded"))
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__0;
      v33 = __Block_byref_object_dispose__0;
      v34 = 0;
      databaseQueue = self->_databaseQueue;
      v26[0] = v10;
      v26[1] = 3221225472;
      v26[2] = __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_2;
      v26[3] = &unk_24C9504D8;
      v26[4] = self;
      v13 = v11;
      v27 = v13;
      v28 = &v29;
      dispatch_sync(databaseQueue, v26);
      -[_ASWebsiteNameProvider _cacheDatabaseBackedWebsiteName:forDomain:](self, "_cacheDatabaseBackedWebsiteName:forDomain:", v30[5], v13);
      v14 = (void *)v30[5];
      if (v14)
      {
        v7 = v14;
        v15 = v27;
LABEL_20:

        _Block_object_dispose(&v29, 8);
        goto LABEL_21;
      }

      _Block_object_dispose(&v29, 8);
      v10 = MEMORY[0x24BDAC760];
    }
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__0;
    v33 = __Block_byref_object_dispose__0;
    v34 = 0;
    v16 = self->_internalQueueForCachedWebsiteNames;
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_3;
    v23[3] = &unk_24C9504B0;
    v25 = &v29;
    v23[4] = self;
    v17 = v11;
    v24 = v17;
    dispatch_sync(v16, v23);
    if (v30[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = (void *)v30[5];
      else
        v18 = 0;
      v7 = v18;
    }
    else
    {
      websiteMetadataStore = self->_websiteMetadataStore;
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_4;
      v21[3] = &unk_24C950500;
      v21[4] = self;
      v22 = v17;
      -[WBSPasswordManagerWebsiteMetadataStore metadataForDomain:completionHandler:](websiteMetadataStore, "metadataForDomain:completionHandler:", v22, v21);

      v7 = 0;
    }
    v15 = v24;
    goto LABEL_20;
  }
  v8 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_ASWebsiteNameProvider knownWebsiteNameForDomain:].cold.1(v8);
  v7 = 0;
LABEL_23:

  return v7;
}

- (void)fetchOperation:(id)a3 finishedWithResult:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _ASWebsiteNameProvider *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71___ASWebsiteNameProvider_fetchOperation_finishedWithResult_completion___block_invoke;
  v14[3] = &unk_24C950550;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

- (void)_processFetchedMetadataEntry:(id)a3 forDomain:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  _ASWebsiteNameFetchOperation *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v17 = a3;
  v6 = a4;
  objc_msgSend(v17, "websiteName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASWebsiteNameProvider _cacheFetchedAndKeychainBackedWebsiteName:forDomain:](self, "_cacheFetchedAndKeychainBackedWebsiteName:forDomain:", v7, v6);

  if (isProcessAllowedToFetchWebsiteNames(void)::onceToken != -1)
    dispatch_once(&isProcessAllowedToFetchWebsiteNames(void)::onceToken, &__block_literal_global_238);
  if (isProcessAllowedToFetchWebsiteNames(void)::isProcessAllowedToFetchWebsiteNames)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, -7, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "websiteNameDateLastRefreshed");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11 || (objc_msgSend(v11, "safari_isEarlierThanDate:", v10) & 1) != 0)
    {
      -[NSOperationQueue operations](self->_websiteFetchingQueue, "operations", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __65___ASWebsiteNameProvider__processFetchedMetadataEntry_forDomain___block_invoke;
      v18[3] = &unk_24C950578;
      v14 = v6;
      v19 = v14;
      v15 = objc_msgSend(v13, "safari_containsObjectPassingTest:", v18);

      if ((v15 & 1) == 0 && (objc_msgSend(v14, "safari_looksLikeIPAddress") & 1) == 0)
      {
        v16 = -[_ASWebsiteNameFetchOperation initWithDomain:metadataEntry:provider:]([_ASWebsiteNameFetchOperation alloc], "initWithDomain:metadataEntry:provider:", v14, v17, self);
        -[NSOperationQueue addOperation:](self->_websiteFetchingQueue, "addOperation:", v16);

      }
    }

  }
}

- (void)_cacheDatabaseBackedWebsiteName:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueueForCachedWebsiteNames;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _ASWebsiteNameProvider *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueueForCachedWebsiteNames = self->_internalQueueForCachedWebsiteNames;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68___ASWebsiteNameProvider__cacheDatabaseBackedWebsiteName_forDomain___block_invoke;
  block[3] = &unk_24C9505A0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueueForCachedWebsiteNames, block);

}

- (void)_cacheFetchedAndKeychainBackedWebsiteName:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueueForCachedWebsiteNames;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _ASWebsiteNameProvider *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueueForCachedWebsiteNames = self->_internalQueueForCachedWebsiteNames;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78___ASWebsiteNameProvider__cacheFetchedAndKeychainBackedWebsiteName_forDomain___block_invoke;
  block[3] = &unk_24C9505A0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueueForCachedWebsiteNames, block);

}

- (void)_suspendOrResumeWebsiteFetchingOperationQueue
{
  int v3;
  NSObject *v4;
  WBSSavedAccountStoreWebsiteNameConsumer *websiteNameConsumer;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!self->_isForTesting)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = -[WBSPrivacyProxyAvailabilityManager shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy](self->_availabilityManager, "shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy");
    else
      v3 = 0;
    v4 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v9 = 67109120;
      v10 = v3;
      _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_INFO, "_ASWebsiteNameProvider shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy: %d", (uint8_t *)&v9, 8u);
    }
    websiteNameConsumer = self->_websiteNameConsumer;
    v6 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 67109120;
      v10 = websiteNameConsumer != 0;
      _os_log_impl(&dword_20E4D9000, v6, OS_LOG_TYPE_INFO, "_ASWebsiteNameProvider consumerExists: %d", (uint8_t *)&v9, 8u);
    }
    if (websiteNameConsumer)
      v7 = v3;
    else
      v7 = 0;
    v8 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 67109120;
      v10 = v7;
      _os_log_impl(&dword_20E4D9000, v8, OS_LOG_TYPE_INFO, "_ASWebsiteNameProvider allowing fetching: %d", (uint8_t *)&v9, 8u);
    }
    -[NSOperationQueue setSuspended:](self->_websiteFetchingQueue, "setSuspended:", !v7);
  }
}

- (WBSSavedAccountStoreWebsiteNameConsumer)websiteNameConsumer
{
  return self->_websiteNameConsumer;
}

- (BOOL)isForTesting
{
  return self->_isForTesting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteNameConsumer, 0);
  objc_storeStrong((id *)&self->_cachedWebsiteNamesFromDatabase, 0);
  objc_storeStrong((id *)&self->_cachedWebsiteNamesFromKeychain, 0);
  objc_storeStrong((id *)&self->_internalQueueForCachedWebsiteNames, 0);
  objc_storeStrong((id *)&self->_availabilityManager, 0);
  objc_storeStrong((id *)&self->_websiteMetadataStore, 0);
  objc_storeStrong((id *)&self->_websiteFetchingQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_websiteNameDictionary, 0);
  objc_storeStrong((id *)&self->_remotelyUpdatableDataController, 0);
}

+ (void)fetchWebsiteNameForDomain:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138739971;
  v3 = a1;
  _os_log_debug_impl(&dword_20E4D9000, a2, OS_LOG_TYPE_DEBUG, "Starting fetch for %{sensitive}@\n", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)knownWebsiteNameForDomain:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E4D9000, log, OS_LOG_TYPE_ERROR, "Asked by client to look up the domain for a nil or empty string", v1, 2u);
}

@end
