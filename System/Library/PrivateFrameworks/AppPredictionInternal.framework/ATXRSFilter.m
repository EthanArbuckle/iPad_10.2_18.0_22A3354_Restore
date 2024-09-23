@implementation ATXRSFilter

- (ATXRSFilter)init
{
  void *v3;
  ATXRSFilter *v4;

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXRSFilter initWithAppLaunchHistogramManager:](self, "initWithAppLaunchHistogramManager:", v3);

  return v4;
}

- (ATXRSFilter)initWithAppLaunchHistogramManager:(id)a3
{
  id v5;
  ATXRSFilter *v6;
  ATXRSFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXRSFilter;
  v6 = -[ATXRSFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appLaunchHistogramManager, a3);

  return v7;
}

- (id)filterCandidatesBySuggestionRequirements:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  Boolean keyExistsAndHasValidFormat[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v26 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v8 = (const __CFString *)*MEMORY[0x1E0CF9510];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "widgetDescriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "extensionBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v12;
        v14 = v13;
        v15 = v4;
        if (CFPreferencesGetAppBooleanValue(CFSTR("widgetKitDeveloperModeEnabled"), CFSTR("com.apple.duetexpertd"), 0))
        {
          keyExistsAndHasValidFormat[0] = 0;
          if (CFPreferencesGetAppBooleanValue(CFSTR("ATXWidgetKitDeveloperModeSkipEntitlementCheck"), v8, keyExistsAndHasValidFormat))
          {

          }
          else
          {
            v16 = objc_msgSend(MEMORY[0x1E0CF8CE0], "isDebuggingAllowedForExtensionBundleId:", v13);

            v15 = v4;
            if (!v16)
              goto LABEL_14;
          }
          __atxlog_handle_relevant_shortcut();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "widgetDescriptor");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)keyExistsAndHasValidFormat = 138412290;
            v33 = (uint64_t)v17;
            _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "ATXRSFilter: WidgetKit Developer Mode enabled. Bypassing filtering for debug allowed widget: %@", keyExistsAndHasValidFormat, 0xCu);

          }
          v15 = v26;
        }

LABEL_14:
        objc_msgSend(v15, "addObject:", v10);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v6);
  }

  __atxlog_handle_relevant_shortcut();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)keyExistsAndHasValidFormat = 0;
    _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "ATXRSFilter: Filtering candidates...", keyExistsAndHasValidFormat, 2u);
  }

  v19 = (void *)objc_msgSend(v4, "copy");
  -[ATXRSFilter _candidatesByUsingAppLaunchHistogramsToFilterCandidates:](self, "_candidatesByUsingAppLaunchHistogramsToFilterCandidates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_relevant_shortcut();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v21, "count");
    *(_DWORD *)keyExistsAndHasValidFormat = 134217984;
    v33 = v23;
    _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "ATXRSFilter: %lu candidates passed suggestion filters", keyExistsAndHasValidFormat, 0xCu);
  }

  return v21;
}

- (id)_candidatesByUsingAppLaunchHistogramsToFilterCandidates:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t i;
  void *v31;
  Class v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __int128 v51;
  void *v52;
  id obj;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  id v80;
  _BYTE v81[128];
  id v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54 = (id)objc_opt_new();
  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v4;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v69;
    v7 = 0x1E0C99000uLL;
    *(_QWORD *)&v6 = 138412802;
    v51 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v69 != v55)
          objc_enumerationMutation(obj);
        v57 = v8;
        v9 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v8);
        objc_msgSend(v9, "donationBundleIdentifier", v51);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXRSWidgetSuggestionProducer replacementContainerBundleIdForDonationBundleId:](ATXRSWidgetSuggestionProducer, "replacementContainerBundleIdForDonationBundleId:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(v9, "donationBundleIdentifier");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v13;

        v15 = v14;
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.Health.Sleep")) & 1) != 0
          || objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.PeopleViewService")))
        {

LABEL_12:
          objc_msgSend(v54, "addObject:", v9);
          goto LABEL_13;
        }
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.gamecenter.widgets"));

        if (v16)
          goto LABEL_12;
        v82 = v15;
        objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:count:", &v82, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "totalLaunchesForBundleIds:", v17);
        v19 = v18;

        if (v19 >= 10.0)
        {
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          objc_msgSend(v9, "relevantContexts");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
          if (!v63)
          {

            goto LABEL_12;
          }
          v61 = v28;
          v62 = *(_QWORD *)v65;
          v29 = 1;
          v58 = v9;
          v59 = v15;
          do
          {
            for (i = 0; i != v63; ++i)
            {
              if (*(_QWORD *)v65 != v62)
                objc_enumerationMutation(v61);
              v31 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
              v32 = NSClassFromString(CFSTR("ATXDateRelevantContext"));
              v33 = v31;
              if (v32)
              {
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v34 = v33;
                else
                  v34 = 0;
              }
              else
              {
                v34 = 0;
              }
              v35 = v34;

              if (v35)
              {
                v80 = v15;
                objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:count:", &v80, 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "startDate");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v38) = 1.0;
                objc_msgSend(v5, "totalLaunchesForBundleIds:forDate:distanceScale:", v36, v37, v38);
                v40 = v39;

                if (v40 < 5.0)
                {
                  __atxlog_handle_relevant_shortcut();
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v9, "widgetDescriptor");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "extensionBundleIdentifier");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "widgetDescriptor");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "kind");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "intent");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "intentDescription");
                    v46 = v5;
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "startDate");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v73 = v42;
                    v74 = 2112;
                    v75 = v44;
                    v76 = 2112;
                    v77 = v47;
                    v78 = 2112;
                    v79 = v48;
                    _os_log_impl(&dword_1C9A3B000, v41, OS_LOG_TYPE_DEFAULT, "ATXRSFilter: Candidate (%@ - %@ - %@) failed dayOfWeek filter for start date: %@", buf, 0x2Au);

                    v5 = v46;
                    v9 = v58;

                    v15 = v59;
                    v7 = 0x1E0C99000;

                  }
                  v29 = 0;
                }
              }

            }
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
          }
          while (v63);

          if ((v29 & 1) != 0)
            goto LABEL_12;
        }
        else
        {
          __atxlog_handle_relevant_shortcut();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "widgetDescriptor");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "extensionBundleIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "widgetDescriptor");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "kind");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "intent");
            v25 = v15;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "intentDescription");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v51;
            v73 = v22;
            v74 = 2112;
            v75 = v24;
            v76 = 2112;
            v77 = v27;
            _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "ATXRSFilter: Candidate (%@ - %@ - %@) failed trendingAppLaunchPopularity filter", buf, 0x20u);

            v15 = v25;
          }

        }
LABEL_13:

        v8 = v57 + 1;
      }
      while (v57 + 1 != v56);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
      v56 = v49;
    }
    while (v49);
  }

  return v54;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchHistogramManager, 0);
}

@end
