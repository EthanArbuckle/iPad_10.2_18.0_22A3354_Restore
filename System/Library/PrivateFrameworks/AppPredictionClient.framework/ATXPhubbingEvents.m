@implementation ATXPhubbingEvents

- (ATXPhubbingEvents)initWithPhubbingSessions:(id)a3
{
  id v4;
  ATXPhubbingEvents *v5;
  uint64_t v6;
  NSArray *phubbingSessions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXPhubbingEvents;
  v5 = -[ATXPhubbingEvents init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    phubbingSessions = v5->_phubbingSessions;
    v5->_phubbingSessions = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXPhubbingEvents phubbingSessions](self, "phubbingSessions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("phubbingSessions"));

}

- (ATXPhubbingEvents)initWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ATXPhubbingEvents *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_usage_insights();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("phubbingSessions"), v6, 0, CFSTR("com.apple.proactive.UsageInsights"), -1, v9, v14[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    self = -[ATXPhubbingEvents initWithPhubbingSessions:](self, "initWithPhubbingSessions:", v10);
    v12 = self;
  }

  return v12;
}

- (NSArray)phubbingSessions
{
  return self->_phubbingSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phubbingSessions, 0);
}

@end
