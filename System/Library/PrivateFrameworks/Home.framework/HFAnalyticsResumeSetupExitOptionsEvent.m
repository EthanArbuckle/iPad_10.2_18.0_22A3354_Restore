@implementation HFAnalyticsResumeSetupExitOptionsEvent

- (HFAnalyticsResumeSetupExitOptionsEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  HFAnalyticsResumeSetupExitOptionsEvent *v11;
  HFAnalyticsResumeSetupExitOptionsEvent *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessoryCategoryType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resumeSetupSelectedOption"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsResumeSetupExitOptionsEvent;
  v11 = -[HFAnalyticsEvent initWithEventType:](&v14, sel_initWithEventType_, 28);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accessoryType, v6);
    objc_storeStrong((id *)&v12->_resumeSetupOption, v9);
  }

  return v12;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsResumeSetupExitOptionsEvent;
  -[HFAnalyticsEvent payload](&v8, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsResumeSetupExitOptionsEvent accessoryType](self, "accessoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("accessory"));

  -[HFAnalyticsResumeSetupExitOptionsEvent resumeSetupOption](self, "resumeSetupOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("optionSelected"));

  return v4;
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryType, a3);
}

- (NSNumber)resumeSetupOption
{
  return self->_resumeSetupOption;
}

- (void)setResumeSetupOption:(id)a3
{
  objc_storeStrong((id *)&self->_resumeSetupOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeSetupOption, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
}

@end
