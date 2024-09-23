@implementation ATXAppLaunches

- (ATXAppLaunches)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXAppLaunches *v6;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "App");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "InFocus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXAppLaunches initWithStream:](self, "initWithStream:", v5);

  return v6;
}

- (ATXAppLaunches)initWithStream:(id)a3
{
  id v5;
  ATXAppLaunches *v6;
  ATXAppLaunches *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAppLaunches;
  v6 = -[ATXAppLaunches init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stream, a3);

  return v7;
}

- (id)rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApp:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = a3;
    objc_msgSend(v4, "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppLaunches rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:](self, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (double)uniqueDaysAppHasBeenLaunchedOverLast28Days:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  if (!a3)
    return 0.0;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppLaunches rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:](self, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (double)(unint64_t)objc_msgSend(v8, "uniqueDaysLaunched");
  return v9;
}

- (double)timesAppHasBeenLaunchedOverLast28Days:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  if (!a3)
    return 0.0;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppLaunches rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:](self, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (double)(unint64_t)objc_msgSend(v8, "rawLaunchCount");
  return v9;
}

- (id)rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps
{
  return -[ATXAppLaunches _rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter:](self, "_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter:", &__block_literal_global_87);
}

uint64_t __79__ATXAppLaunches_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps__block_invoke()
{
  return 1;
}

- (id)rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__ATXAppLaunches_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps___block_invoke;
    v7[3] = &unk_1E4D58330;
    v8 = v4;
    -[ATXAppLaunches _rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter:](self, "_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)objc_opt_new();
  }

  return v5;
}

uint64_t __77__ATXAppLaunches_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)_rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  ATXAggregatedAppLaunchData *v26;
  id v28;
  id v29;
  void *v30;
  void *context;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1A85A4F90]();
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -28, v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)v8;
  -[BMStream atx_publisherFromStartDate:](self->_stream, "atx_publisherFromStartDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __81__ATXAppLaunches__rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter___block_invoke;
  v44[3] = &unk_1E4D5CCA0;
  v29 = v4;
  v45 = v29;
  objc_msgSend(v9, "filterWithIsIncluded:", v44);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v10;
  v41[1] = 3221225472;
  v41[2] = __81__ATXAppLaunches__rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter___block_invoke_3;
  v41[3] = &unk_1E4D589B8;
  v28 = v6;
  v42 = v28;
  v12 = v5;
  v43 = v12;
  v13 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_10_3, v41);

  v32 = (id)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
        if (v21)
        {
          v22 = v21;
          v23 = 0;
          v24 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v34 != v24)
                objc_enumerationMutation(v20);
              v23 += objc_msgSend(v20, "countForObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
          }
          while (v22);
        }
        else
        {
          v23 = 0;
        }
        v26 = -[ATXAggregatedAppLaunchData initWithRawLaunchCount:uniqueDaysLaunched:]([ATXAggregatedAppLaunchData alloc], "initWithRawLaunchCount:uniqueDaysLaunched:", v23, objc_msgSend(v20, "count"));
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v26, v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(context);
  return v32;
}

uint64_t __81__ATXAppLaunches__rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "starting");

  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __81__ATXAppLaunches__rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysWithFilter___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(v13, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v13, "timestamp");
  v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  v8 = objc_msgSend(*(id *)(a1 + 32), "ordinalityOfUnit:inUnit:forDate:", 16, 4, v7);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  objc_autoreleasePoolPop(v3);
}

- (double)uniqueAppsLaunchedOverLast28Days
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  double v11;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, -28, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMStream atx_publisherFromStartDate:](self->_stream, "atx_publisherFromStartDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterWithIsIncluded:", &__block_literal_global_16_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__ATXAppLaunches_uniqueAppsLaunchedOverLast28Days__block_invoke_3;
  v13[3] = &unk_1E4D5CCC8;
  v14 = v3;
  v9 = v3;
  v10 = (id)objc_msgSend(v8, "sinkWithCompletion:receiveInput:", &__block_literal_global_17_3, v13);

  v11 = (double)(unint64_t)objc_msgSend(v9, "count");
  return v11;
}

uint64_t __50__ATXAppLaunches_uniqueAppsLaunchedOverLast28Days__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "starting");

  return v3;
}

void __50__ATXAppLaunches_uniqueAppsLaunchedOverLast28Days__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v8, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
