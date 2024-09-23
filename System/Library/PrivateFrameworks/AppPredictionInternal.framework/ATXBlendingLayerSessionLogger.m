@implementation ATXBlendingLayerSessionLogger

- (ATXBlendingLayerSessionLogger)init
{
  void *v3;
  void *v4;
  ATXBlendingLayerSessionLogger *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXBlendingLayerSessionLogger initWithTracker:hyperParameters:](self, "initWithTracker:hyperParameters:", v3, v4);

  return v5;
}

- (ATXBlendingLayerSessionLogger)initWithTracker:(id)a3 hyperParameters:(id)a4
{
  id v7;
  id v8;
  ATXBlendingLayerSessionLogger *v9;
  ATXBlendingLayerSessionLogger *v10;
  uint64_t v11;
  NSMutableDictionary *mostRecentBlendingCacheUpdateByConsumerSubType;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXBlendingLayerSessionLogger;
  v9 = -[ATXBlendingLayerSessionLogger init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tracker, a3);
    objc_storeStrong((id *)&v10->_hyperParameters, a4);
    v11 = objc_opt_new();
    mostRecentBlendingCacheUpdateByConsumerSubType = v10->_mostRecentBlendingCacheUpdateByConsumerSubType;
    v10->_mostRecentBlendingCacheUpdateByConsumerSubType = (NSMutableDictionary *)v11;

  }
  return v10;
}

- (BOOL)logCurrentSessionIfPossible
{
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[ATXBlendingLayerSessionLogger shouldLogSession](self, "shouldLogSession");
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Logging session because logger said we can.", (uint8_t *)&v15, 2u);
    }

    sel_getName(a2);
    v5 = os_transaction_create();
    -[ATXBlendingLayerSessionLogger generateSessionLog](self, "generateSessionLog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "SessionLog: %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(v7, "blendingUpdates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {

    }
    else
    {
      objc_msgSend(v7, "ermEvents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (!v12)
      {
        __atxlog_handle_blending();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Not forwarding session log proto to PET because it was empty", (uint8_t *)&v15, 2u);
        }

        v10 = 0;
        goto LABEL_13;
      }
    }
    -[ATXBlendingLayerSessionLogger logSessionLogToPET:](self, "logSessionLogToPET:", v7);
    v10 = 1;
LABEL_13:

    goto LABEL_14;
  }
  if (v6)
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Not logging session because session logger said not to.", (uint8_t *)&v15, 2u);
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)shouldLogSession
{
  -[ATXBlendingLayerHyperParameters sessionLogSamplingRate](self->_hyperParameters, "sessionLogSamplingRate");
  return +[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:");
}

- (void)logSessionLogToPET:(id)a3
{
  -[ATXPETEventTracker2Protocol logMessage:](self->_tracker, "logMessage:", a3);
}

- (id)generateSessionLog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  ATXBlendingLayerSessionLogger *v17;
  id v18;
  id v19;
  id v20;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  -[ATXBlendingLayerSessionLogger orderedMergeERMBlendingContextUIPublisher](self, "orderedMergeERMBlendingContextUIPublisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __51__ATXBlendingLayerSessionLogger_generateSessionLog__block_invoke_2;
  v16 = &unk_1E82E2258;
  v17 = self;
  v18 = v4;
  v19 = v6;
  v20 = v5;
  v8 = v5;
  v9 = v6;
  v10 = v4;
  v11 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_94, &v13);
  objc_msgSend(v3, "setErmEvents:", v10, v13, v14, v15, v16, v17);
  objc_msgSend(v3, "setBlendingUpdates:", v8);

  return v3;
}

void __51__ATXBlendingLayerSessionLogger_generateSessionLog__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = v3;
    objc_msgSend(v5, "numberWithUnsignedChar:", objc_msgSend(v6, "consumerSubType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

LABEL_3:
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v3);
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "homeScreenEvent");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = v8;

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") > 0x13)
      goto LABEL_23;
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "sessionERMEventFromERMEvent:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v7);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v18 = *(void **)(a1 + 48);
          objc_msgSend(v17, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v18) = objc_msgSend(v18, "containsObject:", v19);

          if ((v18 & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "sessionBlendingUpdateFromBlendingUICacheUpdate:deviceContext:", v17, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v20);
            v21 = *(void **)(a1 + 48);
            objc_msgSend(v17, "uuid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v22);

          }
        }
        v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }
    goto LABEL_3;
  }
  __atxlog_handle_blending();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    __51__ATXBlendingLayerSessionLogger_generateSessionLog__block_invoke_2_cold_1(v23);

LABEL_23:
}

- (id)orderedMergeERMBlendingContextUIPublisher
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  if (self->_ermEvents)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02478]), "initWithSequence:", self->_ermEvents);
  }
  else
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -1200.0);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = v6;

    objc_msgSend(v4, "publisherFromStartTime:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_blendingEvents)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02478]), "initWithSequence:", self->_blendingEvents);
  }
  else
  {
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2400.0);
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v12 = v11;

    objc_msgSend(v9, "publisherFromStartTime:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_predictionContextEvents)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02478]), "initWithSequence:", self->_predictionContextEvents);
  }
  else
  {
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2400.0);
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v17 = v16;

    objc_msgSend(v14, "publisherFromStartTime:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_uiEvents)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02478]), "initWithSequence:", self->_uiEvents);
  }
  else
  {
    v19 = (void *)objc_opt_new();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2400.0);
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = v21;

    objc_msgSend(v19, "genericEventPublisherFromStartTime:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v18, "filterWithIsIncluded:", &__block_literal_global_26_0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  v27[1] = v13;
  v27[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedMergeWithOthers:comparator:", v24, &__block_literal_global_29_1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __74__ATXBlendingLayerSessionLogger_orderedMergeERMBlendingContextUIPublisher__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "homeScreenEvent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "eventTypeString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("DeviceLocked"));

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __74__ATXBlendingLayerSessionLogger_orderedMergeERMBlendingContextUIPublisher__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)sessionERMEventFromERMEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "entry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "engagementRecordType");

  if (v7 <= 119)
  {
    if (v7 <= 15)
    {
      switch(v7)
      {
        case 1:
          v8 = v5;
          v9 = 0;
          goto LABEL_28;
        case 2:
          goto LABEL_27;
        case 4:
          v8 = v5;
          v9 = 3;
          goto LABEL_28;
        case 8:
          v10 = (void *)MEMORY[0x1E0CF9508];
          v11 = 36;
          goto LABEL_26;
        default:
          goto LABEL_29;
      }
      goto LABEL_29;
    }
    if (v7 == 16)
    {
      v10 = (void *)MEMORY[0x1E0CF9508];
      v11 = 37;
      goto LABEL_26;
    }
    if (v7 != 32)
    {
      if (v7 != 64)
        goto LABEL_29;
      v10 = (void *)MEMORY[0x1E0CF9508];
      v11 = 35;
      goto LABEL_26;
    }
LABEL_17:
    v10 = (void *)MEMORY[0x1E0CF9508];
    v11 = 21;
LABEL_26:
    objc_msgSend(v10, "stringForConsumerSubtype:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConsumerSubType:", v13);

LABEL_27:
    v8 = v5;
    v9 = 1;
LABEL_28:
    objc_msgSend(v8, "setEngagementType:", v9);
    goto LABEL_29;
  }
  if (v7 <= 255)
  {
    if (v7 == 120)
      goto LABEL_27;
    if (v7 != 121)
    {
      if (v7 != 128)
        goto LABEL_29;
      goto LABEL_17;
    }
  }
  else
  {
    if (v7 <= 895)
    {
      if (v7 != 256 && v7 != 512)
        goto LABEL_29;
      goto LABEL_17;
    }
    if (v7 != 896 && v7 != 1021)
      goto LABEL_29;
  }
  __atxlog_handle_blending();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[ATXBlendingLayerSessionLogger sessionERMEventFromERMEvent:].cold.1(v4, v12);

LABEL_29:
  v14 = (void *)MEMORY[0x1E0D81190];
  objc_msgSend(v4, "entry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "executable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "object");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "genericStringForExecutableObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExecutableId:", v18);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMutableDictionary allValues](self->_mostRecentBlendingCacheUpdateByConsumerSubType, "allValues", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v23), "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addBlendingUpdateUUID:", v25);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v21);
  }

  return v5;
}

- (id)sessionBlendingUpdateFromBlendingUICacheUpdate:(id)a3 deviceContext:(id)a4
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
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBlendingUpdateUUID:", v10);

  -[ATXBlendingLayerHyperParameters abGroup](self->_hyperParameters, "abGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBlendingABGroup:", v11);

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(v6, "consumerSubType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConsumerSubType:", v12);

  -[ATXBlendingLayerSessionLogger sessionClientModelUpdatesForUICacheUpdate:](self, "sessionClientModelUpdatesForUICacheUpdate:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientModelUpdates:", v13);

  -[ATXBlendingLayerSessionLogger sessionUICacheForUICacheUpdate:](self, "sessionUICacheForUICacheUpdate:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUiCache:", v14);

  -[ATXBlendingLayerSessionLogger sessionDeviceContextFromPredictionContext:](self, "sessionDeviceContextFromPredictionContext:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceContext:", v15);

  if (v7)
  {
    objc_msgSend(v6, "cacheCreationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v18);
    v20 = v19;
    objc_msgSend(v8, "deviceContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSecondsBeforeBlendingUpdate:", v20);

  }
  else
  {
    objc_msgSend(v8, "deviceContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSecondsBeforeBlendingUpdate:", 0.0);
  }

  return v8;
}

- (int)locationTypeFromLocationOfInterest:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  int v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "type"), v5 <= 3))
    v6 = dword_1C9E7EB00[v5];
  else
    v6 = 0;

  return v6;
}

- (id)sessionDeviceContextFromPredictionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  _BOOL8 v8;
  void *v9;
  double v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  -[ATXHomeScreenEvent date](self->_mostRecentScreenLockEvent, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ATXBlendingLayerSessionLogger now](self, "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = v7 > 3600.0;

    -[ATXBlendingLayerSessionLogger now](self, "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v5);
    v11 = v10 > 1800.0;

  }
  else
  {
    v11 = 0;
    v8 = 0;
  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setLastUnlockMoreThan1HourAgo:", v8);
  objc_msgSend(v12, "setLastUnlockMoreThan30MinutesAgo:", v11);
  objc_msgSend(v4, "locationMotionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentLOI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentLOIType:", -[ATXBlendingLayerSessionLogger locationTypeFromLocationOfInterest:](self, "locationTypeFromLocationOfInterest:", v14));

  if (v4)
  {
    objc_msgSend(v4, "timeContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDayOfWeek:", objc_msgSend(v15, "dayOfWeek"));

    objc_msgSend(v4, "timeContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTimeOfDay:", objc_msgSend(v16, "timeOfDay"));

    objc_msgSend(v4, "timeContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDateInWeekend:", objc_msgSend(v17, "dateInWeekend"));
  }
  else
  {
    -[ATXBlendingLayerSessionLogger now](self, "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "components:fromDate:", 544, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDayOfWeek:", objc_msgSend(v19, "weekday") - 1);
    objc_msgSend(v12, "setTimeOfDay:", objc_msgSend(v19, "hour"));
    objc_msgSend(v12, "setDateInWeekend:", objc_msgSend(v18, "isDateInWeekend:", v17));

  }
  return v12;
}

- (id)sessionClientModelUpdatesForUICacheUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *context;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = (id)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v26 = v4;
  -[ATXBlendingLayerSessionLogger clientModelCacheUpdatesFromBlendingCacheUpdate:](self, "clientModelCacheUpdatesFromBlendingCacheUpdate:", v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v38;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(obj);
        v32 = v5;
        v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1CAA48B6C]();
        v7 = (void *)objc_opt_new();
        objc_msgSend(v6, "clientModelId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setClientModelId:", v8);

        objc_msgSend(v6, "suggestions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clientModelSpecification");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "clientModelVersion");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (const __CFString *)v12;
        else
          v14 = CFSTR("EmptyPredictions");
        objc_msgSend(v7, "setClientModelVersion:", v14);

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(v6, "suggestions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              v21 = (void *)MEMORY[0x1CAA48B6C]();
              objc_msgSend(v7, "suggestions");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "count");

              if (v23 <= 0x13)
              {
                -[ATXBlendingLayerSessionLogger sessionSuggestionFromProactiveSuggestion:](self, "sessionSuggestionFromProactiveSuggestion:", v20);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addSuggestion:", v24);

              }
              objc_autoreleasePoolPop(v21);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v17);
        }

        objc_msgSend(v29, "addObject:", v7);
        objc_autoreleasePoolPop(context);
        v5 = v32 + 1;
      }
      while (v32 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v30);
  }

  return v29;
}

- (id)clientModelCacheUpdatesFromBlendingCacheUpdate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "clientModelCacheUpdateUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithArray:", v8);

  v10 = (void *)objc_opt_new();
  -[ATXBlendingLayerSessionLogger clientModelPublisher](self, "clientModelPublisher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __80__ATXBlendingLayerSessionLogger_clientModelCacheUpdatesFromBlendingCacheUpdate___block_invoke;
  v24[3] = &unk_1E82DF748;
  v25 = v9;
  v13 = v9;
  objc_msgSend(v11, "filterWithIsIncluded:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12;
  v20 = 3221225472;
  v21 = __80__ATXBlendingLayerSessionLogger_clientModelCacheUpdatesFromBlendingCacheUpdate___block_invoke_3;
  v22 = &unk_1E82DB0C8;
  v23 = v10;
  v15 = v10;
  v16 = (id)objc_msgSend(v14, "sinkWithCompletion:receiveInput:", &__block_literal_global_41, &v19);
  v17 = (void *)objc_msgSend(v15, "copy", v19, v20, v21, v22);

  return v17;
}

BOOL __80__ATXBlendingLayerSessionLogger_clientModelCacheUpdatesFromBlendingCacheUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

    if ((v4 & 1) != 0)
      v6 = 1;
  }

  return v6;
}

void __80__ATXBlendingLayerSessionLogger_clientModelCacheUpdatesFromBlendingCacheUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "eventBody");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)clientModelPublisher
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (self->_clientModelEvents)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02478]), "initWithSequence:", self->_clientModelEvents);
  }
  else
  {
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2400.0);
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = v5;

    objc_msgSend(v3, "publisherFromStartTime:", v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)sessionUICacheForUICacheUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(v4, "consumerSubType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConsumerSubType:", v6);

  objc_msgSend(v4, "uiCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "uiCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v26 = v4;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v11;

    goto LABEL_9;
  }
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v4, "uiCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minSuggestionListInLayout");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  __atxlog_handle_blending();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    -[ATXBlendingLayerSessionLogger sessionUICacheForUICacheUpdate:].cold.1(v4, v14);

  v13 = 0;
LABEL_9:
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v5, "suggestions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23 <= 0x3B)
        {
          -[ATXBlendingLayerSessionLogger sessionSuggestionFromProactiveSuggestion:](self, "sessionSuggestionFromProactiveSuggestion:", v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addSuggestion:", v24);

        }
        objc_autoreleasePoolPop(v21);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v17);
  }

  return v5;
}

- (id)sessionSuggestionFromProactiveSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "genericStringForSuggestionExecutableObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExecutableId:", v5);

  objc_msgSend(v3, "scoreSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rawScore");
  objc_msgSend(v4, "setRawScore:");

  objc_msgSend(v3, "scoreSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "suggestedConfidenceCategory");
  if (v8 <= 4)
    objc_msgSend(v4, "setSuggestedConfidenceCategory:", v8);
  return v4;
}

- (NSDate)now
{
  NSDate *now;

  now = self->_now;
  if (now)
    return now;
  else
    return (NSDate *)(id)objc_opt_new();
}

- (NSArray)uiEvents
{
  return self->_uiEvents;
}

- (void)setUiEvents:(id)a3
{
  objc_storeStrong((id *)&self->_uiEvents, a3);
}

- (NSArray)ermEvents
{
  return self->_ermEvents;
}

- (void)setErmEvents:(id)a3
{
  objc_storeStrong((id *)&self->_ermEvents, a3);
}

- (NSArray)blendingEvents
{
  return self->_blendingEvents;
}

- (void)setBlendingEvents:(id)a3
{
  objc_storeStrong((id *)&self->_blendingEvents, a3);
}

- (NSArray)clientModelEvents
{
  return self->_clientModelEvents;
}

- (void)setClientModelEvents:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelEvents, a3);
}

- (NSArray)predictionContextEvents
{
  return self->_predictionContextEvents;
}

- (void)setPredictionContextEvents:(id)a3
{
  objc_storeStrong((id *)&self->_predictionContextEvents, a3);
}

- (void)setNow:(id)a3
{
  objc_storeStrong((id *)&self->_now, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_predictionContextEvents, 0);
  objc_storeStrong((id *)&self->_clientModelEvents, 0);
  objc_storeStrong((id *)&self->_blendingEvents, 0);
  objc_storeStrong((id *)&self->_ermEvents, 0);
  objc_storeStrong((id *)&self->_uiEvents, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_mostRecentScreenLockEvent, 0);
  objc_storeStrong((id *)&self->_mostRecentPredictionContext, 0);
  objc_storeStrong((id *)&self->_mostRecentBlendingCacheUpdateByConsumerSubType, 0);
}

void __51__ATXBlendingLayerSessionLogger_generateSessionLog__block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Encountered an unkonwn event type.", v1, 2u);
}

- (void)sessionERMEventFromERMEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "entry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134217984;
  v5 = objc_msgSend(v3, "engagementRecordType");
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Encountered an unknown engagement record type that should only be used for querying: %lu", (uint8_t *)&v4, 0xCu);

}

- (void)sessionUICacheForUICacheUpdate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v2;
  void *v5;
  __CFString *v6;
  objc_class *v7;
  void *v8;
  int v9;
  __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uiCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "uiCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("nil");
  }
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(a1, "consumerSubType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v6;
  v11 = 2112;
  v12 = v8;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Encountered an unknown ui cache class of %@, consumerSubType = %@", (uint8_t *)&v9, 0x16u);
  if (v5)
  {

  }
}

@end
