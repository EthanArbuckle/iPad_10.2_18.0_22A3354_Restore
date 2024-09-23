@implementation _CDSleepForAutoSu

- (_CDSleepForAutoSu)init
{
  _CDSleepForAutoSu *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CDSleepForAutoSu;
  result = -[_CDSleepForAutoSu init](&v3, sel_init);
  if (result)
    result->_enableCaching = 1;
  return result;
}

- (_CDSleepForAutoSu)initWithKnowledgeStore:(id)a3
{
  id v5;
  _CDSleepForAutoSu *v6;
  _CDSleepForAutoSu *v7;

  v5 = a3;
  v6 = -[_CDSleepForAutoSu init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_knowledgeStore, a3);

  return v7;
}

- (id)proposeTimesFromRelativeOffsetsForDate:(id)a3 lastUnlock:(int)a4 suStart:(int)a5 suEnd:(int)a6 unrestrictedSleepEnd:(int)a7 config:(id)a8
{
  id v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t v40[8];
  _QWORD v41[6];
  _QWORD v42[7];

  v42[6] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (void *)MEMORY[0x1E0C99E80];
  v15 = a8;
  objc_msgSend(v14, "localTimeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v16, "secondsFromGMT");

  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)((double)((uint64_t)v17 + 300)+ 3600.0+ (double)((int)((900 * a6 + 57600) % 86400+ 86400+ 86400 * ((int)((_DWORD)v14 + (uint64_t)v17 + 3900) / 86400)- ((_DWORD)v14+ (uint64_t)v17+ 3900))% 86400)));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 900 * (a5 - a6);
  v20 = 900 * (a7 - a6);
  objc_msgSend(v18, "dateByAddingTimeInterval:", (double)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dateByAddingTimeInterval:", (double)(900 * (a4 - a6)));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dateByAddingTimeInterval:", (double)v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v15, "allowUnlockBeforeNow");

  if ((a4 & 1) == 0 && objc_msgSend(v22, "compare:", v13) == -1)
  {
    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_INFO, "unlock_start overriden", v40, 2u);
    }

    v25 = v13;
    v22 = v25;
  }
  objc_msgSend(v13, "dateByAddingTimeInterval:", 300.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v21, "compare:", v26);

  if (v27 == -1)
  {
    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_INFO, "su_start overriden", v40, 2u);
    }

    objc_msgSend(v13, "dateByAddingTimeInterval:", 300.0);
    v29 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v29;
  }
  v30 = v18;
  v41[0] = CFSTR("sleep_query_status");
  v41[1] = CFSTR("unlock_start");
  v42[0] = CFSTR("ok");
  v42[1] = v22;
  v41[2] = CFSTR("su_start");
  v41[3] = CFSTR("su_end");
  v42[2] = v21;
  v42[3] = v30;
  v41[4] = CFSTR("expiration_time");
  v41[5] = CFSTR("unrestricted_sleep_end");
  v42[4] = v30;
  v42[5] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    -[_CDSleepForAutoSu proposeTimesFromRelativeOffsetsForDate:lastUnlock:suStart:suEnd:unrestrictedSleepEnd:config:].cold.1((uint64_t)v31, v32, v33, v34, v35, v36, v37, v38);

  return v31;
}

- (id)defaultTimesWhenPredictionUnavailable:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_CDSleepForAutoSu autoSuConfig](self, "autoSuConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSleepForAutoSu defaultTimesWhenPredictionUnavailable:withConfig:](self, "defaultTimesWhenPredictionUnavailable:withConfig:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultTimesWhenPredictionUnavailable:(id)a3 withConfig:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[5];
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E80];
  v7 = a4;
  objc_msgSend(v6, "localTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "secondsFromGMT");

  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v11 = (uint64_t)v10;
  v12 = v9 + (uint64_t)v10;
  v13 = objc_msgSend(v7, "suStartDefaultTime");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(v11 + 86400 + v13 - v12 + 86400 * ((v12 - v13) / 86400)));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  LODWORD(v12) = objc_msgSend(v7, "suEndDefaultTimeOffsetFromSuStart");

  objc_msgSend(v14, "dateByAddingTimeInterval:", (double)(int)v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("sleep_query_status");
  v26[1] = CFSTR("unlock_start");
  v27[0] = CFSTR("next_day_prediction_not_available");
  v27[1] = v15;
  v26[2] = CFSTR("su_start");
  v26[3] = CFSTR("su_end");
  v27[2] = v14;
  v27[3] = v16;
  v26[4] = CFSTR("expiration_time");
  v27[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[_CDSleepForAutoSu defaultTimesWhenPredictionUnavailable:withConfig:].cold.1((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);

  +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.sleepSPIforAutoSU.totalDefaultTimes"));
  return v17;
}

- (id)makeDictionaryForEventStreamWhenPredictionTemporarilyUnavailable:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSleepForAutoSu defaultTimesWhenPredictionUnavailable:](self, "defaultTimesWhenPredictionUnavailable:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDictionary:", v7);
  objc_msgSend(v6, "setValue:forKey:", CFSTR("temporarily_not_available"), CFSTR("sleep_query_status"));
  return v6;
}

- (id)getUnlockAndSoftwareUpdateTimes
{
  _CDAutoSuConfig *v3;
  _CDAutoSuConfig *autoSuConfig;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.sleepSPIforAutoSU.totalCount"));
  v3 = objc_alloc_init(_CDAutoSuConfig);
  autoSuConfig = self->_autoSuConfig;
  self->_autoSuConfig = v3;

  v5 = (void *)MEMORY[0x193FEE914](-[_CDAutoSuConfig setParam](self->_autoSuConfig, "setParam"));
  -[_CDSleepForAutoSu autoSuConfig](self, "autoSuConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSleepForAutoSu getUnlockAndSoftwareUpdateTimesWithConfig:referenceDate:](self, "getUnlockAndSoftwareUpdateTimesWithConfig:referenceDate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (id)defaultTuningConfiguration
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("kSleepTuningLong");
  v3[1] = CFSTR("kSleepTuningShort");
  v4[0] = &unk_1E272B3B0;
  v4[1] = &unk_1E272B3C0;
  v3[2] = CFSTR("kSleepTuningRatio");
  v4[2] = &unk_1E272B3D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sanitizeTuningConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "defaultTuningConfiguration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)readConfigurationFromDefaults
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  objc_msgSend(v2, "valueForKey:", CFSTR("kSleepTuningParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tuningDictionary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37___CDSleepForAutoSu_tuningDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tuningDictionary_onceToken != -1)
    dispatch_once(&tuningDictionary_onceToken, block);
  return (id)tuningDictionary_tuningDict;
}

- (id)predictedSleepDictionaryForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x193FEE914]();
  if (self->_knowledgeStore)
  {
    -[_CDSleepForAutoSu predictedSleepDictionaryForDate:usingKnowledge:](self, "predictedSleepDictionaryForDate:usingKnowledge:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDSleepForAutoSu predictedSleepDictionaryForDate:usingKnowledge:](self, "predictedSleepDictionaryForDate:usingKnowledge:", v4, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)predictedSleepDictionaryForDate:(id)a3 usingKnowledge:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[2];
  _QWORD v51[2];
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[_CDSleepForAutoSu enableCaching](self, "enableCaching"))
  {
    +[_CDAutoSuCache sharedCache](_CDAutoSuCache, "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedPredictedSleepDictionaryForDate:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_CDSleepForAutoSu predictedSleepDictionaryForDate:usingKnowledge:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
      goto LABEL_19;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cd_dateWithCeilingForAlignment:withOffset:inTimeZone:", v8, 86400.0, 16.0 * 3600.0);
  v11 = objc_claimAutoreleasedReturnValue();
  -[NSObject dateByAddingTimeInterval:](v11, "dateByAddingTimeInterval:", -(21.0 * 86400.0));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v37, 21.0 * 86400.0);
  +[_CDSleepPredictor gatherBitmapHistoryFromStore:forPeriod:](_CDSleepPredictor, "gatherBitmapHistoryFromStore:forPeriod:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v38 = v7;
  v39 = v6;
  if (!v18 || !objc_msgSend(v18, "count"))
  {
    v22 = 0;
    v25 = 0;
    v24 = 0;
LABEL_11:
    v52 = CFSTR("_DKDebugMetadataKey-debug");
    v28 = (void *)MEMORY[0x1E0C9AA60];
    if (v22)
      v28 = v22;
    v50[0] = CFSTR("probabilityVector");
    v50[1] = CFSTR("predictionPeriodStart");
    v51[0] = v28;
    v51[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v20 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "tuningDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predictFrom:withTuning:usingVersion:", v19, v21, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDSleepPredictor findSleepPeriodInDayStarting:FromActivityProbabilities:](_CDSleepPredictor, "findSleepPeriodInDayStarting:FromActivityProbabilities:", v11, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  objc_msgSend(v24, "dateByAddingTimeInterval:", 86400.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {

    goto LABEL_11;
  }
  objc_msgSend(v23, "endDate");
  v35 = objc_claimAutoreleasedReturnValue();

  +[_DKPeriodMetadataKey periodStart](_DKPeriodMetadataKey, "periodStart");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v34;
  objc_msgSend(v23, "startDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v33;
  +[_DKPeriodMetadataKey periodEnd](_DKPeriodMetadataKey, "periodEnd");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v32;
  objc_msgSend(v23, "endDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v26;
  v48[2] = CFSTR("_DKDebugMetadataKey-debug");
  v46[0] = CFSTR("probabilityVector");
  v46[1] = CFSTR("predictionPeriodStart");
  v47[0] = v22;
  v47[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)v35;
LABEL_14:

  if (-[_CDSleepForAutoSu enableCaching](self, "enableCaching"))
  {
    +[_CDAutoSuCache sharedCache](_CDAutoSuCache, "sharedCache");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v10;
      v42 = 2112;
      v43 = v24;
      v44 = 2112;
      v45 = v25;
      _os_log_debug_impl(&dword_18DDBE000, v30, OS_LOG_TYPE_DEBUG, "Caching prediction %@ valid between [%@, %@]", buf, 0x20u);
    }

    objc_msgSend(v29, "setCachedPredictedSleepDictionary:validityStartDate:validityEndDate:", v10, v24, v25);
  }

  v7 = v38;
  v6 = v39;
LABEL_19:

  return v10;
}

- (id)getUnlockAndSoftwareUpdateTimesWithConfig:(id)a3 referenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[_CDSleepForAutoSu predictedSleepDictionaryForDate:](self, "predictedSleepDictionaryForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_CDSleepForAutoSu predictForDate:fromState:withConfig:](self, "predictForDate:fromState:withConfig:", v7, v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.sleepSPIforAutoSU.eventStreamStateFailure"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDSleepForAutoSu makeDictionaryForEventStreamWhenPredictionTemporarilyUnavailable:](self, "makeDictionaryForEventStreamWhenPredictionTemporarilyUnavailable:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)retrieveSleepProbabilities:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("_DKDebugMetadataKey-debug"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("probabilityVector"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        if (-[NSObject count](v5, "count"))
        {
          if (-[NSObject count](v6, "count") == 96)
          {
            v6 = v6;
            v7 = v6;
LABEL_20:

            goto LABEL_21;
          }
          +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            -[_CDSleepForAutoSu retrieveSleepProbabilities:].cold.5();
        }
        else
        {
          +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            -[_CDSleepForAutoSu retrieveSleepProbabilities:].cold.4();
        }
      }
      else
      {
        +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[_CDSleepForAutoSu retrieveSleepProbabilities:].cold.3();
      }

    }
    else
    {
      +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[_CDSleepForAutoSu retrieveSleepProbabilities:].cold.2();
    }
    v7 = 0;
    goto LABEL_20;
  }
  +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[_CDSleepForAutoSu retrieveSleepProbabilities:].cold.1();
  v7 = 0;
LABEL_21:

  return v7;
}

- (id)predictForDate:(id)a3 fromState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_CDSleepForAutoSu autoSuConfig](self, "autoSuConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSleepForAutoSu predictForDate:fromState:withConfig:](self, "predictForDate:fromState:withConfig:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictForDate:(id)a3 fromState:(id)a4 withConfig:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  _QWORD v29[6];
  uint8_t buf[4];
  int v31;
  __int16 v32;
  double v33;
  _QWORD v34[98];

  v34[96] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[_CDSleepForAutoSu retrieveSleepProbabilities:](self, "retrieveSleepProbabilities:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_13:
    -[_CDSleepForAutoSu defaultTimesWhenPredictionUnavailable:](self, "defaultTimesWhenPredictionUnavailable:", v8);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_CDSleepForAutoSu predictForDate:fromState:withConfig:].cold.2(v11);

  for (i = 0; i != 96; ++i)
  {
    objc_msgSend(v10, "objectAtIndex:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = 1.0 - v14;
    *(double *)&v34[i] = 1.0 - v14;

    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      v31 = i;
      v32 = 2048;
      v33 = v15;
      _os_log_debug_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_DEBUG, "Prob[%d] = %f", buf, 0x12u);
    }

  }
  *(_DWORD *)buf = 0;
  v26 = 0;
  v27 = 0;
  if (findAutoSuPlanByProbability((uint64_t)v34, (int *)buf, (int *)&v27 + 1, (int *)&v27, (int *)&v26 + 1, (int *)&v26, v9) == -1|| objc_msgSend(v9, "alwaysFallBackToDefault"))
  {
    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_CDSleepForAutoSu predictForDate:fromState:withConfig:].cold.1();

    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.sleepSPIforAutoSU.planFailed"));
    goto LABEL_13;
  }
  +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.sleepSPIforAutoSU.totalNonDefaultTimes"));
  -[_CDSleepForAutoSu proposeTimesFromRelativeOffsetsForDate:lastUnlock:suStart:suEnd:unrestrictedSleepEnd:config:](self, "proposeTimesFromRelativeOffsetsForDate:lastUnlock:suStart:suEnd:unrestrictedSleepEnd:config:", v8, *(unsigned int *)buf, HIDWORD(v27), v27, v26, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "alwaysReturnUnlockNow") & 1) != 0)
  {
    v28[0] = CFSTR("sleep_query_status");
    objc_msgSend(v20, "objectForKeyedSubscript:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v21;
    v29[1] = v8;
    v28[1] = CFSTR("unlock_start");
    v28[2] = CFSTR("su_start");
    objc_msgSend(v20, "objectForKeyedSubscript:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v22;
    v28[3] = CFSTR("su_end");
    objc_msgSend(v20, "objectForKeyedSubscript:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v23;
    v28[4] = CFSTR("expiration_time");
    objc_msgSend(v20, "objectForKeyedSubscript:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v24;
    v28[5] = CFSTR("unrestricted_sleep_end");
    objc_msgSend(v20, "objectForKeyedSubscript:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[5] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v20;
  }

LABEL_14:
  return v18;
}

- (id)predicitLastUnlockForDay:(id)a3
{
  id v4;
  _CDAutoSuConfig *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(_CDAutoSuConfig);
  -[_CDAutoSuConfig setParam](v5, "setParam");
  -[_CDAutoSuConfig setAlwaysReturnUnlockNow:](v5, "setAlwaysReturnUnlockNow:", 0);
  -[_CDAutoSuConfig setAllowUnlockBeforeNow:](v5, "setAllowUnlockBeforeNow:", 1);
  -[_CDSleepForAutoSu getUnlockAndSoftwareUpdateTimesWithConfig:referenceDate:](self, "getUnlockAndSoftwareUpdateTimesWithConfig:referenceDate:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sleep_query_status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ok"));

  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("unlock_start"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)predictNextDateForLastUnlockAttemptOfTheDay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSleepForAutoSu predicitLastUnlockForDay:](self, "predicitLastUnlockForDay:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "earlierDate:", v3),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToDate:", v5),
        v6,
        !v7))
  {
    v10 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 1, v3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_CDSleepForAutoSu predicitLastUnlockForDay:](self, "predicitLastUnlockForDay:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (_CDAutoSuConfig)autoSuConfig
{
  return (_CDAutoSuConfig *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAutoSuConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)enableCaching
{
  return self->_enableCaching;
}

- (void)setEnableCaching:(BOOL)a3
{
  self->_enableCaching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoSuConfig, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)proposeTimesFromRelativeOffsetsForDate:(uint64_t)a3 lastUnlock:(uint64_t)a4 suStart:(uint64_t)a5 suEnd:(uint64_t)a6 unrestrictedSleepEnd:(uint64_t)a7 config:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, a2, a3, "(non-default) proposed_times = %@\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)defaultTimesWhenPredictionUnavailable:(uint64_t)a3 withConfig:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, a2, a3, "(default) proposed_times = %@\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)predictedSleepDictionaryForDate:(uint64_t)a3 usingKnowledge:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, a2, a3, "Returning cached prediction %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)retrieveSleepProbabilities:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Sleep DKEvent missing metadata (desired metadata with sleep info does not exist.)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)retrieveSleepProbabilities:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "_DKDebugMetadataKey-debug unavailable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)retrieveSleepProbabilities:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "probabilityVector unavailable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)retrieveSleepProbabilities:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "probabilityVector is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)retrieveSleepProbabilities:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "probabilityVector has unexpected length", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)predictForDate:fromState:withConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Failed to find a proper plan for AutoSU", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)predictForDate:(os_log_t)log fromState:withConfig:.cold.2(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 96;
  _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "Listing %d probabilities (0: wake; 1: sleep)",
    (uint8_t *)v1,
    8u);
  OUTLINED_FUNCTION_4();
}

@end
