@implementation ATXSuggestedPagesModeAffinityWidgetDataSource

- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;

  v6 = +[ATXSuggestedPagesUtils modeForSuggestedPageType:](ATXSuggestedPagesUtils, "modeForSuggestedPageType:", a3, a4);
  v7 = (void *)MEMORY[0x1E0C99E60];
  allModesForTraining();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_opt_new();
    v13 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
    v14 = MEMORY[0x1E0C9AA60];
    if (v13)
    {
      -[ATXSuggestedPagesModeAffinityWidgetDataSource fetchWidgetsPassingThresholdForMode:forSize:](self, "fetchWidgetsPassingThresholdForMode:forSize:", v6, 2);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = v15;
      else
        v17 = v14;
      objc_msgSend(v12, "addObjectsFromArray:", v17);

    }
    -[ATXSuggestedPagesModeAffinityWidgetDataSource fetchWidgetsPassingThresholdForMode:forSize:](self, "fetchWidgetsPassingThresholdForMode:forSize:", v6, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = v18;
    else
      v20 = v14;
    objc_msgSend(v12, "addObjectsFromArray:", v20);

    -[ATXSuggestedPagesModeAffinityWidgetDataSource fetchWidgetsPassingThresholdForMode:forSize:](self, "fetchWidgetsPassingThresholdForMode:forSize:", v6, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = v21;
    else
      v23 = v14;
    objc_msgSend(v12, "addObjectsFromArray:", v23);

  }
  else
  {
    __atxlog_handle_modes();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ATXSuggestedPagesModeAffinityWidgetDataSource provideWidgetsForPageType:environment:].cold.1(a3, v24);

    v12 = 0;
  }

  return v12;
}

- (id)fetchWidgetsPassingThresholdForMode:(unint64_t)a3 forSize:(unint64_t)a4
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  __int128 v72;
  unint64_t v73;
  void *v74;
  id obj;
  void *v76;
  void *v77;
  ATXSuggestedPagesModeAffinityWidgetDataSource *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  uint64_t v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  -[ATXSuggestedPagesModeAffinityWidgetDataSource _fetchScoreThresholdForWidgetModeAffinityModel](self, "_fetchScoreThresholdForWidgetModeAffinityModel");
  v8 = v7;
  +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rankedWidgetsForMode:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __93__ATXSuggestedPagesModeAffinityWidgetDataSource_fetchWidgetsPassingThresholdForMode_forSize___block_invoke;
  v88[3] = &unk_1E82EAB58;
  v78 = self;
  v88[4] = self;
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v88);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v83 = (void *)objc_opt_new();
  v74 = (void *)objc_opt_new();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v10;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
  if (!v80)
    goto LABEL_38;
  v79 = *(_QWORD *)v85;
  *(_QWORD *)&v12 = 138412802;
  v72 = v12;
  v73 = a4;
  v76 = v11;
  while (2)
  {
    for (i = 0; i != v80; ++i)
    {
      if (*(_QWORD *)v85 != v79)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
      v15 = (void *)MEMORY[0x1CAA48B6C]();
      v16 = objc_msgSend(v11, "count");
      if (objc_msgSend(v83, "count") + v16 == 4)
      {
        objc_autoreleasePoolPop(v15);
        goto LABEL_38;
      }
      v17 = objc_alloc_init(MEMORY[0x1E0CF8EB0]);
      objc_msgSend(v14, "widget");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "kind");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWidgetKind:", v19);

      objc_msgSend(v14, "widget");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "extensionIdentity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "extensionBundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setExtensionBundleId:", v22);

      objc_msgSend(v14, "widget");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "extensionIdentity");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v24, "containerBundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAppBundleId:", v25);

      objc_msgSend(v17, "setSize:", a4);
      objc_msgSend(v14, "scoreMetadata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "score");
      objc_msgSend(v17, "setScore:");

      objc_msgSend(v17, "setPredictionSource:", CFSTR("Mode Entity"));
      objc_msgSend(v17, "setRequiresAppLaunch:", 1);
      -[ATXSuggestedPagesModeAffinityWidgetDataSource _widgetIdentifierWithoutIntentForWidget:](v78, "_widgetIdentifierWithoutIntentForWidget:", v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v24) = objc_msgSend(v81, "containsObject:", v27);

      if ((v24 & 1) != 0)
      {
        objc_msgSend(v14, "scoreMetadata");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "featureVector");
        v29 = objc_claimAutoreleasedReturnValue();

        -[NSObject objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("correlationEntitySpecificFeatures"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("parentAppGlobalPrior"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("correlationNumLocalOccurrences"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("correlationEntitySpecificFeatures"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("widgetGlobalPrior"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "widget");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "extensionIdentity");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "containerBundleIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v83, "objectForKeyedSubscript:", v35);
          v36 = objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            v37 = (void *)v36;
            objc_msgSend(v82, "doubleValue");
            v39 = v38;
            objc_msgSend(v74, "objectForKeyedSubscript:", v35);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "doubleValue");
            v42 = v41;

            if (v39 > v42)
            {
              __atxlog_handle_modes();
              v43 = objc_claimAutoreleasedReturnValue();
              v11 = v76;
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v90 = v35;
                _os_log_impl(&dword_1C9A3B000, v43, OS_LOG_TYPE_INFO, "ATXSuggestedPagesModeAffinityWidgetDataSource: replacing widget prediction since this widget from the app (%@) has higher global popularity", buf, 0xCu);
              }

              objc_msgSend(v74, "setObject:forKeyedSubscript:", v82, v35);
              objc_msgSend(v83, "objectForKeyedSubscript:", v35);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "score");
              objc_msgSend(v17, "setScore:");

              objc_msgSend(v83, "objectForKeyedSubscript:", v35);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "predictionSource");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setPredictionSource:", v46);

              objc_msgSend(v83, "setObject:forKeyedSubscript:", v17, v35);
              a4 = v73;
              v47 = v77;
              goto LABEL_33;
            }
          }
        }
        objc_msgSend(v31, "doubleValue", v72);
        v11 = v76;
        v47 = v77;
        if (v50 <= 8.0 || objc_msgSend(v77, "integerValue") < 1)
        {
          objc_msgSend(v31, "doubleValue");
          if (v56 <= 5.0 || (objc_msgSend(v82, "doubleValue"), v57 < 0.0005))
          {
            objc_msgSend(v14, "scoreMetadata");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "score");
            v60 = v59;

            a4 = v73;
            if (v60 <= v8)
            {
LABEL_33:

              goto LABEL_34;
            }
            __atxlog_handle_modes();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v14, "identifier");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "scoreMetadata");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "score");
              *(_DWORD *)buf = 138412546;
              v90 = v62;
              v91 = 2048;
              v92 = v64;
              _os_log_impl(&dword_1C9A3B000, v61, OS_LOG_TYPE_INFO, "ATXSuggestedPagesModeAffinityWidgetDataSource: %@ passes widget mode affinity threshold with score: %f", buf, 0x16u);

              a4 = v73;
            }

            if (v35)
              goto LABEL_32;
LABEL_27:
            v11 = v76;
            objc_msgSend(v76, "addObject:", v17);
            goto LABEL_33;
          }
          __atxlog_handle_modes();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v14, "identifier");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "doubleValue");
            v68 = v67;
            objc_msgSend(v31, "doubleValue");
            *(_DWORD *)buf = v72;
            v90 = v66;
            v91 = 2048;
            v92 = v68;
            v93 = 2048;
            v94 = v69;
            _os_log_impl(&dword_1C9A3B000, v65, OS_LOG_TYPE_INFO, "ATXSuggestedPagesModeAffinityWidgetDataSource: %@ has widget popularity: %f and passes parent app global prior threshold with score: %f", buf, 0x20u);

          }
          objc_msgSend(v31, "doubleValue");
          objc_msgSend(v17, "setScore:");
          v54 = v17;
          v55 = CFSTR("Widget Popularity");
        }
        else
        {
          __atxlog_handle_modes();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v14, "identifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "doubleValue");
            *(_DWORD *)buf = 138412546;
            v90 = v52;
            v91 = 2048;
            v92 = v53;
            _os_log_impl(&dword_1C9A3B000, v51, OS_LOG_TYPE_INFO, "ATXSuggestedPagesModeAffinityWidgetDataSource: %@ has local engagement and passes parent app global prior threshold with score: %f", buf, 0x16u);

          }
          objc_msgSend(v31, "doubleValue");
          objc_msgSend(v17, "setScore:");
          v54 = v17;
          v55 = CFSTR("Global Mode Entity");
        }
        objc_msgSend(v54, "setPredictionSource:", v55);
        a4 = v73;
        if (v35)
        {
LABEL_32:
          objc_msgSend(v74, "setObject:forKeyedSubscript:", v82, v35);
          objc_msgSend(v83, "setObject:forKeyedSubscript:", v17, v35);
          v11 = v76;
          goto LABEL_33;
        }
        goto LABEL_27;
      }
      __atxlog_handle_modes();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "identifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        CHSWidgetFamilyFromATXStackLayoutSize();
        NSStringFromWidgetFamily();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v90 = v48;
        v91 = 2114;
        v92 = v49;
        _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_INFO, "ATXSuggestedPagesModeAffinityWidgetDataSource: %{public}@ widget does not exist in the preferred size: %{public}@ for this suggested page type", buf, 0x16u);

      }
LABEL_34:

      objc_autoreleasePoolPop(v15);
    }
    v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
    if (v80)
      continue;
    break;
  }
LABEL_38:

  objc_msgSend(v83, "allValues");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v70);

  return v11;
}

id __93__ATXSuggestedPagesModeAffinityWidgetDataSource_fetchWidgetsPassingThresholdForMode_forSize___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_widgetIdentifierWithoutIntentForCHSWidget:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_fetchScoreThresholdForWidgetModeAffinityModel
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v4 = *MEMORY[0x1E0CF9420];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CF9420]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "doubleForKey:", v4);
    v7 = v6;
  }
  else
  {
    v7 = 0.3;
  }

  return v7;
}

- (id)_widgetIdentifierWithoutIntentForCHSWidget:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "family");

  NSStringFromWidgetFamily();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@:%@:%@:%@"), v7, v9, v10, v11);

  return v12;
}

- (id)_widgetIdentifierWithoutIntentForWidget:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "extensionBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");

  CHSWidgetFamilyFromATXStackLayoutSize();
  NSStringFromWidgetFamily();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@:%@:%@:%@"), v6, v7, v8, v9);

  return v10;
}

- (void)provideWidgetsForPageType:(uint64_t)a1 environment:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromATXSuggestedPageType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesModeAffinityWidgetDataSource: No mode affinity model found for suggested page type: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
