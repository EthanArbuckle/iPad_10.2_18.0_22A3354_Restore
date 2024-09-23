@implementation ATXNPlusOneStudyUploader

- (void)uploadStudyDataToCoreAnalyticsWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ATXNPlusOneStudyUploader *v9;

  v4 = a3;
  dispatch_get_global_queue(9, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__ATXNPlusOneStudyUploader_uploadStudyDataToCoreAnalyticsWithActivity___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __71__ATXNPlusOneStudyUploader_uploadStudyDataToCoreAnalyticsWithActivity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXNPlusOneStudyUploader: Start to prepare N+1 study data.", (uint8_t *)&v7, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "didDefer") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") && (objc_msgSend(*(id *)(a1 + 32), "didDefer") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_preparedEventsFromEmptyEvents:activity:", v3, *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "count") && (objc_msgSend(*(id *)(a1 + 32), "didDefer") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "_applyPrivacyFilterToEvents:", v4);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v3, "count") && (objc_msgSend(*(id *)(a1 + 32), "didDefer") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "_sendEventsToCoreAnalytics:", v3);
          __atxlog_handle_home_screen();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            v6 = objc_msgSend(v3, "count");
            v7 = 134217984;
            v8 = v6;
            _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXNPlusOneStudyUploader: Sent %lu events to CoreAnalytics.", (uint8_t *)&v7, 0xCu);
          }

        }
      }
      else
      {
        v3 = v4;
      }
    }

  }
}

- (void)dryRunResultFilterByExtensionBundleId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(9, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke;
  block[3] = &unk_1E82DF8F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  const __CFString *v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v11, "extensionBundleId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 40));

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = (void *)v3;
  }
  objc_msgSend(*(id *)(a1 + 32), "_preparedEventsFromEmptyEvents:activity:", v5, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_applyPrivacyFilterToEvents:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v22, "coreAnalyticsEvent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v23, "mutableCopy");

        v25 = objc_msgSend(v22, "appScreenTimeCategory") - 1;
        v26 = CFSTR("Unknown");
        if (v25 <= 0xE)
          v26 = off_1E82E45E8[v25];
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("appScreenTimeCategory"));
        objc_msgSend(v16, "addObject:", v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v19);
  }

  __atxlog_handle_home_screen();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke_cold_1(v17);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)_emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "fetchHomeScreenWidgetDescriptorMetadataWithError:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  if (v6)
  {
    __atxlog_handle_home_screen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXNPlusOneStudyUploader _emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:].cold.2();
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__ATXNPlusOneStudyUploader__emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity___block_invoke;
    v14[3] = &unk_1E82E4500;
    v15 = v3;
    v10 = v9;
    v16 = v10;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ATXNPlusOneStudyUploader _emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:].cold.1(v10);

    v12 = v16;
    v7 = v10;

    v8 = v7;
  }

  return v8;
}

void __84__ATXNPlusOneStudyUploader__emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;

  v7 = a2;
  v8 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "didDefer"))
  {
    *a4 = 1;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v7, "extensionBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExtensionBundleId:", v10);

    objc_msgSend(v7, "kind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWidgetKind:", v11);

    objc_msgSend(v8, "containerBundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      objc_msgSend(v8, "containerBundleId");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAppBundleId:", v14);
    }
    else
    {
      __atxlog_handle_home_screen();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __84__ATXNPlusOneStudyUploader__emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity___block_invoke_cold_1(v9);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }

}

- (void)_sendEventsToCoreAnalytics:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ATXNPlusOneStudyUploader _sendEventsToCoreAnalytics:].cold.1();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "coreAnalyticsEvent", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)_preparedEventsFromEmptyEvents:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  NSObject *v12;

  v6 = a4;
  -[ATXNPlusOneStudyUploader _preparedEvents_widgetExistsOnScreen:activity:](self, "_preparedEvents_widgetExistsOnScreen:activity:", a3, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count") || (objc_msgSend(v6, "didDefer") & 1) != 0)
    goto LABEL_3;
  -[ATXNPlusOneStudyUploader _preparedEvents_appPushNotificationEnabled:activity:](self, "_preparedEvents_appPushNotificationEnabled:activity:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count") || (objc_msgSend(v6, "didDefer") & 1) != 0)
  {
LABEL_6:
    v8 = 0;
    v7 = v9;
    goto LABEL_7;
  }
  -[ATXNPlusOneStudyUploader _preparedEvents_appLaunchPopularity:activity:](self, "_preparedEvents_appLaunchPopularity:activity:", v9, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "count") || (objc_msgSend(v6, "didDefer") & 1) != 0)
    goto LABEL_3;
  -[ATXNPlusOneStudyUploader _preparedEvents_appScreenTimeCategory:activity:](self, "_preparedEvents_appScreenTimeCategory:activity:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count") || (objc_msgSend(v6, "didDefer") & 1) != 0)
    goto LABEL_6;
  -[ATXNPlusOneStudyUploader _preparedEvents_numAppLaunches:activity:](self, "_preparedEvents_numAppLaunches:activity:", v9, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "count") || (objc_msgSend(v6, "didDefer") & 1) != 0)
  {
LABEL_3:
    v8 = 0;
    goto LABEL_7;
  }
  -[ATXNPlusOneStudyUploader _preparedEvents_suggestionCounts:activity:](self, "_preparedEvents_suggestionCounts:activity:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_home_screen();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ATXNPlusOneStudyUploader _preparedEventsFromEmptyEvents:activity:].cold.1();

  v7 = v11;
  v8 = v7;
LABEL_7:

  return v8;
}

- (id)_preparedEvents_widgetExistsOnScreen:(id)a3 activity:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v46 = a4;
  __atxlog_handle_home_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXNPlusOneStudyUploader _preparedEvents_widgetExistsOnScreen:activity:].cold.2();

  v67 = 0;
  v41 = (void *)objc_opt_new();
  objc_msgSend(v41, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v67);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v67;
  v42 = v8;
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  v40 = v7;
  if (v9)
  {
    v39 = v5;
    v10 = objc_opt_new();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v7;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    if (v45)
    {
      v44 = *(_QWORD *)v64;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v64 != v44)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v12);
          if (objc_msgSend(v46, "didDefer", v39, v40))
          {
            v5 = v39;
            v11 = v39;

            goto LABEL_43;
          }
          v47 = v12;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          objc_msgSend(v13, "stacks");
          v48 = (id)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
          if (v50)
          {
            v49 = *(_QWORD *)v60;
            do
            {
              for (i = 0; i != v50; ++i)
              {
                if (*(_QWORD *)v60 != v49)
                  objc_enumerationMutation(v48);
                v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                v55 = 0u;
                v56 = 0u;
                v57 = 0u;
                v58 = 0u;
                objc_msgSend(v15, "widgets");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v56;
                  do
                  {
                    for (j = 0; j != v18; ++j)
                    {
                      if (*(_QWORD *)v56 != v19)
                        objc_enumerationMutation(v16);
                      v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
                      objc_msgSend(v21, "extensionBundleId");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v22);
                      v23 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v23)
                      {
                        v24 = (void *)objc_opt_new();
                        objc_msgSend(v21, "extensionBundleId");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v24, v25);

                      }
                      objc_msgSend(v21, "extensionBundleId");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v26);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "widgetKind");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "addObject:", v28);

                    }
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
                  }
                  while (v18);
                }

              }
              v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
            }
            while (v50);
          }

          v12 = v47 + 1;
        }
        while (v47 + 1 != v45);
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
        if (v45)
          continue;
        break;
      }
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v29 = v39;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v52 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
          objc_msgSend(v34, "extensionBundleId", v39);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "widgetKind");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setWidgetExistsOnScreen:", objc_msgSend(v36, "containsObject:", v37));

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
      }
      while (v31);
    }

    v11 = v29;
    v5 = v39;
  }
  else
  {
    __atxlog_handle_home_screen();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXNPlusOneStudyUploader _preparedEvents_widgetExistsOnScreen:activity:].cold.1();
    v11 = 0;
  }
LABEL_43:

  return v11;
}

- (id)_preparedEvents_appPushNotificationEnabled:(id)a3 activity:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  id v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  __atxlog_handle_home_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ATXNPlusOneStudyUploader _preparedEvents_appPushNotificationEnabled:activity:].cold.1();

  objc_msgSend(MEMORY[0x1E0DC60B0], "currentNotificationSettingsCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
LABEL_5:
    v13 = 0;
    v27 = v11;
    while (1)
    {
      if (*(_QWORD *)v29 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
      if ((objc_msgSend(v6, "didDefer") & 1) != 0)
        break;
      objc_msgSend(v14, "appBundleId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v14, "appBundleId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "notificationSourceWithIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v17, "isHiddenFromSettings") & 1) != 0)
          goto LABEL_12;
        objc_msgSend(v17, "sourceSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "notificationSettings");
        v19 = v9;
        v20 = v8;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v12;
        v23 = objc_msgSend(v21, "authorizationStatus");

        v8 = v20;
        v9 = v19;

        v24 = v23 == 1;
        v12 = v22;
        v11 = v27;
        if (!v24)
LABEL_12:
          objc_msgSend(v14, "setAppPushNotificationEnabled:", 1);

      }
      else
      {
        objc_msgSend(v14, "setAppPushNotificationEnabled:", 1);
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v11)
          goto LABEL_5;
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:

    v25 = v9;
  }

  return v9;
}

- (id)_preparedEvents_appLaunchPopularity:(id)a3 activity:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  __atxlog_handle_home_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ATXNPlusOneStudyUploader _preparedEvents_appLaunchPopularity:activity:].cold.1();

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "histogramForLaunchType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
LABEL_5:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
      if ((objc_msgSend(v6, "didDefer", (_QWORD)v20) & 1) != 0)
        break;
      objc_msgSend(v15, "appBundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v15, "appBundleId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "overallLaunchPopularityForBundleId:", v17);
        objc_msgSend(v15, "setAppLaunchPopularity:");

      }
      else
      {
        objc_msgSend(v15, "setAppLaunchPopularity:", 1.0);
      }
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          goto LABEL_5;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:

    v18 = v10;
  }

  return v10;
}

- (id)_preparedEvents_appScreenTimeCategory:(id)a3 activity:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, _BYTE *);
  void *v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  __atxlog_handle_home_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ATXNPlusOneStudyUploader _preparedEvents_appScreenTimeCategory:activity:].cold.1();

  v8 = (void *)objc_opt_new();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke;
  v15 = &unk_1E82E4550;
  v16 = v6;
  v17 = v8;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v12);
  objc_msgSend(v5, "removeObjectsAtIndexes:", v9, v12, v13, v14, v15);

  return v5;
}

void __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  dispatch_semaphore_t v25;
  uint64_t v26;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "didDefer"))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v7, "appBundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x1CAA48B6C]();
      v10 = dispatch_semaphore_create(0);
      v11 = (void *)MEMORY[0x1E0D0D518];
      objc_msgSend(v7, "appBundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_2;
      v22[3] = &unk_1E82E4528;
      v14 = v7;
      v23 = v14;
      v15 = *(id *)(a1 + 40);
      v25 = v10;
      v26 = a3;
      v24 = v15;
      v16 = v10;
      objc_msgSend(v11, "categoryForBundleID:withCompletionHandler:", v12, v22);

      v17 = (void *)MEMORY[0x1E0D81598];
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_180;
      v18[3] = &unk_1E82DEAD0;
      v19 = v14;
      v20 = *(id *)(a1 + 40);
      v21 = a3;
      objc_msgSend(v17, "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v16, 0, v18, 5.0);

      objc_autoreleasePoolPop(v9);
    }
    else
    {
      objc_msgSend(v7, "setAppScreenTimeCategory:", 0);
    }
  }

}

void __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_home_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_2_cold_1(a1);

    objc_msgSend(*(id *)(a1 + 40), "addIndex:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(a2, "identifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D4C8]) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D4B8]) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D4D8]) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D470]) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D4A8]) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D468]) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D458]) & 1) != 0)
    {
      v8 = 7;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D490]) & 1) != 0)
    {
      v8 = 8;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D460]) & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D498]) & 1) != 0)
    {
      v8 = 10;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D478]) & 1) != 0)
    {
      v8 = 11;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D480]) & 1) != 0)
    {
      v8 = 12;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D4F0]) & 1) != 0)
    {
      v8 = 13;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D4A0]) & 1) != 0)
    {
      v8 = 14;
    }
    else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D4E8]))
    {
      v8 = 15;
    }
    else
    {
      v8 = 0;
    }

    objc_msgSend(*(id *)(a1 + 32), "setAppScreenTimeCategory:", v8);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

uint64_t __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_180(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_180_cold_1(a1);

  return objc_msgSend(*(id *)(a1 + 40), "addIndex:", *(_QWORD *)(a1 + 48));
}

- (id)_preparedEvents_numAppLaunches:(id)a3 activity:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v41[4];
  id v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  __atxlog_handle_home_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ATXNPlusOneStudyUploader _preparedEvents_numAppLaunches:activity:].cold.1();

  v8 = (void *)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v13, "appBundleId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (v15)
        {
          v21 = (void *)objc_opt_new();
          objc_msgSend(v13, "setAppLaunchCounts:", v21);
        }
        else
        {
          objc_msgSend(v13, "appBundleId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
          {
            v19 = (void *)objc_opt_new();
            objc_msgSend(v13, "appBundleId");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, v20);

          }
          objc_msgSend(v13, "appBundleId");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setAppLaunchCounts:", v22);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v24 = v23;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v26 = v25;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v28 = v27;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v30 = v29;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v32 = v31;
  if (objc_msgSend(v6, "didDefer"))
  {
    v33 = v9;
  }
  else
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__55;
    v53 = __Block_byref_object_dispose__55;
    v54 = v9;
    BiomeLibrary();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "App");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "InFocus");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32 + -2419200.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "atx_publisherFromStartTime:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke;
    v48[3] = &unk_1E82DB658;
    v48[4] = &v49;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_185;
    v41[3] = &unk_1E82E4578;
    v42 = v6;
    v43 = v8;
    v44 = v30 + -1209600.0;
    v45 = v28 + -604800.0;
    v46 = v26 + -259200.0;
    v47 = v24 + -86400.0;
    v39 = (id)objc_msgSend(v38, "sinkWithCompletion:receiveInput:", v48, v41);

    v33 = (id)v50[5];
    _Block_object_dispose(&v49, 8);

  }
  return v33;
}

void __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    __atxlog_handle_home_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_cold_1(v3);

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_185(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "didDefer") & 1) == 0)
  {
    objc_msgSend(v3, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "eventBody");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "starting"))
      {
        v6 = *(void **)(a1 + 40);
        objc_msgSend(v5, "bundleID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = *(void **)(a1 + 40);
          objc_msgSend(v5, "bundleID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "setNumAppLaunchPast28Day:", objc_msgSend(v11, "numAppLaunchPast28Day") + 1);
          objc_msgSend(v5, "absoluteTimestamp");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSinceReferenceDate");
          v14 = v13;
          v15 = *(double *)(a1 + 48);

          if (v14 > v15)
            objc_msgSend(v11, "setNumAppLaunchPast14Day:", objc_msgSend(v11, "numAppLaunchPast14Day") + 1);
          objc_msgSend(v5, "absoluteTimestamp");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceReferenceDate");
          v18 = v17;
          v19 = *(double *)(a1 + 56);

          if (v18 > v19)
            objc_msgSend(v11, "setNumAppLaunchPast7Day:", objc_msgSend(v11, "numAppLaunchPast7Day") + 1);
          objc_msgSend(v5, "absoluteTimestamp");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeIntervalSinceReferenceDate");
          v22 = v21;
          v23 = *(double *)(a1 + 64);

          if (v22 > v23)
            objc_msgSend(v11, "setNumAppLaunchPast3Day:", objc_msgSend(v11, "numAppLaunchPast3Day") + 1);
          objc_msgSend(v5, "absoluteTimestamp");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "timeIntervalSinceReferenceDate");
          v26 = v25;
          v27 = *(double *)(a1 + 72);

          if (v26 > v27)
            objc_msgSend(v11, "setNumAppLaunchPastDay:", objc_msgSend(v11, "numAppLaunchPastDay") + 1);

        }
      }

    }
    else
    {
      __atxlog_handle_home_screen();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_185_cold_1(v3);

    }
  }

}

- (id)_preparedEvents_suggestionCounts:(id)a3 activity:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  NSObject *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  _QWORD aBlock[4];
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = a4;
  __atxlog_handle_home_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXNPlusOneStudyUploader _preparedEvents_suggestionCounts:activity:].cold.1();

  v7 = (void *)objc_opt_new();
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v83 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        objc_msgSend(v12, "extensionBundleId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "widgetKind");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v15);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__55;
  v56 = __Block_byref_object_dispose__55;
  v36 = v8;
  v57 = v36;
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke;
  aBlock[3] = &unk_1E82E45A0;
  v19 = v16;
  v46 = v19;
  v20 = v7;
  v47 = v20;
  v48 = &v52;
  v49 = &v70;
  v50 = &v74;
  v51 = &v78;
  v21 = _Block_copy(aBlock);
  v38[0] = v18;
  v38[1] = 3221225472;
  v38[2] = __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_190;
  v38[3] = &unk_1E82E45A0;
  v22 = v17;
  v39 = v22;
  v23 = v20;
  v40 = v23;
  v41 = &v52;
  v42 = &v58;
  v43 = &v62;
  v44 = &v66;
  v24 = _Block_copy(v38);
  if ((objc_msgSend(v37, "didDefer") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (!-[ATXNPlusOneStudyUploader _processClientModelUpdateStreamFromStartTime:shortcutSuggestionHandler:infoSuggestionHandler:activity:](self, "_processClientModelUpdateStreamFromStartTime:shortcutSuggestionHandler:infoSuggestionHandler:activity:", v21, v24, v37, v25 + -86400.0))
    {
      v27 = 0;
      goto LABEL_17;
    }
    __atxlog_handle_home_screen();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v29 = v79[3];
      v30 = v75[3];
      v31 = v71[3];
      v32 = v67[3];
      v33 = v63[3];
      v34 = v59[3];
      *(_DWORD *)buf = 134219264;
      v87 = v29;
      v88 = 2048;
      v89 = v30;
      v90 = 2048;
      v91 = v31;
      v92 = 2048;
      v93 = v32;
      v94 = 2048;
      v95 = v33;
      v96 = 2048;
      v97 = v34;
      _os_log_debug_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEBUG, "ATXNPlusOneStudyUploader: totalShortcutConversionCount %lu (high threshold) %lu (med threshold) %lu (low threshold), totalInfoHeuristicsCount %lu (high threshold) %lu (med threshold) %lu (low threshold).", buf, 0x3Eu);
    }

  }
  v27 = (id)v53[5];
LABEL_17:

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  return v27;
}

void __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;

  v3 = a2;
  objc_msgSend(v3, "scoreSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "suggestedConfidenceCategory");

  if (v5 >= 2)
  {
    objc_msgSend(v3, "executableSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "executableClassString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if (v10)
    {
      objc_msgSend(v3, "executableSpecification");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "executableObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v12) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
        objc_msgSend(v12, "intent");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          +[ATXIntentMetadataCache sharedInstance](ATXIntentMetadataCache, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "intent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEligibleForWidgetsForIntent:", v16);

          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "intent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "homeScreenDescriptorForIntent:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v20, "extensionBundleIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "kind");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "stringByAppendingString:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (v24)
              {
                objc_msgSend(v24, "setSuggestionCountShortcutConversionLow:", objc_msgSend(v24, "suggestionCountShortcutConversionLow") + 1);
                ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
                objc_msgSend(v3, "scoreSpecification");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "suggestedConfidenceCategory");

                if (v27 >= 3)
                {
                  objc_msgSend(v25, "setSuggestionCountShortcutConversionMed:", objc_msgSend(v25, "suggestionCountShortcutConversionMed") + 1);
                  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
                  objc_msgSend(v3, "scoreSpecification");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v28, "suggestedConfidenceCategory");

                  if (v29 == 4)
                  {
                    objc_msgSend(v25, "setSuggestionCountShortcutConversionHigh:", objc_msgSend(v25, "suggestionCountShortcutConversionHigh") + 1);
                    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
                  }
                }
              }
              else
              {
                __atxlog_handle_home_screen();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                  __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_cold_1();

                v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
                v32 = *(void **)(v31 + 40);
                *(_QWORD *)(v31 + 40) = 0;

              }
            }

          }
        }
      }

    }
  }

}

void __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_190(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
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
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;

  v3 = a2;
  objc_msgSend(v3, "scoreSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "suggestedConfidenceCategory");

  if (v5 >= 2)
  {
    objc_msgSend(v3, "executableSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "executableObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "suggestionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9);

    if ((v8 & 1) == 0)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v7, "suggestionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      objc_msgSend(v7, "widgetBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "widgetKind");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "setSuggestionCountInfoHeuristicLow:", objc_msgSend(v15, "suggestionCountInfoHeuristicLow") + 1);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        objc_msgSend(v3, "scoreSpecification");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "suggestedConfidenceCategory");

        if (v18 >= 3)
        {
          objc_msgSend(v16, "setSuggestionCountInfoHeuristicMed:", objc_msgSend(v16, "suggestionCountInfoHeuristicMed") + 1);
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          objc_msgSend(v3, "scoreSpecification");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "suggestedConfidenceCategory");

          if (v20 == 4)
          {
            objc_msgSend(v16, "setSuggestionCountInfoHeuristicHigh:", objc_msgSend(v16, "suggestionCountInfoHeuristicHigh") + 1);
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          }
        }
      }
      else
      {
        __atxlog_handle_home_screen();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_190_cold_1();

        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = 0;

      }
    }

  }
}

- (BOOL)_processClientModelUpdateStreamFromStartTime:(double)a3 shortcutSuggestionHandler:(id)a4 infoSuggestionHandler:(id)a5 activity:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  char v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  _QWORD v26[5];
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v27 = 0;
  v28[0] = &v27;
  v28[1] = 0x2020000000;
  v28[2] = 0;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "publisherFromStartTime:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke;
  v26[3] = &unk_1E82DB658;
  v26[4] = &v29;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_192;
  v21[3] = &unk_1E82E45C8;
  v14 = v11;
  v22 = v14;
  v15 = v9;
  v23 = v15;
  v25 = &v27;
  v16 = v10;
  v24 = v16;
  v17 = (id)objc_msgSend(v13, "sinkWithCompletion:receiveInput:", v26, v21);

  __atxlog_handle_home_screen();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[ATXNPlusOneStudyUploader _processClientModelUpdateStreamFromStartTime:shortcutSuggestionHandler:infoSuggestionHandler:activity:].cold.1((uint64_t)v28, v18);

  v19 = *((_BYTE *)v30 + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    __atxlog_handle_home_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_cold_1(v3);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

void __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_192(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "didDefer") & 1) == 0)
  {
    objc_msgSend(v3, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      __atxlog_handle_home_screen();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_192_cold_1(v3);
      goto LABEL_15;
    }
    objc_msgSend(v3, "eventBody");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D81198];
    -[NSObject clientModelId](v5, "clientModelId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "clientModelTypeFromClientModelId:", v7);

    if (v8 <= 0x12)
    {
      if (((1 << v8) & 0x88A) != 0)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        -[NSObject suggestions](v5, "suggestions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v9);
              v14 = (void *)MEMORY[0x1CAA48B6C]();
              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
              objc_autoreleasePoolPop(v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          }
          while (v11);
        }
      }
      else
      {
        if (v8 != 18)
          goto LABEL_15;
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        -[NSObject suggestions](v5, "suggestions", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v21 != v17)
                objc_enumerationMutation(v9);
              v19 = (void *)MEMORY[0x1CAA48B6C]();
              (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
              objc_autoreleasePoolPop(v19);
            }
            v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v16);
        }
      }

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
LABEL_15:

  }
}

- (id)_applyPrivacyFilterToEvents:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    v4 = v3;
  }
  else
  {
    v4 = (id)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "appBundleId", (_QWORD)v16);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(v10, "appLaunchCounts");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "numAppLaunchPast28Day");

            if (v14 < 5)
              continue;
          }
          objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  return v4;
}

void __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "ATXNPlusOneStudyUploader: Sent %lu events to atxtool.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

void __84__ATXNPlusOneStudyUploader_dryRunResultFilterByExtensionBundleId_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Start to prepare N+1 study data for dry run.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "ATXNPlusOneStudyUploader: There are %lu widgets eligible for N+1 on this device.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)_emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "ATXNPlusOneStudyUploader: Error fetching widget descriptors - %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __84__ATXNPlusOneStudyUploader__emptyEventsForAllWidgetDescriptorsOnDeviceWithActivity___block_invoke_cold_1(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "extensionBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "widgetKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "ATXNPlusOneStudyUploader: Unable to get App Bundle Id for extensionBundleId %@, kind %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_sendEventsToCoreAnalytics:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Sending events to CoreAnalytics...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_preparedEventsFromEmptyEvents:activity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Done populating fields of all events.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_preparedEvents_widgetExistsOnScreen:activity:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_FAULT, "ATXNPlusOneStudyUploader: Error loading Home Screen config - %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)_preparedEvents_widgetExistsOnScreen:activity:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Populating widgetExistsOnScreen for events...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_preparedEvents_appPushNotificationEnabled:activity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Populating appPushNotificationEnabled for events...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_preparedEvents_appLaunchPopularity:activity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Populating appLaunchPopularity for events...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_preparedEvents_appScreenTimeCategory:activity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Populating appScreenTimeCategory for events...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "appBundleId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "ATXNPlusOneStudyUploader: Error querying Screen Time Category ID for bundle ID %@ - %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __75__ATXNPlusOneStudyUploader__preparedEvents_appScreenTimeCategory_activity___block_invoke_180_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "appBundleId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXNPlusOneStudyUploader: Error querying Screen Time Category ID for bundle ID %@ - Query timed out", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_preparedEvents_numAppLaunches:activity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Populating numAppLaunches for events...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXNPlusOneStudyUploader: Biome AppLaunchStream query completion is not successful due to error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __68__ATXNPlusOneStudyUploader__preparedEvents_numAppLaunches_activity___block_invoke_185_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "error");
  OUTLINED_FUNCTION_0_10(&dword_1C9A3B000, v1, v2, "ATXNPlusOneStudyUploader: Found nil eventBody from Biome AppLaunchStream query (Biome event error code %d)", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_preparedEvents_suggestionCounts:activity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Populating suggestionCounts for events...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Shortcut conversion widget does not have corresponding event. This implies that ATXWidgetDescriptorCache must have returned inconsistent result.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __70__ATXNPlusOneStudyUploader__preparedEvents_suggestionCounts_activity___block_invoke_190_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "ATXNPlusOneStudyUploader: Info Heuristic widget does not have corresponding event. This implies that ATXWidgetDescriptorCache must have returned inconsistent result.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_processClientModelUpdateStreamFromStartTime:(uint64_t)a1 shortcutSuggestionHandler:(NSObject *)a2 infoSuggestionHandler:activity:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "ATXNPlusOneStudyUploader: Processed %lu relevant client model updates in the past 24 hrs.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXNPlusOneStudyUploader: Biome ClientModelStream query completion is not successful due to error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __130__ATXNPlusOneStudyUploader__processClientModelUpdateStreamFromStartTime_shortcutSuggestionHandler_infoSuggestionHandler_activity___block_invoke_192_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "error");
  OUTLINED_FUNCTION_0_10(&dword_1C9A3B000, v1, v2, "ATXNPlusOneStudyUploader: Found nil eventBody from Biome ClientModelStream query (Biome event error code %d)", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
