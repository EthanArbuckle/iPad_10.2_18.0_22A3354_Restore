@implementation ATXMediaActionPrediction

+ (id)updatedPlayMediaAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CF8CE8];
  objc_msgSend(v3, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isSystemAppForBundleId:", v5);

  v7 = (void *)MEMORY[0x1E0CF9170];
  objc_msgSend(v3, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getUpcomingMediaForBundle:isInternalApplication:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "updatedPlayMediaAction:withUpcomingMedia:", v3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)updatedPlayMediaAction:(id)a3 withUpcomingMedia:(id)a4
{
  id v5;
  id v6;
  id v7;
  double v8;
  void *v9;
  ATXActionPredictionContainer *v10;
  void *v11;
  void *v12;
  ATXActionPredictionContainer *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0CF9090]);
    LODWORD(v8) = 0;
    v9 = (void *)objc_msgSend(v7, "initWithPredictedItem:score:", v5, v8);
    v10 = [ATXActionPredictionContainer alloc];
    objc_msgSend(v5, "slotSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ATXActionPredictionContainer initWithScoredAction:slotSet:actionKey:](v10, "initWithScoredAction:slotSet:actionKey:", v9, v11, v12);

    v21[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXMediaActionPrediction updatePlayMediaActionPredictions:withUpcomingMedia:forActionKey:appActionPredictionItem:appActionLogProbability:statistics:](ATXMediaActionPrediction, "updatePlayMediaActionPredictions:withUpcomingMedia:forActionKey:appActionPredictionItem:appActionLogProbability:statistics:", v14, v6, v15, 0, 0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scoredAction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "predictedItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)updatePlayMediaActionPredictions:(id)a3 withUpcomingMedia:(id)a4 forActionKey:(id)a5 appActionPredictionItem:(const ATXPredictionItem *)a6 appActionLogProbability:(double)a7 statistics:(id)a8
{
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  ATXMinimalSlotResolutionParameters *v32;
  void *v33;
  void *v34;
  void *v35;
  ATXMinimalSlotResolutionParameters *v36;
  ATXMinimalSlotResolutionParameters *v37;
  void *v38;
  ATXMinimalSlotResolutionParameters *v39;
  char v40;
  char v41;
  void *v42;
  id v43;
  void *v44;
  ATXActionPredictionContainer *v45;
  void *v46;
  ATXActionPredictionContainer *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  double v62;
  void *v63;
  ATXActionPredictionContainer *v64;
  void *v65;
  ATXActionPredictionContainer *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  id *v75;
  id v77;
  id obj;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82[412];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v77 = a4;
  v13 = a5;
  v75 = (id *)a8;
  v73 = v13;
  v74 = (void *)objc_opt_new();
  +[_ATXActionUtils getBundleIdFromActionKey:](_ATXActionUtils, "getBundleIdFromActionKey:", v13);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v72, "count"))
  {
    v86 = 0u;
    v85 = 0u;
    v84 = 0u;
    v83 = 0u;
    obj = v72;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
    if (!v14)
      goto LABEL_39;
    v79 = *(_QWORD *)v84;
    while (1)
    {
      v80 = v14;
      for (i = 0; i != v80; ++i)
      {
        if (*(_QWORD *)v84 != v79)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        objc_msgSend(v16, "scoredAction");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "predictedItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v81, "isEqualToString:", v19);

        if ((v20 & 1) != 0)
        {
          objc_msgSend(v16, "scoredAction");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "predictedItem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "intent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "resolvePlayMediaIntent:withUpcomingMedia:", v23, v77);
          v24 = objc_claimAutoreleasedReturnValue();

          if (!v24)
            goto LABEL_30;
          -[NSObject first](v24, "first");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject second](v24, "second");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "BOOLValue");

          if (v25)
          {
            if ((v27 & 1) != 0)
            {
              __atxlog_handle_default();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v88 = v81;
                _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_INFO, "Media prediction for bundle %@ did use upcoming media. Creating new prediction, and setting isFutureMedia flag.", buf, 0xCu);
              }

              objc_msgSend(v25, "_setLaunchId:", v81);
              v29 = objc_alloc(MEMORY[0x1E0CF8C20]);
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v71) = 1;
              v31 = (void *)objc_msgSend(v29, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v25, v30, v81, 0, 0, 0, v71, 0, 0);

              v32 = [ATXMinimalSlotResolutionParameters alloc];
              objc_msgSend(v16, "scoredAction");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "predictedItem");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "slotSet");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = -[ATXMinimalSlotResolutionParameters initWithAction:slots:](v32, "initWithAction:slots:", v34, v35);

              v37 = [ATXMinimalSlotResolutionParameters alloc];
              objc_msgSend(v16, "slotSet");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[ATXMinimalSlotResolutionParameters initWithAction:slots:](v37, "initWithAction:slots:", v31, v38);

              v40 = -[ATXMinimalSlotResolutionParameters isEqual:](v36, "isEqual:", v39);
              if (v75)
                v41 = v40;
              else
                v41 = 1;
              if ((v41 & 1) == 0)
              {
                objc_msgSend(v75[2], "objectForKeyedSubscript:", v36);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75[2], "setObject:forKeyedSubscript:", v42, v39);

                objc_msgSend(v75[2], "removeObjectForKey:", v36);
              }
              v43 = objc_alloc(MEMORY[0x1E0CF9090]);
              objc_msgSend(v16, "score");
              v44 = (void *)objc_msgSend(v43, "initWithPredictedItem:score:", v31);
              v45 = [ATXActionPredictionContainer alloc];
              objc_msgSend(v16, "slotSet");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = -[ATXActionPredictionContainer initWithScoredAction:slotSet:actionKey:](v45, "initWithScoredAction:slotSet:actionKey:", v44, v46, v73);

              if (v16)
              {
                objc_msgSend(v16, "predictionItem");
                if (v47)
                  goto LABEL_20;
LABEL_27:

              }
              else
              {
                bzero(v82, 0xCE0uLL);
                if (!v47)
                  goto LABEL_27;
LABEL_20:
                -[ATXActionPredictionContainer setPredictionItem:](v47, "setPredictionItem:", v82);
              }
              objc_msgSend(v74, "addObject:", v47);

            }
            else
            {
              __atxlog_handle_default();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v88 = v81;
                _os_log_impl(&dword_1C9A3B000, v51, OS_LOG_TYPE_INFO, "Media prediction for bundle %@ did not need to use upcoming media. Returning original prediction.", buf, 0xCu);
              }

              objc_msgSend(v74, "addObject:", v16);
            }
          }

          goto LABEL_30;
        }
        __atxlog_handle_default();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v16, "scoredAction");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "predictedItem");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "bundleId");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v88 = v81;
          v89 = 2112;
          v90 = v73;
          v91 = 2112;
          v92 = v50;
          _os_log_fault_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_FAULT, "ERROR: bundleId extracted from actionKey (bundleId: %@, actionKey: %@) does not equal to bundleId in ATXActionPredictionContainer (bundleId in prediction: %@).", buf, 0x20u);

        }
LABEL_30:

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
      if (!v14)
        goto LABEL_39;
    }
  }
  objc_msgSend(a1, "resolvePlayMediaIntent:withUpcomingMedia:", 0, v77);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (!v52)
    goto LABEL_41;
  obj = v52;
  objc_msgSend(v52, "first");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "second");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "BOOLValue");

  if (v54)
  {
    __atxlog_handle_default();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v81;
      _os_log_impl(&dword_1C9A3B000, v57, OS_LOG_TYPE_INFO, "There were originally no media predictions returned for bundle %@. Used upcoming media to generate a prediction.", buf, 0xCu);
    }

    objc_msgSend(v54, "_setLaunchId:", v81);
    v58 = objc_alloc(MEMORY[0x1E0CF8C20]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v71) = v56;
    v60 = (void *)objc_msgSend(v58, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v54, v59, v81, 0, 0, 0, v71, 0, 0);

    v61 = objc_alloc(MEMORY[0x1E0CF9090]);
    LODWORD(v62) = 1.0;
    v63 = (void *)objc_msgSend(v61, "initWithPredictedItem:score:", v60, v62);
    v64 = [ATXActionPredictionContainer alloc];
    objc_msgSend(v60, "slotSet");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[ATXActionPredictionContainer initWithScoredAction:slotSet:actionKey:](v64, "initWithScoredAction:slotSet:actionKey:", v63, v65, v73);

    +[ATXSlotResolution setSlotResolutionPredictionItemForTopUpcomingMediaActionContainer:appActionPredictionItem:appActionLogProbability:](ATXSlotResolution, "setSlotResolutionPredictionItemForTopUpcomingMediaActionContainer:appActionPredictionItem:appActionLogProbability:", v66, a6, a7);
    objc_msgSend(v74, "addObject:", v66);

  }
LABEL_39:

  if (objc_msgSend(v74, "count"))
  {
    +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "allInstalledAppsKnownToSpringBoard");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "atx_filterPlayMediaIntentsWithUnavailableAppDestinationGivenSBAppList:", v68);
    v69 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_41:
    v69 = v74;
  }

  return v69;
}

+ (BOOL)upcomingMediaPreferenceForINPlayMediaIntent:(id)a3 withINUpcomingMediaManagerReturnValueForTests:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "launchId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "mediaItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        && (objc_msgSend(v5, "mediaItems"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "count"),
            v9,
            v8,
            v10))
      {
        objc_msgSend(v5, "mediaItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "type");

      }
      else
      {
        objc_msgSend(v5, "mediaContainer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          __atxlog_handle_default();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            +[ATXMediaActionPrediction upcomingMediaPreferenceForINPlayMediaIntent:withINUpcomingMediaManagerReturnValueForTests:].cold.1((uint64_t)v5, v22);

          objc_msgSend(v5, "launchId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(&unk_1E83D0490, "containsObject:", v23);

          if (v24)
          {
            __atxlog_handle_default();
            v20 = objc_claimAutoreleasedReturnValue();
            LOBYTE(v14) = 1;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v5, "launchId");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v30 = v25;
              _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_INFO, "Logged error when getting upcomingMediaPreference, but since app is %@, we will prefer upcoming media for predictions.", buf, 0xCu);

            }
          }
          else
          {
            __atxlog_handle_default();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v5, "launchId");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v30 = v26;
              _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_INFO, "Logged error when getting upcomingMediaPreference, and since app is %@ (not Podcasts or TV), we will not prefer upcoming media for predictions.", buf, 0xCu);

            }
            LOBYTE(v14) = 0;
          }
          goto LABEL_14;
        }
        objc_msgSend(v5, "mediaContainer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "type");
      }

      if (v6)
      {
        v14 = objc_msgSend(v6, "isEqualToNumber:", &unk_1E83CD8B8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CBDCC0], "sharedManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "launchId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v18 = objc_msgSend(v16, "_predictionModeForBundleId:type:error:", v17, v13, &v28);
        v19 = v28;

        v14 = v18 == 1;
      }
      __atxlog_handle_default();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "launchId");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v27;
        v31 = 2048;
        v32 = v13;
        v33 = 1024;
        v34 = v14;
        _os_log_debug_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEBUG, "Checked upcoming media preference for %@ for media type %ld. Should prefer upcoming media for predictions? %d", buf, 0x1Cu);

      }
LABEL_14:

      goto LABEL_15;
    }
  }
  LOBYTE(v14) = 0;
LABEL_15:

  return v14;
}

+ (BOOL)upcomingMediaPreferenceForINPlayMediaIntent:(id)a3
{
  return +[ATXMediaActionPrediction upcomingMediaPreferenceForINPlayMediaIntent:withINUpcomingMediaManagerReturnValueForTests:](ATXMediaActionPrediction, "upcomingMediaPreferenceForINPlayMediaIntent:withINUpcomingMediaManagerReturnValueForTests:", a3, 0);
}

+ (id)resolvePlayMediaIntent:(id)a3 withUpcomingMedia:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "preferenceForUpcomingMediaIsSet") & 1) == 0)
    objc_msgSend(v7, "setPreferUpcomingMediaForPredictions:", +[ATXMediaActionPrediction upcomingMediaPreferenceForINPlayMediaIntent:](ATXMediaActionPrediction, "upcomingMediaPreferenceForINPlayMediaIntent:", v6));
  objc_msgSend(v7, "sortedUpcomingMedia");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    if ((objc_msgSend(v7, "preferUpcomingMediaForPredictions") & 1) == 0)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v6, &unk_1E83CD8D0);
LABEL_27:
      v18 = (void *)v12;
      goto LABEL_28;
    }
    goto LABEL_20;
  }
  if (v6)
  {
    objc_msgSend(v6, "buckets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "mediaContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {

      }
      else
      {
        objc_msgSend(v6, "mediaItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          __atxlog_handle_default();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            +[ATXMediaActionPrediction resolvePlayMediaIntent:withUpcomingMedia:].cold.4();

          objc_msgSend(a1, "resolveBucketLevelPrediction:withUpcomingMedia:", v6, v7);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
      }
    }
    objc_msgSend(v6, "mediaContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v6, "mediaItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        __atxlog_handle_default();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          +[ATXMediaActionPrediction resolvePlayMediaIntent:withUpcomingMedia:].cold.3();

        objc_msgSend(a1, "resolveContainerLevelPrediction:withUpcomingMedia:", v6, v7);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
    }
    objc_msgSend(v6, "mediaItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      __atxlog_handle_default();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        +[ATXMediaActionPrediction resolvePlayMediaIntent:withUpcomingMedia:].cold.2();

      objc_msgSend(a1, "resolveItemLevelPrediction:withUpcomingMedia:", v6, v7);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_20:
    v18 = 0;
    goto LABEL_28;
  }
  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[ATXMediaActionPrediction resolvePlayMediaIntent:withUpcomingMedia:].cold.1();

  v14 = objc_alloc(MEMORY[0x1E0D81638]);
  objc_msgSend(v7, "sortedUpcomingMedia");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "first");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithFirst:second:", v17, &unk_1E83CD8B8);

LABEL_28:
  return v18;
}

+ (id)resolveBucketLevelPrediction:(id)a3 withUpcomingMedia:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "buckets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vocabularyIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "bucketValidUpcomingMedia");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v12, "count"))
  {
    v13 = objc_alloc(MEMORY[0x1E0D81638]);
    objc_msgSend(a1, "findTopRankedINPlayMediaIntentFromArray:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFirst:second:", v14, &unk_1E83CD8B8);
  }
  else
  {
    if ((objc_msgSend(v7, "preferUpcomingMediaForPredictions") & 1) == 0)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v6, &unk_1E83CD8D0);
      goto LABEL_9;
    }
    v16 = objc_alloc(MEMORY[0x1E0D81638]);
    objc_msgSend(v7, "sortedUpcomingMedia");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "first");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "initWithFirst:second:", v18, &unk_1E83CD8B8);

  }
LABEL_9:

  return v15;
}

+ (id)resolveContainerLevelPrediction:(id)a3 withUpcomingMedia:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "mediaContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "containerValidUpcomingMedia");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "containerExpiredUpcomingMedia");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  if (!objc_msgSend(v11, "count"))
  {
    if ((objc_msgSend(v7, "preferUpcomingMediaForPredictions") & 1) != 0)
    {
      if (!objc_msgSend(v7, "isInternalApplication"))
      {
        v19 = objc_alloc(MEMORY[0x1E0D81638]);
        objc_msgSend(v7, "sortedUpcomingMedia");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "first");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v19, "initWithFirst:second:", v21, &unk_1E83CD8B8);

        goto LABEL_6;
      }
      if (objc_msgSend(v13, "count"))
      {
        v16 = 0;
        goto LABEL_13;
      }
      objc_msgSend(a1, "resolveBucketLevelPrediction:withUpcomingMedia:", v6, v7);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v6, &unk_1E83CD8D0);
    }
    v16 = (void *)v17;
    goto LABEL_13;
  }
  v14 = objc_alloc(MEMORY[0x1E0D81638]);
  objc_msgSend(a1, "findTopRankedINPlayMediaIntentFromArray:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFirst:second:", v15, &unk_1E83CD8B8);
LABEL_6:

LABEL_13:
  return v16;
}

+ (id)resolveItemLevelPrediction:(id)a3 withUpcomingMedia:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "mediaContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v6, "mediaItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v7, "itemValidUpcomingMedia");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    if (objc_msgSend(v14, "count"))
    {
      v15 = objc_alloc(MEMORY[0x1E0D81638]);
      objc_msgSend(a1, "findTopRankedINPlayMediaIntentFromArray:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v15, "initWithFirst:second:", v16, &unk_1E83CD8B8);
LABEL_8:

LABEL_14:
      goto LABEL_15;
    }
    if ((objc_msgSend(v7, "preferUpcomingMediaForPredictions") & 1) != 0)
    {
      if (!objc_msgSend(v7, "isInternalApplication"))
      {
        v19 = objc_alloc(MEMORY[0x1E0D81638]);
        objc_msgSend(v7, "sortedUpcomingMedia");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "first");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v19, "initWithFirst:second:", v21, &unk_1E83CD8B8);

        goto LABEL_8;
      }
      objc_msgSend(a1, "resolveBucketLevelPrediction:withUpcomingMedia:", v6, v7);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v6, &unk_1E83CD8D0);
    }
    v9 = (void *)v17;
    goto LABEL_14;
  }
  objc_msgSend(a1, "resolveContainerLevelPrediction:withUpcomingMedia:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v9;
}

+ (id)findTopRankedINPlayMediaIntentFromArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    v7 = 0x8000000000000000;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "second", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "longValue") < v7;

        if (!v11)
        {
          objc_msgSend(v9, "second");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v12, "longValue");

          objc_msgSend(v9, "first");
          v13 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v4;
}

+ (void)upcomingMediaPreferenceForINPlayMediaIntent:(uint64_t)a1 withINUpcomingMediaManagerReturnValueForTests:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Attempted to get upcoming media preference, but prediction did not contain mediaContainer or any mediaItems. Prediction was %@", (uint8_t *)&v2, 0xCu);
}

+ (void)resolvePlayMediaIntent:withUpcomingMedia:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Predicted media intent was nil, resolving by taking the first item in Upcoming Media.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)resolvePlayMediaIntent:withUpcomingMedia:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Predicted media intent is resolved up to the item level. Resolving the item level prediction.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)resolvePlayMediaIntent:withUpcomingMedia:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Predicted media intent is resolved up to the media container level. Resolving the container level prediction.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)resolvePlayMediaIntent:withUpcomingMedia:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Predicted media intent is resolved up to the bucket level. Resolving the bucket level prediction.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
