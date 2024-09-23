@implementation CPAnalyticsSignpostDestination

- (CPAnalyticsSignpostDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5;
  CPAnalyticsSignpostDestination *v6;
  CPAnalyticsSignpostDestination *v7;
  NSMutableIndexSet *v8;
  NSMutableIndexSet *startedSignpostIDs;
  objc_super v11;

  v5 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPAnalyticsSignpostDestination;
  v6 = -[CPAnalyticsSignpostDestination init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CPAnalyticsSignpostDestination setCpAnalyticsInstance:](v6, "setCpAnalyticsInstance:", v5);
    v8 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    startedSignpostIDs = v7->_startedSignpostIDs;
    v7->_startedSignpostIDs = v8;

  }
  return v7;
}

- (void)processEvent:(id)a3
{
  id v4;

  v4 = a3;
  -[CPAnalyticsSignpostDestination _trackSignpostsStartForEvent:](self, "_trackSignpostsStartForEvent:", v4);
  -[CPAnalyticsSignpostDestination _checkSignpostsEndForEvent:](self, "_checkSignpostsEndForEvent:", v4);

}

- (void)_trackSignpostsStartForEvent:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.photos.CPAnalytics.signpost.start"));

  v6 = v10;
  if (v5)
  {
    objc_msgSend(v10, "propertyForKey:", CFSTR("signpostID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "CPAnalyticsSignpostIDValue");
      -[CPAnalyticsSignpostDestination startedSignpostIDs](self, "startedSignpostIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addIndex:", v8);

    }
    v6 = v10;
  }

}

- (void)_checkSignpostsEndForEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.photos.CPAnalytics.signpost.end"));

  if (v6)
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("signpostID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", CFSTR("signpostEventName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v7, "CPAnalyticsSignpostIDValue");
        -[CPAnalyticsSignpostDestination startedSignpostIDs](self, "startedSignpostIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "containsIndex:", v9))
        {
          objc_msgSend(v10, "removeIndex:", v9);
          +[CPAnalytics creationDateForSignpost:](CPAnalytics, "creationDateForSignpost:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v4, "timestamp");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "timeIntervalSinceDate:", v11);
            v14 = v13;

            objc_msgSend(v4, "propertyForKey:", CFSTR("cpa_interval_startDate"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "propertyForKey:", CFSTR("cpa_interval_endDate"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v16, "timeIntervalSinceDate:", v15);
                v14 = v17;
              }
            }
            if (v14 < 0.0)
            {
              objc_msgSend(v4, "timestamp");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "timeIntervalSinceReferenceDate");
              v20 = v19;

              if (v20 >= 0.0)
                v14 = -v14;
              else
                v14 = -(v14 - v20 * 2.0);
            }
            if (v14 < 0.0)
            {
              CPAnalyticsLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = 138412546;
                v25 = v23;
                v26 = 2112;
                v27 = v11;
                _os_log_error_impl(&dword_20AB22000, v21, OS_LOG_TYPE_ERROR, "signpost duration should not be negative. Duration: %@, start date: %@", (uint8_t *)&v24, 0x16u);

              }
              v14 = 0.0;
            }
            v22 = (void *)objc_msgSend(v4, "copyRawPayload");
            -[CPAnalyticsSignpostDestination _sendCPAnalyticsEvent:withPayload:withDuration:](self, "_sendCPAnalyticsEvent:withPayload:withDuration:", v8, v22, v14);

          }
        }

      }
    }

  }
}

- (void)_sendCPAnalyticsEvent:(id)a3 withPayload:(id)a4 withDuration:(double)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithDictionary:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", CFSTR("signpostID"));
  objc_msgSend(v12, "removeObjectForKey:", CFSTR("signpostEventName"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("signpostDuration"));

  -[CPAnalyticsSignpostDestination cpAnalyticsInstance](self, "cpAnalyticsInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:withPayload:", v9, v12);

}

- (CPAnalytics)cpAnalyticsInstance
{
  return (CPAnalytics *)objc_loadWeakRetained((id *)&self->_cpAnalyticsInstance);
}

- (void)setCpAnalyticsInstance:(id)a3
{
  objc_storeWeak((id *)&self->_cpAnalyticsInstance, a3);
}

- (NSMutableIndexSet)startedSignpostIDs
{
  return self->_startedSignpostIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startedSignpostIDs, 0);
  objc_destroyWeak((id *)&self->_cpAnalyticsInstance);
}

@end
