@implementation AMSUIWebFetchMetricsIdentifierAction

- (AMSUIWebFetchMetricsIdentifierAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebFetchMetricsIdentifierAction *v8;
  void *v9;
  uint64_t v10;
  ACAccount *account;
  void *v12;
  NSString *v13;
  NSString *bagNamespace;
  void *v15;
  NSString *v16;
  NSString *bagProfile;
  void *v18;
  NSString *v19;
  NSString *bagProfileVersion;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *identifierKey;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)AMSUIWebFetchMetricsIdentifierAction;
  v8 = -[AMSUIWebAction initWithJSObject:context:](&v29, sel_initWithJSObject_context_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iTunesAccountFromJSAccount:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    account = v8->_account;
    v8->_account = (ACAccount *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bagNamespace"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    bagNamespace = v8->_bagNamespace;
    v8->_bagNamespace = v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bagProfile"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    bagProfile = v8->_bagProfile;
    v8->_bagProfile = v16;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bagProfileVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    bagProfileVersion = v8->_bagProfileVersion;
    v8->_bagProfileVersion = v19;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("crossDeviceSync"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("crossDeviceSync"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_crossDeviceSync = objc_msgSend(v22, "BOOLValue");

    }
    else
    {
      v8->_crossDeviceSync = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("generateEventFields"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("generateEventFields"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_generateEventFields = objc_msgSend(v24, "BOOLValue");

    }
    else
    {
      v8->_generateEventFields = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifierKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;

    identifierKey = v8->_identifierKey;
    v8->_identifierKey = v26;

  }
  return v8;
}

- (id)runAction
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  uint64_t v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[4];
  id v41;
  BOOL v42;
  BOOL v43;
  objc_super v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v44.receiver = self;
  v44.super_class = (Class)AMSUIWebFetchMetricsIdentifierAction;
  v3 = -[AMSUIWebAction runAction](&v44, sel_runAction);
  -[AMSUIWebFetchMetricsIdentifierAction bagNamespace](self, "bagNamespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v37 = -[AMSUIWebFetchMetricsIdentifierAction crossDeviceSync](self, "crossDeviceSync");
    v5 = -[AMSUIWebFetchMetricsIdentifierAction generateEventFields](self, "generateEventFields");
    -[AMSUIWebFetchMetricsIdentifierAction identifierKey](self, "identifierKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[AMSUIWebAction context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebFetchMetricsIdentifierAction account](self, "account");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v34 = v5;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(v7, "account");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v10;

      -[AMSUIWebFetchMetricsIdentifierAction bagProfile](self, "bagProfile");
      v15 = objc_claimAutoreleasedReturnValue();
      -[AMSUIWebFetchMetricsIdentifierAction bagProfileVersion](self, "bagProfileVersion");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (!v15
        || !v16
        || (v18 = (void *)MEMORY[0x24BE08050],
            objc_msgSend(v7, "clientInfo"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v18, "bagForProfile:profileVersion:processInfo:", v15, v17, v19),
            v20 = objc_claimAutoreleasedReturnValue(),
            v19,
            (v36 = (void *)v20) == 0))
      {
        objc_msgSend(v7, "bag");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v33 = v17;
      v35 = (void *)v15;
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v31 = objc_opt_class();
        AMSLogKey();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded();
        v32 = v7;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        *(_DWORD *)buf = 138544898;
        v27 = CFSTR("false");
        v46 = v31;
        v47 = 2114;
        if (v37)
          v27 = CFSTR("true");
        v48 = v23;
        v49 = 2114;
        v50 = v24;
        v51 = 2114;
        v52 = v25;
        v53 = 2114;
        v54 = v4;
        v55 = 2114;
        v56 = v6;
        v57 = 2114;
        v58 = v27;
        _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting (account: %{public}@; bag: %{public}@; bagNamespace: %{public}@; identifierK"
          "ey: %{public}@; crossDeviceSync: %{public}@)",
          buf,
          0x48u);

        v7 = v32;
      }

      objc_msgSend(MEMORY[0x24BE08280], "identifierStoreWithAccount:bagNamespace:bag:", v14, v4, v36);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x24BDAC760];
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke;
      v40[3] = &unk_24CB51208;
      v41 = v6;
      v42 = v37;
      v43 = v34;
      objc_msgSend(v28, "thenWithBlock:", v40);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v39[0] = v29;
      v39[1] = 3221225472;
      v39[2] = __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke_2;
      v39[3] = &unk_24CB4F560;
      v39[4] = self;
      objc_msgSend(v12, "addErrorBlock:", v39);
      v38[0] = v29;
      v38[1] = 3221225472;
      v38[2] = __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke_40;
      v38[3] = &unk_24CB51230;
      v38[4] = self;
      objc_msgSend(v12, "addSuccessBlock:", v38);

    }
    else
    {
      v13 = (void *)MEMORY[0x24BE08340];
      AMSError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "promiseWithError:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "promiseWithError:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE08278], "keyWithName:crossDeviceSync:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifierForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v5, CFSTR("identifier"), 0);
  if (*(_BYTE *)(a1 + 41))
  {
    v15[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "generateEventFieldsForKeys:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = CFSTR("eventFields");
    v14 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_dictionaryByAddingEntriesFromDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failure (error: %{public}@)", (uint8_t *)&v8, 0x20u);

  }
}

void __49__AMSUIWebFetchMetricsIdentifierAction_runAction__block_invoke_40(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v2;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Success (result: %{public}@)", (uint8_t *)&v7, 0x20u);

  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)bagNamespace
{
  return self->_bagNamespace;
}

- (void)setBagNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_bagNamespace, a3);
}

- (NSString)bagProfile
{
  return self->_bagProfile;
}

- (void)setBagProfile:(id)a3
{
  objc_storeStrong((id *)&self->_bagProfile, a3);
}

- (NSString)bagProfileVersion
{
  return self->_bagProfileVersion;
}

- (void)setBagProfileVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bagProfileVersion, a3);
}

- (BOOL)crossDeviceSync
{
  return self->_crossDeviceSync;
}

- (void)setCrossDeviceSync:(BOOL)a3
{
  self->_crossDeviceSync = a3;
}

- (BOOL)generateEventFields
{
  return self->_generateEventFields;
}

- (void)setGenerateEventFields:(BOOL)a3
{
  self->_generateEventFields = a3;
}

- (NSString)identifierKey
{
  return self->_identifierKey;
}

- (void)setIdentifierKey:(id)a3
{
  objc_storeStrong((id *)&self->_identifierKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierKey, 0);
  objc_storeStrong((id *)&self->_bagProfileVersion, 0);
  objc_storeStrong((id *)&self->_bagProfile, 0);
  objc_storeStrong((id *)&self->_bagNamespace, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
