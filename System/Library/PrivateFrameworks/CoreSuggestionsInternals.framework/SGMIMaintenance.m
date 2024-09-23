@implementation SGMIMaintenance

+ (void)executeDailyTasksWithShouldContinue:(id)a3
{
  unsigned int (**v3)(_QWORD);
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  unint64_t v61;
  unint64_t v62;
  NSObject *v63;
  NSObject *v64;
  os_signpost_id_t v65;
  NSObject *v66;
  NSObject *v67;
  unint64_t v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  os_signpost_id_t v83;
  NSObject *v84;
  NSObject *v85;
  unint64_t v86;
  void *v87;
  void *v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint8_t buf[16];

  v3 = (unsigned int (**)(_QWORD))a3;
  +[SGMITrialClientWrapper sharedInstance](SGMITrialClientWrapper, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refresh");
  if (v3[2](v3))
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMIFollowUpAnalyzer logFollowUpStatsAndSetting](SGMIFollowUpAnalyzer, "logFollowUpStatsAndSetting");
    if (v3[2](v3))
    {
      v6 = +[SGMIEnablementConfig logWarningSignatureStats](SGMIEnablementConfig, "logWarningSignatureStats");
      sgMailIntelligenceLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
      {
        v9 = os_signpost_id_generate(v7);

        sgMailIntelligenceLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C3607000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DailyTasks.LogSignature", " enableTelemetry=YES ", buf, 2u);
        }

        sgMailIntelligenceLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #1 for Signature Stats logging: -[SGMIFeatureStore warningStatsForLogging:]", buf, 2u);
        }

        objc_msgSend(v5, "sgmiFeatureStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "warningStatsForLogging:", 1);
        v8 = objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v4, "trialMetadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setTrialMetadata:](v8, "setTrialMetadata:", v14);

          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setLocale:](v8, "setLocale:", v16);

          objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject logMessage:](v17, "logMessage:", v8);
        }
        else
        {
          sgMailIntelligenceLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Signature Stats logging do not have enough new data point to submit new logs.", buf, 2u);
          }
        }

        sgMailIntelligenceLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C3607000, v19, OS_SIGNPOST_INTERVAL_END, v9, "DailyTasks.LogSignature", " enableTelemetry=YES ", buf, 2u);
        }

      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance will not run signature stats logging (logWarningSignatureStats is disabled)", buf, 2u);
      }

      if (v3[2](v3))
      {
        sgMailIntelligenceLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_signpost_id_generate(v20);

        sgMailIntelligenceLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C3607000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "DailyTasks.NicknameMappingLookup", " enableTelemetry=YES ", buf, 2u);
        }

        sgMailIntelligenceLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task NicknameMappingLookup", buf, 2u);
        }

        +[SGMINicknameManager lookForNicknamesInSentMailsAndStore:shouldContinue:](SGMINicknameManager, "lookForNicknamesInSentMailsAndStore:shouldContinue:", v5, v3);
        sgMailIntelligenceLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C3607000, v26, OS_SIGNPOST_INTERVAL_END, v21, "DailyTasks.NicknameMappingLookup", " enableTelemetry=YES ", buf, 2u);
        }

        if (v3[2](v3))
        {
          if (+[SGMIEnablementConfig detectSalientMails](SGMIEnablementConfig, "detectSalientMails"))
          {
            v27 = (void *)objc_opt_new();
            objc_msgSend(v4, "trialMetadata");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setTrialMetadata:", v28);

            v29 = (void *)objc_opt_new();
            objc_msgSend(v29, "timeIntervalSinceReferenceDate");
            objc_msgSend(v27, "setHoursSinceReference:", (v30 / 3600.0));

            if (v3[2](v3))
            {
              sgMailIntelligenceLogHandle();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #1: SGMISubmodelsManager checkForAndProcessVersionChange", buf, 2u);
              }

              sgMailIntelligenceLogHandle();
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = os_signpost_id_generate(v32);

              sgMailIntelligenceLogHandle();
              v34 = objc_claimAutoreleasedReturnValue();
              v35 = v34;
              if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1C3607000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "DailyTasks.ModelVersionChange", " enableTelemetry=YES ", buf, 2u);
              }

              +[SGMISubmodelsManager checkForAndProcessVersionChange](SGMISubmodelsManager, "checkForAndProcessVersionChange");
              sgMailIntelligenceLogHandle();
              v36 = objc_claimAutoreleasedReturnValue();
              v37 = v36;
              if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1C3607000, v37, OS_SIGNPOST_INTERVAL_END, v33, "DailyTasks.ModelVersionChange", " enableTelemetry=YES ", buf, 2u);
              }

              sgMailIntelligenceLogHandle();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C3607000, v38, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Finished Task #1: SGMISubmodelsManager checkForAndProcessVersionChange", buf, 2u);
              }

              if (v3[2](v3))
              {
                sgMailIntelligenceLogHandle();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C3607000, v39, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #2: SGMISubmodelsManager incrementalSubmodelUpdate", buf, 2u);
                }

                sgMailIntelligenceLogHandle();
                v40 = objc_claimAutoreleasedReturnValue();
                v41 = os_signpost_id_generate(v40);

                sgMailIntelligenceLogHandle();
                v42 = objc_claimAutoreleasedReturnValue();
                v43 = v42;
                if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1C3607000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "DailyTasks.SubmodelUpdate", " enableTelemetry=YES ", buf, 2u);
                }

                v44 = mach_absolute_time();
                +[SGMISubmodelsManager incrementalSubmodelUpdateWithStore:shouldContinue:limit:log:](SGMISubmodelsManager, "incrementalSubmodelUpdateWithStore:shouldContinue:limit:log:", v5, v3, 1000, v27);
                v45 = mach_absolute_time();
                v46 = SGMachTimeToNanoseconds(v45 - v44);
                sgMailIntelligenceLogHandle();
                v47 = objc_claimAutoreleasedReturnValue();
                v48 = v47;
                if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1C3607000, v48, OS_SIGNPOST_INTERVAL_END, v41, "DailyTasks.SubmodelUpdate", " enableTelemetry=YES ", buf, 2u);
                }

                sgMailIntelligenceLogHandle();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C3607000, v49, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Finished Task #2: SGMISubmodelsManager incrementalSubmodelUpdate", buf, 2u);
                }

                if (v3[2](v3))
                {
                  sgMailIntelligenceLogHandle();
                  v50 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1C3607000, v50, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #3: SGMISubmodelsManager pruneDB", buf, 2u);
                  }

                  sgMailIntelligenceLogHandle();
                  v51 = objc_claimAutoreleasedReturnValue();
                  v52 = os_signpost_id_generate(v51);

                  sgMailIntelligenceLogHandle();
                  v53 = objc_claimAutoreleasedReturnValue();
                  v54 = v53;
                  if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1C3607000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "DailyTasks.PruneSubmodels", " enableTelemetry=YES ", buf, 2u);
                  }

                  v55 = mach_absolute_time();
                  +[SGMISubmodelsManager pruneDB](SGMISubmodelsManager, "pruneDB");
                  v56 = mach_absolute_time();
                  v57 = SGMachTimeToNanoseconds(v56 - v55);
                  sgMailIntelligenceLogHandle();
                  v58 = objc_claimAutoreleasedReturnValue();
                  v59 = v58;
                  if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1C3607000, v59, OS_SIGNPOST_INTERVAL_END, v52, "DailyTasks.PruneSubmodels", " enableTelemetry=YES ", buf, 2u);
                  }

                  sgMailIntelligenceLogHandle();
                  v60 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1C3607000, v60, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Finished Task #3: SGMISubmodelsManager pruneDB", buf, 2u);
                  }

                  if (v3[2](v3))
                  {
                    v61 = v46 / 0xF4240;
                    v62 = v57 / 0xF4240;
                    sgMailIntelligenceLogHandle();
                    v63 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1C3607000, v63, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #4: Logging", buf, 2u);
                    }

                    sgMailIntelligenceLogHandle();
                    v64 = objc_claimAutoreleasedReturnValue();
                    v65 = os_signpost_id_generate(v64);

                    sgMailIntelligenceLogHandle();
                    v66 = objc_claimAutoreleasedReturnValue();
                    v67 = v66;
                    v68 = v65 - 1;
                    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1C3607000, v67, OS_SIGNPOST_INTERVAL_BEGIN, v65, "DailyTasks.LogMetrics", " enableTelemetry=YES ", buf, 2u);
                    }
                    spid = v65;

                    +[SGMISubmodelsManager addSubmodelStatsToLog:](SGMISubmodelsManager, "addSubmodelStatsToLog:", v27);
                    objc_msgSend(v27, "setSubmodelsUpdatePerformanceInMilliSeconds:", v61);
                    objc_msgSend(v27, "setSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds:", v62);
                    v69 = (void *)objc_opt_new();
                    objc_msgSend(v5, "getInt64NSNumberForKey:", CFSTR("kTotalSGMITruePositivePredictions"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v98, "doubleValue");
                    +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2);
                    objc_msgSend(v69, "setSalientPredictedAsSalient:", v70);
                    objc_msgSend(v5, "getInt64NSNumberForKey:", CFSTR("kTotalSGMIFalsePositivePredictions"));
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v97, "doubleValue");
                    +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2);
                    objc_msgSend(v69, "setIgnorablePredictedAsSalient:", v71);
                    objc_msgSend(v5, "getInt64NSNumberForKey:", CFSTR("kTotalSGMITrueNegativePredictions"));
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "doubleValue");
                    +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2);
                    objc_msgSend(v69, "setIgnorablePredictedAsIgnorable:", v72);
                    objc_msgSend(v5, "getInt64NSNumberForKey:", CFSTR("kTotalSGMIFalseNegativePredictions"));
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v95, "doubleValue");
                    +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2);
                    objc_msgSend(v69, "setSalientPredictedAsIgnorable:", v73);
                    v74 = (void *)objc_opt_new();
                    objc_msgSend(v4, "trialMetadata");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "setActiveTrialMetadata:", v75);

                    objc_msgSend(v74, "setActiveAggregatedAccuracyLogSinceModelInitialization:", v69);
                    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "logMessage:", v74);

                    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "logMessage:", v27);

                    sgMailIntelligenceLogHandle();
                    v78 = objc_claimAutoreleasedReturnValue();
                    v79 = v78;
                    if (v68 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1C3607000, v79, OS_SIGNPOST_INTERVAL_END, spid, "DailyTasks.LogMetrics", " enableTelemetry=YES ", buf, 2u);
                    }

                    sgMailIntelligenceLogHandle();
                    v80 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1C3607000, v80, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Finished Task #4: Logging", buf, 2u);
                    }

                    if (v3[2](v3))
                    {
                      sgMailIntelligenceLogHandle();
                      v81 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1C3607000, v81, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #5: Performing DB maintenance", buf, 2u);
                      }

                      sgMailIntelligenceLogHandle();
                      v82 = objc_claimAutoreleasedReturnValue();
                      v83 = os_signpost_id_generate(v82);

                      sgMailIntelligenceLogHandle();
                      v84 = objc_claimAutoreleasedReturnValue();
                      v85 = v84;
                      v86 = v83 - 1;
                      if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1C3607000, v85, OS_SIGNPOST_INTERVAL_BEGIN, v83, "DailyTasks.PerformDBMaintenance", " enableTelemetry=YES ", buf, 2u);
                      }
                      spida = v83;

                      +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "sgmiFeatureStore");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v88, "performMaintenanceWithShouldContinueBlock:", v3);

                      sgMailIntelligenceLogHandle();
                      v89 = objc_claimAutoreleasedReturnValue();
                      v90 = v89;
                      if (v86 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1C3607000, v90, OS_SIGNPOST_INTERVAL_END, spida, "DailyTasks.PerformDBMaintenance", " enableTelemetry=YES ", buf, 2u);
                      }

                      sgMailIntelligenceLogHandle();
                      v91 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1C3607000, v91, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Finished Task #5: Performing DB maintenance", buf, 2u);
                      }

                    }
                  }
                }
              }
            }

          }
          else
          {
            sgMailIntelligenceLogHandle();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C3607000, v92, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance: Mail saliency detection is off. Will not proceed with daily activity tasks.", buf, 2u);
            }

            objc_msgSend(v5, "clearMailIntelligenceSaliencyDetection");
          }
        }
      }
    }

  }
}

@end
