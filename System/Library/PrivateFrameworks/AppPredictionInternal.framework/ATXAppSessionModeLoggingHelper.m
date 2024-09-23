@implementation ATXAppSessionModeLoggingHelper

- (id)appLaunchesSinceDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getAppLaunchesFromUsageBetweenStartDate:endDate:limit:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAppSessionModeLoggingHelper coalesceAppLaunches:](self, "coalesceAppLaunches:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  objc_msgSend(v11, "bpsPublisher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)coalesceAppLaunches:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _ATXAppLaunch *v11;
  uint64_t v12;
  ATXAppSessionModeLoggingHelper *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = (id)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  obj = v5;
  if (!v6)
    goto LABEL_15;
  v7 = v6;
  v5 = 0;
  v8 = *(_QWORD *)v26;
  do
  {
    v9 = 0;
    v23 = v7;
    do
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
      if (v5)
      {
        if (-[ATXAppSessionModeLoggingHelper shouldCoalesceLaunch:nextLaunch:](self, "shouldCoalesceLaunch:nextLaunch:", v5, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v9)))
        {
          v11 = [_ATXAppLaunch alloc];
          objc_msgSend(v5, "bundleId");
          v12 = v8;
          v13 = self;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "startDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "endDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "timeZone");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "reason");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[_ATXAppLaunch initWithBundleId:startDate:endDate:timeZone:reason:](v11, "initWithBundleId:startDate:endDate:timeZone:reason:", v14, v15, v16, v17, v18);

          self = v13;
          v8 = v12;
          v7 = v23;
          v5 = (id)v19;
        }
        else
        {
          objc_msgSend(v22, "addObject:", v5);
          v20 = v10;

          v5 = v20;
        }
      }
      else
      {
        v5 = v10;
      }
      ++v9;
    }
    while (v7 != v9);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v7);

  if (v5)
  {
    objc_msgSend(v22, "addObject:", v5);
LABEL_15:

  }
  return v22;
}

- (BOOL)shouldCoalesceLaunch:(id)a3 nextLaunch:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  objc_msgSend(v5, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  if (v12 < 10.0)
    v13 = v9;
  else
    v13 = 0;

  return v13;
}

- (id)stripStoreEvent:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "filterWithIsIncluded:", &__block_literal_global_237);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapWithTransform:", &__block_literal_global_12_8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __50__ATXAppSessionModeLoggingHelper_stripStoreEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __50__ATXAppSessionModeLoggingHelper_stripStoreEvent___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eventBody");
}

@end
