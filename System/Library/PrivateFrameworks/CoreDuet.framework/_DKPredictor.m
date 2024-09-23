@implementation _DKPredictor

- (id)pluginLikelihood
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v24;
  os_activity_scope_state_s state;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_18DDBE000, "Duet: pluginLikelihood", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  +[_DKQuery predicateForEventsWithIntegerValue:](_DKQuery, "predicateForEventsWithIntegerValue:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventQuery predicateForEventsOfMinimumDuration:](_DKEventQuery, "predicateForEventsOfMinimumDuration:", 300.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  v26[0] = v4;
  v26[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKSystemEventStreams deviceIsPluggedInStream](_DKSystemEventStreams, "deviceIsPluggedInStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKPredictionQuery predictionQueryForStream:withPredicate:withPredictionType:](_DKPredictionQuery, "predictionQueryForStream:withPredicate:withPredictionType:", v9, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  knowledgeStore = self->_knowledgeStore;
  v24 = 0;
  -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v10, &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v24;
  if (v13)
  {
    objc_opt_class();
    +[_DKPredictor predictorLog]();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_DKPredictor pluginLikelihood].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

    +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = v12;
  }
  v22 = v21;

  return v22;
}

- (id)deviceActivityLikelihood
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _DKPredictionQueryFeedback *v18;
  _DKKnowledgeQuerying *v19;
  void *v20;
  void *v21;
  id v23;
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_18DDBE000, "Duet: deviceActivityLikelihood", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  objc_msgSend((id)objc_opt_class(), "deviceActivityLikelihoodQueryPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKPredictionQuery predictionQueryForStream:withPredicate:withPredictionType:](_DKPredictionQuery, "predictionQueryForStream:withPredicate:withPredictionType:", v5, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMinimumDaysOfHistory:", 3);
  objc_msgSend(v6, "setSlotDuration:", 900);
  objc_msgSend(v6, "setPartitionType:", 2);
  objc_msgSend(v6, "setUseHistoricalHistogram:", 1);
  knowledgeStore = self->_knowledgeStore;
  v23 = 0;
  -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v6, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  if (v9)
  {
    objc_opt_class();
    +[_DKPredictor predictorLog]();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_DKPredictor deviceActivityLikelihood].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

    +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_alloc_init(_DKPredictionQueryFeedback);
    v19 = self->_knowledgeStore;
    objc_msgSend(v8, "startHistogram");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endHistogram");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPredictionQueryFeedback logPredictionQueryFeedback:endHistogram:withStorage:](v18, "logPredictionQueryFeedback:endHistogram:withStorage:", v20, v21, v19);

    objc_msgSend(v8, "setStartHistogram:", 0);
    objc_msgSend(v8, "setEndHistogram:", 0);
    v17 = v8;

  }
  return v17;
}

+ (id)deviceActivityLikelihoodQueryPredicate
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_activity_scope_state_s state;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = _os_activity_create(&dword_18DDBE000, "Duet: deviceActivityLikelihoodQueryPredicate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  +[_DKQuery predicateForEventsExcludingIntegerValue:](_DKQuery, "predicateForEventsExcludingIntegerValue:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsExcludingIntegerValue:](_DKQuery, "predicateForEventsExcludingIntegerValue:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  v10[0] = v3;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)initWithKnowledgeStore:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_DKPredictor;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

+ (id)predictorWithKnowledgeStore:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = -[_DKPredictor initWithKnowledgeStore:]((id *)objc_alloc((Class)a1), v4);

  return v5;
}

+ (id)predictorLog
{
  objc_opt_self();
  if (predictorLog_onceToken != -1)
    dispatch_once(&predictorLog_onceToken, &__block_literal_global_67);
  return (id)predictorLog_predictorLog;
}

- (id)launchLikelihoodPredictionForApp:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v23;
  os_activity_scope_state_s state;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_18DDBE000, "Duet: launchLikelihoodPredictionForApp", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  if (v4)
  {
    +[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  +[_DKEventQuery predicateForEventsOfMinimumDuration:](_DKEventQuery, "predicateForEventsOfMinimumDuration:", 5.0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    v26[0] = v6;
    v26[1] = v7;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = v26;
    v11 = 2;
  }
  else
  {
    v25 = v7;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = &v25;
    v11 = 1;
  }
  objc_msgSend(v9, "arrayWithObjects:count:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKPredictionQuery predictionQueryForStream:withPredicate:withPredictionType:](_DKPredictionQuery, "predictionQueryForStream:withPredicate:withPredictionType:", v14, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  knowledgeStore = self->_knowledgeStore;
  v23 = 0;
  -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v15, &v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v23;
  if (v18)
  {
    objc_opt_class();
    +[_DKPredictor predictorLog]();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_DKPredictor launchLikelihoodPredictionForApp:].cold.1();

    +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = v17;
  }
  v21 = v20;

  return v21;
}

- (id)launchLikelihoodForTopNApplications:(int64_t)a3 withLikelihoodGreaterThan:(double)a4 withTemporalResolution:(int)a5
{
  uint64_t v5;
  NSObject *v9;
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
  _DKKnowledgeQuerying *knowledgeStore;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _BYTE state[22];
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _QWORD v36[3];

  v5 = *(_QWORD *)&a5;
  v36[2] = *MEMORY[0x1E0C80C00];
  v9 = _os_activity_create(&dword_18DDBE000, "Duet: launchLikelihoodForTopNApplications", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  +[_DKEventQuery predicateForEventsOfMinimumDuration:](_DKEventQuery, "predicateForEventsOfMinimumDuration:", 5.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  +[_DKApplicationMetadataKey extensionHostIdentifier](_DKApplicationMetadataKey, "extensionHostIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForObjectsWithMetadataKey:](_DKQuery, "predicateForObjectsWithMetadataKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notPredicateWithSubpredicate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3528];
  v36[0] = v10;
  v36[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKPredictionQuery topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:](_DKPredictionQuery, "topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:", v18, v17, a3, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setReadMetadata:", 1);
  objc_msgSend(v19, "setSlotDuration:", v5);
  knowledgeStore = self->_knowledgeStore;
  v30 = 0;
  -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v19, &v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v30;
  if (v22)
  {
    objc_opt_class();
    +[_DKPredictor predictorLog]();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)state = 138413058;
      *(_QWORD *)&state[4] = v27;
      *(_WORD *)&state[12] = 2112;
      *(_QWORD *)&state[14] = v28;
      v32 = 2112;
      v33 = v29;
      v34 = 2112;
      v35 = v22;
      _os_log_error_impl(&dword_18DDBE000, v23, OS_LOG_TYPE_ERROR, "Error executing top %@ query > %@ / %@: %@", state, 0x2Au);

    }
    +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = v21;
  }
  v25 = v24;

  return v25;
}

- (id)displayOnLikelihood
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v23;
  os_activity_scope_state_s state;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_18DDBE000, "Duet: displayOnLikelihood", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  +[_DKQuery predicateForEventsWithIntegerValue:](_DKQuery, "predicateForEventsWithIntegerValue:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  v25[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKSystemEventStreams displayIsBacklit](_DKSystemEventStreams, "displayIsBacklit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKPredictionQuery predictionQueryForStream:withPredicate:withPredictionType:](_DKPredictionQuery, "predictionQueryForStream:withPredicate:withPredictionType:", v8, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  knowledgeStore = self->_knowledgeStore;
  v23 = 0;
  -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v9, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  if (v12)
  {
    objc_opt_class();
    +[_DKPredictor predictorLog]();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_DKPredictor displayOnLikelihood].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

    +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = v11;
  }
  v21 = v20;

  return v21;
}

- (id)predictionForStreamWithName:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date", v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:asOfDate:](self, v11, v9, a5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (_QWORD)predictionForStreamsWithNames:(void *)a3 withPredicate:(uint64_t)a4 withPredictionType:(void *)a5 asOfDate:
{
  if (a1)
  {
    -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:withDataPartitionType:asOfDate:](a1, a2, a3, a4, 1, a5);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)predictionForStreamsWithNames:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:asOfDate:](self, v10, v9, a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)predictionForStreamWithName:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5 asOfDate:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v17[0] = a3;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:asOfDate:](self, v14, v12, a5, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)predictionForStreamWithName:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5 withDataPartitionType:(unint64_t)a6 asOfDate:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v19[0] = a3;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a7;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:withDataPartitionType:asOfDate:](self, v16, v14, a5, a6, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (_QWORD)predictionForStreamsWithNames:(void *)a3 withPredicate:(uint64_t)a4 withPredictionType:(uint64_t)a5 withDataPartitionType:(void *)a6 asOfDate:
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  _QWORD *v27;
  void *context;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  os_activity_scope_state_s state;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a6;
  if (a1)
  {
    v12 = _os_activity_create(&dword_18DDBE000, "Duet: predictionForStreamsWithNames", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v12, &state);
    os_activity_scope_leave(&state);

    context = (void *)MEMORY[0x193FEE914]();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v16);
    }

    v20 = (void *)objc_msgSend(v13, "copy");
    v21 = v10;
    +[_DKPredictionQuery predictionQueryForStreams:withPredicate:withPredictionType:](_DKPredictionQuery, "predictionQueryForStreams:withPredicate:withPredictionType:", v20, v10, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setAsOfDate:", v11);
    objc_msgSend(v22, "setPartitionType:", a5);
    v23 = (void *)a1[1];
    v32 = 0;
    objc_msgSend(v23, "executeQuery:error:", v22, &v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v32;
    if (v25)
    {
      objc_opt_class();
      +[_DKPredictor predictorLog]();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:withDataPartitionType:asOfDate:].cold.1();

      +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
      v27 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = v24;
    }
    a1 = v27;

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v21 = v10;
  }

  return a1;
}

+ (id)defaultPeriodAtDate:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 32, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hour") <= 6)
  {
    objc_msgSend(v2, "dateByAddingTimeInterval:", -86400.0);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v5;
  }
  objc_msgSend(v3, "startOfDayForDate:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", 72000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dateByAddingTimeInterval:", 39600.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localInBedPeriod
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v3 = _os_activity_create(&dword_18DDBE000, "Duet: localInBedPeriod", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v3, &v8);
  os_activity_scope_leave(&v8);

  -[_DKPredictor deviceActivityLikelihood](self, "deviceActivityLikelihood");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isUnavailable"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKPredictor defaultPeriodAtDate:]((uint64_t)_DKPredictor, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "largestDateRangeWithValuesBetween:and:ofMinimumDuration:", 0.0, 0.1, 21600.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)expectedInBedPeriod
{
  NSObject *v3;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_18DDBE000, "Duet: expectedInBedPeriod", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  os_activity_scope_leave(&v5);

  -[_DKPredictor localInBedPeriod](self, "localInBedPeriod");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)launchLikelihoodPredictionForApp:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_9(&dword_18DDBE000, v0, v1, "Error executing timeline query for likelihood of %@ launch: %@");
  OUTLINED_FUNCTION_5();
}

- (void)pluginLikelihood
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Error executing plugin likelihood query: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)displayOnLikelihood
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Error executing display likelihood query: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)deviceActivityLikelihood
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Error executing activity likelihood query: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)predictionForStreamsWithNames:withPredicate:withPredictionType:withDataPartitionType:asOfDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_9(&dword_18DDBE000, v0, v1, "Error executing timeline query: %@ (%@)");
  OUTLINED_FUNCTION_5();
}

@end
