@implementation ATXActionSessionLog

- (ATXActionSessionLog)initWithActionEngagementType:(unint64_t)a3 actionResponse:(id)a4 context:(id)a5 isShadowLog:(BOOL)a6
{
  id v11;
  id v12;
  ATXActionSessionLog *v13;
  ATXActionSessionLog *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXActionSessionLog;
  v13 = -[ATXActionSessionLog init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_engagementType = a3;
    objc_storeStrong((id *)&v13->_actionResponse, a4);
    objc_storeStrong((id *)&v14->_context, a5);
    v14->_isShadowLog = a6;
  }

  return v14;
}

+ (void)performSessionLoggingWithActionResponse:(id)a3 engagementType:(unint64_t)a4 context:(id)a5 isShadowLog:(BOOL)a6 forTestingMode:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  ATXActionSessionLog *v12;
  id v13;

  v7 = a7;
  v8 = a6;
  v13 = a3;
  v11 = a5;
  v12 = -[ATXActionSessionLog initWithActionEngagementType:actionResponse:context:isShadowLog:]([ATXActionSessionLog alloc], "initWithActionEngagementType:actionResponse:context:isShadowLog:", a4, v13, v11, v8);
  -[ATXActionSessionLog performSessionLogging:](v12, "performSessionLogging:", v7);

}

- (void)performSessionLogging:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  int v29;
  unint64_t i;
  void *v31;
  BOOL v32;
  void *v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  id v43;
  __CFString *v44;
  __CFString *v45;
  int v46;
  int v47;
  uint64_t v48;
  NSObject *v49;
  objc_class *v50;
  id v51;
  NSObject *v52;
  uint64_t v53;
  __CFString *v54;
  __CFString *v55;
  uint64_t v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  uint64_t v64;
  id v65;
  void (**v66)(void *, void *);
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD aBlock[4];
  NSObject *v76;
  id v77;
  ATXActionSessionLog *v78;
  id v79;
  uint8_t buf[4];
  id v81;
  __int16 v82;
  NSObject *v83;
  __int16 v84;
  __CFString *v85;
  __int16 v86;
  __CFString *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int v91;
  __int16 v92;
  uint64_t v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v3 = a3;
  v96 = *MEMORY[0x1E0C80C00];
  if (!-[ATXPredictionContext isOverridden](self->_context, "isOverridden"))
  {
    v5 = 1.0;
    if (!self->_isShadowLog)
    {
      v6 = objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
      +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
        objc_msgSend(v7, "actionPredictionInternalBuildSessionLogSamplingRate");
      else
        objc_msgSend(v7, "actionPredictionSessionLogSamplingRate");
      v5 = v9;

    }
    if (+[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:", v5))
    {
      sel_getName(a2);
      v59 = (void *)os_transaction_create();
      v79 = (id)objc_opt_new();
      v10 = -[ATXActionSessionLog constructSessionLogDictionaryWithAWDSessionOut:forTestingMode:](self, "constructSessionLogDictionaryWithAWDSessionOut:forTestingMode:", &v79, v3);
      if (objc_msgSend((id)objc_opt_class(), "isSessionNotUsefulForTraining:actionResponse:", objc_msgSend(v79, "engagementType"), self->_actionResponse))
      {
        __atxlog_handle_feedback();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v81 = v13;
          _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "%@ - the session does not have engagement, is low confidence, and is not a lockscreen session. Skipping session logging.", buf, 0xCu);

        }
      }
      else
      {
        v14 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v14, "UUIDString");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v79, "setSessionId:", v58);
        v15 = (void *)objc_opt_new();
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __45__ATXActionSessionLog_performSessionLogging___block_invoke;
        aBlock[3] = &unk_1E82DB2F8;
        v62 = v58;
        v76 = v62;
        v65 = v15;
        v77 = v65;
        v78 = self;
        v66 = (void (**)(void *, void *))_Block_copy(aBlock);
        v16 = objc_msgSend(v79, "engagementType");
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        objc_msgSend(v79, "actionDatas");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v95, 16);
        if (v18)
        {
          v19 = 0;
          v20 = *(_QWORD *)v72;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v72 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v21);
              if ((objc_msgSend(v22, "shown") & 1) != 0
                || (objc_msgSend(v22, "engaged"),
                    v23 = (void *)objc_claimAutoreleasedReturnValue(),
                    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Complete")),
                    v23,
                    v24))
              {
                v66[2](v66, v22);
              }
              else if (v16 == 8 || v16 == 3)
              {
                objc_msgSend(v22, "engaged");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("Partial"));

                if (!(v19 & 1 | ((v26 & 1) == 0)))
                {
                  v66[2](v66, v22);
                  v19 = 1;
                }
              }
              ++v21;
            }
            while (v18 != v21);
            v27 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v95, 16);
            v18 = v27;
          }
          while (v27);
        }

        +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "maxNumberOfActionDataMetricsToLogViaAWD");

        v60 = (void *)objc_opt_new();
        for (i = 0; ; ++i)
        {
          objc_msgSend(v79, "actionDatas");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count") > i;

          if (!v32)
            break;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addObject:", v33);

        }
        +[ATXUtils shuffle:](ATXUtils, "shuffle:", v60);
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v94, 16);
        v61 = v34;
        if (v35)
        {
          v64 = *(_QWORD *)v68;
          v36 = v29;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v68 != v64)
                objc_enumerationMutation(v34);
              v38 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
              objc_msgSend(v79, "actionDatas");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectAtIndexedSubscript:", (int)objc_msgSend(v38, "intValue"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v65, "count") >= v36)
              {
                __atxlog_handle_feedback();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v42);
                  v43 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "actionKey");
                  v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "engaged");
                  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v40, "shown");
                  v47 = objc_msgSend(v40, "cacheRank");
                  objc_msgSend(v40, "score");
                  *(_DWORD *)buf = 138413826;
                  v81 = v43;
                  v82 = 2112;
                  v83 = v62;
                  v84 = 2112;
                  v85 = v44;
                  v86 = 2112;
                  v87 = v45;
                  v88 = 1024;
                  v89 = v46;
                  v90 = 1024;
                  v91 = v47;
                  v92 = 2048;
                  v93 = v48;
                  _os_log_impl(&dword_1C9A3B000, v41, OS_LOG_TYPE_DEFAULT, "%@ - NOT logging AWDProactiveActionData with sessionId: %@ actionKey: %@ engaged: %@ shown: %{BOOL}u cacheRank: %d score: %f", buf, 0x40u);

                  v34 = v61;
                }

              }
              else
              {
                v66[2](v66, v40);
              }

            }
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v94, 16);
          }
          while (v35);
        }

        objc_msgSend(v79, "clearActionDatas");
        objc_msgSend((id)objc_opt_class(), "logIntentPredictionSession:", v79);
        __atxlog_handle_feedback();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          v51 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "sessionId");
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v79, "consumerSubType");
          if (v53 >= 0x28)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v53);
            v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v54 = off_1E82DB340[(int)v53];
          }
          v55 = v54;
          v56 = objc_msgSend(v79, "engagementType");
          if (v56 >= 0xB)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v56);
            v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v57 = off_1E82DB480[(int)v56];
          }
          *(_DWORD *)buf = 138413058;
          v81 = v51;
          v82 = 2112;
          v83 = v52;
          v84 = 2112;
          v85 = v55;
          v86 = 2112;
          v87 = v57;
          _os_log_impl(&dword_1C9A3B000, v49, OS_LOG_TYPE_DEFAULT, "%@ - logged AWDProactiveAppPredictionIntentPredictionSession with sessionId: %@ consumerSubType: %@ engagementType: %@", buf, 0x2Au);

        }
        v11 = v62;
      }

    }
  }
}

void __45__ATXActionSessionLog_performSessionLogging___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setSessionId:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "cacheRank"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    objc_msgSend((id)objc_opt_class(), "logActionData:", v3);
    __atxlog_handle_feedback();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sessionId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "actionKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "engaged");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v3, "shown");
      v12 = objc_msgSend(v3, "cacheRank");
      objc_msgSend(v3, "score");
      v14 = 138413826;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 1024;
      v23 = v11;
      v24 = 1024;
      v25 = v12;
      v26 = 2048;
      v27 = v13;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - logged AWDProactiveActionData with sessionId: %@ actionKey: %@ engaged: %@ shown: %{BOOL}u cacheRank: %d score: %f", (uint8_t *)&v14, 0x40u);

    }
  }

}

+ (BOOL)isSessionNotUsefulForTraining:(int)a3 actionResponse:(id)a4
{
  uint64_t v4;
  id v6;
  int v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (objc_msgSend(a1, "isSessionWithoutEngagement:", v4)
    && objc_msgSend(a1, "isLowConfidenceSession:", v6))
  {
    v7 = objc_msgSend(a1, "isLockscreenSession:", objc_msgSend(v6, "consumerSubType")) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)isSessionWithoutEngagement:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E83CBB48, &unk_1E83CBB60, &unk_1E83CBB78, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

+ (BOOL)isLockscreenSession:(unsigned __int8)a3
{
  return a3 == 22;
}

+ (BOOL)isLowConfidenceSession:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  ATXActionCacheReader *v7;
  ATXActionCacheReader *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  void *v15;
  _BOOL4 v16;
  BOOL v17;
  uint64_t v18;
  char v19;
  void *v21;
  unint64_t v22;
  float v23[818];
  unsigned __int8 v24;
  unsigned __int8 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _BYTE v31[3268];
  float v32;
  _BYTE v33[128];
  uint64_t v34;

  MEMORY[0x1E0C80A78](a1, a2);
  v34 = *MEMORY[0x1E0C80C00];
  v5 = v4;
  v21 = v5;
  objc_msgSend(v5, "cacheFileData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [ATXActionCacheReader alloc];
    objc_msgSend(v5, "cacheFileData");
    v3 = objc_claimAutoreleasedReturnValue();
    v8 = -[ATXActionCacheReader initWithData:](v7, "initWithData:", v3);

  }
  else
  {
    v8 = 0;
  }

  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  objc_msgSend(v5, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    v3 = (uint64_t)v31;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        if (v8)
        {
          -[ATXActionCacheReader predictionItemForAction:](v8, "predictionItemForAction:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12));
          v30[0] = 0;
          v32 = -31337.0;
          for (i = 16; i != 3284; i += 4)
            *(float *)((char *)v30 + i) = -31337.0;
          v14 = memcmp(v23, v31, 0xCC4uLL);
          v15 = (void *)v30[0];
          if (!v14
            && (!(v22 | v30[0]) || v22 && v30[0] && (objc_msgSend((id)v22, "isEqualToString:", v30[0]) & 1) != 0))
          {
            v16 = v23[817] == v32;

            if (v16)
            {

              v19 = 0;
              LOBYTE(v3) = 1;
              goto LABEL_26;
            }
          }
          else
          {

          }
          v17 = (v24 | v25) == 0;

          if (!v17)
          {
            LOBYTE(v3) = 0;
            v19 = 0;
            goto LABEL_26;
          }
        }
        ++v12;
      }
      while (v12 != v10);
      v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      v10 = v18;
    }
    while (v18);
  }
  v19 = 1;
LABEL_26:

  return (v3 | v19) & 1;
}

+ (void)logActionData:(id)a3
{
  AWDPostMetric();
}

+ (void)logIntentPredictionSession:(id)a3
{
  AWDPostMetric();
}

+ (double)_bucketize:(double)result bucketSize:(double)a4
{
  if (result >= 0.0)
    return (double)(int)(result / a4) * a4;
  return result;
}

+ (double)roundedElapsedTimeWithStartDate:(id)a3 endDate:(id)a4 accuracy:(double)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = NAN;
  if (v7 && v8)
  {
    objc_msgSend(v8, "timeIntervalSinceDate:", v7);
    v10 = floor(v11 / a5) * a5;
  }

  return v10;
}

- (id)constructSessionLogDictionaryWithAWDSessionOut:(id *)a3 forTestingMode:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t *p_engagementType;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const __CFString *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  double v92;
  void *v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  void *v98;
  double v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  void *v131;
  void *v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  void *v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  unint64_t j;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  unint64_t k;
  void *v160;
  void *v161;
  void *v163;
  void *v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  uint64_t v169;
  id v170;
  uint8_t v171[128];
  uint8_t buf[16];
  uint64_t v173;

  v4 = a4;
  v173 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[ATXPredictionContext timeContext](self->_context, "timeContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v9 = objc_claimAutoreleasedReturnValue();

  v170 = 0;
  v164 = (void *)v9;
  if (-[ATXActionResponse consumerSubType](self->_actionResponse, "consumerSubType") <= 0x2F
    && -[ATXActionResponse consumerSubType](self->_actionResponse, "consumerSubType"))
  {
    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject abGroupIdentifiers](v10, "abGroupIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", -[ATXActionResponse consumerSubType](self->_actionResponse, "consumerSubType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("ABGroup"));
    objc_msgSend(*a3, "setAbGroup:", v12);

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("ERROR!"), CFSTR("ABGroup"));
    objc_msgSend(*a3, "setAbGroup:", CFSTR("ERROR!"));
    __atxlog_handle_feedback();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXActionSessionLog constructSessionLogDictionaryWithAWDSessionOut:forTestingMode:].cold.1(-[ATXActionResponse consumerSubType](self->_actionResponse, "consumerSubType"), buf, v10);

  }
  v169 = 9;
  -[ATXActionSessionLog constructActionDataDictionaryWithEngagedIndicesOut:andAWDActionOut:andEngagementTypeFound:forTestingMode:](self, "constructActionDataDictionaryWithEngagedIndicesOut:andAWDActionOut:andEngagementTypeFound:forTestingMode:", &v170, a3, &v169, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("ActionData"));

  p_engagementType = (unint64_t *)&v169;
  if (!self->_isShadowLog)
    p_engagementType = &self->_engagementType;
  v15 = *p_engagementType;
  if (*p_engagementType - 2 >= 8)
  {
    if (v15 <= 0xA && ((1 << v15) & 0x403) != 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0CF8C40], "engagementTypeToString:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v16, "initWithFormat:", CFSTR("ERROR:%@"), v17);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF8C40], "engagementTypeToString:", v15);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("EngagementType"));

  objc_msgSend(*a3, "setEngagementType:", +[ATXAWDUtils awdActionEngagementWithEngagement:](ATXAWDUtils, "awdActionEngagementWithEngagement:", v15));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v170, CFSTR("EngagedActionCacheIndices"));
  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  v18 = v170;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v165, v171, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v166;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v166 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(*a3, "addEngagedActionCacheIndices:", objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * i), "intValue"));
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v165, v171, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("session_log_version"));

  objc_msgSend(*a3, "setSessionLogVersion:", 5);
  if (self->_isShadowLog)
    v23 = CFSTR("Shadow");
  else
    v23 = CFSTR("Feedback");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("LogType"));
  objc_msgSend(*a3, "setLogType:", !self->_isShadowLog);
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "actionPredictionSessionLoggingDurationResolutionSec");
  v26 = v25;

  -[ATXActionResponse predictionDate](self->_actionResponse, "predictionDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionSessionLog roundedElapsedTimeWithStartDate:endDate:accuracy:](ATXActionSessionLog, "roundedElapsedTimeWithStartDate:endDate:accuracy:", v27, v164, v26);
  v29 = v28;
  if (fabs(v28) == INFINITY)
    v29 = -31337.0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("PredictionAge"));

  objc_msgSend(*a3, "setPredictionAge:", (int)v29);
  -[ATXActionResponse predictionDate](self->_actionResponse, "predictionDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionResponse uiFeedbackDate](self->_actionResponse, "uiFeedbackDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionSessionLog roundedElapsedTimeWithStartDate:endDate:accuracy:](ATXActionSessionLog, "roundedElapsedTimeWithStartDate:endDate:accuracy:", v31, v32, v26);
  v34 = v33;
  if (fabs(v33) == INFINITY)
    v34 = -31337.0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("UIFeedbackDelay"));

  objc_msgSend(*a3, "setUiFeedbackDelay:", (int)v34);
  -[ATXActionResponse predictionDate](self->_actionResponse, "predictionDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionResponse donatedIntentDate](self->_actionResponse, "donatedIntentDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionSessionLog roundedElapsedTimeWithStartDate:endDate:accuracy:](ATXActionSessionLog, "roundedElapsedTimeWithStartDate:endDate:accuracy:", v36, v37, v26);
  v39 = v38;
  if (fabs(v38) == INFINITY)
    v39 = -31337.0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v40, CFSTR("IntentDonationDelay"));

  objc_msgSend(*a3, "setIntentDonationDelay:", (int)v39);
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v163, "histogramForLaunchType:", 14);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "totalTimeOfDayLaunchesForDate:", v164);
  if (fabs(v43) == INFINITY)
    v43 = -31337.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v44, CFSTR("TotalAppActionTimeOfDayLaunches"));

  objc_msgSend(v42, "totalTimeOfDayLaunchesForDate:", v164);
  if (fabs(v45) == INFINITY)
    v45 = -31337.0;
  objc_msgSend(*a3, "setTotalAppActionTimeOfDayLaunches:", (int)v45);
  LODWORD(v46) = 1036831949;
  objc_msgSend(v42, "totalTimeOfDayLaunchesForDate:distanceScale:", v164, v46);
  if (fabs(v47) == INFINITY)
    v47 = -31337.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v48, CFSTR("TotalAppActionCoarseTimeOfDayLaunches"));

  LODWORD(v49) = 1036831949;
  objc_msgSend(v42, "totalTimeOfDayLaunchesForDate:distanceScale:", v164, v49);
  if (fabs(v50) == INFINITY)
    v50 = -31337.0;
  objc_msgSend(*a3, "setTotalAppActionCoarseTimeOfDayLaunches:", (int)v50);

  objc_autoreleasePoolPop(v41);
  v51 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v163, "histogramForLaunchType:", 16);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "totalTimeOfDayLaunchesForDate:", v164);
  if (fabs(v53) == INFINITY)
    v53 = -31337.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v54, CFSTR("TotalAppForAllActionTimeOfDayLaunches"));

  objc_msgSend(v52, "totalTimeOfDayLaunchesForDate:", v164);
  if (fabs(v55) == INFINITY)
    v55 = -31337.0;
  objc_msgSend(*a3, "setTotalAppForAllActionTimeOfDayLaunches:", (int)v55);
  LODWORD(v56) = 1036831949;
  objc_msgSend(v52, "totalTimeOfDayLaunchesForDate:distanceScale:", v164, v56);
  if (fabs(v57) == INFINITY)
    v57 = -31337.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v58, CFSTR("TotalAppForAllActionsCoarseTimeOfDayLaunches"));

  LODWORD(v59) = 1036831949;
  objc_msgSend(v52, "totalTimeOfDayLaunchesForDate:distanceScale:", v164, v59);
  if (fabs(v60) == INFINITY)
    v60 = -31337.0;
  objc_msgSend(*a3, "setTotalAppForAllActionsCoarseTimeOfDayLaunches:", (int)v60);

  objc_autoreleasePoolPop(v51);
  v61 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v163, "histogramForLaunchType:", 17);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "totalTimeOfDayLaunchesForDate:", v164);
  v64 = v63;
  if (fabs(v63) == INFINITY)
    v64 = -31337.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v65, CFSTR("TotalAppActionCurrentDayOfWeekLaunches"));

  objc_msgSend(*a3, "setTotalAppActionCurrentDayOfWeekLaunches:", (int)v64);
  objc_autoreleasePoolPop(v61);
  v66 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v163, "histogramForLaunchType:", 19);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "totalTimeOfDayLaunchesForDate:", v164);
  v69 = v68;
  if (fabs(v68) == INFINITY)
    v69 = -31337.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v70, CFSTR("TotalAppForAllActionsCurrentDayOfWeekLaunches"));

  objc_msgSend(*a3, "setTotalAppForAllActionsCurrentDayOfWeekLaunches:", (int)v69);
  objc_autoreleasePoolPop(v66);
  v71 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v163, "histogramForLaunchType:", 26);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "totalLaunches");
  if (fabs(v73) == INFINITY)
    v73 = -31337.0;
  v74 = (int)v73;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v75, CFSTR("TotalAppActionAirplaneModeLaunches"));

  objc_msgSend(*a3, "setTotalAppActionAirplaneModeLaunches:", v74);
  objc_autoreleasePoolPop(v71);
  v76 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v163, "histogramForLaunchType:", 28);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "totalLaunches");
  v79 = v78;
  if (fabs(v78) == INFINITY)
    v79 = -31337.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v80, CFSTR("TotalAppForAllActionsAirplaneModeLaunches"));

  objc_msgSend(*a3, "setTotalAppForAllActionsAirplaneModeLaunches:", (int)v79);
  objc_autoreleasePoolPop(v76);
  -[ATXPredictionContext deviceStateContext](self->_context, "deviceStateContext");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "inAirplaneMode");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v83, CFSTR("InAirplaneMode"));

  v84 = (void *)MEMORY[0x1CAA48B6C](objc_msgSend(*a3, "setInAirplaneMode:", v82));
  objc_msgSend(v163, "categoricalHistogramForLaunchType:", 38);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "categoricalHistogramForLaunchType:", 39);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = (void *)MEMORY[0x1E0D80E00];
  -[ATXPredictionContext locationMotionContext](self->_context, "locationMotionContext");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "getMotionStringFromMotionType:", objc_msgSend(v89, "motionType"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = objc_msgSend(v90, "length");
  if (v91)
  {
    objc_msgSend(v85, "totalLaunchesForCategory:", v90);
    if (fabs(v92) == INFINITY)
      v92 = -31337.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v93 = &unk_1E83CBB90;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v93, CFSTR("AppActionCoreMotionCurrentMotionLaunches"));
  if (v91)

  if (objc_msgSend(v90, "length"))
  {
    objc_msgSend(v85, "totalLaunchesForCategory:", v90);
    if (fabs(v94) == INFINITY)
      v94 = -31337.0;
    v95 = (int)v94;
  }
  else
  {
    v95 = 0;
  }
  objc_msgSend(*a3, "setAppActionCoreMotionCurrentMotionLaunches:", v95);
  v96 = objc_msgSend(v90, "length");
  if (v96)
  {
    objc_msgSend(v87, "totalLaunchesForCategory:", v90);
    if (fabs(v97) == INFINITY)
      v97 = -31337.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v98 = &unk_1E83CBB90;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v98, CFSTR("AppForAllActionsCoreMotionCurrentMotionLaunches"));
  if (v96)

  if (objc_msgSend(v90, "length"))
  {
    objc_msgSend(v87, "totalLaunchesForCategory:", v90);
    if (fabs(v99) == INFINITY)
      v99 = -31337.0;
    v100 = (int)v99;
  }
  else
  {
    v100 = 0;
  }
  objc_msgSend(*a3, "setAppForAllActionsCoreMotionCurrentMotionLaunches:", v100);

  objc_autoreleasePoolPop(v84);
  v101 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v102, "component:fromDate:", 32, v164);
  v104 = objc_msgSend(v102, "component:fromDate:", 512, v164);

  objc_autoreleasePoolPop(v101);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(double)(v103 / 4));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v105, CFSTR("TimeOfDayInterval"));

  objc_msgSend(*a3, "setTimeOfDayInterval:", ((int)v103 / 4));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(double)(v104 - 1));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v106, CFSTR("DayOfWeek"));

  objc_msgSend(*a3, "setDayOfWeek:", v104 - 1);
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", -[ATXActionResponse consumerSubType](self->_actionResponse, "consumerSubType"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v107, CFSTR("ConsumerSubType"));

  objc_msgSend(*a3, "setConsumerSubType:", +[ATXAWDUtils awdConsumerSubTypeWithConsumerSubType:](ATXAWDUtils, "awdConsumerSubTypeWithConsumerSubType:", -[ATXActionResponse consumerSubType](self->_actionResponse, "consumerSubType")));
  v108 = objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
  if ((_DWORD)v108)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsInternalBuild"));
    v108 = objc_msgSend(*a3, "setIsInternalBuild:", 1);
  }
  v109 = (void *)MEMORY[0x1CAA48B6C](v108);
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContext locationMotionContext](self->_context, "locationMotionContext");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "currentLOI");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112)
    v113 = objc_msgSend(v112, "type");
  else
    v113 = -1;
  if (objc_msgSend(v110, "sessionLoggingCurrentLOITypeEnable"))
  {
    objc_msgSend(MEMORY[0x1E0D80DC8], "stringForLOIType:", v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v114, CFSTR("CurrentLOIType"));

  }
  objc_msgSend(*a3, "setCurrentLOIType:", +[ATXAWDUtils awdLOITypeWithRTLOI:](ATXAWDUtils, "awdLOITypeWithRTLOI:", v113));
  if (objc_msgSend(v110, "sessionLoggingHomeDistanceEnable"))
  {
    v115 = (void *)objc_opt_class();
    -[ATXPredictionContext locationMotionContext](self->_context, "locationMotionContext");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "distanceFromHomeOfCurrentLocationInMeters");
    v118 = v117;
    objc_msgSend(v110, "sessionLoggingDistanceAccuracy");
    objc_msgSend(v115, "_bucketize:bucketSize:", v118, v119);
    v121 = v120;

    if (v121 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v122, CFSTR("LocationDistanceFromHome"));

      objc_msgSend(*a3, "setLocationDistanceFromHome:", (int)v121);
    }
  }
  if (objc_msgSend(v110, "sessionLoggingWorkDistanceEnable"))
  {
    v123 = (void *)objc_opt_class();
    -[ATXPredictionContext locationMotionContext](self->_context, "locationMotionContext");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "distanceFromWorkOfCurrentLocationInMeters");
    v126 = v125;
    objc_msgSend(v110, "sessionLoggingDistanceAccuracy");
    objc_msgSend(v123, "_bucketize:bucketSize:", v126, v127);
    v129 = v128;

    if (v129 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v130, CFSTR("LocationDistanceFromWork"));

      objc_msgSend(*a3, "setLocationDistanceFromWork:", (int)v129);
    }
  }
  if (objc_msgSend(v110, "sessionLoggingSchoolDistanceEnable"))
  {
    v131 = (void *)objc_opt_class();
    -[ATXPredictionContext locationMotionContext](self->_context, "locationMotionContext");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "distanceFromSchoolOfCurrentLocationInMeters");
    v134 = v133;
    objc_msgSend(v110, "sessionLoggingDistanceAccuracy");
    objc_msgSend(v131, "_bucketize:bucketSize:", v134, v135);
    v137 = v136;

    if (v137 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v138, CFSTR("LocationDistanceFromSchool"));

    }
  }
  if (objc_msgSend(v110, "sessionLoggingGymDistanceEnable"))
  {
    v139 = (void *)objc_opt_class();
    -[ATXPredictionContext locationMotionContext](self->_context, "locationMotionContext");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "distanceFromGymOfCurrentLocationInMeters");
    v142 = v141;
    objc_msgSend(v110, "sessionLoggingDistanceAccuracy");
    objc_msgSend(v139, "_bucketize:bucketSize:", v142, v143);
    v145 = v144;

    if (v145 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v146, CFSTR("LocationDistanceFromGym"));

    }
  }

  objc_autoreleasePoolPop(v109);
  -[ATXActionResponse engagedAction](self->_actionResponse, "engagedAction");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "bundleId");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAppPredictorFeedback _getLastAppsWithEngagedApp:limit:](ATXAppPredictorFeedback, "_getLastAppsWithEngagedApp:limit:", v148, objc_msgSend(v149, "sessionLoggingAppSequenceLength"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v150, "count"))
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v150, CFSTR("AppSequence"));
    v151 = (void *)objc_opt_new();
    for (j = 0; objc_msgSend(v150, "count") > j; ++j)
    {
      objc_msgSend(v150, "objectAtIndexedSubscript:", j);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "addBundleid:", v153);

    }
    objc_msgSend(*a3, "setAppSequence:", v151);

  }
  -[ATXActionResponse engagedAction](self->_actionResponse, "engagedAction");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = (void *)objc_opt_new();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAppPredictorFeedback _getLastAppIntentsWithEngagedAction:combinedIntentStream:limit:](ATXAppPredictorFeedback, "_getLastAppIntentsWithEngagedAction:combinedIntentStream:limit:", v154, v155, objc_msgSend(v156, "sessionLoggingUniqueAppActionSequenceLength"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v157, "count"))
  {
    v158 = (void *)objc_opt_new();
    for (k = 0; objc_msgSend(v157, "count") > k; ++k)
    {
      objc_msgSend(v157, "objectAtIndexedSubscript:", k);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "addActionString:", v160);

    }
    objc_msgSend(*a3, "setAppActionSequence:", v158);

  }
  v161 = (void *)objc_msgSend(v7, "copy");

  return v161;
}

- (id)constructActionDataDictionaryWithEngagedIndicesOut:(id *)a3 andAWDActionOut:(id *)a4 andEngagementTypeFound:(unint64_t *)a5 forTestingMode:(BOOL)a6
{
  uint64_t v6;
  char v7;
  uint64_t *v8;
  id *v9;
  void **v10;
  uint64_t v11;
  void *v12;
  ATXActionCacheReader *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  int v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  char v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
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
  int v67;
  void *v68;
  id v69;
  uint64_t i;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  BOOL v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void **v80;
  uint64_t v81;
  void *v82;
  uint64_t *v83;
  ATXActionCacheReader *v84;
  id *v85;
  char v86;
  unint64_t v87;
  id v88;
  void *v89;
  _QWORD v90[5];
  id v91;
  id v92;
  id v93;
  uint64_t *v94;
  uint64_t *v95;
  id *v96;
  ATXPredictionItem v97;
  unint64_t v98;
  float v99[822];
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  int v103;
  _QWORD v104[2];
  uint64_t v105;
  float v106;
  uint8_t v107[4];
  _QWORD v108[3];

  v6 = MEMORY[0x1E0C80A78](self, a2);
  v86 = v7;
  v83 = v8;
  v85 = v9;
  v80 = v10;
  v11 = v6;
  *(_QWORD *)((char *)&v108[1] + 4) = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v6 + 16), "cacheFileData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = [ATXActionCacheReader alloc];
    objc_msgSend(*(id *)(v11 + 16), "cacheFileData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = -[ATXActionCacheReader initWithData:](v13, "initWithData:", v14);

  }
  else
  {
    v84 = 0;
  }

  v89 = (void *)objc_opt_new();
  v82 = (void *)objc_opt_new();
  v100 = 0;
  v101 = &v100;
  v102 = 0x2020000000;
  v103 = 0;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "actionPredictionSessionLoggingBottomBlockMaxItemsToLog");

  objc_msgSend(*(id *)(v11 + 16), "matchingIntentDonatedAction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v88 = v17;
  }
  else
  {
    objc_msgSend(*(id *)(v11 + 16), "engagedAction");
    v88 = (id)objc_claimAutoreleasedReturnValue();
  }

  v19 = 0;
  v87 = v16;
  v20 = (uint64_t *)MEMORY[0x1E0C99768];
  *((_DWORD *)v101 + 6) = 0;
  v81 = *v20;
  while (1)
  {
    objc_msgSend(*(id *)(v11 + 16), "scoredActions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    v23 = v87;
    if (v22 < v87)
      v23 = v22;
    if (v23 <= v19)
      break;
    v24 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(v11 + 16), "scoredActions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", *((int *)v101 + 6));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "predictedItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v11 + 16), "scoredActions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", *((int *)v101 + 6));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "score");
    v31 = v30;

    v32 = (void *)objc_opt_new();
    v33 = (NSMutableDictionary *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", CFSTR("Top"), CFSTR("CacheSection"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((int *)v101 + 6));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v34, CFSTR("CacheRank"));

    objc_msgSend(v32, "setCacheRank:", *((unsigned int *)v101 + 6));
    v35 = objc_msgSend(*(id *)(v11 + 16), "indexWasShown:", *((int *)v101 + 6));
    v36 = (void *)MEMORY[0x1E0C9AAA0];
    if (v35)
      v36 = (void *)MEMORY[0x1E0C9AAB0];
    v37 = v36;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v37, CFSTR("Shown"));

    objc_msgSend(v32, "setShown:", objc_msgSend(*(id *)(v11 + 16), "indexWasShown:", *((int *)v101 + 6)));
    if (*(_BYTE *)(v11 + 32))
    {
      v38 = v27;
      v39 = v88;
      if (v88
        && (objc_msgSend(v38, "actionKey"),
            v40 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v39, "actionKey"),
            v41 = (void *)objc_claimAutoreleasedReturnValue(),
            v42 = objc_msgSend(v40, "isEqualToString:", v41),
            v41,
            v40,
            (v42 & 1) != 0))
      {
        if (+[_ATXActionUtils isContainmentBetweenAction:other:](_ATXActionUtils, "isContainmentBetweenAction:other:", v38, v39))
        {
          v43 = 7;
        }
        else
        {
          v43 = 8;
        }
      }
      else
      {
        v43 = 9;
      }

      if (v43 != 9 && *v83 != 7)
        *v83 = v43;
      v44 = (unint64_t)(v43 - 7) < 2;
      engagementTypeForPrediction(v43, v44);
      v45 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = *(_QWORD *)(v11 + 8);
      v47 = v27;
      v48 = v88;
      v44 = 0;
      switch(v46)
      {
        case 2:
        case 4:
          v44 = +[_ATXActionUtils isContainmentBetweenAction:other:](_ATXActionUtils, "isContainmentBetweenAction:other:", v47, v48);
          break;
        case 3:
          objc_msgSend(v47, "actionKey");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "actionKey");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v52, "isEqualToString:", v53);

          goto LABEL_30;
        case 5:
        case 6:
          break;
        default:
          __atxlog_handle_default();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CF8C40], "engagementTypeToString:", v46);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXActionSessionLog constructActionDataDictionaryWithEngagedIndicesOut:andAWDActionOut:andEngagementTypeFound:forTestingMode:].cold.1(v50, v107, v108, v49);
          }

          v51 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(MEMORY[0x1E0CF8C40], "engagementTypeToString:", v46);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "raise:format:", v81, CFSTR("%@ is not a valid engagment type to call matchesEngagedAction with"), v52);
          v44 = 0;
LABEL_30:

          break;
      }

      engagementTypeForPrediction(*(_QWORD *)(v11 + 8), v44);
      v45 = objc_claimAutoreleasedReturnValue();
    }
    v54 = (void *)v45;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v45, CFSTR("Engaged"));
    objc_msgSend(v32, "setEngaged:", v54);
    if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v101 + 6));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "addObject:", v55);

    }
    v56 = v31;
    if (fabs(v31) == INFINITY)
      v56 = -31337.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v57, CFSTR("Score"));

    objc_msgSend(v32, "setScore:", v31);
    objc_msgSend(v27, "actionKey");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v58, CFSTR("ActionKey"));

    objc_msgSend(v27, "actionKey");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActionKey:", v59);

    if (ATXDetailedActionLoggingEnabled())
    {
      objc_msgSend(MEMORY[0x1E0CF8C40], "actionTypeToString:", objc_msgSend(v27, "actionType"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v60, CFSTR("ActionType"));

      objc_msgSend(v27, "actionTitle");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v61, CFSTR("ActionTitle"));

      objc_msgSend(v27, "slotSet");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "parameters");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "allObjects");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v64, CFSTR("SlotSet"));

    }
    if (objc_msgSend(v27, "isHeuristic"))
    {
      objc_msgSend(v27, "heuristic");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v65, CFSTR("Heuristic"));

      objc_msgSend(v27, "heuristic");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setHeuristicName:", v66);

    }
    v67 = objc_msgSend(v27, "isFutureMedia");
    v68 = (void *)MEMORY[0x1E0C9AAA0];
    if (v67)
      v68 = (void *)MEMORY[0x1E0C9AAB0];
    v69 = v68;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v69, CFSTR("IsFutureMedia"));

    objc_msgSend(v32, "setFutureMedia:", objc_msgSend(v27, "isFutureMedia"));
    if ((v86 & 1) == 0)
    {
      if (v84)
      {
        -[ATXActionCacheReader predictionItemForAction:](v84, "predictionItemForAction:", v27);
        v104[0] = 0;
        v106 = -31337.0;
        for (i = 16; i != 3284; i += 4)
          *(float *)((char *)v104 + i) = -31337.0;
        v71 = memcmp(&v99[2], &v105, 0xCC4uLL);
        v72 = (void *)v104[0];
        if (v71 || v98 | v104[0] && (!v98 || !v104[0] || (objc_msgSend((id)v98, "isEqualToString:", v104[0]) & 1) == 0))
        {

          goto LABEL_48;
        }
        v75 = v99[819] == v106;

        if (!v75)
        {
LABEL_48:
          v97.key = (NSString *)(id)v98;
          memcpy(&v97.actionHash, v99, 0xCD2uLL);
          addScoreInputsForPredictionItemToDictionary(&v97, v33);
        }

      }
      +[ATXAWDUtils subscoresWithDictionary:](ATXAWDUtils, "subscoresWithDictionary:", v33);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setSubscores:", v73);

    }
    v74 = (void *)-[NSMutableDictionary copy](v33, "copy");
    objc_msgSend(v89, "addObject:", v74);

    objc_msgSend(*v85, "addActionData:", v32);
    objc_autoreleasePoolPop(v24);
    v19 = *((_DWORD *)v101 + 6) + 1;
    *((_DWORD *)v101 + 6) = v19;
  }
  if (v84 && (v86 & 1) == 0)
  {
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __128__ATXActionSessionLog_constructActionDataDictionaryWithEngagedIndicesOut_andAWDActionOut_andEngagementTypeFound_forTestingMode___block_invoke;
    v90[3] = &unk_1E82DB320;
    v94 = &v100;
    v90[4] = v11;
    v91 = v88;
    v95 = v83;
    v92 = v82;
    v93 = v89;
    v96 = v85;
    -[ATXActionCacheReader enumerateExtraPredictionItemsWithBlock:](v84, "enumerateExtraPredictionItemsWithBlock:", v90);

  }
  v76 = objc_msgSend(v82, "copy");
  v77 = *v80;
  *v80 = (void *)v76;

  v78 = (void *)objc_msgSend(v89, "copy");
  _Block_object_dispose(&v100, 8);

  return v78;
}

void __128__ATXActionSessionLog_constructActionDataDictionaryWithEngagedIndicesOut_andAWDActionOut_andEngagementTypeFound_forTestingMode___block_invoke(uint64_t a1, float *a2)
{
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  ATXMinimalSlotResolutionParameters *v25;
  BOOL v26;
  uint64_t *v27;
  NSMutableDictionary *v28;
  void *v29;
  id *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *__src;
  id *v38;
  uint64_t v39;
  NSMutableDictionary *v40;
  void *v41;
  ATXPredictionItem v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = (NSMutableDictionary *)objc_opt_new();
  v40 = v4;
  v5 = (void *)objc_opt_new();
  v41 = v5;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", CFSTR("Other"), CFSTR("CacheSection"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, CFSTR("CacheRank"));

  objc_msgSend(v5, "setCacheRank:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", *(_QWORD *)a2, CFSTR("ActionKey"));
  objc_msgSend(v5, "setActionKey:", *(_QWORD *)a2);
  v7 = a2[821];
  if (fabs(v7) == INFINITY)
    v7 = -31337.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, CFSTR("Score"));

  objc_msgSend(v5, "setScore:", a2[821]);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
  {
    +[_ATXActionUtils slotSetsForAction:](_ATXActionUtils, "slotSetsForAction:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "slotSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90E8]), "initWithOpaqueParameters");
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = *(id *)a2;
  v15 = *((_QWORD *)a2 + 1);
  __src = a2 + 2;
  v16 = *(id *)(a1 + 40);
  v17 = v9;
  v38 = (id *)a2;
  v39 = a1;
  if (v16
    && (objc_msgSend(v16, "actionKey"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "isEqualToString:", v14),
        v18,
        (v19 & 1) != 0))
  {
    v46 = 0u;
    v45 = 0u;
    v44 = 0u;
    v43 = 0u;
    v20 = v17;
    v36 = v17;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v44;
      v23 = 7;
LABEL_13:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(v20);
        v25 = -[ATXMinimalSlotResolutionParameters initWithAction:slots:]([ATXMinimalSlotResolutionParameters alloc], "initWithAction:slots:", v16, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v24));
        v26 = -[ATXMinimalSlotResolutionParameters hash](v25, "hash") == v15;

        if (v26)
          break;
        if (v21 == ++v24)
        {
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (v21)
            goto LABEL_13;
          goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:
      v23 = 8;
    }

    v17 = v36;
  }
  else
  {
    v23 = 9;
  }

  if (v23 != 9)
  {
    v27 = *(uint64_t **)(v39 + 72);
    if (*v27 != 7)
      *v27 = v23;
  }
  v28 = v40;
  engagementTypeForPrediction(v23, (unint64_t)(v23 - 7) < 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v29, CFSTR("Engaged"));
  v30 = v38;
  objc_msgSend(v41, "setEngaged:", v29);
  if ((unint64_t)(v23 - 7) <= 1)
  {
    v31 = *(void **)(v39 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v39 + 64) + 8) + 24));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v32);

    v28 = v40;
    v30 = v38;
  }
  v42.key = (NSString *)*v30;
  memcpy(&v42.actionHash, __src, 0xCD2uLL);
  addScoreInputsForPredictionItemToDictionary(&v42, v28);
  +[ATXAWDUtils subscoresWithDictionary:](ATXAWDUtils, "subscoresWithDictionary:", v28);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setSubscores:", v33);

  v34 = *(void **)(v39 + 56);
  v35 = (void *)-[NSMutableDictionary copy](v40, "copy");
  objc_msgSend(v34, "addObject:", v35);

  objc_msgSend(**(id **)(v39 + 80), "addActionData:", v41);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v39 + 64) + 8) + 24);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_actionResponse, 0);
}

- (void)constructSessionLogDictionaryWithAWDSessionOut:(os_log_t)log forTestingMode:.cold.1(unsigned __int8 a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Action Session Log: detected invalid consumerSubType of %hhu for AB group", buf, 8u);
}

- (void)constructActionDataDictionaryWithEngagedIndicesOut:(void *)a1 andAWDActionOut:(uint8_t *)a2 andEngagementTypeFound:(_QWORD *)a3 forTestingMode:(NSObject *)a4 .cold.1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a4, (uint64_t)a3, "%@ is not a valid engagment type to call matchesEngagedAction with", a2);

}

@end
