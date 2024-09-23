@implementation NTKCUpNextDataSourcesViewController

- (NTKCUpNextDataSourcesViewController)init
{
  NTKCUpNextDataSourcesViewController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  unsigned int v5;
  NTKCUpNextDataSourcesManager *v6;
  NTKCUpNextDataSourcesManager *dataSourcesManager;
  _QWORD v9[3];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCUpNextDataSourcesViewController;
  v2 = -[NTKCUpNextDataSourcesViewController init](&v10, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_disabledDataSourcesDidChange, CFSTR("com.apple.NanoTimeKit.NPS.NTKSiriDefaultsDisabledDataSourcesDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "nrDeviceVersion");

    v9[0] = HIWORD(v5);
    v9[1] = BYTE1(v5);
    v9[2] = v5;
    v6 = -[NTKCUpNextDataSourcesManager initWatchVersion:]([NTKCUpNextDataSourcesManager alloc], "initWatchVersion:", v9);
    dataSourcesManager = v2->_dataSourcesManager;
    v2->_dataSourcesManager = v6;

    -[NTKCUpNextDataSourcesManager setFirstPartyIdentifiersDelegate:](v2->_dataSourcesManager, "setFirstPartyIdentifiersDelegate:", v2);
    -[NTKCUpNextDataSourcesManager setSportsIdentifiersDelegate:](v2->_dataSourcesManager, "setSportsIdentifiersDelegate:", v2);
    -[NTKCUpNextDataSourcesManager setThirdPartyIdentifiersDelegate:](v2->_dataSourcesManager, "setThirdPartyIdentifiersDelegate:", v2);
    -[NTKCUpNextDataSourcesManager fetchIdentifiers](v2->_dataSourcesManager, "fetchIdentifiers");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKCUpNextDataSourcesViewController;
  -[NTKCUpNextDataSourcesViewController dealloc](&v4, sel_dealloc);
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  _BOOL4 v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v76;
  void *v77;
  void *v78;
  NTKCUpNextDataSourcesViewController *val;
  _QWORD v80[4];
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id location;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;
  NSRange v103;

  v102 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v76 = (int)*MEMORY[0x1E0D80590];
    val = self;
    +[NTKRelevanceEngineCache sharedCache](NTKRelevanceEngineCache, "sharedCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalRelevanceEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSourceCatalog");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, val);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCUpNextDataSourcesManager firstPartyDataSourceEntries](val->_dataSourcesManager, "firstPartyDataSourceEntries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v9 = (void *)MEMORY[0x1E0D804E8];
      NTKCCustomizationLocalizedString(CFSTR("DATA_SOURCES_TITLE"), (uint64_t)CFSTR("sources of data that are fed into the new Up Next clock face"), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "groupSpecifierWithID:name:", CFSTR("FirstPartySources"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "addObject:", v11);

    }
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    -[NTKCUpNextDataSourcesManager firstPartyDataSourceEntries](val->_dataSourcesManager, "firstPartyDataSourceEntries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v95 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1E0D804E8];
          objc_msgSend(v16, "localizedName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, val, sel__setDataSourceEnabled_withSpecifier_, sel__dataSourceEnabled_, 0, 6, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "setProperty:forKey:", v16, CFSTR("NTKSiriSettingsSpecifierDataSource"));
          objc_msgSend(v16, "identifiers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "anyObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v91[0] = MEMORY[0x1E0C809B0];
          v91[1] = 3221225472;
          v91[2] = __49__NTKCUpNextDataSourcesViewController_specifiers__block_invoke;
          v91[3] = &unk_1E6BD5BF8;
          objc_copyWeak(&v93, &location);
          v22 = v19;
          v92 = v22;
          objc_msgSend(v77, "imageForDataSourceWithIdentifier:completion:", v21, v91);

          objc_msgSend(v78, "addObject:", v22);
          objc_destroyWeak(&v93);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
      }
      while (v13);
    }

    -[NTKCUpNextDataSourcesManager sportsDataSourceEntries](val->_dataSourcesManager, "sportsDataSourceEntries");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v26 = (void *)MEMORY[0x1E0D804E8];
      NTKCCustomizationLocalizedString(CFSTR("SPORTS_DATA_SOURCE_TITLE"), (uint64_t)CFSTR("Favorite sports teams that show up Up Next clock face"), v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "groupSpecifierWithID:name:", CFSTR("SportsPartySources"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      NTKCCustomizationLocalizedString(CFSTR("SPORTS_HELPER_TEXT"), (uint64_t)CFSTR("You can select your favorite teams in the TV app."), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "mutableCopy");

      objc_msgSend(v31, "appendString:", CFSTR(" "));
      NTKCCustomizationLocalizedString(CFSTR("SPORTS_OPEN_TITLE"), (uint64_t)CFSTR("Open TV app"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "appendString:", v33);
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setProperty:forKey:", v35, *MEMORY[0x1E0D80818]);

      objc_msgSend(v28, "setProperty:forKey:", v31, *MEMORY[0x1E0D80838]);
      v103.location = objc_msgSend(v31, "rangeOfString:", v33);
      NSStringFromRange(v103);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setProperty:forKey:", v36, *MEMORY[0x1E0D80828]);

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("com.apple.tv://tv.apple.com/sportsfavorites"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setProperty:forKey:", v37, *MEMORY[0x1E0D80840]);

      objc_msgSend(v78, "addObject:", v28);
    }
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    -[NTKCUpNextDataSourcesManager sportsDataSourceEntries](val->_dataSourcesManager, "sportsDataSourceEntries");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v88 != v40)
            objc_enumerationMutation(v38);
          v42 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
          v43 = (void *)MEMORY[0x1E0D804E8];
          objc_msgSend(v42, "localizedName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v44, val, sel__setDataSourceEnabled_withSpecifier_, sel__dataSourceEnabled_, 0, 6, 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "setProperty:forKey:", v42, CFSTR("NTKSiriSettingsSpecifierDataSource"));
          objc_msgSend(v78, "addObject:", v45);

        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
      }
      while (v39);
    }

    -[NTKCUpNextDataSourcesManager thirdPartyDataSourceEntries](val->_dataSourcesManager, "thirdPartyDataSourceEntries");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

    if (v47)
    {
      v49 = (void *)MEMORY[0x1E0D804E8];
      NTKCCustomizationLocalizedString(CFSTR("OTHER_DATA_SOURCES_TITLE"), (uint64_t)CFSTR("additional data that is fed into the new Up Next clock face"), v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "groupSpecifierWithID:name:", CFSTR("ThirdPartySources"), v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "addObject:", v51);

    }
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    -[NTKCUpNextDataSourcesManager thirdPartyDataSourceEntries](val->_dataSourcesManager, "thirdPartyDataSourceEntries");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v84;
      do
      {
        for (k = 0; k != v53; ++k)
        {
          if (*(_QWORD *)v84 != v54)
            objc_enumerationMutation(v52);
          v56 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
          v57 = (void *)MEMORY[0x1E0D804E8];
          objc_msgSend(v56, "localizedName");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v58, val, sel__setDataSourceEnabled_withSpecifier_, sel__dataSourceEnabled_, 0, 6, 0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v59, "setProperty:forKey:", v56, CFSTR("NTKSiriSettingsSpecifierDataSource"));
          objc_msgSend(v56, "identifiers");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "anyObject");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = __49__NTKCUpNextDataSourcesViewController_specifiers__block_invoke_2;
          v80[3] = &unk_1E6BD5BF8;
          objc_copyWeak(&v82, &location);
          v62 = v59;
          v81 = v62;
          objc_msgSend(v77, "imageForApplicationWithIdentifier:completion:", v61, v80);

          objc_msgSend(v78, "addObject:", v62);
          objc_destroyWeak(&v82);

        }
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
      }
      while (v53);
    }

    -[NTKCUpNextDataSourcesManager firstPartyDataSourceEntries](val->_dataSourcesManager, "firstPartyDataSourceEntries");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "count");
    -[NTKCUpNextDataSourcesManager sportsDataSourceEntries](val->_dataSourcesManager, "sportsDataSourceEntries");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "count");
    -[NTKCUpNextDataSourcesManager thirdPartyDataSourceEntries](val->_dataSourcesManager, "thirdPartyDataSourceEntries");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v66 + v64 + objc_msgSend(v67, "count") == 0;

    if (v68)
    {
      v70 = (void *)MEMORY[0x1E0D804E8];
      NTKCCustomizationLocalizedString(CFSTR("LOADING_DATA_SOURCES_TITLE"), (uint64_t)CFSTR("Shown when the list of sources is still loading and as yet, unavailable"), v69);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v71, val, 0, 0, 0, 15, 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "addObject:", v72);

    }
    v73 = objc_msgSend(v78, "copy");
    v74 = *(Class *)((char *)&val->super.super.super.super.super.isa + v76);
    *(Class *)((char *)&val->super.super.super.super.super.isa + v76) = (Class)v73;

    objc_destroyWeak(&location);
    v3 = *(Class *)((char *)&val->super.super.super.super.super.isa + v76);
  }
  return v3;
}

void __49__NTKCUpNextDataSourcesViewController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_setAndResizeIconImage:forSpecifier:", v4, *(_QWORD *)(a1 + 32));

}

void __49__NTKCUpNextDataSourcesViewController_specifiers__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_setAndResizeIconImage:forSpecifier:", v4, *(_QWORD *)(a1 + 32));

}

- (void)manager:(id)a3 didUpdateDataSourceEntries:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[Settings] Data source manager did update", v6, 2u);
  }

  -[NTKCUpNextDataSourcesViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)_disabledDataSourcesDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "[Settings] Settings did change. Reloading.", v4, 2u);
  }

  -[NTKCUpNextDataSourcesViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)_setDataSourceEnabled:(id)a3 withSpecifier:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("NTKSiriSettingsSpecifierDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend(v5, "BOOLValue"))
      v8 = CFSTR("Enabling");
    else
      v8 = CFSTR("Disabling");
    objc_msgSend(v6, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "[Settings] %@ data source %@", (uint8_t *)&v16, 0x16u);

  }
  +[NTKSiriDefaults sharedInstance](NTKSiriDefaults, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disabledDataSources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  LODWORD(v11) = objc_msgSend(v5, "BOOLValue");
  objc_msgSend(v6, "identifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v11)
    objc_msgSend(v12, "minusSet:", v13);
  else
    objc_msgSend(v12, "unionSet:", v13);

  +[NTKSiriDefaults sharedInstance](NTKSiriDefaults, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v14, "setDisabledDataSources:", v15);

}

- (id)_dataSourceEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "propertyForKey:", CFSTR("NTKSiriSettingsSpecifierDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  +[NTKSiriDefaults sharedInstance](NTKSiriDefaults, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disabledDataSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intersectsSet:", v7) ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setAndResizeIconImage:(id)a3 forSpecifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  double v26;

  v6 = a4;
  objc_msgSend(a3, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v8 = MEMORY[0x1E0C809B0];
  if (v9 > 29.0 || (objc_msgSend(v7, "size"), v10 > 29.0))
  {
    objc_msgSend(v7, "size");
    v12 = v11;
    objc_msgSend(v7, "size");
    v14 = v13;
    objc_msgSend(v7, "size");
    if (v12 <= v14)
      v15 = v16;
    v17 = 29.0 / v15;
    v18 = objc_alloc(MEMORY[0x1E0DC3828]);
    objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithSize:format:", v19, 29.0, 29.0);

    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __75__NTKCUpNextDataSourcesViewController__setAndResizeIconImage_forSpecifier___block_invoke;
    v24[3] = &unk_1E6BD5C20;
    v25 = v7;
    v26 = v17;
    objc_msgSend(v20, "imageWithActions:", v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x1E0D80870]);
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __75__NTKCUpNextDataSourcesViewController__setAndResizeIconImage_forSpecifier___block_invoke_2;
  v22[3] = &unk_1E6BCD778;
  v22[4] = self;
  v23 = v6;
  v21 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v22);

}

uint64_t __75__NTKCUpNextDataSourcesViewController__setAndResizeIconImage_forSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(double *)(a1 + 40);
  objc_msgSend(v2, "size");
  v5 = v3 * v4;
  v6 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "size");
  return objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v5, v6 * v7);
}

uint64_t __75__NTKCUpNextDataSourcesViewController__setAndResizeIconImage_forSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourcesManager, 0);
}

@end
