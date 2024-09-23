@implementation ATXAppSessionEventMetric

- (id)metricName
{
  return CFSTR("com.apple.ModeActivity.AppSession.event");
}

- (ATXAppSessionEventMetric)initWithDimensions:(id)a3 bundleId:(id)a4 interruptingAppBundleId:(id)a5 duration:(double)a6
{
  id v11;
  id v12;
  ATXAppSessionEventMetric *v13;
  ATXAppSessionEventMetric *v14;
  NSString **p_appBundleId;
  uint64_t v16;
  NSNumber *appCategory;
  uint64_t v18;
  NSNumber *interruptingAppCategory;
  objc_super v21;

  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXAppSessionEventMetric;
  v13 = -[_ATXCoreAnalyticsMetric initWithDimensions:](&v21, sel_initWithDimensions_, a3);
  v14 = v13;
  if (v13)
  {
    p_appBundleId = &v13->_appBundleId;
    objc_storeStrong((id *)&v13->_appBundleId, a4);
    objc_storeStrong((id *)&v14->_interruptingAppBundleId, a5);
    if (*p_appBundleId)
    {
      +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:");
      v16 = objc_claimAutoreleasedReturnValue();
      appCategory = v14->_appCategory;
      v14->_appCategory = (NSNumber *)v16;

    }
    if (v14->_interruptingAppBundleId)
    {
      +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:");
      v18 = objc_claimAutoreleasedReturnValue();
      interruptingAppCategory = v14->_interruptingAppCategory;
      v14->_interruptingAppCategory = (NSNumber *)v18;

    }
    v14->_appSessionDuration = a6;
  }

  return v14;
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("appBundleId");
  -[ATXAppSessionEventMetric appBundleId](self, "appBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v4;
  v15[1] = CFSTR("appCategory");
  -[ATXAppSessionEventMetric appCategory](self, "appCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v6;
  v15[2] = CFSTR("interruptingAppBundleId");
  -[ATXAppSessionEventMetric interruptingAppBundleId](self, "interruptingAppBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v8;
  v15[3] = CFSTR("interruptingAppCategory");
  -[ATXAppSessionEventMetric interruptingAppCategory](self, "interruptingAppCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[3] = v10;
  v15[4] = CFSTR("duration");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppSessionEventMetric appSessionDuration](self, "appSessionDuration");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  if (!v7)

  if (!v5)
  if (!v3)

  return v13;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (NSNumber)appCategory
{
  return self->_appCategory;
}

- (NSString)interruptingAppBundleId
{
  return self->_interruptingAppBundleId;
}

- (NSNumber)interruptingAppCategory
{
  return self->_interruptingAppCategory;
}

- (double)appSessionDuration
{
  return self->_appSessionDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptingAppCategory, 0);
  objc_storeStrong((id *)&self->_interruptingAppBundleId, 0);
  objc_storeStrong((id *)&self->_appCategory, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
