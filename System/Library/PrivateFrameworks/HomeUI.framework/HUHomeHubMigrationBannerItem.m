@implementation HUHomeHubMigrationBannerItem

- (HUHomeHubMigrationBannerItem)initWithHome:(id)a3
{
  HUHomeHubMigrationBannerItem *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  HUHomeHubMigrationBannerItem *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUHomeHubMigrationBannerItem;
  v3 = -[HUBannerItem initWithHome:](&v9, sel_initWithHome_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__HUHomeHubMigrationBannerItem_initWithHome___block_invoke;
    v7[3] = &unk_1E6F52828;
    v8 = v3;
    objc_msgSend(v5, "fetchDevicesWithCompletionHandler:", v7);

  }
  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D519C0];
    v7 = (void *)MEMORY[0x1E0D314B8];
    v30 = *MEMORY[0x1E0D30D70];
    v31[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outcomeWithResults:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithResult:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUBannerItem home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hf_canUpdateToHH2");

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v13, "allHomesFuture");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __60__HUHomeHubMigrationBannerItem__subclass_updateWithOptions___block_invoke;
      v21[3] = &unk_1E6F4CD30;
      v21[4] = self;
      objc_msgSend(v9, "flatMap:", v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
    }
    else
    {
      objc_msgSend(v13, "homeManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      HFLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[HUBannerItem home](self, "home");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109632;
        v25 = objc_msgSend(v16, "hf_currentUserIsOwner");
        v26 = 1024;
        v27 = objc_msgSend(v8, "isHH2MigrationAvailable");
        v28 = 1024;
        v29 = objc_msgSend(v8, "hasOptedToHH2");
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Should show HH2 migration banner?:NO Owner:%{BOOL}d migrationAvailable:%{BOOL}d userAlreadyOptedIn:%{BOOL}d. Skipping all additional checks.", buf, 0x14u);

      }
      v17 = (void *)MEMORY[0x1E0D519C0];
      v18 = (void *)MEMORY[0x1E0D314B8];
      v22 = *MEMORY[0x1E0D30D70];
      v23 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "outcomeWithResults:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "futureWithResult:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

void __45__HUHomeHubMigrationBannerItem_initWithHome___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "homeManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Failed to fetch owner devices for homeManager: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = v5;

}

id __60__HUHomeHubMigrationBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  NSObject *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  int v51;
  int v52;
  int v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  _BOOL4 v80;
  __int16 v81;
  int v82;
  __int16 v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v64 = (void *)objc_opt_new();
  v62 = v2;
  objc_msgSend(v2, "na_filter:", &__block_literal_global_167);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
  v65 = v5;
  v66 = v4;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v72;
    LOBYTE(v9) = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v72 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "hf_homePods");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "na_safeAddObjectsFromArray:", v11);
        if ((v9 & 1) != 0)
        {
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v68;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v68 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "device");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "supportsHH2");

                if (!v18)
                {
                  v9 = 0;
                  goto LABEL_18;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
              if (v14)
                continue;
              break;
            }
            v9 = 1;
LABEL_18:
            v5 = v65;
            v4 = v66;
          }
          else
          {
            v9 = 1;
          }

        }
        else
        {
          v9 = 0;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hf_canUpdateToHH2");

  if ((v20 & 1) != 0)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateHomeKitUpdateAvailable"), CFSTR("HUSoftwareUpdateHomeKitUpdateAvailable"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v64, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Migration.HomeUpgradeRecommended"), *MEMORY[0x1E0D30BA0]);
    if ((unint64_t)objc_msgSend(v5, "count") <= 1)
      v22 = CFSTR("HUSoftwareUpdateImproveReliabilityAndPerformance");
    else
      v22 = CFSTR("HUSoftwareUpdateImproveReliabilityAndPerformancePlural");
    _HULocalizedStringWithDefaultValue(v22, v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D30BF8]);

    _HULocalizedStringWithDefaultValue(CFSTR("HULearnMoreTitle"), CFSTR("HULearnMoreTitle"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D30BC0]);

    v25 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "configurationWithHierarchicalColor:", v26);
    v27 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)v27;
    objc_msgSend(v28, "configurationByApplyingConfiguration:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31880]), "initWithSystemImageName:configuration:", CFSTR("homekit"), v29);
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSymbolIconConfiguration:", v60);
    objc_msgSend(v64, "setObject:forKeyedSubscript:");
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31830]), "initWithAccessories:", v66);
    v30 = objc_msgSend(v58, "softwareUpdatesInProgress");
    v31 = objc_alloc(MEMORY[0x1E0D31988]);
    objc_msgSend(*(id *)(a1 + 32), "home");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "currentUser");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v31, "initWithHome:user:nameStyle:", v32, v34, 0);

    v57 = v35;
    v36 = objc_msgSend(v35, "hasDismissedHomeHubMigrationBanner");
    objc_msgSend(*(id *)(a1 + 32), "home");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "hf_canUpdateToHH2");
    if (v30)
      v39 = 0;
    else
      v39 = v38;
    v40 = v9 & (v36 ^ 1) & v39;

    HFLogForCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "home");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "hf_canUpdateToHH2");
      *(_DWORD *)buf = 67110144;
      v76 = v40;
      v77 = 1024;
      v78 = v43;
      v79 = 1024;
      v80 = v30 != 0;
      v81 = 1024;
      v82 = v36;
      v83 = 1024;
      v84 = v9;
      _os_log_impl(&dword_1B8E1E000, v41, OS_LOG_TYPE_DEFAULT, "Should show HH2 migration banner?: %{BOOL}d | hf_canUpdateToHH2=%{BOOL}d | hasHomePodsUpdating=%{BOOL}d | hasDismissedBanner=%{BOOL}d | allHomePodsSupportHH2=%{BOOL}d", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40 ^ 1u);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v64;
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0D30D70]);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v64);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v61;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "homeManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v49 = objc_claimAutoreleasedReturnValue();
    v45 = v64;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "home");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "hf_currentUserIsOwner");
      v52 = objc_msgSend(v47, "isHH2MigrationAvailable");
      v53 = objc_msgSend(v47, "hasOptedToHH2");
      *(_DWORD *)buf = 67109632;
      v76 = v51;
      v77 = 1024;
      v78 = v52;
      v79 = 1024;
      v80 = v53;
      _os_log_impl(&dword_1B8E1E000, v49, OS_LOG_TYPE_DEFAULT, "Should show HH2 migration banner?:NO Owner:%{BOOL}d migrationAvailable:%{BOOL}d userAlreadyOptedIn:%{BOOL}d. Skipping user defaults and software update checks.", buf, 0x14u);

    }
    v54 = (void *)MEMORY[0x1E0D519C0];
    v55 = (void *)MEMORY[0x1E0D314B8];
    v85 = *MEMORY[0x1E0D30D70];
    v86 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "outcomeWithResults:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "futureWithResult:", v29);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v46;
}

uint64_t __60__HUHomeHubMigrationBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hf_userIsOwner:", v3);

  return v4;
}

- (NSSet)devices
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
