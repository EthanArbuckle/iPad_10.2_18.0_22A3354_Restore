@implementation BCSBusinessQueryController

- (BCSBusinessQueryController)initWithChatSuggestMegashardFetcher:(id)a3 businessLinkMegashardFetcher:(id)a4 businessCallerMegashardFetcher:(id)a5 businessEmailMegashardFetcher:(id)a6 shardCache:(id)a7 cacheManager:(id)a8 chatSuggestRemoteFetcher:(id)a9 businessLinkRemoteFetcher:(id)a10 businessCallerRemoteFetcher:(id)a11 businessEmailRemoteFetcher:(id)a12 userDefaults:(id)a13 metricFactory:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BCSManualFetchTrigger *v25;
  BCSManualFetchTrigger *v26;
  BCSManualFetchTrigger *v27;
  BCSChatSuggestController *v28;
  void *v29;
  BCSLocaleHelper *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BCSHousekeeper *v35;
  void *v36;
  BCSHousekeeper *v37;
  BCSEntitlementVerifier *v38;
  void *v39;
  BCSBusinessQueryController *v40;
  BCSBusinessQueryController *v41;
  BCSURLPatternController *v43;
  _QWORD *v44;
  id *v45;
  id *v46;
  id *v47;
  id *v48;
  id *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v57;
  id *v58;
  id *v59;
  id *v60;
  id *v61;
  id *v62;
  id *v63;
  BCSManualFetchTrigger *v64;
  id *v65;
  BCSManualFetchTrigger *v66;
  BCSIconController *v68;
  id v69;
  id *v70;
  BCSManualFetchTrigger *v72;

  v18 = a14;
  v69 = a13;
  v54 = a12;
  v52 = a11;
  v50 = a10;
  v57 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = objc_alloc_init(BCSManualFetchTrigger);
  objc_msgSend(v24, "addFetchTrigger:");

  v26 = objc_alloc_init(BCSManualFetchTrigger);
  objc_msgSend(v23, "addFetchTrigger:", v26);

  v72 = objc_alloc_init(BCSManualFetchTrigger);
  objc_msgSend(v22, "addFetchTrigger:", v72);

  v27 = objc_alloc_init(BCSManualFetchTrigger);
  objc_msgSend(v21, "addFetchTrigger:");

  v68 = objc_alloc_init(BCSIconController);
  v28 = [BCSChatSuggestController alloc];
  +[BCSIdentityService sharedInstance]();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(BCSLocaleHelper);
  v63 = -[BCSChatSuggestController initWithUserDefaults:identityService:localeHelper:]((id *)&v28->super.isa, v69, v29, v30);

  v66 = v25;
  v70 = -[BCSConfigResolver initWithConfigCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSConfigResolver alloc], v19, v19, v25, v18);
  v64 = v26;
  v62 = -[BCSConfigResolver initWithConfigCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSConfigResolver alloc], v19, v19, v26, v18);
  v65 = -[BCSConfigResolver initWithConfigCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSConfigResolver alloc], v19, v19, v72, v18);
  v49 = -[BCSConfigResolver initWithConfigCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSConfigResolver alloc], v19, v19, v27, v18);
  v61 = -[BCSShardResolver initWithShardCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSShardResolver alloc], v20, v19, v25, v18);
  v48 = -[BCSShardResolver initWithShardCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSShardResolver alloc], v20, v19, v26, v18);
  v47 = -[BCSShardResolver initWithShardCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSShardResolver alloc], v20, v19, v72, v18);
  v60 = -[BCSShardResolver initWithShardCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSShardResolver alloc], v20, v19, v27, v18);

  v59 = -[BCSItemResolver initWithItemCache:cacheSkipper:remoteFetcher:metricFactory:]((id *)[BCSItemResolver alloc], v19, v19, v57, v18);
  v58 = -[BCSItemResolver initWithItemCache:cacheSkipper:remoteFetcher:metricFactory:]((id *)[BCSItemResolver alloc], v19, v19, v50, v18);

  objc_msgSend(v52, "environment");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "pirEnvironmentForServerType:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = -[BCSCallerIdResolver initWithEnvironment:itemCache:cacheSkipper:metricFactory:]((id *)[BCSCallerIdResolver alloc], v53, v19, v19, v18);
  objc_msgSend(v54, "environment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "pirEnvironmentForServerType:", 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v54, "environment");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "pirEnvironmentForServerType:", 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = -[BCSBusinessEmailResolver initWithMetadataEnvironment:logoEnvironment:itemCache:cacheSkipper:metricFactory:]((id *)[BCSBusinessEmailResolver alloc], v51, v55, v19, v19, v18);
  v44 = -[BCSQueryChopper initWithMetricFactory:]([BCSQueryChopper alloc], v18);
  v43 = -[BCSURLPatternController initWithCacheManager:metricFactory:]([BCSURLPatternController alloc], "initWithCacheManager:metricFactory:", v19, v18);
  +[BCSBlastDoorHelper defaultHelper](BCSBlastDoorHelper, "defaultHelper");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = [BCSHousekeeper alloc];
  +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[BCSHousekeeper initWithUserDefaults:](v35, "initWithUserDefaults:", v36);

  v38 = objc_alloc_init(BCSEntitlementVerifier);
  +[BCSIdentityService sharedInstance]();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[BCSBusinessQueryController initWithChatSuggestMegashardFetchTrigger:businessLinkMegashardFetchTrigger:businessCallerMegashardFetchTrigger:businessEmailMegashardFetchTrigger:entitlementVerifier:identityService:chatSuggestController:iconController:cacheClearer:shardCache:configCache:configCacheSkip:shardCacheSkip:chatSuggestConfigResolver:linkConfigResolver:businessCallerConfigResolver:businessEmailConfigResolver:chatSuggestShardResolver:linkShardResolver:businessCallerShardResolver:businessEmailShardResolver:chatSuggestItemResolver:linkItemResolver:businessCallerItemResolver:businessEmailItemResolver:queryChopper:patternController:metricFactory:blastDoorHelper:housekeeper:](self, "initWithChatSuggestMegashardFetchTrigger:businessLinkMegashardFetchTrigger:businessCallerMegashardFetchTrigger:businessEmailMegashardFetchTrigger:entitlementVerifier:identityService:chatSuggestController:iconController:cacheClearer:shardCache:configCache:configCacheSkip:shardCacheSkip:chatSuggestConfigResolver:linkConfigResolver:businessCallerConfigResolver:businessEmailConfigResolver:chatSuggestShardResolver:linkShardResolver:businessCallerShardResolver:businessEmailShardResolver:chatSuggestItemResolver:linkItemResolver:businessCallerItemResolver:businessEmailItemResolver:queryChopper:patternController:metricFactory:blastDoorHelper:housekeeper:", v66, v26, v72, v27, v38, v39, v63, v68, v19, v19, v19, v19,
          v19,
          v70,
          v62,
          v65,
          v49,
          v61,
          v48,
          v47,
          v60,
          v59,
          v58,
          v46,
          v45,
          v44,
          v43,
          v18,
          v34,
          v37);

  v41 = v40;
  return v41;
}

- (BCSBusinessQueryController)initWithChatSuggestMegashardFetchTrigger:(id)a3 businessLinkMegashardFetchTrigger:(id)a4 businessCallerMegashardFetchTrigger:(id)a5 businessEmailMegashardFetchTrigger:(id)a6 entitlementVerifier:(id)a7 identityService:(id)a8 chatSuggestController:(id)a9 iconController:(id)a10 cacheClearer:(id)a11 shardCache:(id)a12 configCache:(id)a13 configCacheSkip:(id)a14 shardCacheSkip:(id)a15 chatSuggestConfigResolver:(id)a16 linkConfigResolver:(id)a17 businessCallerConfigResolver:(id)a18 businessEmailConfigResolver:(id)a19 chatSuggestShardResolver:(id)a20 linkShardResolver:(id)a21 businessCallerShardResolver:(id)a22 businessEmailShardResolver:(id)a23 chatSuggestItemResolver:(id)a24 linkItemResolver:(id)a25 businessCallerItemResolver:(id)a26 businessEmailItemResolver:(id)a27 queryChopper:(id)a28 patternController:(id)a29 metricFactory:(id)a30 blastDoorHelper:(id)a31 housekeeper:(id)a32
{
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  BCSBusinessQueryController *v44;
  BCSBusinessQueryController *v45;
  NSObject *v46;
  dispatch_time_t v47;
  id v50;
  id v51;
  id v52;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  objc_super v78;
  __int128 buf;
  void (*v80)(uint64_t);
  void *v81;
  BCSBusinessQueryController *v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v77 = a3;
  v50 = a4;
  v76 = a4;
  v75 = a5;
  v51 = a6;
  v74 = a6;
  v52 = a7;
  v73 = a7;
  v72 = a8;
  v71 = a9;
  v70 = a10;
  v69 = a11;
  v68 = a12;
  v67 = a13;
  v66 = a14;
  v65 = a15;
  v64 = a16;
  v63 = a17;
  v62 = a18;
  v61 = a19;
  v60 = a20;
  v59 = a21;
  v58 = a22;
  v57 = a23;
  v56 = a24;
  v37 = a25;
  v38 = a26;
  v39 = a27;
  v40 = a28;
  v41 = a29;
  v42 = a30;
  v43 = a31;
  v55 = a32;
  v78.receiver = self;
  v78.super_class = (Class)BCSBusinessQueryController;
  v44 = -[BCSBusinessQueryController init](&v78, sel_init);
  v45 = v44;
  if (v44)
  {
    v54 = v42;
    objc_storeStrong((id *)&v44->_chatSuggestMegashardFetchTrigger, a3);
    objc_storeStrong((id *)&v45->_businessLinkMegashardFetchTrigger, v50);
    objc_storeStrong((id *)&v45->_businessCallerMegashardFetchTrigger, a5);
    objc_storeStrong((id *)&v45->_businessEmailMegashardFetchTrigger, v51);
    objc_storeStrong((id *)&v45->_entitlementVerifier, v52);
    objc_storeStrong((id *)&v45->_identityService, a8);
    objc_storeStrong((id *)&v45->_chatSuggestController, a9);
    objc_storeStrong((id *)&v45->_iconController, a10);
    objc_storeStrong((id *)&v45->_cacheClearer, a11);
    objc_storeStrong((id *)&v45->_shardCache, a12);
    objc_storeStrong((id *)&v45->_configCache, a13);
    objc_storeStrong((id *)&v45->_configCacheSkip, a14);
    objc_storeStrong((id *)&v45->_shardCacheSkip, a15);
    objc_storeStrong((id *)&v45->_chatSuggestConfigResolver, a16);
    objc_storeStrong((id *)&v45->_linkConfigResolver, a17);
    objc_storeStrong((id *)&v45->_businessCallerConfigResolver, a18);
    objc_storeStrong((id *)&v45->_businessEmailConfigResolver, a19);
    objc_storeStrong((id *)&v45->_chatSuggestShardResolver, a20);
    objc_storeStrong((id *)&v45->_linkShardResolver, a21);
    objc_storeStrong((id *)&v45->_businessCallerShardResolver, a22);
    objc_storeStrong((id *)&v45->_businessEmailShardResolver, a23);
    objc_storeStrong((id *)&v45->_chatSuggestItemResolver, a24);
    objc_storeStrong((id *)&v45->_linkItemResolver, a25);
    objc_storeStrong((id *)&v45->_businessCallerItemResolver, a26);
    objc_storeStrong((id *)&v45->_businessEmailItemResolver, a27);
    objc_storeStrong((id *)&v45->_queryChopper, a28);
    objc_storeStrong((id *)&v45->_patternController, a29);
    objc_storeStrong((id *)&v45->_metricFactory, a30);
    objc_storeStrong((id *)&v45->_blastDoorHelper, a31);
    objc_storeStrong((id *)&v45->_housekeeper, a32);
    v45->_blastDoorWarmedUp = 0;
    ABSLogCommon();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[BCSBusinessQueryController startUpTasks]";
      _os_log_impl(&dword_20ACAD000, v46, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
    }

    v47 = dispatch_time(0, 5000000000);
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v80 = __42__BCSBusinessQueryController_startUpTasks__block_invoke;
    v81 = &unk_24C39C268;
    v82 = v45;
    dispatch_after(v47, MEMORY[0x24BDAC9B8], &buf);
    v42 = v54;
  }

  return v45;
}

void __42__BCSBusinessQueryController_startUpTasks__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    ABSLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20ACAD000, v2, OS_LOG_TYPE_DEFAULT, "BlastDoor already warm", v4, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(v1 + 256), "warmUpBlastDoor");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  }
}

- (void)warmCacheIfNecessaryForPhoneNumbers:(id)a3 forClientBundleID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[BCSBusinessQueryController warmCacheIfNecessaryForPhoneNumbers:forClientBundleID:]";
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[BCSBusinessQueryController fetchIsBusinessPhoneNumber:forClientBundleID:completion:](self, "fetchIsBusinessPhoneNumber:forClientBundleID:completion:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v7, &__block_literal_global_5, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)fetchBusinessItemWithDetailsForPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[BCSBusinessQueryController fetchBusinessItemWithDetailsForPhoneNumber:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __102__BCSBusinessQueryController_fetchBusinessItemWithDetailsForPhoneNumber_forClientBundleID_completion___block_invoke;
    v12[3] = &unk_24C39C750;
    v12[4] = self;
    v13 = v10;
    -[BCSBusinessQueryController fetchBusinessItemWithPhoneNumber:forClientBundleID:completion:](self, "fetchBusinessItemWithPhoneNumber:forClientBundleID:completion:", v8, v9, v12);

  }
}

void __102__BCSBusinessQueryController_fetchBusinessItemWithDetailsForPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 40);
  else
    v6 = 0;
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "chatSuggestVisibilityForBusinessItem:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchIsBusinessPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v14;
  void *v15;
  BCSMetricFactoryProtocol *v16;
  BCSMetricFactoryProtocol *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[BCSBusinessQueryController fetchIsBusinessPhoneNumber:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    +[BCSBusinessItemIdentifier identifierWithPhoneNumber:]((uint64_t)BCSBusinessItemIdentifier, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      metricFactory = self->_metricFactory;
    else
      metricFactory = 0;
    v14 = metricFactory;
    -[BCSMetricFactoryProtocol chatSuggestRegisteredMetricForItemIdentifier:](v14, "chatSuggestRegisteredMetricForItemIdentifier:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
      v16 = self->_metricFactory;
    else
      v16 = 0;
    v17 = v16;
    -[BCSMetricFactoryProtocol measurementFactory](v17, "measurementFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "itemIsRegisteredTimingMeasurementForItemIdentifier:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTimingMeasurement:", v19);

    objc_msgSend(v15, "timingMeasurement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "begin");

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __86__BCSBusinessQueryController_fetchIsBusinessPhoneNumber_forClientBundleID_completion___block_invoke;
    v22[3] = &unk_24C39C750;
    v23 = v15;
    v24 = v10;
    v21 = v15;
    -[BCSBusinessQueryController fetchBusinessItemWithPhoneNumber:forClientBundleID:completion:](self, "fetchBusinessItemWithPhoneNumber:forClientBundleID:completion:", v8, v9, v22);

  }
}

void __86__BCSBusinessQueryController_fetchIsBusinessPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "timingMeasurement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "end");

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchSquareIconDataForBusinessItem:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[BCSBusinessQueryController fetchSquareIconDataForBusinessItem:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    if (self)
      self = (BCSBusinessQueryController *)self->_iconController;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __94__BCSBusinessQueryController_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke;
    v12[3] = &unk_24C39C4F8;
    v13 = v10;
    -[BCSBusinessQueryController fetchSquareIconDataForBusinessItem:forClientBundleID:completion:](self, "fetchSquareIconDataForBusinessItem:forClientBundleID:completion:", v8, v9, v12);

  }
}

uint64_t __94__BCSBusinessQueryController_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchBusinessItemWithPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v14;
  void *v15;
  BCSMetricFactoryProtocol *v16;
  BCSMetricFactoryProtocol *v17;
  void *v18;
  void *v19;
  void *v20;
  BCSQuery *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[BCSBusinessQueryController fetchBusinessItemWithPhoneNumber:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    +[BCSBusinessItemIdentifier identifierWithPhoneNumber:]((uint64_t)BCSBusinessItemIdentifier, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      metricFactory = self->_metricFactory;
    else
      metricFactory = 0;
    v14 = metricFactory;
    -[BCSMetricFactoryProtocol chatSuggestFetchMetricForItemIdentifier:](v14, "chatSuggestFetchMetricForItemIdentifier:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
      v16 = self->_metricFactory;
    else
      v16 = 0;
    v17 = v16;
    -[BCSMetricFactoryProtocol measurementFactory](v17, "measurementFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "itemFetchTimingMeasurementForItemIdentifier:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTimingMeasurement:", v19);

    objc_msgSend(v15, "timingMeasurement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "begin");

    v21 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:", v12, v9, 1);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __92__BCSBusinessQueryController_fetchBusinessItemWithPhoneNumber_forClientBundleID_completion___block_invoke;
    v23[3] = &unk_24C39C778;
    v24 = v15;
    v25 = v10;
    v22 = v15;
    -[BCSBusinessQueryController fetchItemWithQuery:completion:](self, "fetchItemWithQuery:completion:", v21, v23);

  }
}

void __92__BCSBusinessQueryController_fetchBusinessItemWithPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "timingMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchLinkItemModelWithURL:(id)a3 chopURL:(BOOL)a4 forClientBundleID:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v16;
  void *v17;
  BCSMetricFactoryProtocol *v18;
  void *v19;
  void *v20;
  void *v21;
  BCSURLPatternControllerProtocol *patternController;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v8 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  ABSLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v12)
  {
    +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (self)
        metricFactory = self->_metricFactory;
      else
        metricFactory = 0;
      v16 = metricFactory;
      -[BCSMetricFactoryProtocol businessLinkFetchMetricForItemIdentifier:](v16, "businessLinkFetchMetricForItemIdentifier:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setChoppingEnabled:", v8);
      if (self)
      {
        v18 = self->_metricFactory;
        -[BCSMetricFactoryProtocol measurementFactory](v18, "measurementFactory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "itemFetchTimingMeasurementForItemIdentifier:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTimingMeasurement:", v20);

        objc_msgSend(v17, "timingMeasurement");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "begin");

        patternController = self->_patternController;
      }
      else
      {
        objc_msgSend(0, "measurementFactory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "itemFetchTimingMeasurementForItemIdentifier:", v14);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTimingMeasurement:", v26);

        objc_msgSend(v17, "timingMeasurement");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "begin");

        patternController = 0;
      }
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke;
      v28[3] = &unk_24C39C840;
      v34 = v8;
      v28[4] = self;
      v29 = v10;
      v30 = v14;
      v31 = v11;
      v32 = v17;
      v33 = v12;
      v23 = v17;
      -[BCSURLPatternControllerProtocol matchPatternForURL:forClientBundleID:completion:](patternController, "matchPatternForURL:forClientBundleID:completion:", v29, v31, v28);

    }
    else
    {
      ABSLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]";
        _os_log_impl(&dword_20ACAD000, v24, OS_LOG_TYPE_DEFAULT, "%s can't generate a BCSLinkItemIdentifier with the given URL", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
    }

  }
}

void __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BCSQuery *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  ABSLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v28 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]_block_invoke";
    v29 = 2114;
    v30 = v7;
    _os_log_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_DEFAULT, "%s - Found extracted URL? : %{public}@", buf, 0x16u);

  }
  v8 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_26;
  v20[3] = &unk_24C39C7C8;
  v26 = *(_BYTE *)(a1 + 80);
  v9 = *(void **)(a1 + 40);
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = v9;
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v24 = *(id *)(a1 + 64);
  v25 = *(id *)(a1 + 72);
  v10 = MEMORY[0x20BD30274](v20);
  v11 = (void *)v10;
  if (v5)
  {
    +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:skipRegistrationCheck:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:skipRegistrationCheck:", v12, *(_QWORD *)(a1 + 56), 2, 1);
    v14 = *(void **)(a1 + 32);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_29;
    v15[3] = &unk_24C39C7F0;
    v16 = *(id *)(a1 + 64);
    v17 = v5;
    v18 = *(id *)(a1 + 72);
    v19 = v11;
    objc_msgSend(v14, "fetchItemWithQuery:completion:", v13, v15);

  }
  else
  {
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }

}

void __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_26(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  BCSQuery *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  BCSQuery *v16;
  id v17;

  if (*(_BYTE *)(a1 + 80))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      v3 = *(void **)(v2 + 184);
    else
      v3 = 0;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v6 = v3;
    v7 = -[BCSBusinessQueryController _isBloomFilterCachedForType:]((id *)v2, objc_msgSend(v5, "type"));
    v9 = *(_QWORD *)(a1 + 56);
    v8 = *(void **)(a1 + 64);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_2;
    v15[3] = &unk_24C39C7A0;
    v16 = v8;
    v17 = *(id *)(a1 + 72);
    objc_msgSend(v6, "queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCached:forClientBundleID:metric:completion:", v2, v4, v7, v9, v16, v15);

    v10 = v16;
  }
  else
  {
    v10 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 2);
    v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_28;
    v12[3] = &unk_24C39C778;
    v13 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 72);
    objc_msgSend(v11, "fetchItemWithQuery:completion:", v10, v12);

  }
}

- (unint64_t)_isBloomFilterCachedForType:(id *)a1
{
  unint64_t v2;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (unint64_t)a1;
  if (a1)
  {
    v4 = a1[28];
    if ((objc_msgSend(v4, "shouldSkipCacheForConfigItemOfType:", a2) & 1) != 0)
      goto LABEL_3;
    v5 = objc_msgSend(*(id *)(v2 + 232), "shouldSkipCacheForShardItemOfType:", a2);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(v2 + 216), "configItemForType:", a2);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        if ((unint64_t)(a2 - 2) > 2)
          v6 = 1;
        else
          v6 = qword_20AD1B4C8[a2 - 2];
        v7 = objc_msgSend(*(id *)(v2 + 208), "countOfShardsOfType:", v6);
        v2 = v7 == objc_msgSend(v4, "filterShardCount");
        goto LABEL_11;
      }
LABEL_3:
      v2 = 0;
LABEL_11:

      return v2;
    }
    return 0;
  }
  return v2;
}

void __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timingMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]_block_invoke_2";
    v15 = 2114;
    v16 = v10;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - found item: %{public}@ - error:%@", (uint8_t *)&v13, 0x20u);

  }
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6);

}

void __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "timingMeasurement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "end");

  if (v7)
    v9 = 1;
  else
    v9 = -1;
  objc_msgSend(*(id *)(a1 + 32), "setSuccessfulChop:", v9);
  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v5, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]_block_invoke";
    v16 = 2114;
    v17 = v11;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s - found item: %{public}@ - error:%@", (uint8_t *)&v14, 0x20u);

  }
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v5);
}

void __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v17 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]_block_invoke";
    v18 = 2114;
    v19 = v8;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s - Using extracted URL. Found link item? : %{public}@ - error:%@", buf, 0x20u);

  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "timingMeasurement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "end");

    objc_msgSend(*(id *)(a1 + 32), "setSuccessfulChop:", 6);
    objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
    objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
    objc_msgSend(*(id *)(a1 + 40), "absoluteString", CFSTR("BCSBusinessQueryServicePatternMatchingExtractedURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDebugInfo:", v11);

    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)isBusinessRegisteredForURL:(id)a3 chopURL:(BOOL)a4 forClientBundleID:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v16;
  void *v17;
  BCSMetricFactoryProtocol *v18;
  BCSMetricFactoryProtocol *v19;
  void *v20;
  void *v21;
  void *v22;
  BCSQuery *v23;
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  BCSBusinessQueryController *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v8 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  ABSLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[BCSBusinessQueryController isBusinessRegisteredForURL:chopURL:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v12)
  {
    +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (self)
        metricFactory = self->_metricFactory;
      else
        metricFactory = 0;
      v16 = metricFactory;
      -[BCSMetricFactoryProtocol businessLinkRegisteredMetricForItemIdentifier:](v16, "businessLinkRegisteredMetricForItemIdentifier:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setChoppingEnabled:", v8);
      if (self)
        v18 = self->_metricFactory;
      else
        v18 = 0;
      v19 = v18;
      -[BCSMetricFactoryProtocol measurementFactory](v19, "measurementFactory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "itemIsRegisteredTimingMeasurementForItemIdentifier:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTimingMeasurement:", v21);

      objc_msgSend(v17, "timingMeasurement");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "begin");

      v23 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:", v14, v11, 3);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke;
      v26[3] = &unk_24C39C868;
      v27 = v14;
      v28 = self;
      v29 = v10;
      v30 = v11;
      v31 = v17;
      v32 = v12;
      v33 = v8;
      v24 = v17;
      -[BCSBusinessQueryController fetchShardWithQuery:completion:](self, "fetchShardWithQuery:completion:", v23, v26);

    }
    else
    {
      ABSLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[BCSBusinessQueryController isBusinessRegisteredForURL:chopURL:forClientBundleID:completion:]";
        _os_log_impl(&dword_20ACAD000, v25, OS_LOG_TYPE_DEFAULT, "%s can't generate a BCSLinkItemIdentifier with the given URL", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, 0, 0, 0, 0);
    }

  }
}

void __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  char v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  ABSLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v30 = "-[BCSBusinessQueryController isBusinessRegisteredForURL:chopURL:forClientBundleID:completion:]_block_invoke";
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_DEFAULT, "%s Domain shard lookup returned :%@", buf, 0x16u);

  }
  v8 = *(_QWORD **)(a1 + 40);
  if (v5)
  {
    if (v8)
      v8 = (_QWORD *)v8[30];
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_32;
    v21[3] = &unk_24C39C840;
    v11 = &v22;
    v22 = *(id *)(a1 + 64);
    v23 = v4;
    v12 = *(id *)(a1 + 72);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(a1 + 48);
    v27 = v12;
    v24 = v13;
    v25 = v14;
    v28 = *(_BYTE *)(a1 + 80);
    v26 = *(id *)(a1 + 56);
    objc_msgSend(v8, "matchPatternForURL:forClientBundleID:completion:", v9, v10, v21);

  }
  else
  {
    v15 = *(unsigned __int8 *)(a1 + 80);
    v16 = *(void **)(a1 + 48);
    v17 = *(void **)(a1 + 56);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_2;
    v19[3] = &unk_24C39C818;
    v11 = &v20;
    v18 = *(void **)(a1 + 64);
    v20 = *(id *)(a1 + 72);
    -[BCSBusinessQueryController lookupBloomFiltersForURL:chopURL:forClientBundleID:registeredMetric:completion:]((id *)v8, v16, v15, v17, v18, v19);
  }

}

void __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_32(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v21 = "-[BCSBusinessQueryController isBusinessRegisteredForURL:chopURL:forClientBundleID:completion:]_block_invoke";
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s Pattern matcher returned matchFound: %@, matchingBundleID: %@", buf, 0x20u);

  }
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "timingMeasurement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "end");

    objc_msgSend(*(id *)(a1 + 32), "setSuccessfulChop:", 6);
    objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
    objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v13 = *(id **)(a1 + 48);
    v14 = *(void **)(a1 + 56);
    v15 = *(unsigned __int8 *)(a1 + 80);
    v16 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_33;
    v18[3] = &unk_24C39C818;
    v17 = *(void **)(a1 + 64);
    v19 = *(id *)(a1 + 72);
    -[BCSBusinessQueryController lookupBloomFiltersForURL:chopURL:forClientBundleID:registeredMetric:completion:](v13, v14, v15, v17, v16, v18);

  }
}

uint64_t __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)lookupBloomFiltersForURL:(int)a3 chopURL:(void *)a4 forClientBundleID:(void *)a5 registeredMetric:(void *)a6 completion:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  unint64_t v17;
  BCSQuery *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;
  _QWORD v23[4];
  BCSQuery *v24;
  id v25;

  v11 = a2;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (a1)
  {
    +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v16 = a1[23];
      v17 = -[BCSBusinessQueryController _isBloomFilterCachedForType:](a1, objc_msgSend(v15, "type"));
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __109__BCSBusinessQueryController_lookupBloomFiltersForURL_chopURL_forClientBundleID_registeredMetric_completion___block_invoke;
      v23[3] = &unk_24C39C890;
      v24 = (BCSQuery *)v13;
      v25 = v14;
      objc_msgSend(v16, "queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCached:forClientBundleID:metric:completion:", a1, v11, v17, v12, v24, v23);

      v18 = v24;
    }
    else
    {
      v18 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:", v15, v12, 2);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __109__BCSBusinessQueryController_lookupBloomFiltersForURL_chopURL_forClientBundleID_registeredMetric_completion___block_invoke_36;
      v19[3] = &unk_24C39C8B8;
      v20 = v13;
      v22 = 0;
      v21 = v14;
      objc_msgSend(a1, "fetchIsBusinessRegisteredWithQuery:completion:", v18, v19);

    }
  }

}

uint64_t __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __109__BCSBusinessQueryController_lookupBloomFiltersForURL_chopURL_forClientBundleID_registeredMetric_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "timingMeasurement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "end");

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[BCSBusinessQueryController lookupBloomFiltersForURL:chopURL:forClientBundleID:registeredMetric:completion:]_block_invoke";
    v14 = 2114;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s - returned %{public}@ - error:%@", (uint8_t *)&v12, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __109__BCSBusinessQueryController_lookupBloomFiltersForURL_chopURL_forClientBundleID_registeredMetric_completion___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timingMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");

  if (objc_msgSend(v5, "hasBusiness"))
    v8 = 1;
  else
    v8 = -1;
  objc_msgSend(*(id *)(a1 + 32), "setSuccessfulChop:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  ABSLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "hasBusiness");
    NSStringFromBOOL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[BCSBusinessQueryController lookupBloomFiltersForURL:chopURL:forClientBundleID:registeredMetric:completion:]_block_invoke";
    v13 = 2114;
    v14 = v10;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_DEFAULT, "%s - returned %{public}@ - error:%@", (uint8_t *)&v11, 0x20u);

  }
  if ((objc_msgSend(v5, "hasBusiness") & 1) != 0 || !*(_BYTE *)(a1 + 48))
    (*(void (**)(_QWORD, uint64_t, _QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v5, "hasBusiness"), 0, v6);

}

- (void)fetchLinkItemModelWithHash:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v14;
  void *v15;
  BCSMetricFactoryProtocol *v16;
  BCSMetricFactoryProtocol *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  BCSMetricFactoryProtocol *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  BCSQuery *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  void (**v36)(_QWORD, _QWORD, _QWORD);
  _QWORD v37[4];
  id v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[BCSBusinessQueryController fetchLinkItemModelWithHash:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    +[BCSLinkItemIdentifier identifierWithHash:]((uint64_t)BCSLinkItemIdentifier, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (self)
        metricFactory = self->_metricFactory;
      else
        metricFactory = 0;
      v14 = metricFactory;
      -[BCSMetricFactoryProtocol businessLinkHashFetchMetricForItemIdentifier:](v14, "businessLinkHashFetchMetricForItemIdentifier:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v9;
      if (self)
        v16 = self->_metricFactory;
      else
        v16 = 0;
      v17 = v16;
      -[BCSMetricFactoryProtocol measurementFactory](v17, "measurementFactory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "businessLinkFetchByHashTimingMeasurementForItemIdentifier:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTimingMeasurement:", v19);

      objc_msgSend(v15, "timingMeasurement");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "begin");

      v21 = MEMORY[0x24BDAC760];
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __86__BCSBusinessQueryController_fetchLinkItemModelWithHash_forClientBundleID_completion___block_invoke;
      v37[3] = &unk_24C39C7A0;
      v33 = v15;
      v38 = v33;
      v39 = v10;
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD30274](v37);
      v23 = v21;
      if (self)
        v24 = self->_metricFactory;
      else
        v24 = 0;
      -[BCSMetricFactoryProtocol measurementFactory](v24, "measurementFactory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "itemCacheHitMeasurementForItemIdentifier:", v12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[BCSBusinessQueryController _itemResolverForType:]((uint64_t)self, (char *)objc_msgSend(v12, "type"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "cachedItemMatching:", v12);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        ABSLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromBCSType(objc_msgSend(v12, "type"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v41 = "-[BCSBusinessQueryController fetchLinkItemModelWithHash:forClientBundleID:completion:]";
          v42 = 2112;
          v43 = v30;
          _os_log_impl(&dword_20ACAD000, v29, OS_LOG_TYPE_DEFAULT, "%s - Returned cached item - type: %@", buf, 0x16u);

        }
        objc_msgSend(v26, "setFlag:", 1);
        ((void (**)(_QWORD, void *, _QWORD))v22)[2](v22, v28, 0);
        v9 = v34;
      }
      else
      {
        objc_msgSend(v26, "setFlag:", 0);
        v9 = v34;
        v32 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:skipRegistrationCheck:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:skipRegistrationCheck:", v12, v34, 2, 1);
        v35[0] = v23;
        v35[1] = 3221225472;
        v35[2] = __86__BCSBusinessQueryController_fetchLinkItemModelWithHash_forClientBundleID_completion___block_invoke_38;
        v35[3] = &unk_24C39C8E0;
        v36 = v22;
        -[BCSBusinessQueryController fetchItemWithQuery:completion:](self, "fetchItemWithQuery:completion:", v32, v35);

      }
    }
    else
    {
      ABSLogCommon();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[BCSBusinessQueryController fetchLinkItemModelWithHash:forClientBundleID:completion:]";
        _os_log_impl(&dword_20ACAD000, v31, OS_LOG_TYPE_DEFAULT, "%s can't generate a BCSLinkItemIdentifier with the given hash", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }

  }
}

void __86__BCSBusinessQueryController_fetchLinkItemModelWithHash_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "timingMeasurement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "end");

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "model");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v6);
}

- (char)_itemResolverForType:(uint64_t)a1
{
  if (!a1)
    return (char *)0;
  if ((unint64_t)(a2 - 1) <= 3)
    a2 = (char *)*(id *)(a1 + 24 * (_QWORD)(a2 - 1) + 48);
  return a2;
}

uint64_t __86__BCSBusinessQueryController_fetchLinkItemModelWithHash_forClientBundleID_completion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchConfigForQuery:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v13;
  void *v14;
  void *v15;
  BCSMetricFactoryProtocol *v16;
  BCSMetricFactoryProtocol *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  void (**v30)(id, id, _QWORD);
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[BCSBusinessQueryController fetchConfigForQuery:completion:]";
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_msgSend(v6, "config");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    ABSLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEBUG, "Returning config cached in query", buf, 2u);
    }

    objc_msgSend(v6, "config");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11, 0);
  }
  else
  {
    if (self)
      metricFactory = self->_metricFactory;
    else
      metricFactory = 0;
    v13 = metricFactory;
    objc_msgSend(v6, "itemIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSMetricFactoryProtocol configResolutionMetricForConfigType:](v13, "configResolutionMetricForConfigType:", objc_msgSend(v14, "type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
      v16 = self->_metricFactory;
    else
      v16 = 0;
    v17 = v16;
    -[BCSMetricFactoryProtocol measurementFactory](v17, "measurementFactory");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configResolutionTimingMeasurementForConfigType:", objc_msgSend(v19, "type"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTimingMeasurement:", v20);

    objc_msgSend(v15, "timingMeasurement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "begin");

    objc_msgSend(v6, "itemIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "type");
    if (self)
    {
      if ((unint64_t)(v23 - 1) <= 3)
        v18 = *((id *)&self->_cacheClearer + 3 * v23);
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v6, "itemIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "type");
    objc_msgSend(v6, "clientBundleId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __61__BCSBusinessQueryController_fetchConfigForQuery_completion___block_invoke;
    v27[3] = &unk_24C39C908;
    v28 = v15;
    v29 = v6;
    v30 = v7;
    v11 = v15;
    objc_msgSend(v18, "configItemWithType:clientBundleID:metric:completion:", v25, v26, v11, v27);

  }
}

void __61__BCSBusinessQueryController_fetchConfigForQuery_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timingMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  if (!v5 || v6)
  {
    ABSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v9, "type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[BCSBusinessQueryController fetchConfigForQuery:completion:]_block_invoke";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - Fetch config failed - type: %@", buf, 0x16u);

    }
    if (!v6)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BDD0FC8];
      v14 = CFSTR("Nil configItem & nil fetchConfigError");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 40, v12);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)fetchShardWithQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BCSBusinessQueryController *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[BCSBusinessQueryController fetchShardWithQuery:completion:]";
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__BCSBusinessQueryController_fetchShardWithQuery_completion___block_invoke;
  v11[3] = &unk_24C39C958;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  -[BCSBusinessQueryController fetchConfigForQuery:completion:](self, "fetchConfigForQuery:completion:", v9, v11);

}

void __61__BCSBusinessQueryController_fetchShardWithQuery_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (v5 | a3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "shardType") == 3)
      v8 = objc_msgSend((id)v5, "domainShardCount");
    else
      v8 = objc_msgSend((id)v5, "filterShardCount");
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(a1 + 32), "shardType");
    v13 = v11;
    if (v10)
    {
      if (v9)
      {
        if (0x7FFFFFFFFFFFFFFFLL / v9 <= 25000)
          v14 = 25000;
        else
          v14 = 0x7FFFFFFFFFFFFFFFLL / v9;
        if (v12 == 3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (v13)
          {
            v15 = *((_QWORD *)v13 + 3);
            if (!v15)
            {
              v15 = -[BCSLinkItemIdentifier _truncatedDomainHashForNormalizedURL:]((int64_t)v13, *((void **)v13 + 2));
              *((_QWORD *)v13 + 3) = v15;
            }
          }
          else
          {
            v15 = 0;
          }
        }
        else
        {
          v15 = objc_msgSend(v13, "truncatedHash");
        }
        v16 = v15 / v14;
      }
      else
      {
        ABSLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[BCSBusinessQueryController _shardStartIndexForItemIdentifier:shardType:shardCount:]";
          _os_log_error_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_ERROR, "%s - Shard value should not be 0", buf, 0xCu);
        }

        v16 = -1;
      }
    }
    else
    {
      v16 = 0;
    }

    +[BCSShardIdentifier identifierWithType:startIndex:shardCount:]((uint64_t)BCSShardIdentifier, objc_msgSend(*(id *)(a1 + 32), "shardType"), v16, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ABSLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(*(id *)(a1 + 32), "shardType");
      *(_DWORD *)buf = 136316162;
      v37 = "-[BCSBusinessQueryController fetchShardWithQuery:completion:]_block_invoke";
      v38 = 2112;
      v39 = v7;
      v40 = 2112;
      v41 = v5;
      v42 = 2048;
      v43 = v19;
      v44 = 2048;
      v45 = v9;
      _os_log_impl(&dword_20ACAD000, v18, OS_LOG_TYPE_DEFAULT, "%s Shard Identifier: %@ ConfigItem %@ type %ld Shard Count %lld", buf, 0x34u);
    }

    v20 = *(_QWORD **)(a1 + 40);
    if (v20)
      v20 = (_QWORD *)v20[25];
    v21 = v20;
    objc_msgSend(v21, "shardResolutionMetricForShardIdentifier:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = *(_QWORD **)(a1 + 40);
    if (v23)
      v23 = (_QWORD *)v23[25];
    v24 = v23;
    objc_msgSend(v24, "measurementFactory");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shardResolutionTimingMeasurementForShardIdentifier:", v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTimingMeasurement:", v26);

    objc_msgSend(v22, "timingMeasurement");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "begin");

    v28 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "type");
    if (v28)
    {
      if ((unint64_t)(v30 - 1) <= 3)
        v25 = *(id *)(v28 + 24 * (v30 - 1) + 64);
    }
    else
    {
      v25 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "clientBundleId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __61__BCSBusinessQueryController_fetchShardWithQuery_completion___block_invoke_47;
    v33[3] = &unk_24C39C930;
    v34 = v22;
    v35 = *(id *)(a1 + 48);
    v32 = v22;
    objc_msgSend(v25, "shardItemMatching:clientBundleID:metric:completion:", v7, v31, v32, v33);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 42, CFSTR("Config not found"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);
  }

}

void __61__BCSBusinessQueryController_fetchShardWithQuery_completion___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timingMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  if (!v5 || v6)
  {
    ABSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[BCSBusinessQueryController fetchShardWithQuery:completion:]_block_invoke";
      v15 = 2112;
      v16 = CFSTR("Fetch shard item failed");
      _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - %@", buf, 0x16u);
    }

    if (!v6)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0FC8];
      v12 = CFSTR("Nil shardItem & nil fetchShardError");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 40, v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)fetchIsBusinessRegisteredWithQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BCSBusinessQueryController *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[BCSBusinessQueryController fetchIsBusinessRegisteredWithQuery:completion:]";
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__BCSBusinessQueryController_fetchIsBusinessRegisteredWithQuery_completion___block_invoke;
  v11[3] = &unk_24C39C958;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  -[BCSBusinessQueryController fetchConfigForQuery:completion:](self, "fetchConfigForQuery:completion:", v9, v11);

}

void __76__BCSBusinessQueryController_fetchIsBusinessRegisteredWithQuery_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  BCSBusinessLookupResult *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  BCSBusinessLookupResult *v13;
  void *v14;
  BCSBusinessLookupResult *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v8 = -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:]([BCSBusinessLookupResult alloc], "initWithHasBusiness:matchingTruncatedHash:config:", 0, 0, 0);
    v9 = *(_QWORD *)(a1 + 48);
    +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 42, CFSTR("Config not found"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BCSBusinessLookupResult *, void *))(v9 + 16))(v9, v8, v10);

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    v8 = -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:]([BCSBusinessLookupResult alloc], "initWithHasBusiness:matchingTruncatedHash:config:", 0, 0, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "skipRegistrationCheck"))
  {
    ABSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "Skipping registration check", buf, 2u);
    }

    v12 = *(_QWORD *)(a1 + 48);
    v13 = [BCSBusinessLookupResult alloc];
    objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:](v13, "initWithHasBusiness:matchingTruncatedHash:config:", 1, objc_msgSend(v14, "truncatedHash"), v5);
    (*(void (**)(uint64_t, BCSBusinessLookupResult *, _QWORD))(v12 + 16))(v12, v15, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "updateConfig:", v5);
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __76__BCSBusinessQueryController_fetchIsBusinessRegisteredWithQuery_completion___block_invoke_54;
    v18[3] = &unk_24C39C980;
    v19 = (id)v5;
    v21 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 32);
    objc_msgSend(v16, "fetchShardWithQuery:completion:", v17, v18);

  }
LABEL_6:

}

void __76__BCSBusinessQueryController_fetchIsBusinessRegisteredWithQuery_completion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BCSBusinessLookupResult *v10;
  BCSBusinessLookupResult *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v11 = -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:]([BCSBusinessLookupResult alloc], "initWithHasBusiness:matchingTruncatedHash:config:", 0, 0, *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_25462A218) & 1) == 0)
  {
    ABSLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[BCSBusinessQueryController fetchIsBusinessRegisteredWithQuery:completion:]_block_invoke";
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_DEFAULT, "%s Expected shardItem that confirms to BCSFilterShardItemProtocol protocol but got %@", buf, 0x16u);
    }

    v11 = -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:]([BCSBusinessLookupResult alloc], "initWithHasBusiness:matchingTruncatedHash:config:", 0, 0, *(_QWORD *)(a1 + 32));
    v13 = *(_QWORD *)(a1 + 48);
    v14 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FC8];
    v18 = CFSTR("Unexpected shard item");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 100, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BCSBusinessLookupResult *, void *))(v13 + 16))(v13, v11, v16);

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containsItemMatching:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:]([BCSBusinessLookupResult alloc], "initWithHasBusiness:matchingTruncatedHash:config:", objc_msgSend(v9, "hasMatch"), objc_msgSend(v9, "matchingTruncatedHash"), *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_10:
}

- (void)fetchItemWithQuery:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  BCSBusinessQueryController *v23;
  void (**v24)(id, void *, _QWORD);
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[BCSBusinessQueryController fetchItemWithQuery:completion:]";
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self)
    metricFactory = self->_metricFactory;
  else
    metricFactory = 0;
  v10 = metricFactory;
  -[BCSMetricFactoryProtocol measurementFactory](v10, "measurementFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "itemCacheHitMeasurementForItemIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "itemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessQueryController _itemResolverForType:]((uint64_t)self, (char *)objc_msgSend(v14, "type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cachedItemMatching:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    ABSLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "itemIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v19, "type"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v26 = "-[BCSBusinessQueryController fetchItemWithQuery:completion:]";
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_20ACAD000, v18, OS_LOG_TYPE_DEFAULT, "%s - Returned cached item - type: %@", buf, 0x16u);

    }
    objc_msgSend(v13, "setFlag:", 1);
    v7[2](v7, v17, 0);
  }
  else
  {
    objc_msgSend(v13, "setFlag:", 0);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __60__BCSBusinessQueryController_fetchItemWithQuery_completion___block_invoke;
    v21[3] = &unk_24C39C9A8;
    v24 = v7;
    v22 = v6;
    v23 = self;
    -[BCSBusinessQueryController fetchIsBusinessRegisteredWithQuery:completion:](self, "fetchIsBusinessRegisteredWithQuery:completion:", v22, v21);

  }
}

void __60__BCSBusinessQueryController_fetchItemWithQuery_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_19;
  }
  if ((objc_msgSend(v5, "hasBusiness") & 1) == 0)
  {
    ABSLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v34, "type"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v42 = "-[BCSBusinessQueryController fetchItemWithQuery:completion:]_block_invoke";
      v43 = 2112;
      v44 = v35;
      _os_log_error_impl(&dword_20ACAD000, v28, OS_LOG_TYPE_ERROR, "%s - Hash is not in bloom filter - type: %@", buf, 0x16u);

    }
    v29 = *(_QWORD *)(a1 + 48);
    v30 = CFSTR("Item not found");
    v31 = 42;
    goto LABEL_18;
  }
  objc_msgSend(v6, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    ABSLogCommon();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v36, "type"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v42 = "-[BCSBusinessQueryController fetchItemWithQuery:completion:]_block_invoke";
      v43 = 2112;
      v44 = v37;
      _os_log_error_impl(&dword_20ACAD000, v32, OS_LOG_TYPE_ERROR, "%s - Failed fetching config of type: %@", buf, 0x16u);

    }
    v29 = *(_QWORD *)(a1 + 48);
    v30 = CFSTR("Config not found");
    v31 = 100;
LABEL_18:
    +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), v31, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v29 + 16))(v29, 0, v33);

    goto LABEL_19;
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "config");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateConfig:", v9);

  objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "conformsToProtocol:", &unk_25462B7B0);

  if ((_DWORD)v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMatchingTruncatedHash:", objc_msgSend(v6, "matchingTruncatedHash"));

  }
  v12 = *(_QWORD **)(a1 + 40);
  if (v12)
    v12 = (_QWORD *)v12[25];
  v13 = *(void **)(a1 + 32);
  v14 = v12;
  objc_msgSend(v13, "itemIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemResolutionMetricForItemIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(_QWORD **)(a1 + 40);
  if (v17)
    v17 = (_QWORD *)v17[25];
  v18 = v17;
  objc_msgSend(v18, "measurementFactory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "itemResolutionTimingMeasurementForItemIdentifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimingMeasurement:", v21);

  objc_msgSend(v16, "timingMeasurement");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "begin");

  v23 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessQueryController _itemResolverForType:](v23, (char *)objc_msgSend(v24, "type"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(a1 + 32);
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __60__BCSBusinessQueryController_fetchItemWithQuery_completion___block_invoke_144;
  v38[3] = &unk_24C39C778;
  v39 = v16;
  v40 = *(id *)(a1 + 48);
  v27 = v16;
  objc_msgSend(v25, "itemMatching:metric:completion:", v26, v27, v38);

LABEL_19:
}

void __60__BCSBusinessQueryController_fetchItemWithQuery_completion___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timingMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  if (!v5 || v6)
  {
    ABSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[BCSBusinessQueryController fetchItemWithQuery:completion:]_block_invoke";
      v15 = 2112;
      v16 = CFSTR("Fetch item failed");
      _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - %@", buf, 0x16u);
    }

    if (!v6)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0FC8];
      v12 = CFSTR("Nil item & nil fetchItemError");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 40, v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)isBusinessCallerRegisteredForPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  BCSEntitlementVerifying *entitlementVerifier;
  NSObject *v15;
  BCSBusinessCallerItemIdentifier *v16;
  BCSQuery *v17;
  BCSQuery *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _QWORD v22[4];
  void (**v23)(id, uint64_t, _QWORD);
  uint8_t v24[16];
  uint8_t buf[16];
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessQueryController isBusinessCallerRegisteredForPhoneNumber:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    *(_OWORD *)buf = 0u;
    v26 = 0u;
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "auditToken");
    }
    else
    {
      *(_OWORD *)buf = 0u;
      v26 = 0u;
    }

    if (self)
      entitlementVerifier = self->_entitlementVerifier;
    else
      entitlementVerifier = 0;
    if ((-[BCSEntitlementVerifying auditToken:hasEntitlement:](entitlementVerifier, "auditToken:hasEntitlement:", buf, CFSTR("com.apple.businessservicesd.businessmetadata")) & 1) == 0)
    {
      ABSLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_error_impl(&dword_20ACAD000, v15, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          v24,
          2u);
      }

    }
    if (MEMORY[0x20BD2FF14]("-[BCSBusinessQueryController isBusinessCallerRegisteredForPhoneNumber:forClientBundleID:completion:]"))
    {
      +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
      v16 = (BCSBusinessCallerItemIdentifier *)objc_claimAutoreleasedReturnValue();
      -[BCSBusinessCallerItemIdentifier dictionaryForKey:](v16, "dictionaryForKey:", CFSTR("BCSBusinessCallerStubEntry"));
      v17 = (BCSQuery *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        -[BCSQuery objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("phone"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v8, "isEqualToString:", v19);

        if (v20)
        {
          ABSLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_20ACAD000, v21, OS_LOG_TYPE_DEFAULT, "BusinessCaller: Returning YES for business caller matching STUB DATA", v24, 2u);
          }

          v10[2](v10, 1, 0);
          goto LABEL_21;
        }
      }

    }
    v16 = -[BCSBusinessCallerItemIdentifier initWithPhoneNumber:]([BCSBusinessCallerItemIdentifier alloc], "initWithPhoneNumber:", v8);
    v18 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:", v16, v9, 4);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __100__BCSBusinessQueryController_isBusinessCallerRegisteredForPhoneNumber_forClientBundleID_completion___block_invoke;
    v22[3] = &unk_24C39C9D0;
    v23 = v10;
    -[BCSBusinessQueryController fetchIsBusinessRegisteredWithQuery:completion:](self, "fetchIsBusinessRegisteredWithQuery:completion:", v18, v22);

LABEL_21:
  }

}

void __100__BCSBusinessQueryController_isBusinessCallerRegisteredForPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "hasBusiness"), v5);

}

- (void)fetchBusinessCallerMetadataForPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BCSEntitlementVerifying *entitlementVerifier;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  __int128 *p_buf;
  _QWORD v19[5];
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[BCSBusinessQueryController fetchBusinessCallerMetadataForPhoneNumber:forClientBund"
                                    "leID:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v10)
  {
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "auditToken");
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
    }

    if (self)
      entitlementVerifier = self->_entitlementVerifier;
    else
      entitlementVerifier = 0;
    if ((-[BCSEntitlementVerifying auditToken:hasEntitlement:](entitlementVerifier, "auditToken:hasEntitlement:", &v21, CFSTR("com.apple.businessservicesd.businessmetadata")) & 1) == 0)
    {
      ABSLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_20ACAD000, v15, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          (uint8_t *)&buf,
          2u);
      }

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    v27 = 0;
    v19[4] = &buf;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke;
    v20[3] = &unk_24C39C9F8;
    v20[4] = &buf;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke_2;
    v19[3] = &unk_24C39CA20;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke_3;
    v16[3] = &unk_24C39CA48;
    v17 = v10;
    p_buf = &buf;
    -[BCSBusinessQueryController fetchBusinessCallerMetadataForPhoneNumber:forClientBundleID:metadataCallback:logoURLCallback:completion:](self, "fetchBusinessCallerMetadataForPhoneNumber:forClientBundleID:metadataCallback:logoURLCallback:completion:", v8, v9, v20, v19, v16);

    _Block_object_dispose(&buf, 8);
  }

}

void __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setLogoURL:", a2);
}

uint64_t __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (void)fetchBusinessCallerMetadataForPhoneNumber:(id)a3 forClientBundleID:(id)a4 metadataCallback:(id)a5 logoURLCallback:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  void (**v14)(_QWORD, void *);
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BCSEntitlementVerifying *entitlementVerifier;
  NSObject *v21;
  BCSBusinessCallerItemIdentifier *v22;
  BCSBusinessCallerItemIdentifier *v23;
  void *v24;
  BCSQuery *v25;
  BCSBusinessCallerItem *v26;
  BCSBusinessCallerItem *v27;
  void *v28;
  int v29;
  void (**v30)(_QWORD, void *);
  NSObject *v31;
  BCSBusinessCallerItem *v32;
  void *v33;
  void *v34;
  void *v35;
  BCSBusinessCallerItem *v36;
  void *v37;
  void *v38;
  BCSMetricFactoryProtocol *metricFactory;
  void *v40;
  BCSMetricFactoryProtocol *v41;
  BCSBusinessCallerItem *v42;
  void (**v43)(_QWORD, void *);
  BCSMetricFactoryProtocol *v44;
  BCSMetricFactoryProtocol *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[4];
  BCSBusinessCallerItem *v55;
  id v56;
  BCSBusinessQueryController *v57;
  BCSBusinessCallerItemIdentifier *v58;
  id v59;
  void (**v60)(_QWORD, void *);
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint8_t v65[16];
  __int128 buf;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(_QWORD, void *))a5;
  v15 = a6;
  v16 = a7;
  ABSLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[BCSBusinessQueryController fetchBusinessCallerMetadataForPhoneNumber:forClientBund"
                                    "leID:metadataCallback:logoURLCallback:completion:]";
    _os_log_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v16)
  {
    buf = 0u;
    v67 = 0u;
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "auditToken");
    }
    else
    {
      buf = 0u;
      v67 = 0u;
    }

    if (self)
      entitlementVerifier = self->_entitlementVerifier;
    else
      entitlementVerifier = 0;
    if ((-[BCSEntitlementVerifying auditToken:hasEntitlement:](entitlementVerifier, "auditToken:hasEntitlement:", &buf, CFSTR("com.apple.businessservicesd.businessmetadata")) & 1) == 0)
    {
      ABSLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v65 = 0;
        _os_log_error_impl(&dword_20ACAD000, v21, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          v65,
          2u);
      }

    }
    v22 = -[BCSBusinessCallerItemIdentifier initWithPhoneNumber:]([BCSBusinessCallerItemIdentifier alloc], "initWithPhoneNumber:", v12);
    v52 = v15;
    v53 = v13;
    if (MEMORY[0x20BD2FF14]("-[BCSBusinessQueryController fetchBusinessCallerMetadataForPhoneNumber:forClientBundleID:metadataCallback:logoURLCallback:completion:]"))
    {
      v23 = v22;
      v24 = v16;
      +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
      v25 = (BCSQuery *)objc_claimAutoreleasedReturnValue();
      -[BCSQuery dictionaryForKey:](v25, "dictionaryForKey:", CFSTR("BCSBusinessCallerStubEntry"));
      v26 = (BCSBusinessCallerItem *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        -[BCSBusinessCallerItem objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("phone"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v12, "isEqualToString:", v28);

        v13 = v53;
        if (v29)
        {
          v50 = v12;
          v30 = v14;
          ABSLogCommon();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v65 = 0;
            _os_log_impl(&dword_20ACAD000, v31, OS_LOG_TYPE_DEFAULT, "BusinessCaller: Returning metadata for business caller matching STUB DATA", v65, 2u);
          }

          v32 = [BCSBusinessCallerItem alloc];
          -[BCSBusinessCallerItem objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("phone"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSBusinessCallerItem objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("name"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSBusinessCallerItem objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("department"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v49) = 1;
          v36 = -[BCSBusinessCallerItem initWithPhoneNumber:name:department:logoURL:logo:logoFormat:verified:](v32, "initWithPhoneNumber:name:department:logoURL:logo:logoFormat:verified:", v33, v34, v35, 0, 0, 0, v49);

          v14 = v30;
          if (v30)
            v30[2](v30, v36);
          -[BCSBusinessCallerItem objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("logo"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = MEMORY[0x24BDAC760];
          v62[1] = 3221225472;
          v62[2] = __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke;
          v62[3] = &unk_24C39CA70;
          v15 = v52;
          v63 = v52;
          v38 = v24;
          v64 = v24;
          v22 = v23;
          -[BCSBusinessQueryController _generateSafeImageURLForItemIdentifier:imageData:format:completion:]((uint64_t)self, v23, v37, CFSTR("heic"), v62);

          v16 = v38;
          v12 = v50;
          goto LABEL_27;
        }
      }

      v16 = v24;
      v22 = v23;
    }
    v51 = v16;
    if (self)
      metricFactory = self->_metricFactory;
    else
      metricFactory = 0;
    v40 = v12;
    v41 = metricFactory;
    -[BCSMetricFactoryProtocol businessCallerFetchMetricForItemIdentifier:](v41, "businessCallerFetchMetricForItemIdentifier:", v22);
    v42 = (BCSBusinessCallerItem *)objc_claimAutoreleasedReturnValue();

    v43 = v14;
    if (self)
      v44 = self->_metricFactory;
    else
      v44 = 0;
    v45 = v44;
    -[BCSMetricFactoryProtocol measurementFactory](v45, "measurementFactory");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "itemFetchTimingMeasurementForItemIdentifier:", v22);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSBusinessCallerItem setTimingMeasurement:](v42, "setTimingMeasurement:", v47);

    -[BCSBusinessCallerItem timingMeasurement](v42, "timingMeasurement");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "begin");

    v25 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:", v22, v13, 4);
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke_2;
    v54[3] = &unk_24C39CAC0;
    v55 = v42;
    v16 = v51;
    v59 = v51;
    v56 = v40;
    v14 = v43;
    v12 = v40;
    v60 = v14;
    v57 = self;
    v58 = v22;
    v15 = v52;
    v61 = v52;
    v27 = v42;
    -[BCSBusinessQueryController fetchItemWithQuery:completion:](self, "fetchItemWithQuery:completion:", v25, v54);

    v36 = v55;
LABEL_27:

    v13 = v53;
  }

}

void __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_generateSafeImageURLForItemIdentifier:(void *)a3 imageData:(void *)a4 format:(void *)a5 completion:
{
  void (**v9)(id, void *, _QWORD);
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  const __CFString *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  if (a1)
  {
    v10 = *(void **)(a1 + 200);
    v11 = a4;
    v12 = a3;
    v13 = a2;
    objc_msgSend(v10, "measurementFactory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "blastDoorTimingMeasurementForItemIdentifier:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "begin");
    v16 = *(void **)(a1 + 256);
    v23 = 0;
    v17 = v16;
    objc_msgSend(v17, "safeImageURLFromImage:imageFormat:error:", v12, v11, &v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v23;
    objc_msgSend(v15, "end");
    if (v18)
    {
      v9[2](v9, v18, 0);
    }
    else
    {
      ABSLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v19;
        _os_log_impl(&dword_20ACAD000, v20, OS_LOG_TYPE_DEFAULT, "Error getting safe image from BlastDoor: %@", buf, 0xCu);
      }

      if (!v19)
      {
        v21 = (void *)MEMORY[0x24BDD1540];
        v24 = *MEMORY[0x24BDD0FC8];
        v25 = CFSTR("Unexpected BlastDoor failure");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 100, v22);
        v19 = (id)objc_claimAutoreleasedReturnValue();

      }
      ((void (**)(id, void *, id))v9)[2](v9, 0, v19);
    }

  }
}

void __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timingMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(*(id *)(a1 + 32), "submitForPostProcessing");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    objc_msgSend(v8, "setPhoneNumber:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v8, "logo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    objc_msgSend(v8, "logoFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v13 = *(_QWORD *)(a1 + 72);
    if (v13)
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v8);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(void **)(a1 + 56);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke_168;
    v17[3] = &unk_24C39CA98;
    v19 = *(id *)(a1 + 80);
    v20 = *(id *)(a1 + 64);
    v18 = v6;
    -[BCSBusinessQueryController _generateSafeImageURLForItemIdentifier:imageData:format:completion:](v14, v15, v10, v12, v17);

  }
  else
  {
    ABSLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_20ACAD000, v16, OS_LOG_TYPE_DEFAULT, "Invalid item (expected BCSBusinessCallerItem): %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke_168(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchBusinessMetadataForEmail:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  BCSEntitlementVerifying *entitlementVerifier;
  NSObject *v15;
  void *v16;
  BCSQuery *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  BCSEmailLocalizedString *v23;
  void *v24;
  void *v25;
  BCSEmailLocalizedString *v26;
  id v27;
  _QWORD v28[4];
  BCSEmailLocalizedString *v29;
  _QWORD v30[4];
  id v31;
  BCSEmailLocalizedString *v32;
  id v33;
  id v34;
  void (**v35)(id, _QWORD, void *);
  uint8_t v36[16];
  uint8_t buf[16];
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessQueryController fetchBusinessMetadataForEmail:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    *(_OWORD *)buf = 0u;
    v38 = 0u;
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "auditToken");
    }
    else
    {
      *(_OWORD *)buf = 0u;
      v38 = 0u;
    }

    if (self)
      entitlementVerifier = self->_entitlementVerifier;
    else
      entitlementVerifier = 0;
    if ((-[BCSEntitlementVerifying auditToken:hasEntitlement:](entitlementVerifier, "auditToken:hasEntitlement:", buf, CFSTR("com.apple.businessservicesd.businessmetadata")) & 1) == 0)
    {
      ABSLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v36 = 0;
        _os_log_error_impl(&dword_20ACAD000, v15, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          v36,
          2u);
      }

    }
    if (!v8)
    {
      +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 44, CFSTR("nil email key"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v16);
LABEL_24:

      goto LABEL_25;
    }
    v16 = -[BCSBusinessEmailItemIdentifier initWithEmail:]([BCSBusinessEmailItemIdentifier alloc], v8);
    if (MEMORY[0x20BD2FF14]("-[BCSBusinessQueryController fetchBusinessMetadataForEmail:forClientBundleID:completion:]"))
    {
      +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
      v17 = (BCSQuery *)objc_claimAutoreleasedReturnValue();
      -[BCSQuery dictionaryForKey:](v17, "dictionaryForKey:", CFSTR("BCSBusinessEmailStubEntry"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("email"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v8, "isEqualToString:", v20);

        if (v21)
        {
          ABSLogCommon();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v36 = 0;
            _os_log_impl(&dword_20ACAD000, v22, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning metadata for business email matching STUB DATA", v36, 2u);
          }

          v23 = objc_alloc_init(BCSEmailLocalizedString);
          -[BCSEmailLocalizedString setLocale:](v23, "setLocale:", CFSTR("en-US"));
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("name"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSEmailLocalizedString setText:](v23, "setText:", v24);

          -[BCSEmailLocalizedString setIsDefault:](v23, "setIsDefault:", 1);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("logo"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __89__BCSBusinessQueryController_fetchBusinessMetadataForEmail_forClientBundleID_completion___block_invoke;
          v30[3] = &unk_24C39CAE8;
          v35 = v10;
          v31 = v8;
          v32 = v23;
          v33 = v19;
          v34 = v16;
          v27 = v19;
          v26 = v23;
          -[BCSBusinessQueryController _generateSafeImageURLForItemIdentifier:imageData:format:completion:]((uint64_t)self, v34, v25, CFSTR("heic"), v30);

          goto LABEL_23;
        }
      }

    }
    v17 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:", v16, v9, 5);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __89__BCSBusinessQueryController_fetchBusinessMetadataForEmail_forClientBundleID_completion___block_invoke_185;
    v28[3] = &unk_24C39C8E0;
    v29 = v10;
    -[BCSBusinessQueryController fetchItemWithQuery:completion:](self, "fetchItemWithQuery:completion:", v17, v28);
    v26 = v29;
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:

}

void __89__BCSBusinessQueryController_fetchBusinessMetadataForEmail_forClientBundleID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  BCSBusinessEmailItem *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BCSBusinessEmailItem *v11;
  NSObject *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void (*v17)(uint64_t, _QWORD, BCSBusinessEmailItem *);
  int v18;
  _QWORD *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = a3;
    v5 = [BCSBusinessEmailItem alloc];
    v6 = *(_QWORD *)(a1 + 32);
    v23[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("businessId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("companyId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BCSBusinessEmailItem initWithEmail:localizedNames:localizedDisplayNames:businessId:companyId:](v5, "initWithEmail:localizedNames:localizedDisplayNames:businessId:companyId:", v6, v7, v8, v9, v10);

    ABSLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD **)(a1 + 56);
      if (v13)
        v13 = (_QWORD *)v13[3];
      v14 = v13;
      -[BCSBusinessEmailItem name](v11, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning item { Email: %@, Name: %@ }", (uint8_t *)&v18, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(void (**)(uint64_t, _QWORD, BCSBusinessEmailItem *))(v16 + 16);
    v11 = a3;
    v17(v16, 0, v11);
  }

}

void __89__BCSBusinessQueryController_fetchBusinessMetadataForEmail_forClientBundleID_completion___block_invoke_185(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void (*v7)(void);
  void *v8;
  NSObject *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5 | v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      ABSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_DEFAULT, "Invalid item (expected BCSBusinessEmailItem): %@", (uint8_t *)&v10, 0xCu);
      }

      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v7();
  }
  else
  {
    +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 42, CFSTR("No match found"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)fetchBusinessMetadataForEmailIdentifier:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  BCSEntitlementVerifying *entitlementVerifier;
  NSObject *v15;
  void *v16;
  void *v17;
  BCSQuery *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  BCSEmailLocalizedString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BCSBusinessEmailItem *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  BCSEmailLocalizedString *v33;
  BCSBusinessEmailItemIdentifier *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BCSBusinessEmailItem *v39;
  BCSEmailLocalizedString *v40;
  _QWORD v41[4];
  BCSEmailLocalizedString *v42;
  uint8_t v43[4];
  void *v44;
  __int16 v45;
  void *v46;
  BCSEmailLocalizedString *v47;
  BCSEmailLocalizedString *v48;
  uint8_t buf[16];
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessQueryController fetchBusinessMetadataForEmailIdentifier:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    *(_OWORD *)buf = 0u;
    v50 = 0u;
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "auditToken");
    }
    else
    {
      *(_OWORD *)buf = 0u;
      v50 = 0u;
    }

    if (self)
      entitlementVerifier = self->_entitlementVerifier;
    else
      entitlementVerifier = 0;
    if ((-[BCSEntitlementVerifying auditToken:hasEntitlement:](entitlementVerifier, "auditToken:hasEntitlement:", buf, CFSTR("com.apple.businessservicesd.businessmetadata")) & 1) == 0)
    {
      ABSLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v43 = 0;
        _os_log_error_impl(&dword_20ACAD000, v15, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          v43,
          2u);
      }

    }
    objc_msgSend(v8, "email");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 44, CFSTR("nil email key"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v17);
LABEL_26:

      goto LABEL_27;
    }
    if (MEMORY[0x20BD2FF14]("-[BCSBusinessQueryController fetchBusinessMetadataForEmailIdentifier:forClientBundleID:completion:]"))
    {
      +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dictionaryForKey:", CFSTR("BCSBusinessEmailStubEntry"));
      v18 = (BCSQuery *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v8, "email");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[BCSQuery objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("email"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        if (v21)
        {
          ABSLogCommon();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v43 = 0;
            _os_log_impl(&dword_20ACAD000, v22, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning metadata for business email matching STUB DATA", v43, 2u);
          }

          v23 = objc_alloc_init(BCSEmailLocalizedString);
          -[BCSEmailLocalizedString setLocale:](v23, "setLocale:", CFSTR("en-US"));
          -[BCSQuery objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("name"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSEmailLocalizedString setText:](v23, "setText:", v24);

          -[BCSEmailLocalizedString setIsDefault:](v23, "setIsDefault:", 1);
          v39 = [BCSBusinessEmailItem alloc];
          objc_msgSend(v8, "email");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v23;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v23;
          v47 = v23;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSQuery objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("businessId"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSQuery objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("companyId"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[BCSBusinessEmailItem initWithEmail:localizedNames:localizedDisplayNames:businessId:companyId:](v39, "initWithEmail:localizedNames:localizedDisplayNames:businessId:companyId:", v38, v25, v26, v27, v28);

          ABSLogCommon();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            -[BCSBusinessEmailItem email](v29, "email");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[BCSBusinessEmailItem name](v29, "name");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v43 = 138412546;
            v44 = v31;
            v45 = 2112;
            v46 = v32;
            _os_log_impl(&dword_20ACAD000, v30, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning item { Email: %@, Name: %@ }", v43, 0x16u);

          }
          ((void (**)(id, BCSBusinessEmailItem *, void *))v10)[2](v10, v29, 0);

          v33 = v40;
          goto LABEL_25;
        }
      }

    }
    v34 = [BCSBusinessEmailItemIdentifier alloc];
    objc_msgSend(v8, "email");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fullDomain");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topLevelDomain");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[BCSBusinessEmailItemIdentifier initWithEmail:fullDomain:topLevelDomain:]((id *)&v34->super.isa, v35, v36, v37);

    v18 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:", v17, v9, 5);
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __99__BCSBusinessQueryController_fetchBusinessMetadataForEmailIdentifier_forClientBundleID_completion___block_invoke;
    v41[3] = &unk_24C39C8E0;
    v42 = v10;
    -[BCSBusinessQueryController fetchItemWithQuery:completion:](self, "fetchItemWithQuery:completion:", v18, v41);
    v33 = v42;
LABEL_25:

    goto LABEL_26;
  }
LABEL_27:

}

void __99__BCSBusinessQueryController_fetchBusinessMetadataForEmailIdentifier_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void (*v7)(void);
  void *v8;
  NSObject *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5 | v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      ABSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_DEFAULT, "Invalid item (expected BCSBusinessEmailItem): %@", (uint8_t *)&v10, 0xCu);
      }

      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v7();
  }
  else
  {
    +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 42, CFSTR("No match found"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)fetchBusinessLogoForBusinessIdentifier:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BCSEntitlementVerifying *entitlementVerifier;
  NSObject *v15;
  void *v16;
  BCSBusinessLogoItemIdentifier *v17;
  void *v18;
  _QWORD *v19;
  BCSQuery *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t v35[16];
  uint8_t buf[16];
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessQueryController fetchBusinessLogoForBusinessIdentifier:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    v37 = 0u;
    *(_OWORD *)buf = 0u;
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "auditToken");
    }
    else
    {
      v37 = 0u;
      *(_OWORD *)buf = 0u;
    }

    if (self)
      entitlementVerifier = self->_entitlementVerifier;
    else
      entitlementVerifier = 0;
    if ((-[BCSEntitlementVerifying auditToken:hasEntitlement:](entitlementVerifier, "auditToken:hasEntitlement:", buf, CFSTR("com.apple.businessservicesd.businessmetadata")) & 1) == 0)
    {
      ABSLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v35 = 0;
        _os_log_error_impl(&dword_20ACAD000, v15, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          v35,
          2u);
      }

    }
    objc_msgSend(v8, "businessId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [BCSBusinessLogoItemIdentifier alloc];
      objc_msgSend(v8, "businessId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[BCSBusinessLogoItemIdentifier initWithBusinessId:](v17, v18);

      if (MEMORY[0x20BD2FF14]("-[BCSBusinessQueryController fetchBusinessLogoForBusinessIdentifier:forClientBundleID:completion:]"))
      {
        +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
        v20 = (BCSQuery *)objc_claimAutoreleasedReturnValue();
        -[BCSQuery dictionaryForKey:](v20, "dictionaryForKey:", CFSTR("BCSBusinessLogoStubEntry"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v8, "businessId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("businessId"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqualToString:", v23);

          if (v24)
          {
            ABSLogCommon();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v35 = 0;
              _os_log_impl(&dword_20ACAD000, v25, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning logo for business email matching STUB DATA", v35, 2u);
            }

            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("logo"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke;
            v32[3] = &unk_24C39CB10;
            v33 = v19;
            v34 = v10;
            v27 = v19;
            -[BCSBusinessQueryController _generateSafeImageURLForItemIdentifier:imageData:format:completion:]((uint64_t)self, v27, v26, CFSTR("heic"), v32);

            goto LABEL_23;
          }
        }

      }
      v20 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:skipRegistrationCheck:]([BCSQuery alloc], "initWithItemIdentifier:clientBundleId:shardType:skipRegistrationCheck:", v19, v9, 5, 1);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke_194;
      v29[3] = &unk_24C39CB60;
      v30 = v19;
      v31 = v10;
      v29[4] = self;
      v28 = v19;
      -[BCSBusinessQueryController fetchItemWithQuery:completion:](self, "fetchItemWithQuery:completion:", v20, v29);

    }
    else
    {
      +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 44, CFSTR("Invalid email identifier - missing businessId"));
      v20 = (BCSQuery *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, BCSQuery *))v10 + 2))(v10, 0, v20);
    }
LABEL_23:

  }
}

void __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BCSBusinessLogo *v7;
  _QWORD *v8;
  _QWORD *v9;
  BCSBusinessLogo *v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  _QWORD *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = [BCSBusinessLogo alloc];
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
    v8 = (_QWORD *)v8[1];
  v9 = v8;
  v10 = -[BCSBusinessLogo initWithBusinessId:logoURL:logoFormat:](v7, "initWithBusinessId:logoURL:logoFormat:", v9, v5, CFSTR("heic"));

  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD **)(a1 + 32);
    if (v12)
      v12 = (_QWORD *)v12[1];
    v13 = v12;
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning logo { BusinessId: %@, LogoURL: %@ }", (uint8_t *)&v14, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5 | v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (id)v5;
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      objc_msgSend(v7, "logo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logoFormat");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke_195;
      v15[3] = &unk_24C39CB38;
      v16 = *(id *)(a1 + 40);
      v17 = v7;
      v18 = *(id *)(a1 + 48);
      v12 = v7;
      -[BCSBusinessQueryController _generateSafeImageURLForItemIdentifier:imageData:format:completion:](v8, v9, v10, v11, v15);

    }
    else
    {
      ABSLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEFAULT, "Invalid item (expected BCSBusinessLogo): %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 42, CFSTR("No match found"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BCSBusinessLogo *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  BCSBusinessLogo *v11;

  v5 = a3;
  v6 = a2;
  v7 = [BCSBusinessLogo alloc];
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
    v8 = (_QWORD *)v8[1];
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "logoFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BCSBusinessLogo initWithBusinessId:logoURL:logoFormat:](v7, "initWithBusinessId:logoURL:logoFormat:", v9, v6, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)prefetchMegashardsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BCSEntitlementVerifying *entitlementVerifier;
  BCSEntitlementVerifying *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  _QWORD *v23;
  _BYTE *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _BYTE *v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[3];
  char v38;
  uint8_t v39[4];
  const char *v40;
  __int16 v41;
  const __CFString *v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[BCSBusinessQueryController prefetchMegashardsWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = (int)objc_msgSend(v6, "processIdentifier");
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s Called by process with PID %ld", buf, 0x16u);

  }
  v7 = dispatch_group_create();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  v46 = 0;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "auditToken");
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
  }

  if (self)
    entitlementVerifier = self->_entitlementVerifier;
  else
    entitlementVerifier = 0;
  v11 = entitlementVerifier;
  v12 = -[BCSEntitlementVerifying auditToken:hasEntitlement:](v11, "auditToken:hasEntitlement:", &v35, CFSTR("com.apple.businessservicesd.prefetch"));

  if (v12)
  {
    dispatch_group_enter(v7);
    v13 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke;
    v31[3] = &unk_24C39CB88;
    v33 = v37;
    v34 = buf;
    v14 = v7;
    v32 = v14;
    if (self)
      -[BCSFetchTrigger triggerFetchForReason:completion:](self->_businessLinkMegashardFetchTrigger, "triggerFetchForReason:completion:", 1, v31);
    dispatch_group_enter(v14);
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_2;
    v29[3] = &unk_24C39CBB0;
    v15 = v14;
    v30 = v15;
    if (self)
      -[BCSFetchTrigger triggerFetchForReason:completion:](self->_chatSuggestMegashardFetchTrigger, "triggerFetchForReason:completion:", 1, v29);
    dispatch_group_enter(v15);
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_198;
    v27[3] = &unk_24C39CBB0;
    v16 = v15;
    v28 = v16;
    if (self)
      -[BCSFetchTrigger triggerFetchForReason:completion:](self->_businessCallerMegashardFetchTrigger, "triggerFetchForReason:completion:", 1, v27);
    dispatch_group_enter(v16);
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_199;
    v25[3] = &unk_24C39CBB0;
    v17 = v16;
    v26 = v17;
    if (self)
      -[BCSFetchTrigger triggerFetchForReason:completion:](self->_businessEmailMegashardFetchTrigger, "triggerFetchForReason:completion:", 1, v25);
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_200;
    block[3] = &unk_24C39CBD8;
    v22 = v4;
    v23 = v37;
    v24 = buf;
    dispatch_group_notify(v17, v18, block);

    v19 = v32;
  }
  else
  {
    ABSLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v39 = 136315394;
      v40 = "-[BCSBusinessQueryController prefetchMegashardsWithCompletion:]";
      v41 = 2112;
      v42 = CFSTR("com.apple.businessservicesd.prefetch");
      _os_log_error_impl(&dword_20ACAD000, v20, OS_LOG_TYPE_ERROR, "%s: The entitlement %@ is required to trigger a prefetch of Megashards", v39, 0x16u);
    }

    +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 99, CFSTR("This call requires an entitlement"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v19);
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v37, 8);

}

void __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "-[BCSBusinessQueryController prefetchMegashardsWithCompletion:]_block_invoke_2";
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s: Prefetch of Chat Suggest megashard completed with result: %@ and error: %@", (uint8_t *)&v7, 0x20u);

  }
}

void __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_198(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "-[BCSBusinessQueryController prefetchMegashardsWithCompletion:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s: Prefetch of Business Caller megashard completed with result: %@ and error: %@", (uint8_t *)&v7, 0x20u);

  }
}

void __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_199(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "-[BCSBusinessQueryController prefetchMegashardsWithCompletion:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s: Prefetch of Business Email megashard completed with result: %@ and error: %@", (uint8_t *)&v7, 0x20u);

  }
}

uint64_t __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_200(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

- (void)clearCachesForType:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  BCSEntitlementVerifying *entitlementVerifier;
  BCSCacheClearing *cacheClearer;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint8_t buf[16];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, void *))a4;
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessQueryController clearCachesForType:completion:]";
    _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_OWORD *)buf = 0u;
  v19 = 0u;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "auditToken");
  }
  else
  {
    *(_OWORD *)buf = 0u;
    v19 = 0u;
  }

  if (self)
    entitlementVerifier = self->_entitlementVerifier;
  else
    entitlementVerifier = 0;
  if (-[BCSEntitlementVerifying auditToken:hasEntitlement:](entitlementVerifier, "auditToken:hasEntitlement:", buf, CFSTR("com.apple.businessservicesd.cache")))
  {
    if (self)
      cacheClearer = self->_cacheClearer;
    else
      cacheClearer = 0;
    -[BCSCacheClearing clearCachesForType:completion:](cacheClearer, "clearCachesForType:completion:", a3, v6);
  }
  else
  {
    ABSLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[BCSBusinessQueryController clearCachesForType:completion:]";
      v16 = 2112;
      v17 = CFSTR("com.apple.businessservicesd.cache");
      _os_log_error_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_ERROR, "%s: The entitlement %@ is required to clear caches", (uint8_t *)&v14, 0x16u);
    }

    +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 99, CFSTR("This call requires an entitlement"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v13);

  }
}

- (void)clearExpiredCachesForType:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  BCSEntitlementVerifying *entitlementVerifier;
  BCSCacheClearing *cacheClearer;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint8_t buf[16];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, void *))a4;
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessQueryController clearExpiredCachesForType:completion:]";
    _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_OWORD *)buf = 0u;
  v19 = 0u;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "auditToken");
  }
  else
  {
    *(_OWORD *)buf = 0u;
    v19 = 0u;
  }

  if (self)
    entitlementVerifier = self->_entitlementVerifier;
  else
    entitlementVerifier = 0;
  if (-[BCSEntitlementVerifying auditToken:hasEntitlement:](entitlementVerifier, "auditToken:hasEntitlement:", buf, CFSTR("com.apple.businessservicesd.cache")))
  {
    if (self)
      cacheClearer = self->_cacheClearer;
    else
      cacheClearer = 0;
    -[BCSCacheClearing clearExpiredCachesForType:completion:](cacheClearer, "clearExpiredCachesForType:completion:", a3, v6);
  }
  else
  {
    ABSLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[BCSBusinessQueryController clearExpiredCachesForType:completion:]";
      v16 = 2112;
      v17 = CFSTR("com.apple.businessservicesd.cache");
      _os_log_error_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_ERROR, "%s: The entitlement %@ is required to clear caches", (uint8_t *)&v14, 0x16u);
    }

    +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 99, CFSTR("This call requires an entitlement"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v13);

  }
}

- (void)clearCachesForLinkItemsAssociatedWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  BCSEntitlementVerifying *entitlementVerifier;
  BCSCacheClearing *cacheClearer;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  uint8_t buf[16];
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSBusinessQueryController clearCachesForLinkItemsAssociatedWithBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_OWORD *)buf = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "auditToken");
  }
  else
  {
    *(_OWORD *)buf = 0u;
    v20 = 0u;
  }

  if (self)
    entitlementVerifier = self->_entitlementVerifier;
  else
    entitlementVerifier = 0;
  if (-[BCSEntitlementVerifying auditToken:hasEntitlement:](entitlementVerifier, "auditToken:hasEntitlement:", buf, CFSTR("com.apple.businessservicesd.cache")))
  {
    if (self)
      cacheClearer = self->_cacheClearer;
    else
      cacheClearer = 0;
    -[BCSCacheClearing clearCachesForLinkItemsAssociatedWithBundleID:completion:](cacheClearer, "clearCachesForLinkItemsAssociatedWithBundleID:completion:", v6, v7);
  }
  else
  {
    ABSLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[BCSBusinessQueryController clearCachesForLinkItemsAssociatedWithBundleID:completion:]";
      v17 = 2112;
      v18 = CFSTR("com.apple.businessservicesd.cache");
      _os_log_error_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_ERROR, "%s: The entitlement %@ is required to clear caches", (uint8_t *)&v15, 0x16u);
    }

    +[BCSError errorWithDomain:code:errorDescription:](BCSError, "errorWithDomain:code:errorDescription:", CFSTR("com.apple.businessservices"), 99, CFSTR("This call requires an entitlement"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v14);

  }
}

- (void)_deleteInMemoryCache
{
  id v2;

  +[BCSBusinessItemMemoryCache sharedCache]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItemMemoryCache deleteCache]((uint64_t)v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blastDoorHelper, 0);
  objc_storeStrong((id *)&self->_housekeeper, 0);
  objc_storeStrong((id *)&self->_patternController, 0);
  objc_storeStrong((id *)&self->_shardCacheSkip, 0);
  objc_storeStrong((id *)&self->_configCacheSkip, 0);
  objc_storeStrong((id *)&self->_configCache, 0);
  objc_storeStrong((id *)&self->_shardCache, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_queryChopper, 0);
  objc_storeStrong((id *)&self->_entitlementVerifier, 0);
  objc_storeStrong((id *)&self->_businessEmailMegashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_businessCallerMegashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_businessLinkMegashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_chatSuggestMegashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_businessEmailShardResolver, 0);
  objc_storeStrong((id *)&self->_businessEmailConfigResolver, 0);
  objc_storeStrong((id *)&self->_businessEmailItemResolver, 0);
  objc_storeStrong((id *)&self->_businessCallerShardResolver, 0);
  objc_storeStrong((id *)&self->_businessCallerConfigResolver, 0);
  objc_storeStrong((id *)&self->_businessCallerItemResolver, 0);
  objc_storeStrong((id *)&self->_linkShardResolver, 0);
  objc_storeStrong((id *)&self->_linkConfigResolver, 0);
  objc_storeStrong((id *)&self->_linkItemResolver, 0);
  objc_storeStrong((id *)&self->_chatSuggestShardResolver, 0);
  objc_storeStrong((id *)&self->_chatSuggestConfigResolver, 0);
  objc_storeStrong((id *)&self->_chatSuggestItemResolver, 0);
  objc_storeStrong((id *)&self->_chatSuggestController, 0);
  objc_storeStrong((id *)&self->_cacheClearer, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_identityService, 0);
}

@end
