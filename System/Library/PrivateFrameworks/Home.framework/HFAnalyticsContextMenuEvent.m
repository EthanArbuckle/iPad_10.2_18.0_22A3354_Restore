@implementation HFAnalyticsContextMenuEvent

- (HFAnalyticsContextMenuEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFAnalyticsContextMenuEvent *v7;
  void *v8;
  void *v9;
  id v10;
  NSString *v11;
  NSString *itemClassName;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *processName;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSString *v27;
  __CFString *sourceViewControllerClassName;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v35;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextMenuTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (!v6)
    NSLog(CFSTR("HFAnalyticsDataContextMenuTitleKey contextMenuTitle is nil"));
  v35.receiver = self;
  v35.super_class = (Class)HFAnalyticsContextMenuEvent;
  v7 = -[HFAnalyticsEvent initWithEventType:](&v35, sel_initWithEventType_, 36);
  if (v7)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overrideItemClassName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (objc_msgSend(v10, "length"))
    {
      v11 = (NSString *)v10;
      itemClassName = v7->_itemClassName;
      v7->_itemClassName = v11;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = objc_claimAutoreleasedReturnValue();
      itemClassName = v7->_itemClassName;
      v7->_itemClassName = (NSString *)v17;
    }

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "processName");
    v19 = objc_claimAutoreleasedReturnValue();
    processName = v7->_processName;
    v7->_processName = (NSString *)v19;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

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
      sourceViewControllerClassName = (__CFString *)v7->_sourceViewControllerClassName;
      v7->_sourceViewControllerClassName = v27;
    }
    else
    {
      if (v23)
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        sourceViewControllerClassName = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sourceViewControllerClassName = CFSTR("nil");
      }
      objc_storeStrong((id *)&v7->_sourceViewControllerClassName, sourceViewControllerClassName);
      if (!v23)
        goto LABEL_29;
    }

LABEL_29:
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dashboardContextType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
    objc_storeStrong((id *)&v7->_contextType, v31);

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextMenuTitle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
    objc_storeStrong((id *)&v7->_contextMenuTitle, v33);

  }
  return v7;
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
  v11.super_class = (Class)HFAnalyticsContextMenuEvent;
  -[HFAnalyticsEvent payload](&v11, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsContextMenuEvent itemClassName](self, "itemClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("item"));

  -[HFAnalyticsContextMenuEvent processName](self, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("processName"));

  -[HFAnalyticsContextMenuEvent sourceViewControllerClassName](self, "sourceViewControllerClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("sourceViewController"));

  -[HFAnalyticsContextMenuEvent contextType](self, "contextType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("dashboardContext"));

  -[HFAnalyticsContextMenuEvent contextMenuTitle](self, "contextMenuTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v9, CFSTR("contextMenuTitle"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CC2C8, CFSTR("homeAppEventCount"));
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

- (NSString)contextType
{
  return self->_contextType;
}

- (void)setContextType:(id)a3
{
  objc_storeStrong((id *)&self->_contextType, a3);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (NSString)contextMenuTitle
{
  return self->_contextMenuTitle;
}

- (void)setContextMenuTitle:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuTitle, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_itemClassName, 0);
}

@end
