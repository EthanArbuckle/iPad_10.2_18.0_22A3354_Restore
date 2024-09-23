@implementation AMSUIWebODIAssessmentAction

- (AMSUIWebODIAssessmentAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebODIAssessmentAction *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *additionalAttributes;
  void *v11;
  NSString *v12;
  NSString *rawAccountType;
  void *v14;
  NSString *v15;
  NSString *rawBundleIdentifer;
  void *v17;
  NSString *v18;
  NSString *rawSessionIdentifer;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebODIAssessmentAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v21, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("additionalAttributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    additionalAttributes = v7->_additionalAttributes;
    v7->_additionalAttributes = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accountType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    rawAccountType = v7->_rawAccountType;
    v7->_rawAccountType = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    rawBundleIdentifer = v7->_rawBundleIdentifer;
    v7->_rawBundleIdentifer = v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionIdentifer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    rawSessionIdentifer = v7->_rawSessionIdentifer;
    v7->_rawSessionIdentifer = v18;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  id v35;
  _QWORD v37[5];
  id v38;
  objc_super v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)AMSUIWebODIAssessmentAction;
  v3 = -[AMSUIWebAction runAction](&v39, sel_runAction);
  -[AMSUIWebODIAssessmentAction rawAccountType](self, "rawAccountType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSUIWebODIAssessmentAction accountTypeForString:](self, "accountTypeForString:", v4);

  -[AMSUIWebODIAssessmentAction rawSessionIdentifer](self, "rawSessionIdentifer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebODIAssessmentAction sessionIdentifierForString:](self, "sessionIdentifierForString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIWebODIAssessmentAction rawBundleIdentifer](self, "rawBundleIdentifer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v15;
      v42 = 2114;
      v43 = v16;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bundle identifier passed. Will fallback to process bundle identifier.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_3;
LABEL_10:
    v18 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "promiseWithError:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (!v7)
    goto LABEL_10;
LABEL_3:
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE082E0]);
    -[AMSUIWebAction context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithSessionIdentifier:accountType:bundleIdentifier:bag:", v7, v5, v8, v11);
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
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v23;
      v42 = 2114;
      v43 = v24;
      _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bundle identifier found. Will run session without identifier", buf, 0x16u);

    }
    v25 = objc_alloc(MEMORY[0x24BE082E0]);
    -[AMSUIWebAction context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v25, "initWithSessionIdentifier:accountType:bag:", v7, v5, v11);
  }
  v26 = (void *)v12;

  -[AMSUIWebODIAssessmentAction additionalAttributes](self, "additionalAttributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = objc_alloc(MEMORY[0x24BE082D8]);
    -[AMSUIWebODIAssessmentAction additionalAttributes](self, "additionalAttributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithAttributes:", v29);

    objc_msgSend(v26, "updateWithAttributes:", v30);
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v31, "OSLogObject");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = objc_opt_class();
    AMSLogKey();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v33;
    v42 = 2114;
    v43 = v34;
    _os_log_impl(&dword_211102000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running ODISession to get assessment.", buf, 0x16u);

  }
  objc_msgSend(v26, "getAssessment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __40__AMSUIWebODIAssessmentAction_runAction__block_invoke;
  v37[3] = &unk_24CB519F8;
  v37[4] = self;
  v38 = v26;
  v35 = v26;
  objc_msgSend(v19, "thenWithBlock:", v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v20;
}

id __40__AMSUIWebODIAssessmentAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE081D8];
  v4 = a2;
  objc_msgSend(v3, "sharedWebUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched assessment", buf, 0x16u);

  }
  v9 = (void *)MEMORY[0x24BE08340];
  objc_msgSend(v4, "stringValue", CFSTR("assessment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = CFSTR("cacheIdentifier");
  v16[0] = v10;
  objc_msgSend(*(id *)(a1 + 40), "cacheIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "promiseWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)accountTypeForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  +[؋ objectForKeyedSubscript:](&unk_24CB8C7F8, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[؋ objectForKeyedSubscript:](&unk_24CB8C7F8, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)sessionIdentifierForString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE07ED0];
  v10[0] = CFSTR("create");
  v10[1] = CFSTR("submit");
  v4 = *MEMORY[0x24BE07ED8];
  v11[0] = v3;
  v11[1] = v4;
  v10[2] = CFSTR("idUpdate");
  v11[2] = *MEMORY[0x24BE07EE0];
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDictionary)additionalAttributes
{
  return self->_additionalAttributes;
}

- (void)setAdditionalAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_additionalAttributes, a3);
}

- (NSString)rawAccountType
{
  return self->_rawAccountType;
}

- (void)setRawAccountType:(id)a3
{
  objc_storeStrong((id *)&self->_rawAccountType, a3);
}

- (NSString)rawBundleIdentifer
{
  return self->_rawBundleIdentifer;
}

- (void)setRawBundleIdentifer:(id)a3
{
  objc_storeStrong((id *)&self->_rawBundleIdentifer, a3);
}

- (NSString)rawSessionIdentifer
{
  return self->_rawSessionIdentifer;
}

- (void)setRawSessionIdentifer:(id)a3
{
  objc_storeStrong((id *)&self->_rawSessionIdentifer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSessionIdentifer, 0);
  objc_storeStrong((id *)&self->_rawBundleIdentifer, 0);
  objc_storeStrong((id *)&self->_rawAccountType, 0);
  objc_storeStrong((id *)&self->_additionalAttributes, 0);
}

@end
