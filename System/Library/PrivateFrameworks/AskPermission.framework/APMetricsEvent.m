@implementation APMetricsEvent

- (APMetricsEvent)initWithAccount:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  APMetricsEvent *v10;
  APMetricsEvent *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "metricsTopic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metricsApp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)APMetricsEvent;
  v10 = -[APMetricsEvent initWithTopic:](&v22, sel_initWithTopic_, v8);
  v11 = v10;
  if (v10)
  {
    -[APMetricsEvent setEventVersion:](v10, "setEventVersion:", &unk_24DB1D738);
    -[APMetricsEvent setProperty:forBodyKey:](v11, "setProperty:forBodyKey:", v9, CFSTR("app"));
    objc_msgSend(v6, "ams_DSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[APMetricsEvent setProperty:forBodyKey:](v11, "setProperty:forBodyKey:", v12, CFSTR("dsId"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "isAuthenticated"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[APMetricsEvent setProperty:forBodyKey:](v11, "setProperty:forBodyKey:", v14, CFSTR("isSignedIn"));

    objc_msgSend(v7, "itemIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[APMetricsEvent setProperty:forBodyKey:](v11, "setProperty:forBodyKey:", v15, CFSTR("pageId"));

    objc_msgSend(MEMORY[0x24BE08118], "operatingSystem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[APMetricsEvent setProperty:forBodyKey:](v11, "setProperty:forBodyKey:", v16, CFSTR("os"));

    objc_msgSend(MEMORY[0x24BE08118], "buildVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[APMetricsEvent setProperty:forBodyKey:](v11, "setProperty:forBodyKey:", v17, CFSTR("osBuildNumber"));

    objc_msgSend(v6, "ams_storefront");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = CFSTR("Unknown");
    -[APMetricsEvent setProperty:forBodyKey:](v11, "setProperty:forBodyKey:", v20, CFSTR("storeFrontHeader"));

  }
  return v11;
}

+ (id)metricsEventWithAccount:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  APMetricsEvent *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "lineOfBusiness") == 1)
  {
    v8 = (void *)MEMORY[0x24BE08280];
    objc_msgSend(MEMORY[0x24BE08050], "sharedBag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifierForAccount:bag:bagNamespace:keyName:", v6, v9, CFSTR("APPSTORE_ENGAGEMENT_CLIENT"), CFSTR("clientId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BE08280];
    objc_msgSend(MEMORY[0x24BE08050], "sharedBag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifierForAccount:bag:bagNamespace:keyName:", v6, v12, CFSTR("APPSTORE_ENGAGEMENT"), CFSTR("userId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __50__APMetricsEvent_metricsEventWithAccount_request___block_invoke;
    v19[3] = &unk_24DB1AF60;
    v23 = a1;
    v20 = v6;
    v21 = v7;
    v22 = v13;
    v14 = v13;
    objc_msgSend(v10, "continueWithBlock:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x24BE08340];
    v17 = -[APMetricsEvent initWithAccount:request:]([APMetricsEvent alloc], "initWithAccount:request:", v6, v7);
    objc_msgSend(v16, "promiseWithResult:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

id __50__APMetricsEvent_metricsEventWithAccount_request___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  APMetricsEvent *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  APMetricsEvent *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = (id)objc_opt_class();
      v25 = 2112;
      v26 = v6;
      v10 = v24;
      _os_log_impl(&dword_2195F6000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Error loading Metrics clientID: %@", buf, 0x16u);

    }
    v11 = (void *)MEMORY[0x24BE08340];
    v12 = -[APMetricsEvent initWithAccount:request:]([APMetricsEvent alloc], "initWithAccount:request:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(v11, "promiseWithResult:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v7)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = (id)objc_opt_class();
      v25 = 2112;
      v26 = v5;
      v15 = v24;
      _os_log_impl(&dword_2195F6000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Loaded Metrics clientID: %@", buf, 0x16u);

    }
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __50__APMetricsEvent_metricsEventWithAccount_request___block_invoke_30;
    v18[3] = &unk_24DB1AF60;
    v16 = *(void **)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 56);
    v19 = (APMetricsEvent *)*(id *)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    v21 = v5;
    objc_msgSend(v16, "continueWithBlock:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v19;
  }

  return v13;
}

id __50__APMetricsEvent_metricsEventWithAccount_request___block_invoke_30(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  APMetricsEvent *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v18 = 138543618;
      *(_QWORD *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v6;
      v10 = *(id *)&v18[4];
      _os_log_impl(&dword_2195F6000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Error loading Metrics userID: %@", v18, 0x16u);

    }
    v11 = (void *)MEMORY[0x24BE08340];
    v12 = -[APMetricsEvent initWithAccount:request:]([APMetricsEvent alloc], "initWithAccount:request:", a1[4], a1[5]);
    v13 = v11;
  }
  else
  {
    if (!v7)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v18 = 138543618;
      *(_QWORD *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v5;
      v15 = *(id *)&v18[4];
      _os_log_impl(&dword_2195F6000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Loaded Metrics userID: %@", v18, 0x16u);

    }
    v12 = -[APMetricsEvent initWithAccount:request:]([APMetricsEvent alloc], "initWithAccount:request:", a1[4], a1[5]);
    -[APMetricsEvent setProperty:forBodyKey:](v12, "setProperty:forBodyKey:", 0, CFSTR("dsId"));
    -[APMetricsEvent setProperty:forBodyKey:](v12, "setProperty:forBodyKey:", v5, CFSTR("userId"));
    -[APMetricsEvent setProperty:forBodyKey:](v12, "setProperty:forBodyKey:", a1[6], CFSTR("clientId"));
    v13 = (void *)MEMORY[0x24BE08340];
  }
  objc_msgSend(v13, "promiseWithResult:", v12, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
