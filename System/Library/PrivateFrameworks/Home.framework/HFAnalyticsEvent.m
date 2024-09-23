@implementation HFAnalyticsEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (NSString)name
{
  return (NSString *)+[HFAnalytics eventNameForEventType:](HFAnalytics, "eventNameForEventType:", -[HFAnalyticsEvent type](self, "type"));
}

- (unint64_t)type
{
  return self->_type;
}

- (HFAnalyticsEvent)initWithEventType:(unint64_t)a3
{
  HFAnalyticsEvent *v5;
  HFAnalyticsEvent *v6;
  uint64_t v7;
  NSDate *timestamp;
  objc_super v10;

  if (-[HFAnalyticsEvent isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    NSLog(&CFSTR("-initWithEventType: is private and may only be called by subclasses of HFAnalyticsEvent. See HFAnalyticsEvent"
                 "+Subclass.h for more information.").isa);
  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsEvent;
  v5 = -[HFAnalyticsEvent init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = objc_claimAutoreleasedReturnValue();
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v7;

  }
  return v6;
}

- (NSDictionary)payload
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("timestamp");
  -[HFAnalyticsEvent timestamp](self, "timestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_analyticsTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (HFAnalyticsEvent)initWithData:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAnalyticsEvent.m"), 22, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAnalyticsEvent initWithData:]", objc_opt_class());

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAnalyticsEvent name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("name"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HFAnalyticsEvent payload](self, "payload", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[HFAnalyticsEvent payload](self, "payload");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (id)objc_msgSend(v3, "appendObject:withName:", v13, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

@end
