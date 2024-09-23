@implementation HUSoftwareUpdateUIManager

+ (id)sharedManager
{
  if (qword_1ED580A38 != -1)
    dispatch_once(&qword_1ED580A38, &__block_literal_global_9);
  return (id)_MergedGlobals_612;
}

void __42__HUSoftwareUpdateUIManager_sharedManager__block_invoke()
{
  HUSoftwareUpdateUIManager *v0;
  void *v1;

  v0 = objc_alloc_init(HUSoftwareUpdateUIManager);
  v1 = (void *)_MergedGlobals_612;
  _MergedGlobals_612 = (uint64_t)v0;

}

- (HUSoftwareUpdateUIManager)init
{
  HUSoftwareUpdateUIManager *v2;
  uint64_t v3;
  NSMapTable *homeBackgroundCheckMapTable;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUSoftwareUpdateUIManager;
  v2 = -[HUSoftwareUpdateUIManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    homeBackgroundCheckMapTable = v2->_homeBackgroundCheckMapTable;
    v2->_homeBackgroundCheckMapTable = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", v2);

  }
  return v2;
}

- (void)startSilentBackgroundCheckForHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateUIManager.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  -[HUSoftwareUpdateUIManager homeBackgroundCheckMapTable](self, "homeBackgroundCheckMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      objc_msgSend(v5, "hf_prettyDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "[FETCH] Begin executing background check for software updates: %@", buf, 0xCu);

    }
    -[HUSoftwareUpdateUIManager fetchAvailableUpdatesForHome:options:](self, "fetchAvailableUpdatesForHome:options:", v5, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    -[HUSoftwareUpdateUIManager homeBackgroundCheckMapTable](self, "homeBackgroundCheckMapTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v8, v5);
    goto LABEL_9;
  }
  if (v9)
  {
    objc_msgSend(v5, "hf_prettyDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "[FETCH] Background check for software update already performed: %@", buf, 0xCu);
LABEL_9:

  }
}

- (id)fetchAvailableUpdatesForHome:(id)a3 options:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[HUSoftwareUpdateUIManager fetchAvailableUpdatesForHome:options:]";
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "[FETCH] %s: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(v6, "accessoriesSupportingSoftwareUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateUIManager _fetchAvailableUpdatesForAccessories:options:](self, "_fetchAvailableUpdatesForAccessories:options:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fetchAvailableUpdatesForAccessories:(id)a3 options:(unint64_t)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "na_filter:", &__block_literal_global_10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[HUSoftwareUpdateUIManager fetchAvailableUpdatesForAccessories:options:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "[FETCH] %s: %@", (uint8_t *)&v11, 0x16u);

  }
  -[HUSoftwareUpdateUIManager _fetchAvailableUpdatesForAccessories:options:](self, "_fetchAvailableUpdatesForAccessories:options:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __73__HUSoftwareUpdateUIManager_fetchAvailableUpdatesForAccessories_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsSoftwareUpdate");
}

- (id)_fetchAvailableUpdatesForAccessories:(id)a3 options:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  objc_msgSend(a3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__HUSoftwareUpdateUIManager__fetchAvailableUpdatesForAccessories_options___block_invoke;
  v12[3] = &__block_descriptor_40_e21__16__0__HMAccessory_8l;
  v12[4] = a4;
  objc_msgSend(v5, "na_map:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "combineAllFutures:ignoringErrors:scheduler:", v6, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flatMap:", &__block_literal_global_15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __74__HUSoftwareUpdateUIManager__fetchAvailableUpdatesForAccessories_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_fetchAvailableSoftwareUpdateWithOptions:", *(_QWORD *)(a1 + 32));
}

id __74__HUSoftwareUpdateUIManager__fetchAvailableUpdatesForAccessories_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a2, "na_filter:", &__block_literal_global_17_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    if (objc_msgSend(v2, "count") == 1)
    {
      v3 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(v2, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "futureWithError:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v2, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6, "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0D305A8]);
      v10 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v6, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(v6, "code"), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __74__HUSoftwareUpdateUIManager__fetchAvailableUpdatesForAccessories_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (int64_t)numberOfAccessoriesWithAvailableUpdates:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "na_filter:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

uint64_t __69__HUSoftwareUpdateUIManager_numberOfAccessoriesWithAvailableUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isReadyToInstallSoftwareUpdate"))
    v3 = objc_msgSend(v2, "hf_hasNewValidSoftwareUpdate");
  else
    v3 = 0;

  return v3;
}

- (int64_t)numberOfAccessoriesWithAvailableUpdatesInHome:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "accessoriesSupportingSoftwareUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUSoftwareUpdateUIManager numberOfAccessoriesWithAvailableUpdates:](self, "numberOfAccessoriesWithAvailableUpdates:", v4);

  return v5;
}

- (id)startUpdatesForAccessories:(id)a3 presentationDelegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateUIManager.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessories.count > 0"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateUIManager.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationDelegate"));

LABEL_3:
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke;
  v28[3] = &unk_1E6F4CCC8;
  v12 = v9;
  v29 = v12;
  v13 = v10;
  v30 = v13;
  objc_msgSend(v7, "na_each:", v28);
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "hf_prettyExpensiveDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v15;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Requested updates: %@", buf, 0xCu);

  }
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "hf_prettyExpensiveDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v17;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Ready to install updates: %@", buf, 0xCu);

  }
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_softwareUpdateComparator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSoftwareUpdateUIManager presentLicensesIfNeededForSoftwareUpdate:presentationDelegate:](self, "presentLicensesIfNeededForSoftwareUpdate:presentationDelegate:", v20, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_28;
    v26[3] = &unk_1E6F4CD58;
    v27 = v12;
    objc_msgSend(v21, "flatMap:", v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

void __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hf_hasNewValidSoftwareUpdate"))
  {
    if (objc_msgSend(v3, "hf_isReadyToInstallSoftwareUpdate"))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
      if (objc_msgSend(v3, "hf_isHomePod"))
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    }
  }

}

id __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_28(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_29);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "combineAllFutures:ignoringErrors:scheduler:", v2, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_3;
  v8[3] = &unk_1E6F4CD30;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_startSoftwareUpdate");
}

id __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "na_filter:", &__block_literal_global_30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v12;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "[START UPDATE] Start update failed for some accessories: %@ %@", buf, 0x16u);

    }
    v13 = *MEMORY[0x1E0D305B8];
    v14 = *MEMORY[0x1E0D30A48];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_errorWithAddedUserInfo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Start update succeeded for all accessories: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __77__HUSoftwareUpdateUIManager_startUpdatesForAccessories_presentationDelegate___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)startUpdatesForAllAccessoriesInHome:(id)a3 presentationDelegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateUIManager.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationDelegate"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateUIManager.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

LABEL_3:
  objc_msgSend(v7, "accessoriesSupportingSoftwareUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[HUSoftwareUpdateUIManager startUpdatesForAccessories:presentationDelegate:](self, "startUpdatesForAccessories:presentationDelegate:", v9, v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "hf_prettyDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "[START UPDATE] No accessories supporting software update: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;

  return v13;
}

- (id)startUpdateForAccessory:(id)a3 presentationDelegate:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateUIManager startUpdatesForAccessories:presentationDelegate:](self, "startUpdatesForAccessories:presentationDelegate:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isLicensePresentationNecessaryForSoftwareUpdate:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateUIManager.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessory"));

  }
  objc_msgSend(v7, "hf_softwareUpdateDocumentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "licenseAgreementVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "licenseAgreement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v8)
    {
      objc_msgSend(v7, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HUSoftwareUpdateUIManager _shouldPresentTermsAndConditionsForSoftwareLicenseAgreementVersion:home:](self, "_shouldPresentTermsAndConditionsForSoftwareLicenseAgreementVersion:home:", v9, v11);

      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(v7, "hf_prettyExpensiveDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("[START UPDATE] Cannot start update due to nil license: %@ %@"), v8, v13);

  }
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "hf_prettyExpensiveDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Cannot start update due to nil license and/or documentation: %@ %@", buf, 0x16u);

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 26);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (id)presentLicensesIfNeededForSoftwareUpdate:(id)a3 presentationDelegate:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  HUSoftwareUpdateUIManager *v28;
  id v29;
  id v30;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && (objc_msgSend(v6, "hf_isHomePod") & 1) != 0)
  {
    v30 = 0;
    v8 = -[HUSoftwareUpdateUIManager isLicensePresentationNecessaryForSoftwareUpdate:error:](self, "isLicensePresentationNecessaryForSoftwareUpdate:error:", v6, &v30);
    v9 = v30;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8)
      {
        objc_msgSend(v6, "hf_softwareUpdateDocumentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "licenseAgreementVersion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "licenseAgreement");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(location, self);
        v15 = (void *)MEMORY[0x1E0D519C0];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke;
        v22[3] = &unk_1E6F4CE20;
        v16 = v12;
        v23 = v16;
        v24 = v6;
        v17 = v14;
        v25 = v17;
        objc_copyWeak(&v29, location);
        v18 = v13;
        v26 = v18;
        v27 = v7;
        v28 = self;
        objc_msgSend(v15, "lazyFutureWithBlock:", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_destroyWeak(&v29);
        objc_destroyWeak(location);

LABEL_12:
        goto LABEL_13;
      }
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "hf_prettyExpensiveDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v20;
        _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Not showing license for SW update (%@) because the user has already agreed.", (uint8_t *)location, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v11;
}

void __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  HUSoftwareUpdateLicenseViewController *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "hf_prettyExpensiveDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v5;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Showing license: %@ %@", buf, 0x16u);

  }
  v7 = -[HUSoftwareUpdateLicenseViewController initWithDocument:]([HUSoftwareUpdateLicenseViewController alloc], "initWithDocument:", *(_QWORD *)(a1 + 48));
  objc_initWeak((id *)buf, v7);
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_39;
  v19[3] = &unk_1E6F4CDA8;
  v20 = *(id *)(a1 + 40);
  objc_copyWeak(&v24, (id *)(a1 + 80));
  v21 = *(id *)(a1 + 56);
  v22 = *(id *)(a1 + 64);
  objc_copyWeak(&v25, (id *)buf);
  v9 = v3;
  v23 = v9;
  -[HUSoftwareUpdateLicenseViewController setAgreeHandler:](v7, "setAgreeHandler:", v19);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_3;
  v13[3] = &unk_1E6F4CDF8;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 64);
  objc_copyWeak(&v17, (id *)(a1 + 80));
  objc_copyWeak(&v18, (id *)buf);
  v10 = v9;
  v16 = v10;
  -[HUSoftwareUpdateLicenseViewController setDisagreeHandler:](v7, "setDisagreeHandler:", v13);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v7);
  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  objc_msgSend(v11, "setModalInPresentation:", 1);
  v12 = (id)objc_msgSend(*(id *)(a1 + 64), "softwareUpdateUIManager:presentViewController:", *(_QWORD *)(a1 + 72), v11);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);

  objc_destroyWeak((id *)buf);
}

void __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_39(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "[START UPDATE] User AGREED to license for update: %@", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_markTermsAndConditionsAsReadForLicenseAgreementVersion:inHome:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_40;
  v9[3] = &unk_1E6F4CD80;
  v10 = *(id *)(a1 + 48);
  objc_copyWeak(&v12, (id *)(a1 + 64));
  objc_copyWeak(&v13, (id *)(a1 + 72));
  v11 = *(id *)(a1 + 56);
  v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);

}

void __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v5, "softwareUpdateUIManager:dismissViewController:", WeakRetained, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_2;
  v11[3] = &unk_1E6F4C820;
  v12 = *(id *)(a1 + 40);
  v13 = v4;
  v9 = v4;
  v10 = (id)objc_msgSend(v8, "addCompletionBlock:", v11);

}

uint64_t __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", MEMORY[0x1E0C9AAB0], *(_QWORD *)(a1 + 40));
}

void __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_error_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_ERROR, "[START UPDATE] User DISAGREED to license for update: %@", buf, 0xCu);

  }
  v3 = *(void **)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v3, "softwareUpdateUIManager:dismissViewController:", WeakRetained, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_43;
  v9[3] = &unk_1E6F4CDD0;
  v10 = *(id *)(a1 + 48);
  v7 = (id)objc_msgSend(v6, "addCompletionBlock:", v9);

}

void __91__HUSoftwareUpdateUIManager_presentLicensesIfNeededForSoftwareUpdate_presentationDelegate___block_invoke_43(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

- (BOOL)_shouldPresentTermsAndConditionsForSoftwareLicenseAgreementVersion:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
  {
    if ((HFPreferencesBoolForKey() & 1) != 0)
    {
LABEL_14:
      LOBYTE(v10) = 1;
      goto LABEL_15;
    }
    if (HFPreferencesBoolForKey())
    {

LABEL_11:
      HFLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "[START UPDATE] License version is missing!  Presenting terms and conditions irregardless of aberration...", buf, 2u);
      }

      v7 = 0;
      goto LABEL_14;
    }
  }
  if (!v7)
    goto LABEL_11;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Check whether license version %@ needs presentation...", buf, 0xCu);
  }

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateUIManager.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v10 = objc_msgSend(v8, "hf_hasAcceptedTermsAndConditionsForHomePodVersion:", v7) ^ 1;
LABEL_15:

  return v10;
}

- (id)_markTermsAndConditionsAsReadForLicenseAgreementVersion:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall") && HFPreferencesBoolForKey())
  {

LABEL_10:
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "[START UPDATE] License version is missing!  Unable to mark terms and conditions as read...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!v7)
    goto LABEL_10;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "[START UPDATE] License version %@ has been accepted!", buf, 0xCu);
  }

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateUIManager.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  objc_msgSend(v8, "hf_markTermsAndConditionsAsAcceptedForHomePodWithLicenseAgreementVersion:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v10;
}

- (void)executionEnvironmentDidEnterBackground:(id)a3
{
  id v3;

  -[HUSoftwareUpdateUIManager homeBackgroundCheckMapTable](self, "homeBackgroundCheckMapTable", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (NSMapTable)homeBackgroundCheckMapTable
{
  return self->_homeBackgroundCheckMapTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeBackgroundCheckMapTable, 0);
}

@end
