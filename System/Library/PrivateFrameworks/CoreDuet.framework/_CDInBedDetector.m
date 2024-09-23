@implementation _CDInBedDetector

+ (id)inBedDetectorWithKnowledge:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKnowledge:method:", v4, 2);

  return v5;
}

+ (id)inBedDetectorWithKnowledge:(id)a3 method:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKnowledge:method:", v6, a4);

  return v7;
}

+ (id)inBedDetector
{
  void *v3;
  void *v4;

  +[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "inBedDetectorWithKnowledge:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_CDInBedDetector)initWithKnowledge:(id)a3 method:(unint64_t)a4
{
  id v7;
  _CDInBedDetector *v8;
  _CDInBedDetector *v9;
  os_log_t v10;
  os_log_t v11;
  os_log_t v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CDInBedDetector;
  v8 = -[_CDInBedDetector init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_knowledge, a3);
    v9->_method = a4;
    v10 = os_log_create("com.apple.coreduet.inBedDetector", ");
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (os_log_t)MEMORY[0x1E0C81028];
    objc_storeStrong((id *)&v9->_log, v12);

  }
  return v9;
}

+ (double)hoursOfSleepForResult:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "endDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceDate:", v11);
        v7 = v7 + v12 / 3600.0;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)detectInBedBetweenBedtimeDate:(id)a3 wakupDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *log;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x193FEE914]();
  if (!-[_CDInBedDetector method](self, "method"))
  {
    v31 = 0;
    -[_CDInBedDetector lockedTimesBetweenStartDate:endDate:error:](self, "lockedTimesBetweenStartDate:endDate:error:", v8, v9, &v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v31;
    goto LABEL_5;
  }
  if (-[_CDInBedDetector method](self, "method") == 1)
  {
    v30 = 0;
    -[_CDInBedDetector detectInBedWithPolicyV1BetweenStartDate:endDate:error:](self, "detectInBedWithPolicyV1BetweenStartDate:endDate:error:", v8, v9, &v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v30;
LABEL_5:
    v13 = v12;
    goto LABEL_6;
  }
  v29 = 0;
  -[_CDInBedDetector detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:](self, "detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:", v8, v9, &v29, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v29;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v16 = log;
    objc_msgSend((id)objc_opt_class(), "hoursOfSleepForResult:", v11);
    *(_DWORD *)buf = 134217984;
    v33 = v17;
    _os_log_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_DEFAULT, "ProactiveSleepDebugging: Sleep time under modified model - simple lock-based session splitting %f", buf, 0xCu);

  }
  if (+[_CDDeviceInfo isRunningOnInternalBuild](_CDDeviceInfo, "isRunningOnInternalBuild"))
  {
    v28 = v13;
    -[_CDInBedDetector detectInBedWithPolicyV1BetweenStartDate:endDate:error:](self, "detectInBedWithPolicyV1BetweenStartDate:endDate:error:", v8, v9, &v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v28;

    v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend((id)objc_opt_class(), "hoursOfSleepForResult:", v18);
      *(_DWORD *)buf = 134217984;
      v33 = v22;
      _os_log_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_DEFAULT, "ProactiveSleepDebugging: Sleep time under old model %f", buf, 0xCu);

    }
    v27 = v19;
    -[_CDInBedDetector detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:](self, "detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:", v8, v9, &v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;

    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      objc_msgSend((id)objc_opt_class(), "hoursOfSleepForResult:", v23);
      *(_DWORD *)buf = 134217984;
      v33 = v26;
      _os_log_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_DEFAULT, "ProactiveSleepDebugging: Sleep time under modified model - motion-based session splitting %f", buf, 0xCu);

    }
  }
LABEL_6:
  objc_autoreleasePoolPop(v10);
  if (a5 && v13)
    *a5 = objc_retainAutorelease(v13);

  return v11;
}

- (id)lockedTimesBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _DKEventQuery *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  BOOL v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  _CDInBedDetection *v52;
  void *v53;
  void *v54;
  double v55;
  _CDInBedDetection *v56;
  void *v57;
  int v58;
  _CDInBedDetection *v59;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  _DKEventQuery *v68;
  void *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  id v76;
  _BYTE v77[128];
  _CDInBedDetection *v78;
  void *v79;
  _QWORD v80[2];
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v69 = v8;
  +[_DKQuery predicateForEventsIntersectingDateRangeFrom:to:](_DKQuery, "predicateForEventsIntersectingDateRangeFrom:to:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKBoolCategory no](_DKBoolCategory, "no");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithCategoryValue:](_DKQuery, "predicateForEventsWithCategoryValue:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(_DKEventQuery);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_CDInBedDetector.m");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(":%d"), 123);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKQuery setClientName:](v13, "setClientName:", v15);

  -[_DKQuery setTracker:](v13, "setTracker:", &__block_literal_global_27);
  +[_DKSystemEventStreams deviceIsLockedStream](_DKSystemEventStreams, "deviceIsLockedStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setEventStreams:](v13, "setEventStreams:", v17);

  v18 = (void *)MEMORY[0x1E0CB3528];
  v80[0] = v10;
  v80[1] = v12;
  v67 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setPredicate:](v13, "setPredicate:", v20);

  +[_DKQuery startDateSortDescriptorAscending:](_DKQuery, "startDateSortDescriptorAscending:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setSortDescriptors:](v13, "setSortDescriptors:", v22);

  -[_DKEventQuery setResultType:](v13, "setResultType:", 2);
  -[_CDInBedDetector knowledge](self, "knowledge");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  v68 = v13;
  objc_msgSend(v23, "executeQuery:error:", v13, &v76);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v76;

  if (a5 && v25)
  {
    v26 = objc_retainAutorelease(v25);
    v70 = 0;
    *a5 = v26;
    v27 = v67;
    v28 = v69;
  }
  else
  {
    v63 = v24;
    v64 = v10;
    +[_DKSystemEventStreams deviceIsLockedStream](_DKSystemEventStreams, "deviceIsLockedStream");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v69;
    v65 = v9;
    +[_DKQuery predicateForEventsWithEndInDateRangeFrom:to:](_DKQuery, "predicateForEventsWithEndInDateRangeFrom:to:", v69, v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKBoolCategory yes](_DKBoolCategory, "yes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsWithCategoryValue:](_DKQuery, "predicateForEventsWithCategoryValue:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery endDateSortDescriptorAscending:](_DKQuery, "endDateSortDescriptorAscending:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v25;
    -[_CDInBedDetector findDateIntervalOfEventInStream:datePredicate:valuePredicate:sortDescriptor:error:](self, "findDateIntervalOfEventInStream:datePredicate:valuePredicate:sortDescriptor:error:", v29, v30, v32, v33, &v75);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v75;

    objc_msgSend(v34, "endDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v35;
    if (a5 && v35)
    {
      v70 = 0;
      *a5 = objc_retainAutorelease(v35);
      v10 = v64;
      v9 = v65;
      v27 = v67;
      v24 = v63;
    }
    else
    {
      if (v36)
      {
        v24 = v63;
        v10 = v64;
        v9 = v65;
        if (!objc_msgSend(v63, "count"))
          goto LABEL_11;
        objc_msgSend(v63, "lastObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "endDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v36;
        v40 = objc_msgSend(v38, "compare:", v36);

        v41 = v40 == -1;
        v36 = v39;
        if (v41)
        {
LABEL_11:
          v42 = v36;

          v9 = v42;
        }
      }
      else
      {
        v10 = v64;
        v9 = v65;
        v24 = v63;
      }
      if (objc_msgSend(v24, "count"))
      {
        v61 = v36;
        v62 = v26;
        v66 = v9;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v70 = (id)objc_claimAutoreleasedReturnValue();
        v43 = v69;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v44 = v24;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v72;
          v48 = v43;
          do
          {
            v49 = 0;
            v50 = v48;
            do
            {
              if (*(_QWORD *)v72 != v47)
                objc_enumerationMutation(v44);
              v51 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v49);
              v52 = objc_alloc_init(_CDInBedDetection);
              -[_CDInBedDetection setStartDate:](v52, "setStartDate:", v50);
              objc_msgSend(v51, "startDate");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "laterDate:", v43);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[_CDInBedDetection setEndDate:](v52, "setEndDate:", v54);

              -[_CDInBedDetection setConfidence:](v52, "setConfidence:", 1.0);
              -[_CDInBedDetection duration](v52, "duration");
              if (v55 > 0.0)
                objc_msgSend(v70, "addObject:", v52);
              objc_msgSend(v51, "endDate");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              ++v49;
              v50 = v48;
            }
            while (v46 != v49);
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
          }
          while (v46);
        }
        else
        {
          v48 = v43;
        }

        v9 = v66;
        objc_msgSend(v48, "earlierDate:", v66);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "isEqualToDate:", v48);

        if (v58)
        {
          v59 = objc_alloc_init(_CDInBedDetection);
          -[_CDInBedDetection setStartDate:](v59, "setStartDate:", v48);
          -[_CDInBedDetection setEndDate:](v59, "setEndDate:", v66);
          objc_msgSend(v70, "addObject:", v59);

        }
        v28 = v69;
        v24 = v63;
        v10 = v64;
        v27 = v67;
        v36 = v61;
        v26 = v62;
      }
      else
      {
        v56 = objc_alloc_init(_CDInBedDetection);
        -[_CDInBedDetection setStartDate:](v56, "setStartDate:", v69);
        -[_CDInBedDetection setEndDate:](v56, "setEndDate:", v9);
        v78 = v56;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
        v70 = (id)objc_claimAutoreleasedReturnValue();

        v27 = v67;
      }
    }

  }
  return v70;
}

- (id)detectInBedWithPolicyV1BetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *log;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  const __CFString *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51[2];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  const __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "dateByAddingTimeInterval:", -3600.0);
  v51[1] = 0;
  v48 = v7;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInBedDetector findLatestEndOfMovementBetweenStartDate:endDate:error:](self, "findLatestEndOfMovementBetweenStartDate:endDate:error:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (v10)
  {
    v11 = v10;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[_CDInBedDetector detectInBedWithPolicyV1BetweenStartDate:endDate:error:].cold.2();

  }
  else if (!v9 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[_CDInBedDetector detectInBedWithPolicyV1BetweenStartDate:endDate:error:].cold.1();
  }
  v12 = v48;
  if (v9)
    v12 = v9;
  v13 = v12;

  v14 = v13;
  objc_msgSend(v14, "dateByAddingTimeInterval:", 5400.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = 0;
  -[_CDInBedDetector findLastTimeDeviceWasLockedBetweenStartDate:endDate:error:](self, "findLastTimeDeviceWasLockedBetweenStartDate:endDate:error:", v14, v15, v51);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v51[0];
  if (v17)
  {
    v18 = v17;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v53 = v14;
      v54 = 2112;
      v55 = v15;
      v56 = 2112;
      v57 = v18;
      _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "Error finding last lock date between %@ and %@: %@", buf, 0x20u);
    }

  }
  v20 = v14;
  if (v16)
  {
    objc_msgSend(v14, "laterDate:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v50 = 0;
  -[_CDInBedDetector findLastTimeDeviceWasPluggedInBetweenStartDate:endDate:error:](self, "findLastTimeDeviceWasPluggedInBetweenStartDate:endDate:error:", v14, v15, &v50);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v50;
  if (v22)
  {
    v23 = v22;
    v24 = v21;
    v25 = self->_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v53 = v14;
      v54 = 2112;
      v55 = v15;
      v56 = 2112;
      v57 = v23;
      _os_log_error_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_ERROR, "Error finding last date device was plugged in between %@ and %@: %@", buf, 0x20u);
    }

    v21 = v24;
  }
  if (v21)
  {
    objc_msgSend(v20, "laterDate:", v21);
    v26 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v26;
  }
  if (objc_msgSend(0, "count"))
  {
    v27 = (void *)objc_msgSend(0, "copy");
    v47 = 0;
    v28 = CFSTR("motion");
  }
  else
  {
    v49 = 0;
    -[_CDInBedDetector lockedTimesBetweenStartDate:endDate:error:](self, "lockedTimesBetweenStartDate:endDate:error:", v20, v8, &v49);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v49;
    if (v47)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v47);
      v29 = self->_log;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v53 = v20;
        v54 = 2112;
        v55 = v8;
        v56 = 2112;
        v57 = v47;
        _os_log_error_impl(&dword_18DDBE000, v29, OS_LOG_TYPE_ERROR, "Error identifying locked times between %@ and %@: %@", buf, 0x20u);
      }
    }
    else
    {
      v47 = 0;
    }
    v28 = CFSTR("screenlock");
  }
  v45 = v28;
  v30 = self->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v42 = v21;
    v31 = (void *)MEMORY[0x1E0CB37E8];
    v32 = v30;
    objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "startDate");
    v43 = v8;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastObject");
    v41 = v16;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "endDate");
    v37 = v27;
    v38 = v15;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v53 = v33;
    v54 = 2112;
    v55 = v35;
    v56 = 2112;
    v57 = v39;
    v58 = 2112;
    v59 = v45;
    _os_log_impl(&dword_18DDBE000, v32, OS_LOG_TYPE_DEFAULT, "Found %@ in-bed intervals between %@ & %@ using %@-based heuristic", buf, 0x2Au);

    v15 = v38;
    v27 = v37;

    v16 = v41;
    v8 = v43;

    v21 = v42;
  }

  return v27;
}

- (id)detectInBedWithPolicyV2BetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5 motionBased:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *log;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  double v53;
  _CDInBedDetection *v54;
  void *v55;
  void *v56;
  _CDInBedDetector *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  const __CFString *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  uint8_t buf[4];
  id v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  const __CFString *v105;
  _BYTE v106[128];
  uint64_t v107;

  v6 = a6;
  v107 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "dateByAddingTimeInterval:", 14400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", -60.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v11;
  objc_msgSend(v11, "earlierDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0;
  -[_CDInBedDetector findLatestEndOfMovementBetweenStartDate:endDate:error:](self, "findLatestEndOfMovementBetweenStartDate:endDate:error:", v9, v13, &v97);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v97;

  if (v15)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[_CDInBedDetector detectInBedWithPolicyV1BetweenStartDate:endDate:error:].cold.2();

  }
  else if (!v14 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[_CDInBedDetector detectInBedWithPolicyV1BetweenStartDate:endDate:error:].cold.1();
  }
  if (v14)
    v16 = v14;
  else
    v16 = v9;
  v17 = v16;

  v18 = v17;
  objc_msgSend(v18, "dateByAddingTimeInterval:", 5400.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", -60.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "earlierDate:", v20);
  v21 = objc_claimAutoreleasedReturnValue();

  v96 = 0;
  -[_CDInBedDetector findLastTimeDeviceWasLockedBetweenStartDate:endDate:error:](self, "findLastTimeDeviceWasLockedBetweenStartDate:endDate:error:", v18, v21, &v96);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v96;
  if (v23)
  {
    v24 = v23;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v99 = v18;
      v100 = 2112;
      v101 = v21;
      v102 = 2112;
      v103 = v24;
      _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "Error finding last lock date between %@ and %@: %@", buf, 0x20u);
    }

  }
  v26 = v18;
  if (v22)
  {
    objc_msgSend(v18, "laterDate:", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v95 = 0;
  -[_CDInBedDetector findLastTimeDeviceWasPluggedInBetweenStartDate:endDate:error:](self, "findLastTimeDeviceWasPluggedInBetweenStartDate:endDate:error:", v18, v21, &v95);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v95;
  if (v27)
  {
    v28 = v27;
    v29 = v26;
    v30 = self->_log;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v99 = v18;
      v100 = 2112;
      v101 = v21;
      v102 = 2112;
      v103 = v28;
      _os_log_error_impl(&dword_18DDBE000, v30, OS_LOG_TYPE_ERROR, "Error finding last date device was plugged in between %@ and %@: %@", buf, 0x20u);
    }

    v26 = v29;
  }
  if (v87)
  {
    objc_msgSend(v26, "laterDate:");
    v31 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v31;
  }
  objc_msgSend(v10, "dateByAddingTimeInterval:", -3600.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "timeIntervalSinceReferenceDate");
  v34 = v33;
  objc_msgSend(v26, "timeIntervalSinceReferenceDate");
  v85 = v32;
  v86 = v26;
  if (v34 <= v35)
  {
    v39 = self->_log;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DDBE000, v39, OS_LOG_TYPE_DEFAULT, "Bedtime started less than an hour before end date, not performing further movement based changes on end date", buf, 2u);
    }
LABEL_33:
    v36 = 0;
    goto LABEL_34;
  }
  v94 = 0;
  -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:](self, "findMotionTerminusBetweenStartDate:endDate:latest:error:", v32, v10, 0, &v94);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v94;
  if (!v37)
  {
    if (v36)
      goto LABEL_34;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[_CDInBedDetector detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:].cold.1();
    goto LABEL_33;
  }
  v38 = v37;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    -[_CDInBedDetector detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:].cold.2();

LABEL_34:
  v79 = (void *)v36;
  if (v36)
    v40 = (void *)v36;
  else
    v40 = v10;
  v41 = v40;

  v83 = v9;
  v84 = v41;
  v80 = (void *)v21;
  v81 = v18;
  if (v6)
  {
    v93 = 0;
    -[_CDInBedDetector stationaryIntervalsBetweenStartDate:endDate:error:](self, "stationaryIntervalsBetweenStartDate:endDate:error:", v26, v41, &v93);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v93;
    if (v43)
    {
      v44 = v43;
      v45 = self->_log;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v99 = v86;
        v100 = 2112;
        v101 = (uint64_t)v84;
        v102 = 2112;
        v103 = v44;
        _os_log_error_impl(&dword_18DDBE000, v45, OS_LOG_TYPE_ERROR, "Error finding stationary intervals between %@ and %@: %@", buf, 0x20u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v47 = v42;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v90 != v50)
            objc_enumerationMutation(v47);
          v52 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
          objc_msgSend(v52, "duration");
          if (v53 >= 300.0)
          {
            v54 = objc_alloc_init(_CDInBedDetection);
            objc_msgSend(v52, "startDate");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDInBedDetection setStartDate:](v54, "setStartDate:", v55);

            objc_msgSend(v52, "endDate");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDInBedDetection setEndDate:](v54, "setEndDate:", v56);

            -[_CDInBedDetection setConfidence:](v54, "setConfidence:", 1.0);
            objc_msgSend(v46, "addObject:", v54);

          }
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
      }
      while (v49);
    }
    v57 = self;

    v58 = v83;
    v26 = v86;
  }
  else
  {
    v57 = self;
    v58 = v9;
    v46 = 0;
  }
  v59 = v85;
  if (objc_msgSend(v46, "count"))
  {
    v60 = (void *)objc_msgSend(v46, "copy");
    v61 = 0;
    v62 = CFSTR("motion");
  }
  else
  {
    v88 = 0;
    -[_CDInBedDetector lockedTimesBetweenStartDate:endDate:error:](v57, "lockedTimesBetweenStartDate:endDate:error:", v26, v84, &v88);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v88;
    v61 = v63;
    if (v63)
    {
      if (a5)
      {
        *a5 = objc_retainAutorelease(v63);
        v59 = v85;
      }
      v64 = v57->_log;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v99 = v86;
        v100 = 2112;
        v101 = (uint64_t)v84;
        v102 = 2112;
        v103 = v61;
        _os_log_error_impl(&dword_18DDBE000, v64, OS_LOG_TYPE_ERROR, "Error identifying locked times between %@ and %@: %@", buf, 0x20u);
      }
    }
    v62 = CFSTR("screenlock");
  }
  v65 = v57->_log;
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    v78 = v62;
    v66 = (void *)MEMORY[0x1E0CB37E8];
    v67 = v65;
    objc_msgSend(v66, "numberWithUnsignedInteger:", objc_msgSend(v60, "count"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "firstObject");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "startDate");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "lastObject");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "endDate");
    v72 = v61;
    v73 = v60;
    v74 = v22;
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v99 = v68;
    v100 = 2112;
    v101 = (uint64_t)v70;
    v102 = 2112;
    v103 = v75;
    v104 = 2112;
    v105 = v78;
    _os_log_impl(&dword_18DDBE000, v67, OS_LOG_TYPE_DEFAULT, "Found %@ in-bed intervals between %@ & %@ using %@-based heuristic", buf, 0x2Au);

    v22 = v74;
    v60 = v73;
    v61 = v72;

    v58 = v83;
    v59 = v85;

  }
  return v60;
}

- (id)findLatestEndOfMovementBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  return -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:](self, "findMotionTerminusBetweenStartDate:endDate:latest:error:", a3, a4, 1, a5);
}

- (id)findMotionTerminusBetweenStartDate:(id)a3 endDate:(id)a4 latest:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  dispatch_semaphore_t v15;
  dispatch_time_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  dispatch_semaphore_t dsema;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  dispatch_semaphore_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v6 = a5;
  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "earlierDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToDate:", v10);

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:].cold.1();
LABEL_22:
    v19 = 0;
    goto LABEL_40;
  }
  if ((-[objc_class isActivityAvailable](getCMMotionActivityManagerClass(), "isActivityAvailable") & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:].cold.3();
    goto LABEL_22;
  }
  v13 = objc_alloc_init(getCMMotionActivityManagerClass());
  v14 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v14, "setName:", CFSTR("com.apple.coreduet.inbed.coremotion"));
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__8;
  v57 = __Block_byref_object_dispose__8;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__8;
  v51 = __Block_byref_object_dispose__8;
  v52 = 0;
  v15 = dispatch_semaphore_create(0);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __76___CDInBedDetector_findMotionTerminusBetweenStartDate_endDate_latest_error___block_invoke;
  v43[3] = &unk_1E26E4510;
  v45 = &v53;
  v46 = &v47;
  v32 = v14;
  dsema = v15;
  v44 = dsema;
  v31 = v13;
  objc_msgSend(v13, "queryActivityStartingFromDate:toDate:toQueue:withHandler:", v9, v10, v14, v43);
  v16 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(dsema, v16))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:].cold.2();
    objc_msgSend(v14, "cancelAllOperations");
  }
  v17 = v10;
  if (v6)
  {
    v41 = 0uLL;
    v42 = 0uLL;
    v39 = 0uLL;
    v40 = 0uLL;
    objc_msgSend((id)v48[5], "reverseObjectEnumerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v40;
      v21 = v17;
      while (2)
      {
        v22 = 0;
        v23 = v17;
        v24 = v21;
        do
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(v18);
          v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v22);
          if ((objc_msgSend(v25, "stationary") & 1) == 0 && objc_msgSend(v25, "confidence") == 1)
          {
            v21 = v24;
            v17 = v23;
            v19 = v21;
            goto LABEL_36;
          }
          objc_msgSend(v25, "startDate");
          v17 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "startDate");
          v21 = (id)objc_claimAutoreleasedReturnValue();

          v22 = (char *)v22 + 1;
          v23 = v17;
          v24 = v21;
        }
        while (v19 != v22);
        v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
        if (v19)
          continue;
        goto LABEL_36;
      }
    }
  }
  else
  {
    v37 = 0uLL;
    v38 = 0uLL;
    v35 = 0uLL;
    v36 = 0uLL;
    objc_msgSend((id)v48[5], "objectEnumerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
    if (v19)
    {
      v26 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v18);
          v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v28, "stationary") & 1) == 0 && objc_msgSend(v28, "confidence") == 1)
          {
            objc_msgSend(v28, "startDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_34;
          }
        }
        v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
        if (v19)
          continue;
        break;
      }
    }
  }
LABEL_34:
  v21 = v17;
LABEL_36:

  if (a6)
  {
    v29 = (void *)v54[5];
    if (v29)
      *a6 = objc_retainAutorelease(v29);
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

LABEL_40:
  return v19;
}

- (id)stationaryIntervalsBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  dispatch_semaphore_t v14;
  dispatch_time_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  dispatch_semaphore_t dsema;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  dispatch_semaphore_t v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v33 = v7;
  objc_msgSend(v7, "earlierDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToDate:", v8);

  if ((v10 & 1) != 0)
  {
LABEL_2:
    v11 = 0;
    goto LABEL_28;
  }
  if ((-[objc_class isActivityAvailable](getCMMotionActivityManagerClass(), "isActivityAvailable") & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:].cold.3();
    goto LABEL_2;
  }
  v12 = objc_alloc_init(getCMMotionActivityManagerClass());
  v13 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v13, "setName:", CFSTR("com.apple.coreduet.inbed.coremotion"));
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__8;
  v52 = __Block_byref_object_dispose__8;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__8;
  v46 = __Block_byref_object_dispose__8;
  v47 = 0;
  v14 = dispatch_semaphore_create(0);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __70___CDInBedDetector_stationaryIntervalsBetweenStartDate_endDate_error___block_invoke;
  v38[3] = &unk_1E26E4510;
  v40 = &v48;
  v41 = &v42;
  v30 = v13;
  dsema = v14;
  v39 = dsema;
  v29 = v12;
  objc_msgSend(v12, "queryActivityStartingFromDate:toDate:toQueue:withHandler:", v7, v8, v13, v38);
  v15 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(dsema, v15))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:].cold.2();
    objc_msgSend(v13, "cancelAllOperations");
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = (id)v43[5];
  v18 = 0;
  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (!v19)
  {
LABEL_23:

    goto LABEL_24;
  }
  v20 = *(_QWORD *)v35;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v35 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      if (objc_msgSend(v22, "stationary") && objc_msgSend(v22, "confidence") == 2)
      {
        objc_msgSend(v22, "startDate");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v18)
          continue;
        v24 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v22, "startDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v24, "initWithStartDate:endDate:", v18, v25);
        objc_msgSend(v16, "addObject:", v26);

        v23 = 0;
      }

      v18 = (void *)v23;
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  }
  while (v19);

  if (v18)
  {
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v18, v8);
    objc_msgSend(v16, "addObject:", v17);
    goto LABEL_23;
  }
LABEL_24:
  if (a5)
  {
    v27 = (void *)v49[5];
    if (v27)
      *a5 = objc_retainAutorelease(v27);
  }
  v11 = (void *)objc_msgSend(v16, "copy");

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

LABEL_28:
  return v11;
}

- (id)findLastTimeDeviceWasLockedBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  +[_DKSystemEventStreams deviceIsLockedStream](_DKSystemEventStreams, "deviceIsLockedStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithEndInDateRangeFrom:to:](_DKQuery, "predicateForEventsWithEndInDateRangeFrom:to:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKBoolCategory no](_DKBoolCategory, "no");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithCategoryValue:](_DKQuery, "predicateForEventsWithCategoryValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery endDateSortDescriptorAscending:](_DKQuery, "endDateSortDescriptorAscending:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInBedDetector findDateIntervalOfEventInStream:datePredicate:valuePredicate:sortDescriptor:error:](self, "findDateIntervalOfEventInStream:datePredicate:valuePredicate:sortDescriptor:error:", v10, v11, v13, v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)findLastTimeDeviceWasPluggedInBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  +[_DKSystemEventStreams deviceIsPluggedInStream](_DKSystemEventStreams, "deviceIsPluggedInStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithEndInDateRangeFrom:to:](_DKQuery, "predicateForEventsWithEndInDateRangeFrom:to:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKBoolCategory no](_DKBoolCategory, "no");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithCategoryValue:](_DKQuery, "predicateForEventsWithCategoryValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery endDateSortDescriptorAscending:](_DKQuery, "endDateSortDescriptorAscending:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInBedDetector findDateIntervalOfEventInStream:datePredicate:valuePredicate:sortDescriptor:error:](self, "findDateIntervalOfEventInStream:datePredicate:valuePredicate:sortDescriptor:error:", v10, v11, v13, v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)findDateIntervalOfEventInStream:(id)a3 datePredicate:(id)a4 valuePredicate:(id)a5 sortDescriptor:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _DKEventQuery *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_alloc_init(_DKEventQuery);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_CDInBedDetector.m");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingFormat:", CFSTR(":%d"), 638);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKQuery setClientName:](v16, "setClientName:", v18);

  -[_DKQuery setTracker:](v16, "setTracker:", &__block_literal_global_374_0);
  v32[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setEventStreams:](v16, "setEventStreams:", v19);

  v20 = (void *)MEMORY[0x1E0CB3528];
  v31[0] = v13;
  v31[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setPredicate:](v16, "setPredicate:", v22);

  v30 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventQuery setSortDescriptors:](v16, "setSortDescriptors:", v23);

  -[_DKEventQuery setLimit:](v16, "setLimit:", 1);
  -[_DKEventQuery setResultType:](v16, "setResultType:", 2);
  -[_CDInBedDetector knowledge](self, "knowledge");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v24, "executeQuery:error:", v16, &v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v29;

  if (v26)
  {
    v27 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v26);
  }
  else
  {
    objc_msgSend(v25, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_DKKnowledgeQuerying)knowledge
{
  return (_DKKnowledgeQuerying *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKnowledge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)method
{
  return self->_method;
}

- (void)setMethod:(unint64_t)a3
{
  self->_method = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledge, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)detectInBedWithPolicyV1BetweenStartDate:endDate:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Unable to find last end of movement. Falling back to provided start time.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)detectInBedWithPolicyV1BetweenStartDate:endDate:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error finding last end of movement: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Unable to find first start of movement. Falling back to provided end time.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error finding first start of movement: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)findMotionTerminusBetweenStartDate:endDate:latest:error:.cold.1()
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
  _os_log_error_impl(&dword_18DDBE000, v1, OS_LOG_TYPE_ERROR, "InBed endDate (%@) is before startDate (%@)", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)findMotionTerminusBetweenStartDate:endDate:latest:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Timeout during queryActivityStartingFromDate.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)findMotionTerminusBetweenStartDate:endDate:latest:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Motion activity is not available for in bed detection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
