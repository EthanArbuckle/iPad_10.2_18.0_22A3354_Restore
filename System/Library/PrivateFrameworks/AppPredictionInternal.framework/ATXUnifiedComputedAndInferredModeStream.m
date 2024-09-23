@implementation ATXUnifiedComputedAndInferredModeStream

- (ATXUnifiedComputedAndInferredModeStream)initWithStartTime:(id)a3 toEndTime:(id)a4
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
  void *v15;
  ATXUnifiedComputedAndInferredModeStream *v16;

  v6 = a4;
  v7 = a3;
  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UserFocus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ComputedMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v7, v6, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  BiomeLibrary();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UserFocus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "InferredMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v7, v6, 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[ATXUnifiedComputedAndInferredModeStream initWithComputedModePublisher:inferredModePublisher:startTime:endTime:](self, "initWithComputedModePublisher:inferredModePublisher:startTime:endTime:", v11, v15, v7, v6);
  return v16;
}

- (ATXUnifiedComputedAndInferredModeStream)initWithComputedModePublisher:(id)a3 inferredModePublisher:(id)a4 startTime:(id)a5 endTime:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXUnifiedComputedAndInferredModeStream *v15;
  ATXUnifiedComputedAndInferredModeStream *v16;
  uint64_t v17;
  NSMutableArray *modeEvents;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXUnifiedComputedAndInferredModeStream;
  v15 = -[ATXUnifiedComputedAndInferredModeStream init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_computedModePublisher, a3);
    objc_storeStrong((id *)&v16->_inferredModePublisher, a4);
    v17 = objc_opt_new();
    modeEvents = v16->_modeEvents;
    v16->_modeEvents = (NSMutableArray *)v17;

    -[ATXUnifiedComputedAndInferredModeStream computeUnifiedModeEventsFromStartTime:toEndTime:](v16, "computeUnifiedModeEventsFromStartTime:toEndTime:", v13, v14);
  }

  return v16;
}

- (void)computeUnifiedModeEventsFromStartTime:(id)a3 toEndTime:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[7];
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__34;
  v20[4] = __Block_byref_object_dispose__34;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__34;
  v18[4] = __Block_byref_object_dispose__34;
  v19 = 0;
  -[BPSPublisher orderedMergeWithOther:comparator:](self->_computedModePublisher, "orderedMergeWithOther:comparator:", self->_inferredModePublisher, &__block_literal_global_69);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_2;
  v14[3] = &unk_1E82DFAC8;
  v16 = v20;
  v14[4] = self;
  v10 = v7;
  v15 = v10;
  v17 = v18;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_30;
  v13[3] = &unk_1E82DFAF0;
  v13[4] = self;
  v13[5] = v18;
  v13[6] = v20;
  v11 = (id)objc_msgSend(v8, "sinkWithCompletion:receiveInput:", v14, v13);
  -[NSMutableArray sortUsingComparator:](self->_modeEvents, "sortUsingComparator:", &__block_literal_global_36_0);
  if (-[ATXUnifiedComputedAndInferredModeStream checkForOverlappingTimeRanges:](self, "checkForOverlappingTimeRanges:", self->_modeEvents))
  {
    __atxlog_handle_notification_categorization();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[ATXUnifiedComputedAndInferredModeStream computeUnifiedModeEventsFromStartTime:toEndTime:].cold.1(v12);

  }
  objc_storeStrong((id *)&self->_unifiedModeEventsInTimeRange, self->_modeEvents);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

uint64_t __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

void __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    __atxlog_handle_notification_categorization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_2_cold_1(v3, v5);

  }
  objc_msgSend(v3, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "starting");

    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(v11, "timestamp");
      v13 = v12;
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
      objc_msgSend(v10, "addComputedModeEventToArrayStream:withStartTime:endTime:", v11, v13, v14);
      goto LABEL_9;
    }
  }
  objc_msgSend(v3, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "eventBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isStart");

    if (v16)
    {
      v17 = *(void **)(a1 + 32);
      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(v18, "timestamp");
      v20 = v19;
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
      objc_msgSend(v17, "addInferredModeEventToArrayStream:withStartTime:endTime:", v18, v20, v21);
    }
  }
LABEL_9:

}

void __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_30(_QWORD *a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  id v48;

  v48 = a2;
  objc_msgSend(v48, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v48, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(v5, "starting"))
    {
      if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      {
LABEL_6:
        v17 = a1[6];
LABEL_11:
        v19 = *(_QWORD *)(v17 + 8);
        v20 = v48;
        v21 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v20;
LABEL_25:

        goto LABEL_26;
      }
      objc_msgSend(v6, "semanticType");
      v7 = BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType();
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "eventBody");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "modeType");

      if (v9 != v7)
      {
        v10 = (void *)a1[4];
        v11 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
        objc_msgSend(v11, "timestamp");
        v13 = v12;
        objc_msgSend(v48, "timestamp");
        objc_msgSend(v10, "addInferredModeEventToArrayStream:withStartTime:endTime:", v11, v13, v14);
        v15 = *(_QWORD *)(a1[5] + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = 0;

        goto LABEL_6;
      }
LABEL_26:

      goto LABEL_27;
    }
    v22 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v22)
    {
      objc_msgSend(v22, "eventBody");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "semanticType");
      if (v24 == objc_msgSend(v6, "semanticType"))
      {
        objc_msgSend(v48, "timestamp");
        v26 = v25;
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "timestamp");
        v28 = v27;

        if (v26 > v28)
        {
          v29 = (void *)a1[4];
          v30 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
          objc_msgSend(v30, "timestamp");
          v32 = v31;
          objc_msgSend(v48, "timestamp");
          objc_msgSend(v29, "addComputedModeEventToArrayStream:withStartTime:endTime:", v30, v32, v33);
        }
      }
      else
      {

      }
    }
    v46 = a1[6];
    goto LABEL_24;
  }
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0)
  {
    objc_msgSend(v48, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isStart"))
    {
      if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      {
        v17 = a1[5];
        goto LABEL_11;
      }
      goto LABEL_26;
    }
    v34 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    if (v34)
    {
      objc_msgSend(v34, "eventBody");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "modeType");
      if (v36 == objc_msgSend(v6, "modeType"))
      {
        objc_msgSend(v48, "timestamp");
        v38 = v37;
        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "timestamp");
        v40 = v39;

        if (v38 > v40)
        {
          v41 = (void *)a1[4];
          v42 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
          objc_msgSend(v42, "timestamp");
          v44 = v43;
          objc_msgSend(v48, "timestamp");
          objc_msgSend(v41, "addInferredModeEventToArrayStream:withStartTime:endTime:", v42, v44, v45);
        }
      }
      else
      {

      }
    }
    v46 = a1[5];
LABEL_24:
    v47 = *(_QWORD *)(v46 + 8);
    v21 = *(void **)(v47 + 40);
    *(_QWORD *)(v47 + 40) = 0;
    goto LABEL_25;
  }
LABEL_27:

}

uint64_t __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_2_34(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)addComputedModeEventToArrayStream:(id)a3 withStartTime:(double)a4 endTime:(double)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  ATXUnifiedModeEvent *v13;
  id v14;

  objc_msgSend(a3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "atx_dndModeSemanticType");

  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "atxModeForDNDSemanticType:", v9);

  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a4);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a5);
  v13 = -[ATXUnifiedModeEvent initWithMode:startTime:endTime:]([ATXUnifiedModeEvent alloc], "initWithMode:startTime:endTime:", v11, v14, v12);
  -[NSMutableArray addObject:](self->_modeEvents, "addObject:", v13);

}

- (void)addInferredModeEventToArrayStream:(id)a3 withStartTime:(double)a4 endTime:(double)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  ATXUnifiedModeEvent *v11;
  id v12;

  objc_msgSend(a3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modeType");
  BMUserFocusInferredModeTypeToActivity();
  v9 = ATXModeFromActivityType();

  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a5);
  v11 = -[ATXUnifiedModeEvent initWithMode:startTime:endTime:]([ATXUnifiedModeEvent alloc], "initWithMode:startTime:endTime:", v9, v12, v10);
  -[NSMutableArray addObject:](self->_modeEvents, "addObject:", v11);

}

- (BOOL)checkForOverlappingTimeRanges:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      v9 = v4;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_msgSend(v10, "startTime", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "compare:", v11) == -1)
        {

        }
        else
        {
          objc_msgSend(v10, "startTime");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v9, "compare:", v12);

          if (v13)
          {
            LOBYTE(v6) = 1;
            v4 = v9;
            goto LABEL_12;
          }
        }
        objc_msgSend(v10, "endTime");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v4;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
LABEL_12:

  return v6;
}

- (id)fetchUnifiedModeEvents
{
  return (id)-[NSMutableArray bpsPublisher](self->_modeEvents, "bpsPublisher");
}

+ (id)currentUnifiedModeEventAtGivenTime:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ATXUnifiedModeEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D80E48], "currrentModeEventAtGivenTime:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "atx_dndModeSemanticType");
    v7 = ATXModeForDNDSemanticType();

    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v5, "timestamp");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ATXUnifiedModeEvent initWithMode:startTime:endTime:]([ATXUnifiedModeEvent alloc], "initWithMode:startTime:endTime:", v7, v9, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D80E50], "currentModeEventAtGivenTime:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modeType");
    BMUserFocusInferredModeTypeToActivity();
    v12 = ATXModeFromActivityType();

    v13 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v9, "timestamp");
    objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ATXUnifiedModeEvent initWithMode:startTime:endTime:]([ATXUnifiedModeEvent alloc], "initWithMode:startTime:endTime:", v12, v14, 0);

  }
  return v10;
}

- (NSArray)unifiedModeEventsInTimeRange
{
  return self->_unifiedModeEventsInTimeRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedModeEventsInTimeRange, 0);
  objc_storeStrong((id *)&self->_modeEvents, 0);
  objc_storeStrong((id *)&self->_inferredModePublisher, 0);
  objc_storeStrong((id *)&self->_computedModePublisher, 0);
}

- (void)computeUnifiedModeEventsFromStartTime:(os_log_t)log toEndTime:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXUnifiedComputedAndInferredModeStream: Unified Mode events should be mutually exclusive with no overlapping time ranges.", v1, 2u);
}

void __91__ATXUnifiedComputedAndInferredModeStream_computeUnifiedModeEventsFromStartTime_toEndTime___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXUnifiedComputedAndInferredModeStream: Error fetching mode streams: %@", (uint8_t *)&v4, 0xCu);

}

@end
