@implementation ATXInterruptedAppSessionAccumulator

- (ATXInterruptedAppSessionAccumulator)init
{
  ATXInterruptedAppSessionAccumulator *v2;
  ATXInterruptedAppSessionAccumulator *v3;
  ATXModeDimensionSet *previousDimensions;
  uint64_t v5;
  NSMutableArray *appSessions;
  uint64_t v7;
  NSMutableDictionary *summaryMetrics;
  uint64_t v9;
  NSMutableDictionary *recentNotifications;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ATXInterruptedAppSessionAccumulator;
  v2 = -[ATXInterruptedAppSessionAccumulator init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    previousDimensions = v2->_previousDimensions;
    v2->_previousDimensions = 0;

    v5 = objc_opt_new();
    appSessions = v3->_appSessions;
    v3->_appSessions = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    summaryMetrics = v3->_summaryMetrics;
    v3->_summaryMetrics = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    recentNotifications = v3->_recentNotifications;
    v3->_recentNotifications = (NSMutableDictionary *)v9;

  }
  return v3;
}

- (void)handleNotificationEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *recentNotifications;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    if (objc_msgSend(v10, "eventType"))
    {
      v7 = objc_msgSend(v10, "eventType");

      if (v7 != 16)
        goto LABEL_8;
    }
    else
    {

    }
    recentNotifications = self->_recentNotifications;
    objc_msgSend(v10, "notification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](recentNotifications, "setObject:forKeyedSubscript:", v10, v9);

  }
LABEL_8:

}

- (void)handleNextAppLaunch:(id)a3 dimensionSet:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _BOOL4 v14;
  ATXAppSessionEventMetric *v15;
  ATXModeDimensionSet *previousDimensions;
  void *v17;
  void *v18;
  ATXAppSessionEventMetric *v19;
  ATXModeDimensionSet *v20;
  id v21;
  id v22;

  v22 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_previousLaunch && self->_previousDimensions)
  {
    v21 = v7;
    -[ATXInterruptedAppSessionAccumulator _getSummaryMetricForDimensions:](self, "_getSummaryMetricForDimensions:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTotalAppSessions:", objc_msgSend(v9, "totalAppSessions") + 1);
    if (-[ATXInterruptedAppSessionAccumulator _doesLaunchInterruptPreviousLaunch:](self, "_doesLaunchInterruptPreviousLaunch:", v22))
    {
      objc_msgSend(v9, "setInterruptedAppSessions:", objc_msgSend(v9, "interruptedAppSessions") + 1);
    }
    -[_ATXAppLaunch endDate](self->_previousLaunch, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXAppLaunch startDate](self->_previousLaunch, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12;

    v14 = -[ATXInterruptedAppSessionAccumulator _doesLaunchInterruptPreviousLaunch:](self, "_doesLaunchInterruptPreviousLaunch:", v22);
    v15 = [ATXAppSessionEventMetric alloc];
    previousDimensions = self->_previousDimensions;
    -[_ATXAppLaunch bundleId](self->_previousLaunch, "bundleId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v22, "bundleId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[ATXAppSessionEventMetric initWithDimensions:bundleId:interruptingAppBundleId:duration:](v15, "initWithDimensions:bundleId:interruptingAppBundleId:duration:", previousDimensions, v17, v18, v13);

    }
    else
    {
      v19 = -[ATXAppSessionEventMetric initWithDimensions:bundleId:interruptingAppBundleId:duration:](v15, "initWithDimensions:bundleId:interruptingAppBundleId:duration:", previousDimensions, v17, 0, v13);
    }
    v8 = v21;

    -[NSMutableArray addObject:](self->_appSessions, "addObject:", v19);
    objc_storeStrong((id *)&self->_previousLaunch, a3);
    objc_storeStrong((id *)&self->_previousDimensions, a4);
    -[NSMutableDictionary removeAllObjects](self->_recentNotifications, "removeAllObjects");

  }
  else
  {
    objc_storeStrong((id *)&self->_previousLaunch, a3);
    v20 = v8;
    v9 = self->_previousDimensions;
    self->_previousDimensions = v20;
  }

}

- (void)handleEndOfStream
{
  ATXAppSessionEventMetric *v3;
  ATXModeDimensionSet *previousDimensions;
  void *v5;
  void *v6;
  void *v7;
  ATXAppSessionEventMetric *v8;
  id v9;

  if (self->_previousLaunch)
  {
    -[ATXInterruptedAppSessionAccumulator _getSummaryMetricForDimensions:](self, "_getSummaryMetricForDimensions:", self->_previousDimensions);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTotalAppSessions:", objc_msgSend(v9, "totalAppSessions") + 1);
    v3 = [ATXAppSessionEventMetric alloc];
    previousDimensions = self->_previousDimensions;
    -[_ATXAppLaunch bundleId](self->_previousLaunch, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXAppLaunch endDate](self->_previousLaunch, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXAppLaunch startDate](self->_previousLaunch, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v8 = -[ATXAppSessionEventMetric initWithDimensions:bundleId:interruptingAppBundleId:duration:](v3, "initWithDimensions:bundleId:interruptingAppBundleId:duration:", previousDimensions, v5, 0);

    -[NSMutableArray addObject:](self->_appSessions, "addObject:", v8);
  }
}

- (void)logToCoreAnalytics
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_appSessions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "logToCoreAnalytics");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_summaryMetrics;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryMetrics, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logToCoreAnalytics");

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

}

- (BOOL)_doesLaunchInterruptPreviousLaunch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  double v11;
  NSMutableDictionary *recentNotifications;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  -[_ATXAppLaunch bundleId](self->_previousLaunch, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXAppLaunch endDate](self->_previousLaunch, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v8 = v11 <= 5.0;

  }
  recentNotifications = self->_recentNotifications;
  objc_msgSend(v4, "bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](recentNotifications, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (v8 && v14)
  {
    objc_msgSend(v4, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v14, "timestamp");
    objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v18);
    v20 = v19;

    if (v20 <= 30.0)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB3588]);
      -[_ATXAppLaunch startDate](self->_previousLaunch, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ATXAppLaunch endDate](self->_previousLaunch, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithStartDate:endDate:", v22, v23);
      v25 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v14, "timestamp");
      objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v24, "containsDate:", v26);

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (id)_getSummaryMetricForDimensions:(id)a3
{
  id v4;
  void *v5;
  ATXInterruptedAppSessionSummaryMetrics *v6;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryMetrics, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[ATXInterruptedAppSessionSummaryMetrics initWithDimensions:]([ATXInterruptedAppSessionSummaryMetrics alloc], "initWithDimensions:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_summaryMetrics, "setObject:forKeyedSubscript:", v6, v4);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryMetrics, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)numberOfInterruptingAppSessions
{
  void *v2;
  unint64_t v3;

  -[NSMutableArray _pas_filteredArrayWithTest:](self->_appSessions, "_pas_filteredArrayWithTest:", &__block_literal_global_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

BOOL __70__ATXInterruptedAppSessionAccumulator_numberOfInterruptingAppSessions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "interruptingAppBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)countedSetContainingInterruptingAppBundleIds
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_appSessions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "interruptingAppBundleId", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "interruptingAppBundleId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentNotifications, 0);
  objc_storeStrong((id *)&self->_summaryMetrics, 0);
  objc_storeStrong((id *)&self->_appSessions, 0);
  objc_storeStrong((id *)&self->_previousDimensions, 0);
  objc_storeStrong((id *)&self->_previousLaunch, 0);
}

@end
