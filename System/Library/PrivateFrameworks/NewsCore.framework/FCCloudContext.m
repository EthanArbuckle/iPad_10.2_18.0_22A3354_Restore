@implementation FCCloudContext

- (FCFlintResourceManager)flintResourceManager
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flintResourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCFlintResourceManager *)v3;
}

- (FCContentContextInternal)internalContentContext
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internalContentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentContextInternal *)v3;
}

- (FCAssetManager)assetManager
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCAssetManager *)v3;
}

- (FCNetworkReachabilityType)networkReachability
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkReachability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCNetworkReachabilityType *)v3;
}

- (NSString)contentDirectory
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCNewsAppConfigurationManager *)v3;
}

- (FCContentContext)contentContext
{
  FCContentContext *contentContext;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  contentContext = self->_contentContext;
  if (!contentContext)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_contentContext");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext contentContext]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 503;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_contentContext;
    }
    contentContext = 0;
  }
  return contentContext;
}

- (FCPaidAccessCheckerType)paidAccessChecker
{
  return self->_paidAccessChecker;
}

- (FCLocalRegionManager)localRegionProvider
{
  return self->_localRegionProvider;
}

- (FCNotificationController)notificationController
{
  return self->_notificationController;
}

- (id)_createPeopleAlsoReadInventory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  FCPeopleAlsoReadFeedItemService *v7;
  void *v8;
  FCPeopleAlsoReadFeedItemService *v9;
  FCFeedItemInventory *v10;
  void *v11;
  FCFeedItemInventory *v12;

  -[FCCloudContext contentContext](self, "contentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("people-also-read-article-inventory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCCloudContext appConfigurationManager](self, "appConfigurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [FCPeopleAlsoReadFeedItemService alloc];
  -[FCCloudContext readingHistory](self, "readingHistory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCPeopleAlsoReadFeedItemService initWithConfigurationManager:contentContext:readingHistory:](v7, "initWithConfigurationManager:contentContext:readingHistory:", v6, self, v8);

  v10 = [FCFeedItemInventory alloc];
  -[FCCloudContext readingHistory](self, "readingHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FCFeedItemInventory initWithContext:feedItemService:readingHistory:filePath:version:refreshInterval:loggingKey:](v10, "initWithContext:feedItemService:readingHistory:filePath:version:refreshInterval:loggingKey:", self, v9, v11, v5, 0, CFSTR("PeopleAlsoRead"), 0.0);

  return v12;
}

- (id)_createESLInventory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  FCGlobalESLService *v17;
  FCFeedItemInventory *v18;
  void *v19;
  FCFeedItemInventory *v20;
  void *v21;
  FCFeedItemInventory *v22;
  void *v23;
  FCFeedItemInventory *v24;
  FCESLInventory *v25;
  _QWORD v27[5];

  -[FCCloudContext contentContext](self, "contentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("issue-article-inventory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCCloudContext contentContext](self, "contentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("tag-esl-inventory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NewsCoreUserDefaults();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("news.esl_inventory.clear_global_next_launch"));

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeItemAtPath:error:", v5, 0);

    NewsCoreUserDefaults();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBool:forKey:", 0, CFSTR("news.esl_inventory.clear_global_next_launch"));

  }
  NewsCoreUserDefaults();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("news.esl_inventory.force_enable_all_tags"));

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtPath:error:", v8, 0);

    NewsCoreUserDefaults();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBool:forKey:", 0, CFSTR("news.esl_inventory.force_enable_all_tags"));

  }
  v17 = -[FCGlobalESLService initWithContext:]([FCGlobalESLService alloc], "initWithContext:", self);
  v18 = [FCFeedItemInventory alloc];
  -[FCCloudContext readingHistory](self, "readingHistory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[FCFeedItemInventory initWithContext:feedItemService:readingHistory:filePath:version:refreshInterval:loggingKey:](v18, "initWithContext:feedItemService:readingHistory:filePath:version:refreshInterval:loggingKey:", self, v17, v19, v5, 1, CFSTR("Global"), 86400.0);

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __37__FCCloudContext__createESLInventory__block_invoke;
  v27[3] = &unk_1E4640898;
  v27[4] = self;
  __37__FCCloudContext__createESLInventory__block_invoke((uint64_t)v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [FCFeedItemInventory alloc];
  -[FCCloudContext readingHistory](self, "readingHistory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[FCFeedItemInventory initWithContext:feedItemService:readingHistory:filePath:version:refreshInterval:loggingKey:](v22, "initWithContext:feedItemService:readingHistory:filePath:version:refreshInterval:loggingKey:", self, v21, v23, v8, 1, CFSTR("Per-Tag"), 86400.0);

  v25 = -[FCESLInventory initWithGlobalInventory:tagInventory:]([FCESLInventory alloc], "initWithGlobalInventory:tagInventory:", v20, v24);
  return v25;
}

id __37__FCCloudContext__createESLInventory__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  __objc2_class **v4;

  NewsCoreUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("news.esl_inventory.simulate_with_top_k"));

  v4 = off_1E46352B0;
  if (!v3)
    v4 = off_1E46351B0;
  return (id)objc_msgSend(objc_alloc(*v4), "initWithContext:", *(_QWORD *)(a1 + 32));
}

- (FCAppActivityMonitor)appActivityMonitor
{
  FCAppActivityMonitor *appActivityMonitor;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  appActivityMonitor = self->_appActivityMonitor;
  if (!appActivityMonitor)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_appActivityMonitor");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext appActivityMonitor]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 497;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_appActivityMonitor;
    }
    appActivityMonitor = 0;
  }
  return appActivityMonitor;
}

- (FCBackgroundTaskable)backgroundTaskable
{
  return (FCBackgroundTaskable *)objc_loadWeakRetained((id *)&self->_backgroundTaskable);
}

- (FCLocalAreasManager)localAreasManager
{
  return self->_localAreasManager;
}

- (FCESLInventory)eslInventory
{
  return self->_eslInventory;
}

- (id)recordSourceWithSchema:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCCloudContext contentContext](self, "contentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordSourceWithSchema:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)news_core_ConfigurationManager
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "news_core_ConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FCPuzzleTypeSettings)puzzleTypeSettings
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "puzzleTypeSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCPuzzleTypeSettings *)v3;
}

- (FCTagSettings)tagSettings
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tagSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCTagSettings *)v3;
}

- (FCTranslationManager)translationManager
{
  return self->_translationManager;
}

- (FCPurchaseManagerType)purchaseManager
{
  return self->_purchaseManager;
}

- (FCPPTContext)pptContext
{
  return self->_pptContext;
}

- (FCEntitlementService)entitlementService
{
  return self->_entitlementService;
}

- (BOOL)deviceIsiPad
{
  return self->_deviceIsiPad;
}

- (void)setLocalChannelsProvider:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_localChannelsProvider, a3);
  v5 = a3;
  -[FCCloudContext subscriptionController](self, "subscriptionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalChannelsProvider:", v5);

}

- (FCSubscriptionController)subscriptionController
{
  FCSubscriptionController *subscriptionController;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  subscriptionController = self->_subscriptionController;
  if (!subscriptionController)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_subscriptionController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext subscriptionController]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 479;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_subscriptionController;
    }
    subscriptionController = 0;
  }
  return subscriptionController;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  id v4;

  -[FCCloudContext contentContext](self, "contentContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableFlushingWithFlushingThreshold:", a3);

}

- (FCPuzzleTypeController)puzzleTypeController
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "puzzleTypeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCPuzzleTypeController *)v3;
}

- (FCPersonalizationData)personalizationData
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalizationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCPersonalizationData *)v3;
}

- (FCCloudContext)initWithContentContext:(id)a3 privateDataContext:(id)a4 networkBehaviorMonitor:(id)a5 networkReachability:(id)a6 options:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FCCloudContext *v17;
  FCCloudContext *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  FCWebURLResolutionEndpointConnection *v23;
  FCWebURLResolutionEndpointConnection *webURLResolutionEndpointConnection;
  void *v25;
  void *v26;
  FCCommandQueue *v27;
  void *v28;
  uint64_t v29;
  FCCommandQueue *endpointCommandQueue;
  FCCommandQueue *v31;
  void *v32;
  uint64_t v33;
  FCCommandQueue *notificationsEndpointCommandQueue;
  FCCommandQueue *v35;
  void *v36;
  uint64_t v37;
  FCCommandQueue *newsletterEndpointCommandQueue;
  FCEntitlementService *v39;
  void *v40;
  uint64_t v41;
  FCEntitlementService *entitlementService;
  FCPurchaseController *v43;
  FCPurchaseController *purchaseController;
  FCPurchaseProvider *v45;
  FCPurchaseController *v46;
  void *v47;
  id *v48;
  FCPurchaseProviderType *purchaseProvider;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  FCBundleEntitlementsProvider *v57;
  void *v58;
  FCBundleEntitlementsProvider *bundleSubscriptionManager;
  FCBundleSubscriptionManager *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  FCBundleSubscriptionManagerType *v64;
  FCNoOpBundleSubscriptionManager *v65;
  FCPurchaseManager *v66;
  FCPurchaseIntegrityChecker *v67;
  FCPurchaseReceiptProvider *v68;
  FCPaymentTransactionManager *v69;
  uint64_t v70;
  FCPurchaseManagerType *purchaseManager;
  FCNotificationController *v72;
  void *v73;
  FCCommandQueue *v74;
  void *v75;
  uint64_t v76;
  FCNotificationController *notificationController;
  FCNotificationsEndpointConnection *v78;
  FCNotificationsEndpointConnection *notificationsEndpointConnection;
  FCNewsletterEndpointConnection *v80;
  FCNewsletterEndpointConnection *newsletterEndpointConnection;
  FCNewsletterManager *v82;
  FCNewsletterEndpointConnection *v83;
  FCCommandQueue *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  FCNewsletterManager *newsletterManager;
  FCSubscriptionController *v92;
  void *v93;
  void *v94;
  void *v95;
  FCNotificationController *v96;
  FCPurchaseProviderType *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  FCSubscriptionController *subscriptionController;
  FCTranslationManager *v103;
  FCTranslationManager *translationManager;
  FCLocalAreasManager *v105;
  FCLocalAreasManager *localAreasManager;
  FCUserVectorManager *v107;
  FCUserVectorManager *userVectorManager;
  FCCurrentIssuesChecker *v109;
  FCSubscriptionController *v110;
  void *v111;
  uint64_t v112;
  FCCurrentIssuesChecker *currentIssuesChecker;
  uint64_t v114;
  FCESLInventory *eslInventory;
  FCFeedItemInventoryType *v116;
  FCFeedItemInventoryType *peopleAlsoReadInventory;
  FCFeedItemInventoryType *v118;
  FCPeopleAlsoReadInventoryManager *v119;
  void *v120;
  uint64_t v121;
  FCPeopleAlsoReadInventoryManager *peopleAlsoReadInventoryManager;
  FCPaidAccessChecker *v123;
  void *v124;
  void *v125;
  void *v126;
  FCPaidAccessChecker *v127;
  FCPaidAccessCheckerType *paidAccessChecker;
  FCPaidAccessChecker *v129;
  FCIssueAccessChecker *v130;
  void *v131;
  uint64_t v132;
  FCAccessChecker *issueAccessChecker;
  FCArticleAccessChecker *v134;
  void *v135;
  uint64_t v136;
  FCAccessChecker *articleAccessChecker;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  id obj;
  void *v144;
  FCClientEndpointConnection *v145;
  id v146;
  id v147;
  void *v148;
  void *v149;
  objc_super v150;
  uint8_t buf[4];
  const char *v152;
  __int16 v153;
  char *v154;
  __int16 v155;
  int v156;
  __int16 v157;
  void *v158;
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v139 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentContext");
    *(_DWORD *)buf = 136315906;
    v152 = "-[FCCloudContext initWithContentContext:privateDataContext:networkBehaviorMonitor:networkReachability:options:]";
    v153 = 2080;
    v154 = "FCCloudContext.m";
    v155 = 1024;
    v156 = 313;
    v157 = 2114;
    v158 = v139;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v14)
      goto LABEL_6;
  }
  else if (v14)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v140 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDataContext");
    *(_DWORD *)buf = 136315906;
    v152 = "-[FCCloudContext initWithContentContext:privateDataContext:networkBehaviorMonitor:networkReachability:options:]";
    v153 = 2080;
    v154 = "FCCloudContext.m";
    v155 = 1024;
    v156 = 314;
    v157 = 2114;
    v158 = v140;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v150.receiver = self;
  v150.super_class = (Class)FCCloudContext;
  v17 = -[FCCloudContext init](&v150, sel_init);
  v18 = v17;
  if (v17)
  {
    obj = a5;
    v147 = v15;
    objc_storeStrong((id *)&v17->_contentContext, a3);
    objc_storeStrong((id *)&v18->_privateDataContext, a4);
    objc_msgSend(v14, "preparePrivateDataControllersForUse");
    objc_msgSend(v13, "configurationManager");
    v19 = objc_claimAutoreleasedReturnValue();
    v145 = -[FCClientEndpointConnection initWithConfigurationManager:]([FCClientEndpointConnection alloc], "initWithConfigurationManager:", v19);
    objc_storeStrong((id *)&v18->_endpointConnection, v145);
    v20 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v13, "contentDirectory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fileURLWithPath:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v144 = (void *)v22;
    v146 = v16;
    v23 = -[FCWebURLResolutionEndpointConnection initWithConfigurationManager:cachesDirectoryURL:networkReachability:]([FCWebURLResolutionEndpointConnection alloc], "initWithConfigurationManager:cachesDirectoryURL:networkReachability:", v19, v22, v16);
    webURLResolutionEndpointConnection = v18->_webURLResolutionEndpointConnection;
    v18->_webURLResolutionEndpointConnection = v23;

    objc_msgSend(v14, "internalPrivateDataContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appActivityMonitor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v148 = v26;
    objc_storeStrong((id *)&v18->_appActivityMonitor, v26);
    v18->_options = a7;
    v27 = [FCCommandQueue alloc];
    objc_msgSend(v14, "privateDataDirectory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[FCCommandQueue initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:](v27, "initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:", v18, v28, CFSTR("endPoint_v1.commandqueue"), 2, 0, 0);
    endpointCommandQueue = v18->_endpointCommandQueue;
    v18->_endpointCommandQueue = (FCCommandQueue *)v29;

    v31 = [FCCommandQueue alloc];
    objc_msgSend(v14, "privateDataDirectory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[FCCommandQueue initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:](v31, "initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:", v18, v32, CFSTR("notificationsEndpoint_v1.commandqueue"), 1, 0, 0);
    notificationsEndpointCommandQueue = v18->_notificationsEndpointCommandQueue;
    v18->_notificationsEndpointCommandQueue = (FCCommandQueue *)v33;

    v35 = [FCCommandQueue alloc];
    objc_msgSend(v14, "privateDataDirectory");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[FCCommandQueue initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:](v35, "initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:", v18, v36, CFSTR("newsletterEndpoint_v1.commandqueue"), 2, 0, 0);
    newsletterEndpointCommandQueue = v18->_newsletterEndpointCommandQueue;
    v18->_newsletterEndpointCommandQueue = (FCCommandQueue *)v37;

    v39 = [FCEntitlementService alloc];
    objc_msgSend(v13, "configurationManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[FCEntitlementService initWithConfigurationManager:](v39, "initWithConfigurationManager:", v40);
    entitlementService = v18->_entitlementService;
    v18->_entitlementService = (FCEntitlementService *)v41;

    v43 = -[FCPurchaseController initWithCloudContext:entitlementService:]([FCPurchaseController alloc], "initWithCloudContext:entitlementService:", v18, v18->_entitlementService);
    purchaseController = v18->_purchaseController;
    v18->_purchaseController = v43;

    v45 = [FCPurchaseProvider alloc];
    v46 = v18->_purchaseController;
    objc_msgSend(v14, "privateChannelMembershipController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[FCPurchaseProvider initWithPurchaseController:privateChannelMembershipController:]((id *)&v45->super.isa, v46, v47);
    purchaseProvider = v18->_purchaseProvider;
    v18->_purchaseProvider = (FCPurchaseProviderType *)v48;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObserver:selector:name:object:", v18, sel__purchaseControllerDidAddALaCarteSubscription, FCPurchaseAddedNotificationName, 0);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bundleIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "isEqualToString:", CFSTR("com.apple.news")))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "bundleIdentifier");
      v54 = v14;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("com.apple.stocks"));

      v14 = v54;
      if (!v56)
      {
        v65 = objc_alloc_init(FCNoOpBundleSubscriptionManager);
        bundleSubscriptionManager = (FCBundleEntitlementsProvider *)v18->_bundleSubscriptionManager;
        v18->_bundleSubscriptionManager = (FCBundleSubscriptionManagerType *)v65;
        goto LABEL_12;
      }
    }
    v57 = [FCBundleEntitlementsProvider alloc];
    objc_msgSend(v13, "configurationManager");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    bundleSubscriptionManager = -[FCBundleEntitlementsProvider initWithConfigurationManager:entitlementService:](v57, "initWithConfigurationManager:entitlementService:", v58, v18->_entitlementService);

    v60 = [FCBundleSubscriptionManager alloc];
    objc_msgSend(v14, "privateDataDirectory");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationManager");
    v54 = v14;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[FCBundleSubscriptionManager initWithPrivateDataDirectory:configurationManager:cloudContext:contentContext:appActivityMonitor:entitlementsProvider:](v60, "initWithPrivateDataDirectory:configurationManager:cloudContext:contentContext:appActivityMonitor:entitlementsProvider:", v61, v62, v18, v13, v148, bundleSubscriptionManager);
    v64 = v18->_bundleSubscriptionManager;
    v18->_bundleSubscriptionManager = (FCBundleSubscriptionManagerType *)v63;

LABEL_12:
    v141 = v54;

    -[FCBundleSubscriptionManagerType addObserver:](v18->_bundleSubscriptionManager, "addObserver:", v18);
    v66 = [FCPurchaseManager alloc];
    v67 = objc_alloc_init(FCPurchaseIntegrityChecker);
    v68 = objc_alloc_init(FCPurchaseReceiptProvider);
    v69 = objc_alloc_init(FCPaymentTransactionManager);
    v70 = -[FCPurchaseManager initWithCloudContext:purchaseIntegrityChecker:purchaseReceiptProvider:paymentTransactionManager:bundleSubscriptionManager:keyValueStoreOption:](v66, "initWithCloudContext:purchaseIntegrityChecker:purchaseReceiptProvider:paymentTransactionManager:bundleSubscriptionManager:keyValueStoreOption:", v18, v67, v68, v69, v18->_bundleSubscriptionManager, 0);
    purchaseManager = v18->_purchaseManager;
    v18->_purchaseManager = (FCPurchaseManagerType *)v70;

    v72 = [FCNotificationController alloc];
    objc_msgSend(v54, "userInfo");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v18->_notificationsEndpointCommandQueue;
    objc_msgSend(v13, "configurationManager");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = -[FCNotificationController initWithUserInfo:commandQueue:configurationManager:publisherNotificationsAllowed:appleNewsNotificationsAllowed:](v72, "initWithUserInfo:commandQueue:configurationManager:publisherNotificationsAllowed:appleNewsNotificationsAllowed:", v73, v74, v75, ((unint64_t)a7 >> 1) & 1, ((unint64_t)a7 >> 2) & 1);
    notificationController = v18->_notificationController;
    v18->_notificationController = (FCNotificationController *)v76;

    v78 = -[FCNotificationsEndpointConnection initWithConfigurationManager:bundleSubscriptionManager:]([FCNotificationsEndpointConnection alloc], "initWithConfigurationManager:bundleSubscriptionManager:", v19, v18->_bundleSubscriptionManager);
    notificationsEndpointConnection = v18->_notificationsEndpointConnection;
    v18->_notificationsEndpointConnection = v78;

    v80 = -[FCNewsletterEndpointConnection initWithConfigurationManager:]([FCNewsletterEndpointConnection alloc], "initWithConfigurationManager:", v19);
    newsletterEndpointConnection = v18->_newsletterEndpointConnection;
    v18->_newsletterEndpointConnection = v80;

    v82 = [FCNewsletterManager alloc];
    v83 = v18->_newsletterEndpointConnection;
    v84 = v18->_newsletterEndpointCommandQueue;
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCloudContext appConfigurationManager](v18, "appConfigurationManager");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCloudContext userInfo](v18, "userInfo");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCloudContext bundleSubscriptionManager](v18, "bundleSubscriptionManager");
    v142 = (void *)v19;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCloudContext privateDataContext](v18, "privateDataContext");
    v149 = v13;
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = -[FCNewsletterManager initWithEndpointConnection:endpointCommandQueue:appleAccount:appConfig:userInfo:bundleSubscriptionManager:privateDataContext:](v82, "initWithEndpointConnection:endpointCommandQueue:appleAccount:appConfig:userInfo:bundleSubscriptionManager:privateDataContext:", v83, v84, v85, v86, v87, v88, v89);
    newsletterManager = v18->_newsletterManager;
    v18->_newsletterManager = (FCNewsletterManager *)v90;

    v92 = [FCSubscriptionController alloc];
    objc_msgSend(v54, "subscriptionList");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "tagController");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "puzzleTypeController");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v18->_notificationController;
    v97 = v18->_purchaseProvider;
    objc_msgSend(v149, "configurationManager");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "appConfigurationManager");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCloudContext userInfo](v18, "userInfo");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = -[FCSubscriptionController initWithSubscriptionList:tagController:puzzleTypeController:notificationController:purchaseProvider:configurationManager:appConfigurationManager:appActivityMonitor:userInfo:](v92, "initWithSubscriptionList:tagController:puzzleTypeController:notificationController:purchaseProvider:configurationManager:appConfigurationManager:appActivityMonitor:userInfo:", v93, v94, v95, v96, v97, v98, v99, v148, v100);
    subscriptionController = v18->_subscriptionController;
    v18->_subscriptionController = (FCSubscriptionController *)v101;

    objc_storeStrong((id *)&v18->_networkBehaviorMonitor, obj);
    v103 = -[FCTranslationManager initWithContentContext:]([FCTranslationManager alloc], "initWithContentContext:", v149);
    translationManager = v18->_translationManager;
    v18->_translationManager = v103;

    v105 = -[FCLocalAreasManager initWithContentContext:]([FCLocalAreasManager alloc], "initWithContentContext:", v149);
    localAreasManager = v18->_localAreasManager;
    v18->_localAreasManager = v105;

    v107 = -[FCUserVectorManager initWithContext:]([FCUserVectorManager alloc], "initWithContext:", v18);
    userVectorManager = v18->_userVectorManager;
    v18->_userVectorManager = v107;

    v109 = [FCCurrentIssuesChecker alloc];
    v110 = v18->_subscriptionController;
    v14 = v141;
    objc_msgSend(v141, "issueReadingHistory");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = -[FCCurrentIssuesChecker initWithContext:subscriptionController:issueReadingHistory:bundleSubscriptionProvider:](v109, "initWithContext:subscriptionController:issueReadingHistory:bundleSubscriptionProvider:", v149, v110, v111, v18->_bundleSubscriptionManager);
    currentIssuesChecker = v18->_currentIssuesChecker;
    v18->_currentIssuesChecker = (FCCurrentIssuesChecker *)v112;

    -[FCCloudContext _createESLInventory](v18, "_createESLInventory");
    v114 = objc_claimAutoreleasedReturnValue();
    eslInventory = v18->_eslInventory;
    v18->_eslInventory = (FCESLInventory *)v114;

    -[FCCloudContext _createPeopleAlsoReadInventory](v18, "_createPeopleAlsoReadInventory");
    v116 = (FCFeedItemInventoryType *)objc_claimAutoreleasedReturnValue();
    peopleAlsoReadInventory = v18->_peopleAlsoReadInventory;
    v18->_peopleAlsoReadInventory = v116;
    v118 = v116;

    v119 = [FCPeopleAlsoReadInventoryManager alloc];
    objc_msgSend(v141, "readingHistory");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = -[FCPeopleAlsoReadInventoryManager initWithInventory:readingHistory:](v119, "initWithInventory:readingHistory:", v118, v120);
    peopleAlsoReadInventoryManager = v18->_peopleAlsoReadInventoryManager;
    v18->_peopleAlsoReadInventoryManager = (FCPeopleAlsoReadInventoryManager *)v121;

    v123 = [FCPaidAccessChecker alloc];
    -[FCCloudContext purchaseProvider](v18, "purchaseProvider");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCloudContext bundleSubscriptionManager](v18, "bundleSubscriptionManager");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCloudContext configurationManager](v18, "configurationManager");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = -[FCPaidAccessChecker initWithPurchaseProvider:bundleSubscriptionProvider:configurationManager:](v123, "initWithPurchaseProvider:bundleSubscriptionProvider:configurationManager:", v124, v125, v126);

    paidAccessChecker = v18->_paidAccessChecker;
    v18->_paidAccessChecker = (FCPaidAccessCheckerType *)v127;
    v129 = v127;

    v130 = [FCIssueAccessChecker alloc];
    objc_msgSend(v141, "privateChannelMembershipController");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = -[FCIssueAccessChecker initWithPaidAccessChecker:privateChannelMembershipController:](v130, "initWithPaidAccessChecker:privateChannelMembershipController:", v129, v131);
    issueAccessChecker = v18->_issueAccessChecker;
    v18->_issueAccessChecker = (FCAccessChecker *)v132;

    v134 = [FCArticleAccessChecker alloc];
    objc_msgSend(v141, "privateChannelMembershipController");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = -[FCArticleAccessChecker initWithPaidAccessChecker:privateChannelMembershipController:](v134, "initWithPaidAccessChecker:privateChannelMembershipController:", v129, v135);
    articleAccessChecker = v18->_articleAccessChecker;
    v18->_articleAccessChecker = (FCAccessChecker *)v136;

    v13 = v149;
    v16 = v146;
    v15 = v147;
  }

  return v18;
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (FCCoreConfigurationManager)configurationManager
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCoreConfigurationManager *)v3;
}

- (FCSubscriptionList)subscriptionList
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCSubscriptionList *)v3;
}

- (NSString)privateDataDirectory
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateDataDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FCShortcutList)shortcutList
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortcutList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCShortcutList *)v3;
}

- (FCReadingHistory)readingHistory
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readingHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCReadingHistory *)v3;
}

- (FCUserInfo)userInfo
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCUserInfo *)v3;
}

- (FCPrivateDataContext)privateDataContext
{
  FCPrivateDataContext *privateDataContext;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  privateDataContext = self->_privateDataContext;
  if (!privateDataContext)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_privateDataContext");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext privateDataContext]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 514;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_privateDataContext;
    }
    privateDataContext = 0;
  }
  return privateDataContext;
}

- (FCIssueReadingHistory)issueReadingHistory
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "issueReadingHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCIssueReadingHistory *)v3;
}

- (FCPurchaseProviderType)purchaseProvider
{
  return self->_purchaseProvider;
}

- (FCPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (FCReadingList)readingList
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readingList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCReadingList *)v3;
}

- (FCTagController)tagController
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tagController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCTagController *)v3;
}

- (FCNewsletterManager)newsletterManager
{
  return self->_newsletterManager;
}

- (void)setOfflineArticleManagerProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setAggregateStoreProvider:(id)a3
{
  -[FCUserVectorManager setAggregateStoreProvider:](self->_userVectorManager, "setAggregateStoreProvider:", a3);
}

- (FCCurrentIssuesChecker)currentIssuesChecker
{
  return self->_currentIssuesChecker;
}

- (FCUserEventHistory)userEventHistory
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userEventHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCUserEventHistory *)v3;
}

- (void)setLocalRegionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_localRegionProvider, a3);
}

- (void)setFeedPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizer, a3);
}

- (FCAudioPlaylist)audioPlaylist
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioPlaylist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCAudioPlaylist *)v3;
}

- (FCSportsEventController)sportsEventController
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sportsEventController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCSportsEventController *)v3;
}

- (FCPuzzleController)puzzleController
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "puzzleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCPuzzleController *)v3;
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  FCNetworkBehaviorMonitor *networkBehaviorMonitor;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  networkBehaviorMonitor = self->_networkBehaviorMonitor;
  if (!networkBehaviorMonitor)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_networkBehaviorMonitor");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext networkBehaviorMonitor]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 491;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_networkBehaviorMonitor;
    }
    networkBehaviorMonitor = 0;
  }
  return networkBehaviorMonitor;
}

- (id)interestTokenForContentManifest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCCloudContext contentContext](self, "contentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interestTokenForContentManifest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FCPuzzleHistory)puzzleHistory
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "puzzleHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCPuzzleHistory *)v3;
}

- (FCCloudContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 privateDataHostDirectory:(id)a6 privateDataActionProvider:(id)a7 networkBehaviorMonitor:(id)a8 appActivityMonitor:(id)a9 desiredHeadlineFieldOptions:(unint64_t)a10 feedUsage:(int64_t)a11 lockStoreFrontIfNeeded:(BOOL)a12 deviceIsiPad:(BOOL)a13 backgroundTaskable:(id)a14 privateDataSyncAvailability:(id)a15 pptContext:(id)a16
{
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  FCCloudContext *v38;

  v20 = 8;
  if (!a12)
    v20 = 0;
  v34 = v20;
  v33 = a16;
  v32 = a15;
  v21 = a14;
  v22 = a9;
  v31 = a8;
  v23 = a7;
  v24 = a6;
  v30 = a5;
  v25 = a4;
  v26 = a3;
  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = a13;
  v38 = -[FCCloudContext initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:privateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOptions:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:](self, "initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:privateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOptions:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:", v26, v25, v30, v24, v23, v31, v27, v22, a10, a11, v29, v21, v32, v33, v34);

  return v38;
}

- (FCCloudContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 privateDataHostDirectory:(id)a6 privateDataActionProvider:(id)a7 networkBehaviorMonitor:(id)a8 networkReachability:(id)a9 appActivityMonitor:(id)a10 desiredHeadlineFieldOptions:(unint64_t)a11 feedUsage:(int64_t)a12 deviceIsiPad:(BOOL)a13 backgroundTaskable:(id)a14 privateDataSyncAvailability:(id)a15 pptContext:(id)a16 options:(int64_t)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  FCContentContext *v27;
  FCPrivateDataContext *v28;
  FCPrivateDataContext *v29;
  FCCloudContext *v30;
  FCCloudContext *v31;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v39 = a4;
  v22 = a5;
  v23 = a6;
  v38 = a7;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v43 = a14;
  v42 = a15;
  v41 = a16;
  v44 = v22;
  if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentHostDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v46 = "-[FCCloudContext initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:priv"
          "ateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOption"
          "s:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:]";
    v47 = 2080;
    v48 = "FCCloudContext.m";
    v49 = 1024;
    v50 = 197;
    v51 = 2114;
    v52 = v33;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v23 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDataHostDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v46 = "-[FCCloudContext initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:priv"
          "ateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOption"
          "s:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:]";
    v47 = 2080;
    v48 = "FCCloudContext.m";
    v49 = 1024;
    v50 = 198;
    v51 = 2114;
    v52 = v34;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v26 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "appActivityMonitor != nil");
    *(_DWORD *)buf = 136315906;
    v46 = "-[FCCloudContext initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:priv"
          "ateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOption"
          "s:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:]";
    v47 = 2080;
    v48 = "FCCloudContext.m";
    v49 = 1024;
    v50 = 199;
    v51 = 2114;
    v52 = v35;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if ((a17 & 8) != 0)
    +[FCAppleAccount enableStoreFrontLocking](FCAppleAccount, "enableStoreFrontLocking");
  v27 = -[FCContentContext initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:networkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:]([FCContentContext alloc], "initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:networkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:", v40, v39, v22, v24, v25, a11, a12, self, v26, v43, v41);
  -[FCCloudContext setContentContext:](self, "setContentContext:", v27);
  -[FCCloudContext setAppActivityMonitor:](self, "setAppActivityMonitor:", v26);
  v28 = [FCPrivateDataContext alloc];
  LOBYTE(v36) = objc_msgSend(v42, "isPrivateDataSyncingAllowed");
  v29 = -[FCPrivateDataContext initWithConfiguration:context:privateDataHostDirectory:privateDataActionProvider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:](v28, "initWithConfiguration:context:privateDataHostDirectory:privateDataActionProvider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:", v40, self, v23, v38, self, v24, v36);
  v30 = -[FCCloudContext initWithContentContext:privateDataContext:networkBehaviorMonitor:networkReachability:options:](self, "initWithContentContext:privateDataContext:networkBehaviorMonitor:networkReachability:options:", v27, v29, v24, v25, a17);
  v31 = v30;
  if (v30)
  {
    v30->_deviceIsiPad = a13;
    objc_storeStrong((id *)&v30->_pptContext, a16);
    objc_storeWeak((id *)&v31->_backgroundTaskable, v43);
  }

  return v31;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (void)setAppActivityMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_appActivityMonitor, a3);
}

- (FCArticleController)articleController
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "articleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCArticleController *)v3;
}

- (NSString)tabiResourcesContentDirectory
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabiResourcesContentDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)tabiModelsContentDirectory
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabiModelsContentDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FCAVAssetFactoryType)avAssetFactory
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avAssetFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCAVAssetFactoryType *)v3;
}

- (FCAVAssetPrewarming)avAssetPrewarmer
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avAssetPrewarmer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCAVAssetPrewarming *)v3;
}

- (id)recordTreeSourceWithRecordSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCCloudContext contentContext](self, "contentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordTreeSourceWithRecordSources:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateChannelMembershipController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCPrivateChannelMembershipController *)v3;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    NewsCoreUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = CFSTR("content_environment");
    v5[1] = CFSTR("news.modules.today_feed.debug_feed_config.url");
    v6[0] = CFSTR("production");
    v6[1] = CFSTR("http://127.0.0.1:8080/configs/today-config.jinja.yaml");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerDefaults:", v4);

  }
}

void __39__FCCloudContext_offlineArticleManager__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void (**v5)(void);

  objc_msgSend(*(id *)(a1 + 32), "offlineArticleManagerProvider");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

- (id)offlineArticleManagerProvider
{
  return self->_offlineArticleManagerProvider;
}

- (FCCloudContext)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCloudContext init]";
    v9 = 2080;
    v10 = "FCCloudContext.m";
    v11 = 1024;
    v12 = 143;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCloudContext init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (id)testingContext
{
  return -[FCCloudContext initForTesting]([FCCloudContext alloc], "initForTesting");
}

- (id)initForTesting
{
  return -[FCCloudContext initForTestingWithDesiredHeadlineFieldOptions:](self, "initForTestingWithDesiredHeadlineFieldOptions:", 0xF87FFFFC1);
}

+ (id)testingContextWithDesiredHeadlineFieldOptions:(unint64_t)a3
{
  return -[FCCloudContext initForTestingWithDesiredHeadlineFieldOptions:]([FCCloudContext alloc], "initForTestingWithDesiredHeadlineFieldOptions:", a3);
}

- (id)initForTestingWithDesiredHeadlineFieldOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FCNetworkBehaviorMonitor *v11;
  void *v12;
  FCNetworkBehaviorMonitor *v13;
  void *v14;
  id v15;
  FCContentContext *v16;
  void *v17;
  FCContentContext *v18;
  void *v19;
  FCPrivateDataContext *v20;
  void *v21;
  FCPrivateDataContext *v22;
  FCCloudContext *v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("news-testing-cache-%@"), v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [FCNetworkBehaviorMonitor alloc];
  objc_msgSend(v9, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FCNetworkBehaviorMonitor initWithCacheDirectory:](v11, "initWithCacheDirectory:", v12);

  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FCConfigurationManager initForTesting]([FCConfigurationManager alloc], "initForTesting");
  v16 = [FCContentContext alloc];
  +[FCCKTestContentDatabase testingDatabase](FCCKTestContentDatabase, "testingDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = 0;
  v18 = -[FCContentContext initWithConfiguration:configurationManager:contentDatabase:contentHostDirectory:networkBehaviorMonitor:networkReachability:setupCustomURLProtocols:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:](v16, "initWithConfiguration:configurationManager:contentDatabase:contentHostDirectory:networkBehaviorMonitor:networkReachability:setupCustomURLProtocols:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:", v10, v15, v17, v9, v13, v14, v25, a3, 2, self, 0, 0, 0);

  -[FCCloudContext setContentContext:](self, "setContentContext:", v18);
  v19 = (void *)objc_opt_new();
  -[FCCloudContext setAppActivityMonitor:](self, "setAppActivityMonitor:", v19);

  v20 = [FCPrivateDataContext alloc];
  +[FCCKPrivateDatabase testingDatabase](FCCKPrivateDatabase, "testingDatabase");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = 0;
  v22 = -[FCPrivateDataContext initWithConfiguration:context:privateDatabase:privateDataDirectory:privateDataActionProvider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:](v20, "initWithConfiguration:context:privateDatabase:privateDataDirectory:privateDataActionProvider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:", v10, self, v21, v9, 0, self, v13, v26);

  v23 = -[FCCloudContext initWithContentContext:privateDataContext:networkBehaviorMonitor:networkReachability:options:](self, "initWithContentContext:privateDataContext:networkBehaviorMonitor:networkReachability:options:", v18, v22, v13, v14, 0);
  return v23;
}

- (FCOfflineArticleManagerType)offlineArticleManager
{
  void *v4;
  void (**v5)(void);
  FCOfflineArticleManagerType *v6;
  FCOfflineArticleManagerType *offlineArticleManager;
  _QWORD block[5];

  if (!self->_offlineArticleManager)
  {
    -[FCCloudContext offlineArticleManagerProvider](self, "offlineArticleManagerProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        -[FCCloudContext offlineArticleManagerProvider](self, "offlineArticleManagerProvider");
        v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v5[2]();
        v6 = (FCOfflineArticleManagerType *)objc_claimAutoreleasedReturnValue();
        offlineArticleManager = self->_offlineArticleManager;
        self->_offlineArticleManager = v6;

      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __39__FCCloudContext_offlineArticleManager__block_invoke;
        block[3] = &unk_1E463AB18;
        block[4] = self;
        dispatch_sync(MEMORY[0x1E0C80D38], block);
      }
    }
  }
  return self->_offlineArticleManager;
}

- (id)notificationsController
{
  FCNotificationController *notificationController;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  notificationController = self->_notificationController;
  if (!notificationController)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_notificationController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext notificationsController]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 485;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_notificationController;
    }
    notificationController = 0;
  }
  return notificationController;
}

- (FCClientEndpointConnection)endpointConnection
{
  FCClientEndpointConnection *endpointConnection;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  endpointConnection = self->_endpointConnection;
  if (!endpointConnection)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_endpointConnection");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext endpointConnection]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 520;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_endpointConnection;
    }
    endpointConnection = 0;
  }
  return endpointConnection;
}

- (FCCommandQueue)endpointCommandQueue
{
  FCCommandQueue *endpointCommandQueue;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  endpointCommandQueue = self->_endpointCommandQueue;
  if (!endpointCommandQueue)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_endpointCommandQueue");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext endpointCommandQueue]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 526;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_endpointCommandQueue;
    }
    endpointCommandQueue = 0;
  }
  return endpointCommandQueue;
}

- (FCNotificationsEndpointConnection)notificationsEndpointConnection
{
  FCNotificationsEndpointConnection *notificationsEndpointConnection;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  notificationsEndpointConnection = self->_notificationsEndpointConnection;
  if (!notificationsEndpointConnection)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_notificationsEndpointConnection");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext notificationsEndpointConnection]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 532;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_notificationsEndpointConnection;
    }
    notificationsEndpointConnection = 0;
  }
  return notificationsEndpointConnection;
}

- (FCCommandQueue)notificationsEndpointCommandQueue
{
  FCCommandQueue *notificationsEndpointCommandQueue;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  notificationsEndpointCommandQueue = self->_notificationsEndpointCommandQueue;
  if (!notificationsEndpointCommandQueue)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_notificationsEndpointCommandQueue");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext notificationsEndpointCommandQueue]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 538;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_notificationsEndpointCommandQueue;
    }
    notificationsEndpointCommandQueue = 0;
  }
  return notificationsEndpointCommandQueue;
}

- (BOOL)isPrivateDataEncryptionEnabled
{
  void *v2;
  void *v3;
  _QWORD *v4;
  BOOL v5;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internalPrivateDataContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateDatabase");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[5] > 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isPrivateDatabaseStartingUp
{
  void *v2;
  void *v3;
  _BYTE *v4;
  BOOL v5;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internalPrivateDataContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateDatabase");
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[10] == 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isPrivateDatabaseOnline
{
  void *v2;
  void *v3;
  _QWORD *v4;
  BOOL v5;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internalPrivateDataContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateDatabase");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[20] == 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isPrivateDatabaseTemporarilySuspended
{
  void *v2;
  void *v3;
  _QWORD *v4;
  BOOL v5;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internalPrivateDataContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateDatabase");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[20] == 1;
  else
    v5 = 0;

  return v5;
}

- (void)ppt_overrideFeedEndpoint:(int64_t)a3
{
  id v4;

  -[FCCloudContext contentContext](self, "contentContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ppt_overrideFeedEndpoint:", a3);

}

- (void)ppt_prewarmFeedDatabase
{
  id v2;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ppt_prewarmFeedDatabase");

}

- (NSString)contentEnvironmentToken
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentEnvironmentToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3 exceptForFlusher:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[FCCloudContext contentContext](self, "contentContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enableFlushingWithFlushingThreshold:exceptForFlusher:", a3, v6);

}

- (void)setTabiBasedUserVectorAggregateVectorProvider:(id)a3
{
  -[FCUserVectorManager setTabiBasedAggregateVectorProvider:](self->_userVectorManager, "setTabiBasedAggregateVectorProvider:", a3);
}

- (FCFeedPersonalizing)feedPersonalizer
{
  FCFeedPersonalizing *feedPersonalizer;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  feedPersonalizer = self->_feedPersonalizer;
  if (!feedPersonalizer)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_feedPersonalizer");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext feedPersonalizer]";
      v8 = 2080;
      v9 = "FCCloudContext.m";
      v10 = 1024;
      v11 = 611;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_feedPersonalizer;
    }
    feedPersonalizer = 0;
  }
  return feedPersonalizer;
}

- (id)magazinesConfigurationManager
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "magazinesConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)contentStoreFrontID
{
  void *v2;
  void *v3;

  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentStoreFrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)supportedContentStoreFrontID
{
  void *v2;
  void *v3;

  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedContentStoreFrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)contentEnvironment
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)contentHostDirectoryURL
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentHostDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)tabiResourcesContentDirectoryLegacy
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabiResourcesContentDirectoryLegacy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)tabiModelsContentDirectoryLegacy
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabiModelsContentDirectoryLegacy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)tabiRequestsContentDirectory
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabiRequestsContentDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)assetCacheDirectoryURL
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetCacheDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (FCFeedDatabaseProtocol)feedDatabase
{
  void *v2;
  void *v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCFeedDatabaseProtocol *)v3;
}

- (id)convertRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCCloudContext contentContext](self, "contentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRecords:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)prewarmStores
{
  id v2;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prewarmStores");

}

- (int64_t)storageSize
{
  void *v2;
  int64_t v3;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "storageSize");

  return v3;
}

- (void)save
{
  id v2;

  -[FCCloudContext contentContext](self, "contentContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "save");

}

- (FCShortcutCategoryList)shortcutCategoryList
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortcutCategoryList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCShortcutCategoryList *)v3;
}

- (BOOL)isPrivateDataSyncingEnabled
{
  void *v2;
  char v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrivateDataSyncingEnabled");

  return v3;
}

- (id)privateStoreWithName:(id)a3 version:(unint64_t)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "privateStoreWithName:version:options:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (FCPrivateDataContextInternal)internalPrivateDataContext
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internalPrivateDataContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCPrivateDataContextInternal *)v3;
}

- (FCPushNotificationHandling)privatePushNotificationHandler
{
  void *v2;
  void *v3;

  -[FCCloudContext privateDataContext](self, "privateDataContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privatePushNotificationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCPushNotificationHandling *)v3;
}

- (id)insertTestArticle
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class();
  -[FCCloudContext contentContext](self, "contentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalContentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCCheckedDynamicCast(v3, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "insertTestArticle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)insertTestArticlesWithCount:(unint64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (a3)
  {
    --a3;
    -[FCCloudContext insertTestArticle](self, "insertTestArticle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return v5;
}

- (void)fetchDesiredVersionForDatabase:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[7];
  _QWORD v39[4];
  id v40;
  _QWORD *v41;
  _QWORD v42[4];
  id v43;
  _QWORD *v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[5];
  _QWORD v51[4];
  id v52;
  _QWORD v53[6];

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.news"));

  if ((v10 & 1) != 0)
  {
    NewsCoreUserDefaults();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerForKey:", CFSTR("encryption_desired_version_override"));

    switch(v12)
    {
      case 1:
        (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
        break;
      case 2:
        (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
        break;
      case 3:
        (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 2, 0);
        break;
      case 4:
        (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 3, 0);
        break;
      default:
        v13 = objc_alloc(MEMORY[0x1E0D60AF0]);
        v14 = MEMORY[0x1E0C809B0];
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_153;
        v51[3] = &unk_1E463DAD0;
        v52 = v6;
        v15 = (void *)objc_msgSend(v13, "initWithResolver:", v51);
        v50[0] = v14;
        v50[1] = 3221225472;
        v50[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_161;
        v50[3] = &unk_1E463DAD0;
        v50[4] = self;
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithResolver:", v50);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithResolver:", &__block_literal_global_45);
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x2020000000;
        v49[3] = 0;
        v48[0] = 0;
        v48[1] = v48;
        v48[2] = 0x2020000000;
        v48[3] = 0;
        v47[0] = 0;
        v47[1] = v47;
        v47[2] = 0x2020000000;
        v47[3] = 0;
        v18 = (void *)MEMORY[0x1E0D60AF0];
        v45[0] = v14;
        v45[1] = 3221225472;
        v45[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_175;
        v45[3] = &unk_1E463D3A8;
        v29 = v15;
        v46 = v29;
        objc_msgSend(v18, "firstly:", v45);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        zalgo();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v14;
        v42[1] = 3221225472;
        v42[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_177;
        v42[3] = &unk_1E4640820;
        v44 = v49;
        v28 = v16;
        v43 = v28;
        objc_msgSend(v33, "thenOn:then:", v32, v42);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        zalgo();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v14;
        v39[1] = 3221225472;
        v39[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_179;
        v39[3] = &unk_1E4640820;
        v41 = v48;
        v27 = v17;
        v40 = v27;
        objc_msgSend(v31, "thenOn:then:", v30, v39);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        zalgo();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v14;
        v38[1] = 3221225472;
        v38[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_4;
        v38[3] = &unk_1E4640848;
        v38[4] = v47;
        v38[5] = v49;
        v38[6] = v48;
        objc_msgSend(v19, "thenOn:then:", v20, v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        zalgo();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v14;
        v36[1] = 3221225472;
        v36[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_5;
        v36[3] = &unk_1E4640870;
        v23 = v7;
        v37 = v23;
        objc_msgSend(v21, "thenOn:then:", v22, v36);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        zalgo();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v14;
        v34[1] = 3221225472;
        v34[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_6;
        v34[3] = &unk_1E463DB48;
        v35 = v23;
        v26 = (id)objc_msgSend(v24, "errorOn:error:", v25, v34);

        _Block_object_dispose(v47, 8);
        _Block_object_dispose(v48, 8);
        _Block_object_dispose(v49, 8);

        break;
    }
  }
  else
  {
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke;
    v53[3] = &unk_1E463B598;
    v53[4] = v7;
    __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke((uint64_t)v53);
  }

}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "targeting base version because we're running outside the News app", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2;
  v10[3] = &unk_1E46407B0;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  -[FCCKPrivateDatabase fetchSecureDatabaseSupportedWithCompletionHandler:](v7, v10);

}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3;
    v13[3] = &unk_1E463B790;
    v7 = *(_QWORD *)(a1 + 32);
    v13[4] = v5;
    v13[5] = v7;
    __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3((uint64_t)v13);
  }
  else
  {
    v8 = FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("not supported");
      if (a2)
        v9 = CFSTR("supported");
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "secure database is %{public}@", buf, 0xCu);
    }
    v10 = *(_QWORD *)(a1 + 40);
    if (a2)
      v11 = 3;
    else
      v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  }
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "encountered error checking whether secure database is supported: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_161(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_162;
  v6[3] = &unk_1E463DAA8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchConfigurationIfNeededWithCompletion:", v6);

}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_162(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void (*v10)(void);
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  _QWORD v15[6];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_163;
    v15[3] = &unk_1E463B790;
    v8 = *(_QWORD *)(a1 + 32);
    v15[4] = v6;
    v15[5] = v8;
    __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_163((uint64_t)v15);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v5, "privateDataShouldMigrateToV4"))
    {
      v9 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "app config allows database v4 (ubiquitous encryption", v14, 2u);
      }
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else if (objc_msgSend(v5, "privateDataShouldSecureSubscriptions"))
    {
      v11 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "app config allows database v3 (secure subscriptions)", v14, 2u);
      }
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else if (objc_msgSend(v5, "isPrivateDataEncryptionAllowed")
           && objc_msgSend(v5, "isPrivateDataEncryptionMigrationDesired"))
    {
      v12 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "app config allows database v2 (selective encryption)", v14, 2u);
      }
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      v13 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "app config does not allow encryption", v14, 2u);
      }
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v10();
  }

}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_163(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "encountered error fetching app config for encryption settings: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_171(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_172;
  v5[3] = &unk_1E46407F8;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "fetchMinimumDeviceVersionsActiveSinceInterval:completionHandler:", v5, 7776000.0);

}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_172(uint64_t a1, _OWORD *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  _QWORD v17[6];
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_173;
    v17[3] = &unk_1E463B790;
    v7 = *(_QWORD *)(a1 + 32);
    v17[4] = v5;
    v17[5] = v7;
    __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_173((uint64_t)v17);
  }
  else
  {
    v8 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a2[1];
      *(_OWORD *)buf = *a2;
      v19 = v9;
      v10 = a2[3];
      v20 = a2[2];
      v21 = v10;
      v11 = v8;
      FCStringFromOSVersions((uint64_t *)buf);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "minimum active device versions are %{public}@", buf, 0xCu);

    }
    v13 = *(_QWORD *)(a1 + 32);
    v14 = a2[1];
    *(_OWORD *)buf = *a2;
    v19 = v14;
    v15 = a2[3];
    v20 = a2[2];
    v21 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", FCCKPrivateDatabaseVersionSupportedByOS((uint64_t *)buf));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v16);

  }
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_173(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "encountered error checking device versions: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_175(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_177(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "integerValue");
  return *(id *)(a1 + 32);
}

id __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_179(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "integerValue");
  return *(id *)(a1 + 32);
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_4(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(a2, "integerValue");
  v3 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) < v3)
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v3 >= *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
    v4 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  else
    v4 = v3;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_5(uint64_t a1, void *a2)
{
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "integerValue"), 0);
  return 0;
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCleanupToVersionForDatabase:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.news"));

  if ((v8 & 1) != 0)
  {
    NewsCoreUserDefaults();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerForKey:", CFSTR("encryption_cleanup_to_version_override"));

    switch(v10)
    {
      case 1:
        (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
        break;
      case 2:
        (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, 1, 0);
        break;
      case 3:
        (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, 2, 0);
        break;
      case 4:
        (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, 3, 0);
        break;
      default:
        v11 = objc_alloc(MEMORY[0x1E0D60AF0]);
        v12 = MEMORY[0x1E0C809B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_181;
        v28[3] = &unk_1E463DAD0;
        v28[4] = self;
        v13 = (void *)objc_msgSend(v11, "initWithResolver:", v28);
        v14 = (void *)MEMORY[0x1E0D60AF0];
        v26[0] = v12;
        v26[1] = 3221225472;
        v26[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_186;
        v26[3] = &unk_1E463D3A8;
        v27 = v13;
        v15 = v13;
        objc_msgSend(v14, "firstly:", v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        zalgo();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v12;
        v24[1] = 3221225472;
        v24[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_2_187;
        v24[3] = &unk_1E4640870;
        v18 = v5;
        v25 = v18;
        objc_msgSend(v16, "thenOn:then:", v17, v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        zalgo();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v12;
        v22[1] = 3221225472;
        v22[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_188;
        v22[3] = &unk_1E463DB48;
        v23 = v18;
        v21 = (id)objc_msgSend(v19, "errorOn:error:", v20, v22);

        break;
    }
  }
  else
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke;
    v29[3] = &unk_1E463B598;
    v29[4] = v5;
    __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke((uint64_t)v29);
  }

}

uint64_t __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "no cleanup because we're running outside the News app", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_181(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_2;
  v10[3] = &unk_1E463EF38;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "fetchConfigurationIfNeededWithCompletion:", v10);

}

void __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void (*v10)(void);
  NSObject *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint8_t v15[16];
  _QWORD v16[6];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_3;
    v16[3] = &unk_1E463B790;
    v8 = *(_QWORD *)(a1 + 32);
    v16[4] = v6;
    v16[5] = v8;
    __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_3((uint64_t)v16);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v5, "privateDataShouldCleanupToV4"))
    {
      v9 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "app config allows cleanup to v4 (ubiquitous encryption)", v15, 2u);
      }
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0
           && objc_msgSend(v5, "privateDataShouldCleanupAfterSecureSubscriptions"))
    {
      v11 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "app config allows cleanup to v3 (secure subscription)", v15, 2u);
      }
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      v12 = objc_msgSend(v5, "isPrivateDataMigrationCleanupEnabled");
      v13 = FCPrivateDataEncryptionLog;
      v14 = os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "app config allows cleanup to v2 (selective encryption)", v15, 2u);
        }
        v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      }
      else
      {
        if (v14)
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "app config does not allow encryption cleanup", v15, 2u);
        }
        v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      }
    }
    v10();
  }

}

uint64_t __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "encountered error fetching app config for encryption settings: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_186(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_2_187(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "integerValue");
  v4 = (void *)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    FCCKPrivateDatabaseVersionString(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "fetched desired private data cleanup version with result: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

uint64_t __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_188(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldAssetKeyManagerSimulateUnauthorizedAssetKeys:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NewsCoreUserDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("simulate_no_access_to_awk"));

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    NewsCoreUserDefaults();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("simulate_bo_access_to_awk"));

    if (v9)
    {
      -[FCCloudContext bundleSubscriptionManager](self, "bundleSubscriptionManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "self.bundleSubscriptionManager");
        *(_DWORD *)buf = 136315906;
        v20 = "-[FCCloudContext shouldAssetKeyManagerSimulateUnauthorizedAssetKeys:]";
        v21 = 2080;
        v22 = "FCCloudContext.m";
        v23 = 1024;
        v24 = 1097;
        v25 = 2114;
        v26 = v18;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      -[FCCloudContext bundleSubscriptionManager](self, "bundleSubscriptionManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cachedSubscription");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_getAssociatedObject((id)v12, (const void *)(v12 + 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");
      v15 = v14;
      objc_getAssociatedObject((id)v12, (const void *)~v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = ((objc_msgSend(v16, "unsignedIntegerValue") ^ v15) & 1) == 0;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[FCCloudContext contentContext](self, "contentContext", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalContentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetKeyManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearUnauthorizedAssetKeys");

}

- (void)_purchaseControllerDidAddALaCarteSubscription
{
  void *v2;
  void *v3;
  id v4;

  -[FCCloudContext contentContext](self, "contentContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalContentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetKeyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearUnauthorizedAssetKeys");

}

- (FCNewsletterEndpointConnection)newsletterEndpointConnection
{
  return self->_newsletterEndpointConnection;
}

- (FCCommandQueue)newsletterEndpointCommandQueue
{
  return self->_newsletterEndpointCommandQueue;
}

- (FCFeedItemInventoryType)peopleAlsoReadInventory
{
  return self->_peopleAlsoReadInventory;
}

- (FCPeopleAlsoReadInventoryManager)peopleAlsoReadInventoryManager
{
  return self->_peopleAlsoReadInventoryManager;
}

- (void)setEntitlementService:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementService, a3);
}

- (void)setTranslationManager:(id)a3
{
  objc_storeStrong((id *)&self->_translationManager, a3);
}

- (void)setLocalAreasManager:(id)a3
{
  objc_storeStrong((id *)&self->_localAreasManager, a3);
}

- (void)setCurrentIssuesChecker:(id)a3
{
  objc_storeStrong((id *)&self->_currentIssuesChecker, a3);
}

- (void)setPaidAccessChecker:(id)a3
{
  objc_storeStrong((id *)&self->_paidAccessChecker, a3);
}

- (FCAccessChecker)issueAccessChecker
{
  return self->_issueAccessChecker;
}

- (void)setIssueAccessChecker:(id)a3
{
  objc_storeStrong((id *)&self->_issueAccessChecker, a3);
}

- (FCAccessChecker)articleAccessChecker
{
  return self->_articleAccessChecker;
}

- (void)setArticleAccessChecker:(id)a3
{
  objc_storeStrong((id *)&self->_articleAccessChecker, a3);
}

- (FCLocalChannelsProvider)localChannelsProvider
{
  return self->_localChannelsProvider;
}

- (void)setBackgroundTaskable:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundTaskable, a3);
}

- (FCWebURLResolutionEndpointConnection)webURLResolutionEndpointConnection
{
  return self->_webURLResolutionEndpointConnection;
}

- (void)setPrivateDataContext:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataContext, a3);
}

- (FCUserVectorManager)userVectorManager
{
  return self->_userVectorManager;
}

- (void)setUserVectorManager:(id)a3
{
  objc_storeStrong((id *)&self->_userVectorManager, a3);
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVectorManager, 0);
  objc_storeStrong((id *)&self->_privateDataContext, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_pptContext, 0);
  objc_storeStrong((id *)&self->_webURLResolutionEndpointConnection, 0);
  objc_storeStrong(&self->_offlineArticleManagerProvider, 0);
  objc_destroyWeak((id *)&self->_backgroundTaskable);
  objc_storeStrong((id *)&self->_localChannelsProvider, 0);
  objc_storeStrong((id *)&self->_localRegionProvider, 0);
  objc_storeStrong((id *)&self->_articleAccessChecker, 0);
  objc_storeStrong((id *)&self->_issueAccessChecker, 0);
  objc_storeStrong((id *)&self->_paidAccessChecker, 0);
  objc_storeStrong((id *)&self->_currentIssuesChecker, 0);
  objc_storeStrong((id *)&self->_localAreasManager, 0);
  objc_storeStrong((id *)&self->_translationManager, 0);
  objc_storeStrong((id *)&self->_entitlementService, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_purchaseManager, 0);
  objc_storeStrong((id *)&self->_purchaseProvider, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_offlineArticleManager, 0);
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_notificationsEndpointCommandQueue, 0);
  objc_storeStrong((id *)&self->_notificationsEndpointConnection, 0);
  objc_storeStrong((id *)&self->_peopleAlsoReadInventoryManager, 0);
  objc_storeStrong((id *)&self->_peopleAlsoReadInventory, 0);
  objc_storeStrong((id *)&self->_eslInventory, 0);
  objc_storeStrong((id *)&self->_newsletterEndpointCommandQueue, 0);
  objc_storeStrong((id *)&self->_newsletterEndpointConnection, 0);
  objc_storeStrong((id *)&self->_newsletterManager, 0);
  objc_storeStrong((id *)&self->_endpointCommandQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_feedDatabase, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
}

@end
