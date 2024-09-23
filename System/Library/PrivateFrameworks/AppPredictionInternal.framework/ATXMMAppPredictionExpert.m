@implementation ATXMMAppPredictionExpert

- (ATXMMAppPredictionExpert)init
{
  ATXMMAppPredictionExpert *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXMMAppPredictionExpert;
  v2 = -[ATXMMAppPredictionExpert init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)_contextHelper;
    _contextHelper = v3;

  }
  return v2;
}

+ (Class)supportedAnchorClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXMMAppPredictionExpert.m"), 76, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (id)sampleEventForExpert
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
  v2 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "sampleEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)anchorTypeForExpert
{
  return +[ATXAnchor anchorTypeToString:](ATXAnchor, "anchorTypeToString:", objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass"), "anchorType"));
}

+ (unsigned)predictionReasonForExpert
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXMMAppPredictionExpert.m"), 93, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (NSString)pathToPredictionTable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CF94D8], "magicalMomentsPredictionTablesRootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ATXMMPredictionTable-%@"), v3);
  objc_msgSend(v2, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (NSString)notificationIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.duetexpertd.ATXMMAppPredictor.%@"), v2);

  return (NSString *)v3;
}

+ (BOOL)isExpertEnabledForPredictions
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "magicalMomentsEnabledPredictionExperts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "BOOLValue");
  return (char)v5;
}

+ (id)fetchAnchorOccurrences
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2592000.0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
  v4 = (void *)objc_opt_new();
  v17 = (void *)v3;
  v18 = (void *)v2;
  objc_msgSend((id)objc_opt_class(), "fetchAnchorOccurrencesBetweenStartDate:endDate:", v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    v26 = 2048;
    v27 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "ATXMM: (%@) num anchor events: %lu.", buf, 0x16u);

  }
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[ATXMMAppPredictionExpert fetchAnchorOccurrences].cold.1();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        __atxlog_handle_default();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v14;
          _os_log_debug_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEBUG, "ATXMM: %@", buf, 0xCu);
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v9;
}

+ (BOOL)shouldPredicateOnStartDateForTrigger
{
  return objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass"), "shouldPredicateOnStartDate");
}

+ (int64_t)dateBufferForTriggerEvent
{
  return objc_msgSend((id)objc_opt_class(), "shouldPredicateOnStartDateForTrigger") ^ 1;
}

+ (id)correlateTriggerEvents:(id)a3 withAppLaunches:(id)a4
{
  id v5;
  id v6;
  ATXCorrelatedEventsDateBuffer *v7;
  ATXCorrelatedEventsDateBuffer *v8;
  ATXCorrelatedEventsManager *v9;
  uint64_t v10;
  ATXCorrelatedEventsManager *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    v7 = -[ATXCorrelatedEventsDateBuffer initWithBufferSeconds:andBufferType:]([ATXCorrelatedEventsDateBuffer alloc], "initWithBufferSeconds:andBufferType:", objc_msgSend((id)objc_opt_class(), "dateBufferForTriggerEvent"), 120.0);
    v8 = -[ATXCorrelatedEventsDateBuffer initWithBufferSeconds:andBufferType:]([ATXCorrelatedEventsDateBuffer alloc], "initWithBufferSeconds:andBufferType:", 0, 0.0);
    v9 = [ATXCorrelatedEventsManager alloc];
    v10 = objc_opt_class();
    v11 = -[ATXCorrelatedEventsManager initWithFirstEventType:firstEventTypeDateBuffer:secondEventType:secondEventTypeDateBuffer:](v9, "initWithFirstEventType:firstEventTypeDateBuffer:secondEventType:secondEventTypeDateBuffer:", v10, v7, objc_opt_class(), v8);
    -[ATXCorrelatedEventsManager insertEvents:forEventType:](v11, "insertEvents:forEventType:", v5, 0);
    -[ATXCorrelatedEventsManager insertEvents:forEventType:](v11, "insertEvents:forEventType:", v6, 1);
    -[ATXCorrelatedEventsManager correlatedEvents](v11, "correlatedEvents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

+ (void)tagEventWithLOIForEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v3 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "shouldPredicateOnStartDateForTrigger") & 1) != 0)
    objc_msgSend(v3, "startDate");
  else
    objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3588]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v4, -43200.0);
  v7 = (void *)objc_msgSend(v5, "initWithStartDate:duration:", v6, 86400.0);

  +[ATXMagicalMomentsContexts locationOfInterestForDate:dateIntervalForSearch:](ATXMagicalMomentsContexts, "locationOfInterestForDate:dateIntervalForSearch:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[ATXMMAppPredictionExpert tagEventWithLOIForEvent:].cold.1();

    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tagWithLocationOfInterestIdentifier:", v10);

  }
}

+ (id)createTrainingDataForSubExpertsWithCorrelatedEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[5];

  v58[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v52 = (void *)objc_opt_new();
  v56 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  +[ATXMagicalMomentsContexts timeOfDayPredicatesWithRequestedDurationInHours:shouldPredicateOnStartDate:](ATXMagicalMomentsContexts, "timeOfDayPredicatesWithRequestedDurationInHours:shouldPredicateOnStartDate:", 6, objc_msgSend((id)objc_opt_class(), "shouldPredicateOnStartDateForTrigger"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXMagicalMomentsContexts partOfWeekPredicatesUsingStartDate:](ATXMagicalMomentsContexts, "partOfWeekPredicatesUsingStartDate:", objc_msgSend((id)objc_opt_class(), "shouldPredicateOnStartDateForTrigger"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v8 = 0;
    v50 = v3;
    v51 = v6;
    v53 = v4;
    v49 = v5;
    do
    {
      v9 = (void *)MEMORY[0x1CAA48B6C]();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "firstEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v52, "containsObject:", v10) & 1) == 0)
      {
        objc_msgSend(v52, "addObject:", v10);
        objc_msgSend((id)objc_opt_class(), "tagEventWithLOIForEvent:", v10);
      }
      objc_msgSend(v56, "objectForKeyedSubscript:", v57);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v12 = (void *)objc_opt_new();
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v12, v57);

        v13 = (void *)objc_opt_new();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v13, v57);

        if (objc_msgSend(v51, "count"))
        {
          v14 = 0;
          do
          {
            v15 = (void *)objc_opt_new();
            objc_msgSend(v53, "objectForKeyedSubscript:", v57);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

            ++v14;
          }
          while (v14 < objc_msgSend(v51, "count"));
        }
        v18 = (void *)objc_opt_new();
        objc_msgSend(v49, "setObject:forKeyedSubscript:", v18, v57);

        if (objc_msgSend(v7, "count"))
        {
          v19 = 0;
          do
          {
            v20 = (void *)objc_opt_new();
            objc_msgSend(v49, "objectForKeyedSubscript:", v57);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

            ++v19;
          }
          while (v19 < objc_msgSend(v7, "count"));
        }
        v23 = (void *)objc_opt_new();
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v23, v57);

        v5 = v49;
      }
      objc_msgSend(v10, "locationIdentifierUUIDString");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        objc_msgSend(v54, "objectForKeyedSubscript:", v57);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "locationIdentifierUUIDString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v29 = (void *)objc_opt_new();
          objc_msgSend(v54, "objectForKeyedSubscript:", v57);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "locationIdentifierUUIDString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v31);

        }
      }
      objc_msgSend(v56, "objectForKeyedSubscript:", v57);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addIndex:", v8);

      v6 = v51;
      if (objc_msgSend(v51, "count"))
      {
        v33 = 0;
        while (1)
        {
          objc_msgSend(v51, "objectAtIndexedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v34, "evaluateWithObject:", v10))
            break;

          if (++v33 >= (unint64_t)objc_msgSend(v51, "count"))
            goto LABEL_22;
        }
        objc_msgSend(v53, "objectForKeyedSubscript:", v57);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addIndex:", v8);

      }
LABEL_22:
      if (objc_msgSend(v7, "count"))
      {
        v38 = 0;
        while (1)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "evaluateWithObject:", v10))
            break;

          if (++v38 >= (unint64_t)objc_msgSend(v7, "count"))
            goto LABEL_28;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v57);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v38);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addIndex:", v8);

      }
LABEL_28:
      objc_msgSend(v10, "locationIdentifierUUIDString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_msgSend(v54, "objectForKeyedSubscript:", v57);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "locationIdentifierUUIDString");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addIndex:", v8);

      }
      objc_autoreleasePoolPop(v9);
      ++v8;
      v3 = v50;
      v4 = v53;
    }
    while (v8 < objc_msgSend(v50, "count"));
  }
  v58[0] = v56;
  v58[1] = v4;
  v58[2] = v5;
  v58[3] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

+ (void)trainSubExpertWithCorrelatedEvents:(id)a3 indices:(id)a4 predicates:(id)a5 appLaunchCountedSet:(id)a6 predictionTable:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(a3, "objectsAtIndexes:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(a1, "trainSubExpertWithCorrelatedEvents:appLaunchCountedSet:", v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v16, "count");
      objc_msgSend(v16, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218242;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "ATXMM: Got back %lu predictions for subexpert. Sample prediction: %@", (uint8_t *)&v20, 0x16u);

    }
    if (v12 && v16)
      objc_msgSend(v14, "addPredictions:withApplicablePredicates:", v16, v12);

  }
}

+ (id)trainSubExpertWithCorrelatedEvents:(id)a3 appLaunchCountedSet:(id)a4
{
  id v5;
  id v6;
  ATXMagicalMomentsPredictionScorer *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[ATXMagicalMomentsPredictionScorer initWithCorrelatedEvents:andGlobalAppLaunchCountedSet:]([ATXMagicalMomentsPredictionScorer alloc], "initWithCorrelatedEvents:andGlobalAppLaunchCountedSet:", v6, v5);

  -[ATXMagicalMomentsPredictionScorer generatePredictions](v7, "generatePredictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)serializeAndWritePredictionTable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "pathToPredictionTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v8 = objc_msgSend(v5, "writeToFile:options:error:", v7, 1073741825, &v11);
    v9 = v11;

    if ((v8 & 1) == 0)
    {
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        +[ATXMMAppPredictionExpert serializeAndWritePredictionTable:].cold.2();

    }
  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ATXMMAppPredictionExpert serializeAndWritePredictionTable:].cold.1();
  }

  objc_autoreleasePoolPop(v4);
}

+ (void)trainSubExpertsWithTrainingData:(id)a3 correlatedEvents:(id)a4 appLaunchCountedSet:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id obj;
  void *context;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[2];
  _QWORD v107[2];
  _BYTE v108[128];
  _QWORD v109[2];
  _QWORD v110[2];
  _BYTE v111[128];
  _QWORD v112[2];
  _QWORD v113[2];
  _BYTE v114[128];
  void *v115;
  void *v116;
  uint8_t buf[4];
  void *v118;
  __int16 v119;
  uint64_t v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v88 = a4;
  v87 = a5;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_opt_new();
  +[ATXMagicalMomentsContexts timeOfDayPredicatesWithRequestedDurationInHours:shouldPredicateOnStartDate:](ATXMagicalMomentsContexts, "timeOfDayPredicatesWithRequestedDurationInHours:shouldPredicateOnStartDate:", 6, objc_msgSend((id)objc_opt_class(), "shouldPredicateOnStartDateForTrigger"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = a1;
  +[ATXMagicalMomentsContexts partOfWeekPredicatesUsingStartDate:](ATXMagicalMomentsContexts, "partOfWeekPredicatesUsingStartDate:", objc_msgSend((id)objc_opt_class(), "shouldPredicateOnStartDateForTrigger"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = v9;
  v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
  if (v77)
  {
    v76 = *(_QWORD *)v103;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v103 != v76)
          objc_enumerationMutation(obj);
        v80 = v10;
        v11 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1CAA48B6C]();
        __atxlog_handle_default();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (void *)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
          *(_DWORD *)buf = 138412546;
          v118 = v13;
          v119 = 2112;
          v120 = v11;
          v14 = v13;
          _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "ATXMM: (%@) Training subexperts for event identifier %@", buf, 0x16u);

        }
        +[ATXMagicalMomentsContexts eventIdentifierPredicateForValue:](ATXMagicalMomentsContexts, "eventIdentifierPredicateForValue:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_default();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (void *)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
          *(_DWORD *)buf = 138412290;
          v118 = v17;
          v18 = v17;
          _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_INFO, "ATXMM: (%@) Training Anchor ID expert", buf, 0xCu);

        }
        __atxlog_handle_default();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v116 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v118 = v71;
          _os_log_debug_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEBUG, "ATXMM: ==> Predicates %@", buf, 0xCu);

        }
        objc_msgSend(obj, "objectForKeyedSubscript:", v11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "trainSubExpertWithCorrelatedEvents:indices:predicates:appLaunchCountedSet:predictionTable:", v88, v20, v21, v87, v86);

        __atxlog_handle_default();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (void *)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
          *(_DWORD *)buf = 138412290;
          v118 = v23;
          v24 = v23;
          _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_INFO, "ATXMM: (%@) Training Time of Day experts", buf, 0xCu);

        }
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        objc_msgSend(v83, "objectForKeyedSubscript:", v11);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v99;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v99 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
              __atxlog_handle_default();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                v113[0] = v15;
                objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v30, "integerValue"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v113[1] = v36;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v118 = v37;
                _os_log_debug_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEBUG, "ATXMM: ==> Predicates %@", buf, 0xCu);

              }
              objc_msgSend(v83, "objectForKeyedSubscript:", v11);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKeyedSubscript:", v30);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v112[0] = v15;
              objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v30, "integerValue"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v112[1] = v34;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "trainSubExpertWithCorrelatedEvents:indices:predicates:appLaunchCountedSet:predictionTable:", v88, v33, v35, v87, v86);

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
          }
          while (v27);
        }

        __atxlog_handle_default();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = (void *)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
          *(_DWORD *)buf = 138412290;
          v118 = v39;
          v40 = v39;
          _os_log_impl(&dword_1C9A3B000, v38, OS_LOG_TYPE_INFO, "ATXMM: (%@) Training Part of Week experts", buf, 0xCu);

        }
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        objc_msgSend(v82, "objectForKeyedSubscript:", v11);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v95;
          do
          {
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v95 != v44)
                objc_enumerationMutation(v41);
              v46 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
              __atxlog_handle_default();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              {
                v110[0] = v15;
                objc_msgSend(v84, "objectAtIndexedSubscript:", objc_msgSend(v46, "integerValue"));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v110[1] = v52;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v118 = v53;
                _os_log_debug_impl(&dword_1C9A3B000, v47, OS_LOG_TYPE_DEBUG, "ATXMM: ==> Predicates %@", buf, 0xCu);

              }
              objc_msgSend(v82, "objectForKeyedSubscript:", v11);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "objectForKeyedSubscript:", v46);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v109[0] = v15;
              objc_msgSend(v84, "objectAtIndexedSubscript:", objc_msgSend(v46, "integerValue"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v109[1] = v50;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "trainSubExpertWithCorrelatedEvents:indices:predicates:appLaunchCountedSet:predictionTable:", v88, v49, v51, v87, v86);

            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
          }
          while (v43);
        }

        __atxlog_handle_default();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          v55 = (void *)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
          *(_DWORD *)buf = 138412290;
          v118 = v55;
          v56 = v55;
          _os_log_impl(&dword_1C9A3B000, v54, OS_LOG_TYPE_INFO, "ATXMM: (%@) Training LOI experts", buf, 0xCu);

        }
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        objc_msgSend(v81, "objectForKeyedSubscript:", v11);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v90, v108, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v91;
          do
          {
            v61 = 0;
            do
            {
              if (*(_QWORD *)v91 != v60)
                objc_enumerationMutation(v57);
              v62 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v61);
              +[ATXMagicalMomentsContexts loiPredicateForUUIDString:](ATXMagicalMomentsContexts, "loiPredicateForUUIDString:", v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              __atxlog_handle_default();
              v64 = objc_claimAutoreleasedReturnValue();
              v65 = v64;
              if (v63)
              {
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                {
                  v107[0] = v15;
                  v107[1] = v63;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v118 = v68;
                  _os_log_debug_impl(&dword_1C9A3B000, v65, OS_LOG_TYPE_DEBUG, "ATXMM: ==> Predicates %@", buf, 0xCu);

                }
                objc_msgSend(v81, "objectForKeyedSubscript:", v11);
                v65 = objc_claimAutoreleasedReturnValue();
                -[NSObject objectForKeyedSubscript:](v65, "objectForKeyedSubscript:", v62);
                v66 = (id)objc_claimAutoreleasedReturnValue();
                v106[0] = v15;
                v106[1] = v63;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "trainSubExpertWithCorrelatedEvents:indices:predicates:appLaunchCountedSet:predictionTable:", v88, v66, v67, v87, v86);

                goto LABEL_45;
              }
              if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
              {
                v69 = (void *)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
                *(_DWORD *)buf = 138412546;
                v118 = v69;
                v119 = 2112;
                v120 = v62;
                v66 = v69;
                _os_log_fault_impl(&dword_1C9A3B000, v65, OS_LOG_TYPE_FAULT, "ATXMM: (%@) Couldn't produce a predicate for the provided LOI UUID string: %@", buf, 0x16u);
LABEL_45:

              }
              ++v61;
            }
            while (v59 != v61);
            v70 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v90, v108, 16);
            v59 = v70;
          }
          while (v70);
        }

        objc_autoreleasePoolPop(context);
        v10 = v80 + 1;
      }
      while (v80 + 1 != v77);
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
    }
    while (v77);
  }

  __atxlog_handle_default();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
  {
    v73 = (void *)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
    *(_DWORD *)buf = 138412290;
    v118 = v73;
    v74 = v73;
    _os_log_impl(&dword_1C9A3B000, v72, OS_LOG_TYPE_INFO, "ATXMM: (%@) Writing out prediction table.", buf, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "serializeAndWritePredictionTable:", v86);

}

+ (void)trainExpertWithAppLaunchEvents:(id)a3 appLaunchCountedSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA48B6C]();
  if (v6)
  {
    v9 = objc_msgSend(v6, "count");
    if (v7)
    {
      if (v9 && objc_msgSend(v7, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "pathToPredictionTable");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v10, "attributesOfItemAtPath:error:", v11, &v33);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v33;

        if (v12 && !v13)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)objc_opt_new();
            objc_msgSend(v15, "timeIntervalSinceDate:", v14);
            v17 = v16;

            if (v17 < 43200.0)
            {
              __atxlog_handle_default();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v35 = v19;
                v36 = 2112;
                v37 = (uint64_t)v14;
                v38 = 2048;
                v39 = 0x40E5180000000000;
                _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "ATXMM: (%@) prediction table was last written to on %@, which is less than %f seconds ago. Skipping training", buf, 0x20u);

              }
LABEL_21:

              goto LABEL_22;
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "fetchAnchorOccurrences");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "correlateTriggerEvents:withAppLaunches:", v14, v6);
        v18 = objc_claimAutoreleasedReturnValue();
        __atxlog_handle_default();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[NSObject count](v18, "count");
          *(_DWORD *)buf = 138412546;
          v35 = v21;
          v36 = 2048;
          v37 = v22;
          _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_INFO, "ATXMM: (%@) num correlated events: %lu.", buf, 0x16u);

        }
        objc_msgSend((id)objc_opt_class(), "createTrainingDataForSubExpertsWithCorrelatedEvents:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_default();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
          v32 = v23;
          v25 = v18;
          v26 = v14;
          v27 = v12;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = v28;
          _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_INFO, "ATXMM: (%@) Finished generating data for training sub-experts.", buf, 0xCu);

          v12 = v27;
          v14 = v26;
          v18 = v25;
          v23 = v32;
        }

        objc_msgSend((id)objc_opt_class(), "trainSubExpertsWithTrainingData:correlatedEvents:appLaunchCountedSet:", v23, v18, v7);
        __atxlog_handle_default();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
          v30 = v12;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = v31;
          _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_INFO, "ATXMM: (%@) Completed training of all sub-experts, and, thus, of the expert.", buf, 0xCu);

          v12 = v30;
        }

        goto LABEL_21;
      }
    }
  }
  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:appLaunchCountedSet:].cold.1();
LABEL_22:

  objc_autoreleasePoolPop(v8);
}

+ (id)predictionTable
{
  return (id)objc_msgSend((id)objc_opt_class(), "predictionTableFromCache");
}

+ (id)predictionTableFromCache
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v14;
  id v15;

  v2 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend((id)objc_opt_class(), "pathToPredictionTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v2, "dataWithContentsOfFile:options:error:", v3, 0, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (v4)
  {
    v6 = (void *)MEMORY[0x1CAA48B6C]();
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    objc_autoreleasePoolPop(v6);
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      __atxlog_handle_default();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[ATXMMAppPredictionExpert predictionTableFromCache].cold.2();

      v9 = (id)objc_opt_new();
    }
    v11 = v9;

    v5 = v8;
  }
  else
  {
    if (objc_msgSend(v5, "code") != 260)
    {
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[ATXMMAppPredictionExpert predictionTableFromCache].cold.1();

    }
    v11 = (void *)objc_opt_new();
  }

  return v11;
}

+ (BOOL)shouldHandleTriggerEventWithRateLimiter:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "tryToIncrementCountAndReturnSuccess");

  v6 = objc_msgSend((id)objc_opt_class(), "shouldProcessContextStoreNotification");
  v7 = objc_msgSend((id)objc_opt_class(), "isExpertEnabledForPredictions");
  v8 = v7;
  if ((v5 & 1) != 0)
  {
    if ((v6 & v7 & 1) != 0)
    {
      v9 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[ATXMMAppPredictionExpert shouldHandleTriggerEventWithRateLimiter:].cold.1();

  }
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("NO");
    if (v6)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    v18 = 138413058;
    v19 = v12;
    if (v8)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v21 = v15;
    v20 = 2112;
    v22 = 2112;
    if (v5)
      v14 = CFSTR("YES");
    v23 = v16;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXMM: (%@) shouldHandleTriggerEvent returned NO for reasons: shouldProcessContextStoreNotification - %@ predictionExpertIsEnabled - %@ notRateLimited - %@", (uint8_t *)&v18, 0x2Au);

  }
  v9 = 0;
LABEL_18:

  return v9;
}

+ (void)setupEventListenerForInferenceWithContext:(id)a3 rateLimiter:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD aBlock[4];
  id v20;
  id v21[2];
  id from;
  id location;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:rateLimiter:].cold.1();

  objc_initWeak(&location, a1);
  objc_initWeak(&from, v7);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__ATXMMAppPredictionExpert_setupEventListenerForInferenceWithContext_rateLimiter___block_invoke;
  aBlock[3] = &unk_1E82DC090;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(v21, &from);
  v21[1] = a1;
  v9 = _Block_copy(aBlock);
  __atxlog_handle_default();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "ATXMM: (%@) Registering for trigger callbacks", buf, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "supportedAnchorClass");
  v12 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "predicateForContextStoreRegistration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D15C70];
  objc_msgSend((id)objc_opt_class(), "notificationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", v15, v13, CFSTR("com.apple.duetexpertd.cdidentifier"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "registerCallback:", v16);
  __atxlog_handle_default();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v18;
    _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "ATXMM: (%@) Done registering with the ContextStore.", buf, 0xCu);

  }
  objc_destroyWeak(v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __82__ATXMMAppPredictionExpert_setupEventListenerForInferenceWithContext_rateLimiter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXMM: (%@) Trigger listener called, %@", (uint8_t *)&v9, 0x16u);

  }
  +[ATXMMAppPredictionExpert logTriggeredMMMetricsEntryForAnchorType:](ATXMMAppPredictionExpert, "logTriggeredMMMetricsEntryForAnchorType:", objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass"), "anchorType"));
  if (WeakRetained
    && v6
    && objc_msgSend((id)objc_opt_class(), "shouldHandleTriggerEventWithRateLimiter:", v6))
  {
    objc_msgSend((id)objc_opt_class(), "fetchAndHandleTriggerEvent");
  }

}

+ (id)fetchPredictionsForTriggerEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "predictionTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictionsForTriggerEvent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)broadcastMMPredictionsForEvent:(id)a3 predictions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "predictionReasonForExpert");
  +[ATXMagicalMomentsPrediction convertPredictionsToPMMPredictionItems:reason:anchor:triggerEvent:](ATXMagicalMomentsPrediction, "convertPredictionsToPMMPredictionItems:reason:anchor:triggerEvent:", v5, v7, objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedAnchorClass"), "anchorType"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D810B8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handlePredictedApplications:", v8);
  __atxlog_handle_default();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "ATXMM: (%@) Broadcast MM predictions to all listeners.", (uint8_t *)&v12, 0xCu);

  }
}

+ (void)fetchAndHandleTriggerEvent
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "anchorTypeForExpert");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v1, v2, "ATXMM: (%@) - fetchAndHandleTriggerEvent. Failed to initialize a DuetEvent for the trigger from the ContextStore. Exiting before vending predictions.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)logTriggeredMMMetricsEntryForAnchorType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a3));
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "abGroupIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAbGroup:", v6);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackScalarForMessage:", v8);

}

+ (void)logPredictedScoreMMMetricsEntryForBundle:(id)a3 anchorType:(int64_t)a4 score:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a3;
  v12 = (id)objc_opt_new();
  objc_msgSend(v12, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a4));
  objc_msgSend(v12, "setTopBundleId:", v7);

  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "abGroupIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setAbGroup:", v10);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackDistributionForMessage:value:", v12, a5);

}

+ (void)logPredictedCountMMMetricsEntryForAnchorType:(int64_t)a3 numPredictions:(int)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_opt_new();
  objc_msgSend(v10, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a3));
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "abGroupIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAbGroup:", v8);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trackDistributionForMessage:value:", v10, (double)a4);

}

+ (int)mmAnchorTypeToMMProtobufAnchor:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 0x11)
    return a3;
  else
    return 0;
}

+ (void)fetchAnchorOccurrences
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "anchorTypeForExpert");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "ATXMM: (%@) Descriptions of found anchors:", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)tagEventWithLOIForEvent:.cold.1()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  __int16 v4;
  uint64_t v5;
  uint8_t v6[14];
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_4_0();
  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "anchorTypeForExpert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  v7 = v1;
  v8 = v4;
  v9 = v2;
  v10 = 2048;
  v11 = v5;
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "ATXMM: (%@) Fetching LOI for anchor event. LOI found for event: %@, uuid: %@, type: %ld", v6, 0x2Au);

}

+ (void)serializeAndWritePredictionTable:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (void *)objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "supportedAnchorClass");
  v1 = OUTLINED_FUNCTION_3_3(v0);
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "ATXMM: (%@) Unable to serialize prediction table. Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)serializeAndWritePredictionTable:.cold.2()
{
  NSObject *v0;
  void *v1;
  id v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_4_0();
  v1 = (void *)objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "supportedAnchorClass");
  v2 = OUTLINED_FUNCTION_3_3(v1);
  _os_log_fault_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_FAULT, "ATXMM: (%@) Could not write prediction table data for expert. Error: %@", v3, 0x16u);

  OUTLINED_FUNCTION_1();
}

+ (void)trainExpertWithAppLaunchEvents:appLaunchCountedSet:.cold.1()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "supportedAnchorClass");
  OUTLINED_FUNCTION_2();
  v1 = v0;
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "ATXMM: (%@) Error: Tried to initialize training for expert without providing App Launch Events or App Launch Counted Set", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)predictionTableFromCache
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "ATXMM: Unable to get prediction table: %@", v1, 0xCu);
}

+ (void)shouldHandleTriggerEventWithRateLimiter:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "anchorTypeForExpert");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v1, v2, "ATXMM: Encountered rate limit when trying to process %@ anchor occurrence.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)setupEventListenerForInferenceWithContext:rateLimiter:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "anchorTypeForExpert");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "ATXMM: (%@) Setting up the trigger event listener.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
