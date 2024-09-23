@implementation AMSPushHandler

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSPushHandler configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (AMSPushHandler)initWithConfiguration:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  AMSPushHandler *v8;
  AMSPushConfiguration *v9;
  AMSPushConfiguration *configuration;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPushHandler;
  v8 = -[AMSPushHandler init](&v12, sel_init);
  if (v8)
  {
    if (v6)
      v9 = (AMSPushConfiguration *)v6;
    else
      v9 = objc_alloc_init(AMSPushConfiguration);
    configuration = v8->_configuration;
    v8->_configuration = v9;

    objc_storeStrong((id *)&v8->_bag, a4);
    -[AMSPushHandler registerForEngagementPushes](v8, "registerForEngagementPushes");
  }

  return v8;
}

- (void)registerForEngagementPushes
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  int v17;
  id v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!+[AMSProcessInfo hasAMSEntitlement](AMSProcessInfo, "hasAMSEntitlement"))
  {
    +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEBUG, "Current process is attempting to register for engagement pushes but does not have the com.apple.private.applemediaservices entitlement; rejecting",
        (uint8_t *)&v17,
        2u);
    }
    goto LABEL_21;
  }
  -[AMSPushHandler configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enabledActionTypes");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_10;
  }
  v5 = (void *)v4;
  -[AMSPushHandler configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enabledActionTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("35"));

  if (v8)
  {
LABEL_10:
    -[AMSPushHandler configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "engagementPushTopic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(CFSTR("com.apple.AppleMediaServices.pushhandler."), "stringByAppendingString:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObserver:selector:name:object:suspensionBehavior:](v12, "addObserver:selector:name:object:suspensionBehavior:", self, sel__handlePushNotification_, v10, 0, 4);
      +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543618;
        v18 = (id)objc_opt_class();
        v19 = 2114;
        v20 = v10;
        v15 = v18;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered for pushes with service name %{public}@", (uint8_t *)&v17, 0x16u);

      }
    }
    else
    {
      +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v10, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = (id)objc_opt_class();
        v16 = v18;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: No engagment topic provided; will not register for engagement pushes.",
          (uint8_t *)&v17,
          0xCu);

      }
    }

LABEL_21:
  }
}

- (AMSPushConfiguration)configuration
{
  return self->_configuration;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AMSPushHandler;
  -[AMSPushHandler dealloc](&v4, sel_dealloc);
}

- (AMSPushHandlerDelegate)delegate
{
  void *v2;
  void *v3;

  -[AMSPushHandler configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSPushHandlerDelegate *)v3;
}

- (void)handleNotification:(id)a3
{
  id v4;
  AMSPushPayload *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[AMSPushPayload initWithPayload:]([AMSPushPayload alloc], "initWithPayload:", v4);
    if (os_variant_has_internal_content()
      && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v4))
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
        +[AMSLogConfig sharedConfigOversize](AMSLogConfig, "sharedConfigOversize");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "OSLogObject");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (void *)objc_opt_class();
          v11 = v10;
          -[AMSPushPayload logKey](v5, "logKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 138543874;
          v36 = (uint64_t)v10;
          v37 = 2114;
          v38 = v12;
          v39 = 2114;
          v40 = v7;
          _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received payload: %{public}@", (uint8_t *)&v35, 0x20u);

        }
      }

    }
    -[AMSPushHandler enabledParsables](self, "enabledParsables");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPushPayload actionType](v5, "actionType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", v14);

    if (v15)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = objc_msgSend(v15, "shouldSkipAccountCheck") ^ 1;
      else
        v16 = 1;
      -[AMSPushPayload account](v5, "account");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isActive");

      +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
      v28 = objc_claimAutoreleasedReturnValue();
      v17 = v28;
      if (v27 || !v16)
      {
        if (!v28)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v17 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v17, "OSLogObject");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = (void *)objc_opt_class();
          v32 = v31;
          -[AMSPushPayload logKey](v5, "logKey");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSPushPayload actionType](v5, "actionType");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 138544130;
          v36 = (uint64_t)v31;
          v37 = 2114;
          v38 = v33;
          v39 = 2114;
          v40 = v34;
          v41 = 2114;
          v42 = v15;
          _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling notification of type: %{public}@ class: %{public}@", (uint8_t *)&v35, 0x2Au);

        }
        -[AMSPushHandler configuration](self, "configuration");
        v17 = objc_claimAutoreleasedReturnValue();
        -[AMSPushHandler bag](self, "bag");
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleNotificationPayload:config:bag:", v5, v17, v18);
        goto LABEL_35;
      }
      if (!v28)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_35:

        goto LABEL_36;
      }
      v29 = (void *)objc_opt_class();
      v20 = v29;
      -[AMSPushPayload logKey](v5, "logKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPushPayload account](v5, "account");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543874;
      v36 = (uint64_t)v29;
      v37 = 2114;
      v38 = v21;
      v39 = 2114;
      v40 = v22;
      v23 = "%{public}@: [%{public}@] Ignoring notification for inactive account: %{public}@";
      v24 = v18;
      v25 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_35;
      v19 = (void *)objc_opt_class();
      v20 = v19;
      -[AMSPushPayload logKey](v5, "logKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPushPayload actionType](v5, "actionType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543874;
      v36 = (uint64_t)v19;
      v37 = 2114;
      v38 = v21;
      v39 = 2048;
      v40 = v22;
      v23 = "%{public}@: [%{public}@] Unable to handle notification with action type: %ld";
      v24 = v18;
      v25 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_18C849000, v24, v25, v23, (uint8_t *)&v35, 0x20u);

    goto LABEL_35;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (AMSPushPayload *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (AMSPushPayload *)objc_claimAutoreleasedReturnValue();
  }
  -[AMSPushPayload OSLogObject](v5, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v35 = 138543362;
    v36 = objc_opt_class();
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Received nil payload", (uint8_t *)&v35, 0xCu);
  }
LABEL_36:

}

- (BOOL)shouldHandleNotification:(id)a3
{
  id v4;
  AMSPushPayload *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = -[AMSPushPayload initWithPayload:]([AMSPushPayload alloc], "initWithPayload:", v4);

  -[AMSPushHandler enabledParsables](self, "enabledParsables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPushPayload actionType](v5, "actionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "objectForKeyedSubscript:", v7) != 0;

  return v8;
}

- (NSDictionary)enabledParsables
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("1");
  v21[0] = objc_opt_class();
  v20[1] = CFSTR("35");
  v21[1] = objc_opt_class();
  v20[2] = CFSTR("25");
  v21[2] = objc_opt_class();
  v20[3] = CFSTR("4");
  v21[3] = objc_opt_class();
  v20[4] = CFSTR("22");
  v21[4] = objc_opt_class();
  v20[5] = CFSTR("40");
  v21[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPushHandler configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledActionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v3, "objectForKeyedSubscript:", v12, (_QWORD)v15))
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v12), v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = (id)objc_msgSend(v3, "mutableCopy");
  }
  v13 = (void *)objc_msgSend(v6, "copy", (_QWORD)v15);

  return (NSDictionary *)v13;
}

- (void)_handlePushNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSPushHandler handleNotification:](self, "handleNotification:", v4);

}

- (AMSPushHandler)initWithConfiguration:(id)a3 bagContract:(id)a4
{
  id v7;
  id v8;
  AMSPushHandler *v9;
  AMSPushHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPushHandler;
  v9 = -[AMSPushHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_bagContract, a4);
  }

  return v10;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSPushHandlerContract)bagContract
{
  return self->_bagContract;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagContract, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
