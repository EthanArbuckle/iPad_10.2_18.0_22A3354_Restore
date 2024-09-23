@implementation _CDSleepPredictor

+ (id)array:(id)a3 reduce:(id)a4 withInitialValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v8 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v9 = a5;
  v21 = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51___CDSleepPredictor_array_reduce_withInitialValue___block_invoke;
  v13[3] = &unk_1E26E3AE8;
  v15 = &v16;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (id)indexSetFromUnionOf:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3788];
  v5 = a3;
  objc_msgSend(v4, "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "array:reduce:withInitialValue:", v5, &__block_literal_global_12, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)arrayWithObject:(id)a3 repeated:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v7 = 0;
    do
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v5, v7++);
    while (a4 != v7);
  }
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

+ (id)array:(id)a3 map:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __31___CDSleepPredictor_array_map___block_invoke;
  v14[3] = &unk_1E26E3B30;
  v9 = v8;
  v15 = v9;
  v16 = v5;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

+ (id)array:(id)a3 filter:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34___CDSleepPredictor_array_filter___block_invoke;
  v11[3] = &unk_1E26E3B58;
  v12 = v5;
  v6 = v5;
  v7 = a3;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsAtIndexes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)mutableArray:(id)a3 replaceObjectsAtIndexes:(id)a4 withObjectFromBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78___CDSleepPredictor_mutableArray_replaceObjectsAtIndexes_withObjectFromBlock___block_invoke;
  v11[3] = &unk_1E26E3B80;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(a4, "enumerateIndexesUsingBlock:", v11);

}

+ (id)generateActivityBitmapFor:(id)a3 unlockedIntervals:(id)a4 eventsAvailableInterval:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  unint64_t v38;
  _QWORD v39[4];
  id v40;
  unint64_t v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "duration");
  v12 = (uint64_t)(v11 / 900.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObject:repeated:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v14;
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  v16 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __89___CDSleepPredictor_generateActivityBitmapFor_unlockedIntervals_eventsAvailableInterval___block_invoke;
  v39[3] = &unk_1E26E3BA8;
  v17 = v8;
  v40 = v17;
  v41 = v12;
  v35[0] = v16;
  v35[1] = 3221225472;
  v35[2] = __89___CDSleepPredictor_generateActivityBitmapFor_unlockedIntervals_eventsAvailableInterval___block_invoke_2;
  v35[3] = &unk_1E26E3BD0;
  v18 = (id)MEMORY[0x193FEEAF4](v39);
  v37 = v18;
  v31 = v17;
  v36 = v31;
  v38 = v12;
  v34 = v9;
  objc_msgSend(a1, "array:map:", v9, v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "indexSetFromUnionOf:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mutableArray:replaceObjectsAtIndexes:withObjectFromBlock:", v15);
  objc_msgSend(v10, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v10;
  objc_msgSend(v10, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (*((uint64_t (**)(id, void *))v18 + 2))(v18, v19);
  v30 = v18;
  v22 = (*((uint64_t (**)(id, void *))v18 + 2))(v18, v20);
  if (v21)
  {
    for (i = 0; i != v21; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:atIndexedSubscript:", v24, i);

    }
  }
  v25 = v22 + 1;
  if (v25 < v12)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:atIndexedSubscript:", v26, v25);

      ++v25;
    }
    while (v12 != v25);
  }

  return v15;
}

+ (id)predicateForInUseVaue
{
  void *v2;
  void *v3;

  +[_DKBoolCategory no](_DKBoolCategory, "no");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithCategoryValue:](_DKQuery, "predicateForEventsWithCategoryValue:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)fetchDeviceInUseDateIntervalsFromStore:(id)a3 whichIntersectInterval:(id)a4
{
  id v5;
  id v6;
  _DKEventQuery *v7;
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
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v27;
  _QWORD v28[2];
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_DKEventQuery);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_CDSleepPredictor.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(":%d"), 166);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKQuery setClientName:](v7, "setClientName:", v9);

  -[_DKQuery setTracker:](v7, "setTracker:", &__block_literal_global_18);
  +[_DKSystemEventStreams deviceInUseProxyStream](_DKSystemEventStreams, "deviceInUseProxyStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setEventStreams:](v7, "setEventStreams:", v11);

  -[_DKEventQuery setOffset:](v7, "setOffset:", 0);
  -[_DKEventQuery setLimit:](v7, "setLimit:", 0);
  +[_DKQuery startDateSortDescriptorAscending:](_DKQuery, "startDateSortDescriptorAscending:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setSortDescriptors:](v7, "setSortDescriptors:", v13);

  objc_msgSend(v6, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsIntersectingDateRangeFrom:to:](_DKQuery, "predicateForEventsIntersectingDateRangeFrom:to:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDSleepPredictor predicateForInUseVaue](_CDSleepPredictor, "predicateForInUseVaue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3528];
  v28[0] = v16;
  v28[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setPredicate:](v7, "setPredicate:", v20);

  -[_DKEventQuery setResultType:](v7, "setResultType:", 2);
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    +[_CDSleepPredictor fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:].cold.2();

  v27 = 0;
  objc_msgSend(v5, "executeQuery:error:", v7, &v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v27;
  if (v23)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[_CDSleepPredictor fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:].cold.1();

    v25 = 0;
  }
  else
  {
    v25 = v22;
  }

  return v25;
}

+ (id)fetchFirstEventDateIntervalFromStore:(id)a3 forStream:(id)a4 sortDateAscending:(BOOL)a5 intersectingInterval:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  _DKEventQuery *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  void *v37;
  _QWORD v38[2];

  v7 = a5;
  v38[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(_DKEventQuery);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_CDSleepPredictor.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(":%d"), 201);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKQuery setClientName:](v12, "setClientName:", v14);

  -[_DKQuery setTracker:](v12, "setTracker:", &__block_literal_global_24);
  v38[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setEventStreams:](v12, "setEventStreams:", v15);

  -[_DKEventQuery setOffset:](v12, "setOffset:", 0);
  -[_DKEventQuery setLimit:](v12, "setLimit:", 1);
  +[_DKQuery startDateSortDescriptorAscending:](_DKQuery, "startDateSortDescriptorAscending:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setSortDescriptors:](v12, "setSortDescriptors:", v17);

  objc_msgSend(v11, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsIntersectingDateRangeFrom:to:](_DKQuery, "predicateForEventsIntersectingDateRangeFrom:to:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setPredicate:](v12, "setPredicate:", v20);

  -[_DKEventQuery setResultType:](v12, "setResultType:", 2);
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v27 = CFSTR("last");
    *(_DWORD *)buf = 138413058;
    if (v7)
      v27 = CFSTR("first");
    v30 = v27;
    v31 = 2112;
    v32 = v9;
    v33 = 2112;
    v34 = v10;
    v35 = 2112;
    v36 = v11;
    _os_log_debug_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_DEBUG, "Executing query for %@ event in stream %@ on store %@ in date range %@", buf, 0x2Au);
  }

  v28 = 0;
  objc_msgSend(v9, "executeQuery:error:", v12, &v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v28;
  if (v23)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[_CDSleepPredictor fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:].cold.1();

    v25 = 0;
  }
  else
  {
    objc_msgSend(v22, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

+ (id)gatherBitmapHistoryFromStore:(id)a3 forPeriod:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  +[_DKSystemEventStreams deviceInUseProxyStream](_DKSystemEventStreams, "deviceInUseProxyStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchFirstEventDateIntervalFromStore:forStream:sortDateAscending:intersectingInterval:", v6, v8, 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[_DKSystemEventStreams deviceInUseProxyStream](_DKSystemEventStreams, "deviceInUseProxyStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fetchFirstEventDateIntervalFromStore:forStream:sortDateAscending:intersectingInterval:", v6, v10, 0, v7);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(a1, "fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:", v6, v7);
      v12 = objc_claimAutoreleasedReturnValue();
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[_CDSleepPredictor gatherBitmapHistoryFromStore:forPeriod:].cold.3(v12, v13);

      v14 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v9, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject endDate](v11, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithStartDate:endDate:", v15, v16);

      objc_msgSend(a1, "generateActivityBitmapFor:unlockedIntervals:eventsAvailableInterval:", v7, v12, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[_CDSleepPredictor gatherBitmapHistoryFromStore:forPeriod:].cold.2(v12, v26, v27, v28, v29, v30, v31, v32);
      v18 = 0;
    }

  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[_CDSleepPredictor gatherBitmapHistoryFromStore:forPeriod:].cold.1(v11, v19, v20, v21, v22, v23, v24, v25);
    v18 = 0;
  }

  return v18;
}

+ (id)findSleepPeriodInDayStarting:(id)a3 FromActivityProbabilities:(id)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  __int16 v13;
  uint8_t buf[2];

  objc_msgSend(a1, "findAllSleepPeriodsInDayStarting:FromActivityProbabilities:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duration");
    v7 = v6;

    if (v7 >= 14400.0)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 0;
      v9 = "Sleep Prediction: final stage: detected sleep too short";
      v10 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
    }
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Sleep Prediction: final stage: no sleep periods predicted";
      v10 = buf;
      goto LABEL_7;
    }
  }

  v11 = 0;
LABEL_10:

  return v11;
}

+ (id)findAllSleepPeriodsInDayStarting:(id)a3 FromActivityProbabilities:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  objc_msgSend(a1, "array:map:", a4, &__block_literal_global_30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", &__block_literal_global_32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_3;
  v22[3] = &unk_1E26E3C98;
  v23 = v9;
  v11 = v9;
  objc_msgSend(v8, "enumerateRangesUsingBlock:", v22);
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  v18 = 3221225472;
  v19 = __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_5;
  v20 = &unk_1E26E3CE0;
  v21 = v6;
  v13 = v6;
  v14 = (void *)MEMORY[0x193FEEAF4](&v17);
  objc_msgSend(a1, "array:map:", v12, v14, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (void)fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "Sleep Prediction: executeQuery returned %@", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_18DDBE000, v1, OS_LOG_TYPE_DEBUG, "Executing query for unlock events on store %@ in date range %@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

+ (void)gatherBitmapHistoryFromStore:(uint64_t)a3 forPeriod:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, a1, a3, "Sleep Prediction: No data returned for screen lock in period of interest", a5, a6, a7, a8, 0);
}

+ (void)gatherBitmapHistoryFromStore:(uint64_t)a3 forPeriod:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, a1, a3, "We should have found an event given we got here!", a5, a6, a7, a8, 0);
}

+ (void)gatherBitmapHistoryFromStore:(void *)a1 forPeriod:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a2, v3, "Obtained %lu screen unlock events", v4);
}

@end
