@implementation ATXNowPlayingDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 5;
}

- (id)playbackEventsAfterSecondsOfInactivity:(double)a3 betweenStartDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  ATXNowPlayingDuetDataProvider *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D15AA0], "playing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateForObjectsWithMetadataKey:andIntegerValue:", v11, 1);
  v12 = objc_claimAutoreleasedReturnValue();

  v39 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithMinimumDuration:", a3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v13;
  v46[0] = v13;
  v46[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self;
  v34 = v9;
  v35 = v8;
  -[ATXDuetDataProvider fetchEventsBetweenStartDate:andEndDate:withPredicates:](self, "fetchEventsBetweenStartDate:andEndDate:withPredicates:", v8, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithMinimumDuration:", 30.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v41;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v20);
        v22 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v21, "endDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend(v21, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v24, "initWithTimeInterval:sinceDate:", v25, 60.0);
        v44[0] = v39;
        v44[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXDuetDataProvider fetchEventsBetweenStartDate:andEndDate:withPredicates:](v38, "fetchEventsBetweenStartDate:andEndDate:withPredicates:", v23, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28 && objc_msgSend(v28, "count"))
        {
          objc_msgSend(v28, "firstObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v29);

        }
        objc_autoreleasePoolPop(v22);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v18);
  }

  v30 = (void *)objc_msgSend(v36, "copy");
  return v30;
}

- (id)convertNowPlayingEventsToAppLaunchEvents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ATXAppLaunchDuetEvent *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXAppLaunchDuetEvent *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1CAA48B6C]();
        v11 = [ATXAppLaunchDuetEvent alloc];
        objc_msgSend(v9, "bundleId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[ATXAppLaunchDuetEvent initWithBundleId:startDate:endDate:](v11, "initWithBundleId:startDate:endDate:", v12, v13, v14);

        objc_msgSend(v4, "addObject:", v15);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

- (id)mostRecentPlayingNowPlayingEventWithMaxAgeInSeconds:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -a3);
  v5 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D15AA0], "playing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForObjectsWithMetadataKey:andIntegerValue:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetDataProvider fetchEventsBetweenStartDate:andEndDate:withPredicates:](self, "fetchEventsBetweenStartDate:andEndDate:withPredicates:", v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
