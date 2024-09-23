@implementation ATXHomeScreenLogUploader

- (ATXHomeScreenLogUploader)init
{
  ATXHomeScreenLogUploader *v2;
  uint64_t v3;
  ATXHomeScreenLogWidgetSetupDictionaries *widgetSetupDictionaries;
  uint64_t v5;
  ATXHomeScreenLogWidgetEventDictionaries *widgetEventDictionaries;
  uint64_t v7;
  ATXHomeScreenLogWidgetRotationDictionaries *widgetRotationDictionaries;
  uint64_t v9;
  ATXHomeScreenLogSystemEventDictionaries *systemEventDictionary;
  uint64_t v11;
  ATXHomeScreenLogSystemChangeDictionary *systemChangeDictionary;
  uint64_t v13;
  ATXHomeScreenLogWidgetAddSheetDictionaries *widgetAddSheetDictionaries;
  uint64_t v15;
  ATXHomeScreenWidgetDiscoverabilityLogHarvester *widgetDiscoverabilityDictionaries;
  uint64_t v17;
  ATXTVWidgetLogHarvester *tvWidgetLogHarvester;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ATXHomeScreenLogUploader;
  v2 = -[ATXHomeScreenLogUploader init](&v20, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    widgetSetupDictionaries = v2->_widgetSetupDictionaries;
    v2->_widgetSetupDictionaries = (ATXHomeScreenLogWidgetSetupDictionaries *)v3;

    v5 = objc_opt_new();
    widgetEventDictionaries = v2->_widgetEventDictionaries;
    v2->_widgetEventDictionaries = (ATXHomeScreenLogWidgetEventDictionaries *)v5;

    v7 = objc_opt_new();
    widgetRotationDictionaries = v2->_widgetRotationDictionaries;
    v2->_widgetRotationDictionaries = (ATXHomeScreenLogWidgetRotationDictionaries *)v7;

    v9 = objc_opt_new();
    systemEventDictionary = v2->_systemEventDictionary;
    v2->_systemEventDictionary = (ATXHomeScreenLogSystemEventDictionaries *)v9;

    v11 = objc_opt_new();
    systemChangeDictionary = v2->_systemChangeDictionary;
    v2->_systemChangeDictionary = (ATXHomeScreenLogSystemChangeDictionary *)v11;

    v13 = objc_opt_new();
    widgetAddSheetDictionaries = v2->_widgetAddSheetDictionaries;
    v2->_widgetAddSheetDictionaries = (ATXHomeScreenLogWidgetAddSheetDictionaries *)v13;

    v15 = objc_opt_new();
    widgetDiscoverabilityDictionaries = v2->_widgetDiscoverabilityDictionaries;
    v2->_widgetDiscoverabilityDictionaries = (ATXHomeScreenWidgetDiscoverabilityLogHarvester *)v15;

    v17 = objc_opt_new();
    tvWidgetLogHarvester = v2->_tvWidgetLogHarvester;
    v2->_tvWidgetLogHarvester = (ATXTVWidgetLogHarvester *)v17;

  }
  return v2;
}

+ (BOOL)_shouldProcessATXUIEvent:(id)a3 startTime:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  BOOL v11;

  objc_msgSend(a3, "homeScreenEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "date"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "timeIntervalSinceReferenceDate"),
        v9 = v8,
        v7,
        v9 <= a4))
  {
    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "eventTypeString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Unknown")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) != 0)
  {
    goto LABEL_6;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("StackChanged")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("WidgetTapped")) & 1) != 0)
  {
LABEL_12:
    v11 = 1;
    goto LABEL_7;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) == 0)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DeviceLocked")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) != 0)
    {
      goto LABEL_12;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) == 0
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) == 0)
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("StackShown")) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("StackDisappeared")) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("StackCreated")) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("StackDeleted")) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) != 0)
      {
        goto LABEL_12;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("AppAdded")) & 1) == 0)
      {
        objc_msgSend(v10, "isEqualToString:", CFSTR("AppRemoved"));
      }
    }
  }
LABEL_6:
  v11 = 0;
LABEL_7:

LABEL_9:
  return v11;
}

- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4
{
  return (id)objc_msgSend(a3, "orderedMergeWithOthers:comparator:", a4, &__block_literal_global_242);
}

uint64_t __73__ATXHomeScreenLogUploader__timeBasedMergePublisher_withOtherPublishers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  objc_msgSend(v5, "timestamp");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "timestamp");
    v11 = v10;
    objc_msgSend(v5, "timestamp");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:(id)a3 customStartDate:(id)a4 dryRunCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  dispatch_semaphore_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  double v45;
  double v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  double v54;
  BOOL v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  id v76;
  id v77;
  void *v78;
  uint8_t buf[16];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  uint64_t *v88;
  uint64_t *v89;
  _QWORD *v90;
  _QWORD *v91;
  _QWORD *v92;
  uint64_t *v93;
  id v94[2];
  _QWORD v95[5];
  id v96;
  _QWORD v97[3];
  char v98;
  _QWORD v99[5];
  id v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  uint64_t v111;
  double *v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD v115[4];
  NSObject *v116;
  NSObject *v117;
  id v118;
  _QWORD v119[4];
  NSObject *v120;
  id v121;
  id location;
  id v123;
  _QWORD v124[8];
  _QWORD v125[8];
  _BYTE v126[128];
  _QWORD v127[4];

  v127[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "didDefer") & 1) == 0)
  {
    v76 = v10;
    v11 = (void *)objc_opt_new();
    v123 = 0;
    objc_msgSend(v11, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v123);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v123;

    if (!v78 || v77)
    {
      __atxlog_handle_home_screen();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[ATXHomeScreenLogUploader uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:].cold.1();
        v15 = v14;
      }
    }
    else
    {
      if ((objc_msgSend(v8, "didDefer") & 1) != 0)
      {
LABEL_47:

        v10 = v76;
        goto LABEL_48;
      }
      if (v9)
      {
        objc_msgSend(v9, "timeIntervalSinceNow");
        v13 = -v12;
      }
      else
      {
        v13 = 86400.0;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v13);
      v75 = objc_claimAutoreleasedReturnValue();
      -[NSObject timeIntervalSinceReferenceDate](v75, "timeIntervalSinceReferenceDate");
      v17 = v16;
      -[ATXHomeScreenLogSystemEventDictionaries updateSystemLevelSummaryForHomeScreenPages:startDate:](self->_systemEventDictionary, "updateSystemLevelSummaryForHomeScreenPages:startDate:", v78, v75);
      -[ATXHomeScreenLogSystemChangeDictionary updateSystemChangeSummaryForHomeScreenPages:](self->_systemChangeDictionary, "updateSystemChangeSummaryForHomeScreenPages:", v78);
      -[ATXHomeScreenLogWidgetSetupDictionaries updateWidgetSetupSummaryForHomeScreenPages:](self->_widgetSetupDictionaries, "updateWidgetSetupSummaryForHomeScreenPages:", v78);
      -[ATXHomeScreenWidgetDiscoverabilityLogHarvester generateWidgetDiscoverabilityMetricsWithActivity:](self->_widgetDiscoverabilityDictionaries, "generateWidgetDiscoverabilityMetricsWithActivity:", v8);
      -[ATXTVWidgetLogHarvester generateTVWidgetMetrics](self->_tvWidgetLogHarvester, "generateTVWidgetMetrics");
      if ((objc_msgSend(v8, "didDefer") & 1) == 0)
      {
        objc_initWeak(&location, self);
        v18 = dispatch_semaphore_create(0);
        objc_msgSend(MEMORY[0x1E0CF8D68], "sharedInstance");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
          v19 = 2;
        else
          v19 = 0;
        v20 = MEMORY[0x1E0C809B0];
        v119[0] = MEMORY[0x1E0C809B0];
        v119[1] = 3221225472;
        v119[2] = __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke;
        v119[3] = &unk_1E82EB010;
        v21 = v18;
        v120 = v21;
        objc_copyWeak(&v121, &location);
        objc_msgSend(v74, "fetchSuggestedGalleryItemsOfGridSize:widgetFamilyMask:withCompletionHandler:", v19, 7294, v119);
        if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v21, 2.0) == 1)
        {
          __atxlog_handle_home_screen();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[ATXHomeScreenLogUploader uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:].cold.5();

        }
        v115[0] = v20;
        v115[1] = 3221225472;
        v115[2] = __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_21;
        v115[3] = &unk_1E82EB038;
        v73 = dispatch_semaphore_create(0);
        v116 = v73;
        objc_copyWeak(&v118, &location);
        v23 = v21;
        v117 = v23;
        objc_msgSend(v74, "fetchSmartStackOfVariant:completionHandler:", 0, v115);
        v66 = v23;
        if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v73, 2.0) == 1)
        {
          __atxlog_handle_home_screen();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[ATXHomeScreenLogUploader uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:].cold.4();

        }
        v111 = 0;
        v112 = (double *)&v111;
        v113 = 0x2020000000;
        v114 = 0;
        v105 = 0;
        v106 = &v105;
        v107 = 0x3032000000;
        v108 = __Block_byref_object_copy__103;
        v109 = __Block_byref_object_dispose__103;
        v110 = (id)objc_opt_new();
        v101 = 0;
        v102 = &v101;
        v103 = 0x2020000000;
        v104 = 0;
        v99[0] = 0;
        v99[1] = v99;
        v99[2] = 0x3032000000;
        v99[3] = __Block_byref_object_copy__103;
        v99[4] = __Block_byref_object_dispose__103;
        v100 = (id)objc_opt_new();
        v97[0] = 0;
        v97[1] = v97;
        v97[2] = 0x2020000000;
        v98 = 0;
        v95[0] = 0;
        v95[1] = v95;
        v95[2] = 0x3032000000;
        v95[3] = __Block_byref_object_copy__103;
        v95[4] = __Block_byref_object_dispose__103;
        v96 = (id)objc_opt_new();
        v25 = v13 + 43200.0;
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -(v13 + 43200.0));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSinceReferenceDate");
        v28 = v27;

        v29 = (void *)objc_opt_new();
        objc_msgSend(v29, "genericEventPublisherFromStartTime:", v28);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        BiomeLibrary();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "App");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "InFocus");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "atx_publisherFromStartTime:", v33);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -(v25 + 3600.0));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "timeIntervalSinceReferenceDate");
        v36 = v35;

        v37 = (void *)objc_opt_new();
        objc_msgSend(v37, "publisherFromStartTime:", v36);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v127[0] = v71;
        v127[1] = v70;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHomeScreenLogUploader _timeBasedMergePublisher:withOtherPublishers:](self, "_timeBasedMergePublisher:withOtherPublishers:", v72, v38);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = (void *)objc_opt_new();
        v40 = (void *)objc_opt_new();
        objc_msgSend(v69, "filterWithIsIncluded:", &__block_literal_global_31_4);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v84[0] = v20;
        v84[1] = 3221225472;
        v84[2] = __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_34;
        v84[3] = &unk_1E82EB0A0;
        objc_copyWeak(v94, &location);
        v42 = v8;
        v85 = v42;
        v88 = &v111;
        v67 = v40;
        v86 = v67;
        v43 = v39;
        v94[1] = v17;
        v68 = v43;
        v87 = v43;
        v89 = &v101;
        v90 = v95;
        v91 = v97;
        v92 = v99;
        v93 = &v105;
        v44 = (id)objc_msgSend(v41, "sinkWithCompletion:receiveInput:", &__block_literal_global_33_1, v84);

        if ((objc_msgSend(v42, "didDefer") & 1) == 0)
        {
          -[ATXHomeScreenLogWidgetSetupDictionaries updateWidgetLevelParentAppLaunches:](self->_widgetSetupDictionaries, "updateWidgetLevelParentAppLaunches:", v106[5]);
          v45 = v112[3];
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          if (v45 >= v46)
          {
            __atxlog_handle_home_screen();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              -[ATXTimelineRelevanceMetricHarvester _addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:].cold.2();
          }
          else
          {
            __atxlog_handle_home_screen();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              -[ATXHomeScreenLogUploader uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:].cold.2();

            v82 = 0u;
            v83 = 0u;
            v80 = 0u;
            v81 = 0u;
            objc_msgSend(v68, "removeAndReturnCompletedSessions");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v80, v126, 16);
            if (v49)
            {
              v50 = *(_QWORD *)v81;
              do
              {
                for (i = 0; i != v49; ++i)
                {
                  if (*(_QWORD *)v81 != v50)
                    objc_enumerationMutation(v48);
                  v52 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
                  objc_msgSend(v52, "sessionEndDate");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "timeIntervalSinceReferenceDate");
                  v55 = v54 < *(double *)&v17;

                  if (!v55)
                  {
                    -[ATXHomeScreenLogSystemEventDictionaries updateSystemLevelSummaryWithRotationSession:](self->_systemEventDictionary, "updateSystemLevelSummaryWithRotationSession:", v52);
                    -[ATXHomeScreenLogWidgetRotationDictionaries updateWithRotationSession:](self->_widgetRotationDictionaries, "updateWithRotationSession:", v52);
                  }
                }
                v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v80, v126, 16);
              }
              while (v49);
            }

            -[ATXHomeScreenLogSystemEventDictionaries updateSystemLevelSummaryTotalUnlockSessions:](self->_systemEventDictionary, "updateSystemLevelSummaryTotalUnlockSessions:", v102[3]);
            -[ATXHomeScreenLogWidgetSetupDictionaries updateTotalUnlockSessions:](self->_widgetSetupDictionaries, "updateTotalUnlockSessions:", v102[3]);
            -[ATXHomeScreenLogSystemEventDictionaries populateUnlockSessionEngagementSummaryFromManager:](self->_systemEventDictionary, "populateUnlockSessionEngagementSummaryFromManager:", v67);
            -[ATXHomeScreenLogSystemEventDictionaries populateLifetimeNPlusOneStatistics](self->_systemEventDictionary, "populateLifetimeNPlusOneStatistics");
            -[ATXHomeScreenLogSystemEventDictionaries populateHasBehavioralData](self->_systemEventDictionary, "populateHasBehavioralData");
            -[ATXHomeScreenLogSystemEventDictionaries populateUsedKettle](self->_systemEventDictionary, "populateUsedKettle");
            if (v76)
            {
              v124[0] = CFSTR("System Event Dictionary");
              -[ATXHomeScreenLogSystemEventDictionaries dryRunResult](self->_systemEventDictionary, "dryRunResult");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v125[0] = v56;
              v124[1] = CFSTR("System Change Dictionary");
              -[ATXHomeScreenLogSystemChangeDictionary dryRunResult](self->_systemChangeDictionary, "dryRunResult");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v125[1] = v57;
              v124[2] = CFSTR("Widget Setup Dictionary");
              -[ATXHomeScreenLogWidgetSetupDictionaries dryRunResult](self->_widgetSetupDictionaries, "dryRunResult");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v125[2] = v58;
              v124[3] = CFSTR("Widget Event Dictionary");
              -[ATXHomeScreenLogWidgetEventDictionaries dryRunResult](self->_widgetEventDictionaries, "dryRunResult");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v125[3] = v65;
              v124[4] = CFSTR("Widget Add Sheet Dictionary");
              -[ATXHomeScreenLogWidgetAddSheetDictionaries dryRunResult](self->_widgetAddSheetDictionaries, "dryRunResult");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v125[4] = v59;
              v124[5] = CFSTR("Widget Rotation Dictionary");
              -[ATXHomeScreenLogWidgetRotationDictionaries dryRunResult](self->_widgetRotationDictionaries, "dryRunResult");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v125[5] = v60;
              v124[6] = CFSTR("Default Stack Metrics Dictionary");
              -[ATXHomeScreenWidgetDiscoverabilityLogHarvester dryRunResult](self->_widgetDiscoverabilityDictionaries, "dryRunResult");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v125[6] = v61;
              v124[7] = CFSTR("TV Widget Metrics Dictionary");
              -[ATXTVWidgetLogHarvester dryRunResult](self->_tvWidgetLogHarvester, "dryRunResult");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v125[7] = v62;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 8);
              v63 = objc_claimAutoreleasedReturnValue();

              (*((void (**)(id, NSObject *, _QWORD))v76 + 2))(v76, v63, 0);
              __atxlog_handle_home_screen();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C9A3B000, v64, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogUploader: Daily CoreAnalytics log upload dry-run complete - no actual logs uploaded", buf, 2u);
              }

            }
            else
            {
              -[ATXHomeScreenLogSystemEventDictionaries sendToCoreAnalytics](self->_systemEventDictionary, "sendToCoreAnalytics");
              -[ATXHomeScreenLogSystemChangeDictionary sendToCoreAnalytics](self->_systemChangeDictionary, "sendToCoreAnalytics");
              -[ATXHomeScreenLogWidgetSetupDictionaries sendToCoreAnalytics](self->_widgetSetupDictionaries, "sendToCoreAnalytics");
              -[ATXHomeScreenLogWidgetEventDictionaries sendToCoreAnalytics](self->_widgetEventDictionaries, "sendToCoreAnalytics");
              -[ATXHomeScreenLogWidgetAddSheetDictionaries sendToCoreAnalytics](self->_widgetAddSheetDictionaries, "sendToCoreAnalytics");
              -[ATXHomeScreenLogWidgetRotationDictionaries sendToCoreAnalytics](self->_widgetRotationDictionaries, "sendToCoreAnalytics");
              -[ATXHomeScreenWidgetDiscoverabilityLogHarvester sendToCoreAnalytics](self->_widgetDiscoverabilityDictionaries, "sendToCoreAnalytics");
              -[ATXTVWidgetLogHarvester sendToCoreAnalytics](self->_tvWidgetLogHarvester, "sendToCoreAnalytics");
              __atxlog_handle_home_screen();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C9A3B000, v63, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogUploader: Daily CoreAnalytics log upload complete", buf, 2u);
              }
            }
          }

        }
        objc_destroyWeak(v94);

        _Block_object_dispose(v95, 8);
        _Block_object_dispose(v97, 8);
        _Block_object_dispose(v99, 8);

        _Block_object_dispose(&v101, 8);
        _Block_object_dispose(&v105, 8);

        _Block_object_dispose(&v111, 8);
        objc_destroyWeak(&v118);

        objc_destroyWeak(&v121);
        objc_destroyWeak(&location);
      }
      v15 = v75;
    }

    goto LABEL_47;
  }
LABEL_48:

}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id *WeakRetained;
  id *v9;
  NSObject *v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    __atxlog_handle_home_screen();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_cold_1();

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained[6], "updateWidgetAddSheetSummaryForSuggestions:", v5);
    }
    else
    {
      __atxlog_handle_home_screen();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_cold_2();

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  }
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (v6 || !v7)
  {
    __atxlog_handle_home_screen();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_21_cold_1();

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      v10 = (void *)*((_QWORD *)WeakRetained + 6);
      objc_msgSend(v5, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateWidgetAddSheetSummaryForDefaultStack:", v11);

      v12 = *(NSObject **)(a1 + 32);
    }
    else
    {
      __atxlog_handle_home_screen();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_21_cold_2();

      v12 = *(NSObject **)(a1 + 40);
    }
    dispatch_semaphore_signal(v12);

  }
}

uint64_t __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_29()
{
  return 1;
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_2_cold_1(v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogUploader: Daily CoreAnalytics log processing (task 1 of 2) complete", v6, 2u);
  }

}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  double v5;
  double v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  char v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained && (objc_msgSend(*(id *)(a1 + 32), "didDefer") & 1) == 0)
  {
    v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(v3, "timestamp");
    if (v5 >= v6)
      v6 = v5;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
    objc_msgSend(v3, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "eventBody");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v3, "eventBody");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "updateSessionStateWithUIEvent:", v11);

        v13 = *(void **)(a1 + 48);
        objc_msgSend(v3, "eventBody");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateWithUIEvent:", v14);

      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v3, "eventBody");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) != 0)
      {
        v18 = *(void **)(a1 + 48);
        objc_msgSend(v3, "eventBody");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "updateWithBlendingUICacheUpdate:", v19);

      }
      else
      {
        objc_msgSend(v3, "eventBody");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

        }
        else
        {
          v21 = (void *)objc_opt_class();
          objc_msgSend(v3, "eventBody");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v21) = objc_msgSend(v21, "_shouldProcessATXUIEvent:startTime:", v22, *(double *)(a1 + 112));

          if (!(_DWORD)v21)
            goto LABEL_37;
        }
        if (v12 == 1)
        {
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "removeAllObjects");
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
        }
        objc_msgSend(v3, "eventBody");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v55 = v23;
          v56 = v12;
          v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
          objc_msgSend(v23, "homeScreenEvent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stackId");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "eventBody");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "homeScreenEvent");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = a1;
          +[ATXHomeScreenLogUploaderUtilities stackShownEventsForPseudoTapIfPossible:currentEvent:](ATXHomeScreenLogUploaderUtilities, "stackShownEventsForPseudoTapIfPossible:currentEvent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v3);
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v59 != v32)
                  objc_enumerationMutation(obj);
                v34 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                objc_msgSend(WeakRetained[4], "updateSystemLevelSummaryForWidgetPseudoTapWithStackShownEvent:", v34);
                objc_msgSend(WeakRetained[2], "updateWidgetLevelSummaryForWidgetPseudoTapWithStackShownEvent:", v34);
                v35 = (void *)MEMORY[0x1E0CF9220];
                objc_msgSend(v34, "widgetBundleId");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "widgetKind");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "stringRepresentationForExtensionBundleId:kind:", v36, v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v29 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v34, v38);
              }
              v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
            }
            while (v31);
          }
          v39 = WeakRetained[4];
          v23 = v55;
          objc_msgSend(v55, "homeScreenEvent");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "updateSystemLevelSummaryForHomeScreenEvent:", v40);

          v41 = WeakRetained[5];
          objc_msgSend(v55, "homeScreenEvent");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "updateSystemChangeSummaryForHomeScreenEvent:", v42);

          v43 = WeakRetained[2];
          objc_msgSend(v55, "homeScreenEvent");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "updateWidgetLevelSummaryForHomeScreenEvent:lastStackEvent:", v44, v54);

          v12 = v56;
          a1 = v29;
        }
        else
        {
          objc_msgSend(v3, "eventBody");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v46 = objc_opt_isKindOfClass();

          if ((v46 & 1) != 0)
          {
            v47 = v23;
            if (+[ATXHomeScreenLogUploaderUtilities isValidAppLaunch:](ATXHomeScreenLogUploaderUtilities, "isValidAppLaunch:", v47))
            {
              v48 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
              objc_msgSend(v47, "bundleID");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v48, v49);

              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
            }

          }
        }
        if (v12 == 2
          && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
          && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
        {
          v50 = WeakRetained[4];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "allValues");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "updateSystemLevelUnlockSessionsWithWidgetDwell:", v51);

          v52 = WeakRetained[2];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "allValues");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "updateUnlockSessionsWithWidgetDwell:", v53);

        }
      }
    }
    else
    {
      __atxlog_handle_home_screen();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_34_cold_1();

    }
  }
LABEL_37:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvWidgetLogHarvester, 0);
  objc_storeStrong((id *)&self->_widgetDiscoverabilityDictionaries, 0);
  objc_storeStrong((id *)&self->_widgetAddSheetDictionaries, 0);
  objc_storeStrong((id *)&self->_systemChangeDictionary, 0);
  objc_storeStrong((id *)&self->_systemEventDictionary, 0);
  objc_storeStrong((id *)&self->_widgetRotationDictionaries, 0);
  objc_storeStrong((id *)&self->_widgetEventDictionaries, 0);
  objc_storeStrong((id *)&self->_widgetSetupDictionaries, 0);
}

- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "ATXHomeScreenLogUploader: Error while requesting home screen config - %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "ATXHomeScreenLogUploader: Biome timestamps are all in the past, proceeding to upload", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXHomeScreenLogUploader: couldn't update AddSheetSummary for default stack because fetch timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity:customStartDate:dryRunCompletionHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXHomeScreenLogUploader: couldn't update AddSheetSummary for gallery widgets because fetch timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "ATXHomeScreenLogUploader: Error while requesting add sheet suggestions - %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXHomeScreenLogUploader: couldn't update AddSheetSummary for gallery widgets because swelf is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "ATXHomeScreenLogUploader: Error while requesting default smart stack - %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_21_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXHomeScreenLogUploader: couldn't update AddSheetSummary for default stack because swelf is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "ATXHomeScreenLogUploader: Error in CoreAnalytics log processing (task 1 of 2) : %@", v5);

}

void __123__ATXHomeScreenLogUploader_uploadHomeScreenSummaryLogsToCoreAnalyticsWithActivity_customStartDate_dryRunCompletionHandler___block_invoke_34_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXHomeScreenLogUploader: Can't deserialize ATXHomeScreenEvent instance", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
