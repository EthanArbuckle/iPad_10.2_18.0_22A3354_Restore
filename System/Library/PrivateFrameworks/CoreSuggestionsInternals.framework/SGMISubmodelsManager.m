@implementation SGMISubmodelsManager

+ (void)incrementalSubmodelUpdateWithStore:(id)a3 limit:(unint64_t)a4 log:(id)a5
{
  objc_msgSend(a1, "incrementalSubmodelUpdateWithStore:shouldContinue:limit:log:", a3, &__block_literal_global_23577, a4, a5);
}

+ (void)incrementalSubmodelUpdateWithStore:(id)a3 shouldContinue:(id)a4 limit:(unint64_t)a5 log:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[SGMISaliencyModelConfig defaultConfig](SGMISaliencyModelConfig, "defaultConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "incrementalSubmodelUpdateWithSaliencyModelConfig:store:shouldContinue:finalGroundTruthDate:withSimulatedCSSearchableItemForTesting:limit:log:", v13, v10, v11, v14, 0, a5, v12);

  }
  else
  {
    sgMailIntelligenceLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C3607000, v15, OS_LOG_TYPE_FAULT, "Error loading model config during incremental submodel update", buf, 2u);
    }

  }
}

+ (void)incrementalSubmodelUpdateWithSaliencyModelConfig:(id)a3 store:(id)a4 shouldContinue:(id)a5 finalGroundTruthDate:(id)a6 withSimulatedCSSearchableItemForTesting:(id)a7 limit:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (id)objc_opt_new();
  objc_msgSend(a1, "incrementalSubmodelUpdateWithSaliencyModelConfig:store:shouldContinue:finalGroundTruthDate:withSimulatedCSSearchableItemForTesting:limit:log:", v18, v17, v16, v15, v14, a8, v19);

}

+ (void)incrementalSubmodelUpdateWithSaliencyModelConfig:(id)a3 store:(id)a4 shouldContinue:(id)a5 finalGroundTruthDate:(id)a6 withSimulatedCSSearchableItemForTesting:(id)a7 limit:(unint64_t)a8 log:(id)a9
{
  NSObject *v13;
  double v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  SGMIFeatureVectorCollator *v32;
  id v33;
  _BOOL4 v34;
  uint64_t v35;
  NSObject *v36;
  unint64_t v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  double v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  double v52;
  double v53;
  unint64_t v54;
  unint64_t v55;
  NSObject *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  NSObject *v63;
  id v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  uint64_t (**v75)(void);
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t (**v86)(void);
  uint64_t *v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint8_t v114[128];
  uint8_t buf[4];
  unint64_t v116;
  __int16 v117;
  unint64_t v118;
  __int16 v119;
  unint64_t v120;
  __int16 v121;
  uint64_t v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v66 = a4;
  v75 = (uint64_t (**)(void))a5;
  v72 = a6;
  v71 = a7;
  v64 = a9;
  sgMailIntelligenceLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: Updating Submodels", buf, 2u);
  }

  objc_msgSend(v66, "getNSDateForKey:", CFSTR("earliestNextSGMIUpdaterProcessingDate"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    objc_msgSend(v73, "timeIntervalSinceNow");
    v15 = v14;
    if (v14 > 0.0)
    {
      sgMailIntelligenceLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v116 = *(_QWORD *)&v15;
        _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager is not allowed to run during the next %.0f seconds.", buf, 0xCu);
      }
      goto LABEL_47;
    }
    objc_msgSend(v66, "deleteValueForKey:", CFSTR("earliestNextSGMIUpdaterProcessingDate"));
  }
  objc_msgSend(v64, "setIsSubmodelRebuilt:", objc_msgSend(v66, "areSubModelsEmpty") ^ 1);
  objc_msgSend(v66, "getNSDateForKey:", CFSTR("lastSGMIUpdaterProcessingDate"));
  v16 = objc_claimAutoreleasedReturnValue();
  v63 = v16;
  if (v16)
    -[NSObject earlierDate:](v16, "earlierDate:", v72);
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -7776000.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "timeIntervalSinceNow");
  v19 = v18;
  objc_msgSend(v61, "groundTruthEstimatorFeatures");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIFeature submodeledFeatures](SGMIFeature, "submodeledFeatures");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_pas_mappedArrayWithTransform:", &__block_literal_global_24_23563);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v59, "arrayByAddingObjectsFromArray:", v58);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0;
  v111 = &v110;
  v112 = 0x2020000000;
  v113 = 0;
  v106 = 0;
  v107 = &v106;
  v108 = 0x2020000000;
  v109 = 0;
  v102 = 0;
  v103 = &v102;
  v104 = 0x2020000000;
  v105 = 0;
  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  v21 = v66;
  v70 = (void *)objc_opt_new();
  v69 = (void *)objc_opt_new();
  v68 = (void *)objc_opt_new();
  objc_msgSend(v21, "getInt64NSNumberForKey:", CFSTR("totalSGMIUpdaterMailsProcessed"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  v24 = &unk_1E7E0C830;
  if (v22)
    v24 = (void *)v22;
  v62 = v24;

  v65 = objc_msgSend(v62, "integerValue");
  v25 = (unint64_t)(v19 / -86400.0 + 1.0);
  if (v25)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 86400 - 86400 * v25;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dateByAddingTimeInterval:", (double)v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v75[2]() & 1) == 0)
        break;
      v32 = -[SGMIFeatureVectorCollator initWithMessagesFromDaysAgo:throughDaysAgo:limit:withBiomeData:store:useSpotlightDataForMissingBiomeData:preLoadedFeatureNames:simulatedCSSIs:]([SGMIFeatureVectorCollator alloc], "initWithMessagesFromDaysAgo:throughDaysAgo:limit:withBiomeData:store:useSpotlightDataForMissingBiomeData:preLoadedFeatureNames:simulatedCSSIs:", v25 + v26, v25 + v26 - 1, a8, 1, v21, 1, v67, v71);
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __165__SGMISubmodelsManager_incrementalSubmodelUpdateWithSaliencyModelConfig_store_shouldContinue_finalGroundTruthDate_withSimulatedCSSearchableItemForTesting_limit_log___block_invoke_30;
      v80[3] = &unk_1E7DB0E10;
      v86 = v75;
      v81 = v72;
      v33 = v21;
      v82 = v33;
      v87 = &v110;
      v92 = v65;
      v93 = v25 + v26;
      v83 = v70;
      v88 = &v106;
      v89 = &v102;
      v90 = &v94;
      v91 = &v98;
      v84 = v69;
      v85 = v68;
      -[SGMIFeatureVectorCollator forEach:](v32, "forEach:", v80);
      if (v111[3] >= a8)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 7200.0);
        v35 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "setNSDate:forKey:", v35, CFSTR("earliestNextSGMIUpdaterProcessingDate"));
        sgMailIntelligenceLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v111[3];
          *(_DWORD *)buf = 134218752;
          v116 = v37;
          v117 = 2048;
          v118 = v27;
          v119 = 2048;
          v120 = (unint64_t)(v19 / -86400.0 + 1.0);
          v121 = 2048;
          v122 = 0x40BC200000000000;
          _os_log_impl(&dword_1C3607000, v36, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager processed %lu emails in this session (corresponding to %lu / %lu days) and should stop. Next training will be possible in %.0f seconds", buf, 0x2Au);
        }

        v34 = 0;
        v73 = (void *)v35;
      }
      else
      {
        v34 = v71 == 0;
      }

      if (!v34)
        goto LABEL_28;
      ++v27;
      --v26;
      v29 += 86400;
      v28 = v31;
      if (v25 == v27)
      {
        v27 = (unint64_t)(v19 / -86400.0 + 1.0);
        goto LABEL_28;
      }
    }
    sgMailIntelligenceLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v116 = v27;
      v117 = 2048;
      v118 = (unint64_t)(v19 / -86400.0 + 1.0);
      _os_log_impl(&dword_1C3607000, v38, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager received signal to not continue, stopping at day %lu of %lu", buf, 0x16u);
    }

  }
  else
  {
    v27 = 0;
    v31 = 0;
  }
LABEL_28:
  objc_msgSend(v70, "commitToStore:updateDate:", v21, v69);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v39 = v68;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, v114, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v77 != v41)
          objc_enumerationMutation(v39);
        objc_msgSend(v21, "commitSaliency:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i));
      }
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, v114, 16);
    }
    while (v40);
  }

  objc_msgSend(v64, "setDaysAvailableDuringIncrementalUpdate:", v25);
  objc_msgSend(v64, "setDaysProcessedDuringIncrementalUpdate:", v27);
  objc_msgSend(v64, "setMailsProcessedDuringIncrementalUpdate:", *((unsigned int *)v111 + 6));
  if (v31)
  {
    objc_msgSend(v21, "setNSDate:forKey:", v31, CFSTR("lastSGMIUpdaterProcessingDate"));
    if (v63)
    {
      objc_msgSend(v31, "timeIntervalSinceDate:", v63);
      objc_msgSend(v64, "setHoursSinceLastIncrementalUpdate:", (v43 / 3600.0));
    }
  }
  v44 = (void *)MEMORY[0x1E0CB37E8];
  v45 = objc_msgSend(v62, "intValue");
  objc_msgSend(v44, "numberWithInt:", (v45 + *((_DWORD *)v111 + 6)));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setInt64NSNumber:forKey:", v46, CFSTR("totalSGMIUpdaterMailsProcessed"));
  if (v103[3] + v107[3] + v99[3] + v95[3])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "incrementInt64NSNumber:forKey:", v47, CFSTR("kTotalSGMITruePositivePredictions"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v103[3]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "incrementInt64NSNumber:forKey:", v48, CFSTR("kTotalSGMIFalsePositivePredictions"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v99[3]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "incrementInt64NSNumber:forKey:", v49, CFSTR("kTotalSGMITrueNegativePredictions"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v95[3]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "incrementInt64NSNumber:forKey:", v50, CFSTR("kTotalSGMIFalseNegativePredictions"));

    v51 = v107[3];
    v52 = 0.0;
    v53 = 0.0;
    v54 = v103[3] + v51;
    if (v54)
      v53 = (double)v51 * 100.0 / (double)v54;
    v55 = v95[3] + v51;
    if (v55)
      v52 = (double)v51 * 100.0 / (double)v55;
    sgMailIntelligenceLogHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = v111[3];
      *(_DWORD *)buf = 134218496;
      v116 = v57;
      v117 = 2048;
      v118 = *(_QWORD *)&v53;
      v119 = 2048;
      v120 = *(_QWORD *)&v52;
      _os_log_impl(&dword_1C3607000, v56, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager performed incremental update of %lu mails. Model had a precision of %.2f%% and a recall of %.2f%% on them.", buf, 0x20u);
    }

  }
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);

  v17 = v63;
LABEL_47:

}

+ (void)pruneDB
{
  id v2;

  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SGMISubmodelsManager purgeTokensToMatchCappingPolicyFromStore:](SGMISubmodelsManager, "purgeTokensToMatchCappingPolicyFromStore:", v2);
  +[SGMISubmodelsManager purgeOldTokensFromStore:](SGMISubmodelsManager, "purgeOldTokensFromStore:", v2);
  +[SGMISubmodelsManager purgeDeletedEmailsReferencesFromStore:](SGMISubmodelsManager, "purgeDeletedEmailsReferencesFromStore:", v2);

}

+ (void)purgeDeletedEmailsReferencesFromStore:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[8];
  uint64_t v22;
  uint64_t v23;
  uint8_t v24[4];
  double v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "SGMISubmodelsManager: Starting purge of deleted emails references", buf, 2u);
  }

  v22 = 0;
  v23 = 0;
  *(_QWORD *)buf = CFSTR("SGMISubmodelsManager - Purge deleted emails references");
  v5 = mach_absolute_time();
  v22 = v5;
  v6 = *MEMORY[0x1E0CA6030];
  v26[0] = &unk_1E7E0C848;
  v26[1] = &unk_1E7E0C860;
  v7 = *MEMORY[0x1E0CA66F8];
  v27[0] = v6;
  v27[1] = v7;
  v26[2] = &unk_1E7E0C878;
  v27[2] = *MEMORY[0x1E0CA5F58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getSGMIStoredAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __62__SGMISubmodelsManager_purgeDeletedEmailsReferencesFromStore___block_invoke;
  v18 = &unk_1E7DB61E8;
  v11 = v8;
  v19 = v11;
  v12 = v10;
  v20 = v12;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v15);
  objc_msgSend(v3, "deleteTokensForDeletedEmailAddresses:", v12, v15, v16, v17, v18);
  sgMailIntelligenceLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = mach_absolute_time() - v5;
    if (SGMachTimeToNanoseconds_onceToken != -1)
      dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_13797);
    *(_DWORD *)v24 = 134217984;
    v25 = (double)(v14 * SGMachTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_1ED52979C)
        * 0.000000001;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "Purging deleted emails references took %f seconds", v24, 0xCu);
  }

  SGRecordMeasurementState(buf);
}

+ (void)purgeOldTokensFromStore:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "dateWithTimeIntervalSinceNow:", -31536000.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sgMailIntelligenceLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: Clearing all tokens from submodel token store that haven't been since %@ or earlier", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v4, "purgeTokensWhichLastUpdateWasBefore:", v5);
}

+ (void)purgeTokensToMatchCappingPolicyFromStore:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E7E0C848;
  v8[1] = &unk_1E7E0C8A8;
  v9[0] = &unk_1E7E0C890;
  v9[1] = &unk_1E7E0C8C0;
  v8[2] = &unk_1E7E0C8D8;
  v8[3] = &unk_1E7E0C860;
  v9[2] = &unk_1E7E0C890;
  v9[3] = &unk_1E7E0C8C0;
  v8[4] = &unk_1E7E0C878;
  v9[4] = &unk_1E7E0C8C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getViolationsToTokenCountsPolicy:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1036831949;
  objc_msgSend(v6, "applyCappingPolicy:byDiscardingTokensCounts:withMargin:", v3, v5, v7);

}

+ (void)checkForAndProcessVersionChange
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  BOOL v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNSStringForKey:", CFSTR("lastSGMIModelInferenceVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNSStringForKey:", CFSTR("lastSGMIModelGroundTruthVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMISaliencyModelConfig inferenceVersion](SGMISaliencyModelConfig, "inferenceVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMISaliencyModelConfig groundTruthVersion](SGMISaliencyModelConfig, "groundTruthVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    v8 = v4 == 0;
  else
    v8 = 1;
  if (v8)
  {
    sgMailIntelligenceLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: No prior model version data. Not processing as version change.", (uint8_t *)&v15, 2u);
    }
LABEL_15:

    if (!v5)
    {
      if (!v7)
        goto LABEL_31;
      goto LABEL_30;
    }
LABEL_29:
    objc_msgSend(v2, "setNSString:forKey:", v5, CFSTR("lastSGMIModelInferenceVersion"));
    if (!v7)
      goto LABEL_31;
LABEL_30:
    objc_msgSend(v2, "setNSString:forKey:", v7, CFSTR("lastSGMIModelGroundTruthVersion"));
    goto LABEL_31;
  }
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (v10)
  {
    sgMailIntelligenceLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGMISubmodelsManager: Current model version data is not set. Is OTA / Trial configuration for both inference and ground truth versions correct? Not processing as version change.", (uint8_t *)&v15, 2u);
    }
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isEqualToString:", v4) & 1) == 0)
  {
    sgMailIntelligenceLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: Ground truth model version updated from %@ to %@. Purging all stateful data.", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(v2, "clearMailIntelligence");
    goto LABEL_29;
  }
  v11 = objc_msgSend(v5, "isEqualToString:", v3);
  sgMailIntelligenceLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) == 0)
  {
    if (v13)
    {
      v15 = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: Inference version updated from %@ to %@ without change in ground truth model version. Retaining submodels and setting all saliency scores to 0.", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(v2, "setAllMailIntelligenceAsNotSalient");
    goto LABEL_29;
  }
  if (v13)
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGMISubmodelsManager: No version update to process.", (uint8_t *)&v15, 2u);
  }

LABEL_31:
}

+ (void)addSubmodelStatsToLog:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  double v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[16];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMISaliencyModelConfig defaultConfig](SGMISaliencyModelConfig, "defaultConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "minCountToConsiderATokenAsHighlyDiscriminant");
  v7 = objc_msgSend(v5, "minCountToConsiderATokenAsExtremelyDiscriminant");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  v49 = v8;
  if (v8)
  {
    objc_msgSend(v5, "ratioToConsiderATokenAsHighlyDiscriminant");
    v10 = v9;
    objc_msgSend(v5, "ratioToConsiderATokenAsExtremelyDiscriminant");
    if (v10 >= v11)
      v10 = v11;
    v12 = objc_opt_new();
    objc_msgSend(v4, "sgmiFeatureStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submodelsAgesInDays");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v50 = objc_msgSend(&unk_1E7E109E0, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v50)
    {
      v44 = v3;
      v45 = v12;
      v47 = v14;
      v48 = v4;
      v15 = 0;
      v46 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v57 != v46)
            objc_enumerationMutation(&unk_1E7E109E0);
          v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          v18 = (void *)objc_opt_new();
          objc_msgSend(v18, "setNbHighlyDiscriminantTokensForSaliency:", 0);
          objc_msgSend(v18, "setNbHighlyDiscriminantTokensForIgnorability:", 0);
          objc_msgSend(v18, "setNbExtremelyDiscriminantTokensForSaliency:", 0);
          objc_msgSend(v18, "setNbExtremelyDiscriminantTokensForIgnorability:", 0);
          objc_msgSend(v14, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setAgeOfTheSubmodelInDays:", objc_msgSend(v20, "unsignedIntValue"));

          }
          else
          {
            objc_msgSend(v18, "setAgeOfTheSubmodelInDays:", 0);
          }

          v51 = v17;
          objc_msgSend(v48, "highlyDiscriminantTokensForFeature:minCount:minRatio:", (int)objc_msgSend(v17, "intValue"), v49, v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v15 = v21;
          v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v53 != v24)
                  objc_enumerationMutation(v15);
                v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
                objc_msgSend(v26, "salientCount", v44);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "unsignedIntegerValue");

                objc_msgSend(v26, "regularCount");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "unsignedIntegerValue");

                v31 = v30 + v28;
                v32 = (double)(v30 + v28);
                v33 = objc_msgSend(v5, "minCountToConsiderATokenAsHighlyDiscriminant");
                if (v28 <= v30)
                {
                  v37 = (double)v30 / v32;
                  if (v31 >= v33)
                  {
                    objc_msgSend(v5, "ratioToConsiderATokenAsHighlyDiscriminant");
                    if (v37 >= v38)
                      objc_msgSend(v18, "setNbHighlyDiscriminantTokensForIgnorability:", objc_msgSend(v18, "nbHighlyDiscriminantTokensForIgnorability") + 1);
                  }
                  if (v31 >= objc_msgSend(v5, "minCountToConsiderATokenAsExtremelyDiscriminant"))
                  {
                    objc_msgSend(v5, "ratioToConsiderATokenAsExtremelyDiscriminant");
                    if (v37 >= v39)
                      objc_msgSend(v18, "setNbExtremelyDiscriminantTokensForIgnorability:", objc_msgSend(v18, "nbExtremelyDiscriminantTokensForIgnorability") + 1);
                  }
                }
                else
                {
                  v34 = (double)v28 / v32;
                  if (v31 >= v33)
                  {
                    objc_msgSend(v5, "ratioToConsiderATokenAsHighlyDiscriminant");
                    if (v34 >= v35)
                      objc_msgSend(v18, "setNbHighlyDiscriminantTokensForSaliency:", objc_msgSend(v18, "nbHighlyDiscriminantTokensForSaliency") + 1);
                  }
                  if (v31 >= objc_msgSend(v5, "minCountToConsiderATokenAsExtremelyDiscriminant"))
                  {
                    objc_msgSend(v5, "ratioToConsiderATokenAsExtremelyDiscriminant");
                    if (v34 >= v36)
                      objc_msgSend(v18, "setNbExtremelyDiscriminantTokensForSaliency:", objc_msgSend(v18, "nbExtremelyDiscriminantTokensForSaliency") + 1);
                  }
                }
              }
              v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            }
            while (v23);
          }

          +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2, (double)objc_msgSend(v18, "nbHighlyDiscriminantTokensForSaliency"));
          objc_msgSend(v18, "setNbHighlyDiscriminantTokensForSaliency:", v40);
          +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2, (double)objc_msgSend(v18, "nbHighlyDiscriminantTokensForIgnorability"));
          objc_msgSend(v18, "setNbHighlyDiscriminantTokensForIgnorability:", v41);
          +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2, (double)objc_msgSend(v18, "nbExtremelyDiscriminantTokensForSaliency"));
          objc_msgSend(v18, "setNbExtremelyDiscriminantTokensForSaliency:", v42);
          +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2, (double)objc_msgSend(v18, "nbExtremelyDiscriminantTokensForIgnorability"));
          objc_msgSend(v18, "setNbExtremelyDiscriminantTokensForIgnorability:", v43);
          switch(objc_msgSend(v51, "intValue"))
          {
            case 0x3E8u:
              -[NSObject setPersonFromSenderStats:](v45, "setPersonFromSenderStats:", v18);
              break;
            case 0x3E9u:
              -[NSObject setPersonToRecipientsStats:](v45, "setPersonToRecipientsStats:", v18);
              break;
            case 0x3EAu:
              -[NSObject setPersonCCRecipientsStats:](v45, "setPersonCCRecipientsStats:", v18);
              break;
            case 0x3EBu:
              -[NSObject setSubjectContentStats:](v45, "setSubjectContentStats:", v18);
              break;
            case 0x3ECu:
              -[NSObject setDomainFromSenderStats:](v45, "setDomainFromSenderStats:", v18);
              break;
            case 0x3EDu:
              -[NSObject setPersonFromSenderInDyadicConversationStats:](v45, "setPersonFromSenderInDyadicConversationStats:", v18);
              break;
            case 0x3F0u:
              -[NSObject setConversationStats:](v45, "setConversationStats:", v18);
              break;
            default:
              break;
          }

          v14 = v47;
        }
        v50 = objc_msgSend(&unk_1E7E109E0, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v50);

      v3 = v44;
      v12 = v45;
      v4 = v48;
    }
    objc_msgSend(v3, "setSubmodelsStats:", v12, v44);

  }
  else
  {
    sgMailIntelligenceLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C3607000, v12, OS_LOG_TYPE_FAULT, "SGMISubmodelsManager: Invalid min counts requirements in SGMISaliencyModelConfig.", buf, 2u);
    }
  }

}

void __62__SGMISubmodelsManager_purgeDeletedEmailsReferencesFromStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  sgMailIntelligenceLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "SGMLISubModelUpdater: Number of email addresses to validate: %lu", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked"))
    {
      v14 = 0;
      +[SGMISpotlightUtility findDeletedEmailAddresses:mdSearchableItemAttribute:fromDaysAgo:error:](SGMISpotlightUtility, "findDeletedEmailAddresses:mdSearchableItemAttribute:fromDaysAgo:error:", v6, v8, 365, &v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v5);
      sgMailIntelligenceLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 138412546;
        v16 = (uint64_t)v8;
        v17 = 2048;
        v18 = v12;
        _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_INFO, "SGMISubmodelsManager: Emails to delete for %@: %lu", buf, 0x16u);
      }

    }
    else
    {
      sgMailIntelligenceLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "SGMISubmodelsManager lost Spotlight connection (device got locked)", buf, 2u);
      }
    }
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)objc_msgSend(v5, "intValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = (uint64_t)v13;
      _os_log_fault_impl(&dword_1C3607000, v10, OS_LOG_TYPE_FAULT, "SGMISubmodelsManager: Failed to map email address feature %@ to MDIAttribute", buf, 0xCu);

    }
  }

}

void __165__SGMISubmodelsManager_incrementalSubmodelUpdateWithSaliencyModelConfig_store_shouldContinue_finalGroundTruthDate_withSimulatedCSSearchableItemForTesting_limit_log___block_invoke_30(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  if ((objc_msgSend(v5, "hasHashedMessageId") & 1) == 0)
  {
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "estimateGroundTruth");
      objc_msgSend(v5, "mailMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "compare:", *(_QWORD *)(a1 + 32));

      if (v6 == 1 || v9 == -1)
      {
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v5, "messageId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "saliencyForMessageId:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12
          || (+[SGMISaliencyModelConfig defaultConfig](SGMISaliencyModelConfig, "defaultConfig"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = 0,
              +[SGMISaliencyInference evaluate:enablePreFiltering:config:error:](SGMISaliencyInference, "evaluate:enablePreFiltering:config:error:", v5, 1, v15, &v17), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = v17, v15, !v13))
        {
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + *(_QWORD *)(a1 + 120) >= 0x65uLL
            && *(_QWORD *)(a1 + 128) <= 0xFuLL)
          {
            objc_msgSend(v12, "setGteSaliency:", v6);
            objc_msgSend(v5, "logOrStageWithSaliency:", v12);
          }
          v13 = 0;
          v14 = 1;
          if (!v12)
            goto LABEL_26;
        }
        else
        {
          v14 = 0;
          if (!v12)
          {
LABEL_26:

            goto LABEL_27;
          }
        }
        if ((objc_msgSend(v12, "isCounted") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 48), "ingest:asSalient:", v5, v6 == 1);
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
          if (v14)
          {
            if (objc_msgSend(v12, "isSalient"))
            {
              if (v6 == 1)
                v16 = a1 + 88;
              else
                v16 = a1 + 96;
            }
            else if (v6 == 1)
            {
              v16 = a1 + 104;
            }
            else
            {
              v16 = a1 + 112;
            }
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v16 + 8) + 24);
          }
          objc_msgSend(v12, "setGteSaliency:", v6 == 1);
          objc_msgSend(v12, "setIsCounted:", 1);
          objc_msgSend(v12, "setCreationDate:", *(_QWORD *)(a1 + 56));
          if ((objc_msgSend(v5, "hasHashedMessageId") & 1) == 0)
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v12);
        }
        goto LABEL_26;
      }
    }
    else
    {
      *a3 = 1;
    }
  }
LABEL_27:

}

uint64_t __165__SGMISubmodelsManager_incrementalSubmodelUpdateWithSaliencyModelConfig_store_shouldContinue_finalGroundTruthDate_withSimulatedCSSearchableItemForTesting_limit_log___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "submodeledFeature"));
}

uint64_t __69__SGMISubmodelsManager_incrementalSubmodelUpdateWithStore_limit_log___block_invoke()
{
  return 1;
}

@end
