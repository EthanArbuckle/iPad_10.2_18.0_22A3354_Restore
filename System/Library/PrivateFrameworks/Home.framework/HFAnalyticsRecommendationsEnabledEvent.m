@implementation HFAnalyticsRecommendationsEnabledEvent

- (HFAnalyticsRecommendationsEnabledEvent)initWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  HFAnalyticsRecommendationsEnabledEvent *v29;
  double v30;
  id v32;
  id v33;
  id obj;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v42;
  objc_super v43;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
    NSLog(CFSTR("Error: HFAnalyticsDataEnabledKey is nil"));
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("success"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (!v9)
    NSLog(CFSTR("Error: HFAnalyticsDataSuccessKey is nil"));
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rank"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (!v12)
    NSLog(CFSTR("Error: HFAnalyticsDataRankKey is nil"));
  v42 = v12;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rankInt"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (!v15)
    NSLog(CFSTR("Error: HFAnalyticsDataRankIntKey is nil"));
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rankVersion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v39 = v17;

  v40 = v15;
  if (!v15)
    NSLog(CFSTR("Error: HFAnalyticsDataRankVersionKey is nil"));
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("serviceType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  obj = v19;
  v38 = v19;

  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessoryCategory"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v33 = v21;
  v37 = v21;

  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("source"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v32 = v23;
  v36 = v23;

  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("presentationContext"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v24;
  else
    v25 = 0;
  v35 = v25;

  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("configurationType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  v43.receiver = self;
  v43.super_class = (Class)HFAnalyticsRecommendationsEnabledEvent;
  v29 = -[HFAnalyticsEvent initWithEventType:](&v43, sel_initWithEventType_, 14);
  if (v29)
  {
    v29->_enabled = objc_msgSend(v6, "BOOLValue");
    v29->_success = objc_msgSend(v9, "BOOLValue");
    objc_msgSend(v42, "doubleValue");
    v29->_rank = v30;
    v29->_rankInt = objc_msgSend(v40, "intValue");
    v29->_rankVersion = objc_msgSend(v39, "intValue");
    objc_storeStrong((id *)&v29->_serviceType, obj);
    objc_storeStrong((id *)&v29->_accessoryCategory, v33);
    objc_storeStrong((id *)&v29->_source, v32);
    objc_storeStrong((id *)&v29->_presentationContext, v25);
    objc_storeStrong((id *)&v29->_configurationType, v27);
  }

  return v29;
}

- (id)payload
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HFAnalyticsRecommendationsEnabledEvent;
  -[HFAnalyticsEvent payload](&v22, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsRecommendationsEnabledEvent enabled](self, "enabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("enabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsRecommendationsEnabledEvent success](self, "success"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("success"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HFAnalyticsRecommendationsEnabledEvent rank](self, "rank");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("rank"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HFAnalyticsRecommendationsEnabledEvent rankInt](self, "rankInt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("rankInt"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HFAnalyticsRecommendationsEnabledEvent rankVersion](self, "rankVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("rankVersion"));

  -[HFAnalyticsRecommendationsEnabledEvent serviceType](self, "serviceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HFAnalyticsRecommendationsEnabledEvent serviceType](self, "serviceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("serviceType"));

  }
  -[HFAnalyticsRecommendationsEnabledEvent accessoryCategory](self, "accessoryCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HFAnalyticsRecommendationsEnabledEvent accessoryCategory](self, "accessoryCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("accessoryCategory"));

  }
  -[HFAnalyticsRecommendationsEnabledEvent source](self, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HFAnalyticsRecommendationsEnabledEvent source](self, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("source"));

  }
  -[HFAnalyticsRecommendationsEnabledEvent presentationContext](self, "presentationContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HFAnalyticsRecommendationsEnabledEvent presentationContext](self, "presentationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("presentationContext"));

  }
  -[HFAnalyticsRecommendationsEnabledEvent configurationType](self, "configurationType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[HFAnalyticsRecommendationsEnabledEvent configurationType](self, "configurationType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("configurationType"));

  }
  return v4;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (double)rank
{
  return self->_rank;
}

- (void)setRank:(double)a3
{
  self->_rank = a3;
}

- (int)rankInt
{
  return self->_rankInt;
}

- (void)setRankInt:(int)a3
{
  self->_rankInt = a3;
}

- (int)rankVersion
{
  return self->_rankVersion;
}

- (void)setRankVersion:(int)a3
{
  self->_rankVersion = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryCategory, a3);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (NSString)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(id)a3
{
  objc_storeStrong((id *)&self->_configurationType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationType, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end
