@implementation _DKPredictionQuery

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_DKPredictionQuery;
  -[_DKEventQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", self->_slotDuration, CFSTR("slotDuration"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_asOfDate, CFSTR("asOfDate"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_partitionType, CFSTR("partitionType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_useHistoricalHistogram, CFSTR("useHist"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minimumDaysOfHistory, CFSTR("minDays"));
  if (self->_isTopNPrediction)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("isTopN"));
    objc_msgSend(v4, "encodeInteger:forKey:", self->_topN, CFSTR("topN"));
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minLikelihood"), self->_minLikelihood);
  }

}

- (void)setSlotDuration:(int)a3
{
  NSDate *asOfDate;
  NSDate *v5;
  NSDate *v6;

  if (!a3 || 86400 % a3)
    a3 = 900;
  self->_slotDuration = a3;
  self->_totalSlotsInDay = 86400 / a3;
  asOfDate = self->_asOfDate;
  if (asOfDate)
  {
    v5 = asOfDate;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v6 = self->_asOfDate;
  self->_asOfDate = v5;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predictionHandler, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_asOfDate, 0);
}

- (_DKPredictionQuery)initWithCoder:(id)a3
{
  id v4;
  _DKPredictionQuery *v5;
  uint64_t v6;
  uint64_t v7;
  NSDate *asOfDate;
  double v9;
  _DKPredictionQuery *v10;
  NSObject *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DKPredictionQuery;
  v5 = -[_DKEventQuery initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (!v5)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("slotDuration"));
  if (!(_DWORD)v6)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_DKPredictionQuery initWithCoder:].cold.1(v11);

    goto LABEL_9;
  }
  -[_DKPredictionQuery setSlotDuration:](v5, "setSlotDuration:", v6);
  -[_DKPredictionQuery setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asOfDate"));
  v7 = objc_claimAutoreleasedReturnValue();
  asOfDate = v5->_asOfDate;
  v5->_asOfDate = (NSDate *)v7;

  v5->_partitionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("partitionType"));
  v5->_useHistoricalHistogram = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useHist"));
  v5->_minimumDaysOfHistory = objc_msgSend(v4, "decodeIntForKey:", CFSTR("minDays"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("isTopN")))
  {
    v5->_isTopNPrediction = 1;
    v5->_topN = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("topN"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minLikelihood"));
    v5->_minLikelihood = v9;
  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (void)setUseHistoricalHistogram:(BOOL)a3
{
  self->_useHistoricalHistogram = a3;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setPartitionType:(unint64_t)a3
{
  self->_partitionType = a3;
}

- (void)setMinimumDaysOfHistory:(int)a3
{
  self->_minimumDaysOfHistory = a3;
}

- (void)setAsOfDate:(id)a3
{
  objc_storeStrong((id *)&self->_asOfDate, a3);
}

- (void)predictionOfType:withData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Prediction is unavailable because no data was provided.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (id)predictionOfType:(void *)a3 withData:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  _DKDeviceActivityStandingQuery *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  id obj;
  void *v85;
  void *v86;
  uint64_t v87;
  id v88;
  void *v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t v99[128];
  uint8_t buf[4];
  id v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  double v105;
  _QWORD v106[2];
  _QWORD v107[2];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!a1)
  {
    v34 = 0;
    goto LABEL_74;
  }
  if (objc_msgSend(v4, "count"))
  {
    v88 = *(id *)(a1 + 160);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(int *)(a1 + 140));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(int *)(a1 + 140) >= 1)
    {
      v7 = 0;
      do
        objc_msgSend(v6, "setObject:atIndexedSubscript:", &unk_1E272AC90, v7++);
      while (v7 < *(int *)(a1 + 140));
    }
    v86 = v6;
    v87 = a1;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "secondsFromGMT");

    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v82 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    if (v11)
    {
      v12 = v11;
      v13 = (double)v9;
      v14 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v96 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
          objc_msgSend(v16, "valueForKey:", CFSTR("secondsFromGMT"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          v19 = v18;

          if (v19 == v13)
          {
            objc_msgSend(v89, "addObject:", v16);
          }
          else
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("startDate"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("endDate"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v19 - v13;
            objc_msgSend(v20, "dateByAddingTimeInterval:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "dateByAddingTimeInterval:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v106[0] = CFSTR("startDate");
            v106[1] = CFSTR("endDate");
            v107[0] = v23;
            v107[1] = v24;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "addObject:", v25);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
      }
      while (v12);
    }

    objc_msgSend(v89, "sortUsingComparator:", &__block_literal_global_44);
    objc_msgSend(v89, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("startDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "timeIntervalSinceDate:", v27);
    v29 = v28;

    v30 = (double)(86400 * *(_DWORD *)(v87 + 136));
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v29 < v30)
    {
      v33 = v86;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[_DKPredictionQuery predictionOfType:withData:].cold.2();

      +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_73:
      v5 = v82;

      goto LABEL_74;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v89, "firstObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("startDate"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v101 = v88;
      v102 = 2112;
      v103 = v43;
      v104 = 2048;
      v105 = v29;
      _os_log_debug_impl(&dword_18DDBE000, v32, OS_LOG_TYPE_DEBUG, "Prediction Start Date %@, First Object Start: %@, Duration: %lf", buf, 0x20u);

    }
    if (*(_BYTE *)(v87 + 128))
    {
      v36 = *(_QWORD *)(v87 + 152);
      switch(v36)
      {
        case 2:
          objc_msgSend((id)v87, "storage");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if (v39)
          {
            v41 = v39;
          }
          else
          {
            +[_DKKnowledgeStore knowledgeStoreWithDirectReadOnlyAccess](_DKKnowledgeStore, "knowledgeStoreWithDirectReadOnlyAccess");
            v41 = objc_claimAutoreleasedReturnValue();
          }
          v37 = v41;

          v44 = objc_alloc_init(_DKDeviceActivityStandingQuery);
          v45 = objc_msgSend(v85, "component:fromDate:", 512, v88);
          objc_msgSend(v88, "dateByAddingTimeInterval:", 86399.0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v85, "component:fromDate:", 512, v46);

          -[_DKDeviceActivityStandingQuery fetchResultForDayOfWeek:withStorage:](v44, "fetchResultForDayOfWeek:withStorage:", v45, v37);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45 == v47)
          {
            v49 = 0;
          }
          else
          {
            -[_DKDeviceActivityStandingQuery fetchResultForDayOfWeek:withStorage:](v44, "fetchResultForDayOfWeek:withStorage:", v47, v37);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[_DKPredictionQuery addEventsToObservations:startingHistogram:endingHistogram:withPredictionDate:](v87, v86, v48, v49, v88);
          if (v48 && v49)
          {
            objc_msgSend(v48, "interval");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "startDate");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "interval");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "startDate");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "timeIntervalSinceDate:", v53);
            if (v54 > 0.0)
              v55 = v49;
            else
              v55 = v48;
            objc_msgSend(v55, "interval");
            v38 = objc_claimAutoreleasedReturnValue();

            v80 = v48;
            v79 = v49;
          }
          else if (v48)
          {
            objc_msgSend(v48, "interval");
            v38 = objc_claimAutoreleasedReturnValue();
            v79 = 0;
            v80 = v48;
          }
          else
          {
            objc_msgSend(v49, "interval");
            v38 = objc_claimAutoreleasedReturnValue();
            v79 = v49;
            v80 = 0;
          }

          goto LABEL_51;
        case 1:
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[_DKPredictionQuery predictionOfType:withData:].cold.4();
          goto LABEL_36;
        case 0:
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[_DKPredictionQuery predictionOfType:withData:].cold.3();
LABEL_36:
          v79 = 0;
          v80 = 0;
          v38 = 0;
LABEL_51:

          goto LABEL_52;
      }
    }
    v79 = 0;
    v80 = 0;
    v38 = 0;
LABEL_52:
    v81 = (void *)v38;
    *(_DWORD *)buf = -1;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    obj = v89;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
    if (!v57)
    {
      v59 = 0;
LABEL_71:

      v33 = v86;
      v74 = v81;
      -[_DKPredictionQuery constructTimelineWithObservations:withFirstEventDate:withHistogramInterval:withPredictionStartDate:durationSinceFirstEvent:](v87, v86, v59, v81, v88, v29);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v80;
      objc_msgSend(v34, "setStartHistogram:", v80);
      v76 = v79;
      objc_msgSend(v34, "setEndHistogram:", v79);
LABEL_72:

      goto LABEL_73;
    }
    v58 = v57;
    v59 = 0;
    v60 = *(_QWORD *)v92;
    v78 = v56;
LABEL_54:
    v61 = 0;
    while (1)
    {
      if (*(_QWORD *)v92 != v60)
        objc_enumerationMutation(obj);
      v62 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v61);
      objc_msgSend(v62, "valueForKey:", CFSTR("startDate"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "valueForKey:", CFSTR("endDate"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v59)
        v59 = v63;
      if (a2 == 2)
      {
        v66 = v87;
        v67 = v88;
        v68 = v63;
        v69 = v64;
        v70 = v29;
        v71 = v85;
        v72 = v86;
        v73 = 0;
      }
      else
      {
        if (a2 != 1)
        {
          if (a2)
          {

            v34 = 0;
            v33 = v86;
            v75 = v80;
            v74 = v81;
            v56 = v78;
            v76 = v79;
            goto LABEL_72;
          }
          v90 = v56;
          -[_DKPredictionQuery handleImpulsePredictionWithEventStartDate:predictionStartDate:durationSinceFirstEvent:calendar:observations:lastDate:lastSlot:](v87, v63, v88, v85, v86, &v90, buf, v29);
          v65 = v90;

          v56 = v65;
          goto LABEL_66;
        }
        v66 = v87;
        v67 = v88;
        v68 = v63;
        v69 = v64;
        v70 = v29;
        v71 = v85;
        v72 = v86;
        v73 = 1;
      }
      -[_DKPredictionQuery handleEventPredictionWithEventStartDate:eventEndDate:predictionStartDate:durationSinceFirstEvent:calendar:observations:useWeights:](v66, v68, v69, v67, v71, v72, v73, v70);
LABEL_66:

      if (v58 == ++v61)
      {
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
        if (v58)
          goto LABEL_54;
        goto LABEL_71;
      }
    }
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    -[_DKPredictionQuery predictionOfType:withData:].cold.1();

  +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_74:

  return v34;
}

- (id)handleResults:(id)a3 error:(id)a4
{
  id v6;
  void (**predictionHandler)(id, _DKPredictionQuery *, id, id);

  v6 = a3;
  predictionHandler = (void (**)(id, _DKPredictionQuery *, id, id))self->_predictionHandler;
  if (predictionHandler)
    predictionHandler[2](predictionHandler, self, v6, a4);
  return v6;
}

- (id)executeUsingCoreDataStorage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_super v15;
  objc_super v16;
  id v17;
  objc_super v18;
  objc_super v19;

  if (self->_isTopNPrediction)
  {
    v19.receiver = self;
    v19.super_class = (Class)_DKPredictionQuery;
    v6 = a3;
    -[_DKEventQuery executeUsingCoreDataStorage:error:](&v19, sel_executeUsingCoreDataStorage_error_, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      v8 = *a4;
    else
      v8 = 0;
    v18.receiver = self;
    v18.super_class = (Class)_DKPredictionQuery;
    -[_DKEventQuery handleResults:error:](&v18, sel_handleResults_error_, v7, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[_DKPredictionQuery likelihoodForTopN:withMinLikelihood:withData:]((uint64_t)self, self->_topN, v11, self->_minLikelihood);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = a3;
    -[_DKEventQuery setResultType:](self, "setResultType:", 3);
    -[_DKEventQuery setGroupByProperties:](self, "setGroupByProperties:", &unk_1E272BDB8);
    v16.receiver = self;
    v16.super_class = (Class)_DKPredictionQuery;
    v17 = 0;
    -[_DKEventQuery executeUsingCoreDataStorage:error:](&v16, sel_executeUsingCoreDataStorage_error_, v9, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v17;
    v15.receiver = self;
    v15.super_class = (Class)_DKPredictionQuery;
    -[_DKEventQuery handleResults:error:](&v15, sel_handleResults_error_, v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && v11)
      *a4 = objc_retainAutorelease(v11);
    -[_DKPredictionQuery predictionOfType:withData:]((uint64_t)self, self->_type, v7);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

+ (id)predictionQueryForStreams:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v7, v8, 0, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setType:", a5);
  objc_msgSend(v12, "setSlotDuration:", 900);
  objc_msgSend(v12, "setReadMetadata:", 0);
  objc_msgSend(v12, "setDeduplicateValues:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAsOfDate:", v13);

  return v12;
}

+ (id)predictionQueryForStream:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "predictionQueryForStreams:withPredicate:withPredictionType:", v10, v7, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)topNPredictionQueryForStream:(id)a3 withPredicate:(id)a4 withTopN:(int64_t)a5 withMinLikelihood:(double)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "predictionQueryForStream:withPredicate:withPredictionType:", v10, v9, 0);
  v11 = objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    *(_BYTE *)(v11 + 129) = 1;
    *(_QWORD *)(v11 + 184) = a5;
    *(double *)(v11 + 192) = a6;
  }
  objc_msgSend((id)v11, "setReadMetadata:", 0);
  objc_msgSend((id)v11, "setDeduplicateValues:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "setAsOfDate:", v12);

  return (id)v11;
}

- (uint64_t)both:(void *)a3 and:(void *)a4 areWeekendOrWeekdayWithCalendar:
{
  id v6;
  id v7;
  int v8;

  if (result)
  {
    v6 = a4;
    v7 = a3;
    LODWORD(a2) = objc_msgSend(v6, "isDateInWeekend:", a2);
    v8 = objc_msgSend(v6, "isDateInWeekend:", v7);

    return a2 ^ v8 ^ 1;
  }
  return result;
}

- (BOOL)both:(void *)a3 and:(void *)a4 areSameDayOfWeekWith:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;

  if (!a1)
    return 0;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "components:fromDate:", 512, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 512, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "weekday");
  v11 = v10 == objc_msgSend(v9, "weekday");

  return v11;
}

- (uint64_t)shouldIncludeEventWithStartDate:(int)a3 eventSlot:(void *)a4 withPredictionStartDate:(uint64_t)a5 withPartitionType:(void *)a6 andCalendar:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;

  v11 = a2;
  v12 = a4;
  v13 = a6;
  if (a1)
  {
    if (a5 == 2)
    {
      objc_msgSend(v12, "dateByAddingTimeInterval:", (double)(*(_DWORD *)(a1 + 132) * a3));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_DKPredictionQuery both:and:areSameDayOfWeekWith:](a1, (uint64_t)v11, v14, v13);
    }
    else
    {
      if (a5 != 1)
      {
        a1 = 1;
        goto LABEL_8;
      }
      objc_msgSend(v12, "dateByAddingTimeInterval:", (double)(*(_DWORD *)(a1 + 132) * a3));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_DKPredictionQuery both:and:areWeekendOrWeekdayWithCalendar:](a1, (uint64_t)v11, v14, v13);
    }
    a1 = v15;

  }
LABEL_8:

  return a1;
}

- (void)setValueForIndex:(void *)a3 forObservations:(double)a4 withDenominator:
{
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  if (a1)
  {
    v6 = a2;
    v7 = a3;
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9 / a4;

    if (*(_QWORD *)(a1 + 144) == 1)
      v10 = 1.0 / (pow(2.71828183, (v10 + -0.5) * -12.0) + 1.0);
    v11 = 1.0;
    if (v10 <= 0.98)
    {
      v11 = v10;
      if (v10 < 0.02)
        v11 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dk_dedup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v12, v6);

  }
}

+ (uint64_t)calendar:(_QWORD *)a3 isWeekendWithIntervalToWeekdayWeekendTransition:(void *)a4 containingOrAfterDate:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v17;
  id v18;
  double v19;

  v6 = a2;
  v7 = a4;
  objc_opt_self();
  v18 = 0;
  v19 = 0.0;
  v8 = objc_msgSend(v6, "rangeOfWeekendStartDate:interval:containingDate:", &v18, &v19, v7);
  v9 = v18;
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "dateByAddingTimeInterval:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v7);
    v13 = v12;

    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v17 = 0;
  objc_msgSend(v6, "nextWeekendStartDate:interval:options:afterDate:", &v17, 0, 4096, v7);
  v14 = v17;

  objc_msgSend(v14, "timeIntervalSinceDate:", v7);
  v13 = v15;
  v10 = v14;
  if (a3)
LABEL_5:
    *a3 = v13;
LABEL_6:

  return v8;
}

- (id)constructTimelineWithObservations:(void *)a3 withFirstEventDate:(void *)a4 withHistogramInterval:(void *)a5 withPredictionStartDate:(double)a6 durationSinceFirstEvent:
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  id v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  char *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  double v37;
  int v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  int v45;
  double v46;
  int i;
  void *v48;
  double v49;
  double v50;
  id v51;
  double v52;
  uint64_t v53;
  int v54;
  int v55;
  double v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t *v65;
  id v66;
  int v67;
  uint64_t *v68;
  double v69;
  double v70[2];

  v70[1] = *(double *)MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!a1)
  {
    v60 = 0;
    goto LABEL_68;
  }
  v15 = *(_QWORD *)(a1 + 152);
  if (a6 < 1209600.0)
    v15 = 0;
  if (v15 == 2)
  {
    v24 = v12;
    objc_msgSend(v24, "timeIntervalSinceDate:", v14);
    v25 = 0.0;
    if (v26 >= 0.0)
    {
      v27 = v24;
    }
    else
    {
      do
      {
        objc_msgSend(v24, "dateByAddingTimeInterval:", 604800.0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = v25 + 1.0;
        objc_msgSend(v27, "timeIntervalSinceDate:", v14);
        v24 = v27;
      }
      while (v28 < 0.0);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v13, "startDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "timeIntervalSinceDate:", v41);
      v44 = v43;

      if (v44 >= -4233600.0)
      {
        v45 = vcvtpd_s64_f64(v44 / -604800.0);
        v46 = 1.0;
        if (v45 >= 2)
        {
          for (i = 1; i != v45; ++i)
            v46 = v46 + 1.0 / ldexp(1.0, i);
        }
        v25 = v25 + v46;
      }
      else
      {
        v25 = v25 + 2.0;
      }
    }
    objc_msgSend(v14, "dateByAddingTimeInterval:", 86400.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceDate:", v48);
    v50 = v49;

    if (v50 >= 0.0)
    {
      if (*(int *)(a1 + 140) >= 1)
      {
        v57 = 0;
        do
          -[_DKPredictionQuery setValueForIndex:forObservations:withDenominator:](a1, v57++, v11, v25 + -1.0);
        while (v57 < *(_DWORD *)(a1 + 140));
      }
    }
    else
    {
      v68 = &v62;
      v51 = v14;
      objc_msgSend(v27, "timeIntervalSinceDate:", v14);
      if (v52 < 0.0)
        v52 = v52 + ceil(v52 / -86400.0) * 86400.0;
      v53 = *(int *)(a1 + 140);
      if ((int)v53 >= 1)
      {
        v54 = 0;
        v55 = (uint64_t)v52 / *(int *)(a1 + 132) % v53;
        do
        {
          if (v54 >= v55)
            v56 = 0.0;
          else
            v56 = 1.0;
          -[_DKPredictionQuery setValueForIndex:forObservations:withDenominator:](a1, v54++, v11, v25 - v56);
        }
        while (v54 < *(_DWORD *)(a1 + 140));
      }
      v14 = v51;
    }

  }
  else
  {
    if (v15 != 1)
    {
      if (!v15)
      {
        objc_msgSend(v12, "timeIntervalSinceDate:", v14);
        v17 = v16;
        if (v16 < 0.0)
          v17 = v16 + ceil(v16 / -86400.0) * 86400.0;
        v18 = *(int *)(a1 + 132);
        v19 = *(int *)(a1 + 140);
        objc_msgSend(v12, "timeIntervalSinceDate:", v14);
        if (*(int *)(a1 + 140) >= 1)
        {
          v21 = 0;
          v22 = -(int)(v20 / 86400.0);
          v23 = ((uint64_t)v17 / v18 % v19);
          do
          {
            if (v23 == v21)
              ++v22;
            if (v22)
              -[_DKPredictionQuery setValueForIndex:forObservations:withDenominator:](a1, v21, v11, (double)v22);
            else
              objc_msgSend(v11, "setObject:atIndexedSubscript:", &unk_1E272AC90, v21);
            ++v21;
          }
          while (v21 < *(int *)(a1 + 140));
        }
      }
      goto LABEL_67;
    }
    v63 = v13;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0.0;
    v70[0] = 0.0;
    LODWORD(v68) = +[_DKPredictionQuery calendar:isWeekendWithIntervalToWeekdayWeekendTransition:containingOrAfterDate:]((uint64_t)_DKPredictionQuery, v27, v70, v12);
    v67 = +[_DKPredictionQuery calendar:isWeekendWithIntervalToWeekdayWeekendTransition:containingOrAfterDate:]((uint64_t)_DKPredictionQuery, v27, &v69, v14);
    v65 = &v62;
    v29 = (char *)&v62 - ((4 * *(unsigned int *)(a1 + 140) + 15) & 0x7FFFFFFF0);
    bzero(v29, 4 * *(int *)(a1 + 140));
    v64 = v12;
    v30 = v12;
    objc_msgSend(v14, "timeIntervalSinceDate:", v30);
    v32 = v31;
    v66 = v14;
    objc_msgSend(v30, "timeIntervalSinceDate:", v14);
    if (v33 < 0.0)
      v33 = v33 + ceil(v33 / -86400.0) * 86400.0;
    v34 = *(int *)(a1 + 132);
    v35 = *(int *)(a1 + 140);
    v36 = (uint64_t)v33 / v34 % v35;
    v37 = v69 - (double)((int)v34 * v36);
    v38 = v67;
    if (v37 <= 0.0)
    {
      v38 = v67 ^ 1;
      v37 = 1.79769313e308;
    }
    if (v32 <= 0.0)
    {
      v39 = v30;
    }
    else
    {
      while (1)
      {
        if (((v68 ^ v38) & 1) == 0)
          ++*(_DWORD *)&v29[4 * v36];
        objc_msgSend(v30, "dateByAddingTimeInterval:", (double)*(int *)(a1 + 132));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = (double)*(int *)(a1 + 132);
        v32 = v32 - v40;
        if (v32 <= 0.0)
          break;
        v70[0] = v70[0] - v40;
        if (v70[0] <= 0.0)
        {
          LODWORD(v68) = v68 ^ 1;
          +[_DKPredictionQuery calendar:isWeekendWithIntervalToWeekdayWeekendTransition:containingOrAfterDate:]((uint64_t)_DKPredictionQuery, v27, v70, v39);
        }
        ++v36;
        LODWORD(v35) = *(_DWORD *)(a1 + 140);
        if (v36 == (_DWORD)v35)
        {
          v36 = 0;
          v37 = v69;
          v38 = v67;
        }
        else if (v37 - (double)*(int *)(a1 + 132) > 0.0)
        {
          v37 = v37 - (double)*(int *)(a1 + 132);
        }
        else
        {
          v38 ^= 1u;
          v37 = 1.79769313e308;
        }
        v30 = v39;
        if (v32 <= 0.0)
          goto LABEL_62;
      }
      LODWORD(v35) = *(_DWORD *)(a1 + 140);
    }
LABEL_62:
    v13 = v63;
    v12 = v64;
    if ((int)v35 >= 1)
    {
      v58 = 0;
      do
      {
        -[_DKPredictionQuery setValueForIndex:forObservations:withDenominator:](a1, v58, v11, (double)*(int *)&v29[4 * v58]);
        ++v58;
      }
      while (v58 < *(int *)(a1 + 140));
    }

    v14 = v66;
  }

LABEL_67:
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v11);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKPredictionTimeline timelineWithValues:eachWithDuration:startingAt:](_DKPredictionTimeline, "timelineWithValues:eachWithDuration:startingAt:", v59, v14, (double)*(int *)(a1 + 132));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_68:
  return v60;
}

- (void)handleImpulsePredictionWithEventStartDate:(void *)a3 predictionStartDate:(void *)a4 durationSinceFirstEvent:(void *)a5 calendar:(_QWORD *)a6 observations:(_DWORD *)a7 lastDate:(double)a8 lastSlot:
{
  id v15;
  id v16;
  id v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (a1)
  {
    objc_msgSend(v25, "timeIntervalSinceDate:", v15);
    if (v18 < 0.0)
      v18 = v18 + ceil(v18 / -86400.0) * 86400.0;
    v19 = (uint64_t)v18 / *(int *)(a1 + 132) % *(int *)(a1 + 140);
    if (a8 >= 1209600.0)
      v20 = *(_QWORD *)(a1 + 152);
    else
      v20 = 0;
    if (-[_DKPredictionQuery shouldIncludeEventWithStartDate:eventSlot:withPredictionStartDate:withPartitionType:andCalendar:](a1, v25, v19, v15, v20, v16))
    {
      if (*a7 != (_DWORD)v19 || (objc_msgSend(v25, "timeIntervalSinceDate:", *a6), v21 >= (double)*(int *)(a1 + 132)))
      {
        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v17, "objectAtIndexedSubscript:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "integerValue") + 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:atIndexedSubscript:", v24, v19);

        *a7 = v19;
        *a6 = objc_retainAutorelease(v25);
      }
    }
  }

}

- (void)handleEventPredictionWithEventStartDate:(void *)a3 eventEndDate:(void *)a4 predictionStartDate:(void *)a5 durationSinceFirstEvent:(void *)a6 calendar:(int)a7 observations:(double)a8 useWeights:
{
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  double v25;
  double v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  id v40;
  double v41;
  double v42;
  int v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v56;
  id v57;

  v56 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v57 = a6;
  if (a1)
  {
    objc_msgSend(v14, "timeIntervalSinceDate:", v56);
    v18 = v17;
    objc_msgSend(v56, "timeIntervalSinceDate:", v15);
    objc_msgSend(v15, "dateByAddingTimeInterval:", (double)(*(_DWORD *)(a1 + 132) * (int)(v19 / (double)*(int *)(a1 + 132))));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "timeIntervalSinceDate:", v15);
    if (v21 < 0.0)
      v21 = v21 + ceil(v21 / -86400.0) * 86400.0;
    v22 = (uint64_t)v21 / *(int *)(a1 + 132) % *(int *)(a1 + 140);
    v23 = v22;
    if (a8 >= 1209600.0)
      v24 = *(_QWORD *)(a1 + 152);
    else
      v24 = 0;
    objc_msgSend(v14, "timeIntervalSinceDate:", v20);
    v26 = v25;
    v27 = -[_DKPredictionQuery shouldIncludeEventWithStartDate:eventSlot:withPredictionStartDate:withPartitionType:andCalendar:](a1, v56, v22, v15, v24, v16);
    if (v26 <= 0.0)
    {
      if (!v27)
      {
LABEL_29:

        goto LABEL_30;
      }
      v53 = v20;
      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v57, "objectAtIndexedSubscript:", v22);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (a7)
      {
        objc_msgSend(v36, "doubleValue");
        objc_msgSend(v35, "numberWithDouble:", v38 + v18 / (double)*(int *)(a1 + 132));
      }
      else
      {
        objc_msgSend(v35, "numberWithInteger:", objc_msgSend(v36, "integerValue") + 1);
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setObject:atIndexedSubscript:", v51, v22);

    }
    else
    {
      if (v27)
      {
        v28 = v20;
        v52 = v16;
        v29 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v57, "objectAtIndexedSubscript:", v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (a7)
        {
          objc_msgSend(v30, "doubleValue");
          v33 = v32;
          objc_msgSend(v20, "timeIntervalSinceDate:", v56);
          objc_msgSend(v29, "numberWithDouble:", v33 + v34 / (double)*(int *)(a1 + 132));
        }
        else
        {
          objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v30, "integerValue") + 1);
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setObject:atIndexedSubscript:", v39, v22);

        v16 = v52;
        v20 = v28;
      }
      v53 = v20;
      v40 = v20;
      objc_msgSend(v14, "timeIntervalSinceDate:", v40);
      if (v41 <= 0.0)
      {
        v37 = v40;
      }
      else
      {
        v42 = v41;
        v54 = v24;
        do
        {
          v43 = v23 + 1;
          v44 = *(_DWORD *)(a1 + 140);
          v23 = (v23 + 1) % v44;
          if (-[_DKPredictionQuery shouldIncludeEventWithStartDate:eventSlot:withPredictionStartDate:withPartitionType:andCalendar:](a1, v40, v43 % v44, v15, v24, v16))
          {
            v45 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v57, "objectAtIndexedSubscript:", v23);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v46;
            if (a7)
            {
              objc_msgSend(v46, "doubleValue");
              objc_msgSend(v45, "numberWithDouble:", v48 + fmin(v42 / (double)*(int *)(a1 + 132), 1.0));
            }
            else
            {
              objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v46, "integerValue") + 1);
            }
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setObject:atIndexedSubscript:", v49, v23);

            v24 = v54;
          }
          objc_msgSend(v40, "dateByAddingTimeInterval:", (double)*(int *)(a1 + 132));
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "timeIntervalSinceDate:", v37);
          v42 = v50;
          v40 = v37;
        }
        while (v50 > 0.0);
      }
    }

    v20 = v53;
    goto LABEL_29;
  }
LABEL_30:

}

- (void)addEventsToObservations:(void *)a3 startingHistogram:(void *)a4 endingHistogram:(void *)a5 withPredictionDate:
{
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  id v29;

  v29 = a2;
  v9 = a3;
  v10 = a4;
  v28 = a5;
  if (a1 && v9 | v10)
  {
    v27 = objc_msgSend(v28, "slotFromMidnightWithTotalSlotsInDay:", *(unsigned int *)(a1 + 140));
    if (v9 && v27 < *(_DWORD *)(a1 + 140))
    {
      v11 = 0;
      do
      {
        if ((v11 & 0x80000000) == 0 && objc_msgSend(v29, "count") - 1 >= v11)
        {
          v12 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v29, "objectAtIndexedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValue");
          v15 = v14;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27 + v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "numberWithDouble:", v15 + (double)(unint64_t)objc_msgSend((id)v9, "countForValue:", v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:atIndexedSubscript:", v17, v11);

        }
        ++v11;
      }
      while (v27 + (int)v11 < *(_DWORD *)(a1 + 140));
    }
    if (v10 && v27 >= 1)
    {
      v18 = 0;
      v19 = *(_DWORD *)(a1 + 140) - v27;
      do
      {
        if (((v19 + (_DWORD)v18) & 0x80000000) == 0
          && objc_msgSend(v29, "count") - 1 >= (unint64_t)(v19 + v18))
        {
          v20 = (v19 + v18);
          v21 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v29, "objectAtIndexedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValue");
          v24 = v23;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "numberWithDouble:", v24 + (double)(unint64_t)objc_msgSend((id)v10, "countForValue:", v25));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:atIndexedSubscript:", v26, v20);

        }
        ++v18;
      }
      while (v27 != v18);
    }
  }

}

- (id)likelihoodForTopN:(void *)a3 withMinLikelihood:(double)a4 withData:
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  int *v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  int v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  id obj;
  int obja;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  int v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  _QWORD v92[4];
  id v93;
  int v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;
  _BYTE v109[128];
  _QWORD v110[2];
  _QWORD v111[2];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a1)
  {
    if (objc_msgSend(v7, "count"))
    {
      v79 = a2;
      v89 = a1;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "secondsFromGMT");

      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v78 = v8;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
      if (v12)
      {
        v13 = v12;
        v14 = (double)v10;
        v15 = *(_QWORD *)v100;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v100 != v15)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
            objc_msgSend(v17, "value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v17, "timeZone");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (double)objc_msgSend(v20, "secondsFromGMT");

              objc_msgSend(v17, "valueForKey:", CFSTR("startDate"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v22;
              if (v21 != v14)
              {
                objc_msgSend(v22, "dateByAddingTimeInterval:", v21 - v14);
                v24 = objc_claimAutoreleasedReturnValue();

                v23 = (void *)v24;
              }
              v110[0] = CFSTR("startDate");
              v110[1] = CFSTR("bundleID");
              v111[0] = v23;
              v111[1] = v19;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v110, 2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "addObject:", v25);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
        }
        while (v13);
      }

      v26 = v88;
      objc_msgSend(v88, "sortUsingComparator:", &__block_literal_global_21);
      v27 = *(id *)(v89 + 160);
      objc_msgSend(v88, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "valueForKey:", CFSTR("startDate"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = v27;
      objc_msgSend(v27, "timeIntervalSinceDate:", v29);
      if (v30 >= (double)(86400 * *(_DWORD *)(v89 + 136)))
      {
        v77 = v29;
        v34 = (void *)MEMORY[0x1E0C9AA70];
        v91 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
        v90 = (void *)objc_msgSend(v34, "mutableCopy");
        v82 = (void *)objc_msgSend(v34, "mutableCopy");
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        obj = v88;
        v35 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
        v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
        if (v86)
        {
          v83 = *(_QWORD *)v96;
          do
          {
            for (j = 0; j != v86; ++j)
            {
              if (*(_QWORD *)v96 != v83)
                objc_enumerationMutation(obj);
              v37 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
              v38 = (void *)MEMORY[0x193FEE914]();
              objc_msgSend(v37, "valueForKey:", CFSTR("bundleID"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "valueForKey:", CFSTR("startDate"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "objectForKeyedSubscript:", v39);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "objectForKeyedSubscript:", v39);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41)
              {
                v43 = objc_msgSend(v41, "intValue");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
                v44 = objc_claimAutoreleasedReturnValue();

                v43 = -1;
                v42 = (void *)v44;
              }
              objc_msgSend(v40, "timeIntervalSinceDate:", v85);
              if (v45 < 0.0)
                v45 = v45 + ceil(v45 / -86400.0) * 86400.0;
              v46 = ((uint64_t)v45 / *(int *)(v89 + 132) % *(int *)(v89 + v35[689]));
              if (v43 != (_DWORD)v46
                || (objc_msgSend(v40, "timeIntervalSinceDate:", v42), v47 >= (double)*(int *)(v89 + 132)))
              {
                objc_msgSend(v82, "objectForKeyedSubscript:", v39);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v48)
                {
                  objc_msgSend(MEMORY[0x1E0CB3550], "set");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v46);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "addObject:", v49);
                objc_msgSend(v82, "setObject:forKeyedSubscript:", v48, v39);
                objc_msgSend(v90, "setObject:forKeyedSubscript:", v49, v39);
                objc_msgSend(v91, "setObject:forKeyedSubscript:", v40, v39);

                v35 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
              }

              objc_autoreleasePoolPop(v38);
            }
            v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
          }
          while (v86);
        }

        v29 = v77;
        objc_msgSend(v77, "timeIntervalSinceDate:", v85);
        v51 = v50;
        if (v50 < 0.0)
          v51 = v50 + ceil(v50 / -86400.0) * 86400.0;
        v52 = v89;
        v53 = *(int *)(v89 + 132);
        v54 = *(int *)(v89 + 140);
        objc_msgSend(v77, "timeIntervalSinceDate:", v85);
        v56 = (int)(v55 / 86400.0);
        v57 = -v56;
        v58 = v82;
        if (v56 < 1)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(int *)(v89 + 140));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "allKeys");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (void *)objc_msgSend(v60, "mutableCopy");

          if (*(int *)(v89 + 140) >= 1)
          {
            v62 = 0;
            obja = (uint64_t)v51 / v53 % v54;
            do
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              if ((_DWORD)v62 == obja)
                LODWORD(v57) = v57 + 1;
              if ((_DWORD)v57)
              {
                v92[0] = MEMORY[0x1E0C809B0];
                v92[1] = 3221225472;
                v92[2] = __67___DKPredictionQuery_likelihoodForTopN_withMinLikelihood_withData___block_invoke_24;
                v92[3] = &unk_1E26E4F28;
                v64 = v58;
                v93 = v64;
                v94 = v62;
                objc_msgSend(v61, "sortUsingComparator:", v92);
                v87 = v57;
                if (objc_msgSend(v61, "count") <= v79)
                  v65 = 0;
                else
                  v65 = objc_msgSend(v61, "count") - v79;
                v66 = objc_msgSend(v61, "count") - 1;
                if (v66 >= v65)
                {
                  v67 = (double)(int)v57;
                  do
                  {
                    objc_msgSend(v61, "objectAtIndexedSubscript:", v66);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "objectForKeyedSubscript:", v68);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v62);
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    v71 = (double)(unint64_t)objc_msgSend(v69, "countForObject:", v70) / v67;

                    if (v71 >= a4)
                    {
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v71);
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v72, "dk_dedup");
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v63, "setObject:forKeyedSubscript:", v73, v68);

                    }
                    --v66;
                  }
                  while (v66 >= v65);
                }
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v63);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "addObject:", v74);

                v52 = v89;
                v58 = v82;
                LODWORD(v57) = v87;
              }
              else
              {
                objc_msgSend(v84, "addObject:", MEMORY[0x1E0C9AA70]);
              }

              v62 = (v62 + 1);
            }
            while ((int)v62 < *(_DWORD *)(v52 + 140));
          }
          +[_DKPredictionTimeline timelineWithValues:eachWithDuration:startingAt:](_DKPredictionTimeline, "timelineWithValues:eachWithDuration:startingAt:", v84, v85, (double)*(int *)(v52 + 132));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = v77;
          v8 = v78;
        }
        else
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v59 = objc_claimAutoreleasedReturnValue();
          v8 = v78;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v57);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v104 = v76;
            v105 = 2112;
            v106 = v77;
            v107 = 2112;
            v108 = v85;
            _os_log_error_impl(&dword_18DDBE000, v59, OS_LOG_TYPE_ERROR, "Invalid minimum appearances (%@) calculated from firstDate %@ and predictionStartDate %@", buf, 0x20u);

          }
          +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v26 = v88;
      }
      else
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v31 = objc_claimAutoreleasedReturnValue();
        v8 = v78;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[_DKPredictionQuery predictionOfType:withData:].cold.2();

        +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[_DKPredictionQuery predictionOfType:withData:].cold.1();

      +[_DKPredictionTimeline predictionUnavailable](_DKPredictionTimeline, "predictionUnavailable");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKPredictionQuery;
  v4 = -[_DKEventQuery copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSlotDuration:", self->_slotDuration);
  objc_msgSend(v4, "setType:", self->_type);
  objc_msgSend(v4, "setAsOfDate:", self->_asOfDate);
  objc_msgSend(v4, "setPartitionType:", self->_partitionType);
  objc_msgSend(v4, "setUseHistoricalHistogram:", self->_useHistoricalHistogram);
  objc_msgSend(v4, "setMinimumDaysOfHistory:", self->_minimumDaysOfHistory);
  if (v4)
  {
    *((_BYTE *)v4 + 129) = self->_isTopNPrediction;
    *((_QWORD *)v4 + 23) = self->_topN;
    *((_QWORD *)v4 + 24) = *(_QWORD *)&self->_minLikelihood;
  }
  return v4;
}

- (int)slotDuration
{
  return self->_slotDuration;
}

- (int)minimumDaysOfHistory
{
  return self->_minimumDaysOfHistory;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)partitionType
{
  return self->_partitionType;
}

- (BOOL)useHistoricalHistogram
{
  return self->_useHistoricalHistogram;
}

- (NSDate)asOfDate
{
  return self->_asOfDate;
}

- (_DKKnowledgeStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (id)predictionHandler
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setPredictionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (void)predictionOfType:withData:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_4();
  objc_msgSend(v1, "numberWithInt:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v3, v4, "Insufficient history for prediction (%@ seconds, need %@ seconds).", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)predictionOfType:withData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Historical histogram option not supported with _DKDataPartitionTypeNone", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)predictionOfType:withData:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Historical histogram option not supported with _DKDataPartitionTypeWeekdayWeekend", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCoder:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_18DDBE000, a1, OS_LOG_TYPE_ERROR, "Invalid slotDuration: %@", (uint8_t *)&v3, 0xCu);

}

@end
