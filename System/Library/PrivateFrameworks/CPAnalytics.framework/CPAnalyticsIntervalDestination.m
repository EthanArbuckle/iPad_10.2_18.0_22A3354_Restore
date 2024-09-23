@implementation CPAnalyticsIntervalDestination

- (CPAnalyticsIntervalDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v6;
  CPAnalyticsIntervalDestination *v7;
  CPAnalyticsIntervalDestination *v8;
  uint64_t v9;
  NSSet *trackedIntervalNames;
  uint64_t v11;
  NSSet *ignoredIntervalNames;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPAnalyticsIntervalDestination;
  v7 = -[CPAnalyticsDashboardDestination initWithConfig:cpAnalyticsInstance:](&v14, sel_initWithConfig_cpAnalyticsInstance_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[CPAnalyticsIntervalDestination _intervalNamesForKey:inConfiguration:](v7, "_intervalNamesForKey:inConfiguration:", CFSTR("trackIntervals"), v6);
    v9 = objc_claimAutoreleasedReturnValue();
    trackedIntervalNames = v8->_trackedIntervalNames;
    v8->_trackedIntervalNames = (NSSet *)v9;

    -[CPAnalyticsIntervalDestination _intervalNamesForKey:inConfiguration:](v8, "_intervalNamesForKey:inConfiguration:", CFSTR("ignoreIntervals"), v6);
    v11 = objc_claimAutoreleasedReturnValue();
    ignoredIntervalNames = v8->_ignoredIntervalNames;
    v8->_ignoredIntervalNames = (NSSet *)v11;

  }
  return v8;
}

- (void)updateWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSSet *v12;
  NSSet *trackedIntervalNames;
  NSSet *v14;
  NSSet *ignoredIntervalNames;
  NSObject *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CPAnalyticsIntervalDestination _intervalNamesForKey:inConfiguration:](self, "_intervalNamesForKey:inConfiguration:", CFSTR("trackIntervals"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsIntervalDestination ignoredIntervalNames](self, "ignoredIntervalNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "intersectsSet:", v6);

  if (!v7)
  {
    -[CPAnalyticsIntervalDestination _intervalNamesForKey:inConfiguration:](self, "_intervalNamesForKey:inConfiguration:", CFSTR("ignoreIntervals"), v4);
    v8 = objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsIntervalDestination trackedIntervalNames](self, "trackedIntervalNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject intersectsSet:](v8, "intersectsSet:", v10);

    if (!v11)
    {
      -[NSSet setByAddingObjectsFromSet:](self->_trackedIntervalNames, "setByAddingObjectsFromSet:", v5);
      v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
      trackedIntervalNames = self->_trackedIntervalNames;
      self->_trackedIntervalNames = v12;

      -[NSSet setByAddingObjectsFromSet:](self->_ignoredIntervalNames, "setByAddingObjectsFromSet:", v8);
      v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
      ignoredIntervalNames = self->_ignoredIntervalNames;
      self->_ignoredIntervalNames = v14;

      goto LABEL_9;
    }
    CPAnalyticsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[NSObject allObjects](v8, "allObjects");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_error_impl(&dword_20AB22000, v9, OS_LOG_TYPE_ERROR, "Ignored intervals names: %@ intersect with tracked interval names.", (uint8_t *)&v17, 0xCu);

    }
    goto LABEL_7;
  }
  CPAnalyticsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "allObjects");
    v9 = objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v9;
    _os_log_error_impl(&dword_20AB22000, v8, OS_LOG_TYPE_ERROR, "Tracked intervals names: %@ intersect with ignored interval names.", (uint8_t *)&v17, 0xCu);
LABEL_7:

  }
LABEL_9:

}

- (void)processEvent:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.interval"));

  v6 = v12;
  if (v5)
  {
    objc_msgSend(v12, "propertyForKey:", CFSTR("cpa_interval_name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CPAnalyticsIntervalDestination trackedIntervalNames](self, "trackedIntervalNames");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v7);

      if (v9)
      {
        -[CPAnalyticsIntervalDestination sendDashboardIntervalEventForEvent:](self, "sendDashboardIntervalEventForEvent:", v12);
      }
      else
      {
        -[CPAnalyticsIntervalDestination ignoredIntervalNames](self, "ignoredIntervalNames");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v7);

        if ((v11 & 1) == 0)
          -[CPAnalyticsIntervalDestination _handleEvent:withUnknownIntervalName:](self, "_handleEvent:withUnknownIntervalName:", v12, v7);
      }
    }
    else
    {
      -[CPAnalyticsDashboardDestination reportMalformedEvent:malformationDescriptionWithFormat:](self, "reportMalformedEvent:malformationDescriptionWithFormat:", v12, CFSTR("unexpected class for payload property %@"), CFSTR("cpa_interval_name"));
    }

    v6 = v12;
  }

}

- (void)sendDashboardIntervalEventForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  id v14;

  v4 = a3;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __69__CPAnalyticsIntervalDestination_sendDashboardIntervalEventForEvent___block_invoke;
  v13 = &unk_24C36E590;
  v8 = v4;
  v14 = v8;
  __69__CPAnalyticsIntervalDestination_sendDashboardIntervalEventForEvent___block_invoke((uint64_t)&v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPAnalyticsDashboardDestination isMediaEvent:](self, "isMediaEvent:", v8))
  {
    -[CPAnalyticsDashboardDestination allMediaProperties](self, "allMediaProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsDashboardDestination buildCoreAnalyticsEventPayloadWithProperties:fromSourceEvent:intoTargetEventPayload:](self, "buildCoreAnalyticsEventPayloadWithProperties:fromSourceEvent:intoTargetEventPayload:", v6, v8, v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  -[CPAnalyticsDashboardDestination sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:](self, "sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:fromSourceEvent:payload:", CFSTR("com.apple.photos.cpa.interval"), v8, v5, v8, v10, v11, v12, v13);

}

- (id)_intervalNamesForKey:(id)a3 inConfiguration:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v4);

  return v5;
}

- (void)_handleEvent:(id)a3 withUnknownIntervalName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  CPAnalyticsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_debug_impl(&dword_20AB22000, v8, OS_LOG_TYPE_DEBUG, "Unknown interval: %@. Add this interval to 'interval' destination in CP Analytics config.", (uint8_t *)&v11, 0xCu);
  }

  -[CPAnalyticsDashboardDestination cpAnalyticsInstance](self, "cpAnalyticsInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "copyRawPayload");

  objc_msgSend(v9, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.unknownInterval"), v10);
}

- (NSSet)trackedIntervalNames
{
  return self->_trackedIntervalNames;
}

- (void)setTrackedIntervalNames:(id)a3
{
  objc_storeStrong((id *)&self->_trackedIntervalNames, a3);
}

- (NSSet)ignoredIntervalNames
{
  return self->_ignoredIntervalNames;
}

- (void)setIgnoredIntervalNames:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredIntervalNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredIntervalNames, 0);
  objc_storeStrong((id *)&self->_trackedIntervalNames, 0);
}

id __69__CPAnalyticsIntervalDestination_sendDashboardIntervalEventForEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", CFSTR("cpa_interval_name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("cpa_interval_name"));

  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", CFSTR("signpostDuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("signpostDuration"));

  return v2;
}

@end
