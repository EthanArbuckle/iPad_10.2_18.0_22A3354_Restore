@implementation ATXInformationFilter

- (ATXInformationFilter)initWithStore:(id)a3 abuseControlConfig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ATXInformationFilter *v9;

  v6 = a4;
  v7 = a3;
  +[ATXDigitalHealthBlacklist sharedInstance](ATXDigitalHealthBlacklist, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXInformationFilter initWithStore:abuseControlConfig:histogram:digitalHealthBlockList:](self, "initWithStore:abuseControlConfig:histogram:digitalHealthBlockList:", v7, v6, 0, v8);

  return v9;
}

- (ATXInformationFilter)initWithStore:(id)a3 abuseControlConfig:(id)a4 histogram:(id)a5 digitalHealthBlockList:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXInformationFilter *v15;
  objc_class *v16;
  id v17;
  const char *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *queue;
  uint64_t v25;
  NSCache *appLaunchCountsByBundleId;
  void *v27;
  uint64_t v28;
  _PASQueueLock *lock;
  id obj;
  id v32;
  objc_super v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)ATXInformationFilter;
  v15 = -[ATXInformationFilter init](&v33, sel_init);
  if (v15)
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = v11;
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    obj = a6;
    v19 = v14;
    v20 = v13;
    v21 = v12;
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create(v18, v22);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v23;

    v12 = v21;
    v13 = v20;
    v14 = v19;

    v25 = objc_opt_new();
    appLaunchCountsByBundleId = v15->_appLaunchCountsByBundleId;
    v15->_appLaunchCountsByBundleId = (NSCache *)v25;

    objc_storeStrong((id *)&v15->_store, a3);
    objc_storeStrong((id *)&v15->_abuseControlConfig, a4);
    objc_storeStrong((id *)&v15->_histogram, a5);
    objc_storeStrong((id *)&v15->_digitalHealthBlockList, obj);
    v27 = (void *)objc_opt_new();
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81600]), "initWithGuardedData:serialQueue:", v27, v15->_queue);
    lock = v15->_lock;
    v15->_lock = (_PASQueueLock *)v28;

    -[ATXInformationFilter _populateDismissRecordsCacheAsynchronously](v15, "_populateDismissRecordsCacheAsynchronously");
    v11 = v32;
  }

  return v15;
}

- (void)recordDismissOfSuggestion:(id)a3 isDismissalLongTerm:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _PASQueueLock *lock;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ATXInformationFilter *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke;
  v13[3] = &unk_1E82DB118;
  v17 = a4;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v13);

}

void __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  double v4;
  id v5;
  id *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = dbl_1C9E7E8F0[*(_BYTE *)(a1 + 56) == 0];
  v5 = objc_alloc(MEMORY[0x1E0CF8EC0]);
  v6 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "widgetBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "criterion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithWidgetBundleId:criterion:blockWidgetUntilDate:blockCriterionUntilDate:", v7, v8, v9, v10);

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "appendDismissRecord:", v11))
  {
    v12 = (void *)v3[1];
    objc_msgSend(*v6, "widgetBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)objc_opt_new();
      v16 = (void *)v3[1];
      objc_msgSend(*v6, "widgetBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    }
    v18 = (void *)v3[1];
    objc_msgSend(*v6, "widgetBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v11);

    v21 = 0;
  }
  else
  {
    __atxlog_handle_gi();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke_cold_1((id *)(a1 + 32), v22);

    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("failed to insert dismiss record into DB.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("ATXInformationFilterError"), -1, v24);

  }
  dispatch_get_global_queue(17, 0);
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke_28;
  block[3] = &unk_1E82DB0F0;
  v26 = *(id *)(a1 + 48);
  v29 = v21;
  v30 = v26;
  v27 = v21;
  dispatch_async(v25, block);

}

uint64_t __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)filterInfoSuggestions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  ATXInformationFilter *v19;
  id v20;
  id v21;
  void *v22;

  v4 = a3;
  __atxlog_handle_timeline();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXInformationFilter filterInfoSuggestions:].cold.1((uint64_t)self, v5);

  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  lock = self->_lock;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __46__ATXInformationFilter_filterInfoSuggestions___block_invoke;
  v18 = &unk_1E82DB140;
  v19 = self;
  v20 = v4;
  v9 = v6;
  v21 = v9;
  v22 = v7;
  v10 = v7;
  v11 = v4;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v15);
  -[ATXInformationFilter _removeExpiredDismissRecordsAsynchronously](self, "_removeExpiredDismissRecordsAsynchronously", v15, v16, v17, v18, v19);
  -[ATXInformationStore updateEndDateForInfoSuggestions:](self->_store, "updateEndDateForInfoSuggestions:", v10);
  v12 = v22;
  v13 = v9;

  return v13;
}

void __46__ATXInformationFilter_filterInfoSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t j;
  void *v66;
  void *v67;
  id v68;
  int v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  uint64_t v79;
  unint64_t v80;
  int v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  NSObject *v102;
  void *v103;
  void *v104;
  double v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  id obj;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  uint64_t v127;
  NSObject *v128;
  void *v129;
  void *context;
  void *contexta;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  Boolean keyExistsAndHasValidFormat[4];
  void *v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  void *v152;
  __int16 v153;
  void *v154;
  __int16 v155;
  void *v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 19);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "denyList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "blacklistedBundleIds");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = (void *)objc_opt_new();
  v117 = (void *)objc_opt_new();
  context = (void *)objc_opt_new();
  v132 = a1;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
  v116 = v3;
  v121 = (void *)v4;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v142;
    v125 = v7;
    v127 = *(_QWORD *)v142;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v142 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v12, "appBundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v129, "containsObject:", v14);

        if (v15)
        {
          v16 = (void *)MEMORY[0x1E0D81238];
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v17 = v16;
          v18 = v12;
          v19 = 22;
LABEL_10:
          objc_msgSend(v17, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v18, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(context, "addObject:", v21);
          goto LABEL_33;
        }
        if (objc_msgSend(*(id *)(v132 + 32), "_isSuggestionBlockedByDismiss:withGuardedData:", v12, v3))
        {
          v20 = (void *)MEMORY[0x1E0D81238];
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v17 = v20;
          v18 = v12;
          v19 = 1;
          goto LABEL_10;
        }
        objc_msgSend(v12, "clientModelId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v4);

        if (!v23)
        {
          objc_msgSend(*(id *)(v132 + 32), "_demoteFirstPartyDonatedSuggestionIfNecessary:", v12);
          v28 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v12, "widgetBundleIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "widgetKind");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v12, "layouts");
          objc_msgSend(v12, "intent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%@.%@.%lu.%lld.%ld"), v29, v30, v31, objc_msgSend(v32, "atx_indexingHash"), objc_msgSend(v12, "confidenceLevel"));

          objc_msgSend(v117, "objectForKeyedSubscript:", v21);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            v34 = (void *)MEMORY[0x1E0D81238];
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            objc_msgSend(v34, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v33, 5);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(context, "addObject:", v35);

          }
          objc_msgSend(v117, "setObject:forKeyedSubscript:", v12, v21);

          v3 = v116;
          v4 = (uint64_t)v121;
          v7 = v125;
          goto LABEL_32;
        }
        v24 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v12, "widgetBundleIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "widgetKind");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%@.%@"), v25, v26);

        objc_msgSend(v12, "widgetBundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v115, "containsObject:", v27) & 1) != 0)
        {

        }
        else
        {
          v36 = objc_msgSend(v115, "containsObject:", v21);

          if ((v36 & 1) == 0)
          {
            objc_msgSend(v12, "sourceIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "objectForKeyedSubscript:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              v41 = *(void **)(*(_QWORD *)(v132 + 32) + 32);
              objc_msgSend(v40, "suggestionIdentifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v41, "rotationExistsForSuggestionWithId:considerStalenessRotation:", v42, 0);

              v44 = *(_QWORD *)(v132 + 32);
              v45 = *(void **)(v44 + 32);
              if (v43)
              {
                objc_msgSend(v40, "suggestionIdentifier");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v45, "didSuggestionReachDurationLimit:", v46);

                v48 = (void *)MEMORY[0x1E0D81238];
                objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
                if (v47)
                {
                  objc_msgSend(v48, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v40, 3);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(context, "addObject:", v49);

                  objc_msgSend(v12, "sourceIdentifier");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v114, "setObject:forKeyedSubscript:", v12, v50);
                }
                else
                {
                  objc_msgSend(v48, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v12, 4);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(context, "addObject:", v50);
                }
                v7 = v125;
              }
              else
              {
                objc_msgSend(*(id *)(v44 + 32), "firstTimeAtWhichSuggestionPassedTimelineFilters:", v40);
                v51 = (void *)objc_claimAutoreleasedReturnValue();

                v7 = v125;
                if (v51)
                {
                  v52 = (void *)MEMORY[0x1E0D81238];
                  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
                  v53 = v52;
                  v54 = v12;
                  v55 = 4;
                }
                else
                {
                  objc_msgSend(v12, "sourceIdentifier");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v114, "setObject:forKeyedSubscript:", v12, v56);

                  v57 = (void *)MEMORY[0x1E0D81238];
                  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
                  v53 = v57;
                  v54 = v40;
                  v55 = 5;
                }
                objc_msgSend(v53, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v54, v55);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(context, "addObject:", v50);
              }
              v4 = (uint64_t)v121;
            }
            else
            {
              objc_msgSend(v12, "sourceIdentifier");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "setObject:forKeyedSubscript:", v12, v50);
            }

            v3 = v116;
            goto LABEL_32;
          }
        }
        v37 = (void *)MEMORY[0x1E0D81238];
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        objc_msgSend(v37, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v12, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(context, "addObject:", v38);

LABEL_32:
        v10 = v127;
LABEL_33:

        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
    }
    while (v9);
  }

  v58 = *(void **)(v132 + 48);
  objc_msgSend(v117, "allValues");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addObjectsFromArray:", v59);

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  objc_msgSend(v114, "allValues");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
  if (!v61)
    goto LABEL_60;
  v62 = v61;
  v63 = *(_QWORD *)v138;
  v64 = (const __CFString *)*MEMORY[0x1E0CF9510];
  do
  {
    for (j = 0; j != v62; ++j)
    {
      if (*(_QWORD *)v138 != v63)
        objc_enumerationMutation(v60);
      v66 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * j);
      v67 = (void *)MEMORY[0x1CAA48B6C]();
      objc_msgSend(v66, "widgetBundleIdentifier");
      v68 = (id)objc_claimAutoreleasedReturnValue();
      if (CFPreferencesGetAppBooleanValue(CFSTR("widgetKitDeveloperModeEnabled"), CFSTR("com.apple.duetexpertd"), 0))
      {
        keyExistsAndHasValidFormat[0] = 0;
        if (CFPreferencesGetAppBooleanValue(CFSTR("ATXWidgetKitDeveloperModeSkipEntitlementCheck"), v64, keyExistsAndHasValidFormat))
        {

LABEL_45:
          __atxlog_handle_timeline();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)keyExistsAndHasValidFormat = 0;
            _os_log_impl(&dword_1C9A3B000, v70, OS_LOG_TYPE_DEFAULT, "ATXInformationFilter: WidgetKit Developer Mode is enabled and debug is allowed for widget; bypassing abuse control",
              keyExistsAndHasValidFormat,
              2u);
          }

          objc_msgSend(*(id *)(v132 + 48), "addObject:", v66);
          v71 = (void *)MEMORY[0x1E0D81238];
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          objc_msgSend(v71, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v66, 14);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(context, "addObject:", v72);

          goto LABEL_58;
        }
        v69 = objc_msgSend(MEMORY[0x1E0CF8CE0], "isDebuggingAllowedForExtensionBundleId:", v68);

        if (v69)
          goto LABEL_45;
      }
      else
      {

      }
      if ((objc_msgSend(*(id *)(v132 + 32), "_shouldBlockTimelineSuggestion:updatingAbuseControlOutcomes:", v66, context) & 1) == 0)
      {
        objc_msgSend(v66, "endDate");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 3153600000.0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v75, "isEqualToDate:", v76);

        if (v77)
        {
          objc_msgSend(v66, "startDate");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v132;
          v80 = objc_msgSend(*(id *)(*(_QWORD *)(v132 + 32) + 40), "defaultDurationForTimelineSuggestions");
          goto LABEL_56;
        }
LABEL_57:
        objc_msgSend(*(id *)(v132 + 48), "addObject:", v66);
        goto LABEL_58;
      }
      objc_msgSend(v66, "relevanceScore");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "doubleValue");
      if (v74 < 2.22044605e-16)
      {

        goto LABEL_58;
      }
      v81 = objc_msgSend(*(id *)(v132 + 32), "stalenessRotationsAreEnabled:", v66);

      if (v81)
      {
        objc_msgSend(v66, "setConfidenceLevel:", 1);
        objc_msgSend(v66, "endDate");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 3153600000.0);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v82, "isEqualToDate:", v83);

        if (v84)
        {
          objc_msgSend(v66, "startDate");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v132;
          v80 = objc_msgSend(*(id *)(*(_QWORD *)(v132 + 32) + 40), "defaultDurationForFallbackTimelineSuggestions");
LABEL_56:
          objc_msgSend(v78, "dateByAddingTimeInterval:", (double)v80);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setEndDate:", v85);

          objc_msgSend(*(id *)(v79 + 56), "addObject:", v66);
        }
        goto LABEL_57;
      }
LABEL_58:
      objc_autoreleasePoolPop(v67);
    }
    v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
  }
  while (v62);
LABEL_60:

  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  obj = context;
  v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
  v87 = v121;
  v88 = v115;
  if (v86)
  {
    v89 = v86;
    v90 = 0;
    v91 = *(_QWORD *)v134;
    v118 = *(_QWORD *)v134;
    while (1)
    {
      v92 = 0;
      v119 = v89;
      do
      {
        v93 = v90;
        if (*(_QWORD *)v134 != v91)
          objc_enumerationMutation(obj);
        v94 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v92);
        contexta = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v94, "suggestion");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "clientModelId");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "isEqualToString:", v87);

        if (v97)
        {
          __atxlog_handle_timeline();
          v90 = objc_claimAutoreleasedReturnValue();

          v98 = *(void **)(*(_QWORD *)(v132 + 32) + 32);
          objc_msgSend(v94, "suggestion");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "suggestionIdentifier");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = objc_msgSend(v98, "mostRecentAbuseControlOutcomeForSuggestionId:", v100);

          if (v101 == objc_msgSend(v94, "abuseControlOutcome"))
            goto LABEL_72;
          __atxlog_handle_timeline();
          v102 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)keyExistsAndHasValidFormat = 0;
            _os_log_impl(&dword_1C9A3B000, v102, OS_LOG_TYPE_DEFAULT, "ATXInformationFilter: Abuse Control Outcome for timeline suggestion has changed", keyExistsAndHasValidFormat, 2u);
          }

          v103 = *(void **)(*(_QWORD *)(v132 + 32) + 32);
          objc_msgSend(v94, "suggestion");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "suggestionIdentifier");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "timestamp");
          objc_msgSend(v103, "addAbuseControlOutcomeForSuggestion:forTimestamp:outcome:", v104, (uint64_t)v105, objc_msgSend(v94, "abuseControlOutcome"));

        }
        else
        {
          __atxlog_handle_gi();
          v90 = objc_claimAutoreleasedReturnValue();
        }

LABEL_72:
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          v106 = v90;
          objc_msgSend(v94, "suggestion");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "suggestionIdentifier");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "suggestion");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "sourceIdentifier");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "suggestion");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "widgetBundleIdentifier");
          v128 = v90;
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "suggestion");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "startDate");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "suggestion");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "endDate");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D81238], "descriptionForOutcome:", objc_msgSend(v94, "abuseControlOutcome"));
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)keyExistsAndHasValidFormat = 138544642;
          v146 = v122;
          v147 = 2112;
          v148 = v107;
          v149 = 2112;
          v150 = v108;
          v151 = 2112;
          v152 = v110;
          v153 = 2112;
          v154 = v112;
          v155 = 2114;
          v156 = v113;
          _os_log_impl(&dword_1C9A3B000, v106, OS_LOG_TYPE_DEFAULT, "ATXInformationFilter: Abuse Control Outcome for timeline suggestion [suggestionId: %{public}@, src:%@, widget:%@, startDate:%@, endDate:%@] with reason: %{public}@.", keyExistsAndHasValidFormat, 0x3Eu);

          v91 = v118;
          v89 = v119;
          v87 = v121;

          v90 = v128;
        }
        objc_autoreleasePoolPop(contexta);
        ++v92;
      }
      while (v89 != v92);
      v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
      if (!v89)
      {

        v88 = v115;
        break;
      }
    }
  }

}

- (BOOL)_canSuggestionPassAppLaunchCheck:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  BOOL v10;

  objc_msgSend(a3, "appBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_appLaunchCountsByBundleId, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXInformationFilter _isFirstPartyApp:](self, "_isFirstPartyApp:", v4))
    v6 = 3.0;
  else
    v6 = 8.0;
  if (v5 && (objc_msgSend(v5, "doubleValue"), v7 >= v6)
    || (-[ATXInformationFilter _fetchAppLaunchCountForBundleId:](self, "_fetchAppLaunchCountForBundleId:", v4),
        v8 = objc_claimAutoreleasedReturnValue(),
        v5,
        -[NSCache setObject:forKey:](self->_appLaunchCountsByBundleId, "setObject:forKey:", v8, v4),
        (v5 = (void *)v8) != 0))
  {
    objc_msgSend(v5, "doubleValue");
    v10 = v9 >= v6;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_fetchAppLaunchCountForBundleId:(id)a3
{
  id v4;
  _ATXAppLaunchHistogram *histogram;
  void *v6;
  _ATXAppLaunchHistogram *v7;
  _ATXAppLaunchHistogram *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  histogram = self->_histogram;
  if (!histogram)
  {
    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "histogramForLaunchType:", 0);
    v7 = (_ATXAppLaunchHistogram *)objc_claimAutoreleasedReturnValue();
    v8 = self->_histogram;
    self->_histogram = v7;

    histogram = self->_histogram;
  }
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchHistogram totalLaunchesForBundleIds:](histogram, "totalLaunchesForBundleIds:", v10);
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_isFirstPartyApp:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isSystemAppForBundleId:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple."));

  return v4;
}

- (void)_populateDismissRecordsCacheAsynchronously
{
  _PASQueueLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__ATXInformationFilter__populateDismissRecordsCacheAsynchronously__block_invoke;
  v3[3] = &unk_1E82DB168;
  v3[4] = self;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v3);
}

void __66__ATXInformationFilter__populateDismissRecordsCacheAsynchronously__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "readAllDismissRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v11 = (void *)v3[1];
          objc_msgSend(v10, "widgetBundleId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v14 = (void *)objc_opt_new();
            v15 = (void *)v3[1];
            objc_msgSend(v10, "widgetBundleId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

          }
          v17 = (void *)v3[1];
          objc_msgSend(v10, "widgetBundleId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }
  }
  else
  {
    __atxlog_handle_gi();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __66__ATXInformationFilter__populateDismissRecordsCacheAsynchronously__block_invoke_cold_1();

  }
}

- (void)_removeExpiredDismissRecordsAsynchronously
{
  -[_PASQueueLock runAsyncWithLockAcquired:](self->_lock, "runAsyncWithLockAcquired:", &__block_literal_global_9);
}

void __66__ATXInformationFilter__removeExpiredDismissRecordsAsynchronously__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  v4 = (void *)v2[1];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__ATXInformationFilter__removeExpiredDismissRecordsAsynchronously__block_invoke_2;
  v6[3] = &unk_1E82DB1F8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __66__ATXInformationFilter__removeExpiredDismissRecordsAsynchronously__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ATXInformationFilter__removeExpiredDismissRecordsAsynchronously__block_invoke_3;
  v7[3] = &unk_1E82DB1D0;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(v4, "removeObjectsAtIndexes:", v6);

}

void __66__ATXInformationFilter__removeExpiredDismissRecordsAsynchronously__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v13 = v5;
  objc_msgSend(v5, "blockWidgetUntilDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "laterDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == *(void **)(a1 + 32))
  {
    objc_msgSend(v13, "blockCriterionUntilDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "laterDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);

    if (v11 == v12)
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }
  else
  {

  }
}

- (BOOL)_isSuggestionBlockedByDismiss:(id)a3 withGuardedData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)*((_QWORD *)a4 + 1);
  objc_msgSend(v5, "widgetBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v23 = v8;
      v12 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v14, "blockWidgetUntilDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "earlierDate:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 == v9)
          {
LABEL_14:
            LOBYTE(v11) = 1;
            goto LABEL_15;
          }
          objc_msgSend(v14, "blockCriterionUntilDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "earlierDate:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18 == v9)
          {
            objc_msgSend(v5, "criterion");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "criterion");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqualToString:", v20);

            if ((v21 & 1) != 0)
              goto LABEL_14;
          }
          else
          {

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v11)
          continue;
        break;
      }
LABEL_15:
      v8 = v23;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)_demoteFirstPartyDonatedSuggestionIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  ATXInformationStore *store;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "appBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
  {

  }
  else
  {
    objc_msgSend(v10, "appBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news"));

    v7 = v10;
    if (!v6)
      goto LABEL_6;
  }
  store = self->_store;
  objc_msgSend(v10, "suggestionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(store) = -[ATXInformationStore didSuggestionReachDurationLimit:](store, "didSuggestionReachDurationLimit:", v9);

  v7 = v10;
  if ((_DWORD)store)
  {
    objc_msgSend(v10, "setConfidenceLevel:", 1);
    v7 = v10;
  }
LABEL_6:

}

- (BOOL)shouldDisableRandomization:(id)a3
{
  id v4;
  ATXTimelineAbuseControlConfig *abuseControlConfig;
  void *v6;
  void *v7;
  int v8;
  ATXInformationStore *store;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  abuseControlConfig = self->_abuseControlConfig;
  objc_msgSend(v4, "widgetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXTimelineAbuseControlConfig randomizationDisabledForWidgetWithIdentifier:kind:](abuseControlConfig, "randomizationDisabledForWidgetWithIdentifier:kind:", v6, v7);

  if (v8)
  {
    store = self->_store;
    objc_msgSend(v4, "widgetBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInformationStore distinctScoresForWidget:kind:](store, "distinctScoresForWidget:kind:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v12, "count") < 2)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      objc_msgSend(v4, "relevanceScore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v13, "isEqualToNumber:", v14) ^ 1;

    }
  }

  return v8;
}

- (BOOL)stalenessRotationsAreEnabled:(id)a3
{
  id v4;
  ATXTimelineAbuseControlConfig *abuseControlConfig;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  abuseControlConfig = self->_abuseControlConfig;
  objc_msgSend(v4, "widgetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXTimelineAbuseControlConfig stalenessDisabledForWidgetWithIdentifier:kind:](abuseControlConfig, "stalenessDisabledForWidgetWithIdentifier:kind:", v6, v7);

  if (v8)
  {
    __atxlog_handle_timeline();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "widgetBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "widgetKind");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "ATXInformationFilter: Staleness rotations are not enabled for widget with bundleId: %@, widget kind: %@", (uint8_t *)&v13, 0x16u);

    }
  }

  return !v8;
}

- (int64_t)_numberOfSeenRotationsForSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  objc_msgSend(v4, "widgetBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXInformationFilter numberOfSeenRotationsForWidget:kind:intent:filterByClientModelId:](self, "numberOfSeenRotationsForWidget:kind:intent:filterByClientModelId:", v5, v6, v7, v8);

  return v9;
}

- (int64_t)numberOfSeenRotationsForWidget:(id)a3 kind:(id)a4 intent:(id)a5 filterByClientModelId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  int64_t v27;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ATXInformationStore engagementTimestampsForExtensionBundleId:kind:intent:engagementType:](self->_store, "engagementTimestampsForExtensionBundleId:kind:intent:engagementType:", v10, v11, v12, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v31 = v11;
    v32 = v10;
    v29 = v13;
    v30 = v12;
    -[ATXInformationStore proactiveRotationsForWidgetInThePastDay:kind:intent:filterByClientModelId:](self->_store, "proactiveRotationsForWidgetInThePastDay:kind:intent:filterByClientModelId:", v10, v11, v12, v13);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v33 = 0;
      v18 = *(_QWORD *)v36;
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v19);
        if (v17 >= objc_msgSend(v14, "count"))
          break;
        objc_msgSend(v20, "rotationDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "durationLimit");
        objc_msgSend(v21, "dateByAddingTimeInterval:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        while (1)
        {

          if (v17 >= objc_msgSend(v14, "count"))
            break;
          objc_msgSend(v14, "objectAtIndexedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "rotationDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "earlierDate:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24 != v21)
          {
            objc_msgSend(v21, "earlierDate:", v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = v33;
            if (v25 == v21)
              v26 = v33 + 1;
            v33 = v26;

            break;
          }
          ++v17;
        }

        if (++v19 == v16)
        {
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v33 = 0;
    }

    v11 = v31;
    v10 = v32;
    v13 = v29;
    v12 = v30;
    v27 = v33;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)_shouldBlockTimelineSuggestion:(id)a3 updatingAbuseControlOutcomes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  ATXInformationStore *store;
  void *v11;
  ATXInformationStore *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  ATXTimelineAbuseControlConfig *abuseControlConfig;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  ATXInformationStore *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  int v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  ATXTimelineAbuseControlConfig *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  ATXInformationStore *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  _BOOL4 v89;
  unint64_t v90;
  double v91;
  double v92;
  double v93;
  unint64_t v94;
  void *v95;
  double v96;
  double v97;
  unint64_t v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  NSObject *v119;
  void *v120;
  void *v121;
  void *v122;
  NSObject *v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  int64_t v134;
  void *v135;
  void *v136;
  id v138;
  _QWORD v139[4];
  id v140;
  uint64_t *v141;
  _BYTE *v142;
  double v143;
  uint64_t v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  uint8_t v152[4];
  void *v153;
  __int16 v154;
  double v155;
  __int16 v156;
  double v157;
  _BYTE buf[24];
  uint64_t v159;
  __int16 v160;
  uint64_t v161;
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v138 = a4;
  objc_msgSend(v5, "relevanceScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    __atxlog_handle_timeline();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ATXInformationFilter _shouldBlockTimelineSuggestion:updatingAbuseControlOutcomes:].cold.1();

    v18 = (void *)MEMORY[0x1E0D81238];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v18, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "addObject:", v19);

    goto LABEL_12;
  }
  objc_msgSend(v5, "relevanceScore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (v9 <= 0.0)
  {
    __atxlog_handle_timeline();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[ATXInformationFilter _shouldBlockTimelineSuggestion:updatingAbuseControlOutcomes:].cold.2();

    v21 = (void *)MEMORY[0x1E0D81238];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v21, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "addObject:", v22);

    goto LABEL_12;
  }
  store = self->_store;
  objc_msgSend(v5, "suggestionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(store) = -[ATXInformationStore rotationExistsForSuggestionWithId:considerStalenessRotation:](store, "rotationExistsForSuggestionWithId:considerStalenessRotation:", v11, 0);

  v12 = self->_store;
  if (!(_DWORD)store)
  {
    -[ATXInformationStore firstTimeAtWhichSuggestionPassedTimelineFilters:](self->_store, "firstTimeAtWhichSuggestionPassedTimelineFilters:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      __atxlog_handle_timeline();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "suggestionIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v27;
        _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (suggestion has passed before and haven't been rotated to)", buf, 0xCu);

      }
      v28 = (void *)MEMORY[0x1E0D81238];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v28, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 17);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "addObject:", v29);

      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 19);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetBundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetKind");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = -[ATXInformationFilter numberOfSeenRotationsForWidget:kind:intent:filterByClientModelId:](self, "numberOfSeenRotationsForWidget:kind:intent:filterByClientModelId:", v34, v35, v36, v136);

    abuseControlConfig = self->_abuseControlConfig;
    objc_msgSend(v5, "widgetBundleIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetKind");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[ATXTimelineAbuseControlConfig hardRotationQuotaForWidgetWithIdentifier:kind:](abuseControlConfig, "hardRotationQuotaForWidgetWithIdentifier:kind:", v38, v39);

    if ((v40 & 0x8000000000000000) == 0 && v134 >= v40)
    {
      v41 = (void *)MEMORY[0x1E0D81238];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v41, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 9);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "addObject:", v42);

      v23 = 1;
LABEL_78:

      goto LABEL_13;
    }
    v43 = self->_store;
    objc_msgSend(v5, "widgetBundleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetKind");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInformationStore mostRecentRotationRecordForWidget:kind:intent:considerStalenessRotation:filterByClientModelId:](v43, "mostRecentRotationRecordForWidget:kind:intent:considerStalenessRotation:filterByClientModelId:", v44, v45, v46, 0, v136);
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    if (v135)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "rotationDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "timeIntervalSinceDate:", v48);
      v50 = v49;

      objc_msgSend(v5, "criterion");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "criterion");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqualToString:", v52);

      if (v53)
      {
        objc_msgSend(v135, "durationLimit");
        if (v54 < v50)
        {
          objc_msgSend(v135, "coolDownInterval");
          if (v50 < v55)
            goto LABEL_31;
        }
      }
      else
      {
        objc_msgSend(v135, "coolDownInterval");
        if (v50 < v56)
        {
LABEL_31:
          v57 = (void *)MEMORY[0x1E0D81238];
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          objc_msgSend(v57, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 10);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "addObject:", v58);

          v23 = 1;
LABEL_77:

          goto LABEL_78;
        }
      }
    }
    v59 = self->_abuseControlConfig;
    objc_msgSend(v5, "widgetBundleIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetKind");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[ATXTimelineAbuseControlConfig softRotationQuotaForWidgetWithIdentifier:kind:](v59, "softRotationQuotaForWidgetWithIdentifier:kind:", v60, v61);

    if (v62 < 0)
    {
      __atxlog_handle_timeline();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "suggestionIdentifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v71;
        _os_log_impl(&dword_1C9A3B000, v70, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (unlimited soft rotation quota)", buf, 0xCu);

      }
      -[ATXInformationStore recordSuggestionPassedTimelineFiltersForTheFirstTime:](self->_store, "recordSuggestionPassedTimelineFiltersForTheFirstTime:", v5);
      v72 = (void *)MEMORY[0x1E0D81238];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v72, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 15);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "addObject:", v73);

      v23 = 0;
      goto LABEL_77;
    }
    v132 = v62;
    v63 = self->_store;
    objc_msgSend(v5, "widgetBundleIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetKind");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend((id)objc_opt_class(), "chsFamilyForTimelineRelevanceSuggestionLayoutOptions:", objc_msgSend(v5, "layouts"));
    objc_msgSend(v5, "intent");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInformationStore recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget:kind:family:intent:](v63, "recentRelevantTimelineEntriesOrderedByDescendingScoreForWidget:kind:family:intent:", v64, v65, v66, v67);
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v133, "count") <= 9)
    {
      v68 = (void *)MEMORY[0x1E0D81238];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v68, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 11);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "addObject:", v69);

      v23 = 1;
LABEL_76:

      goto LABEL_77;
    }
    objc_msgSend(v133, "firstObject");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "date");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = v75;
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v77 = v133;
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v148, v162, 16);
    if (v78)
    {
      v79 = *(_QWORD *)v149;
      v80 = v76;
      do
      {
        v81 = 0;
        v82 = v76;
        v83 = v80;
        do
        {
          if (*(_QWORD *)v149 != v79)
            objc_enumerationMutation(v77);
          v84 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v81);
          objc_msgSend(v84, "date");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "earlierDate:", v82);
          v76 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v84, "date");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "laterDate:", v83);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          ++v81;
          v82 = v76;
          v83 = v80;
        }
        while (v78 != v81);
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v148, v162, 16);
      }
      while (v78);
    }
    else
    {
      v80 = v76;
    }

    objc_msgSend(v80, "timeIntervalSinceDate:", v76);
    v88 = v87 / 86400.0;
    v89 = v87 / 86400.0 < 1.0;
    v90 = objc_msgSend(v77, "count");
    if (v89)
      v91 = 1.0;
    else
      v91 = v88;
    v92 = (double)v90 / v91;
    v93 = (double)v132 / v92;
    if (v93 >= 1.0)
    {
      __atxlog_handle_timeline();
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "suggestionIdentifier");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v108;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v92;
        *(_WORD *)&buf[22] = 2048;
        v159 = v132;
        _os_log_impl(&dword_1C9A3B000, v107, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (avgNumEntryPerDay %f < softRotationQuota %ld)", buf, 0x20u);

      }
      v109 = (void *)MEMORY[0x1E0D81238];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v109, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 16);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "addObject:", v110);

      -[ATXInformationStore recordSuggestionPassedTimelineFiltersForTheFirstTime:](self->_store, "recordSuggestionPassedTimelineFiltersForTheFirstTime:", v5);
    }
    else
    {
      v94 = objc_msgSend(v77, "count");
      objc_msgSend(v5, "relevanceScore");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "doubleValue");
      v97 = v96;

      v98 = (unint64_t)(v93 * (double)v94);
      objc_msgSend(v77, "objectAtIndexedSubscript:", v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "relevance");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "score");
      v102 = v101;

      if (v97 - v102 <= 2.22044605e-16)
      {
        if (v102 - v97 <= 2.22044605e-16)
        {
          if (-[ATXInformationFilter shouldDisableRandomization:](self, "shouldDisableRandomization:", v5, v102 - v97))
          {
            v115 = (void *)MEMORY[0x1E0D81238];
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            objc_msgSend(v115, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 23);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "addObject:", v116);

          }
          else
          {
            if (v134 < v132)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v159 = 0;
              v159 = objc_msgSend(v77, "count");
              v144 = 0;
              v145 = &v144;
              v146 = 0x2020000000;
              v147 = 0;
              v139[0] = MEMORY[0x1E0C809B0];
              v139[1] = 3221225472;
              v139[2] = __84__ATXInformationFilter__shouldBlockTimelineSuggestion_updatingAbuseControlOutcomes___block_invoke;
              v139[3] = &unk_1E82DB220;
              v143 = v102;
              v141 = &v144;
              v142 = buf;
              v140 = v77;
              objc_msgSend(v140, "enumerateObjectsUsingBlock:", v139);
              v117 = (double)(v98 - *(_QWORD *)(*(_QWORD *)&buf[8] + 24) + 1) / (double)(unint64_t)v145[3];
              v118 = v117 + (double)arc4random_uniform(0xFFFFFFFF) / -4294967300.0;
              v23 = v118 <= 2.22044605e-16;
              if (v118 <= 2.22044605e-16)
              {
                __atxlog_handle_timeline();
                v119 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v5, "suggestionIdentifier");
                  v120 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v152 = 138412802;
                  v153 = v120;
                  v154 = 2048;
                  v155 = v97;
                  v156 = 2048;
                  v157 = v117;
                  _os_log_impl(&dword_1C9A3B000, v119, OS_LOG_TYPE_DEFAULT, "Suggestion %@ failed relevance score test (score == threshold == %f, bad luck with probability %f)", v152, 0x20u);

                }
                v121 = (void *)MEMORY[0x1E0D81238];
                objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
                objc_msgSend(v121, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 13);
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v138, "addObject:", v122);

              }
              else
              {
                __atxlog_handle_timeline();
                v127 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v5, "suggestionIdentifier");
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v152 = 138412802;
                  v153 = v129;
                  v154 = 2048;
                  v155 = v97;
                  v156 = 2048;
                  v157 = v117;
                  _os_log_impl(&dword_1C9A3B000, v127, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (score == threshold == %f, good luck with probability %f)", v152, 0x20u);

                }
                v130 = (void *)MEMORY[0x1E0D81238];
                objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
                objc_msgSend(v130, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 20);
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v138, "addObject:", v131);

                -[ATXInformationStore recordSuggestionPassedTimelineFiltersForTheFirstTime:](self->_store, "recordSuggestionPassedTimelineFiltersForTheFirstTime:", v5);
              }

              _Block_object_dispose(&v144, 8);
              _Block_object_dispose(buf, 8);
              goto LABEL_75;
            }
            __atxlog_handle_timeline();
            v123 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v5, "suggestionIdentifier");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v124;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v97;
              *(_WORD *)&buf[22] = 2048;
              v159 = v134;
              v160 = 2048;
              v161 = v132;
              _os_log_impl(&dword_1C9A3B000, v123, OS_LOG_TYPE_DEFAULT, "Suggestion %@ failed relevance score test (score == threshold == %f, but numRotation %ld >= softRotationQuota %ld)", buf, 0x2Au);

            }
            v125 = (void *)MEMORY[0x1E0D81238];
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            objc_msgSend(v125, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 6);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "addObject:", v126);

          }
        }
        else
        {
          __atxlog_handle_timeline();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v5, "suggestionIdentifier");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v112;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v97;
            *(_WORD *)&buf[22] = 2048;
            v159 = *(_QWORD *)&v102;
            _os_log_impl(&dword_1C9A3B000, v111, OS_LOG_TYPE_DEFAULT, "Suggestion %@ failed relevance score test (score %f < threshold %f)", buf, 0x20u);

          }
          v113 = (void *)MEMORY[0x1E0D81238];
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          objc_msgSend(v113, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 12);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "addObject:", v114);

        }
        v23 = 1;
LABEL_75:

        goto LABEL_76;
      }
      __atxlog_handle_timeline();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "suggestionIdentifier");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v104;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v97;
        *(_WORD *)&buf[22] = 2048;
        v159 = *(_QWORD *)&v102;
        _os_log_impl(&dword_1C9A3B000, v103, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (score %f > threshold %f)", buf, 0x20u);

      }
      v105 = (void *)MEMORY[0x1E0D81238];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v105, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 19);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "addObject:", v106);

      -[ATXInformationStore recordSuggestionPassedTimelineFiltersForTheFirstTime:](self->_store, "recordSuggestionPassedTimelineFiltersForTheFirstTime:", v5);
    }
    v23 = 0;
    goto LABEL_75;
  }
  objc_msgSend(v5, "suggestionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXInformationStore didSuggestionReachDurationLimit:](v12, "didSuggestionReachDurationLimit:", v13);

  if (!v14)
  {
    __atxlog_handle_timeline();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "suggestionIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v31;
      _os_log_impl(&dword_1C9A3B000, v30, OS_LOG_TYPE_DEFAULT, "TimelineFilter: suggestion %@ passed (rotation for this suggestion exists and is within duration limit)", buf, 0xCu);

    }
    v32 = (void *)MEMORY[0x1E0D81238];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v32, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "addObject:", v33);

LABEL_21:
    v23 = 0;
    goto LABEL_13;
  }
  v15 = (void *)MEMORY[0x1E0D81238];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v15, "outcomeWithSuggestion:timestamp:abuseControlOutcome:", v5, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "addObject:", v16);

LABEL_12:
  v23 = 1;
LABEL_13:

  return v23;
}

void __84__ATXInformationFilter__shouldBlockTimelineSuggestion_updatingAbuseControlOutcomes___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "relevance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "score");
  v9 = v8;
  v10 = *(double *)(a1 + 56);

  if (v9 == v10)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v11 == objc_msgSend(*(id *)(a1 + 32), "count"))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
  objc_msgSend(v16, "relevance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "score");
  v14 = v13;
  v15 = *(double *)(a1 + 56);

  if (v14 < v15)
    *a4 = 1;

}

+ (int64_t)chsFamilyForTimelineRelevanceSuggestionLayoutOptions:(unint64_t)a3
{
  NSObject *v4;

  if ((uint64_t)a3 > 63)
  {
    if (a3 == 64)
      return 3;
    if (a3 == 128)
      return 4;
  }
  else
  {
    if (a3 == 8)
      return 1;
    if (a3 == 16)
      return 2;
  }
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    +[ATXInformationFilter chsFamilyForTimelineRelevanceSuggestionLayoutOptions:].cold.1();

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalHealthBlockList, 0);
  objc_storeStrong((id *)&self->_histogram, 0);
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appLaunchCountsByBundleId, 0);
}

void __88__ATXInformationFilter_recordDismissOfSuggestion_isDismissalLongTerm_completionHandler___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "widgetBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "criterion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXInformationFilter: failed to insert dismiss record (widget %@, criterion %@) into DB.", (uint8_t *)&v6, 0x16u);

}

- (void)filterInfoSuggestions:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "timelineRelevanceABGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "ATXInformationFilter: Enrolled in AB group '%@'", (uint8_t *)&v4, 0xCu);

}

void __66__ATXInformationFilter__populateDismissRecordsCacheAsynchronously__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "ATXInformationFilter: Error reading dismiss records from DB. Continuing with empty cache!", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldBlockTimelineSuggestion:updatingAbuseControlOutcomes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "TimelineFilter: See timelineSuggestion candidate with nil relevance. This should never happen.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldBlockTimelineSuggestion:updatingAbuseControlOutcomes:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "TimelineFilter: See timelineSuggestion candidate with non-positive score. This should never happen.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)chsFamilyForTimelineRelevanceSuggestionLayoutOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "ATXInformationFilter: Each timeline relevance suggestion is associated with a unique size of either small, medium or large. Expected a match with one of the following suggestion layouts: ATXSuggestionLayoutOption2Rows2Columns, ATXSuggestionLayoutOption2Rows4Columns, ATXSuggestionLayoutOption4Rows4Columns, or ATXSuggestionLayoutOption4Rows8Columns.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
