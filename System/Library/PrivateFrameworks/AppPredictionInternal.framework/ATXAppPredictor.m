@implementation ATXAppPredictor

float __77___ATXAppPredictor__copyValidScoreInputsFromPredictionItem_toPredictionItem___block_invoke(uint64_t a1, unint64_t a2)
{
  double v2;

  v2 = *(float *)(*(_QWORD *)(a1 + 32) + 4 * a2 + 16);
  if (v2 != -31337.0)
    *(float *)&v2 = ATXSetInput(*(_QWORD *)(a1 + 40), a2, v2);
  return *(float *)&v2;
}

float __119___ATXAppPredictor__getPredictionForItems_clipBundleIdsToRank_consumerSubType_intent_scoreLogger_context_featureCache___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  double v6;
  uint64_t v7;
  uint64_t v8;
  float result;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(_QWORD *)(v3 + 48);
  if (0xDAB7EC1DD3431B57 * ((*(_QWORD *)(v3 + 56) - v4) >> 5) <= a2
    || (objc_msgSend(*(id *)(a1 + 32), "_predictionScoreAndUpdateConfidenceForItem:interpreter:consumerSubType:scoreLogger:intentType:", v4 + 3296 * a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)), v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8), v8 = *(_QWORD *)(v7 + 48), 0xDAB7EC1DD3431B57 * ((*(_QWORD *)(v7 + 56) - v8) >> 5) <= a2))
  {
    std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
  }
  result = v6;
  *(float *)(v8 + 3296 * a2 + 3284) = result;
  return result;
}

void __49___ATXAppPredictor_inputScoresForPredictionItem___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(float *)(*(_QWORD *)(a1 + 40) + 4 * a2 + 16);
  +[_ATXScoreTypes stringForScoreInput:](_ATXScoreTypes, "stringForScoreInput:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScore:forKey:", v3);

}

uint64_t __32___ATXAppPredictor_initInternal__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_initAppLaunchAndInstallMonitors");
  objc_msgSend(*(id *)(a1 + 32), "_initDependencies");
  return objc_msgSend(*(id *)(a1 + 32), "_initFeaturizers");
}

void __36___ATXAppPredictor__updateFromAsset__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "abGroupIdentifierForConsumerSubType:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupNilString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

uint64_t __60___ATXAppPredictor__addZeroDayAppIntentKeysToBundleIdTable___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "intern:", a2);
}

void __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke(uint64_t a1)
{
  unsigned __int8 v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ATXPredictionContextBuilder *v7;
  uint64_t v8;
  void *v9;
  _ATXAppLaunchMonitor *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  ATXAppIntentMonitor *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  _ATXAppInstallMonitor *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 136));
  if ((v1 & 1) == 0)
  {
    +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

    v7 = objc_alloc_init(ATXPredictionContextBuilder);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 72);
    *(_QWORD *)(v8 + 72) = v7;

    v10 = [_ATXAppLaunchMonitor alloc];
    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXAppLaunchSequenceManager sharedInstance](_ATXAppLaunchSequenceManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    v16 = (void *)objc_opt_new();
    v17 = -[_ATXAppLaunchMonitor initWithAppInfoManager:appLaunchHistogramManager:appLaunchSequenceManager:appDailyDose:duetHelper:contextBuilder:tracker:](v10, "initWithAppInfoManager:appLaunchHistogramManager:appLaunchSequenceManager:appDailyDose:duetHelper:contextBuilder:tracker:", v3, v11, v12, v13, v14, v15, v16);
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 80);
    *(_QWORD *)(v18 + 80) = v17;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "start");
    __atxlog_handle_app_prediction();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke_cold_2();

    +[ATXAppLaunchLogger sharedInstance](ATXAppLaunchLogger, "sharedInstance");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 104);
    *(_QWORD *)(v22 + 104) = v21;

    v24 = objc_opt_new();
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 48);
    *(_QWORD *)(v25 + 48) = v24;

    v27 = [ATXAppIntentMonitor alloc];
    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXAppLaunchSequenceManager sharedInstance](_ATXAppLaunchSequenceManager, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[ATXAppIntentMonitor initWithAppLaunchHistogramManager:appInfoManager:appActionLaunchSequenceManager:dataStore:](v27, "initWithAppLaunchHistogramManager:appInfoManager:appActionLaunchSequenceManager:dataStore:", v28, v3, v29, v30);
    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(void **)(v32 + 88);
    *(_QWORD *)(v32 + 88) = v31;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "start");
    __atxlog_handle_default();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), v3);
    v35 = -[_ATXAppInstallMonitor initWithAppInfoManager:]([_ATXAppInstallMonitor alloc], "initWithAppInfoManager:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
    v36 = *(_QWORD *)(a1 + 32);
    v37 = *(void **)(v36 + 96);
    *(_QWORD *)(v36 + 96) = v35;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "start");
    v38 = -[_ATXRecentInstallCache initTrackingAppsMoreRecentThan:]([_ATXRecentInstallCache alloc], "initTrackingAppsMoreRecentThan:", 300.0);
    v39 = *(_QWORD *)(a1 + 32);
    v40 = *(void **)(v39 + 64);
    *(_QWORD *)(v39 + 64) = v38;

    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 136));
    v41 = objc_opt_new();
    v42 = *(_QWORD *)(a1 + 32);
    v43 = *(void **)(v42 + 168);
    *(_QWORD *)(v42 + 168) = v41;

  }
}

void __37___ATXAppPredictor__initDependencies__block_invoke(uint64_t a1)
{
  unsigned __int8 v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 137));
  if ((v1 & 1) == 0)
  {
    v3 = objc_opt_new();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = v3;

    v6 = objc_opt_new();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 208);
    *(_QWORD *)(v7 + 208) = v6;

    +[ATXBBNotificationManager sharedInstance](ATXBBNotificationManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 120);
    *(_QWORD *)(v10 + 120) = v9;

    v12 = objc_opt_new();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 184);
    *(_QWORD *)(v13 + 184) = v12;

    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 137));
  }
}

uint64_t __43___ATXAppPredictor_resetRecentInstallCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "reset");
}

void __200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  double v43;
  uint64_t v44;
  double v45;
  char **v46;
  uint64_t v47;
  void *v48;
  ATXAppPredictorPredictionChunks *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  unsigned __int8 v55;
  NSObject *v56;
  char v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  _QWORD block[5];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t *v72;
  uint8_t buf[24];
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  unint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 144);
  v4 = *(id **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4[19], "disabledBundleIds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDigitalHealthBlacklist sharedInstance](ATXDigitalHealthBlacklist, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blacklistedBundleIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_appsToPredictWithConsumerSubType:intent:candidateBundleIdentifiers:allSBApps:appPredictionBlacklist:digitalHealthBlacklist:", v2, v3, v5, v6, v7, v9);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", *(unsigned __int8 *)(a1 + 144)) == 8)
  {
    +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 64);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 64));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:](_ATXActionUtils, "actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:", v63, v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeysFilteredBy:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
  }
  else
  {
    objc_msgSend(v63, "allObjects");
    v14 = objc_claimAutoreleasedReturnValue();
    if (+[ATXHeroClipManager clipsSupported](ATXHeroClipManager, "clipsSupported"))
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      objc_msgSend(MEMORY[0x1E0D10838], "appClips");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v69 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "bundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v19);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
        }
        while (v16);
      }

    }
    else
    {
      __atxlog_handle_hero();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "Not predicting installed App Clips, since not allowed by MCProfileConnection", buf, 2u);
      }

    }
    v21 = (void *)v14;
  }
  +[_ATXAppPredictor pruneItemsToRankForConsumerSubType:itemsToRank:datastore:](_ATXAppPredictor, "pruneItemsToRankForConsumerSubType:itemsToRank:datastore:", *(unsigned __int8 *)(a1 + 144), v21, *(_QWORD *)(a1 + 72));
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *(void **)(a1 + 32);
  if (v23)
    objc_msgSend(v23, "_getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:", v64, v10, *(unsigned __int8 *)(a1 + 144), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
  else
    memset(buf, 0, sizeof(buf));
  v24 = *(_QWORD *)(a1 + 112);
  std::vector<ATXPredictionItem>::__vdeallocate((id **)v24);
  *(_OWORD *)v24 = *(_OWORD *)buf;
  *(_QWORD *)(v24 + 16) = *(_QWORD *)&buf[16];
  memset(buf, 0, sizeof(buf));
  v72 = buf;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v72);
  __atxlog_handle_default();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 144));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v64, "count");
    v30 = objc_msgSend(v10, "count");
    v31 = 0xDAB7EC1DD3431B57 * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) - **(_QWORD **)(a1 + 112)) >> 5);
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v28;
    *(_WORD *)&buf[22] = 2050;
    v74 = v29;
    v75 = 2050;
    v76 = v30;
    v77 = 2050;
    v78 = v31;
    _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ - finished app predictions for consumerSubType: %{public}@, num app candidates: %{public}lu, num clip candidates: %{public}lu, num predicted items: %{public}lu", buf, 0x34u);

  }
  v65 = objc_alloc_init(MEMORY[0x1E0CF9068]);
  v32 = objc_alloc(MEMORY[0x1E0CF8E40]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "objectAtIndexedSubscript:", *(unsigned __int8 *)(a1 + 144));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithABGroup:assetVersion:", v33, objc_msgSend(MEMORY[0x1E0CF8CF0], "version"));

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "histogramForLaunchType:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = *(_QWORD *)(a1 + 120);
  if (v37 && *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) != **(_QWORD **)(a1 + 112))
  {
    v38 = 0;
    v39 = 0;
    v40 = 3284;
    do
    {
      v41 = (void *)MEMORY[0x1CAA48B6C]();
      v42 = *(id *)(**(_QWORD **)(a1 + 112) + v40 - 3284);
      if (objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", *(unsigned __int8 *)(a1 + 144)) == 8
        || ATXShouldPredictBundle(*(void **)(*(_QWORD *)(a1 + 32) + 176), v42, v36))
      {
        if (v42)
        {
          LODWORD(v43) = *(_DWORD *)(**(_QWORD **)(a1 + 112) + v40);
          objc_msgSend(v65, "recordPrediction:score:", v42, v43);
          v44 = **(_QWORD **)(a1 + 112) + v40;
          LODWORD(v45) = *(_DWORD *)v44;
          objc_msgSend(v34, "recordPrediction:actionHash:totalScore:scoreInputs:isMediumConfidenceForBlendingLayer:isHighConfidenceForBlendingLayer:", v42, 0, v44 - 3268, *(unsigned __int8 *)(v44 + 4), *(unsigned __int8 *)(v44 + 5), v45);
        }
        ++v38;
      }

      objc_autoreleasePoolPop(v41);
      v37 = *(_QWORD *)(a1 + 120);
      if (v37 <= v38)
        break;
      ++v39;
      v40 += 3296;
    }
    while (0xDAB7EC1DD3431B57 * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) - **(_QWORD **)(a1 + 112)) >> 5) > v39);
  }
  v46 = *(char ***)(a1 + 128);
  if (v46)
  {
    v47 = *(_QWORD *)(a1 + 112);
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    ATXKeepRandomPredictionItemsBelowLimit(v47, v37, v46, (int)objc_msgSend(v48, "numberOfRandomAppActionTypesToKeepForLogging"));

  }
  v49 = [ATXAppPredictorPredictionChunks alloc];
  objc_msgSend(v65, "finish");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "finish");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[ATXAppPredictorPredictionChunks initWithPredictionSetChunk:feedbackStateChunk:](v49, "initWithPredictionSetChunk:feedbackStateChunk:", v50, v51);
  v53 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v54 = *(void **)(v53 + 40);
  *(_QWORD *)(v53 + 40) = v52;

  if (objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", *(unsigned __int8 *)(a1 + 144)) != 8)
  {
    v55 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 136));
    if ((v55 & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "allAppsWithInstallDate");
      v56 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v56, "count"))
      {
LABEL_45:

        goto LABEL_46;
      }
      v57 = _ZZZ200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache__EUb_E23hasRunFirstTimeTraining;

      if ((v57 & 1) == 0)
      {
        _ZZZ200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache__EUb_E23hasRunFirstTimeTraining = 1;
        __atxlog_handle_default();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v58, OS_LOG_TYPE_INFO, "Since app prediction expert has never been trained, training in background.", buf, 2u);
        }

        sel_getName(*(SEL *)(a1 + 136));
        v59 = (void *)os_transaction_create();
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v60 = objc_claimAutoreleasedReturnValue();
        dispatch_queue_attr_make_with_qos_class(v60, QOS_CLASS_BACKGROUND, 0);
        v56 = objc_claimAutoreleasedReturnValue();

        v61 = dispatch_queue_create("ATXAppPrediction-initialTrain", v56);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache___block_invoke_130;
        block[3] = &unk_1E82E82E0;
        block[4] = *(_QWORD *)(a1 + 32);
        v67 = v59;
        v62 = v59;
        dispatch_async(v61, block);

        goto LABEL_45;
      }
    }
  }
LABEL_46:

}

id __200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache___block_invoke_130(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(*(id *)(a1 + 32), "train");
  objc_autoreleasePoolPop(v2);
  return (id)objc_opt_self();
}

id __161___ATXAppPredictor_receiveFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "objectAtIndexedSubscript:", *(unsigned __int8 *)(a1 + 112));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(unsigned __int8 *)(a1 + 112);
  +[ATXAppPredictionFeedbackItem feedbackItemsForResponse:](ATXAppPredictionFeedbackItem, "feedbackItemsForResponse:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAppPredictorFeedback receiveFeedbackForConsumerType:consumerSubType:feedbackItemsForResponse:engagementType:engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:abGroupIdentifier:context:](ATXAppPredictorFeedback, "receiveFeedbackForConsumerType:consumerSubType:feedbackItemsForResponse:engagementType:engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:abGroupIdentifier:context:", v6, v7, v8, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(a1 + 72));

  objc_autoreleasePoolPop(v5);
  return (id)objc_opt_self();
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  ATXPredictionDataHistograms *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  NSObject *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  uint8_t buf[4];
  const char *v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Training app prediction expert", buf, 2u);
  }

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 136446210;
    v110 = "TOP_LEVEL";
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }

  v10 = (void *)os_transaction_create();
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_INFO, "Checking data store integrity", buf, 2u);
  }

  objc_msgSend(v3, "integrityCheckOrAbort");
  __atxlog_handle_default();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "Check for actions without titles", buf, 2u);
  }

  objc_msgSend(v3, "removeActionsWithoutTitle");
  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_5();

  v14 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(*(id *)(a1 + 32), "appInstallMonitor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "train");

  objc_autoreleasePoolPop(v14);
  if (objc_msgSend(*(id *)(a1 + 40), "didDefer"))
  {
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "App prediction training deferring after app install monitor training";
LABEL_29:
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  __atxlog_handle_default();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_4();

  v19 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "train");
  objc_autoreleasePoolPop(v19);
  if (!objc_msgSend(*(id *)(a1 + 40), "didDefer"))
  {
    v20 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "train");
    objc_autoreleasePoolPop(v20);
    if (objc_msgSend(*(id *)(a1 + 40), "didDefer"))
    {
      __atxlog_handle_default();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v17 = "App prediction training deferring after micro location training";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    v21 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "train");
    objc_autoreleasePoolPop(v21);
    if (objc_msgSend(*(id *)(a1 + 40), "didDefer"))
    {
      __atxlog_handle_default();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v17 = "App prediction training deferring after app daily dose training";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    v22 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "train");
    objc_autoreleasePoolPop(v22);
    if (objc_msgSend(*(id *)(a1 + 40), "didDefer"))
    {
      __atxlog_handle_default();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v17 = "App prediction training deferring after app info manager training";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    __atxlog_handle_default();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_3();

    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    +[_ATXAppLaunchSequenceManager sharedInstance](_ATXAppLaunchSequenceManager, "sharedInstance");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[ATXPredictionDataHistograms initWithAppInfoManager:bundleIdTable:launchSequenceManager:histogramManager:]([ATXPredictionDataHistograms alloc], "initWithAppInfoManager:bundleIdTable:launchSequenceManager:histogramManager:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), v107, v108, v16);
    -[ATXPredictionDataHistograms verifyHistograms](v24, "verifyHistograms");
    if (objc_msgSend(*(id *)(a1 + 40), "didDefer"))
    {
      __atxlog_handle_default();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v26 = "App prediction training deferring after histogram verification";
LABEL_50:
        _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
      }
    }
    else
    {
      -[ATXPredictionDataHistograms appLaunchHistogram](v24, "appLaunchHistogram", v107);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appLaunchDecayHalflife");
      objc_msgSend(v27, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms spotlightLaunchHistogram](v24, "spotlightLaunchHistogram");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "spotlightLaunchDecayHalflife");
      objc_msgSend(v28, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homescreenLaunchHistogram](v24, "homescreenLaunchHistogram");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homescreenLaunchDecayHalflife");
      objc_msgSend(v29, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryLaunchHistogram](v24, "appDirectoryLaunchHistogram");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryLaunchDecayHalflife");
      objc_msgSend(v30, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms airplaneModeLaunchHistogram](v24, "airplaneModeLaunchHistogram");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "airplaneModeLaunchDecayHalflife");
      objc_msgSend(v31, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms trendingLaunchHistogram](v24, "trendingLaunchHistogram");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "trendingLaunchDecayHalflife");
      objc_msgSend(v32, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms wifiLaunchHistogram](v24, "wifiLaunchHistogram");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "wifiSSIDLaunchDecayHalflife");
      objc_msgSend(v33, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms coreMotionLaunchHistogram](v24, "coreMotionLaunchHistogram");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "coreMotionLaunchDecayHalflife");
      objc_msgSend(v34, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms timeAndDayHistogram](v24, "timeAndDayHistogram");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeAndDayAppLaunchesDecayHalflife");
      objc_msgSend(v35, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms notificationsHistoryHistogram](v24, "notificationsHistoryHistogram");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationsHistoryDecayHalflife");
      objc_msgSend(v36, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appCoarseTimePOWLocationLaunchesHistogram](v24, "appCoarseTimePOWLocationLaunchesHistogram");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appAndActionCoarseTimePowLocationDecayHalflife");
      objc_msgSend(v37, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appSpecificTimeDOWLocationLaunchesHistogram](v24, "appSpecificTimeDOWLocationLaunchesHistogram");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appAndActionSpecificTimePowLocationDecayHalflife");
      objc_msgSend(v38, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appCoarseTimePOWLocationConfirmsHistogram](v24, "appCoarseTimePOWLocationConfirmsHistogram");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appAndActionCoarseTimePowLocationDecayHalflife");
      objc_msgSend(v39, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appSpecificTimeDOWLocationConfirmsHistogram](v24, "appSpecificTimeDOWLocationConfirmsHistogram");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appAndActionSpecificTimePowLocationDecayHalflife");
      objc_msgSend(v40, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appCoarseTimePOWLocationRejectsHistogram](v24, "appCoarseTimePOWLocationRejectsHistogram");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appAndActionCoarseTimePowLocationDecayHalflife");
      objc_msgSend(v41, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appSpecificTimeDOWLocationRejectsHistogram](v24, "appSpecificTimeDOWLocationRejectsHistogram");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appAndActionSpecificTimePowLocationDecayHalflife");
      objc_msgSend(v42, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appSpecificGeoHashHistogram](v24, "appSpecificGeoHashHistogram");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appSpecificGeoHashDecayHalflife");
      objc_msgSend(v43, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appCoarseGeoHashHistogram](v24, "appCoarseGeoHashHistogram");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appCoarseGeoHashDecayHalflife");
      objc_msgSend(v44, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appZoom7GeoHashHistogram](v24, "appZoom7GeoHashHistogram");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appZoom7GeoHashDecayHalflife");
      objc_msgSend(v45, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appLaunchesTwoHourTimeInterval](v24, "appLaunchesTwoHourTimeInterval");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appLaunchesTwoHourTimeIntervalDecayHalflife");
      objc_msgSend(v46, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appConfirmsTwoHourTimeInterval](v24, "appConfirmsTwoHourTimeInterval");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appConfirmsTwoHourTimeIntervalDecayHalflife");
      objc_msgSend(v47, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appRejectsTwoHourTimeInterval](v24, "appRejectsTwoHourTimeInterval");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appRejectsTwoHourTimeIntervalDecayHalflife");
      objc_msgSend(v48, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appConfirmsDayOfWeek](v24, "appConfirmsDayOfWeek");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appConfirmsDayOfWeekDecayHalflife");
      objc_msgSend(v49, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appRejectsDayOfWeek](v24, "appRejectsDayOfWeek");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appRejectsDayOfWeekDecayHalflife");
      objc_msgSend(v50, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appConfirmsCoarseGeoHash](v24, "appConfirmsCoarseGeoHash");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appConfirmsCoarseGeoHashDecayHalflife");
      objc_msgSend(v51, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appRejectsCoarseGeoHash](v24, "appRejectsCoarseGeoHash");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appRejectsCoarseGeoHashDecayHalflife");
      objc_msgSend(v52, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appConfirmsSpecificGeoHash](v24, "appConfirmsSpecificGeoHash");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appConfirmsSpecificGeoHashDecayHalflife");
      objc_msgSend(v53, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appRejectsSpecificGeoHash](v24, "appRejectsSpecificGeoHash");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appRejectsSpecificGeoHashDecayHalflife");
      objc_msgSend(v54, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appExplicitRejectsCoarseTimePOWLocationHistogram](v24, "appExplicitRejectsCoarseTimePOWLocationHistogram");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appExplicitRejectsCoarseTimePOWLocationDecayHalflife");
      objc_msgSend(v55, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appClipsFeedbackHistogram](v24, "appClipsFeedbackHistogram");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appClipsFeedbackHistogramHalfLifeInDays");
      objc_msgSend(v56, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms unlockTimeHistogram](v24, "unlockTimeHistogram");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unlockTimeDecayHalflife");
      objc_msgSend(v57, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms dayOfWeekLaunchHistogram](v24, "dayOfWeekLaunchHistogram");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dayOfWeekLaunchDecayHalflife");
      objc_msgSend(v58, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppConfirmsCoarseTimePOWLocationHistogram](v24, "homeScreenAppConfirmsCoarseTimePOWLocationHistogram");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppConfirmsCoarseTimePOWLocationDecayHalflife");
      objc_msgSend(v59, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppConfirmsSpecificTimeDOWLocationHistogram](v24, "homeScreenAppConfirmsSpecificTimeDOWLocationHistogram");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppConfirmsSpecificTimeDOWLocationDecayHalflife");
      objc_msgSend(v60, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppConfirmsTwoHourTimeIntervalHistogram](v24, "homeScreenAppConfirmsTwoHourTimeIntervalHistogram");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppConfirmsTwoHourTimeIntervalDecayHalflife");
      objc_msgSend(v61, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppConfirmsDayOfWeekHistogram](v24, "homeScreenAppConfirmsDayOfWeekHistogram");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppConfirmsDayOfWeekDecayHalflife");
      objc_msgSend(v62, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppConfirmsCoarseGeohashHistogram](v24, "homeScreenAppConfirmsCoarseGeohashHistogram");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppConfirmsCoarseGeohashDecayHalflife");
      objc_msgSend(v63, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppConfirmsSpecificGeohashHistogram](v24, "homeScreenAppConfirmsSpecificGeohashHistogram");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppConfirmsSpecificGeohashDecayHalflife");
      objc_msgSend(v64, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppRejectsCoarseTimePOWLocationHistogram](v24, "homeScreenAppRejectsCoarseTimePOWLocationHistogram");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppRejectsCoarseTimePOWLocationDecayHalflife");
      objc_msgSend(v65, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppRejectsSpecificTimeDOWLocationHistogram](v24, "homeScreenAppRejectsSpecificTimeDOWLocationHistogram");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppRejectsSpecificTimeDOWLocationDecayHalflife");
      objc_msgSend(v66, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppRejectsTwoHourTimeIntervalHistogram](v24, "homeScreenAppRejectsTwoHourTimeIntervalHistogram");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppRejectsTwoHourTimeIntervalDecayHalflife");
      objc_msgSend(v67, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppRejectsDayOfWeekHistogram](v24, "homeScreenAppRejectsDayOfWeekHistogram");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppRejectsDayOfWeekDecayHalflife");
      objc_msgSend(v68, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppRejectsCoarseGeohashHistogram](v24, "homeScreenAppRejectsCoarseGeohashHistogram");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppRejectsCoarseGeohashDecayHalflife");
      objc_msgSend(v69, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppRejectsSpecificGeohashHistogram](v24, "homeScreenAppRejectsSpecificGeohashHistogram");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppRejectsSpecificGeohashDecayHalflife");
      objc_msgSend(v70, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram](v24, "homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "homeScreenAppExplicitRejectsCoarseTimePOWLocationDecayHalflife");
      objc_msgSend(v71, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryConfirmsCoarseTimePOWLocationHistogram](v24, "appDirectoryConfirmsCoarseTimePOWLocationHistogram");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryConfirmsCoarseTimePOWLocationDecayHalflife");
      objc_msgSend(v72, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryConfirmsSpecificTimeDOWLocationHistogram](v24, "appDirectoryConfirmsSpecificTimeDOWLocationHistogram");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryConfirmsSpecificTimeDOWLocationDecayHalflife");
      objc_msgSend(v73, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryConfirmsTwoHourTimeIntervalHistogram](v24, "appDirectoryConfirmsTwoHourTimeIntervalHistogram");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryConfirmsTwoHourTimeIntervalDecayHalflife");
      objc_msgSend(v74, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryConfirmsDayOfWeekHistogram](v24, "appDirectoryConfirmsDayOfWeekHistogram");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryConfirmsDayOfWeekDecayHalflife");
      objc_msgSend(v75, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryConfirmsCoarseGeohashHistogram](v24, "appDirectoryConfirmsCoarseGeohashHistogram");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryConfirmsCoarseGeohashDecayHalflife");
      objc_msgSend(v76, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryConfirmsSpecificGeohashHistogram](v24, "appDirectoryConfirmsSpecificGeohashHistogram");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryConfirmsSpecificGeohashDecayHalflife");
      objc_msgSend(v77, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryRejectsCoarseTimePOWLocationHistogram](v24, "appDirectoryRejectsCoarseTimePOWLocationHistogram");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryRejectsCoarseTimePOWLocationDecayHalflife");
      objc_msgSend(v78, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryRejectsSpecificTimeDOWLocationHistogram](v24, "appDirectoryRejectsSpecificTimeDOWLocationHistogram");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryRejectsSpecificTimeDOWLocationDecayHalflife");
      objc_msgSend(v79, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryRejectsTwoHourTimeIntervalHistogram](v24, "appDirectoryRejectsTwoHourTimeIntervalHistogram");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryRejectsTwoHourTimeIntervalDecayHalflife");
      objc_msgSend(v80, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryRejectsDayOfWeekHistogram](v24, "appDirectoryRejectsDayOfWeekHistogram");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryRejectsDayOfWeekDecayHalflife");
      objc_msgSend(v81, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryRejectsCoarseGeohashHistogram](v24, "appDirectoryRejectsCoarseGeohashHistogram");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryRejectsCoarseGeohashDecayHalflife");
      objc_msgSend(v82, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryRejectsSpecificGeohashHistogram](v24, "appDirectoryRejectsSpecificGeohashHistogram");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryRejectsSpecificGeohashDecayHalflife");
      objc_msgSend(v83, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram](v24, "appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDirectoryExplicitRejectsCoarseTimePOWLocationDecayHalflife");
      objc_msgSend(v84, "decayWithHalfLifeInDays:");

      objc_msgSend(v4, "launchSequenceDecayHalflife");
      objc_msgSend(v108, "decayAllLaunchSequencesWithHalfLifeInDays:");
      objc_msgSend(v4, "appActionLaunchSequenceDecayHalflife");
      objc_msgSend(v108, "decayAllAppActionLaunchSequencesWithHalfLifeInDays:");
      -[ATXPredictionDataHistograms appIntentLaunchHistogram](v24, "appIntentLaunchHistogram");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionLaunchDecayHalflife");
      objc_msgSend(v85, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appIntentAirplaneModeLaunchHistogram](v24, "appIntentAirplaneModeLaunchHistogram");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionAirplaneModeLaunchDecayHalflife");
      objc_msgSend(v86, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appIntentTrendingLaunchHistogram](v24, "appIntentTrendingLaunchHistogram");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionTrendingLaunchDecayHalflife");
      objc_msgSend(v87, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appIntentWifiHistogram](v24, "appIntentWifiHistogram");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionWifiSSIDLaunchDecayHalflife");
      objc_msgSend(v88, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appIntentCoreMotionLaunchHistogram](v24, "appIntentCoreMotionLaunchHistogram");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionCoreMotionLaunchDecayHalflife");
      objc_msgSend(v89, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appIntentUnlockTimeHistogram](v24, "appIntentUnlockTimeHistogram");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionUnlockTimeDecayHalflife");
      objc_msgSend(v90, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appIntentDayOfWeekHistogram](v24, "appIntentDayOfWeekHistogram");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionDayOfWeekLaunchDecayHalflife");
      objc_msgSend(v91, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appForAllIntentsLaunchHistogram](v24, "appForAllIntentsLaunchHistogram");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionLaunchDecayHalflife");
      objc_msgSend(v92, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appForAllIntentsAirplaneModeLaunchHistogram](v24, "appForAllIntentsAirplaneModeLaunchHistogram");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionAirplaneModeLaunchDecayHalflife");
      objc_msgSend(v93, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appForAllIntentsTrendingLaunchHistogram](v24, "appForAllIntentsTrendingLaunchHistogram");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionTrendingLaunchDecayHalflife");
      objc_msgSend(v94, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appForAllIntentsWifiHistogram](v24, "appForAllIntentsWifiHistogram");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionWifiSSIDLaunchDecayHalflife");
      objc_msgSend(v95, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appForAllIntentsUnlockTimeHistogram](v24, "appForAllIntentsUnlockTimeHistogram");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionUnlockTimeDecayHalflife");
      objc_msgSend(v96, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appForAllIntentsDayOfWeekHistogram](v24, "appForAllIntentsDayOfWeekHistogram");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionDayOfWeekLaunchDecayHalflife");
      objc_msgSend(v97, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms appForAllIntentsCoreMotionLaunchHistogram](v24, "appForAllIntentsCoreMotionLaunchHistogram");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appActionCoreMotionLaunchDecayHalflife");
      objc_msgSend(v98, "decayWithHalfLifeInDays:");

      -[ATXPredictionDataHistograms poiCategoryHistogram](v24, "poiCategoryHistogram");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "poiCategoryDecayHalfLife");
      objc_msgSend(v99, "decayWithHalfLifeInDays:");

      __atxlog_handle_default();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
        __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_2();

      +[_ATXFeedback sharedInstance](_ATXFeedback, "sharedInstance");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "decayCounts");

      +[ATXActionFeedback sharedInstance](ATXActionFeedback, "sharedInstance");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "decayCounts");

      if (objc_msgSend(*(id *)(a1 + 40), "didDefer"))
      {
        __atxlog_handle_default();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v26 = "App prediction training deferring after decaying histograms and feedback";
          goto LABEL_50;
        }
      }
      else
      {
        -[ATXPredictionDataHistograms removeExpiredData](v24, "removeExpiredData");
        if (objc_msgSend(*(id *)(a1 + 40), "didDefer"))
        {
          __atxlog_handle_default();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v26 = "App prediction training deferring after removing expired data";
            goto LABEL_50;
          }
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "allApps");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "trimActionHistoryWithAppWhitelist:", v103);

          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(int)objc_msgSend(v4, "messageContentTimeElapsed"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "pruneMessageRecipientsAddedBefore:", v104);

          __atxlog_handle_default();
          v105 = objc_claimAutoreleasedReturnValue();
          v106 = v105;
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
          {
            *(_DWORD *)buf = 136446210;
            v110 = "TOP_LEVEL";
            _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v106, OS_SIGNPOST_INTERVAL_END, v7, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
          }

          if (!objc_msgSend(*(id *)(a1 + 40), "setDone"))
          {
            __atxlog_handle_default();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_1();
            goto LABEL_51;
          }
          __atxlog_handle_default();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v26 = "App prediction training activity successfully set to DONE";
            goto LABEL_50;
          }
        }
      }
    }
LABEL_51:

    goto LABEL_30;
  }
  __atxlog_handle_default();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v17 = "App prediction training deferring after app launch location training";
    goto LABEL_29;
  }
LABEL_30:

}

void __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "App intent monitor started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "App launch monitor started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "App prediction training activity could not be set to DONE", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Decaying feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Decaying histograms and verifying data integrity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Training app launch location, microlocation, daily dose, app info manager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38___ATXAppPredictor_trainWithActivity___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Updating install date manager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
