@implementation ATXModeTransitionMetricsLogUploader

- (ATXModeTransitionMetricsLogUploader)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXModeTransitionMetricsLogUploader *v9;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UserFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ComputedMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UserFocus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "InferredMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXModeTransitionMetricsLogUploader initWithComputedModeStream:inferredModeStream:](self, "initWithComputedModeStream:inferredModeStream:", v5, v8);

  return v9;
}

- (ATXModeTransitionMetricsLogUploader)initWithComputedModeStream:(id)a3 inferredModeStream:(id)a4
{
  id v7;
  id v8;
  ATXModeTransitionMetricsLogUploader *v9;
  ATXModeTransitionMetricsLogUploader *v10;
  uint64_t v11;
  ATXDNDModeConfigurationClient *client;
  uint64_t v13;
  NSDictionary *modeConfigurations;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXModeTransitionMetricsLogUploader;
  v9 = -[ATXModeTransitionMetricsLogUploader init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_computedModeStream, a3);
    objc_storeStrong((id *)&v10->_inferredModeStream, a4);
    objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    client = v10->_client;
    v10->_client = (ATXDNDModeConfigurationClient *)v11;

    -[ATXDNDModeConfigurationClient getAllModeConfigurationsWithoutCache](v10->_client, "getAllModeConfigurationsWithoutCache");
    v13 = objc_claimAutoreleasedReturnValue();
    modeConfigurations = v10->_modeConfigurations;
    v10->_modeConfigurations = (NSDictionary *)v13;

  }
  return v10;
}

- (void)uploadLogsToCoreAnalyticsWithXPCActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a3;
  -[ATXModeTransitionMetricsLogUploader _timeBasedMergedPublisher](self, "_timeBasedMergedPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = (id)objc_opt_new();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__2;
  v27[4] = __Block_byref_object_dispose__2;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__2;
  v25[4] = __Block_byref_object_dispose__2;
  v26 = 0;
  -[ATXModeTransitionMetricsLogUploader _modeTransitionBookmark](self, "_modeTransitionBookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__ATXModeTransitionMetricsLogUploader_uploadLogsToCoreAnalyticsWithXPCActivity___block_invoke;
  v23[3] = &unk_1E82DAF68;
  v9 = v6;
  v24 = v9;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __80__ATXModeTransitionMetricsLogUploader_uploadLogsToCoreAnalyticsWithXPCActivity___block_invoke_2;
  v18[3] = &unk_1E82DAF90;
  v20 = v27;
  v21 = v25;
  v18[4] = self;
  v22 = &v29;
  v10 = v4;
  v19 = v10;
  v11 = (id)objc_msgSend(v5, "drivableSinkWithBookmark:completion:shouldContinue:", v7, v23, v18);

  v12 = v30[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v14 = -[ATXModeTransitionMetricsLogUploader processInferredModeEvents:beforeTimestamp:](self, "processInferredModeEvents:beforeTimestamp:", v12);

  v17 = 0;
  objc_msgSend(v9, "saveBookmarkWithError:", &v17);
  v15 = v17;
  if (v15)
  {
    __atxlog_handle_modes();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXModeTransitionMetricsLogUploader uploadLogsToCoreAnalyticsWithXPCActivity:].cold.1((uint64_t)v15, v16);

  }
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

}

uint64_t __80__ATXModeTransitionMetricsLogUploader_uploadLogsToCoreAnalyticsWithXPCActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBookmark:");
}

uint64_t __80__ATXModeTransitionMetricsLogUploader_uploadLogsToCoreAnalyticsWithXPCActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  char v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v29;

  v4 = a2;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v4);
    goto LABEL_18;
  }
  if (!v7)
  {
LABEL_21:

    v27 = 1;
    goto LABEL_22;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    goto LABEL_25;
  v10 = objc_msgSend(v7, "starting");
  v11 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if ((v10 & 1) != 0)
  {
LABEL_20:
    objc_storeStrong(v11, a2);
    goto LABEL_21;
  }
  if (*v11)
  {
LABEL_25:
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) || objc_msgSend(v8, "starting"))
      goto LABEL_11;
    v11 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    goto LABEL_20;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "matchingInferredModeEvent:inferredModeEvents:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeObject:", v12);
  v13 = (void *)MEMORY[0x1E0C99DE8];
  v14 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "timestamp");
  objc_msgSend(v14, "processInferredModeEvents:beforeTimestamp:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithArray:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && objc_msgSend(v8, "starting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "matchingInferredModeEvent:inferredModeEvents:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 32);
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v12, "eventBody");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "eventBody");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_logModeTransitionMetricWithPreviousModeStart:previousModeEnd:currentModeStart:matchingPreviousInferredModeEvent:matchingCurrentInferredModeEvent:", v21, v22, v4, v23, v24);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = 0;

  }
LABEL_18:
  v27 = objc_msgSend(*(id *)(a1 + 40), "didDefer") ^ 1;
LABEL_22:

  return v27;
}

- (id)matchingInferredModeEvent:(id)a3 inferredModeEvents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "semanticType");
  v8 = BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "eventBody", (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isStart"))
        {
          if (objc_msgSend(v15, "modeType") == v8)
          {
            objc_msgSend(v5, "timestamp");
            v17 = v16;
            objc_msgSend(v14, "timestamp");
            if (v17 - v18 <= 1.0 && objc_msgSend(v7, "updateReason") == 3)
            {
              v19 = v14;

              goto LABEL_14;
            }
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (id)processInferredModeEvents:(id)a3 beforeTimestamp:(double)a4
{
  id v6;
  void *v7;
  _QWORD v9[8];
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__2;
  v12[4] = __Block_byref_object_dispose__2;
  v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__2;
  v10[4] = __Block_byref_object_dispose__2;
  v11 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__ATXModeTransitionMetricsLogUploader_processInferredModeEvents_beforeTimestamp___block_invoke;
  v9[3] = &unk_1E82DAFB8;
  *(double *)&v9[7] = a4;
  v9[5] = v12;
  v9[6] = v10;
  v9[4] = self;
  objc_msgSend(v6, "_pas_filteredArrayWithTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(v12, 8);
  return v7;
}

BOOL __81__ATXModeTransitionMetricsLogUploader_processInferredModeEvents_beforeTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;

  v4 = a2;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  v8 = *(double *)(a1 + 56);
  if (v6 < v8)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v20 = objc_msgSend(v5, "isStart");
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (v20)
      {
        v22 = v4;
        v17 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v22;
        goto LABEL_16;
      }
      if (!*(_QWORD *)(v21 + 40))
        goto LABEL_17;
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      if ((objc_msgSend(v5, "isStart") & 1) == 0)
      {
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v24 = v4;
        v17 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v24;
        goto LABEL_16;
      }
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        goto LABEL_17;
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      if (objc_msgSend(v5, "isStart"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "eventBody");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "modeType");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "eventBody");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "modeType");

        if (v10 == v12)
        {
          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "timestamp");
          v15 = v14;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timestamp");
          objc_msgSend(v13, "numberWithDouble:", v15 - v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_logWithPreviousInferredModeEvent:currentInferredModeEvent:withDuration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4, v17);
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v19 = *(void **)(v18 + 40);
          *(_QWORD *)(v18 + 40) = 0;

LABEL_16:
        }
      }
    }
  }
LABEL_17:

  return v7 >= v8;
}

- (void)_logWithPreviousInferredModeEvent:(id)a3 currentInferredModeEvent:(id)a4 withDuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "eventBody");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "eventBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXModeTransitionMetricsLogUploader _populateInferredModeFieldsOnTheModeTransitionMetric:withPreviousInferredModeEvent:currentInferredModeEvent:duration:](self, "_populateInferredModeFieldsOnTheModeTransitionMetric:withPreviousInferredModeEvent:currentInferredModeEvent:duration:", v11, v12, v13, v8);
  __atxlog_handle_modes();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "coreAnalyticsDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v15;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "ATXModeTransitionMetricsLogUploader: Uploading inferred mode metric to CA: %@", (uint8_t *)&v16, 0xCu);

  }
  objc_msgSend(v11, "logToCoreAnalytics");

}

- (void)_populateInferredModeFieldsOnTheModeTransitionMetric:(id)a3 withPreviousInferredModeEvent:(id)a4 currentInferredModeEvent:(id)a5 duration:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "confidenceScore");
  objc_msgSend(v9, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInferredModeConfidenceScore:", v14);

  objc_msgSend(v13, "setInferredModeDuration:", v10);
  objc_msgSend(v12, "originAnchorType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInferredModeOriginAnchorType:", v15);

  objc_msgSend(v12, "modeType");
  BMUserFocusInferredModeTypeAsString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInferredModeType:", v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "uiLocation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInferredModeUILocation:", v17);

  objc_msgSend(v12, "origin");
  BMUserFocusInferredModeOriginAsString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreviousModeOrigin:", v18);

  objc_msgSend(v11, "origin");
  BMUserFocusInferredModeOriginAsString();
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCurrentModeOrigin:", v19);

}

- (id)_timeBasedMergedPublisher
{
  void *v3;
  void *v4;
  void *v5;

  -[BMStream atx_publisherFromStartTime:](self->_inferredModeStream, "atx_publisherFromStartTime:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStream atx_publisherFromStartTime:](self->_computedModeStream, "atx_publisherFromStartTime:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedMergeWithOther:comparator:", v3, &__block_literal_global_7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __64__ATXModeTransitionMetricsLogUploader__timeBasedMergedPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_logModeTransitionMetricWithPreviousModeStart:(id)a3 previousModeEnd:(id)a4 currentModeStart:(id)a5 matchingPreviousInferredModeEvent:(id)a6 matchingCurrentInferredModeEvent:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  ATXModeTransitionMetric *v27;
  NSDictionary *modeConfigurations;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  ATXModeTransitionMetric *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  NSObject *v50;
  void *v51;
  BOOL v52;
  ATXModeTransitionMetricsLogUploader *v53;
  __CFString *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v63 = a6;
  v64 = a7;
  objc_msgSend(v13, "eventBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventBody");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "modeSemanticTypeAsString");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestamp");
  v19 = v18;
  v62 = v12;
  objc_msgSend(v12, "timestamp");
  v21 = v19 - v20;
  v22 = objc_msgSend(v15, "updateReason");
  objc_msgSend(v15, "modeUpdateReasonAsString");
  v23 = objc_claimAutoreleasedReturnValue();
  v59 = v15;
  objc_msgSend(v15, "modeUpdateSourceAsString");
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "modeSemanticTypeAsString");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "modeUpdateReasonAsString");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v52 = -[ATXModeTransitionMetricsLogUploader _previousModeEndEvent:isContiguousWithModeStartEvent:](self, "_previousModeEndEvent:isContiguousWithModeStartEvent:", v13, v14);
  v60 = v14;
  v61 = v13;
  if (!v52)
  {

    v25 = CFSTR("No Mode");
    v26 = CFSTR("Fallback");
  }
  v56 = v25;
  v54 = v26;
  v55 = (void *)v23;
  v57 = (void *)v24;
  v27 = -[ATXModeTransitionMetric initWithPreviousModeSemanticType:previousModeDuration:previousModeHadScheduledExit:exitReason:enterReason:transitionDeviceType:transitionSource:nextModeSemanticType:]([ATXModeTransitionMetric alloc], "initWithPreviousModeSemanticType:previousModeDuration:previousModeHadScheduledExit:exitReason:enterReason:transitionDeviceType:transitionSource:nextModeSemanticType:", v17, v22 == 2, v23, v26, 0, v24, v21, v25);
  v53 = self;
  modeConfigurations = self->_modeConfigurations;
  objc_msgSend(v16, "semanticModeIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](modeConfigurations, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v58 = v30;
  objc_msgSend(v30, "triggers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v66 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v36, "isEnabled"))
        {
          -[ATXModeTransitionMetric setLocationBasedSchedulingEnabled:](v27, "setLocationBasedSchedulingEnabled:", 1);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v36, "isEnabled"))
          {
            -[ATXModeTransitionMetric setTimeBasedSchedulingEnabled:](v27, "setTimeBasedSchedulingEnabled:", 1);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v36, "isEnabled"))
            {
              -[ATXModeTransitionMetric setAppBasedSchedulingEnabled:](v27, "setAppBasedSchedulingEnabled:", 1);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v36, "isEnabled"))
                -[ATXModeTransitionMetric setSmartActivationEnabled:](v27, "setSmartActivationEnabled:", 1);
            }
          }
        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v33);
  }

  v37 = v63;
  -[ATXModeTransitionMetricsLogUploader _populateInferredModeFieldsOnTheModeTransitionMetric:withPreviousInferredModeEvent:currentInferredModeEvent:duration:](v53, "_populateInferredModeFieldsOnTheModeTransitionMetric:withPreviousInferredModeEvent:currentInferredModeEvent:duration:", v27, v63, v64, 0);
  __atxlog_handle_modes();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    -[ATXModeTransitionMetric coreAnalyticsDictionary](v27, "coreAnalyticsDictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v70 = v39;
    _os_log_impl(&dword_1C9A3B000, v38, OS_LOG_TYPE_DEFAULT, "ATXModeTransitionMetricsLogUploader: Uploading mode transition metric to CA: %@", buf, 0xCu);

  }
  -[_ATXCoreAnalyticsMetric logToCoreAnalytics](v27, "logToCoreAnalytics");
  if (v52)
  {
    v40 = v27;
    v41 = v17;
    v42 = v57;
    v43 = v55;
    v44 = v56;
    v45 = v54;
  }
  else
  {

    objc_msgSend(v60, "timestamp");
    v47 = v46;
    objc_msgSend(v61, "timestamp");
    v49 = v47 - v48;
    objc_msgSend(v16, "modeUpdateReasonAsString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "modeUpdateReasonAsString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "modeUpdateSourceAsString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "modeSemanticTypeAsString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = -[ATXModeTransitionMetric initWithPreviousModeSemanticType:previousModeDuration:previousModeHadScheduledExit:exitReason:enterReason:transitionDeviceType:transitionSource:nextModeSemanticType:]([ATXModeTransitionMetric alloc], "initWithPreviousModeSemanticType:previousModeDuration:previousModeHadScheduledExit:exitReason:enterReason:transitionDeviceType:transitionSource:nextModeSemanticType:", CFSTR("No Mode"), 0, v43, v45, 0, v42, v49, v44);
    __atxlog_handle_modes();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      -[ATXModeTransitionMetric coreAnalyticsDictionary](v40, "coreAnalyticsDictionary");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v70 = v51;
      _os_log_impl(&dword_1C9A3B000, v50, OS_LOG_TYPE_DEFAULT, "ATXModeTransitionMetricsLogUploader: Uploading mode transition metric to CA: %@", buf, 0xCu);

      v37 = v63;
    }

    -[_ATXCoreAnalyticsMetric logToCoreAnalytics](v40, "logToCoreAnalytics");
    v41 = CFSTR("No Mode");
  }

}

- (BOOL)_previousModeEndEvent:(id)a3 isContiguousWithModeStartEvent:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a3;
  objc_msgSend(a4, "timestamp");
  v7 = v6;
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  return v7 - v9 < 10.0;
}

- (id)_modeTransitionBookmark
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "bookmarksPathFile:", CFSTR("kModeTransitionMetricsBookmarkFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initFileURLWithPath:", v3);

  objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", v4, 1000000, &unk_1E83CBAE8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF94A0]), "initWithURLPath:versionNumber:bookmark:metadata:", v4, &unk_1E83CBAE8, 0, 0);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConfigurations, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_inferredModeStream, 0);
  objc_storeStrong((id *)&self->_computedModeStream, 0);
}

- (void)uploadLogsToCoreAnalyticsWithXPCActivity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXModeTransitionMetricsLogUploader: Unable to save activity suggestion bookmark, error: %@", (uint8_t *)&v2, 0xCu);
}

@end
