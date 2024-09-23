@implementation AAFAnalyticsEvent

- (AAFAnalyticsEvent)initWithEventName:(id)a3 eventCategory:(id)a4 initData:(id)a5
{
  id v9;
  id v10;
  id v11;
  AAFAnalyticsEvent *v12;
  AAFAnalyticsEvent *v13;
  NSDictionary *v14;
  NSDictionary *reportData;
  void *v16;
  double v17;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AAFAnalyticsEvent;
  v12 = -[AAFAnalyticsEvent init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_eventName, a3);
    objc_storeStrong((id *)&v13->_eventCategory, a4);
    if (v11)
      v14 = (NSDictionary *)v11;
    else
      v14 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    reportData = v13->_reportData;
    v13->_reportData = v14;

    mach_timebase_info(&v13->_clock_timebase);
    v13->_initTime = mach_absolute_time();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSince1970");
    v13->_eventCreationTime = v17 * 1000.0;

    if (+[AFUtilities isInternalBuild](AFUtilities, "isInternalBuild"))
    {
      v18 = (void *)CFPreferencesCopyAppValue(CFSTR("TelemetryInternalSignature"), CFSTR("com.apple.AAAFoundation"));
      -[AAFAnalyticsEvent setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v18, CFSTR("internalTestSignature"));

    }
  }

  return v13;
}

+ (id)analyticsEventWithName:(id)a3 eventCategory:(id)a4 initData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventName:eventCategory:initData:", v8, v9, v10);
  }
  else
  {
    _AAFLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[AAFAnalyticsEvent analyticsEventWithName:eventCategory:initData:].cold.1(v12);

    v11 = 0;
  }

  return v11;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_reportData, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *reportData;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)-[NSDictionary mutableCopy](self->_reportData, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);
    v9 = (NSDictionary *)objc_msgSend(v8, "copy");
    reportData = self->_reportData;
    self->_reportData = v9;

  }
  else
  {
    _AAFLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[AAFAnalyticsEvent setObject:forKeyedSubscript:].cold.1(v11);

  }
}

- (void)completeEvent
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D51A2000, a2, OS_LOG_TYPE_ERROR, "Already reported event %@", (uint8_t *)&v4, 0xCu);

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[AAFAnalyticsEvent topLevelError](self, "topLevelError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[AAFAnalyticsEvent eventName](self, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AAFAnalyticsEvent topLevelError](self, "topLevelError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAFAnalyticsEvent reportData](self, "reportData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAFAnalyticsEvent eventCategory](self, "eventCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> EventName: [%@], EventError: [%@], ReportData: %@, EventCategory: [%@]"), v5, self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AAFAnalyticsEvent reportData](self, "reportData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAFAnalyticsEvent eventCategory](self, "eventCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> EventName: [%@], ReportData: %@, EventCategory: [%@]"), v5, self, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)_populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;
  uint64_t v24;

  v4 = *(_QWORD *)&a4;
  v23 = a3;
  -[AAFAnalyticsEvent setTopLevelError:](self, "setTopLevelError:", v23);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v23, "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFAnalyticsEvent setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, CFSTR("errorCode"));

  objc_msgSend(v23, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFAnalyticsEvent setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v7, CFSTR("errorDomain"));

  objc_msgSend(v23, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = (_DWORD)v4 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v24 = v9;
    v13 = 0;
    do
    {
      v14 = v4;
      v15 = v10;
      v12 = (v13 + 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), CFSTR("underlyingErrorCode"), v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), CFSTR("underlyingErrorDomain"), v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "code"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAFAnalyticsEvent setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, v16);

      objc_msgSend(v15, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAFAnalyticsEvent setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v19, v17);

      objc_msgSend(v15, "userInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;
      v21 = v13 + 2;
      ++v13;
      v4 = v14;
    }
    while (v21 <= v14);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFAnalyticsEvent setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v22, CFSTR("numberOfUnderlyingErrors"));

}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3
{
  if (a3)
    -[AAFAnalyticsEvent _populateUnderlyingErrorsStartingWithRootError:maxDepth:](self, "_populateUnderlyingErrorsStartingWithRootError:maxDepth:", a3, AAFNumberofUnderlyingError);
}

- (double)machAbsoluteTimeToSeconds:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[AAFAnalyticsEvent clock_timebase](self, "clock_timebase") * a3;
  return (double)(v4 / ((unint64_t)-[AAFAnalyticsEvent clock_timebase](self, "clock_timebase") >> 32))
       / 1000000000.0;
}

- (double)machAbsoluteTimeToMilliseconds:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[AAFAnalyticsEvent clock_timebase](self, "clock_timebase") * a3;
  return (double)(v4 / ((unint64_t)-[AAFAnalyticsEvent clock_timebase](self, "clock_timebase") >> 32))
       / 1000000.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *topLevelError;
  id v5;

  topLevelError = self->_topLevelError;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", topLevelError, CFSTR("_topLevelError"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventName, CFSTR("_eventName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventCategory, CFSTR("_eventCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reportData, CFSTR("_reportData"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_eventCreationTime"), self->_eventCreationTime);
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientName, CFSTR("_clientName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientBundleId, CFSTR("_clientBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientType, CFSTR("_clientType"));

}

- (AAFAnalyticsEvent)initWithCoder:(id)a3
{
  id v4;
  AAFAnalyticsEvent *v5;
  uint64_t v6;
  NSError *topLevelError;
  uint64_t v8;
  NSString *eventName;
  uint64_t v10;
  NSNumber *eventCategory;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *reportData;
  double v21;
  uint64_t v22;
  NSString *clientName;
  uint64_t v24;
  NSString *clientBundleId;
  uint64_t v26;
  NSNumber *clientType;

  v4 = a3;
  v5 = -[AAFAnalyticsEvent init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_topLevelError"));
    v6 = objc_claimAutoreleasedReturnValue();
    topLevelError = v5->_topLevelError;
    v5->_topLevelError = (NSError *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_eventName"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_eventCategory"));
    v10 = objc_claimAutoreleasedReturnValue();
    eventCategory = v5->_eventCategory;
    v5->_eventCategory = (NSNumber *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("_reportData"));
    v19 = objc_claimAutoreleasedReturnValue();
    reportData = v5->_reportData;
    v5->_reportData = (NSDictionary *)v19;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_eventCreationTime"));
    v5->_eventCreationTime = v21;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientName"));
    v22 = objc_claimAutoreleasedReturnValue();
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientBundleId"));
    v24 = objc_claimAutoreleasedReturnValue();
    clientBundleId = v5->_clientBundleId;
    v5->_clientBundleId = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientType"));
    v26 = objc_claimAutoreleasedReturnValue();
    clientType = v5->_clientType;
    v5->_clientType = (NSNumber *)v26;

  }
  return v5;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDictionary)reportData
{
  return self->_reportData;
}

- (NSNumber)eventCategory
{
  return self->_eventCategory;
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (void)setClientType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)eventCreationTime
{
  return self->_eventCreationTime;
}

- (void)setEventCreationTime:(double)a3
{
  self->_eventCreationTime = a3;
}

- (unint64_t)initTime
{
  return self->_initTime;
}

- (void)setInitTime:(unint64_t)a3
{
  self->_initTime = a3;
}

- (mach_timebase_info)clock_timebase
{
  return self->_clock_timebase;
}

- (void)setClock_timebase:(mach_timebase_info)a3
{
  self->_clock_timebase = a3;
}

- (NSError)topLevelError
{
  return self->_topLevelError;
}

- (void)setTopLevelError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLevelError, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
  objc_storeStrong((id *)&self->_eventCategory, 0);
  objc_storeStrong((id *)&self->_reportData, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

+ (void)analyticsEventWithName:(os_log_t)log eventCategory:initData:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D51A2000, log, OS_LOG_TYPE_ERROR, "Failed to initialize AAFAnalyticsEvent. Please check if all required parameters are provided.", v1, 2u);
}

- (void)setObject:(os_log_t)log forKeyedSubscript:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D51A2000, log, OS_LOG_TYPE_FAULT, "\"AAFAnalyticsEvent gets a nil key. Please check if the key is constructed properly.\", v1, 2u);
}

@end
