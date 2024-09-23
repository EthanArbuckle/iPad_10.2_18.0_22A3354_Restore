@implementation ATXAppLaunchProvider

- (ATXAppLaunchProvider)initWithLastNDays:(unint64_t)a3
{
  ATXAppLaunchProvider *v4;
  uint64_t v5;
  NSDate *thresholdDateLastNDays;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXAppLaunchProvider;
  v4 = -[ATXAppLaunchProvider init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(-86400 * a3));
    v5 = objc_claimAutoreleasedReturnValue();
    thresholdDateLastNDays = v4->_thresholdDateLastNDays;
    v4->_thresholdDateLastNDays = (NSDate *)v5;

  }
  return v4;
}

- (void)cacheAppLaunchStreamIfNecessary
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXAppLaunchProvider: could not fetch app launch stream with error: %@", (uint8_t *)&v3, 0xCu);
}

void __55__ATXAppLaunchProvider_cacheAppLaunchStreamIfNecessary__block_invoke(uint64_t a1, void *a2)
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

void __55__ATXAppLaunchProvider_cacheAppLaunchStreamIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  char v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v40 = a2;
  objc_msgSend(v40, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "starting"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

    if ((_DWORD)v4)
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      objc_msgSend(v40, "timestamp");
      if (v6 > *(double *)(a1 + 96))
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      allModesForTraining();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        obj = v7;
        v39 = *(_QWORD *)v42;
        v11 = 0.0;
        v12 = 1;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v42 != v39)
              objc_enumerationMutation(obj);
            v14 = objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "unsignedIntegerValue");
            ATXModeToString();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = *(void **)(a1 + 40);
            v17 = v3;
            objc_msgSend(v3, "bundleID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "scoreForMode:bundleId:scalingFactor:", v14, v18, 1.0);
            v20 = v19;

            if ((v12 & (v20 >= 0.0)) == 1)
            {
              v21 = v15;

              v12 = 0;
              v11 = v20;
              v10 = v21;
            }
            v22 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "doubleValue");
            objc_msgSend(v22, "numberWithDouble:", v20 + v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v25, v15);

            objc_msgSend(v40, "timestamp");
            v3 = v17;
            if (v26 > *(double *)(a1 + 96))
            {
              v27 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v15);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "doubleValue");
              objc_msgSend(v27, "numberWithDouble:", v20 + v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v30, v15);

            }
            if (v20 > v11)
            {
              v31 = v15;

              v11 = v20;
              v10 = v31;
            }

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v9);

        if (!v10)
          goto LABEL_23;
        v32 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v10);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "numberWithInt:", objc_msgSend(v33, "intValue") + 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v34, v10);

        objc_msgSend(v40, "timestamp");
        if (v35 <= *(double *)(a1 + 96))
          goto LABEL_23;
        v36 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "numberWithInt:", objc_msgSend(v7, "intValue") + 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v37, v10);

      }
      else
      {
        v10 = 0;
      }

LABEL_23:
    }
  }

}

- (unint64_t)globalAppLaunchCountWithinLastNDays
{
  -[ATXAppLaunchProvider cacheAppLaunchStreamIfNecessary](self, "cacheAppLaunchStreamIfNecessary");
  return self->_globalAppLaunchCountInLastNDays;
}

- (unint64_t)globalAppLaunchCountWithinLast1Day
{
  -[ATXAppLaunchProvider cacheAppLaunchStreamIfNecessary](self, "cacheAppLaunchStreamIfNecessary");
  return self->_globalAppLaunchCountInLast1Day;
}

- (unint64_t)modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDaysForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXAppLaunchProvider cacheAppLaunchStreamIfNecessary](self, "cacheAppLaunchStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_modeAppLaunchCountBasedOnGlobalPriorsInLastNDays, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (unint64_t)modeAppLaunchCountBasedOnGlobalPriorsWithinLast1DayForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXAppLaunchProvider cacheAppLaunchStreamIfNecessary](self, "cacheAppLaunchStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_modeAppLaunchCountBasedOnGlobalPriorsInLast1Day, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (double)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDaysForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[ATXAppLaunchProvider cacheAppLaunchStreamIfNecessary](self, "cacheAppLaunchStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsInLastNDays, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (double)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1DayForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[ATXAppLaunchProvider cacheAppLaunchStreamIfNecessary](self, "cacheAppLaunchStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsInLast1Day, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsInLast1Day, 0);
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsInLastNDays, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsInLast1Day, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsInLastNDays, 0);
  objc_storeStrong((id *)&self->_thresholdDateLastNDays, 0);
}

@end
