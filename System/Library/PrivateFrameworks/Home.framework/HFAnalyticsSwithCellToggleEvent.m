@implementation HFAnalyticsSwithCellToggleEvent

- (HFAnalyticsSwithCellToggleEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  HFAnalyticsSwithCellToggleEvent *v11;
  void *v12;
  void *v13;
  id v14;
  NSString *v15;
  NSString *itemClassName;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *toggleTitle;
  void *v24;
  void *v25;
  id v26;
  NSString *v27;
  __CFString *sourceViewControllerClassName;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  NSString *processName;
  objc_super v34;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("switchCellIsOn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("HFAnalyticsDataSwitchCellIsOnKey NSNumber is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v34.receiver = self;
  v34.super_class = (Class)HFAnalyticsSwithCellToggleEvent;
  v11 = -[HFAnalyticsEvent initWithEventType:](&v34, sel_initWithEventType_, 40);
  if (v11)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overrideItemClassName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (objc_msgSend(v14, "length"))
    {
      v15 = (NSString *)v14;
      itemClassName = v11->_itemClassName;
      v11->_itemClassName = v15;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = objc_claimAutoreleasedReturnValue();
      itemClassName = v11->_itemClassName;
      v11->_itemClassName = (NSString *)v21;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("switchCellToggleTitle"));
    v22 = objc_claimAutoreleasedReturnValue();
    toggleTitle = v11->_toggleTitle;
    v11->_toggleTitle = (NSString *)v22;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceViewControllerOverrideClassName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    if (objc_msgSend(v26, "length"))
    {
      v27 = (NSString *)v26;
      sourceViewControllerClassName = (__CFString *)v11->_sourceViewControllerClassName;
      v11->_sourceViewControllerClassName = v27;
    }
    else
    {
      if (v10)
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        sourceViewControllerClassName = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sourceViewControllerClassName = CFSTR("nil");
      }
      objc_storeStrong((id *)&v11->_sourceViewControllerClassName, sourceViewControllerClassName);
      if (!v10)
        goto LABEL_29;
    }

LABEL_29:
    objc_storeStrong((id *)&v11->_isOn, v6);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "processName");
    v31 = objc_claimAutoreleasedReturnValue();
    processName = v11->_processName;
    v11->_processName = (NSString *)v31;

  }
  return v11;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsSwithCellToggleEvent;
  -[HFAnalyticsEvent payload](&v11, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsSwithCellToggleEvent itemClassName](self, "itemClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("item"));

  -[HFAnalyticsSwithCellToggleEvent toggleTitle](self, "toggleTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("switchCellToggleTitle"));

  -[HFAnalyticsSwithCellToggleEvent sourceViewControllerClassName](self, "sourceViewControllerClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("sourceViewController"));

  -[HFAnalyticsSwithCellToggleEvent isOn](self, "isOn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("switchCellIsOn"));

  -[HFAnalyticsSwithCellToggleEvent processName](self, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v9, CFSTR("processName"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CC460, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSString)itemClassName
{
  return self->_itemClassName;
}

- (void)setItemClassName:(id)a3
{
  objc_storeStrong((id *)&self->_itemClassName, a3);
}

- (NSString)sourceViewControllerClassName
{
  return self->_sourceViewControllerClassName;
}

- (void)setSourceViewControllerClassName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, a3);
}

- (NSString)toggleTitle
{
  return self->_toggleTitle;
}

- (void)setToggleTitle:(id)a3
{
  objc_storeStrong((id *)&self->_toggleTitle, a3);
}

- (NSNumber)isOn
{
  return self->_isOn;
}

- (void)setIsOn:(id)a3
{
  objc_storeStrong((id *)&self->_isOn, a3);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_isOn, 0);
  objc_storeStrong((id *)&self->_toggleTitle, 0);
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_itemClassName, 0);
}

@end
