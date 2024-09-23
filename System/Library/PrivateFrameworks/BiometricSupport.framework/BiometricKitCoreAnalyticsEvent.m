@implementation BiometricKitCoreAnalyticsEvent

- (BiometricKitCoreAnalyticsEvent)initWithName:(id)a3
{
  id v5;
  BiometricKitCoreAnalyticsEvent *v6;
  BiometricKitCoreAnalyticsEvent *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSNumber *deviceEnclosureColor;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BiometricKitCoreAnalyticsEvent;
  v6 = -[BiometricKitCoreAnalyticsEvent init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, a3);
    -[BiometricKitCoreAnalyticsEvent reset](v7, "reset");
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = (void *)MGCopyAnswer();
    objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceEnclosureColor = v7->_deviceEnclosureColor;
    v7->_deviceEnclosureColor = (NSNumber *)v10;

  }
  return v7;
}

- (BiometricKitCoreAnalyticsEvent)initWithName:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  BiometricKitCoreAnalyticsEvent *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t i;
  NSString *v15;
  void *v16;
  NSObject *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  NSString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[BiometricKitCoreAnalyticsEvent initWithName:](self, "initWithName:", v6);
  if (v8)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      v13 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v15 = *(NSString **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSSelectorFromString(v15);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
             || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
             && -[NSString isEqualToString:](v15, "isEqualToString:", CFSTR("previousEventDate"))))
          {
            -[BiometricKitCoreAnalyticsEvent setValue:forKey:](v8, "setValue:forKey:", v16, v15);
          }
          else
          {
            if (__osLog)
              v17 = __osLog;
            else
              v17 = v13;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v25 = v6;
              v26 = 2112;
              v27 = v9;
              v28 = 2112;
              v29 = v15;
              _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "BiometricKitCoreAnalyticsEvent initWithName: %@ dictionary:%@ - throwing away unsupported key: %@\n", buf, 0x20u);
            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      }
      while (v11);
    }

    v7 = v19;
  }

  return v8;
}

- (BiometricKitCoreAnalyticsEvent)initWithPersistedDataWithName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BiometricKitCoreAnalyticsEvent *v8;

  v4 = (void *)MEMORY[0x24BE0CE58];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectOfClass:forKey:", objc_opt_class(), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BiometricKitCoreAnalyticsEvent initWithName:dictionary:](self, "initWithName:dictionary:", v5, v7);

  return v8;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *eventName;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    eventName = self->_eventName;
    v8 = 138412546;
    v9 = eventName;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_ERROR, "BiometricKitCoreAnalyticsEvent(%@) valueForUndefinedKey: %@\n", (uint8_t *)&v8, 0x16u);
  }

  return 0;
}

- (void)setNilValueForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *eventName;
  int v7;
  NSString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    eventName = self->_eventName;
    v7 = 138412546;
    v8 = eventName;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_ERROR, "BiometricKitCoreAnalyticsEvent(%@) setNilValueForKey: %@\n", (uint8_t *)&v7, 0x16u);
  }

}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *eventName;
  int v10;
  NSString *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__osLog)
    v8 = __osLog;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    eventName = self->_eventName;
    v10 = 138412802;
    v11 = eventName;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "BiometricKitCoreAnalyticsEvent(%@) setValue: %@ forUndefinedKey: %@\n", (uint8_t *)&v10, 0x20u);
  }

}

- (BOOL)postEvent
{
  NSObject *v3;
  NSObject *v4;
  NSString *eventName;
  NSDate *previousEventDate;
  void *v7;
  double v8;
  NSNumber *v9;
  NSNumber *timeSinceLastEvent;
  NSDate *v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  NSString *v16;
  NSDate *v17;
  NSDate *v18;
  uint64_t v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLog)
    v4 = __osLog;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    eventName = self->_eventName;
    *(_DWORD *)buf = 138412290;
    v22 = eventName;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) postEvent\n", buf, 0xCu);
  }
  previousEventDate = self->_previousEventDate;
  if (previousEventDate)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[NSDate timeIntervalSinceNow](previousEventDate, "timeIntervalSinceNow");
    objc_msgSend(v7, "numberWithUnsignedInteger:", (unint64_t)(v8 * -1000.0));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    timeSinceLastEvent = self->_timeSinceLastEvent;
    self->_timeSinceLastEvent = v9;

    v11 = self->_previousEventDate;
    self->_previousEventDate = 0;

  }
  -[BiometricKitCoreAnalyticsEvent updateBoundedFieldValue](self, "updateBoundedFieldValue");
  -[BiometricKitCoreAnalyticsEvent getEventDictionary](self, "getEventDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v13 = v12;
  v14 = AnalyticsSendEventLazy();
  if (__osLog)
    v15 = __osLog;
  else
    v15 = v3;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = self->_eventName;
    *(_DWORD *)buf = 138412546;
    v22 = v16;
    v23 = 1024;
    v24 = v14;
    _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) postEvent - AnalyticsSendEventLazy result: %d\n", buf, 0x12u);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now", v20, 3221225472, __43__BiometricKitCoreAnalyticsEvent_postEvent__block_invoke, &unk_24D241498, self);
  v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v18 = self->_previousEventDate;
  self->_previousEventDate = v17;

  -[BiometricKitCoreAnalyticsEvent reset](self, "reset");
  return v14;
}

id __43__BiometricKitCoreAnalyticsEvent_postEvent__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "logAnalyticsDictionary:", *(_QWORD *)(a1 + 40));
  return *(id *)(a1 + 40);
}

- (id)dictionaryRepresentationForClass:(Class)a3
{
  void *v5;
  objc_property_t *v6;
  objc_property_t *v7;
  unint64_t i;
  void *v9;
  void *v10;
  NSObject *v12;
  unsigned int outCount;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v6 = class_copyPropertyList(a3, &outCount);
  if (v6)
  {
    v7 = v6;
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", property_getName(v7[i]));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[BiometricKitCoreAnalyticsEvent valueForKey:](self, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v5, "setObject:forKey:", v10, v9);

      }
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v15 = "propertyCount";
        v16 = 2048;
        v17 = 0;
        v18 = 2080;
        v19 = &unk_21491C593;
        v20 = 2080;
        v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/Analytics/BiometricKitCoreAnalyticsEvent.m";
        v22 = 1024;
        v23 = 145;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    free(v7);
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  return -[BiometricKitCoreAnalyticsEvent dictionaryRepresentationArchiving:](self, "dictionaryRepresentationArchiving:", 0);
}

- (id)dictionaryRepresentationArchiving:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  NSString *eventName;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSString *v12;
  NSArray *privateProperties;
  int v15;
  NSString *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  NSArray *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLog)
    v6 = __osLog;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    eventName = self->_eventName;
    v15 = 138412546;
    v16 = eventName;
    v17 = 1024;
    v18 = v3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) dictionaryRepresentation: %d\n", (uint8_t *)&v15, 0x12u);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  -[BiometricKitCoreAnalyticsEvent updateStatus](self, "updateStatus");
  if (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()))
  {
    do
    {
      -[BiometricKitCoreAnalyticsEvent dictionaryRepresentationForClass:](self, "dictionaryRepresentationForClass:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addEntriesFromDictionary:", v10);

      v9 = (void *)objc_msgSend(v9, "superclass");
    }
    while ((objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()) & 1) != 0);
  }
  if (!v3)
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = self->_eventName;
      privateProperties = self->_privateProperties;
      v15 = 138412802;
      v16 = v12;
      v17 = 1024;
      v18 = 0;
      v19 = 2112;
      v20 = privateProperties;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) dictionaryRepresentation: %d _privateProperties: %@\n", (uint8_t *)&v15, 0x1Cu);
    }
    objc_msgSend(v8, "removeObjectsForKeys:", self->_privateProperties);
  }
  return v8;
}

- (void)resetClass:(Class)a3
{
  objc_property_t *v4;
  objc_property_t *v5;
  unint64_t i;
  void *v7;
  unsigned int outCount;

  outCount = 0;
  v4 = class_copyPropertyList(a3, &outCount);
  v5 = v4;
  if (v4 && outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", property_getName(v5[i]));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BiometricKitCoreAnalyticsEvent setValue:forKey:](self, "setValue:forKey:", 0, v7);

    }
    goto LABEL_5;
  }
  if (v4)
LABEL_5:
    free(v5);
}

- (void)reset
{
  NSObject *v3;
  NSString *eventName;
  void *v5;
  NSDate *v6;
  NSNumber *v7;
  NSNumber *eventCanceled;
  NSNumber *v9;
  NSNumber *displayOn;
  NSDate *previousEventDate;
  NSDate *v12;
  NSNumber *deviceEnclosureColor;
  int v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    eventName = self->_eventName;
    v14 = 138412290;
    v15 = eventName;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) reset event\n", (uint8_t *)&v14, 0xCu);
  }
  v5 = (void *)objc_opt_class();
  v6 = self->_previousEventDate;
  v7 = self->_deviceEnclosureColor;
  if (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()))
  {
    do
    {
      -[BiometricKitCoreAnalyticsEvent resetClass:](self, "resetClass:", v5);
      v5 = (void *)objc_msgSend(v5, "superclass");
    }
    while ((objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0);
  }
  eventCanceled = self->_eventCanceled;
  v9 = (NSNumber *)MEMORY[0x24BDBD1C0];
  self->_eventCanceled = (NSNumber *)MEMORY[0x24BDBD1C0];

  displayOn = self->_displayOn;
  self->_displayOn = v9;

  previousEventDate = self->_previousEventDate;
  self->_previousEventDate = v6;
  v12 = v6;

  deviceEnclosureColor = self->_deviceEnclosureColor;
  self->_deviceEnclosureColor = v7;

}

- (void)incrementCountField:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BiometricKitCoreAnalyticsEvent valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitCoreAnalyticsEvent setValue:forKey:](self, "setValue:forKey:", v6, v4);

  }
  else
  {
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "[fieldValue isKindOfClass:[NSNumber class]]";
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = &unk_21491C593;
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/Analytics/BiometricKitCoreAnalyticsEvent.m";
      v16 = 1024;
      v17 = 248;
      _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v8, 0x30u);
    }
  }

}

- (void)setTimeSinceLastEnrollment:(id)a3
{
  NSUInteger v5;
  NSNumber *timeSinceLastEnrollment;
  uint64_t v7;
  uint64_t v8;
  NSNumber *v9;
  NSNumber *timeSinceLastEnrollmentBinned;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_timeSinceLastEnrollment, a3);
  v5 = -[NSNumber unsignedIntegerValue](self->_timeSinceLastEnrollment, "unsignedIntegerValue");
  timeSinceLastEnrollment = self->_timeSinceLastEnrollment;
  if (v5 < 0x80)
  {
    v9 = timeSinceLastEnrollment;
  }
  else
  {
    v7 = -[NSNumber unsignedIntegerValue](timeSinceLastEnrollment, "unsignedIntegerValue");
    v8 = ((unint64_t)(v7 - 128) * (unsigned __int128)0x2492492492492493uLL) >> 64;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", ((v8 + ((unint64_t)(v7 - 128 - v8) >> 1)) >> 2) + 128);
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  timeSinceLastEnrollmentBinned = self->_timeSinceLastEnrollmentBinned;
  self->_timeSinceLastEnrollmentBinned = v9;

}

- (void)updateBoundedFieldValue
{
  NSDictionary *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSString *eventName;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_boundedFieldLimits;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    *(_QWORD *)&v5 = 138413058;
    v14 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_boundedFieldLimits, "objectForKeyedSubscript:", v9, v14, (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[BiometricKitCoreAnalyticsEvent valueForKey:](self, "valueForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "compare:", v10) == 1)
        {
          if (__osLog)
            v12 = __osLog;
          else
            v12 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            eventName = self->_eventName;
            *(_DWORD *)buf = v14;
            v20 = eventName;
            v21 = 2112;
            v22 = v9;
            v23 = 2112;
            v24 = v11;
            v25 = 2112;
            v26 = v10;
            _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) updateBoundedFieldValue bound field:%@ value:%@ to:%@\n", buf, 0x2Au);
          }
          -[BiometricKitCoreAnalyticsEvent setValue:forKey:](self, "setValue:forKey:", v10, v9);
        }

      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
    }
    while (v6);
  }

}

- (void)logAnalyticsDictionary:(id)a3
{
  objc_msgSend(MEMORY[0x24BE0CE80], "analyticsOSLogNSDictionary:forEvent:toLogPath:withPrefix:", a3, self->_eventName, CFSTR("/private/var/tmp/"), CFSTR("BiometricKitCA"));
}

- (void)persistData
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BiometricKitCoreAnalyticsEvent dictionaryRepresentationArchiving:](self, "dictionaryRepresentationArchiving:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, self->_eventName);

}

- (id)isPasscodeSet
{
  NSObject *v3;
  NSObject *v4;
  NSString *eventName;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSString *v12;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLog)
    v4 = __osLog;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    eventName = self->_eventName;
    v15 = 138412290;
    v16 = (const char *)eventName;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) isPasscodeSet\n", (uint8_t *)&v15, 0xCu);
  }
  v6 = (void *)MKBGetDeviceLockStateInfo();
  v7 = v6;
  if (!v6)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v3;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v15 = 136316162;
    v16 = "deviceStateInfo";
    v17 = 2048;
    v18 = 0;
    v19 = 2080;
    v20 = &unk_21491C593;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/Analytics/BiometricKitCoreAnalyticsEvent.m";
    v23 = 1024;
    v24 = 307;
    goto LABEL_27;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE67218]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    if ((objc_msgSend(v8, "unsignedIntValue") & 2) != 0)
      v10 = (void *)MEMORY[0x24BDBD1C0];
    else
      v10 = (void *)MEMORY[0x24BDBD1C8];
    goto LABEL_11;
  }
  if (__osLog)
    v14 = __osLog;
  else
    v14 = v3;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = 136316162;
    v16 = "keybagStateRaw";
    v17 = 2048;
    v18 = 0;
    v19 = 2080;
    v20 = &unk_21491C593;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/Analytics/BiometricKitCoreAnalyticsEvent.m";
    v23 = 1024;
    v24 = 309;
LABEL_27:
    _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
  }
LABEL_28:
  v9 = 0;
  v10 = 0;
LABEL_11:
  if (__osLog)
    v11 = __osLog;
  else
    v11 = v3;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = self->_eventName;
    v15 = 138412546;
    v16 = (const char *)v12;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) isPasscodeSet: %@\n", (uint8_t *)&v15, 0x16u);
  }

  return v10;
}

- (void)updateStatus
{
  NSNumber *v3;
  NSNumber *passcodeSet;

  -[BiometricKitCoreAnalyticsEvent isPasscodeSet](self, "isPasscodeSet");
  v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  passcodeSet = self->_passcodeSet;
  self->_passcodeSet = v3;

}

- (NSNumber)eventCanceled
{
  return self->_eventCanceled;
}

- (void)setEventCanceled:(id)a3
{
  objc_storeStrong((id *)&self->_eventCanceled, a3);
}

- (NSNumber)displayOn
{
  return self->_displayOn;
}

- (void)setDisplayOn:(id)a3
{
  objc_storeStrong((id *)&self->_displayOn, a3);
}

- (NSNumber)passcodeSet
{
  return self->_passcodeSet;
}

- (void)setPasscodeSet:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeSet, a3);
}

- (NSNumber)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceEnclosureColor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceEnclosureColor, a3);
}

- (NSNumber)timeSinceLastEnrollment
{
  return self->_timeSinceLastEnrollment;
}

- (NSNumber)timeSinceLastEnrollmentBinned
{
  return self->_timeSinceLastEnrollmentBinned;
}

- (void)setTimeSinceLastEnrollmentBinned:(id)a3
{
  objc_storeStrong((id *)&self->_timeSinceLastEnrollmentBinned, a3);
}

- (NSNumber)timeSinceLastEvent
{
  return self->_timeSinceLastEvent;
}

- (void)setTimeSinceLastEvent:(id)a3
{
  objc_storeStrong((id *)&self->_timeSinceLastEvent, a3);
}

- (NSDate)previousEventDate
{
  return self->_previousEventDate;
}

- (void)setPreviousEventDate:(id)a3
{
  objc_storeStrong((id *)&self->_previousEventDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousEventDate, 0);
  objc_storeStrong((id *)&self->_timeSinceLastEvent, 0);
  objc_storeStrong((id *)&self->_timeSinceLastEnrollmentBinned, 0);
  objc_storeStrong((id *)&self->_timeSinceLastEnrollment, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_passcodeSet, 0);
  objc_storeStrong((id *)&self->_displayOn, 0);
  objc_storeStrong((id *)&self->_eventCanceled, 0);
  objc_storeStrong((id *)&self->_boundedFieldLimits, 0);
  objc_storeStrong((id *)&self->_privateProperties, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
