@implementation AMSUIWebCampaignAttributionAction

- (AMSUIWebCampaignAttributionAction)initWithJSObject:(id)a3 context:(id)a4
{
  void *v4;
  id v7;
  AMSUIWebCampaignAttributionAction *v8;
  AMSUIWebCampaignAttributionAction *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSArray *additionalQueryItems;
  void *v28;
  id v29;
  uint64_t v30;
  NSURL *URL;
  id v33;
  AMSUIWebCampaignAttributionAction *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)AMSUIWebCampaignAttributionAction;
  v8 = -[AMSUIWebAction initWithJSObject:context:](&v39, sel_initWithJSObject_context_, v7, a4);
  v9 = v8;
  if (v8)
  {
    -[AMSUIWebAction context](v8, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("account"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iTunesAccountFromJSAccount:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      -[AMSUIWebAction context](v9, "context");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v9->_account, v13);
    if (!v12)
    {

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalQueryItems"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v34 = v9;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = v15;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v36 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v17, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v24 = v23;
            else
              v24 = 0;

            if (v24)
            {
              objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", v22, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v25);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v19);
      }

      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v16);
      v26 = objc_claimAutoreleasedReturnValue();
      v9 = v34;
      additionalQueryItems = v34->_additionalQueryItems;
      v34->_additionalQueryItems = (NSArray *)v26;

      v15 = v33;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("url"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;

    if (v29)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
      URL = v9->_URL;
      v9->_URL = (NSURL *)v30;

    }
  }

  return v9;
}

- (id)runAction
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)AMSUIWebCampaignAttributionAction;
  v3 = -[AMSUIWebAction runAction](&v46, sel_runAction);
  -[AMSUIWebCampaignAttributionAction URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (runAction_ams_once_token___COUNTER__ != -1)
      dispatch_once(&runAction_ams_once_token___COUNTER__, &__block_literal_global_19);
    v5 = (id)runAction_ams_once_object___COUNTER__;
    v6 = objc_alloc(MEMORY[0x24BDD1808]);
    -[AMSUIWebCampaignAttributionAction URL](self, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithURL:resolvingAgainstBaseURL:", v7, 0);

    if (v8)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v8, "queryItems", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v43;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v43 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v5, "containsObject:", v14);

            if ((v15 & 1) != 0)
            {

              objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v27)
              {
                objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v27, "OSLogObject");
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = objc_opt_class();
                AMSLogKey();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v49 = v29;
                v50 = 2114;
                v51 = v30;
                _os_log_impl(&dword_211102000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning campaign attribution task", buf, 0x16u);

              }
              v31 = (void *)objc_opt_class();
              -[AMSUIWebCampaignAttributionAction URL](self, "URL");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "_campaignAttributionTaskForURL:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              -[AMSUIWebCampaignAttributionAction account](self, "account");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setAccount:", v34);

              -[AMSUIWebCampaignAttributionAction additionalQueryItems](self, "additionalQueryItems");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setAdditionalQueryItems:", v35);

              objc_msgSend(v33, "perform");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "thenWithBlock:", &__block_literal_global_59);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_34;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          if (v11)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v18;
        v50 = 2114;
        v51 = v19;
        _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL does not contain any known campaign or affiliate query parameters", buf, 0x16u);

      }
      v20 = (void *)MEMORY[0x24BE08340];
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v37, "OSLogObject");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = objc_opt_class();
        AMSLogKey();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v39;
        v50 = 2114;
        v51 = v40;
        _os_log_impl(&dword_211102000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to convert URL to components", buf, 0x16u);

      }
      v20 = (void *)MEMORY[0x24BE08340];
    }
    AMSError();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "promiseWithError:", v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v23;
      v50 = 2114;
      v51 = v24;
      _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid URL passed", buf, 0x16u);

    }
    v25 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "promiseWithError:", v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

void __46__AMSUIWebCampaignAttributionAction_runAction__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24CB8C988);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)runAction_ams_once_object___COUNTER__;
  runAction_ams_once_object___COUNTER__ = v0;

}

id __46__AMSUIWebCampaignAttributionAction_runAction__block_invoke_57(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCED8];
  v13 = CFSTR("success");
  v14[0] = MEMORY[0x24BDBD1C8];
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "redirectURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("redirectURL"));
  v9 = (void *)MEMORY[0x24BE08340];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "promiseWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_campaignAttributionTaskForURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE080A0];
  v4 = a3;
  objc_msgSend(v3, "createBagForSubProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE080A0]), "initWithURL:bag:", v4, v5);

  return v6;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSArray)additionalQueryItems
{
  return self->_additionalQueryItems;
}

- (void)setAdditionalQueryItems:(id)a3
{
  objc_storeStrong((id *)&self->_additionalQueryItems, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_additionalQueryItems, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
