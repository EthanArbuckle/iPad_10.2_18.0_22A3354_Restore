@implementation NTKCUpNextDataSourcesManager

- (id)initWatchVersion:(id *)a3
{
  char *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  void *v18;
  void *v19;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NTKCUpNextDataSourcesManager;
  v4 = -[NTKCUpNextDataSourcesManager init](&v22, sel_init);
  if (v4)
  {
    +[NTKRelevanceEngineCache sharedCache](NTKRelevanceEngineCache, "sharedCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canonicalRelevanceEngine");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v6;

    v8 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v4 + 11) = a3->var2;
    *(_OWORD *)(v4 + 72) = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v9;

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v4 + 4);
    *((_QWORD *)v4 + 4) = v11;

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v13;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.upnext.datasources.fetcher", v15);
    v17 = (void *)*((_QWORD *)v4 + 8);
    *((_QWORD *)v4 + 8) = v16;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v4, sel__appsChangedNotification_, CFSTR("NTKSystemAppStateChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v4, sel__dataSourcesChangedNotification_, *MEMORY[0x1E0D843A8], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)_dataSourcesDidChange, CFSTR("com.apple.NanoTimeKit.NPS.NTKSiriDefaultsThirdPartyDataSourcesDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v4;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKCUpNextDataSourcesManager;
  -[NTKCUpNextDataSourcesManager dealloc](&v4, sel_dealloc);
}

- (void)_appsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKSystemAppStateChangedNotification will rebuild rows - %@", (uint8_t *)&v7, 0xCu);

  }
  -[NTKCUpNextDataSourcesManager fetchIdentifiers](self, "fetchIdentifiers");

}

- (void)_dataSourcesChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "REAvailableDataSourceIdentifiersDidChange will rebuild rows - %@", (uint8_t *)&v7, 0xCu);

  }
  -[NTKCUpNextDataSourcesManager fetchIdentifiers](self, "fetchIdentifiers");

}

- (id)_preGraceThirdPartyBundleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C944B0], "activeNRDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__NTKCUpNextDataSourcesManager__preGraceThirdPartyBundleIdentifiers__block_invoke;
    v11[3] = &unk_1E6BD0BE8;
    v6 = v4;
    v12 = v6;
    v13 = v3;
    v14 = v2;
    v7 = v3;
    objc_msgSend(v5, "enumerateBundlesOfType:block:", 1, v11);

    v8 = v14;
    v9 = v6;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __68__NTKCUpNextDataSourcesManager__preGraceThirdPartyBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id obj;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  objc_msgSend(v18, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "applicationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5820]);

  if ((v4 & 1) == 0)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v5 = (void *)getINAppInfoClass_softClass;
    v34 = getINAppInfoClass_softClass;
    if (!getINAppInfoClass_softClass)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __getINAppInfoClass_block_invoke;
      v30[3] = &unk_1E6BCF200;
      v30[4] = &v31;
      __getINAppInfoClass_block_invoke((uint64_t)v30);
      v5 = (void *)v32[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v31, 8);
    objc_msgSend(v6, "appInfoWithAppProxy:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "supportedActionsByExtensions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") == 0;

    if (v8)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v19, "counterpartIdentifiers");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v27;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11);
            v13 = dispatch_group_create();
            dispatch_group_enter(v13);
            v14 = *(void **)(a1 + 40);
            v15 = *(_QWORD *)(a1 + 48);
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __68__NTKCUpNextDataSourcesManager__preGraceThirdPartyBundleIdentifiers__block_invoke_2;
            v22[3] = &unk_1E6BD0BC0;
            v23 = *(id *)(a1 + 32);
            v24 = v21;
            v25 = v13;
            v16 = v13;
            objc_msgSend(v14, "fetchApplicationOnPairedDevice:withBundleID:completion:", v15, v12, v22);
            dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        }
        while (v9);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v21);
    }

  }
}

void __68__NTKCUpNextDataSourcesManager__preGraceThirdPartyBundleIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "intentsSupported");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userActivityTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") || objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (BOOL)_isNanoWeatherAppID:(id)a3
{
  return objc_msgSend(CFSTR("com.apple.weather.watchapp"), "isEqualToString:", a3);
}

- (id)_dedupeAndSortFirstPartyDataSourcesFromIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  NTKCUpNextDataSourcesManager *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id obj;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61 = self;
  -[RERelevanceEngine dataSourceCatalog](self->_relevanceEngine, "dataSourceCatalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v70 = v4;
  obj = (id)objc_msgSend(v4, "copy");
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v90;
    v62 = *(_QWORD *)v90;
    v63 = v5;
    do
    {
      v10 = 0;
      v64 = v8;
      do
      {
        if (*(_QWORD *)v90 != v9)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v89 + 1) + 8 * v10);
        RERemoteApplicationIdentifierForLocalApplication();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (void *)v12;
        else
          v14 = v11;
        v15 = v14;

        objc_msgSend(v5, "localizedNameForDataSourceWithIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v5, "applicationIdentifierForDataSourceWithIdentifier:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v68 = v17;
            objc_msgSend(v71, "objectForKeyedSubscript:", v16);
            v18 = objc_claimAutoreleasedReturnValue();
            v69 = v15;
            v66 = v10;
            v67 = v16;
            if (v18)
            {
              v19 = (void *)v18;
              v87 = 0u;
              v88 = 0u;
              v85 = 0u;
              v86 = 0u;
              v20 = v15;
              objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              RERemoteApplicationIdentifierForLocalApplication();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
                objc_msgSend(v21, "addObject:", v22);
              RELocalApplicationIdentifierForRemoteApplication();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
                objc_msgSend(v21, "addObject:", v23);
              v24 = (void *)objc_msgSend(v21, "copy");

              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v86;
                do
                {
                  for (i = 0; i != v26; ++i)
                  {
                    if (*(_QWORD *)v86 != v27)
                      objc_enumerationMutation(v24);
                    objc_msgSend(v19, "addObject:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i));
                  }
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
                }
                while (v26);
              }

            }
            else
            {
              v29 = v15;
              objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              RERemoteApplicationIdentifierForLocalApplication();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
                objc_msgSend(v30, "addObject:", v31);
              RELocalApplicationIdentifierForRemoteApplication();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32)
                objc_msgSend(v30, "addObject:", v32);
              v33 = (void *)objc_msgSend(v30, "copy");

              v19 = (void *)objc_msgSend(v33, "mutableCopy");
              if (!-[NTKCUpNextDataSourcesManager _isNanoWeatherAppID:](v61, "_isNanoWeatherAppID:", v68))
                objc_msgSend(v19, "addObject:", v68);
              objc_msgSend(v71, "setObject:forKeyedSubscript:", v19, v67);
            }
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v34 = v15;
            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            RERemoteApplicationIdentifierForLocalApplication();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
              objc_msgSend(v35, "addObject:", v36);
            RELocalApplicationIdentifierForRemoteApplication();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
              objc_msgSend(v35, "addObject:", v37);
            v38 = (void *)objc_msgSend(v35, "copy");

            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
            if (v39)
            {
              v40 = v39;
              v41 = *(_QWORD *)v82;
              do
              {
                for (j = 0; j != v40; ++j)
                {
                  if (*(_QWORD *)v82 != v41)
                    objc_enumerationMutation(v38);
                  v43 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
                  if ((objc_msgSend(v43, "isEqualToString:", v34) & 1) == 0)
                  {
                    objc_msgSend(v6, "objectForKeyedSubscript:", v43);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = v44;
                    if (v44)
                    {
                      if ((objc_msgSend(v44, "isEqualToString:", v34) & 1) == 0)
                      {
                        objc_msgSend(v70, "removeObject:", v43);
                        objc_msgSend(v71, "objectForKeyedSubscript:", v45);
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v46, "removeObject:", v43);

                      }
                    }
                    else
                    {
                      objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, v43);
                    }

                  }
                }
                v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
              }
              while (v40);
            }

            v9 = v62;
            v5 = v63;
            v8 = v64;
            v10 = v66;
            v16 = v67;
            v17 = v68;
            v15 = v69;
          }

        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
    }
    while (v8);
  }

  v80 = 0u;
  v78 = 0u;
  v79 = 0u;
  v77 = 0u;
  v47 = (void *)objc_msgSend(v70, "copy");
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v78;
    do
    {
      for (k = 0; k != v49; ++k)
      {
        if (*(_QWORD *)v78 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
        objc_msgSend(v5, "applicationIdentifierForDataSourceWithIdentifier:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53 && (objc_msgSend(v52, "isEqualToString:", v53) & 1) == 0)
        {
          objc_msgSend(v5, "localizedNameForDataSourceWithIdentifier:", v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v54 && !-[NTKCUpNextDataSourcesManager _isNanoWeatherAppID:](v61, "_isNanoWeatherAppID:", v53))
          {
            objc_msgSend(v71, "objectForKeyedSubscript:", v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v74[0] = MEMORY[0x1E0C809B0];
            v74[1] = 3221225472;
            v74[2] = __83__NTKCUpNextDataSourcesManager__dedupeAndSortFirstPartyDataSourcesFromIdentifiers___block_invoke;
            v74[3] = &unk_1E6BD0C18;
            v75 = v54;
            v76 = v55;
            v56 = v55;
            objc_msgSend(v71, "enumerateKeysAndObjectsUsingBlock:", v74);

          }
        }

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    }
    while (v49);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __83__NTKCUpNextDataSourcesManager__dedupeAndSortFirstPartyDataSourcesFromIdentifiers___block_invoke_2;
  v72[3] = &unk_1E6BD0C40;
  v73 = v57;
  v58 = v57;
  objc_msgSend(v71, "enumerateKeysAndObjectsUsingBlock:", v72);
  objc_msgSend(v58, "sortedArrayUsingComparator:", &__block_literal_global_40);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

void __83__NTKCUpNextDataSourcesManager__dedupeAndSortFirstPartyDataSourcesFromIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "minusOrderedSet:", v5);

}

void __83__NTKCUpNextDataSourcesManager__dedupeAndSortFirstPartyDataSourcesFromIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  NTKUpNextDataSourceEntry *v7;
  NTKUpNextDataSourceEntry *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = [NTKUpNextDataSourceEntry alloc];
  objc_msgSend(v5, "set");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[NTKUpNextDataSourceEntry initWithDataSourceIdentifiers:localizedName:isDonation:](v7, "initWithDataSourceIdentifiers:localizedName:isDonation:", v9, v6, 0);
  objc_msgSend(v4, "addObject:", v8);

}

uint64_t __83__NTKCUpNextDataSourcesManager__dedupeAndSortFirstPartyDataSourcesFromIdentifiers___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_firstPartyDataSourceEntries
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[RERelevanceEngine dataSourceCatalog](self->_relevanceEngine, "dataSourceCatalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6CA99E8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (NTKInternalBuild(v4, v5))
  {
    objc_msgSend(v4, "setByAddingObjectsFromArray:", &unk_1E6CA9A00);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v22 = 0;
  v23 = 0;
  v24 = 0;
  -[NTKCUpNextDataSourcesManager watchVersion](self, "watchVersion");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v3)
          objc_msgSend(v3, "minimumSupportedSystemVersionForDataSourceWithIdentifier:", v13);
        if (v22 >= 0 && (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.upnext.siri.sports")) & 1) == 0)
        {
          objc_msgSend(v3, "localizedNameForDataSourceWithIdentifier:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v3, "applicationIdentifierForDataSourceWithIdentifier:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
              objc_msgSend(v7, "addObject:", v13);
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v10);
  }

  -[NTKCUpNextDataSourcesManager _dedupeAndSortFirstPartyDataSourcesFromIdentifiers:](self, "_dedupeAndSortFirstPartyDataSourcesFromIdentifiers:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_phoneDedupedDataSourcesFromIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (objc_msgSend(v6, "count"))
    {
      -[RERelevanceEngine dataSourceCatalog](self->_relevanceEngine, "dataSourceCatalog");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(2, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__NTKCUpNextDataSourcesManager__phoneDedupedDataSourcesFromIdentifiers_completion___block_invoke;
      block[3] = &unk_1E6BCD820;
      v12 = v6;
      v13 = v8;
      v14 = v7;
      v10 = v8;
      dispatch_async(v9, block);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id))v7 + 2))(v7, v10);
    }

  }
}

void __83__NTKCUpNextDataSourcesManager__phoneDedupedDataSourcesFromIdentifiers_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * i);
        RERemoteApplicationIdentifierForLocalApplication();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (void *)v9;
        else
          v11 = v8;
        v12 = v11;

        objc_msgSend(*(id *)(a1 + 40), "localizedNameForApplicationWithIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v2, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKey:", v14, v13);
          }
          objc_msgSend(v14, "addObject:", v12);
          objc_msgSend(v14, "addObject:", v8);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v15 = *(_QWORD *)(a1 + 48);
  v16 = (void *)objc_msgSend(v2, "copy");
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

}

- (void)_phoneDedupeFromIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke;
  v9[3] = &unk_1E6BD0CF0;
  v10 = v6;
  v8 = v6;
  -[NTKCUpNextDataSourcesManager _phoneDedupedDataSourcesFromIdentifiers:completion:](self, "_phoneDedupedDataSourcesFromIdentifiers:completion:", v7, v9);

}

void __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke_2;
  v5[3] = &unk_1E6BD00B0;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke_3;
  v7[3] = &unk_1E6BD0CA8;
  v6 = v2;
  v8 = v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_119_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

}

void __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  NTKUpNextDataSourceEntry *v7;
  NTKUpNextDataSourceEntry *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = [NTKUpNextDataSourceEntry alloc];
  v9 = (id)objc_msgSend(v5, "copy");

  v8 = -[NTKUpNextDataSourceEntry initWithDataSourceIdentifiers:localizedName:isDonation:](v7, "initWithDataSourceIdentifiers:localizedName:isDonation:", v9, v6, 1);
  objc_msgSend(v4, "addObject:", v8);

}

uint64_t __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_fetchThirdPartyBundleIdentifiersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = a3;
  +[NTKSiriDefaults sharedInstance](NTKSiriDefaults, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "watchHasMigratedAvailableDataSources");

  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Watch has migrated available data sources. Using defaults.", v16, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKSiriDefaults sharedInstance](NTKSiriDefaults, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "watchThirdPartyDataSources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v12);

    +[NTKSiriDefaults sharedInstance](NTKSiriDefaults, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "phoneThirdPartyDataSources");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v15);

  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Watch has not migrated available data sources. Using legacy path.", buf, 2u);
    }

    -[NTKCUpNextDataSourcesManager _preGraceThirdPartyBundleIdentifiers](self, "_preGraceThirdPartyBundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NTKCUpNextDataSourcesManager _dedupeAndSortThirdPartyDataSourcesFromIdentifiers:completion:](self, "_dedupeAndSortThirdPartyDataSourcesFromIdentifiers:completion:", v9, v4);

}

- (void)_buildRows
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NTKCUpNextDataSourcesManager__buildRows__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __42__NTKCUpNextDataSourcesManager__buildRows__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__NTKCUpNextDataSourcesManager__buildRows__block_invoke_2;
  v3[3] = &unk_1E6BCD5F0;
  v3[4] = v1;
  return objc_msgSend(v1, "_prewarmRowBuildingWithCompletion:", v3);
}

uint64_t __42__NTKCUpNextDataSourcesManager__buildRows__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildRowsAfterPrewarming");
}

- (void)_prewarmRowBuildingWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  NTKCUpNextDataSourcesManager *v13;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[RERelevanceEngine dataSourceCatalog](self->_relevanceEngine, "dataSourceCatalog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  dispatch_get_global_queue(2, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NTKCUpNextDataSourcesManager__prewarmRowBuildingWithCompletion___block_invoke;
  block[3] = &unk_1E6BCDCB8;
  v11 = v6;
  v12 = v4;
  v13 = self;
  v8 = v4;
  v9 = v6;
  dispatch_async(v7, block);

}

void __66__NTKCUpNextDataSourcesManager__prewarmRowBuildingWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = (id)objc_msgSend(*(id *)(a1 + 40), "localizedNameForApplicationWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NTKCUpNextDataSourcesManager__prewarmRowBuildingWithCompletion___block_invoke_2;
  block[3] = &unk_1E6BCD5F0;
  block[4] = *(_QWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __66__NTKCUpNextDataSourcesManager__prewarmRowBuildingWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildRowsAfterPrewarming");
}

- (void)_buildRowsAfterPrewarming
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *fetchQueue;
  _QWORD block[5];
  _QWORD v9[8];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NTKCUpNextDataSourcesManager _firstPartyDataSourceEntries](self, "_firstPartyDataSourceEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCUpNextDataSourcesManager setFirstPartyDataSourceEntries:](self, "setFirstPartyDataSourceEntries:", v3);

  -[NTKCUpNextDataSourcesManager firstPartyIdentifiersDelegate](self, "firstPartyIdentifiersDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCUpNextDataSourcesManager firstPartyDataSourceEntries](self, "firstPartyDataSourceEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manager:didUpdateDataSourceEntries:", self, v5);

  -[NTKCUpNextDataSourcesManager watchVersion](self, "watchVersion");
  if (v9[5] >= 5)
  {
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke;
    v9[3] = &unk_1E6BCEC00;
    v9[4] = self;
    -[NTKCUpNextDataSourcesManager _fetchThirdPartyBundleIdentifiersWithCompletion:](self, "_fetchThirdPartyBundleIdentifiersWithCompletion:", v9);
    fetchQueue = self->_fetchQueue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_async(fetchQueue, block);
  }
}

void __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_2;
  v5[3] = &unk_1E6BCD778;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setThirdPartyDataSourceEntries:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "thirdPartyIdentifiersDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "thirdPartyDataSourceEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manager:didUpdateDataSourceEntries:", v2, v3);

}

void __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(id *);
  char v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];
  char v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  void *(*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!WatchListKitLibraryCore_frameworkLibrary)
  {
    v14 = xmmword_1E6BD0D28;
    v15 = 0;
    WatchListKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v2 = MEMORY[0x1E0C809B0];
  if (WatchListKitLibraryCore_frameworkLibrary)
  {
    v9 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v3 = (uint64_t (*)(id *))getWLKIsSportsEnabledSymbolLoc_ptr;
    v13 = getWLKIsSportsEnabledSymbolLoc_ptr;
    if (!getWLKIsSportsEnabledSymbolLoc_ptr)
    {
      *(_QWORD *)&v14 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v14 + 1) = 3221225472;
      v15 = __getWLKIsSportsEnabledSymbolLoc_block_invoke;
      v16 = &unk_1E6BCF200;
      v17 = &v10;
      __getWLKIsSportsEnabledSymbolLoc_block_invoke((uint64_t)&v14);
      v3 = (uint64_t (*)(id *))v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v3)
    {
      __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3_cold_1();
      __break(1u);
    }
    v4 = v3(&v9);
    v5 = v9;
    if (v5)
    {
      _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3_cold_2((uint64_t)v5, v6);

    }
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_123;
  block[3] = &unk_1E6BCF930;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_123(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  NTKUpNextDataSourceEntry *v7;
  void *v8;
  NTKUpNextDataSourceEntry *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dataSourceCatalog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSourceIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.upnext.siri.sports"));

  if (*(_BYTE *)(a1 + 40))
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    objc_msgSend(v2, "localizedNameForDataSourceWithIdentifier:", CFSTR("com.apple.upnext.siri.sports"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [NTKUpNextDataSourceEntry alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.upnext.siri.sports"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NTKUpNextDataSourceEntry initWithDataSourceIdentifiers:localizedName:isDonation:](v7, "initWithDataSourceIdentifiers:localizedName:isDonation:", v8, v6, 0);

    v10 = *(void **)(a1 + 32);
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSportsDataSourceEntries:", v11);

    objc_msgSend(*(id *)(a1 + 32), "sportsIdentifiersDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "sportsDataSourceEntries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "manager:didUpdateDataSourceEntries:", v13, v14);

  }
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[3];
  return self;
}

- (NSArray)firstPartyDataSourceEntries
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFirstPartyDataSourceEntries:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)thirdPartyDataSourceEntries
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setThirdPartyDataSourceEntries:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)sportsDataSourceEntries
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSportsDataSourceEntries:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NTKCUpNextDataSourcesManagerIdentifiersDelegate)firstPartyIdentifiersDelegate
{
  return (NTKCUpNextDataSourcesManagerIdentifiersDelegate *)objc_loadWeakRetained((id *)&self->_firstPartyIdentifiersDelegate);
}

- (void)setFirstPartyIdentifiersDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_firstPartyIdentifiersDelegate, a3);
}

- (NTKCUpNextDataSourcesManagerIdentifiersDelegate)thirdPartyIdentifiersDelegate
{
  return (NTKCUpNextDataSourcesManagerIdentifiersDelegate *)objc_loadWeakRetained((id *)&self->_thirdPartyIdentifiersDelegate);
}

- (void)setThirdPartyIdentifiersDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_thirdPartyIdentifiersDelegate, a3);
}

- (NTKCUpNextDataSourcesManagerIdentifiersDelegate)sportsIdentifiersDelegate
{
  return (NTKCUpNextDataSourcesManagerIdentifiersDelegate *)objc_loadWeakRetained((id *)&self->_sportsIdentifiersDelegate);
}

- (void)setSportsIdentifiersDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sportsIdentifiersDelegate, a3);
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_destroyWeak((id *)&self->_sportsIdentifiersDelegate);
  objc_destroyWeak((id *)&self->_thirdPartyIdentifiersDelegate);
  objc_destroyWeak((id *)&self->_firstPartyIdentifiersDelegate);
  objc_storeStrong((id *)&self->_sportsDataSourceEntries, 0);
  objc_storeStrong((id *)&self->_thirdPartyDataSourceEntries, 0);
  objc_storeStrong((id *)&self->_firstPartyDataSourceEntries, 0);
  objc_storeStrong((id *)&self->_relevanceEngine, 0);
}

uint64_t __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3_cold_2(v0);
}

void __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Error checking sports: %@", (uint8_t *)&v2, 0xCu);
}

@end
