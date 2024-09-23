@implementation ATXUsageInsightsAppSessionEvent

- (ATXUsageInsightsAppSessionEvent)initWithBundleID:(id)a3 category:(unint64_t)a4 launchReason:(id)a5 startTime:(id)a6 endTime:(id)a7 duration:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXUsageInsightsAppSessionEvent *v18;
  uint64_t v19;
  NSString *bundleID;
  uint64_t v21;
  NSString *launchReason;
  objc_super v24;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ATXUsageInsightsAppSessionEvent;
  v18 = -[ATXUsageInsightsAppSessionEvent init](&v24, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    bundleID = v18->_bundleID;
    v18->_bundleID = (NSString *)v19;

    v18->_category = a4;
    v21 = objc_msgSend(v15, "copy");
    launchReason = v18->_launchReason;
    v18->_launchReason = (NSString *)v21;

    objc_storeStrong((id *)&v18->_startTime, a6);
    objc_storeStrong((id *)&v18->_endTime, a7);
    v18->_duration = a8;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ATXUsageInsightsAppSessionEvent bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("bundleID"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXUsageInsightsAppSessionEvent category](self, "category"), CFSTR("category"));
  -[ATXUsageInsightsAppSessionEvent launchReason](self, "launchReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("launchReason"));

  -[ATXUsageInsightsAppSessionEvent startTime](self, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("startTime"));

  -[ATXUsageInsightsAppSessionEvent endTime](self, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("endTime"));

  -[ATXUsageInsightsAppSessionEvent duration](self, "duration");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("duration"));

}

- (ATXUsageInsightsAppSessionEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  ATXUsageInsightsAppSessionEvent *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
  v11 = v10;

  v12 = -[ATXUsageInsightsAppSessionEvent initWithBundleID:category:launchReason:startTime:endTime:duration:](self, "initWithBundleID:category:launchReason:startTime:endTime:duration:", v5, v6, v7, v8, v9, v11);
  return v12;
}

- (NSDate)eventTime
{
  return self->_startTime;
}

+ (id)usageInsightsAppLaunchReasonFromBMAppInFocus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.SpringBoard.transitionReason")))
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastObject");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = v4;
    }
  }
  else
  {
    v6 = CFSTR("Unknown");
  }

  return v6;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
