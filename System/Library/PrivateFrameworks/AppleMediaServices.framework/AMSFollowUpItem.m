@implementation AMSFollowUpItem

- (AMSFollowUpItem)initWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5
{
  id v9;
  id v10;
  AMSFollowUpItem *v11;
  AMSFollowUpItem *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *metricsQueue;
  NSMutableDictionary *v17;
  NSMutableDictionary *userInfo;
  void *v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AMSFollowUpItem;
  v11 = -[AMSFollowUpItem init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a4);
    objc_storeStrong((id *)&v12->_identifier, a3);
    v13 = dispatch_queue_create("com.apple.AppleMediaServices.FollowUpItem", 0);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_create("com.apple.AppleMediaServices.FollowUpItemMetrics", 0);
    metricsQueue = v12->_metricsQueue;
    v12->_metricsQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v12->_userInfo;
    v12->_userInfo = v17;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_userInfo, "setObject:forKeyedSubscript:", v19, CFSTR("AMSPriority"));

  }
  return v12;
}

- (AMSFollowUpItem)initWithIdentifier:(id)a3 jsonDictionary:(id)a4 account:(id)a5 priority:(int64_t)a6 logKey:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  AMSFollowUpItem *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  NSString *bundleIconName;
  AMSMetricsEvent *v31;
  AMSMetricsEvent *metricsEvent;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  AMSFollowUpNotification *v38;
  AMSFollowUpNotification *notification;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  AMSFollowUpAction *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __CFString *v72;
  void *v73;
  id v74;
  void *v75;
  id obj;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("deviceGroup"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();
  v18 = v14;
  if ((v17 & 1) != 0)
  {
    if (objc_msgSend(v16, "BOOLValue"))
      v18 = 0;
    else
      v18 = v14;
  }
  v19 = -[AMSFollowUpItem initWithIdentifier:account:priority:](self, "initWithIdentifier:account:priority:", v12, v18, a6);
  if (v19)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("title"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (__CFString *)v20;
    else
      v22 = &stru_1E2548760;
    v72 = v22;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("text"));
    v77 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("expirationDateHidden"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v23;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = objc_msgSend(v23, "BOOLValue");
    else
      v24 = 0;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("expirationDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("footer"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("metrics"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v25;
    if (objc_msgSend(v25, "length"))
    {
      +[AMSFollowUpItem _dateFromString:](AMSFollowUpItem, "_dateFromString:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    v73 = v16;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("disableGrouping"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v27;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = objc_msgSend(v27, "BOOLValue");
    else
      v28 = 0;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("iconImageName"));
    v29 = objc_claimAutoreleasedReturnValue();
    bundleIconName = v19->_bundleIconName;
    v19->_bundleIconName = (NSString *)v29;

    v19->_expirationDateHidden = v24;
    v19->_disableGrouping = v28;
    objc_storeStrong((id *)&v19->_expirationDate, v26);
    objc_storeStrong((id *)&v19->_footer, obj);
    objc_storeStrong((id *)&v19->_informativeText, v77);
    objc_storeStrong((id *)&v19->_title, v22);
    -[AMSFollowUpItem setLogKey:](v19, "setLogKey:", v15);
    if (v75)
    {
      v31 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v75);
      metricsEvent = v19->_metricsEvent;
      v19->_metricsEvent = v31;

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("notification"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v34 = objc_msgSend(v33, "BOOLValue");
    else
      v34 = 0;
    -[AMSFollowUpItem setShouldPostNotification:](v19, "setShouldPostNotification:", v34);
    v35 = v33;
    objc_opt_class();
    v67 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v35;

      if (v36)
        goto LABEL_29;
    }
    else
    {

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("notificationOptions"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v36 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v36 = v37;

    if (!v36)
    {
LABEL_35:
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("hardwareOffer"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v46 = objc_msgSend(v45, "BOOLValue");
      else
        v46 = 0;
      v19->_hardwareOffer = v46;
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("newDeviceOutreach"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v48 = objc_msgSend(v47, "BOOLValue");
      else
        v48 = 0;
      v19->_newDeviceOutreach = v48;
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("omitBadge"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v49, "BOOLValue"))
        v19->_displayStyle |= 0x10uLL;
      v65 = v45;
      v69 = v26;
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("notificationOnly"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v50, "BOOLValue"))
        v19->_displayStyle |= 0x18uLL;
      v62 = v50;
      v63 = v49;
      v64 = v47;
      v66 = v36;
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("zeroAction"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v51, "BOOLValue"))
        v19->_displayStyle |= 2uLL;
      v60 = v51;
      v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("actions"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v79;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v79 != v56)
              objc_enumerationMutation(v53);
            v58 = -[AMSFollowUpAction initWithJSONDictionary:parentIdentifier:]([AMSFollowUpAction alloc], "initWithJSONDictionary:parentIdentifier:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i), v12, v60);
            -[AMSFollowUpAction setLogKey:](v58, "setLogKey:", v15);
            objc_msgSend(v52, "addObject:", v58);

          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
        }
        while (v55);
      }
      if (objc_msgSend(v52, "count", v60))
        objc_storeStrong((id *)&v19->_actions, v52);

      v14 = v74;
      v16 = v73;
      goto LABEL_60;
    }
LABEL_29:
    v38 = -[AMSFollowUpNotification initWithJSONDictionary:parentIdentifier:logKey:]([AMSFollowUpNotification alloc], "initWithJSONDictionary:parentIdentifier:logKey:", v36, v12, v15);
    notification = v19->_notification;
    v19->_notification = v38;

    -[AMSFollowUpItem title](v19, "title");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      -[AMSFollowUpItem title](v19, "title");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFollowUpItem notification](v19, "notification");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setTitle:", v41);

    }
    -[AMSFollowUpItem informativeText](v19, "informativeText");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v43)
      goto LABEL_35;
    -[AMSFollowUpItem informativeText](v19, "informativeText");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem notification](v19, "notification");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setInformativeText:", v37);

    goto LABEL_34;
  }
LABEL_60:

  return v19;
}

- (AMSFollowUpItem)initWithFollowUpItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  AMSFollowUpItem *v17;
  uint64_t v18;
  NSString *bundleIconName;
  uint64_t v20;
  NSString *informativeText;
  uint64_t v22;
  NSDate *expirationDate;
  uint64_t v24;
  NSString *footer;
  uint64_t v26;
  NSString *title;
  void *v28;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  id v32;
  AMSMetricsEvent *v33;
  AMSMetricsEvent *metricsEvent;
  void *v35;
  void *v36;
  uint64_t v37;
  NSMutableDictionary *userInfo;
  NSArray *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  AMSFollowUpAction *v45;
  NSArray *actions;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "componentsFromBackingIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ams_iTunesAccountWithDSID:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AMSLogKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      v50 = v15;
      AMSHashIfNeeded(0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v58 = v15;
      v8 = 0;
      v59 = 2114;
      v60 = v12;
      v61 = 2112;
      v62 = v16;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch account with DSID: %@", buf, 0x20u);

    }
    v10 = 0;
  }
  v17 = -[AMSFollowUpItem initWithIdentifier:account:priority:](self, "initWithIdentifier:account:priority:", v7, v10, 0);
  if (v17)
  {
    v48 = v10;
    v49 = v8;
    v17->_displayStyle = objc_msgSend(v4, "displayStyle");
    objc_msgSend(v4, "bundleIconName");
    v18 = objc_claimAutoreleasedReturnValue();
    bundleIconName = v17->_bundleIconName;
    v17->_bundleIconName = (NSString *)v18;

    objc_msgSend(v4, "informativeText");
    v20 = objc_claimAutoreleasedReturnValue();
    informativeText = v17->_informativeText;
    v17->_informativeText = (NSString *)v20;

    objc_msgSend(v4, "expirationDate");
    v22 = objc_claimAutoreleasedReturnValue();
    expirationDate = v17->_expirationDate;
    v17->_expirationDate = (NSDate *)v22;

    objc_msgSend(v4, "informativeFooterText");
    v24 = objc_claimAutoreleasedReturnValue();
    footer = v17->_footer;
    v17->_footer = (NSString *)v24;

    objc_msgSend(v4, "title");
    v26 = objc_claimAutoreleasedReturnValue();
    title = v17->_title;
    v17->_title = (NSString *)v26;

    objc_msgSend(v4, "userInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "userInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (NSMutableDictionary *)objc_msgSend(v29, "mutableCopy");

      -[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", CFSTR("AMSMetrics"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = v31;

        if (v32)
        {
          v33 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v32);
          metricsEvent = v17->_metricsEvent;
          v17->_metricsEvent = v33;

          -[NSMutableDictionary removeObjectForKey:](v30, "removeObjectForKey:", CFSTR("AMSMetrics"));
        }
      }
      else
      {

        v32 = 0;
      }
      getFLUserInfoPropertyDontDisplayDate();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v37 = objc_msgSend(v36, "BOOLValue");
      else
        v37 = 0;
      -[AMSFollowUpItem setExpirationDateHidden:](v17, "setExpirationDateHidden:", v37);
      userInfo = v17->_userInfo;
      v17->_userInfo = v30;

    }
    v51 = v5;
    v39 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v4, "actions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v53 != v43)
            objc_enumerationMutation(v40);
          v45 = -[AMSFollowUpAction initWithAction:parentIdentifier:]([AMSFollowUpAction alloc], "initWithAction:parentIdentifier:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), v7);
          -[NSArray addObject:](v39, "addObject:", v45);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v42);
    }

    actions = v17->_actions;
    v17->_actions = v39;

    v5 = v51;
    v10 = v48;
    v8 = v49;
  }

  return v17;
}

- (ACAccount)account
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__34;
  v11 = __Block_byref_object_dispose__34;
  v12 = 0;
  -[AMSFollowUpItem internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__AMSFollowUpItem_account__block_invoke;
  v6[3] = &unk_1E253E378;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ACAccount *)v4;
}

void __26__AMSFollowUpItem_account__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)active
{
  AMSFollowUp *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(AMSFollowUp);
  -[AMSFollowUp pendingFollowUps](v3, "pendingFollowUps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v4, "resultWithError:", &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v25;

  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v28 = v9;
      v29 = 2114;
      v30 = v6;
      v10 = v9;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch pending followups for determining active status. Error: %{public}@", buf, 0x16u);

    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "backingIdentifier", (_QWORD)v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSFollowUpItem backingIdentifier](self, "backingIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if ((v18 & 1) != 0)
        {
          v19 = 1;
          goto LABEL_17;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v13)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_17:

  return v19;
}

- (NSString)backingIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[AMSFollowUpItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFollowUpItem account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingIdentifierForIdentifier:account:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)identifier
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__34;
  v11 = __Block_byref_object_dispose__34;
  v12 = 0;
  -[AMSFollowUpItem internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__AMSFollowUpItem_identifier__block_invoke;
  v6[3] = &unk_1E253E378;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __29__AMSFollowUpItem_identifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSString)groupIdentifier
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (-[AMSFollowUpItem disableGrouping](self, "disableGrouping"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v3 = (id *)qword_1ECEAD238;
    v15 = qword_1ECEAD238;
    if (!qword_1ECEAD238)
    {
      v4 = (void *)CoreFollowUpLibrary();
      v3 = (id *)dlsym(v4, "FLGroupIdentifierNoGroup");
      v13[3] = (uint64_t)v3;
      qword_1ECEAD238 = (uint64_t)v3;
    }
  }
  else if (-[AMSFollowUpItem isHardwareOffer](self, "isHardwareOffer"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v3 = (id *)qword_1ECEAD240;
    v15 = qword_1ECEAD240;
    if (!qword_1ECEAD240)
    {
      v5 = (void *)CoreFollowUpLibrary();
      v3 = (id *)dlsym(v5, "FLGroupIdentifierAppleServices");
      v13[3] = (uint64_t)v3;
      qword_1ECEAD240 = (uint64_t)v3;
    }
  }
  else if (-[AMSFollowUpItem isNewDeviceOutreach](self, "isNewDeviceOutreach"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v3 = (id *)qword_1ECEAD248;
    v15 = qword_1ECEAD248;
    if (!qword_1ECEAD248)
    {
      v6 = (void *)CoreFollowUpLibrary();
      v3 = (id *)dlsym(v6, "FLGroupIdentifierNewDeviceOutreach");
      v13[3] = (uint64_t)v3;
      qword_1ECEAD248 = (uint64_t)v3;
    }
  }
  else
  {
    -[AMSFollowUpItem account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v3 = (id *)qword_1ECEAD250;
      v15 = qword_1ECEAD250;
      if (!qword_1ECEAD250)
      {
        v8 = (void *)CoreFollowUpLibrary();
        v3 = (id *)dlsym(v8, "FLGroupIdentifierAccount");
        v13[3] = (uint64_t)v3;
        qword_1ECEAD250 = (uint64_t)v3;
      }
    }
    else
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v3 = (id *)qword_1ECEAD258;
      v15 = qword_1ECEAD258;
      if (!qword_1ECEAD258)
      {
        v9 = (void *)CoreFollowUpLibrary();
        v3 = (id *)dlsym(v9, "FLGroupIdentifierDevice");
        v13[3] = (uint64_t)v3;
        qword_1ECEAD258 = (uint64_t)v3;
      }
    }
  }
  _Block_object_dispose(&v12, 8);
  if (!v3)
  {
    dlerror();
    v11 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  return (NSString *)*v3;
}

- (NSString)logKey
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__34;
  v11 = __Block_byref_object_dispose__34;
  v12 = 0;
  -[AMSFollowUpItem internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__AMSFollowUpItem_logKey__block_invoke;
  v6[3] = &unk_1E253E378;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __25__AMSFollowUpItem_logKey__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", CFSTR("AMSLogKey"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    AMSGenerateLogCorrelationKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v5, CFSTR("AMSLogKey"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", CFSTR("AMSLogKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (int64_t)priority
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[AMSFollowUpItem internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__AMSFollowUpItem_priority__block_invoke;
  v6[3] = &unk_1E2542338;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __27__AMSFollowUpItem_priority__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", CFSTR("AMSPriority"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "integerValue");

}

- (NSMutableDictionary)userInfo
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__34;
  v11 = __Block_byref_object_dispose__34;
  v12 = 0;
  -[AMSFollowUpItem internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__AMSFollowUpItem_userInfo__block_invoke;
  v6[3] = &unk_1E253E378;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __27__AMSFollowUpItem_userInfo__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AMSFollowUpItem internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__AMSFollowUpItem_setAccount___block_invoke;
  block[3] = &unk_1E253E2B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __30__AMSFollowUpItem_setAccount___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)setIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AMSFollowUpItem internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AMSFollowUpItem_setIdentifier___block_invoke;
  block[3] = &unk_1E253E2B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __33__AMSFollowUpItem_setIdentifier___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)setLogKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AMSFollowUpItem internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__AMSFollowUpItem_setLogKey___block_invoke;
  block[3] = &unk_1E253E2B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __29__AMSFollowUpItem_setLogKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("AMSLogKey"));
}

- (void)setPriority:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[AMSFollowUpItem internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__AMSFollowUpItem_setPriority___block_invoke;
  v6[3] = &unk_1E2540A40;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

void __31__AMSFollowUpItem_setPriority___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v2, CFSTR("AMSPriority"));

}

- (void)setUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AMSFollowUpItem internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AMSFollowUpItem_setUserInfo___block_invoke;
  block[3] = &unk_1E253E2B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __31__AMSFollowUpItem_setUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 40);
  v3 = v2;
  if (!v2)
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v3);
  if (!v2)

}

+ (id)backingIdentifierForIdentifier:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "ams_DSID");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "ams_DSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), CFSTR("++"), v9);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v10 = &stru_1E2548760;
  if (v7)
    v10 = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("AMS_"), v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)componentsFromBackingIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("AMS_"), &stru_1E2548760);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("++"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("identifier"));

  }
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "longLongValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("account"));

    }
  }

  return v5;
}

+ (id)_dateFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3578], "ams_serverFriendlyFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "ams_serverFriendlyLocalTimeZoneFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)generateItem
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  AMSFollowUpNotification *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t v51[128];
  _BYTE buf[24];
  void *v53;
  uint64_t *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v3 = (void *)getFLFollowUpItemClass_softClass;
  v50 = getFLFollowUpItemClass_softClass;
  if (!getFLFollowUpItemClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getFLFollowUpItemClass_block_invoke;
    v53 = &unk_1E253DDB8;
    v54 = &v47;
    __getFLFollowUpItemClass_block_invoke((uint64_t)buf);
    v3 = (void *)v48[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v47, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setDisplayStyle:", -[AMSFollowUpItem displayStyle](self, "displayStyle"));
  -[AMSFollowUpItem expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpirationDate:", v6);

  objc_msgSend(v5, "setExtensionIdentifier:", CFSTR("com.apple.AppleMediaServices.FollowUpExtension"));
  -[AMSFollowUpItem groupIdentifier](self, "groupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupIdentifier:", v7);

  -[AMSFollowUpItem footer](self, "footer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInformativeFooterText:", v8);

  -[AMSFollowUpItem informativeText](self, "informativeText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInformativeText:", v9);

  -[AMSFollowUpItem title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v10);

  -[AMSFollowUpItem backingIdentifier](self, "backingIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUniqueIdentifier:", v11);

  -[AMSFollowUpItem bundleIconName](self, "bundleIconName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = v12 == 0;

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v5, "setRepresentingBundlePath:", CFSTR("/System/Library/PrivateFrameworks/AppleMediaServicesUI.framework"));
    -[AMSFollowUpItem bundleIconName](self, "bundleIconName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBundleIconName:", v13);

  }
  -[AMSFollowUpItem userInfo](self, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  -[AMSFollowUpItem metricsEvent](self, "metricsEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSFollowUpItem metricsEvent](self, "metricsEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "underlyingDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("AMSMetrics"));

  }
  if (-[AMSFollowUpItem isExpirationDateHidden](self, "isExpirationDateHidden"))
  {
    getFLUserInfoPropertyDontDisplayDate();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v19);

  }
  objc_msgSend(v5, "setUserInfo:", v15);
  if (-[AMSFollowUpItem shouldPostNotification](self, "shouldPostNotification"))
  {
    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      v23 = v22;
      -[AMSFollowUpItem logKey](self, "logKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting notification", buf, 0x16u);

    }
    v25 = objc_alloc_init(AMSFollowUpNotification);
    -[AMSFollowUpItem title](self, "title");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    if (!v27)
    {
      -[AMSFollowUpItem title](self, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFollowUpNotification setTitle:](v25, "setTitle:", v28);

    }
    -[AMSFollowUpItem informativeText](self, "informativeText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (!v30)
    {
      -[AMSFollowUpItem informativeText](self, "informativeText");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFollowUpNotification setInformativeText:](v25, "setInformativeText:", v31);

    }
    -[AMSFollowUpNotification generateNotification](v25, "generateNotification");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNotification:", v32);

  }
  else
  {
    -[AMSFollowUpItem notification](self, "notification");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33 == 0;

    if (v34)
      goto LABEL_22;
    -[AMSFollowUpItem notification](self, "notification");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "generateNotification");
    v25 = (AMSFollowUpNotification *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setNotification:", v25);
  }

LABEL_22:
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[AMSFollowUpItem actions](self, "actions", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v44;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v40), "generateAction");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v41);

        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v38);
  }

  if (objc_msgSend(v36, "count"))
    objc_msgSend(v5, "setActions:", v36);

  return v5;
}

- (id)postMetricsWithBag:(id)a3
{
  id v4;
  id v5;
  AMSMutablePromise *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_MergedGlobals_110 != -1)
    dispatch_once(&_MergedGlobals_110, &__block_literal_global_60);
  v5 = (id)qword_1ECEAD230;
  v6 = objc_alloc_init(AMSMutablePromise);
  -[AMSFollowUpItem metricsEvent](self, "metricsEvent");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[AMSFollowUpItem metricsEvent](self, "metricsEvent"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v5, "containsObject:", v9),
        v9,
        v8,
        !v10))
  {
    -[AMSFollowUpItem metricsEvent](self, "metricsEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "underlyingDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSFollowUpMetricsEvent eventFromMetricsDictionary:](AMSFollowUpMetricsEvent, "eventFromMetricsDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enqueueEvent:", v13);
    -[AMSFollowUpItem metricsEvent](self, "metricsEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      v19 = v18;
      -[AMSFollowUpItem logKey](self, "logKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v18;
      v24 = 2114;
      v25 = v20;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics event enqueued (impression)", (uint8_t *)&v22, 0x16u);

    }
    -[AMSMutablePromise finishWithResult:](v6, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

  }
  else
  {
    -[AMSMutablePromise finishWithResult:](v6, "finishWithResult:", MEMORY[0x1E0C9AAA0]);
  }

  return v6;
}

void __38__AMSFollowUpItem_postMetricsWithBag___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)qword_1ECEAD230;
  qword_1ECEAD230 = (uint64_t)v0;

}

- (BOOL)shouldOverwriteItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  uint64_t v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFollowUpItem identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (v9)
      {
        objc_msgSend(v5, "account");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSFollowUpItem account](self, "account");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v10 == (void *)v11)
        {

LABEL_11:
          v19 = -[AMSFollowUpItem priority](self, "priority");
          v18 = v19 <= objc_msgSend(v5, "priority");
          goto LABEL_12;
        }
        v12 = (void *)v11;
        objc_msgSend(v5, "account");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ams_DSID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSFollowUpItem account](self, "account");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ams_DSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "isEqualToNumber:", v16);

        if (v17)
          goto LABEL_11;
      }
    }
    else
    {

    }
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
LABEL_12:

  return v18;
}

- (id)postMetricsWithBagContract:(id)a3
{
  id v4;
  AMSContractBagShim *v5;
  void *v6;

  v4 = a3;
  v5 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v4);

  -[AMSFollowUpItem postMetricsWithBag:](self, "postMetricsWithBag:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AMSFollowUpNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSString)bundleIconName
{
  return self->_bundleIconName;
}

- (void)setBundleIconName:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIconName, a3);
}

- (BOOL)disableGrouping
{
  return self->_disableGrouping;
}

- (void)setDisableGrouping:(BOOL)a3
{
  self->_disableGrouping = a3;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(int64_t)a3
{
  self->_displayStyle = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (BOOL)isExpirationDateHidden
{
  return self->_expirationDateHidden;
}

- (void)setExpirationDateHidden:(BOOL)a3
{
  self->_expirationDateHidden = a3;
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (BOOL)isHardwareOffer
{
  return self->_hardwareOffer;
}

- (void)setHardwareOffer:(BOOL)a3
{
  self->_hardwareOffer = a3;
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
  objc_storeStrong((id *)&self->_informativeText, a3);
}

- (BOOL)keepNotificationOnLockscreen
{
  return self->_keepNotificationOnLockscreen;
}

- (void)setKeepNotificationOnLockscreen:(BOOL)a3
{
  self->_keepNotificationOnLockscreen = a3;
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isNewDeviceOutreach
{
  return self->_newDeviceOutreach;
}

- (void)setNewDeviceOutreach:(BOOL)a3
{
  self->_newDeviceOutreach = a3;
}

- (BOOL)shouldPostNotification
{
  return self->_shouldPostNotification;
}

- (void)setShouldPostNotification:(BOOL)a3
{
  self->_shouldPostNotification = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (void)setMetricsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metricsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_bundleIconName, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
