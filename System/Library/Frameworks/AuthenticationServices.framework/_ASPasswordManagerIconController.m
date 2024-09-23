@implementation _ASPasswordManagerIconController

- (_ASPasswordManagerIconController)init
{
  _ASPasswordManagerIconController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _ASPasswordManagerIconController *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v2 = self;
  -[_ASPasswordManagerIconController _mobileSafariContainerPath](self, "_mobileSafariContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library/Image Cache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v5 = (void *)get_SFSiteMetadataManagerClass_softClass;
    v17 = get_SFSiteMetadataManagerClass_softClass;
    if (!get_SFSiteMetadataManagerClass_softClass)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __get_SFSiteMetadataManagerClass_block_invoke;
      v13[3] = &unk_24C94F880;
      v13[4] = &v14;
      __get_SFSiteMetadataManagerClass_block_invoke((uint64_t)v13);
      v5 = (void *)v15[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v14, 8);
    v7 = [v6 alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "safari_safariInjectedBundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithInjectedBundleURL:imageCacheDirectoryURL:cacheIsReadOnly:metadataType:", v8, v9, 1, 4);

    v2 = -[_ASPasswordManagerIconController initWithMetadataManager:](v2, "initWithMetadataManager:", v10);
    v11 = v2;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (_ASPasswordManagerIconController)initWithMetadataManager:(id)a3
{
  id v5;
  _ASPasswordManagerIconController *v6;
  void *v7;
  objc_class *v8;
  WBSCache *v9;
  WBSCache *iconCache;
  uint64_t v11;
  NSMutableDictionary *domainsToExtractedBackgroundColors;
  uint64_t v13;
  NSMutableDictionary *activeRequestIDToRequestToken;
  uint64_t v15;
  NSMutableSet *touchIconRequests;
  uint64_t v17;
  NSMutableSet *domainsThatHaveRequestedIcon;
  void *v19;
  objc_class *v20;
  void *v21;
  id v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *queue;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  WBSAutoFillQuirksManager *autoFillQuirksManager;
  void *v32;
  objc_class *v33;
  WBSPrivacyProxyAvailabilityManager *v34;
  WBSPrivacyProxyAvailabilityManager *availabilityManager;
  void *v36;
  void *v37;
  void *v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *domainToNextIconDownloadRetryDate;
  _ASPasswordManagerIconController *v41;
  objc_super v43;
  uint64_t v44;
  uint64_t v45;
  Class (*v46)(uint64_t);
  void *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_ASPasswordManagerIconController;
  v6 = -[_ASPasswordManagerIconController init](&v43, sel_init);
  if (v6)
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v7 = (void *)getWBSCacheClass_softClass;
    v52 = getWBSCacheClass_softClass;
    if (!getWBSCacheClass_softClass)
    {
      v44 = MEMORY[0x24BDAC760];
      v45 = 3221225472;
      v46 = __getWBSCacheClass_block_invoke;
      v47 = &unk_24C94F880;
      v48 = &v49;
      __getWBSCacheClass_block_invoke((uint64_t)&v44);
      v7 = (void *)v50[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v49, 8);
    v9 = (WBSCache *)objc_alloc_init(v8);
    iconCache = v6->_iconCache;
    v6->_iconCache = v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    domainsToExtractedBackgroundColors = v6->_domainsToExtractedBackgroundColors;
    v6->_domainsToExtractedBackgroundColors = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    activeRequestIDToRequestToken = v6->_activeRequestIDToRequestToken;
    v6->_activeRequestIDToRequestToken = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    touchIconRequests = v6->_touchIconRequests;
    v6->_touchIconRequests = (NSMutableSet *)v15;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    domainsThatHaveRequestedIcon = v6->_domainsThatHaveRequestedIcon;
    v6->_domainsThatHaveRequestedIcon = (NSMutableSet *)v17;

    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("com.apple.SafariServices.%@.%p"), v21, v6);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = dispatch_queue_create((const char *)objc_msgSend(v22, "UTF8String"), 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v6->_metadataManager, a3);
    v25 = objc_alloc(MEMORY[0x24BE82CA8]);
    objc_msgSend(MEMORY[0x24BDD1488], "safari_safariCoreBundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLForResource:withExtension:", CFSTR("WBSAutoFillQuirks"), CFSTR("plist"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "safari_autoFillQuirksDownloadDirectoryURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v25, "initWithBuiltInQuirksURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:", v27, v29, CFSTR("AutoFillQuirks"), CFSTR("1"), *MEMORY[0x24BE82FB0], 0.0);
    autoFillQuirksManager = v6->_autoFillQuirksManager;
    v6->_autoFillQuirksManager = (WBSAutoFillQuirksManager *)v30;

    -[WBSAutoFillQuirksManager beginLoadingQuirksFromDisk](v6->_autoFillQuirksManager, "beginLoadingQuirksFromDisk");
    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v32 = (void *)getWBSPrivacyProxyAvailabilityManagerClass_softClass;
    v52 = getWBSPrivacyProxyAvailabilityManagerClass_softClass;
    if (!getWBSPrivacyProxyAvailabilityManagerClass_softClass)
    {
      v44 = MEMORY[0x24BDAC760];
      v45 = 3221225472;
      v46 = __getWBSPrivacyProxyAvailabilityManagerClass_block_invoke;
      v47 = &unk_24C94F880;
      v48 = &v49;
      __getWBSPrivacyProxyAvailabilityManagerClass_block_invoke((uint64_t)&v44);
      v32 = (void *)v50[3];
    }
    v33 = objc_retainAutorelease(v32);
    _Block_object_dispose(&v49, 8);
    v34 = (WBSPrivacyProxyAvailabilityManager *)objc_alloc_init(v33);
    availabilityManager = v6->_availabilityManager;
    v6->_availabilityManager = v34;

    getWBSPrivacyProxyChangeNotification();
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      getWBSPrivacyProxyChangeNotification();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObserver:selector:name:object:", v6, sel__privacyProxyStateInitialized, v38, v6->_availabilityManager);

    }
    v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    domainToNextIconDownloadRetryDate = v6->_domainToNextIconDownloadRetryDate;
    v6->_domainToNextIconDownloadRetryDate = v39;

    v41 = v6;
  }

  return v6;
}

- (void)_privacyProxyStateInitialized
{
  void *v3;
  void *v4;
  NSObject *v5;
  WBSPrivacyProxyAvailabilityManager *availabilityManager;
  NSObject *v7;
  NSObject *queue;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD block[4];
  id v12;
  id buf;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  getWBSPrivacyProxyChangeNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, v3, 0);

  }
  v5 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    availabilityManager = self->_availabilityManager;
    v7 = v5;
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = -[WBSPrivacyProxyAvailabilityManager shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy](availabilityManager, "shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy");
    _os_log_impl(&dword_20E4D9000, v7, OS_LOG_TYPE_DEFAULT, "Starting to fetch touch icon; enablePrivateRelay=%{BOOL}d",
      (uint8_t *)&buf,
      8u);

  }
  objc_initWeak(&buf, self);
  if (-[WBSPrivacyProxyAvailabilityManager shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy](self->_availabilityManager, "shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy"))
  {
    self->_canEnableIconDownload = 1;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65___ASPasswordManagerIconController__privacyProxyStateInitialized__block_invoke;
    block[3] = &unk_24C94F530;
    objc_copyWeak(&v12, &buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v12);
  }
  else
  {
    v9 = self->_queue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65___ASPasswordManagerIconController__privacyProxyStateInitialized__block_invoke_2;
    v10[3] = &unk_24C94F558;
    v10[4] = self;
    dispatch_sync(v9, v10);
    -[_ASPasswordManagerIconController _fetchHistory](self, "_fetchHistory");
  }
  objc_destroyWeak(&buf);

}

- (void)_fetchHistory
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _ASPasswordManagerIconController *v8;
  id v9;
  id buf[2];

  v3 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_DEFAULT, "Starting to fetch history", (uint8_t *)buf, 2u);
  }
  objc_msgSend(getWBUHistoryClass(), "existingSharedHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)getWBUHistoryClass()), "initWithDatabaseID:", 0);
    objc_msgSend(v4, "setShouldScheduleMaintenance:", 0);
    self->_initializedHistory = 1;
  }
  objc_initWeak(buf, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49___ASPasswordManagerIconController__fetchHistory__block_invoke;
  v6[3] = &unk_24C94F5D0;
  v5 = v4;
  v7 = v5;
  v8 = self;
  objc_copyWeak(&v9, buf);
  objc_msgSend(v5, "performBlockAfterHistoryHasLoaded:", v6);
  objc_destroyWeak(&v9);

  objc_destroyWeak(buf);
}

+ (CGSize)tableViewIconSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(get_SFAccountManagerAppearanceValuesClass(), "chicletSize");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

+ (CGSize)_preferredIconSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 64.0;
  v3 = 64.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)_minimumIconSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 48.0;
  v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)clearIconFetchingState
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58___ASPasswordManagerIconController_clearIconFetchingState__block_invoke;
  block[3] = &unk_24C94F558;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50___ASPasswordManagerIconController_cancelRequest___block_invoke;
  v7[3] = &unk_24C94F5F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)iconForDomain:(id)a3
{
  return -[_ASPasswordManagerIconController iconForDomain:requestID:responseHandler:](self, "iconForDomain:requestID:responseHandler:", a3, 0, &__block_literal_global);
}

- (id)iconForDomain:(id)a3 requestID:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *queue;
  id v18;
  NSObject *v19;
  _QWORD block[5];
  id v22;
  _BYTE *v23;
  uint8_t v24[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  _BYTE buf[24];
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (objc_msgSend(v8, "length"))
  {
    -[WBSCache objectForKey:](self->_iconCache, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if ((v13 & 1) == 0)
    {
      if (!v11)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v29 = 0;
        queue = self->_queue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __76___ASPasswordManagerIconController_iconForDomain_requestID_responseHandler___block_invoke;
        block[3] = &unk_24C94F660;
        v23 = buf;
        block[4] = self;
        v18 = v8;
        v22 = v18;
        dispatch_sync(queue, block);
        if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          v19 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v24 = 141558275;
            v25 = 1752392040;
            v26 = 2117;
            v27 = v18;
            _os_log_impl(&dword_20E4D9000, v19, OS_LOG_TYPE_DEFAULT, "Touch icon already requested; domain=%{sensitive, mask.hash}@",
              v24,
              0x16u);
          }
          v10[2](v10, 0);
        }
        else
        {
          -[_ASPasswordManagerIconController _fetchTouchIconForDomain:requestID:responseHandler:](self, "_fetchTouchIconForDomain:requestID:responseHandler:", v18, v9, v10);
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 141558275;
          *(_QWORD *)&buf[4] = 1752392040;
          *(_WORD *)&buf[12] = 2117;
          *(_QWORD *)&buf[14] = v8;
          _os_log_impl(&dword_20E4D9000, v14, OS_LOG_TYPE_DEFAULT, "Account icon found in _ASPasswordManagerIconController's in-memory cache; domain=%{sensitive, mask.hash}@",
            buf,
            0x16u);
        }
        ((void (**)(id, void *))v10)[2](v10, v11);
        v15 = v11;
        goto LABEL_19;
      }
    }
    v16 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558275;
      *(_QWORD *)&buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2117;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_20E4D9000, v16, OS_LOG_TYPE_DEFAULT, "Icon is nil or not an UIImage; domain=%{sensitive, mask.hash}@",
        buf,
        0x16u);
    }
    v10[2](v10, 0);
LABEL_18:
    v15 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v10[2](v10, 0);
  v15 = 0;
LABEL_20:

  return v15;
}

- (id)cachedIconForDomain:(id)a3 resizedToSize:(CGSize)a4 responseHandler:(id)a5
{
  double height;
  double width;
  void (**v9)(id, void *);
  void *v10;
  void *v11;

  height = a4.height;
  width = a4.width;
  v9 = (void (**)(id, void *))a5;
  -[WBSCache objectForKey:](self->_iconCache, "objectForKey:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(getWBSImageUtilitiesClass(), "resizedImage:withSize:", v10, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v9[2](v9, v11);

  return v11;
}

- (id)backgroundColorForDomain:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___ASPasswordManagerIconController_backgroundColorForDomain___block_invoke;
  block[3] = &unk_24C94F660;
  v13 = &v14;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  dispatch_sync(queue, block);
  v7 = (void *)v15[5];
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(get_SFAccountManagerAppearanceValuesClass(), "defaultMonogramBackgroundColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)_iconDidUpdateForDomain:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "iconDidUpdateForDomain:iconController:", v5, self);

}

- (id)_mobileSafariContainerPath
{
  if (_mobileSafariContainerPath_onceToken != -1)
    dispatch_once(&_mobileSafariContainerPath_onceToken, &__block_literal_global_27);
  return (id)_mobileSafariContainerPath_mobileSafariContainerPath;
}

- (void)dealloc
{
  objc_super v3;

  -[_ASPasswordManagerIconController prepareForApplicationTermination](self, "prepareForApplicationTermination");
  v3.receiver = self;
  v3.super_class = (Class)_ASPasswordManagerIconController;
  -[_ASPasswordManagerIconController dealloc](&v3, sel_dealloc);
}

- (void)performMaintenanceWork
{
  -[WBSSiteMetadataManager performMaintenanceWork](self->_metadataManager, "performMaintenanceWork");
}

- (void)prepareForApplicationTermination
{
  -[WBSSiteMetadataManager savePendingProviderChangesBeforeTermination](self->_metadataManager, "savePendingProviderChangesBeforeTermination");
  -[WBSAutoFillQuirksManager prepareForTermination](self->_autoFillQuirksManager, "prepareForTermination");
}

- (void)_checkForLocalVisitToDomain:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  int v9;
  NSObject *queue;
  _QWORD block[5];
  id v12;
  void (**v13)(id, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_msgSend(MEMORY[0x24BDBCF50], "pm_defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLForKey:", *MEMORY[0x24BE82E78]);

  if (v9)
  {
    v7[2](v7, 1);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79___ASPasswordManagerIconController__checkForLocalVisitToDomain_withCompletion___block_invoke;
    block[3] = &unk_24C94F6C8;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(queue, block);

  }
}

- (void)_fetchTouchIconForDomain:(id)a3 requestID:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke;
  v26[3] = &unk_24C94F718;
  v26[4] = self;
  v12 = v8;
  v27 = v12;
  v13 = v9;
  v28 = v13;
  v14 = v10;
  v29 = v14;
  v15 = (void *)MEMORY[0x212BBEFEC](v26);
  queue = self->_queue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke_3;
  block[3] = &unk_24C94F740;
  block[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(queue, block);

}

- (void)_fetchIconInHistoryWithBlock:(id)a3
{
  id v4;
  NSMutableArray *blocksAwaitingHistoryItems;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (self->_hasLoadedHistory)
  {
    (*((void (**)(void))v4 + 2))();
  }
  else
  {
    blocksAwaitingHistoryItems = self->_blocksAwaitingHistoryItems;
    if (blocksAwaitingHistoryItems)
    {
      v6 = (void *)MEMORY[0x212BBEFEC]();
      -[NSMutableArray addObject:](blocksAwaitingHistoryItems, "addObject:", v6);

    }
    else
    {
      v7 = (void *)MEMORY[0x24BDBCEB8];
      v8 = (void *)MEMORY[0x212BBEFEC]();
      objc_msgSend(v7, "arrayWithObject:", v8);
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_blocksAwaitingHistoryItems;
      self->_blocksAwaitingHistoryItems = v9;

    }
  }

}

- (void)_requestTouchIconForDomain:(id)a3 options:(unint64_t)a4 requestID:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *queue;
  _QWORD block[4];
  id v19;
  _ASPasswordManagerIconController *v20;
  id v21;
  id v22;
  id v23[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_domainToNextIconDownloadRetryDate, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "safari_isEarlierThanDate:", v13);

    if (v15)
    {
      -[_ASPasswordManagerIconController _handleIconFetchFailureWithDomain:options:requestID:response:responseHandler:](self, "_handleIconFetchFailureWithDomain:options:requestID:response:responseHandler:", v10, a4, v11, 0, v12);
      goto LABEL_9;
    }
    -[NSMutableDictionary removeObjectForKey:](self->_domainToNextIconDownloadRetryDate, "removeObjectForKey:", v10);
  }
  if (objc_msgSend(v10, "safari_looksLikeIPAddress"))
    v16 = (void *)(a4 & 0xFFFFFFFFFFFFFFF9);
  else
    v16 = (void *)a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke;
  block[3] = &unk_24C94F7B8;
  v23[1] = v16;
  v19 = v10;
  v20 = self;
  objc_copyWeak(v23, &location);
  v21 = v11;
  v22 = v12;
  dispatch_async(queue, block);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
LABEL_9:

}

- (void)_handleIconFetchFailureWithDomain:(id)a3 options:(unint64_t)a4 requestID:(id)a5 response:(id)a6 responseHandler:(id)a7
{
  char v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  NSObject *queue;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[WBSCache objectForKey:](self->_iconCache, "objectForKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v10 & 4) != 0 && !v16)
    -[_ASPasswordManagerIconController _fetchTouchIconInHistoryForDomain:requestID:responseHandler:](self, "_fetchTouchIconInHistoryForDomain:requestID:responseHandler:", v12, v13, v15);
  -[_ASPasswordManagerIconController _fetchAppIconForDomain:responseHandler:](self, "_fetchAppIconForDomain:responseHandler:", v12, v15);
  objc_msgSend(v14, "extractedBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v18 = (void *)getWBSTouchIconCacheClass_softClass;
    v30 = getWBSTouchIconCacheClass_softClass;
    if (!getWBSTouchIconCacheClass_softClass)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __getWBSTouchIconCacheClass_block_invoke;
      v26[3] = &unk_24C94F880;
      v26[4] = &v27;
      __getWBSTouchIconCacheClass_block_invoke((uint64_t)v26);
      v18 = (void *)v28[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v27, 8);
    objc_msgSend(v19, "defaultBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "isEqual:", v20);

    if ((v21 & 1) == 0)
    {
      queue = self->_queue;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __113___ASPasswordManagerIconController__handleIconFetchFailureWithDomain_options_requestID_response_responseHandler___block_invoke;
      v23[3] = &unk_24C94F7E0;
      v23[4] = self;
      v24 = v17;
      v25 = v12;
      dispatch_async(queue, v23);

    }
  }

}

- (void)_fetchTouchIconInHistoryForDomain:(id)a3 requestID:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    v21 = 1752392040;
    v22 = 2117;
    v23 = v8;
    _os_log_impl(&dword_20E4D9000, v11, OS_LOG_TYPE_DEFAULT, "Fetching touch icon in history without Private Relay; domain=%{sensitive, mask.hash}@",
      buf,
      0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96___ASPasswordManagerIconController__fetchTouchIconInHistoryForDomain_requestID_responseHandler___block_invoke;
  v16[3] = &unk_24C94F718;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(queue, v16);

}

- (void)_populateDomainToAppIDWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  NSMutableArray *blocksAwaitingSharedWebCredentialsInformation;
  void *v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_domainToAppID)
  {
    v4[2](v4);
  }
  else
  {
    v6 = objc_msgSend(v4, "copy");

    blocksAwaitingSharedWebCredentialsInformation = self->_blocksAwaitingSharedWebCredentialsInformation;
    if (blocksAwaitingSharedWebCredentialsInformation)
    {
      v8 = (void *)MEMORY[0x212BBEFEC](v6);
      -[NSMutableArray addObject:](blocksAwaitingSharedWebCredentialsInformation, "addObject:", v8);

    }
    else
    {
      objc_initWeak(&location, self);
      v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v10 = (void *)MEMORY[0x212BBEFEC](v6);
      v11 = (NSMutableArray *)objc_msgSend(v9, "initWithObjects:", v10, 0);
      v12 = self->_blocksAwaitingSharedWebCredentialsInformation;
      self->_blocksAwaitingSharedWebCredentialsInformation = v11;

      v13 = (void *)MEMORY[0x24BE83068];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __73___ASPasswordManagerIconController__populateDomainToAppIDWithCompletion___block_invoke;
      v14[3] = &unk_24C94F808;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v13, "getAllApprovedSharedWebCredentialsEntries:", v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    v5 = (void *)v6;
  }

}

- (void)_fetchAppIconForDomain:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    v18 = 1752392040;
    v19 = 2117;
    v20 = v6;
    _os_log_impl(&dword_20E4D9000, v8, OS_LOG_TYPE_DEFAULT, "Fetching app icon; domain=%{sensitive, mask.hash}@",
      buf,
      0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke;
  block[3] = &unk_24C94F858;
  block[4] = self;
  objc_copyWeak(&v15, &location);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)appIconForBundleID:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  id WBSImageUtilitiesClass;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if (v5)
  {
    WBSImageUtilitiesClass = getWBSImageUtilitiesClass();
    iconForApplicationProxy(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASPasswordManagerIconController _preferredIconSize](_ASPasswordManagerIconController, "_preferredIconSize");
    objc_msgSend(WBSImageUtilitiesClass, "resizedImage:withSize:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_ASPasswordManagerIconControllerDelegate)delegate
{
  return (_ASPasswordManagerIconControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_domainToNextIconDownloadRetryDate, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_availabilityManager, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingSharedWebCredentialsInformation, 0);
  objc_storeStrong((id *)&self->_domainToAppID, 0);
  objc_storeStrong((id *)&self->_metadataManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingHistoryItems, 0);
  objc_storeStrong((id *)&self->_domainsThatHaveRequestedIcon, 0);
  objc_storeStrong((id *)&self->_domainToItems, 0);
  objc_storeStrong((id *)&self->_touchIconRequests, 0);
  objc_storeStrong((id *)&self->_activeRequestIDToRequestToken, 0);
  objc_storeStrong((id *)&self->_domainsToExtractedBackgroundColors, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
}

@end
