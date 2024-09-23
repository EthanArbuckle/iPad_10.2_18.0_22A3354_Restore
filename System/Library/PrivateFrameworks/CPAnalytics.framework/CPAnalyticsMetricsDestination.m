@implementation CPAnalyticsMetricsDestination

- (CPAnalyticsMetricsDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5;
  CPAnalyticsMetricsDestination *v6;
  CPAnalyticsMetricsDestination *v7;
  void *v8;
  uint64_t v9;
  NSMapTable *eventRoutes;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPAnalyticsMetricsDestination;
  v6 = -[CPAnalyticsMetricsDestination init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CPAnalyticsMetricsDestination _eventRoutesFromConfig:](v6, "_eventRoutesFromConfig:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    eventRoutes = v7->_eventRoutes;
    v7->_eventRoutes = (NSMapTable *)v9;

  }
  return v7;
}

- (void)processEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CPAnalyticsMetricsDestination eventRoutes](self, "eventRoutes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "keyEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "doesMatch:", v4))
        {
          objc_msgSend(v5, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPAnalyticsMetricsDestination sendCoreAnalyticsEventWithCustomConfig:eventRoute:](self, "sendCoreAnalyticsEventWithCustomConfig:eventRoute:", v4, v12);
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "copyRawPayload");
  +[CPAnalyticsCoreAnalyticsHelper sendCoreAnalyticsEvent:withPayload:shouldSanitize:](CPAnalyticsCoreAnalyticsHelper, "sendCoreAnalyticsEvent:withPayload:shouldSanitize:", v6, v12, 1);
LABEL_11:

}

- (void)updateWithConfig:(id)a3
{
  void *v4;
  void *v5;
  NSMapTable *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSMapTable *eventRoutes;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[CPAnalyticsMetricsDestination _eventRoutesFromConfig:](self, "_eventRoutesFromConfig:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[CPAnalyticsMetricsDestination eventRoutes](self, "eventRoutes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMapTable *)objc_msgSend(v5, "copy");

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "keyEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](v6, "setObject:forKey:", v13, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    eventRoutes = self->_eventRoutes;
    self->_eventRoutes = v6;

  }
}

- (void)sendCoreAnalyticsEventWithCustomConfig:(id)a3 eventRoute:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "destinationEventKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v6, "destinationEventKey");
  else
    objc_msgSend(v10, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPAnalyticsMetricsDestination _buildCustomCoreAnalyticsPayloadForEvent:withEventRoute:](self, "_buildCustomCoreAnalyticsPayloadForEvent:withEventRoute:", v10, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAnalyticsCoreAnalyticsHelper sendCoreAnalyticsEvent:withPayload:shouldSanitize:](CPAnalyticsCoreAnalyticsHelper, "sendCoreAnalyticsEvent:withPayload:shouldSanitize:", v8, v9, objc_msgSend(v6, "includeEventProperties"));

}

- (id)_buildCustomCoreAnalyticsPayloadForEvent:(id)a3 withEventRoute:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v6, "propertiesToInclude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "propertyForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v7, "setObject:forKey:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  if (objc_msgSend(v6, "includeEventProperties"))
  {
    v15 = (void *)objc_msgSend(v5, "copyRawPayload");
    objc_msgSend(v7, "addEntriesFromDictionary:", v15);

  }
  return v7;
}

- (id)_eventRoutesFromConfig:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  CPAnalyticsMetricEventRoute *v12;
  CPAnalyticsMetricEventRoute *v13;
  BOOL v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("events"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v16 = v3;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", CFSTR("sourceEventMatchCriteria"), v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPAnalyticsEventMatcher eventMatcherWithConfiguration:](CPAnalyticsEventMatcher, "eventMatcherWithConfiguration:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[CPAnalyticsMetricEventRoute initWithConfig:]([CPAnalyticsMetricEventRoute alloc], "initWithConfig:", v9);
          v13 = v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (!v14)
            objc_msgSend(v17, "setObject:forKey:", v12, v11);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    v3 = v16;
  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x24BDD1650]);
  }

  return v17;
}

- (NSMapTable)eventRoutes
{
  return self->_eventRoutes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRoutes, 0);
}

@end
