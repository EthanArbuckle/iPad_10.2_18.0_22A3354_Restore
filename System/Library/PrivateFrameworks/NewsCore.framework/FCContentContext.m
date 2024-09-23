@implementation FCContentContext

- (FCFlintResourceManager)flintResourceManager
{
  FCFlintResourceManager *flintResourceManager;
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
  flintResourceManager = self->_flintResourceManager;
  if (!flintResourceManager)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_flintResourceManager");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext flintResourceManager]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 615;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_flintResourceManager;
    }
    flintResourceManager = 0;
  }
  return flintResourceManager;
}

- (FCContentContextInternal)internalContentContext
{
  FCContentContextInternal *internalContentContext;
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
  internalContentContext = self->_internalContentContext;
  if (!internalContentContext)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_internalContentContext");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext internalContentContext]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 764;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_internalContentContext;
    }
    internalContentContext = 0;
  }
  return internalContentContext;
}

- (FCAssetManager)assetManager
{
  FCAssetManager *assetManager;
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
  assetManager = self->_assetManager;
  if (!assetManager)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_assetManager");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext assetManager]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 585;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_assetManager;
    }
    assetManager = 0;
  }
  return assetManager;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (NSString)contentDirectory
{
  NSString *contentDirectory;
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
  contentDirectory = self->_contentDirectory;
  if (!contentDirectory)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_contentDirectory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext contentDirectory]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 621;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_contentDirectory;
    }
    contentDirectory = 0;
  }
  return contentDirectory;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  FCCoreConfigurationManager *configurationManager;
  FCCoreConfigurationManager *v3;
  void *v6;
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
  configurationManager = self->_configurationManager;
  if (configurationManager)
    goto LABEL_12;
  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    goto LABEL_6;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_configurationManager");
  *(_DWORD *)buf = 136315906;
  v8 = "-[FCContentContext appConfigurationManager]";
  v9 = 2080;
  v10 = "FCContentContext.m";
  v11 = 1024;
  v12 = 564;
  v13 = 2114;
  v14 = v6;
  _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  configurationManager = self->_configurationManager;
  if (configurationManager)
  {
LABEL_12:
    if (-[FCCoreConfigurationManager conformsToProtocol:](configurationManager, "conformsToProtocol:", &unk_1EE65F298))v3 = configurationManager;
    else
      v3 = 0;
  }
  else
  {
LABEL_6:
    v3 = 0;
  }
  return v3;
}

uint64_t __52__FCContentContext_interestTokenForContentManifest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "recognizesRecordID:", a2);
}

- (void)_updateReachabilityGivenRequirements
{
  void *v3;
  id v4;

  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FCContentContext supportedCountryNetworkReachabilityRequirement](self, "supportedCountryNetworkReachabilityRequirement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessRestrictedBecauseOfCountry:", objc_msgSend(v3, "isSatisfied") ^ 1);

}

- (FCNetworkReachabilityRequirement)supportedCountryNetworkReachabilityRequirement
{
  return self->_supportedCountryNetworkReachabilityRequirement;
}

- (id)interestTokenForContentManifest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *context;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1A8580B64]();
  -[FCContentContext assetManager](self, "assetManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interestTokenForAssetURLs:", v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCContentContext assetKeyCache](self, "assetKeyCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetWrappingKeyIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interestTokenForWrappingKeyIDs:", v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCContentContext avAssetCache](self, "avAssetCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avAssetIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interestTokenForAssetIdentifiers:", v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCContentContext avAssetKeyCache](self, "avAssetKeyCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v4;
  objc_msgSend(v4, "avAssetKeyURIs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "interestTokenForKeyURIs:", v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[FCContentContext internalContentContext](self, "internalContentContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recordSources");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v36, "recordIDs", v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __52__FCContentContext_interestTokenForContentManifest___block_invoke;
        v43[3] = &unk_1E463C7A0;
        v43[4] = v20;
        objc_msgSend(v21, "fc_arrayOfObjectsPassingTest:", v43);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "interestTokenForRecordIDs:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v23);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v17);
  }

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __52__FCContentContext_interestTokenForContentManifest___block_invoke_2;
  v37[3] = &unk_1E463C840;
  v38 = v34;
  v39 = v33;
  v40 = v32;
  v41 = v31;
  v42 = v13;
  v24 = v13;
  v25 = v31;
  v26 = v32;
  v27 = v33;
  v28 = v34;
  +[FCInterestToken interestTokenWithRemoveInterestBlock:](FCInterestToken, "interestTokenWithRemoveInterestBlock:", v37);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v29;
}

- (FCAVAssetKeyCacheType)avAssetKeyCache
{
  return self->_avAssetKeyCache;
}

- (FCContentContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentDatabase:(id)a5 contentHostDirectory:(id)a6 networkBehaviorMonitor:(id)a7 networkReachability:(id)a8 setupCustomURLProtocols:(BOOL)a9 desiredHeadlineFieldOptions:(unint64_t)a10 feedUsage:(int64_t)a11 assetKeyManagerDelegate:(id)a12 appActivityMonitor:(id)a13 backgroundTaskable:(id)a14 pptContext:(id)a15
{
  id v21;
  id v22;
  FCContentContext *v23;
  FCContentContext *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSString *contentDirectory;
  void *v38;
  void *v39;
  FCAVAssetKeyServiceType *v40;
  FCAVAssetKeyServiceType *avAssetKeyService;
  FCAVPersistentAssetKeyCache *v42;
  void *v43;
  FCAVAssetKeyCacheType *v44;
  FCAVAssetKeyCacheType *avAssetKeyCache;
  id *v46;
  FCAVAssetKeyManagerType *avAssetKeyManager;
  FCAVAssetCache *v48;
  void *v49;
  FCAVAssetCacheType *v50;
  FCAVAssetCacheType *avAssetCache;
  id *v52;
  FCAVAssetDownloadManager *avAssetDownloadManager;
  FCAVAssetResourceLoader *v54;
  void *v55;
  uint64_t v56;
  FCAVAssetResourceLoaderType *avAssetResourceLoader;
  id *v58;
  FCAVAssetFactoryType *avAssetFactory;
  FCAVAssetPrewarmer *v60;
  FCAVAssetPrewarming *avAssetPrewarmer;
  void *v62;
  uint64_t v63;
  NSString *tabiResourcesContentDirectory;
  uint64_t v65;
  NSString *tabiResourcesContentDirectoryLegacy;
  void *v67;
  uint64_t v68;
  NSString *tabiModelsContentDirectory;
  uint64_t v70;
  NSString *tabiModelsContentDirectoryLegacy;
  uint64_t v72;
  NSString *tabiRequestsContentDirectory;
  FCContentContext *v74;
  FCAssetKeyServiceType *v75;
  FCAssetKeyServiceType *assetKeyService;
  FCPersistentAssetKeyCache *v77;
  void *v78;
  FCAssetKeyCacheType *v79;
  FCAssetKeyCacheType *assetKeyCache;
  id *v81;
  FCAssetKeyManagerType *assetKeyManager;
  FCAssetManager *v83;
  void *v84;
  FCAssetManager *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  unint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  BOOL v96;
  uint64_t v97;
  void *v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  FCArticleRecordSource *v102;
  FCPurchaseLookupRecordSource *v103;
  FCTagListRecordSource *v104;
  FCResourceRecordSource *v105;
  FCArticleListRecordSource *v106;
  FCChannelMembershipController *v107;
  FCForYouConfigRecordSource *v108;
  FCWidgetSectionConfigRecordSource *v109;
  FCIssueRecordSource *v110;
  FCIssueListRecordSource *v111;
  FCAudioConfigRecordSource *v112;
  FCPuzzleTypeRecordSource *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  void *v121;
  void *v122;
  uint64_t v123;
  FCFeedDatabase *v124;
  FCFeedPrewarmer *v125;
  FCTagController *v126;
  FCTagController *tagController;
  FCSportsEventController *v128;
  FCSportsEventController *sportsEventController;
  FCArticleController *v130;
  FCArticleController *articleController;
  FCPuzzleTypeController *v132;
  FCPuzzleTypeController *puzzleTypeController;
  FCPuzzleController *v134;
  void *v135;
  uint64_t v136;
  FCPuzzleController *puzzleController;
  FCFlintResourceManager *v138;
  FCFlintResourceManager *flintResourceManager;
  NSURL *directoryURLForCachedAssets;
  void *v141;
  FCNetworkReachabilityRequirement *supportedCountryNetworkReachabilityRequirement;
  void *v143;
  NSObject *v144;
  char *v145;
  void *v146;
  char *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  int v153;
  const __CFString *v154;
  void *v156;
  void *v157;
  FCChannelMembershipRecordSource *v158;
  void *v159;
  void *v160;
  FCAssetManager *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  FCPuzzleRecordSource *v167;
  FCSportsEventRecordSource *v168;
  FCTagRecordSource *v169;
  id obj;
  id obja;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  void *v181;
  id v182;
  id v183;
  void *v184;
  _QWORD v185[4];
  FCContentContext *v186;
  objc_super v187;
  uint8_t buf[4];
  const char *v189;
  __int16 v190;
  char *v191;
  __int16 v192;
  _BYTE v193[18];
  uint64_t v194;

  v194 = *MEMORY[0x1E0C80C00];
  v178 = a3;
  obj = a4;
  v21 = a4;
  v183 = a5;
  v22 = a6;
  v177 = a7;
  v176 = a8;
  v175 = a12;
  v179 = a13;
  v182 = a14;
  v173 = a15;
  v184 = v21;
  if (!v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v156 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configurationManager != nil");
    *(_DWORD *)buf = 136315906;
    v189 = "-[FCContentContext initWithConfiguration:configurationManager:contentDatabase:contentHostDirectory:networkBeh"
           "aviorMonitor:networkReachability:setupCustomURLProtocols:desiredHeadlineFieldOptions:feedUsage:assetKeyManage"
           "rDelegate:appActivityMonitor:backgroundTaskable:pptContext:]";
    v190 = 2080;
    v191 = "FCContentContext.m";
    v192 = 1024;
    *(_DWORD *)v193 = 232;
    *(_WORD *)&v193[4] = 2114;
    *(_QWORD *)&v193[6] = v156;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v22)
      goto LABEL_6;
  }
  else if (v22)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v157 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentHostDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v189 = "-[FCContentContext initWithConfiguration:configurationManager:contentDatabase:contentHostDirectory:networkBeh"
           "aviorMonitor:networkReachability:setupCustomURLProtocols:desiredHeadlineFieldOptions:feedUsage:assetKeyManage"
           "rDelegate:appActivityMonitor:backgroundTaskable:pptContext:]";
    v190 = 2080;
    v191 = "FCContentContext.m";
    v192 = 1024;
    *(_DWORD *)v193 = 233;
    *(_WORD *)&v193[4] = 2114;
    *(_QWORD *)&v193[6] = v157;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v187.receiver = self;
  v187.super_class = (Class)FCContentContext;
  v23 = -[FCContentContext init](&v187, sel_init);
  v24 = v23;
  v25 = v183;
  v181 = v22;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_contextConfiguration, a3);
    objc_msgSend(v21, "configuration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "setShouldUseSecureConnectionForCKAssetURLs:", objc_msgSend(v26, "useSecureConnectionForAssets"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v183, "setMaximumRetryAfterForCK:", (double)objc_msgSend(v26, "maximumRetryAfterForCK"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringForKey:", CFSTR("news.features.todaymodule"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(MEMORY[0x1E0CB3940], "fc_string:isEqualToString:", CFSTR("enabled"), v28) & 1) != 0)
      {
        v29 = 1;
      }
      else if (objc_msgSend(MEMORY[0x1E0CB3940], "fc_string:isEqualToString:", CFSTR("default"), v28))
      {
        v29 = objc_msgSend(v26, "todayFeedEnabled");
      }
      else
      {
        v29 = 0;
      }
      objc_opt_self();
      s_newTodayFeedEnabled = v29;

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringForKey:", CFSTR("news.feature.tagfeedmodule"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(MEMORY[0x1E0CB3940], "fc_string:isEqualToString:", CFSTR("enabled"), v31) & 1) != 0)
      {
        v32 = 1;
      }
      else if (objc_msgSend(MEMORY[0x1E0CB3940], "fc_string:isEqualToString:", CFSTR("default"), v31))
      {
        v32 = objc_msgSend(v26, "tagFeedEnabled");
      }
      else
      {
        v32 = 0;
      }
      objc_opt_self();
      s_newTagFeedEnabled = v32;

    }
    objc_msgSend(v178, "contentContainerCombinationIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByAppendingPathComponent:isDirectory:", v33, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v24->_configurationManager, obj);
    objc_msgSend(v184, "addObserver:", v24);
    objc_storeStrong((id *)&v24->_pptContext, a15);
    objc_storeWeak((id *)&v24->_backgroundTaskable, v182);
    objc_storeStrong((id *)&v24->_contentHostDirectoryURL, a6);
    objc_msgSend(v34, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    contentDirectory = v24->_contentDirectory;
    v24->_contentDirectory = (NSString *)v36;

    objc_msgSend(v34, "URLByAppendingPathComponent:isDirectory:", CFSTR("av-assets"), 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v38, 1, 0, 0);

    v40 = (FCAVAssetKeyServiceType *)-[FCAVAssetKeyService initWithConfigurationManager:]([FCAVAssetKeyService alloc], v184);
    avAssetKeyService = v24->_avAssetKeyService;
    v24->_avAssetKeyService = v40;

    v42 = [FCAVPersistentAssetKeyCache alloc];
    objc_msgSend(v38, "path");
    v174 = v26;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (FCAVAssetKeyCacheType *)-[FCAVPersistentAssetKeyCache initWithCacheDirectory:](v42, v43);
    avAssetKeyCache = v24->_avAssetKeyCache;
    v24->_avAssetKeyCache = v44;

    v46 = -[FCAVAssetKeyManager initWithService:cache:]((id *)[FCAVAssetKeyManager alloc], v24->_avAssetKeyService, v24->_avAssetKeyCache);
    avAssetKeyManager = v24->_avAssetKeyManager;
    v24->_avAssetKeyManager = (FCAVAssetKeyManagerType *)v46;

    v48 = [FCAVAssetCache alloc];
    objc_msgSend(v38, "path");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (FCAVAssetCacheType *)-[FCAVAssetCache initWithCacheDirectory:](v48, v49);
    avAssetCache = v24->_avAssetCache;
    v24->_avAssetCache = v50;

    v52 = -[FCAVAssetDownloadManager initWithAssetCache:keyCache:networkReachability:]([FCAVAssetDownloadManager alloc], v24->_avAssetCache, v24->_avAssetKeyCache, v176);
    avAssetDownloadManager = v24->_avAssetDownloadManager;
    v24->_avAssetDownloadManager = (FCAVAssetDownloadManager *)v52;

    v54 = [FCAVAssetResourceLoader alloc];
    v165 = v38;
    objc_msgSend(v38, "path");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[FCAVAssetResourceLoader initWithCacheDirectory:networkReachability:](v54, "initWithCacheDirectory:networkReachability:", v55, v176);
    avAssetResourceLoader = v24->_avAssetResourceLoader;
    v24->_avAssetResourceLoader = (FCAVAssetResourceLoaderType *)v56;

    objc_storeStrong((id *)&v24->_networkReachability, a8);
    v58 = -[FCAVAssetFactory initWithAssetCache:assetKeyCache:assetKeyManager:assetResourceLoader:]((id *)[FCAVAssetFactory alloc], v24->_avAssetCache, v24->_avAssetKeyCache, v24->_avAssetKeyManager, v24->_avAssetResourceLoader);
    avAssetFactory = v24->_avAssetFactory;
    v24->_avAssetFactory = (FCAVAssetFactoryType *)v58;

    v60 = objc_alloc_init(FCAVAssetPrewarmer);
    avAssetPrewarmer = v24->_avAssetPrewarmer;
    v24->_avAssetPrewarmer = (FCAVAssetPrewarming *)v60;

    objc_msgSend(v34, "URLByAppendingPathComponent:isDirectory:", CFSTR("tabi-resources"), 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "path");
    v63 = objc_claimAutoreleasedReturnValue();
    tabiResourcesContentDirectory = v24->_tabiResourcesContentDirectory;
    v24->_tabiResourcesContentDirectory = (NSString *)v63;

    v164 = v62;
    objc_msgSend(v62, "path");
    v65 = objc_claimAutoreleasedReturnValue();
    tabiResourcesContentDirectoryLegacy = v24->_tabiResourcesContentDirectoryLegacy;
    v24->_tabiResourcesContentDirectoryLegacy = (NSString *)v65;

    objc_msgSend(v34, "URLByAppendingPathComponent:isDirectory:", CFSTR("tabi-models"), 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "path");
    v68 = objc_claimAutoreleasedReturnValue();
    tabiModelsContentDirectory = v24->_tabiModelsContentDirectory;
    v24->_tabiModelsContentDirectory = (NSString *)v68;

    v163 = v67;
    objc_msgSend(v67, "path");
    v70 = objc_claimAutoreleasedReturnValue();
    tabiModelsContentDirectoryLegacy = v24->_tabiModelsContentDirectoryLegacy;
    v24->_tabiModelsContentDirectoryLegacy = (NSString *)v70;

    objc_msgSend(v34, "URLByAppendingPathComponent:isDirectory:", CFSTR("tabi-requests"), 1);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "path");
    v72 = objc_claimAutoreleasedReturnValue();
    tabiRequestsContentDirectory = v24->_tabiRequestsContentDirectory;
    v24->_tabiRequestsContentDirectory = (NSString *)v72;

    v185[0] = MEMORY[0x1E0C809B0];
    v185[1] = 3221225472;
    v185[2] = __278__FCContentContext_initWithConfiguration_configurationManager_contentDatabase_contentHostDirectory_networkBehaviorMonitor_networkReachability_setupCustomURLProtocols_desiredHeadlineFieldOptions_feedUsage_assetKeyManagerDelegate_appActivityMonitor_backgroundTaskable_pptContext___block_invoke;
    v185[3] = &unk_1E463AB18;
    v74 = v24;
    v186 = v74;
    +[FCTaskScheduler scheduleLowPriorityBlock:](FCTaskScheduler, "scheduleLowPriorityBlock:", v185);
    v75 = (FCAssetKeyServiceType *)-[FCAssetKeyService initWithConfigurationManager:]([FCAssetKeyService alloc], v184);
    assetKeyService = v74->_assetKeyService;
    v74->_assetKeyService = v75;

    v77 = [FCPersistentAssetKeyCache alloc];
    objc_msgSend(v22, "path");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (FCAssetKeyCacheType *)-[FCPersistentAssetKeyCache initWithCacheDirectory:cacheName:](v77, v78, CFSTR("shared-assets-lru"));
    assetKeyCache = v74->_assetKeyCache;
    v74->_assetKeyCache = v79;

    v81 = -[FCAssetKeyManager initWithService:cache:delegate:]((id *)[FCAssetKeyManager alloc], v74->_assetKeyService, v74->_assetKeyCache, v175);
    assetKeyManager = v74->_assetKeyManager;
    v74->_assetKeyManager = (FCAssetKeyManagerType *)v81;

    v83 = [FCAssetManager alloc];
    objc_msgSend(v22, "path");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v183;
    v85 = -[FCAssetManager initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:networkReachability:](v83, "initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:networkReachability:", CFSTR("shared-assets"), v84, v74->_assetKeyManager, v24->_avAssetFactory, v183, v177, v176);

    v86 = objc_msgSend(v174, "useSecureConnectionForAssets");
    if (v85)
      v85->_shouldUseSecureConnectionForCKAssetDownloads = v86;
    objc_storeStrong((id *)&v74->_assetManager, v85);
    if (-[FCAssetKeyCacheType conformsToProtocol:](v74->_assetKeyCache, "conformsToProtocol:", &unk_1EE65ACA8))objc_msgSend(v179, "addObserver:", v74->_assetKeyCache);
    v161 = v85;
    v87 = (void *)objc_opt_new();
    objc_msgSend(v87, "setContentDatabase:", v183);
    objc_storeStrong((id *)&v74->_internalContentContext, v87);
    if (a9)
    {
      +[FCExcerptURLProtocol setupWithArticleDatabase:](FCExcerptURLProtocol, "setupWithArticleDatabase:", v183);
      +[FCRecordFieldURLProtocol setupWithArticleDatabase:](FCRecordFieldURLProtocol, "setupWithArticleDatabase:", v183);
      objc_msgSend(v181, "path");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCPuzzleThumbnailURLProtocol setupWithArticleDatabase:cacheDirectory:](FCPuzzleThumbnailURLProtocol, "setupWithArticleDatabase:cacheDirectory:", v183, v88);

    }
    objc_msgSend(v34, "path");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "experimentalizableFieldPostfix");
    v172 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "currentTreatment");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "stringValue");
    obja = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v174, "shouldShowAlternateHeadlines"))
      v91 = a10 | 0x10000000;
    else
      v91 = a10;
    v166 = v34;
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v174, "articleEmbeddingsEnabled"))
    {
      objc_msgSend(v174, "newsPersonalizationConfiguration");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "articleEmbeddingsConfiguration");
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v93, "titleEmbeddingConfiguration");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "shouldFetch");

      v96 = v95 == 0;
      v25 = v183;
      if (v96)
        v97 = v91;
      else
        v97 = v91 | 0x800000000;
      objc_msgSend(v93, "bodyEmbeddingConfiguration");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v98, "shouldFetch");

      if (v99)
        v91 = v97 | 0x1000000000;
      else
        v91 = v97;

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v174, "engagementCohortsExpField");
      v100 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v100 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v174, "conversionCohortsExpField");
      v101 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v101 = 0;
    }
    v159 = (void *)v101;
    v160 = (void *)v100;
    v102 = -[FCArticleRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desiredArticleRecordFieldOptions:experimentalizableFieldsPostfix:engagementCohortsExpField:conversionCohortsExpField:activeTreatmentID:]([FCArticleRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desiredArticleRecordFieldOptions:experimentalizableFieldsPostfix:engagementCohortsExpField:conversionCohortsExpField:activeTreatmentID:", v25, v89, v179, v182, v91 & 0xF | (16 * ((v91 >> 6) & 1)) | (v91 >> 7) & 0x240000 | (v91 >> 5) & 0x1FE0 | (v91 >> 7) & 0x371BE000 | (v91 >> 24) & 0x400, v172, v100, v101, obja);
    objc_msgSend(v87, "setArticleRecordSource:", v102);

    v103 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCPurchaseLookupRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setPurchaseLookupRecordSource:", v103);

    v169 = -[FCTagRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desiredTagRecordFieldOptions:]([FCTagRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desiredTagRecordFieldOptions:", v25, v89, v179, v182, FCDesiredTagRecordFieldOptionsWithHeadlineFieldOptions(v91));
    objc_msgSend(v87, "setTagRecordSource:");
    v168 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCSportsEventRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setSportsEventRecordSource:");
    v104 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCTagListRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setTagListRecordSource:", v104);

    v105 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCResourceRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setResourceRecordSource:", v105);

    v106 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCArticleListRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setArticleListRecordSource:", v106);

    v158 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCChannelMembershipRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    v107 = -[FCChannelMembershipController initWithChannelMembershipRecordSource:]([FCChannelMembershipController alloc], "initWithChannelMembershipRecordSource:", v158);
    objc_msgSend(v87, "setChannelMembershipController:", v107);

    v108 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCForYouConfigRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setForYouConfigRecordSource:", v108);

    v109 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCWidgetSectionConfigRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setWidgetSectionConfigRecordSource:", v109);

    v110 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCIssueRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setIssueRecordSource:", v110);

    v111 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCIssueListRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setIssueListRecordSource:", v111);

    v112 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCAudioConfigRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setAudioConfigRecordSource:", v112);

    v167 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCPuzzleRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setPuzzleRecordSource:");
    v113 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:]([FCPuzzleTypeRecordSource alloc], "initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:", v25, v89, v179, v182);
    objc_msgSend(v87, "setPuzzleTypeRecordSource:", v113);
    -[FCContentContext assetKeyCache](v74, "assetKeyCache");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setAssetKeyCache:", v114);

    -[FCContentContext assetKeyManager](v74, "assetKeyManager");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setAssetKeyManager:", v115);

    -[FCContentContext avAssetFactory](v74, "avAssetFactory");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setAvAssetFactory:", v116);

    -[FCContentContext avAssetCache](v74, "avAssetCache");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setAvAssetCache:", v117);

    -[FCContentContext avAssetKeyCache](v74, "avAssetKeyCache");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setAvAssetKeyCache:", v118);

    -[FCContentContext avAssetDownloadManager](v74, "avAssetDownloadManager");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setAvAssetDownloadManager:", v119);

    if (a11 != 1)
    {
      v120 = objc_msgSend(v174, "isOrderFeedEndpointEnabled");
      NewsCoreUserDefaults();
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "stringForKey:", CFSTR("feed_endpoint"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v122, "isEqualToString:", CFSTR("multi_feed")) & 1) != 0)
        v123 = 0;
      else
        v123 = objc_msgSend(v122, "isEqualToString:", CFSTR("order_feed")) | v120;
      v124 = -[FCFeedDatabase initWithParentDirectoryURL:usage:endpoint:]([FCFeedDatabase alloc], "initWithParentDirectoryURL:usage:endpoint:", v166, a11, v123);
      objc_msgSend(v87, "setFeedDatabase:", v124);
      v125 = -[FCFeedPrewarmer initWithContentContext:]([FCFeedPrewarmer alloc], "initWithContentContext:", v74);
      objc_msgSend(v87, "setFeedPrewarmer:", v125);

      v25 = v183;
    }
    v126 = -[FCTagController initWithContentDatabase:assetManager:tagRecordSource:configurationManager:]([FCTagController alloc], "initWithContentDatabase:assetManager:tagRecordSource:configurationManager:", v25, v161, v169, v184);
    tagController = v74->_tagController;
    v74->_tagController = v126;

    v128 = -[FCSportsEventController initWithContentDatabase:context:sportsEventRecordSource:tagController:]([FCSportsEventController alloc], "initWithContentDatabase:context:sportsEventRecordSource:tagController:", v25, v74, v168, v74->_tagController);
    sportsEventController = v74->_sportsEventController;
    v74->_sportsEventController = v128;

    v130 = -[FCArticleController initWithContext:]([FCArticleController alloc], "initWithContext:", v74);
    articleController = v74->_articleController;
    v74->_articleController = v130;

    v132 = -[FCPuzzleTypeController initWithContentDatabase:context:assetManager:puzzleTypeRecordSource:configurationManager:]([FCPuzzleTypeController alloc], "initWithContentDatabase:context:assetManager:puzzleTypeRecordSource:configurationManager:", v25, v74, v161, v113, v184);
    puzzleTypeController = v74->_puzzleTypeController;
    v74->_puzzleTypeController = v132;

    v134 = [FCPuzzleController alloc];
    -[FCContentContext puzzleTypeController](v74, "puzzleTypeController");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = -[FCPuzzleController initWithContentDatabase:assetManager:puzzleTypeController:puzzleRecordSource:configurationManager:](v134, "initWithContentDatabase:assetManager:puzzleTypeController:puzzleRecordSource:configurationManager:", v25, v161, v135, v167, v184);
    puzzleController = v74->_puzzleController;
    v74->_puzzleController = (FCPuzzleController *)v136;

    v138 = -[FCFlintResourceManager initWithContext:]([FCFlintResourceManager alloc], "initWithContext:", v74);
    flintResourceManager = v74->_flintResourceManager;
    v74->_flintResourceManager = v138;

    if (v161)
      directoryURLForCachedAssets = v161->_directoryURLForCachedAssets;
    else
      directoryURLForCachedAssets = 0;
    v22 = v181;
    objc_storeStrong((id *)&v74->_assetCacheDirectoryURL, directoryURLForCachedAssets);
    v141 = (void *)objc_opt_new();
    objc_msgSend(v141, "setObserver:", v74);
    supportedCountryNetworkReachabilityRequirement = v74->_supportedCountryNetworkReachabilityRequirement;
    v74->_supportedCountryNetworkReachabilityRequirement = (FCNetworkReachabilityRequirement *)v141;

    -[FCContentContext _updateReachabilityGivenRequirements](v74, "_updateReachabilityGivenRequirements");
  }
  v143 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_INFO))
  {
    v144 = v143;
    -[FCContentContext contentStoreFrontID](v24, "contentStoreFrontID");
    v145 = (char *)objc_claimAutoreleasedReturnValue();
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "currentStoreFrontID");
    v147 = (char *)objc_claimAutoreleasedReturnValue();
    -[FCContentContext internalContentContext](v24, "internalContentContext");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "contentDatabase");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "containerIdentifier");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCContentContext internalContentContext](v24, "internalContentContext");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "contentDatabase");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = objc_msgSend(v152, "isProductionEnvironment");
    v154 = CFSTR(" not");
    *(_DWORD *)buf = 138544130;
    v189 = v145;
    v190 = 2114;
    if (v153)
      v154 = &stru_1E464BC40;
    v191 = v147;
    v192 = 2114;
    *(_QWORD *)v193 = v150;
    *(_WORD *)&v193[8] = 2114;
    *(_QWORD *)&v193[10] = v154;
    _os_log_impl(&dword_1A1B90000, v144, OS_LOG_TYPE_INFO, "Initialized content context with contentStoreFrontID: %{public}@, currentStoreFrontID: %{public}@, containerID: %{public}@%{public}@ in production environment.", buf, 0x2Au);

    v22 = v181;
    v25 = v183;

  }
  return v24;
}

- (id)recordSourceWithSchema:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCJSONRecordSource *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FCJSONRecordSource *v14;

  v4 = a3;
  -[FCContentContext configurationManager](self, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [FCJSONRecordSource alloc];
  -[FCContentContext internalContentContext](self, "internalContentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCContentContext contentDirectory](self, "contentDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "experimentalizableFieldPostfix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTreatment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FCJSONRecordSource initWithSchema:contentDatabase:contentDirectory:experimentationSuffix:activeTreatmentID:](v7, "initWithSchema:contentDatabase:contentDirectory:experimentationSuffix:activeTreatmentID:", v4, v9, v10, v11, v13);

  return v14;
}

- (FCAVAssetFactoryType)avAssetFactory
{
  FCAVAssetFactoryType *avAssetFactory;
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
  avAssetFactory = self->_avAssetFactory;
  if (!avAssetFactory)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_avAssetFactory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext avAssetFactory]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 597;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_avAssetFactory;
    }
    avAssetFactory = 0;
  }
  return avAssetFactory;
}

- (id)news_core_ConfigurationManager
{
  FCCoreConfigurationManager *configurationManager;
  FCCoreConfigurationManager *v3;
  void *v6;
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
  configurationManager = self->_configurationManager;
  if (configurationManager)
    goto LABEL_12;
  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    goto LABEL_6;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_configurationManager");
  *(_DWORD *)buf = 136315906;
  v8 = "-[FCContentContext news_core_ConfigurationManager]";
  v9 = 2080;
  v10 = "FCContentContext.m";
  v11 = 1024;
  v12 = 571;
  v13 = 2114;
  v14 = v6;
  _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  configurationManager = self->_configurationManager;
  if (configurationManager)
  {
LABEL_12:
    if (-[FCCoreConfigurationManager conformsToProtocol:](configurationManager, "conformsToProtocol:", &unk_1EE65F298))v3 = configurationManager;
    else
      v3 = 0;
  }
  else
  {
LABEL_6:
    v3 = 0;
  }
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

- (FCAVAssetDownloadManager)avAssetDownloadManager
{
  return self->_avAssetDownloadManager;
}

- (FCAssetKeyManagerType)assetKeyManager
{
  return self->_assetKeyManager;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  -[FCContentContext enableFlushingWithFlushingThreshold:exceptForFlusher:](self, "enableFlushingWithFlushingThreshold:exceptForFlusher:", a3, 0);
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3 exceptForFlusher:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__FCContentContext_enableFlushingWithFlushingThreshold_exceptForFlusher___block_invoke;
  v17[3] = &unk_1E463AA30;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if (v12 != v6)
          objc_msgSend(v12, "enableFlushingWithFlushingThreshold:", a3);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

}

- (FCPuzzleTypeController)puzzleTypeController
{
  return self->_puzzleTypeController;
}

- (FCCoreConfigurationManager)configurationManager
{
  FCCoreConfigurationManager *configurationManager;
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
  configurationManager = self->_configurationManager;
  if (!configurationManager)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_configurationManager");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext configurationManager]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 558;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_configurationManager;
    }
    configurationManager = 0;
  }
  return configurationManager;
}

- (FCTagController)tagController
{
  FCTagController *tagController;
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
  tagController = self->_tagController;
  if (!tagController)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_tagController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext tagController]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 609;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_tagController;
    }
    tagController = 0;
  }
  return tagController;
}

- (FCSportsEventController)sportsEventController
{
  return self->_sportsEventController;
}

- (FCPuzzleController)puzzleController
{
  return self->_puzzleController;
}

+ (void)initialize
{
  if (FCSetupLogging_onceToken != -1)
    dispatch_once(&FCSetupLogging_onceToken, &__block_literal_global_57);
}

- (FCArticleController)articleController
{
  FCArticleController *articleController;
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
  articleController = self->_articleController;
  if (!articleController)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_articleController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext articleController]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 603;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_articleController;
    }
    articleController = 0;
  }
  return articleController;
}

void __278__FCContentContext_initWithConfiguration_configurationManager_contentDatabase_contentHostDirectory_networkBehaviorMonitor_networkReachability_setupCustomURLProtocols_desiredHeadlineFieldOptions_feedUsage_assetKeyManagerDelegate_appActivityMonitor_backgroundTaskable_pptContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "avAssetKeyManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "avAssetCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentKeyIdentifiersForAllAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshKeysIfNearExpiration:completionHandler:", v3, 0);

}

- (FCAVAssetKeyManagerType)avAssetKeyManager
{
  return self->_avAssetKeyManager;
}

void __73__FCContentContext_enableFlushingWithFlushingThreshold_exceptForFlusher___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "internalContentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v4);

  objc_msgSend(*(id *)(a1 + 32), "assetKeyCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EE65D1E8);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetKeyCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "avAssetCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE65D1E8);

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "avAssetCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

  }
}

- (FCAVAssetCacheType)avAssetCache
{
  return self->_avAssetCache;
}

- (FCAssetKeyCacheType)assetKeyCache
{
  return self->_assetKeyCache;
}

- (NSString)tabiResourcesContentDirectory
{
  return self->_tabiResourcesContentDirectory;
}

- (NSString)tabiModelsContentDirectory
{
  return self->_tabiModelsContentDirectory;
}

- (FCContentContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 networkBehaviorMonitor:(id)a6 networkReachability:(id)a7 desiredHeadlineFieldOptions:(unint64_t)a8 feedUsage:(int64_t)a9 assetKeyManagerDelegate:(id)a10 appActivityMonitor:(id)a11 backgroundTaskable:(id)a12 pptContext:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  FCCKContentDatabase *v24;
  void *v25;
  FCCKContentDatabase *v26;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  FCContentContext *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v32 = a10;
  v31 = a11;
  v22 = a12;
  v23 = a13;
  v30 = v19;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentHostDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCContentContext initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:netw"
          "orkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTas"
          "kable:pptContext:]";
    v38 = 2080;
    v39 = "FCContentContext.m";
    v40 = 1024;
    v41 = 195;
    v42 = 2114;
    v43 = v28;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v24 = [FCCKContentDatabase alloc];
  objc_msgSend(v17, "contentContainerIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[FCCKContentDatabase initWithContainerIdentifier:productionEnvironment:networkBehaviorMonitor:networkReachability:configurationManager:](v24, "initWithContainerIdentifier:productionEnvironment:networkBehaviorMonitor:networkReachability:configurationManager:", v25, objc_msgSend(v17, "isProductionContentEnvironment"), v20, v21, v18);

  LOBYTE(v29) = 1;
  v35 = -[FCContentContext initWithConfiguration:configurationManager:contentDatabase:contentHostDirectory:networkBehaviorMonitor:networkReachability:setupCustomURLProtocols:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:](self, "initWithConfiguration:configurationManager:contentDatabase:contentHostDirectory:networkBehaviorMonitor:networkReachability:setupCustomURLProtocols:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:", v17, v18, v26, v30, v20, v21, v29, a8, a9, v32, v31, v22, v23);

  return v35;
}

- (FCAVAssetPrewarming)avAssetPrewarmer
{
  FCAVAssetPrewarming *avAssetPrewarmer;
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
  avAssetPrewarmer = self->_avAssetPrewarmer;
  if (!avAssetPrewarmer)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_avAssetPrewarmer");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext avAssetPrewarmer]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 591;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_avAssetPrewarmer;
    }
    avAssetPrewarmer = 0;
  }
  return avAssetPrewarmer;
}

- (id)recordTreeSourceWithRecordSources:(id)a3
{
  id v4;
  FCJSONRecordTreeSource *v5;

  v4 = a3;
  v5 = -[FCJSONRecordTreeSource initWithContext:jsonRecordSources:]([FCJSONRecordTreeSource alloc], "initWithContext:jsonRecordSources:", self, v4);

  return v5;
}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  id v5;
  char v6;
  _BYTE *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = objc_msgSend(v5, "useSecureConnectionForAssets");
  -[FCContentContext assetManager](self, "assetManager");
  v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[8] = v6;

  v8 = objc_msgSend(v5, "useSecureConnectionForAssets");
  -[FCContentContext internalContentContext](self, "internalContentContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldUseSecureConnectionForCKAssetURLs:", v8);

}

- (FCContentContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 networkBehaviorMonitor:(id)a6 desiredHeadlineFieldOptions:(unint64_t)a7 feedUsage:(int64_t)a8 appActivityMonitor:(id)a9 backgroundTaskable:(id)a10 pptContext:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  FCContentContext *v25;

  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[FCContentContext initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:networkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:](self, "initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:networkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:", v23, v22, v21, v20, v24, a7, a8, 0, v19, v18, v17);

  return v25;
}

- (void)dealloc
{
  objc_super v3;

  +[FCExcerptURLProtocol unregister](FCExcerptURLProtocol, "unregister");
  v3.receiver = self;
  v3.super_class = (Class)FCContentContext;
  -[FCContentContext dealloc](&v3, sel_dealloc);
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

  -[FCContentContext contextConfiguration](self, "contextConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentEnvironmentDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)magazinesConfigurationManager
{
  FCCoreConfigurationManager *configurationManager;
  FCCoreConfigurationManager *v3;
  void *v6;
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
  configurationManager = self->_configurationManager;
  if (configurationManager)
    goto LABEL_12;
  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    goto LABEL_6;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_configurationManager");
  *(_DWORD *)buf = 136315906;
  v8 = "-[FCContentContext magazinesConfigurationManager]";
  v9 = 2080;
  v10 = "FCContentContext.m";
  v11 = 1024;
  v12 = 578;
  v13 = 2114;
  v14 = v6;
  _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  configurationManager = self->_configurationManager;
  if (configurationManager)
  {
LABEL_12:
    if (-[FCCoreConfigurationManager conformsToProtocol:](configurationManager, "conformsToProtocol:", &unk_1EE66D618))v3 = configurationManager;
    else
      v3 = 0;
  }
  else
  {
LABEL_6:
    v3 = 0;
  }
  return v3;
}

- (FCFeedDatabaseProtocol)feedDatabase
{
  void *v2;
  void *v3;

  -[FCContentContext internalContentContext](self, "internalContentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCFeedDatabaseProtocol *)v3;
}

- (NSString)contentEnvironmentToken
{
  void *v2;
  void *v3;

  -[FCContentContext contextConfiguration](self, "contextConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentContainerCombinationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)convertRecords:(id)a3
{
  id v4;
  FCHeldRecords *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  FCHeldRecords *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(FCHeldRecords);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[FCContentContext internalContentContext](self, "internalContentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v13, "recordType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v21, "recordType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "recordType");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v23, v24);

        }
        objc_msgSend(v23, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v18);
  }
  v36 = v16;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v25 = v15;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      v29 = 0;
      v30 = v5;
      do
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        v31 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v29);
        objc_msgSend(v6, "objectForKey:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "convertRecords:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v34, v30);
        v5 = (FCHeldRecords *)objc_claimAutoreleasedReturnValue();

        ++v29;
        v30 = v5;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v27);
  }

  return v5;
}

- (void)prewarmStores
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FCContentContext_prewarmStores__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  dispatch_async(v3, block);

}

void __33__FCContentContext_prewarmStores__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "assetManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prewarm");

  objc_msgSend(*(id *)(a1 + 32), "internalContentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "articleRecordSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prewarm");

  objc_msgSend(*(id *)(a1 + 32), "internalContentContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tagRecordSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prewarm");

}

- (int64_t)storageSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[FCContentContext assetManager](self, "assetManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "storageSize");

  -[FCContentContext avAssetCache](self, "avAssetCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "storageSize") + v4;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[FCContentContext internalContentContext](self, "internalContentContext", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "storageSize");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v6;
}

- (void)save
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "Will force-save records and assets", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[FCContentContext internalContentContext](self, "internalContentContext", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A8580B64]();
        objc_msgSend(v11, "save");
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  v13 = (void *)MEMORY[0x1A8580B64]();
  -[FCContentContext assetManager](self, "assetManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "save");

  objc_autoreleasePoolPop(v13);
  v15 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = objc_msgSend(v4, "fc_millisecondTimeIntervalUntilNow");
    *(_DWORD *)buf = 134217984;
    v23 = v17;
    _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Did force-save record sources and assets in %llums", buf, 0xCu);

  }
}

- (void)ppt_overrideFeedEndpoint:(int64_t)a3
{
  void *v5;
  FCFeedDatabase *v6;
  void *v7;
  FCFeedDatabase *v8;
  void *v9;
  id v10;

  -[FCContentContext internalContentContext](self, "internalContentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedDatabase");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "endpoint") != a3)
  {
    objc_msgSend(v10, "teardown");
    v6 = [FCFeedDatabase alloc];
    objc_msgSend(v10, "parentDirectoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FCFeedDatabase initWithParentDirectoryURL:usage:endpoint:](v6, "initWithParentDirectoryURL:usage:endpoint:", v7, objc_msgSend(v10, "usage"), a3);
    -[FCContentContext internalContentContext](self, "internalContentContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFeedDatabase:", v8);

  }
}

- (void)ppt_prewarmFeedDatabase
{
  void *v2;
  id v3;

  -[FCContentContext internalContentContext](self, "internalContentContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prewarm");

}

- (void)configurationManagerScienceExperimentFieldsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  _BYTE v13[12];
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "engagementCohortsExpField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "conversionCohortsExpField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  NewsCoreUserDefaults();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("use_cached_exp_fields"));

  v9 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("Saving");
    *(_DWORD *)v13 = 138412802;
    if (v8)
      v10 = CFSTR("Reading");
    *(_QWORD *)&v13[4] = v10;
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "%@ engagementCohortsExpField: %{public}@ conversionCohortsExpField: %{public}@", v13, 0x20u);
  }
  -[FCContentContext internalContentContext](self, "internalContentContext", *(_QWORD *)v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "articleRecordSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateEngagementCohortsExpField:conversionCohortsExpField:", v5, v6);

}

- (void)setAvAssetCache:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetCache, a3);
}

- (void)setAvAssetDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetDownloadManager, a3);
}

- (FCPPTContext)pptContext
{
  return self->_pptContext;
}

- (FCBackgroundTaskable)backgroundTaskable
{
  return (FCBackgroundTaskable *)objc_loadWeakRetained((id *)&self->_backgroundTaskable);
}

- (FCContextConfiguration)contextConfiguration
{
  return self->_contextConfiguration;
}

- (void)setContextConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSURL)contentHostDirectoryURL
{
  return self->_contentHostDirectoryURL;
}

- (void)setContentHostDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_contentHostDirectoryURL, a3);
}

- (void)setContentDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSURL)assetCacheDirectoryURL
{
  return self->_assetCacheDirectoryURL;
}

- (void)setAssetCacheDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_assetCacheDirectoryURL, a3);
}

- (void)setTabiResourcesContentDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)tabiResourcesContentDirectoryLegacy
{
  return self->_tabiResourcesContentDirectoryLegacy;
}

- (void)setTabiResourcesContentDirectoryLegacy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setTabiModelsContentDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)tabiModelsContentDirectoryLegacy
{
  return self->_tabiModelsContentDirectoryLegacy;
}

- (void)setTabiModelsContentDirectoryLegacy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)tabiRequestsContentDirectory
{
  return self->_tabiRequestsContentDirectory;
}

- (void)setTabiRequestsContentDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setInternalContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_internalContentContext, a3);
}

- (FCAssetKeyServiceType)assetKeyService
{
  return self->_assetKeyService;
}

- (void)setAssetKeyService:(id)a3
{
  objc_storeStrong((id *)&self->_assetKeyService, a3);
}

- (void)setAssetKeyCache:(id)a3
{
  objc_storeStrong((id *)&self->_assetKeyCache, a3);
}

- (void)setAssetKeyManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetKeyManager, a3);
}

- (void)setAvAssetFactory:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetFactory, a3);
}

- (FCAVAssetKeyServiceType)avAssetKeyService
{
  return self->_avAssetKeyService;
}

- (void)setAvAssetKeyService:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetKeyService, a3);
}

- (void)setAvAssetKeyCache:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetKeyCache, a3);
}

- (void)setAvAssetKeyManager:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetKeyManager, a3);
}

- (FCAVAssetResourceLoaderType)avAssetResourceLoader
{
  return self->_avAssetResourceLoader;
}

- (void)setAvAssetResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetResourceLoader, a3);
}

- (void)setSupportedCountryNetworkReachabilityRequirement:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCountryNetworkReachabilityRequirement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCountryNetworkReachabilityRequirement, 0);
  objc_storeStrong((id *)&self->_avAssetResourceLoader, 0);
  objc_storeStrong((id *)&self->_avAssetKeyManager, 0);
  objc_storeStrong((id *)&self->_avAssetKeyCache, 0);
  objc_storeStrong((id *)&self->_avAssetKeyService, 0);
  objc_storeStrong((id *)&self->_avAssetFactory, 0);
  objc_storeStrong((id *)&self->_assetKeyManager, 0);
  objc_storeStrong((id *)&self->_assetKeyCache, 0);
  objc_storeStrong((id *)&self->_assetKeyService, 0);
  objc_storeStrong((id *)&self->_internalContentContext, 0);
  objc_storeStrong((id *)&self->_tabiRequestsContentDirectory, 0);
  objc_storeStrong((id *)&self->_tabiModelsContentDirectoryLegacy, 0);
  objc_storeStrong((id *)&self->_tabiModelsContentDirectory, 0);
  objc_storeStrong((id *)&self->_tabiResourcesContentDirectoryLegacy, 0);
  objc_storeStrong((id *)&self->_tabiResourcesContentDirectory, 0);
  objc_storeStrong((id *)&self->_assetCacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_contentDirectory, 0);
  objc_storeStrong((id *)&self->_contentHostDirectoryURL, 0);
  objc_storeStrong((id *)&self->_contextConfiguration, 0);
  objc_destroyWeak((id *)&self->_backgroundTaskable);
  objc_storeStrong((id *)&self->_pptContext, 0);
  objc_storeStrong((id *)&self->_puzzleTypeController, 0);
  objc_storeStrong((id *)&self->_puzzleController, 0);
  objc_storeStrong((id *)&self->_sportsEventController, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);
  objc_storeStrong((id *)&self->_avAssetPrewarmer, 0);
  objc_storeStrong((id *)&self->_avAssetDownloadManager, 0);
  objc_storeStrong((id *)&self->_avAssetCache, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_articleController, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end
