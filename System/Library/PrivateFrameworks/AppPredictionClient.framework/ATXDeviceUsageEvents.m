@implementation ATXDeviceUsageEvents

- (ATXDeviceUsageEvents)initWithContinuousDeviceUsageEvent:(id)a3 mindlessCyclingEvents:(id)a4
{
  id v6;
  id v7;
  ATXDeviceUsageEvents *v8;
  uint64_t v9;
  NSArray *continuousDeviceUsageEvents;
  uint64_t v11;
  NSArray *mindlessCyclingEvents;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXDeviceUsageEvents;
  v8 = -[ATXDeviceUsageEvents init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    continuousDeviceUsageEvents = v8->_continuousDeviceUsageEvents;
    v8->_continuousDeviceUsageEvents = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    mindlessCyclingEvents = v8->_mindlessCyclingEvents;
    v8->_mindlessCyclingEvents = (NSArray *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ATXDeviceUsageEvents continuousDeviceUsageEvents](self, "continuousDeviceUsageEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("continuousDeviceUsageEvents"));

  -[ATXDeviceUsageEvents mindlessCyclingEvents](self, "mindlessCyclingEvents");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mindlessCyclingEvents"));

}

- (ATXDeviceUsageEvents)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ATXDeviceUsageEvents *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_usage_insights();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("continuousDeviceUsageEvents"), v4, 0, CFSTR("com.apple.proactive.UsageInsights"), -1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D81610];
    v14 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_usage_insights();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v16, CFSTR("mindlessCyclingEvents"), v4, 0, CFSTR("com.apple.proactive.UsageInsights"), -1, v17, v21[0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v12 = 0;
    }
    else
    {
      self = -[ATXDeviceUsageEvents initWithContinuousDeviceUsageEvent:mindlessCyclingEvents:](self, "initWithContinuousDeviceUsageEvent:mindlessCyclingEvents:", v10, v18);
      v12 = self;
    }

  }
  return v12;
}

- (NSArray)continuousDeviceUsageEvents
{
  return self->_continuousDeviceUsageEvents;
}

- (NSArray)mindlessCyclingEvents
{
  return self->_mindlessCyclingEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mindlessCyclingEvents, 0);
  objc_storeStrong((id *)&self->_continuousDeviceUsageEvents, 0);
}

@end
