@implementation AMSUIWebMetricsEvent

- (AMSUIWebMetricsEvent)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  AMSUIWebMetricsEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  AMSUIWebMetricsEvent *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    v29.receiver = self;
    v29.super_class = (Class)AMSUIWebMetricsEvent;
    v10 = -[AMSUIWebMetricsEvent initWithTopic:](&v29, sel_initWithTopic_, v9);
    if (v10)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "iTunesAccountFromJSAccount:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebMetricsEvent setAccount:](v10, "setAccount:", v12);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("checkDiagnosticsAndUsageSetting"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("checkDiagnosticsAndUsageSetting"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIWebMetricsEvent setCheckDiagnosticsAndUsageSetting:](v10, "setCheckDiagnosticsAndUsageSetting:", objc_msgSend(v14, "BOOLValue"));

      }
      else
      {
        -[AMSUIWebMetricsEvent setCheckDiagnosticsAndUsageSetting:](v10, "setCheckDiagnosticsAndUsageSetting:", 0);
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("anonymous"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("anonymous"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIWebMetricsEvent setAnonymous:](v10, "setAnonymous:", objc_msgSend(v21, "BOOLValue"));

      }
      else
      {
        -[AMSUIWebMetricsEvent setAnonymous:](v10, "setAnonymous:", 0);
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suppressEngagement"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suppressEngagement"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIWebMetricsEvent setSuppressEngagement:](v10, "setSuppressEngagement:", objc_msgSend(v23, "BOOLValue"));

      }
      else
      {
        -[AMSUIWebMetricsEvent setSuppressEngagement:](v10, "setSuppressEngagement:", 0);
      }

      objc_msgSend(v7, "metricsOverlay");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v7, "metricsOverlay");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIWebMetricsEvent addPropertiesWithDictionary:](v10, "addPropertiesWithDictionary:", v25);

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fields"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;

      if (v27)
        -[AMSUIWebMetricsEvent addPropertiesWithDictionary:](v10, "addPropertiesWithDictionary:", v27);

    }
    self = v10;
    v19 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v17;
      v32 = 2114;
      v33 = v18;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Metrics event does not contain topic: %@", buf, 0x20u);

    }
    v19 = 0;
  }

  return v19;
}

@end
