@implementation HFAnalyticsGeneralButtonTapEvent

- (HFAnalyticsGeneralButtonTapEvent)initWithData:(id)a3
{
  id v4;
  HFAnalyticsGeneralButtonTapEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *processName;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  __CFString *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HFAnalyticsGeneralButtonTapEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v17, sel_initWithEventType_, 43);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&v5->_buttonTitle, v7);

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v9 = objc_claimAutoreleasedReturnValue();
    processName = v5->_processName;
    v5->_processName = (NSString *)v9;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("nil");
    }
    objc_storeStrong((id *)&v5->_sourceViewControllerClassName, v15);
    if (v13)

  }
  return v5;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsGeneralButtonTapEvent;
  -[HFAnalyticsEvent payload](&v9, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsGeneralButtonTapEvent buttonTitle](self, "buttonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("item"));

  -[HFAnalyticsGeneralButtonTapEvent processName](self, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("processName"));

  -[HFAnalyticsGeneralButtonTapEvent sourceViewControllerClassName](self, "sourceViewControllerClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("sourceViewController"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CCC70, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTitle, a3);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (NSString)sourceViewControllerClassName
{
  return self->_sourceViewControllerClassName;
}

- (void)setSourceViewControllerClassName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end
