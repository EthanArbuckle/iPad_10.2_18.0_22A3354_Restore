@implementation ATXHeroClipManager

+ (BOOL)clipsSupported
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1CAA48B6C](a1, a2);
  if (objc_msgSend(MEMORY[0x1E0D10800], "isSupported"))
  {
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSuggestAppClips"), CFSTR("com.apple.suggestions"));
    v4 = v3;
    if (v3)
      v5 = objc_msgSend(v3, "BOOLValue");
    else
      v5 = 1;

  }
  else
  {
    v5 = 0;
  }
  objc_autoreleasePoolPop(v2);
  return v5;
}

- (ATXHeroClipManager)init
{
  void *v3;
  ATXHeroClipManager *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXHeroClipManager initWithFeedback:](self, "initWithFeedback:", v3);

  return v4;
}

- (ATXHeroClipManager)initWithFeedback:(id)a3
{
  id v4;
  void *v5;
  ATXHeroClipManager *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[ATXHeroClipManager initWithFeedback:tracker:](self, "initWithFeedback:tracker:", v4, v5);

  return v6;
}

- (ATXHeroClipManager)initWithFeedback:(id)a3 tracker:(id)a4
{
  id v7;
  id v8;
  ATXHeroClipManager *v9;
  ATXHeroClipManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXHeroClipManager;
  v9 = -[ATXHeroClipManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feedback, a3);
    objc_storeStrong((id *)&v10->_tracker, a4);
  }

  return v10;
}

- (void)donateAppClipsWithHeroAppPredictions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  double v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "clipsSupported") & 1) == 0)
  {
    __atxlog_handle_hero();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Clearing App Clips Suggestions, since ClipServices are not supported on this device.", buf, 2u);
    }

    v4 = (id)MEMORY[0x1E0C9AA60];
  }
  if (!-[ATXAppClipsFeedback shouldShowAppClips](self->_feedback, "shouldShowAppClips"))
  {

    v4 = (id)MEMORY[0x1E0C9AA60];
  }
  v6 = (id)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v48 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (-[ATXAppClipsFeedback shouldShowAppClipWithHeroAppPrediction:](self->_feedback, "shouldShowAppClipWithHeroAppPrediction:", v12))
        {
          objc_msgSend(v6, "addObject:", v12);
        }
        else
        {
          -[ATXHeroClipManager logSuppressionMetricWithHeroAppPrediction:suppresionType:](self, "logSuppressionMetricWithHeroAppPrediction:suppresionType:", v12, 1);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getCurrentPreciseLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_hero();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "timeIntervalSinceNow");
      *(_DWORD *)buf = 134217984;
      v54 = -v17;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "Took %f seconds to fetch precise location", buf, 0xCu);
    }

    if (v15)
    {
      v18 = (void *)objc_msgSend(v6, "copy");
      +[ATXHeroDataServerHelper inRadiusPredictionsFrom:currentLocation:](ATXHeroDataServerHelper, "inRadiusPredictionsFrom:currentLocation:", v6, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v6 = v18;
      v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v44 != v23)
              objc_enumerationMutation(v6);
            v25 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
            if ((objc_msgSend(v20, "containsObject:", v25) & 1) == 0)
              -[ATXHeroClipManager logSuppressionMetricWithHeroAppPrediction:suppresionType:](self, "logSuppressionMetricWithHeroAppPrediction:suppresionType:", v25, 0);
          }
          v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        }
        while (v22);
      }

    }
    else
    {
      __atxlog_handle_hero();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[ATXHeroClipManager donateAppClipsWithHeroAppPredictions:].cold.1();

      v20 = (void *)objc_opt_new();
    }

    objc_msgSend((id)objc_opt_class(), "addPredictionLocationToHeroAppPredictions:location:", v20, v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v27, "mutableCopy");

  }
  v28 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v29 = v6;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k);
        -[ATXHeroClipManager _populateMetadataInHeroAppPrediction:](self, "_populateMetadataInHeroAppPrediction:", v34, (_QWORD)v39);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          objc_msgSend(v28, "addObject:", v35);
        else
          -[ATXHeroClipManager logSuppressionMetricWithHeroAppPrediction:suppresionType:](self, "logSuppressionMetricWithHeroAppPrediction:suppresionType:", v34, 2);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v31);
  }

  objc_msgSend((id)objc_opt_class(), "sortPredictionsOnFeedback:", v28);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_hero();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v36, "description");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v54 = *(double *)&v38;
    _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_DEFAULT, "Sending app clips predictions to blending layer. Predictions: %@", buf, 0xCu);

  }
  +[ATXAppClipsBlendingUpdater updateBlendingLayerWithHeroAppPredictions:](ATXAppClipsBlendingUpdater, "updateBlendingLayerWithHeroAppPredictions:", v36);

}

- (void)logSuppressionMetricWithHeroAppPrediction:(id)a3 suppresionType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v9 = (id)objc_opt_new();
  objc_msgSend(v6, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBundleId:", v7);

  objc_msgSend(v6, "urlHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setUrlHash:", v8);
  objc_msgSend(v9, "setSuppressionType:", v4);
  -[ATXPETEventTracker2Protocol trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v9);

}

- (id)_populateMetadataInHeroAppPrediction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[4];
  NSObject *v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v4 = a3;
  -[ATXAppClipsFeedback feedbackScoreForAppClipWithHeroAppPrediction:](self->_feedback, "feedbackScoreForAppClipWithHeroAppPrediction:", v4);
  objc_msgSend(v4, "setScore:");
  objc_msgSend(v4, "urlHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D107F0]);
    objc_msgSend(v4, "urlHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithURLHash:", v7);

    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__80;
    v44 = __Block_byref_object_dispose__80;
    v45 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__80;
    v38 = __Block_byref_object_dispose__80;
    v39 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v9 = dispatch_semaphore_create(0);
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke;
    v24[3] = &unk_1E82E73E8;
    v27 = &v30;
    v11 = v9;
    v25 = v11;
    v28 = &v40;
    v12 = v8;
    v26 = v12;
    v29 = &v34;
    -[NSObject requestMetadataWithCompletion:](v12, "requestMetadataWithCompletion:", v24);
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_2;
    v23[3] = &unk_1E82DA7D8;
    v23[4] = &v30;
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v11, &__block_literal_global_175, v23, 30.0);
    if (*((_BYTE *)v31 + 24))
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend((id)v41[5], "clipBundleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBundleId:", v20);

      objc_msgSend(v4, "setClipMetadata:", v41[5]);
      objc_msgSend((id)v35[5], "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v41[5], "setFullAppCachedIconFilePath:", v21);

      v13 = v4;
    }

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v40, 8);
  }
  else
  {
    __atxlog_handle_hero();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXHeroClipManager _populateMetadataInHeroAppPrediction:].cold.1((uint64_t)v4, v12, v14, v15, v16, v17, v18, v19);
    v13 = 0;
  }

  return v13;
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_hero();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_cold_2((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_22;
    v20[3] = &unk_1E82E73C0;
    v17 = *(_QWORD *)(a1 + 64);
    v22 = v15;
    v23 = v17;
    v18 = *(void **)(a1 + 40);
    v21 = *(id *)(a1 + 32);
    objc_msgSend(v18, "requestDownloadedIconWithMetadata:completion:", v16, v20);

  }
  else
  {
    __atxlog_handle_hero();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_22(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  __atxlog_handle_hero();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "Got clip icon! %@", (uint8_t *)&v8, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_22_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_hero();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

+ (id)sortPredictionsOnFeedback:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3928];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithKey:ascending:", CFSTR("score"), 0);
  __atxlog_handle_hero();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Sorting clip predictions based on score.", v10, 2u);
  }

  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)addPredictionLocationToHeroAppPredictions:(id)a3 location:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        objc_msgSend(v6, "coordinate", (_QWORD)v16);
        objc_msgSend(v13, "setLatitudeAtPredictionTime:");
        objc_msgSend(v6, "coordinate");
        objc_msgSend(v13, "setLongitudeAtPredictionTime:", v14);
        objc_msgSend(v7, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

+ (void)openAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "clipsSupported") & 1) != 0)
  {
    objc_msgSend(v6, "clipMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clipURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "clipMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clipURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D107F8]), "initWithURL:", v11);
      objc_msgSend(v12, "setShouldReturnErrorOnUserCancellation:", 1);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __66__ATXHeroClipManager_openAppClipWithHeroAppPrediction_completion___block_invoke;
      v17[3] = &unk_1E82DA9D0;
      v18 = v11;
      v19 = v7;
      v13 = v11;
      objc_msgSend(v12, "requestClipWithCompletion:", v17);

      goto LABEL_10;
    }
    __atxlog_handle_hero();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[ATXHeroClipManager openAppClipWithHeroAppPrediction:completion:].cold.1();
  }
  else
  {
    __atxlog_handle_hero();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring App Clips Suggestions, since ClipServices are not supported on this device.", buf, 2u);
    }
  }

  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v12, "appClipsErrorDomain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, objc_msgSend(v12, "appClipsLaunchErrorCode"), 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    (*((void (**)(id, id))v7 + 2))(v7, v13);
LABEL_10:

}

void __66__ATXHeroClipManager_openAppClipWithHeroAppPrediction_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  __atxlog_handle_hero();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66__ATXHeroClipManager_openAppClipWithHeroAppPrediction_completion___block_invoke_cold_1((uint64_t)v5, v7, v11, v12, v13, v14, v15, v16);

    if (objc_msgSend(v5, "code") != 8)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "openURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

    }
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
    {
      v10 = *(void (**)(void))(v18 + 16);
      goto LABEL_13;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_INFO, "Request succeeded for app clip with url: %@", (uint8_t *)&v19, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_13:
      v10();
    }
  }

}

- (ATXAppClipsFeedback)feedback
{
  return self->_feedback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

- (void)donateAppClipsWithHeroAppPredictions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Could not get precise location. Clearing predictions.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_populateMetadataInHeroAppPrediction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Received nil url hash for app clip prediction: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Clip metadata not received.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error getting metadata for app clip: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Clip icon request returned nil iconURL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__ATXHeroClipManager__populateMetadataInHeroAppPrediction___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Timed out while fetching metadata from clipservices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)openAppClipWithHeroAppPrediction:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "URL does not exist in clip metadata.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __66__ATXHeroClipManager_openAppClipWithHeroAppPrediction_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error while opening app clip: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
