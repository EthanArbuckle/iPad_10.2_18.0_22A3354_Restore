@implementation SUUIMetricsPageRenderEvent

- (SUUIMetricsPageRenderEvent)init
{
  SUUIMetricsPageRenderEvent *v2;
  SUUIMetricsPageRenderEvent *v3;
  NSMutableArray *v4;
  NSMutableArray *domChanges;
  NSMutableArray *v6;
  NSMutableArray *requests;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIMetricsPageRenderEvent;
  v2 = -[SSMetricsBaseEvent init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SSMetricsMutableEvent setEventType:](v2, "setEventType:", CFSTR("pageRender"));
    -[SSMetricsMutableEvent setTopic:](v3, "setTopic:", CFSTR("xp_amp_clientperf"));
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    domChanges = v3->_domChanges;
    v3->_domChanges = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    requests = v3->_requests;
    v3->_requests = v6;

  }
  return v3;
}

+ (BOOL)shouldCollectPageRenderData
{
  BOOL v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  if (+[SUUIMetricsUtilities shouldLogTimingMetrics](SUUIMetricsUtilities, "shouldLogTimingMetrics")
    || +[SUUIMetricsUtilities trackAllEvents](SUUIMetricsUtilities, "trackAllEvents"))
  {
    return 1;
  }
  objc_msgSend(MEMORY[0x24BEB1F20], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionDurationPageRender");
  v7 = v6;
  objc_msgSend(a1, "_sampleWindowStartTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "compare:", v9) == -1)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "_randomDouble");
    if (v10 == 0.0)
    {
      v3 = 0;
    }
    else
    {
      v11 = v10;
      objc_msgSend(v4, "samplingPercentageUsersPageRender");
      v3 = v11 <= v12;
      if (v11 <= v12)
        objc_msgSend(a1, "_setSampleWindowStartTime:", v5);
      objc_msgSend(v4, "update");
    }
  }

  return v3;
}

+ (BOOL)shouldCollectPageRenderDataForDocument:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(a1, "shouldCollectPageRenderData"))
  {
    objc_msgSend(v4, "templateElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "elementType") != 148;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (double)_randomDouble
{
  if (_randomDouble_onceToken != -1)
    dispatch_once(&_randomDouble_onceToken, &__block_literal_global_45);
  return drand48();
}

void __43__SUUIMetricsPageRenderEvent__randomDouble__block_invoke()
{
  uint32_t v0;

  v0 = arc4random();
  srand48(v0);
}

+ (void)_setSampleWindowStartTime:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("SUUIMetricsPageRenderEventSampleWindowStartTime"), a3, (CFStringRef)*MEMORY[0x24BEB2C88]);
}

+ (id)_sampleWindowStartTime
{
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("SUUIMetricsPageRenderEventSampleWindowStartTime"), (CFStringRef)*MEMORY[0x24BEB2C88]);
}

- (void)setClientCorrelationKey:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("clientCorrelationKey"));

}

- (NSString)clientCorrelationKey
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientCorrelationKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void)setLaunchCorrelationKey:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("launchCorrelationKey"));

}

- (NSString)launchCorrelationKey
{
  void *v2;
  void *v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("launchCorrelationKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void)setPageRequestedTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("pageRequestedTime"));

}

- (double)pageRequestedTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageRequestedTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setPageAppearTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("pageAppearTime"));

}

- (double)pageAppearTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageAppearTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setPageDisappearTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("pageDisappearTime"));

}

- (double)pageDisappearTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageDisappearTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setPlatformRequestStartTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("platformRequestStartTime"));

}

- (double)platformRequestStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("platformRequestStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setPlatformResponseStartTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("platformResponseStartTime"));

}

- (double)platformResponseStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("platformResponseStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setPlatformResponseEndTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("platformResponseEndTime"));

}

- (double)platformResponseEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("platformResponseEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setPlatformResponseWasCached:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("platformResponseWasCached"));

}

- (BOOL)platformResponseWasCached
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("platformResponseWasCached"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setPlatformJsonParseStartTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("platformJsonParseStartTime"));

}

- (double)platformJsonParseStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("platformJsonParseStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setPlatformJsonParseEndTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("platformJsonParseEndTime"));

}

- (double)platformJsonParseEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("platformJsonParseEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)addDOMChange:(id)a3
{
  NSMutableArray *domChanges;
  id v4;

  domChanges = self->_domChanges;
  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](domChanges, "addObject:", v4);

}

- (void)addRequest:(id)a3
{
  NSMutableArray *requests;
  id v4;

  requests = self->_requests;
  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](requests, "addObject:", v4);

}

- (void)setResourceRequestStartTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("resourceRequestStartTime"));

}

- (double)resourceRequestStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("resourceRequestStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setResourceRequestOnScreenEndTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("resourceRequestOnScreenEndTime"));

}

- (double)resourceRequestOnScreenEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("resourceRequestOnScreenEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setResourceRequestEndTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("resourceRequestEndTime"));

}

- (double)resourceRequestEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("resourceRequestEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setPageUserReadyTime:(double)a3
{
  id v4;

  -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("pageUserReadyTime"));

}

- (double)pageUserReadyTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageUserReadyTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (void)setXPSessionDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSessionDuration"));

}

- (double)xpSessionDuration
{
  void *v2;
  double v3;
  double v4;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSessionDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setXPSamplingForced:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSamplingForced"));

}

- (BOOL)xpSamplingForced
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSamplingForced"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setXPSamplingPercentageUsers:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSamplingPercentageUsers"));

}

- (double)xpSamplingPercentageUsers
{
  void *v2;
  double v3;
  double v4;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSamplingPercentageUsers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)appendSamplingPropertiesFromClientContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;
  _WORD v16[8];

  objc_msgSend(a3, "existingBagValueForKey:", *MEMORY[0x24BEB2990]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v13 = v11;
    else
      v13 = v11 & 2;
    if (v13)
    {
      v16[0] = 0;
      LODWORD(v15) = 2;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, v16, v15);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog();
    }

    goto LABEL_15;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  -[SUUIMetricsPageRenderEvent setXPSessionDuration:](self, "setXPSessionDuration:");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("samplingPercentageUsers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  -[SUUIMetricsPageRenderEvent setXPSamplingPercentageUsers:](self, "setXPSamplingPercentageUsers:");

  if (+[SUUIMetricsUtilities shouldLogTimingMetrics](SUUIMetricsUtilities, "shouldLogTimingMetrics"))
  {
    -[SUUIMetricsPageRenderEvent setXPSamplingForced:](self, "setXPSamplingForced:", 1);
    -[SUUIMetricsPageRenderEvent setXPSamplingPercentageUsers:](self, "setXPSamplingPercentageUsers:", 1.0);
  }

LABEL_16:
}

- (BOOL)isReadyForSubmission
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  BOOL v9;

  -[SUUIMetricsPageRenderEvent pageAppearTime](self, "pageAppearTime");
  if (v3 <= 2.22044605e-16)
    return 0;
  -[SUUIMetricsPageRenderEvent resourceRequestStartTime](self, "resourceRequestStartTime");
  if (v4 <= 2.22044605e-16)
    return 0;
  -[SUUIMetricsPageRenderEvent resourceRequestOnScreenEndTime](self, "resourceRequestOnScreenEndTime");
  if (v5 <= 2.22044605e-16)
    return 0;
  -[SUUIMetricsPageRenderEvent resourceRequestEndTime](self, "resourceRequestEndTime");
  if (v6 <= 2.22044605e-16)
    return 0;
  -[SUUIMetricsPageRenderEvent pageUserReadyTime](self, "pageUserReadyTime");
  if (v7 <= 2.22044605e-16)
    return 0;
  -[SUUIMetricsPageRenderEvent domChanges](self, "domChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") != 0;

  return v9;
}

- (void)appendPropertiesToBody:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableArray count](self->_domChanges, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_domChanges, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = self->_domChanges;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v10), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("domChanges"));
  }
  if (-[NSMutableArray count](self->_requests, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_requests, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = self->_requests;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("requests"));
  }
  if (-[NSDictionary count](self->_metricsBase, "count"))
    objc_msgSend(v4, "addEntriesFromDictionary:", self->_metricsBase);
  v19.receiver = self;
  v19.super_class = (Class)SUUIMetricsPageRenderEvent;
  -[SSMetricsMutableEvent appendPropertiesToBody:](&v19, sel_appendPropertiesToBody_, v4);

}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  SUUIMetricsPageRenderEvent *v47;
  NSMutableArray *obj;
  NSMutableArray *obja;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v58.receiver = self;
  v58.super_class = (Class)SUUIMetricsPageRenderEvent;
  -[SSMetricsBaseEvent description](&v58, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[SUUIMetricsPageRenderEvent clientCorrelationKey](self, "clientCorrelationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nclientCorrelationKey = %@"), v5);

  -[SUUIMetricsPageRenderEvent launchCorrelationKey](self, "launchCorrelationKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nlaunchCorrelationKey = %@"), v6);

  -[SUUIMetricsPageRenderEvent pageRequestedTime](self, "pageRequestedTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\npageRequestedTime = %f"), v7);
  -[SUUIMetricsPageRenderEvent pageAppearTime](self, "pageAppearTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\npageAppearTime = %f"), v8);
  -[SUUIMetricsPageRenderEvent pageDisappearTime](self, "pageDisappearTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\npageDisappearTime = %f"), v9);
  -[SUUIMetricsPageRenderEvent platformRequestStartTime](self, "platformRequestStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nplatformRequestStartTime = %f"), v10);
  -[SUUIMetricsPageRenderEvent platformResponseStartTime](self, "platformResponseStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nplatformResponseStartTime = %f"), v11);
  -[SUUIMetricsPageRenderEvent platformResponseEndTime](self, "platformResponseEndTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nplatformResponseEndTime = %f"), v12);
  v13 = -[SUUIMetricsPageRenderEvent platformResponseWasCached](self, "platformResponseWasCached");
  v14 = CFSTR("NO");
  if (v13)
    v14 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nplatformResponseWasCached = %@"), v14);
  -[SUUIMetricsPageRenderEvent platformJsonParseStartTime](self, "platformJsonParseStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nplatformJsonParseStartTime = %f"), v15);
  -[SUUIMetricsPageRenderEvent platformJsonParseEndTime](self, "platformJsonParseEndTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nplatformJsonParseEndTime = %f"), v16);
  objc_msgSend(v3, "appendString:", CFSTR("\ndomChanges = ("));
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v47 = self;
  obj = self->_domChanges;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v55 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t{"));
        objc_msgSend(v21, "buildStartTime");
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tbuildStartTime = %f"), v22);
        objc_msgSend(v21, "buildEndTime");
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tbuildEndTime = %f"), v23);
        objc_msgSend(v21, "renderStartTime");
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\trenderStartTime = %f"), v24);
        objc_msgSend(v21, "renderEndTime");
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\trenderEndTime = %f"), v25);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t},"));
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v18);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n)"));
  objc_msgSend(v3, "appendString:", CFSTR("\ndomChanges = ("));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obja = v47->_requests;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(obja);
        v30 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t{"));
        objc_msgSend(v30, "requestStartTime");
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\trequestStartTime = %f"), v31);
        objc_msgSend(v30, "responseStartTime");
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tresponseStartTime = %f"), v32);
        objc_msgSend(v30, "responseEndTime");
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tresponseEndTime = %f"), v33);
        v34 = objc_msgSend(v30, "responseWasCached");
        v35 = CFSTR("NO");
        if (v34)
          v35 = CFSTR("YES");
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\tresponseWasCached = %@"), v35);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t},"));
      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v27);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n)"));
  -[SUUIMetricsPageRenderEvent resourceRequestStartTime](v47, "resourceRequestStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nresourceRequestStartTime = %f"), v36);
  -[SUUIMetricsPageRenderEvent resourceRequestOnScreenEndTime](v47, "resourceRequestOnScreenEndTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nresourceRequestOnScreenEndTime = %f"), v37);
  -[SUUIMetricsPageRenderEvent resourceRequestEndTime](v47, "resourceRequestEndTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nresourceRequestEndTime = %f"), v38);
  -[SUUIMetricsPageRenderEvent pageUserReadyTime](v47, "pageUserReadyTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\npageUserReadyTime = %f"), v39);
  v40 = -[SUUIMetricsPageRenderEvent xpSamplingForced](v47, "xpSamplingForced");
  v41 = CFSTR("NO");
  if (v40)
    v41 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nxpSamplingForced = %@"), v41);
  -[SUUIMetricsPageRenderEvent xpSamplingPercentageUsers](v47, "xpSamplingPercentageUsers");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nxpSamplingPercentageUsers = %f"), v42);
  -[SUUIMetricsPageRenderEvent xpSessionDuration](v47, "xpSessionDuration");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nxpSessionDuration = %f"), v43);
  -[SUUIMetricsPageRenderEvent metricsBase](v47, "metricsBase");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nmetricsBase = %@"), v44);

  v45 = (void *)objc_msgSend(v3, "copy");
  return (NSString *)v45;
}

- (void)populateObjectInspector:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void (**v25)(_QWORD);
  void *v26;
  id v27;
  void (**v28)(_QWORD);
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  double v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(_QWORD *, void *);
  void *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD aBlock[6];

  v4 = a3;
  objc_msgSend(v4, "setFriendlyName:", CFSTR("Page Render Times"));
  objc_msgSend(v4, "setInformation:", CFSTR("All times relative to earliest recorded operation time"));
  -[SUUIMetricsPageRenderEvent pageAppearTime](self, "pageAppearTime");
  v6 = v5;
  -[SUUIMetricsPageRenderEvent pageRequestedTime](self, "pageRequestedTime");
  v8 = MEMORY[0x24BDAC760];
  if (v6 >= v7)
    v6 = v7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke;
  aBlock[3] = &__block_descriptor_40_e18___NSString_16__0d8l;
  *(double *)&aBlock[4] = v6;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v4, "beginSectionWithFriendlyName:", CFSTR("Baseline"));
  v10 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringFromDate:dateStyle:timeStyle:", v11, 0, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Start Time"), v12);
  objc_msgSend(v4, "endSection");
  objc_msgSend(v4, "beginSectionWithFriendlyName:", CFSTR("Page Times"));
  -[SUUIMetricsPageRenderEvent pageRequestedTime](self, "pageRequestedTime");
  v9[2](v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Page Requested Time"), v13);

  -[SUUIMetricsPageRenderEvent pageAppearTime](self, "pageAppearTime");
  v9[2](v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Page Appear Time"), v14);

  -[SUUIMetricsPageRenderEvent pageDisappearTime](self, "pageDisappearTime");
  v9[2](v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Page Disappear Time"), v15);

  -[SUUIMetricsPageRenderEvent pageUserReadyTime](self, "pageUserReadyTime");
  v9[2](v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Page User Ready Time"), v16);

  objc_msgSend(v4, "endSection");
  objc_msgSend(v4, "beginSectionWithFriendlyName:", CFSTR("Platform Request Times"));
  -[SUUIMetricsPageRenderEvent platformRequestStartTime](self, "platformRequestStartTime");
  v9[2](v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Platform Request Start Time"), v17);

  -[SUUIMetricsPageRenderEvent platformResponseStartTime](self, "platformResponseStartTime");
  v9[2](v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Platform Response Start Time"), v18);

  -[SUUIMetricsPageRenderEvent platformResponseEndTime](self, "platformResponseEndTime");
  v9[2](v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Platform Response End Time"), v19);

  if (-[SUUIMetricsPageRenderEvent platformResponseWasCached](self, "platformResponseWasCached"))
    v20 = CFSTR("Yes");
  else
    v20 = CFSTR("No");
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Platform Response Was Cached"), v20);
  -[SUUIMetricsPageRenderEvent platformJsonParseStartTime](self, "platformJsonParseStartTime");
  v9[2](v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Platform JSON Parse Start Time"), v21);

  -[SUUIMetricsPageRenderEvent platformJsonParseEndTime](self, "platformJsonParseEndTime");
  v9[2](v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exposePropertyWithFriendlyName:value:", CFSTR("Platform JSON Parse End Time"), v22);

  objc_msgSend(v4, "endSection");
  objc_msgSend(v4, "beginSectionWithFriendlyName:", CFSTR("DOM Times"));
  -[SUUIMetricsPageRenderEvent domChanges](self, "domChanges");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v8;
  v46[1] = 3221225472;
  v46[2] = __54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke_3;
  v46[3] = &unk_2511FB7E8;
  v24 = v4;
  v47 = v24;
  v25 = v9;
  v48 = v25;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v46);

  objc_msgSend(v24, "endSection");
  objc_msgSend(v24, "beginSectionWithFriendlyName:", CFSTR("Request Times"));
  -[SUUIMetricsPageRenderEvent requests](self, "requests");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v8;
  v40 = 3221225472;
  v41 = __54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke_4;
  v42 = &unk_2511FB810;
  v43 = v24;
  v44 = v25;
  v45 = &__block_literal_global_142;
  v27 = v24;
  v28 = v25;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", &v39);

  objc_msgSend(v27, "endSection");
  objc_msgSend(v27, "beginSectionWithFriendlyName:", CFSTR("Resource Request Times"));
  -[SUUIMetricsPageRenderEvent resourceRequestStartTime](self, "resourceRequestStartTime");
  v9[2](v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "exposePropertyWithFriendlyName:value:", CFSTR("Resource Request Start Time"), v29);

  -[SUUIMetricsPageRenderEvent resourceRequestOnScreenEndTime](self, "resourceRequestOnScreenEndTime");
  v9[2](v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "exposePropertyWithFriendlyName:value:", CFSTR("Resource Request On Screen End Time"), v30);

  -[SUUIMetricsPageRenderEvent resourceRequestEndTime](self, "resourceRequestEndTime");
  v9[2](v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "exposePropertyWithFriendlyName:value:", CFSTR("Resource Request End Time"), v31);

  objc_msgSend(v27, "endSection");
  objc_msgSend(v27, "beginSectionWithFriendlyName:", CFSTR("Sampling Configuration"));
  v32 = (void *)MEMORY[0x24BDD17C8];
  -[SUUIMetricsPageRenderEvent xpSessionDuration](self, "xpSessionDuration");
  objc_msgSend(v32, "stringWithFormat:", CFSTR("%.0fs"), v33 / 1000.0, v39, v40, v41, v42);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "exposePropertyWithFriendlyName:value:", CFSTR("XP Session Duration"), v34);

  if (-[SUUIMetricsPageRenderEvent xpSamplingForced](self, "xpSamplingForced"))
    v35 = CFSTR("Yes");
  else
    v35 = CFSTR("No");
  objc_msgSend(v27, "exposePropertyWithFriendlyName:value:", CFSTR("XP Sampling Forced"), v35);
  v36 = (void *)MEMORY[0x24BDD17C8];
  -[SUUIMetricsPageRenderEvent xpSamplingPercentageUsers](self, "xpSamplingPercentageUsers");
  objc_msgSend(v36, "stringWithFormat:", CFSTR("%ld%%"), (uint64_t)(v37 * 100.0));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "exposePropertyWithFriendlyName:value:", CFSTR("XP Sampling Percentage Users"), v38);

  objc_msgSend(v27, "endSection");
}

__CFString *__54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke(uint64_t a1, double a2)
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (a2 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2 - *(double *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+%@s"), v4);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = CFSTR("--");
  }
  return v2;
}

__CFString *__54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return CFSTR("Yes");
  else
    return CFSTR("No");
}

void __54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  id v17;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "buildStartTime");
  (*(void (**)(uint64_t))(v4 + 16))(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exposePropertyWithFriendlyName:value:", CFSTR("Build Start Time"), v6);

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "buildEndTime");
  (*(void (**)(uint64_t))(v8 + 16))(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exposePropertyWithFriendlyName:value:", CFSTR("Build End Time"), v9);

  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "renderStartTime");
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exposePropertyWithFriendlyName:value:", CFSTR("Render Start Time"), v12);

  v14 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "renderEndTime");
  v16 = v15;

  (*(void (**)(uint64_t, double))(v13 + 16))(v13, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exposePropertyWithFriendlyName:value:", CFSTR("Render End Time"), v17);

}

void __54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "requestStartTime");
  (*(void (**)(uint64_t))(v4 + 16))(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exposePropertyWithFriendlyName:value:", CFSTR("Request Start Time"), v6);

  v7 = (void *)a1[4];
  v8 = a1[5];
  objc_msgSend(v5, "responseStartTime");
  (*(void (**)(uint64_t))(v8 + 16))(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exposePropertyWithFriendlyName:value:", CFSTR("Response Start Time"), v9);

  v10 = (void *)a1[4];
  v11 = a1[5];
  objc_msgSend(v5, "responseEndTime");
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exposePropertyWithFriendlyName:value:", CFSTR("Response End Time"), v12);

  v13 = (void *)a1[4];
  v14 = a1[6];
  v15 = objc_msgSend(v5, "responseWasCached");

  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v15);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "exposePropertyWithFriendlyName:value:", CFSTR("Response Was Cached"), v16);

}

- (NSArray)domChanges
{
  return &self->_domChanges->super;
}

- (NSArray)requests
{
  return &self->_requests->super;
}

- (NSDictionary)metricsBase
{
  return self->_metricsBase;
}

- (void)setMetricsBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsBase, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_domChanges, 0);
}

@end
