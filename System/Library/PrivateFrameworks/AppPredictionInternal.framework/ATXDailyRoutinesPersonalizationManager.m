@implementation ATXDailyRoutinesPersonalizationManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ATXDailyRoutinesPersonalizationManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_17 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_17, block);
  return (id)sharedInstance__pasExprOnceResult_22;
}

void __56__ATXDailyRoutinesPersonalizationManager_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_22;
  sharedInstance__pasExprOnceResult_22 = v1;

  objc_autoreleasePoolPop(v0);
}

- (BOOL)shouldDisplayDailyRoutineForContext:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  _BOOL4 v10;
  void *v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_dailyroutines();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = objc_msgSend(v4, "contextType");
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Daily routines feasibility for context type %lu requested", (uint8_t *)&v13, 0xCu);
  }

  if (!-[ATXDailyRoutinesPersonalizationManager _enoughActionHistory](self, "_enoughActionHistory"))
  {
    __atxlog_handle_dailyroutines();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v9 = "Not enough action history for requested context";
LABEL_16:
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 2u);
    }
LABEL_17:
    LOBYTE(v10) = 0;
    goto LABEL_21;
  }
  v6 = objc_msgSend(v4, "contextType");
  if (v6)
  {
    if (v6 == 1)
    {
      if ((-[ATXLocationOfInterestManagerProtocol isAvailableLocationOfInterestType:](self->_loiManager, "isAvailableLocationOfInterestType:", 0) & 1) == 0)goto LABEL_14;
      v7 = &unk_1E83D0358;
    }
    else
    {
      if (v6 == 2)
      {
        if ((-[ATXLocationOfInterestManagerProtocol isAvailableLocationOfInterestType:](self->_loiManager, "isAvailableLocationOfInterestType:", 1) & 1) != 0)
        {
          v7 = &unk_1E83D0370;
          goto LABEL_19;
        }
LABEL_14:
        __atxlog_handle_dailyroutines();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13) = 0;
          v9 = "LOI does not exist for requested context";
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      v7 = 0;
    }
  }
  else
  {
    v7 = &unk_1E83D0388;
  }
LABEL_19:
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXDailyRoutinesPersonalizationManager _allRequiredActionTypesPresent:minOccurrences:forContext:](self, "_allRequiredActionTypesPresent:minOccurrences:forContext:", v7, objc_msgSend(v11, "personalizationRequiredCountForRelevance"), v4);

  __atxlog_handle_dailyroutines();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109120;
    LODWORD(v14) = v10;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Action requirements met: %{BOOL}d", (uint8_t *)&v13, 8u);
  }
LABEL_21:

  return v10;
}

- (id)getActionPredictionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 limit:(unint64_t)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  __atxlog_handle_dailyroutines();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v32 = objc_msgSend(v12, "contextType");
    _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_INFO, "Predictions for context type %lu requested", buf, 0xCu);
  }

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {
    v18 = 0;
    if (v14)
      goto LABEL_5;
  }
  v19 = 0;
LABEL_8:
  v30 = v14;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v21 = v13;
  v22 = v12;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDailyRoutinesPersonalizationManager _getMostFrequentActionsForContext:includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:minOccurrences:limit:](self, "_getMostFrequentActionsForContext:includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:minOccurrences:limit:", v22, v18, v19, v20, v23, objc_msgSend(v24, "personalizationRequiredCountForRelevance"), a8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C48]), "initWithScoredActions:cacheFileData:consumerSubType:error:", v25, 0, 0, 0);
  return v26;
}

- (ATXDailyRoutinesPersonalizationManager)init
{
  ATXDailyRoutinesPersonalizationManager *v2;
  uint64_t v3;
  ATXContextualActionManager *actionManager;
  uint64_t v5;
  ATXLocationOfInterestManagerProtocol *loiManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXDailyRoutinesPersonalizationManager;
  v2 = -[ATXDailyRoutinesPersonalizationManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    actionManager = v2->_actionManager;
    v2->_actionManager = (ATXContextualActionManager *)v3;

    objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    loiManager = v2->_loiManager;
    v2->_loiManager = (ATXLocationOfInterestManagerProtocol *)v5;

  }
  return v2;
}

- (ATXDailyRoutinesPersonalizationManager)initWithFakeActions:(id)a3 loiManager:(id)a4
{
  id v6;
  id v7;
  ATXDailyRoutinesPersonalizationManager *v8;
  ATXContextualActionManager *v9;
  ATXContextualActionManager *actionManager;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXDailyRoutinesPersonalizationManager;
  v8 = -[ATXDailyRoutinesPersonalizationManager init](&v12, sel_init);
  if (v8)
  {
    v9 = -[ATXContextualActionManager initWithStaticActions:]([ATXContextualActionManager alloc], "initWithStaticActions:", v6);
    actionManager = v8->_actionManager;
    v8->_actionManager = v9;

    objc_storeStrong((id *)&v8->_loiManager, a4);
  }

  return v8;
}

- (id)_getMostFrequentActionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 minOccurrences:(unint64_t)a8 limit:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  float v42;
  void *v43;
  double v44;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v50 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(v15, "timeWindow");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    __atxlog_handle_dailyroutines();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[ATXDailyRoutinesPersonalizationManager _getMostFrequentActionsForContext:includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:minOccurrences:limit:].cold.1(v20);

  }
  -[ATXContextualActionManager getCountsForContext:](self->_actionManager, "getCountsForContext:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_class();
  objc_msgSend(v21, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v16;
  objc_msgSend(v22, "_filterActions:havingCounts:includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:havingMinOccurrences:", v23, v21, v16, v50, v17, v18, a8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_unpackMostFrequentActionParameters:havingCounts:limit:", v24, v21, a9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_dailyroutines();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v54 = objc_msgSend(v25, "count");
    _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_INFO, "Found %lu actions for requested context", buf, 0xCu);
  }

  if (objc_msgSend(v15, "contextType") && objc_msgSend(v25, "count") < a9)
  {
    v46 = a9 - objc_msgSend(v25, "count");
    -[ATXContextualActionManager getAllCounts](self->_actionManager, "getAllCounts");
    v27 = v24;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "allObjects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __169__ATXDailyRoutinesPersonalizationManager__getMostFrequentActionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_minOccurrences_limit___block_invoke;
    v51[3] = &unk_1E82E3E00;
    v47 = v27;
    v52 = v27;
    objc_msgSend(v29, "_pas_filteredArrayWithTest:", v51);
    v30 = v18;
    v31 = v17;
    v32 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)objc_opt_class();
    v48 = (void *)v32;
    v34 = v32;
    v17 = v31;
    v18 = v30;
    objc_msgSend(v33, "_filterActions:havingCounts:includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:havingMinOccurrences:", v34, v28, v49, v50, v17, v30, a8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_unpackMostFrequentActionParameters:havingCounts:limit:", v35, v28, v46);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_dailyroutines();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = objc_msgSend(v36, "count");
      *(_DWORD *)buf = 134217984;
      v54 = v38;
      _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_INFO, "Found %lu additional actions to suggest", buf, 0xCu);
    }

    objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v36);
    v39 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v39;
    v24 = v47;
  }
  if (objc_msgSend(v25, "count"))
  {
    v40 = 0;
    v41 = 0;
    do
    {
      v42 = (float)(unint64_t)(objc_msgSend(v25, "count") + v40);
      objc_msgSend(v25, "objectAtIndexedSubscript:", v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v44 = v42;
      objc_msgSend(v43, "setScore:", v44);

      ++v41;
      --v40;
    }
    while (v41 < objc_msgSend(v25, "count"));
  }

  return v25;
}

uint64_t __169__ATXDailyRoutinesPersonalizationManager__getMostFrequentActionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_minOccurrences_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

+ (id)_filterActions:(id)a3 havingCounts:(id)a4 includeBundleIds:(id)a5 excludeBundleIds:(id)a6 includeActionTypes:(id)a7 excludeActionTypes:(id)a8 havingMinOccurrences:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = a3;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "personalizationBlacklistedBundleIds");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __163__ATXDailyRoutinesPersonalizationManager__filterActions_havingCounts_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_havingMinOccurrences___block_invoke;
  v32[3] = &unk_1E82E3E28;
  v33 = v15;
  v34 = v23;
  v35 = v16;
  v36 = v17;
  v37 = v18;
  v38 = v14;
  v39 = a9;
  v24 = v14;
  v25 = v18;
  v26 = v17;
  v27 = v16;
  v28 = v23;
  v29 = v15;
  objc_msgSend(v20, "_pas_filteredArrayWithTest:", v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

BOOL __163__ATXDailyRoutinesPersonalizationManager__filterActions_havingCounts_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_havingMinOccurrences___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  _BOOL8 v14;

  v3 = a2;
  objc_msgSend(v3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  if (v6)
    v7 = objc_msgSend(v6, "containsObject:", v4) ^ 1;
  else
    v7 = 0;
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = *(void **)(a1 + 48);
    if (v9)
      v8 = objc_msgSend(v9, "containsObject:", v4);
    else
      v8 = 0;
  }
  v10 = *(void **)(a1 + 56);
  if (v10)
    v11 = objc_msgSend(v10, "containsObject:", v5);
  else
    v11 = 1;
  v12 = *(void **)(a1 + 64);
  if (v12)
    v13 = objc_msgSend(v12, "containsObject:", v5) ^ 1;
  else
    v13 = 1;
  v14 = 0;
  if ((v11 & ~(v7 | v8)) == 1 && v13)
    v14 = (unint64_t)objc_msgSend(*(id *)(a1 + 72), "countForObject:", v3) >= *(_QWORD *)(a1 + 80);

  return v14;
}

+ (id)_unpackMostFrequentActionParameters:(id)a3 havingCounts:(id)a4 limit:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  unint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v36 = v7;
  objc_msgSend((id)objc_opt_class(), "_rankActions:havingCounts:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1CAA48B6C]();
        *(float *)&v17 = (float)(unint64_t)objc_msgSend(v8, "countForObject:", v15);
        objc_msgSend(v15, "getContainerWithScore:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "scoredAction");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "predictedItem");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          +[_ATXActionUtils fetchDataAndUpdateContentAttributeSetForAction:](_ATXActionUtils, "fetchDataAndUpdateContentAttributeSetForAction:", v21);
          objc_msgSend(v10, "addObject:", v19);

        }
        if (objc_msgSend(v10, "count") >= a5)
        {
          objc_msgSend((id)objc_opt_class(), "_filterUnpackedActions:", v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          __atxlog_handle_dailyroutines();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = objc_msgSend(v22, "count");
            *(_DWORD *)buf = 134218240;
            v48 = v24;
            v49 = 2048;
            v50 = a5;
            _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_INFO, "Recovered action data for %lu out of up to %lu entries", buf, 0x16u);
          }

          if (objc_msgSend(v22, "count") >= a5)
          {

            objc_autoreleasePoolPop(v16);
            v10 = v22;
            goto LABEL_17;
          }
          v10 = v22;
        }

        objc_autoreleasePoolPop(v16);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_17:

  objc_msgSend((id)objc_opt_class(), "_filterUnpackedActions:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_dailyroutines();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = objc_msgSend(v25, "count");
    *(_DWORD *)buf = 134218240;
    v48 = v27;
    v49 = 2048;
    v50 = a5;
    _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_INFO, "Recovered action data for %lu out of up to %lu entries", buf, 0x16u);
  }

  v28 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v29 = v25;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "scoredAction");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v31);
  }

  return v28;
}

+ (id)_rankActions:(id)a3 havingCounts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__ATXDailyRoutinesPersonalizationManager__rankActions_havingCounts___block_invoke;
  v9[3] = &unk_1E82DBFF8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __68__ATXDailyRoutinesPersonalizationManager__rankActions_havingCounts___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 > v8)
    return -1;
  else
    return v7 < v8;
}

+ (id)_filterUnpackedActions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[ATXActionPredictionsProcessor removeDuplicateActionPredictions:](ATXActionPredictionsProcessor, "removeDuplicateActionPredictions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionPredictionsProcessor removeMissingOrBlockedRecipientPredictions:](ATXActionPredictionsProcessor, "removeMissingOrBlockedRecipientPredictions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_enoughActionHistory
{
  void *v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)objc_msgSend(v3, "personalizationRequiredActionHistorySeconds");

  -[ATXContextualActionManager getIntervalSinceOldestEvent](self->_actionManager, "getIntervalSinceOldestEvent");
  v6 = v5;
  __atxlog_handle_dailyroutines();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 < v4)
  {
    if (v8)
    {
      v11 = 134218240;
      v12 = (unint64_t)v6;
      v13 = 2048;
      v14 = (unint64_t)v4;
      v9 = "Not enough action history for requested context (got %lu (s) < %lu (s))";
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    v11 = 134218240;
    v12 = (unint64_t)v6;
    v13 = 2048;
    v14 = (unint64_t)v4;
    v9 = "Action history is old enough (got %lu (s) >= %lu (s))";
LABEL_6:
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x16u);
  }

  return v6 >= v4;
}

- (BOOL)_allRequiredActionTypesPresent:(id)a3 minOccurrences:(unint64_t)a4 forContext:(id)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  BOOL v31;
  id v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  __atxlog_handle_dailyroutines();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v41 = v6;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "Action types required: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    -[ATXContextualActionManager getAllCounts](self->_actionManager, "getAllCounts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E60];
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "personalizationBlacklistedBundleIds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v16)
    {
      v17 = v16;
      v33 = v6;
      v18 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          __atxlog_handle_dailyroutines();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v20, "bundleId");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v41 = v22;
            _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_INFO, "Processing action for %@", buf, 0xCu);

          }
          objc_msgSend(v20, "bundleId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v14, "containsObject:", v23);

          if (v24)
          {
            __atxlog_handle_dailyroutines();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_INFO, "Skipping this blacklisted action", buf, 2u);
            }

          }
          else
          {
            if (objc_msgSend(v15, "countForObject:", v20) >= a4)
            {
              objc_msgSend(v20, "actionType");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = -[NSObject containsObject:](v8, "containsObject:", v26);

              if (v27)
              {
                __atxlog_handle_dailyroutines();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v20, "actionType");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v41 = v29;
                  _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_INFO, "Action type count requirement met: %@", buf, 0xCu);

                }
              }
              objc_msgSend(v20, "actionType", v33);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject removeObject:](v8, "removeObject:", v30);

            }
            if (!-[NSObject count](v8, "count", v33))
            {
              v31 = 1;
              goto LABEL_28;
            }
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v17)
          continue;
        break;
      }
      v31 = 0;
LABEL_28:
      v6 = v33;
    }
    else
    {
      v31 = 0;
    }

  }
  else if (v9)
  {
    *(_WORD *)buf = 0;
    v31 = 1;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "No action types required", buf, 2u);
  }
  else
  {
    v31 = 1;
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loiManager, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

- (void)_getMostFrequentActionsForContext:(os_log_t)log includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:minOccurrences:limit:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Context has custom time window provided, but we are ignoring it!", v1, 2u);
}

@end
