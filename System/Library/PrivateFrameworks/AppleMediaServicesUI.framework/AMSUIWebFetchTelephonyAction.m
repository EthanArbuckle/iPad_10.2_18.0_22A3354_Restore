@implementation AMSUIWebFetchTelephonyAction

- (AMSUIWebFetchTelephonyAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebFetchTelephonyAction *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebFetchTelephonyAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v11, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suppressPhoneNumber"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suppressPhoneNumber"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_suppressPhoneNumber = objc_msgSend(v9, "BOOLValue");

    }
    else
    {
      v7->_suppressPhoneNumber = 0;
    }

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  objc_super v47;
  _QWORD v48[7];
  _QWORD v49[7];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v47.receiver = self;
  v47.super_class = (Class)AMSUIWebFetchTelephonyAction;
  v3 = -[AMSUIWebAction runAction](&v47, sel_runAction);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v6;
    v52 = 2114;
    v53 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching telephony...", buf, 0x16u);

  }
  -[AMSUIWebAction context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "telephony");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v13;
      v52 = 2114;
      v53 = v14;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched telephony", buf, 0x16u);

    }
    if (-[AMSUIWebFetchTelephonyAction suppressPhoneNumber](self, "suppressPhoneNumber"))
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
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_opt_class();
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v17;
        v52 = 2114;
        v53 = v18;
        _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Suppressing phone number", buf, 0x16u);

      }
      v19 = 0;
    }
    else
    {
      objc_msgSend(v10, "phoneNumber");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v10, "formattedPhoneNumber:", v19);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_24:
        v27 = (void *)MEMORY[0x24BE08340];
        if (v26)
          v28 = v26;
        else
          v28 = &stru_24CB5A078;
        v49[0] = v28;
        v48[0] = CFSTR("formattedPhoneNumber");
        v48[1] = CFSTR("mobileCountryCode");
        objc_msgSend(v10, "countryCode");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        if (v29)
          v31 = (const __CFString *)v29;
        else
          v31 = &stru_24CB5A078;
        v49[1] = v31;
        v48[2] = CFSTR("mobileNetworkCode");
        objc_msgSend(v10, "networkCode");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        if (v32)
          v34 = (const __CFString *)v32;
        else
          v34 = &stru_24CB5A078;
        if (v19)
          v35 = v19;
        else
          v35 = &stru_24CB5A078;
        v49[2] = v34;
        v49[3] = v35;
        v48[3] = CFSTR("phoneNumber");
        v48[4] = CFSTR("providerName");
        objc_msgSend(v10, "providerName");
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if (v36)
          v38 = (const __CFString *)v36;
        else
          v38 = &stru_24CB5A078;
        v49[4] = v38;
        v48[5] = CFSTR("radioTechnology");
        objc_msgSend(v10, "radioTechnology");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v39;
        if (v39)
          v41 = (const __CFString *)v39;
        else
          v41 = &stru_24CB5A078;
        v49[5] = v41;
        v48[6] = CFSTR("radioType");
        objc_msgSend(v10, "radioType");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v42;
        if (v42)
          v44 = (const __CFString *)v42;
        else
          v44 = &stru_24CB5A078;
        v49[6] = v44;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 7);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "promiseWithResult:", v45);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_46;
      }
    }
    v26 = 0;
    goto LABEL_24;
  }
  AMSError();
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = objc_opt_class();
    AMSLogKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v22;
    v52 = 2114;
    v53 = v23;
    v54 = 2114;
    v55 = v24;
    _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch telephony: %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:

  return v25;
}

- (BOOL)suppressPhoneNumber
{
  return self->_suppressPhoneNumber;
}

- (void)setSuppressPhoneNumber:(BOOL)a3
{
  self->_suppressPhoneNumber = a3;
}

@end
