@implementation ATXDistractionEvents

- (ATXDistractionEvents)initWithAllDeliveredNotifications:(id)a3 allInterruptingAppSessions:(id)a4
{
  id v6;
  id v7;
  ATXDistractionEvents *v8;
  uint64_t v9;
  NSArray *allDeliveredNotifications;
  uint64_t v11;
  NSArray *allInterruptingAppSessions;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXDistractionEvents;
  v8 = -[ATXDistractionEvents init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    allDeliveredNotifications = v8->_allDeliveredNotifications;
    v8->_allDeliveredNotifications = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    allInterruptingAppSessions = v8->_allInterruptingAppSessions;
    v8->_allInterruptingAppSessions = (NSArray *)v11;

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
  -[ATXDistractionEvents allDeliveredNotifications](self, "allDeliveredNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("allDeliveredNotifications"));

  -[ATXDistractionEvents allInterruptingAppSessions](self, "allInterruptingAppSessions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("allInterruptingAppSessions"));

}

- (ATXDistractionEvents)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ATXDistractionEvents *v12;
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
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("allDeliveredNotifications"), v4, 0, CFSTR("com.apple.proactive.UsageInsights"), -1, v9);
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
    objc_msgSend(v13, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v16, CFSTR("allInterruptingAppSessions"), v4, 0, CFSTR("com.apple.proactive.UsageInsights"), -1, v17, v21[0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v12 = 0;
    }
    else
    {
      self = -[ATXDistractionEvents initWithAllDeliveredNotifications:allInterruptingAppSessions:](self, "initWithAllDeliveredNotifications:allInterruptingAppSessions:", v10, v18);
      v12 = self;
    }

  }
  return v12;
}

- (NSArray)allDeliveredNotifications
{
  return self->_allDeliveredNotifications;
}

- (NSArray)allInterruptingAppSessions
{
  return self->_allInterruptingAppSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allInterruptingAppSessions, 0);
  objc_storeStrong((id *)&self->_allDeliveredNotifications, 0);
}

@end
