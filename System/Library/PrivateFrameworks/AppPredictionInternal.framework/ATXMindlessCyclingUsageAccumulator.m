@implementation ATXMindlessCyclingUsageAccumulator

- (ATXMindlessCyclingUsageAccumulator)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXMindlessCyclingUsageAccumulator *v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "App");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "InFocus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atx_publisherFromStartDate:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ATXMindlessCyclingUsageAccumulator initWithAppLaunchPublisher:](self, "initWithAppLaunchPublisher:", v7);
  return v8;
}

- (ATXMindlessCyclingUsageAccumulator)initWithAppLaunchPublisher:(id)a3
{
  id v5;
  ATXMindlessCyclingUsageAccumulator *v6;
  uint64_t v7;
  NSMutableArray *appInFocusStartingEvents;
  uint64_t v9;
  NSMutableArray *mindlessCyclingEventsAccumulator;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXMindlessCyclingUsageAccumulator;
  v6 = -[ATXMindlessCyclingUsageAccumulator init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    appInFocusStartingEvents = v6->_appInFocusStartingEvents;
    v6->_appInFocusStartingEvents = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    mindlessCyclingEventsAccumulator = v6->_mindlessCyclingEventsAccumulator;
    v6->_mindlessCyclingEventsAccumulator = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v6->_appLaunchPublisher, a3);
  }

  return v6;
}

- (BOOL)accumulateMindlessCyclingEvents
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
  ATXMindlessCyclingUsageAccumulator *v16;
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
  v19[2] = __Block_byref_object_copy__11;
  v19[3] = __Block_byref_object_dispose__11;
  v20 = 0;
  appLaunchPublisher = self->_appLaunchPublisher;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__ATXMindlessCyclingUsageAccumulator_accumulateMindlessCyclingEvents__block_invoke;
  v17[3] = &unk_1E82DB658;
  v17[4] = &v18;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__ATXMindlessCyclingUsageAccumulator_accumulateMindlessCyclingEvents__block_invoke_2;
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
      -[ATXMindlessCyclingUsageAccumulator accumulateMindlessCyclingEvents].cold.1((uint64_t)v19, p_super);
  }
  else
  {
    v12 = self->_mindlessCyclingEventsAccumulator;
    p_super = &self->_mindlessCyclingEvents->super;
    self->_mindlessCyclingEvents = &v12->super;
  }

  _Block_object_dispose(&v18, 8);
  return v10 == 0;
}

void __69__ATXMindlessCyclingUsageAccumulator_accumulateMindlessCyclingEvents__block_invoke(uint64_t a1, void *a2)
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

void __69__ATXMindlessCyclingUsageAccumulator_accumulateMindlessCyclingEvents__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  objc_msgSend(v3, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v6 = objc_msgSend(v8, "starting");
    v7 = *(void **)(a1 + 40);
    if (v6)
      objc_msgSend(v7, "recordAppLaunchStartEvent:", v8);
    else
      objc_msgSend(v7, "recordAppLaunchEndEvent:", v8);
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  ATXMindlessCyclingUsageAccumulator *v25;
  void *v26;
  void *v27;
  double v28;
  ATXUsageInsightsAppSessionEvent *stagedEventToAdd;
  ATXMindlessCyclingUsageAccumulator *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  id *location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_appInFocusStartingEvents, "copy");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    location = (id *)&self->_stagedEventToAdd;
    v31 = v4;
    v32 = *(_QWORD *)v37;
    v30 = self;
    do
    {
      v9 = 0;
      v33 = v7;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        objc_msgSend(v4, "bundleID", v30);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
        {
          if (*location)
          {
            v14 = *location;
          }
          else
          {
            -[NSMutableArray lastObject](self->_mindlessCyclingEventsAccumulator, "lastObject");
            v14 = (id)objc_claimAutoreleasedReturnValue();
          }
          v15 = v14;
          objc_msgSend(v14, "endTime");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "absoluteTimestamp");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "absoluteTimestamp");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "timeIntervalSinceReferenceDate");
          v20 = v19;
          objc_msgSend(v18, "timeIntervalSinceReferenceDate");
          if (v20 <= v21)
          {
            v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v17, v18);
            objc_msgSend(v22, "duration");
            if (v23 <= 30.0)
            {
              objc_msgSend(v4, "bundleID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "launchReason");
              v25 = self;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "duration");
              -[ATXMindlessCyclingUsageAccumulator eventWithBundleID:launchReason:startTime:endTime:duration:](v25, "eventWithBundleID:launchReason:startTime:endTime:duration:", v24, v26, v17, v18);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16 && (objc_msgSend(v17, "timeIntervalSinceDate:", v16), v28 <= 10.0))
              {
                self = v30;
                if (*location)
                {
                  -[NSMutableArray addObject:](v30->_mindlessCyclingEventsAccumulator, "addObject:");
                  stagedEventToAdd = v30->_stagedEventToAdd;
                  v30->_stagedEventToAdd = 0;

                }
                -[NSMutableArray addObject:](v30->_mindlessCyclingEventsAccumulator, "addObject:", v27);
                v4 = v31;
              }
              else
              {
                objc_storeStrong(location, v27);
                self = v30;
                v4 = v31;
              }

            }
            -[NSMutableArray removeObject:](self->_appInFocusStartingEvents, "removeObject:", v10);

          }
          v8 = v32;
          v7 = v33;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v7);
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

- (NSArray)mindlessCyclingEvents
{
  return self->_mindlessCyclingEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mindlessCyclingEvents, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_stagedEventToAdd, 0);
  objc_storeStrong((id *)&self->_mindlessCyclingEventsAccumulator, 0);
  objc_storeStrong((id *)&self->_appInFocusStartingEvents, 0);
}

- (void)accumulateMindlessCyclingEvents
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
  v4 = "-[ATXMindlessCyclingUsageAccumulator accumulateMindlessCyclingEvents]";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: Error with reading app launch stream: %@", (uint8_t *)&v3, 0x16u);
}

@end
