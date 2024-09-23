@implementation HFAnalyticsAutomationNewNameAssignedEvent

- (HFAnalyticsAutomationNewNameAssignedEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  HFAnalyticsAutomationNewNameAssignedEvent *v17;
  HFAnalyticsAutomationNewNameAssignedEvent *v18;
  objc_super v20;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("didNamingSucceedKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorTypeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modifiesExisitingTriggerKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("namingTypeKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  v20.receiver = self;
  v20.super_class = (Class)HFAnalyticsAutomationNewNameAssignedEvent;
  v17 = -[HFAnalyticsEvent initWithEventType:](&v20, sel_initWithEventType_, 24);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_didNamingSucceed, v6);
    objc_storeStrong((id *)&v18->_errorType, v9);
    objc_storeStrong((id *)&v18->_modifiesExistingTrigger, v12);
    objc_storeStrong((id *)&v18->_namingType, v15);
  }

  return v18;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsAutomationNewNameAssignedEvent;
  -[HFAnalyticsEvent payload](&v10, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsAutomationNewNameAssignedEvent didNamingSucceed](self, "didNamingSucceed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("didNamingSucceed"));

  -[HFAnalyticsAutomationNewNameAssignedEvent errorType](self, "errorType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("errorType"));

  -[HFAnalyticsAutomationNewNameAssignedEvent modifiesExistingTrigger](self, "modifiesExistingTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("modifiesExistingTrigger"));

  -[HFAnalyticsAutomationNewNameAssignedEvent namingType](self, "namingType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("namingType"));

  return v4;
}

- (NSNumber)didNamingSucceed
{
  return self->_didNamingSucceed;
}

- (void)setDidNamingSucceed:(id)a3
{
  objc_storeStrong((id *)&self->_didNamingSucceed, a3);
}

- (NSNumber)errorType
{
  return self->_errorType;
}

- (void)setErrorType:(id)a3
{
  objc_storeStrong((id *)&self->_errorType, a3);
}

- (NSNumber)modifiesExistingTrigger
{
  return self->_modifiesExistingTrigger;
}

- (void)setModifiesExistingTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_modifiesExistingTrigger, a3);
}

- (NSNumber)namingType
{
  return self->_namingType;
}

- (void)setNamingType:(id)a3
{
  objc_storeStrong((id *)&self->_namingType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namingType, 0);
  objc_storeStrong((id *)&self->_modifiesExistingTrigger, 0);
  objc_storeStrong((id *)&self->_errorType, 0);
  objc_storeStrong((id *)&self->_didNamingSucceed, 0);
}

@end
