@implementation ATXContinuousUsageAccumulator

- (ATXContinuousUsageAccumulator)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXContinuousUsageAccumulator *v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "App");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "InFocus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v3, 0, 0, 0, 0);
  objc_msgSend(v6, "publisherWithUseCase:options:", *MEMORY[0x1E0CF9398], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXContinuousUsageAccumulator initWithAppLaunchPublisher:](self, "initWithAppLaunchPublisher:", v8);

  return v9;
}

- (ATXContinuousUsageAccumulator)initWithAppLaunchPublisher:(id)a3
{
  id v5;
  ATXContinuousUsageAccumulator *v6;
  ATXContinuousUsageAccumulator *v7;
  uint64_t v8;
  NSMutableArray *appInFocusStartingEvents;
  uint64_t v10;
  NSMutableArray *continuousUsageAccumulator;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXContinuousUsageAccumulator;
  v6 = -[ATXContinuousUsageAccumulator init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appLaunchPublisher, a3);
    v8 = objc_opt_new();
    appInFocusStartingEvents = v7->_appInFocusStartingEvents;
    v7->_appInFocusStartingEvents = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    continuousUsageAccumulator = v7->_continuousUsageAccumulator;
    v7->_continuousUsageAccumulator = (NSMutableArray *)v10;

  }
  return v7;
}

- (BOOL)successfullyAccumulatedContinuousUseEvents
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BPSPublisher *appLaunchPublisher;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *p_super;
  NSMutableArray *v12;
  _QWORD v14[4];
  id v15;
  ATXContinuousUsageAccumulator *v16;
  _QWORD v17[5];
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allInstalledAppsKnownToSpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = __Block_byref_object_copy__27;
  v19[3] = __Block_byref_object_dispose__27;
  v20 = 0;
  appLaunchPublisher = self->_appLaunchPublisher;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__ATXContinuousUsageAccumulator_successfullyAccumulatedContinuousUseEvents__block_invoke;
  v17[3] = &unk_1E82DB658;
  v17[4] = &v18;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__ATXContinuousUsageAccumulator_successfullyAccumulatedContinuousUseEvents__block_invoke_2;
  v14[3] = &unk_1E82DCD98;
  v8 = v6;
  v15 = v8;
  v16 = self;
  v9 = (id)-[BPSPublisher sinkWithCompletion:receiveInput:](appLaunchPublisher, "sinkWithCompletion:receiveInput:", v17, v14);
  v10 = *(_QWORD *)(v19[0] + 40);
  if (v10)
  {
    __atxlog_handle_usage_insights();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[ATXContinuousUsageAccumulator successfullyAccumulatedContinuousUseEvents].cold.1((uint64_t)v19, p_super);
  }
  else
  {
    v12 = self->_continuousUsageAccumulator;
    p_super = &self->_continuousUseSessions->super;
    self->_continuousUseSessions = &v12->super;
  }

  _Block_object_dispose(&v18, 8);
  return v10 == 0;
}

void __75__ATXContinuousUsageAccumulator_successfullyAccumulatedContinuousUseEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __75__ATXContinuousUsageAccumulator_successfullyAccumulatedContinuousUseEvents__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    if (objc_msgSend(v6, "starting"))
    {
      objc_msgSend(*(id *)(a1 + 40), "recordAppLaunchStartEvent:", v6);
    }
    else if ((objc_msgSend(v6, "starting") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "recordAppLaunchEndEvent:", v6);
    }
  }

}

- (void)recordAppLaunchStartEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_appInFocusStartingEvents, "addObject:", a3);
}

- (void)recordAppLaunchEndEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  ATXContinuousUsageAccumulator *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_appInFocusStartingEvents, "copy");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    v28 = *(_QWORD *)v32;
    v29 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v4, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          objc_msgSend(v11, "absoluteTimestamp");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "absoluteTimestamp");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "compare:", v16);

          if (v17 == -1)
          {
            v18 = objc_alloc(MEMORY[0x1E0CB3588]);
            objc_msgSend(v11, "absoluteTimestamp");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "absoluteTimestamp");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v18, "initWithStartDate:endDate:", v19, v20);

            objc_msgSend(v21, "duration");
            if (v22 >= 60.0)
            {
              objc_msgSend(v4, "bundleID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "launchReason");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "absoluteTimestamp");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "absoluteTimestamp");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "duration");
              -[ATXContinuousUsageAccumulator eventWithBundleID:launchReason:startTime:endTime:duration:](self, "eventWithBundleID:launchReason:startTime:endTime:duration:", v30, v23, v24, v25);
              v26 = self;
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v9 = v28;
              v6 = v29;

              -[NSMutableArray addObject:](v26->_continuousUsageAccumulator, "addObject:", v27);
              self = v26;
            }
            -[NSMutableArray removeObject:](self->_appInFocusStartingEvents, "removeObject:", v11);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

}

- (id)eventWithBundleID:(id)a3 launchReason:(id)a4 startTime:(id)a5 endTime:(id)a6 duration:(double)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  v17 = objc_alloc(MEMORY[0x1E0CF9178]);
  objc_msgSend(MEMORY[0x1E0CF9178], "usageInsightsAppLaunchReasonFromBMAppInFocus:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v17, "initWithBundleID:category:launchReason:startTime:endTime:duration:", v14, v16, v18, v12, v11, a7);
  return v19;
}

- (NSArray)continuousUseSessions
{
  return self->_continuousUseSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuousUseSessions, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_continuousUsageAccumulator, 0);
  objc_storeStrong((id *)&self->_appInFocusStartingEvents, 0);
}

- (void)successfullyAccumulatedContinuousUseEvents
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 136315394;
  v4 = "-[ATXContinuousUsageAccumulator successfullyAccumulatedContinuousUseEvents]";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: Error reading merged publishers: %@", (uint8_t *)&v3, 0x16u);
}

@end
