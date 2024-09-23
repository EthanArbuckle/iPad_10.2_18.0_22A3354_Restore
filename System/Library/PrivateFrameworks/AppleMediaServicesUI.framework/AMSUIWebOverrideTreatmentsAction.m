@implementation AMSUIWebOverrideTreatmentsAction

- (AMSUIWebOverrideTreatmentsAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebOverrideTreatmentsAction *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *treatmentOverrides;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebOverrideTreatmentsAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v12, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("treatmentOverrides"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    treatmentOverrides = v7->_treatmentOverrides;
    v7->_treatmentOverrides = v9;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  const __CFString *v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebOverrideTreatmentsAction;
  v3 = -[AMSUIWebAction runAction](&v13, sel_runAction);
  -[AMSUIWebOverrideTreatmentsAction treatmentOverrides](self, "treatmentOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
    *(_DWORD *)buf = 138543874;
    v17 = v7;
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding treatments (value: %{public}@)", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BE08100], "setTreatmentOverrides:", v4);
  v9 = (void *)MEMORY[0x24BE08340];
  v14 = CFSTR("success");
  v15 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "promiseWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDictionary)treatmentOverrides
{
  return self->_treatmentOverrides;
}

- (void)setTreatmentOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentOverrides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentOverrides, 0);
}

@end
