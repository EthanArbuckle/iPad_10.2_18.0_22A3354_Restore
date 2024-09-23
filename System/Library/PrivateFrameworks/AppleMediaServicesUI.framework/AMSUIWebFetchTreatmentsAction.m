@implementation AMSUIWebFetchTreatmentsAction

- (AMSUIWebFetchTreatmentsAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebFetchTreatmentsAction *v7;
  void *v8;
  NSArray *v9;
  NSArray *areaIds;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebFetchTreatmentsAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v16, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("areaIds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    areaIds = v7->_areaIds;
    v7->_areaIds = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("includeExperimentData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("includeExperimentData"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_includeExperimentData = objc_msgSend(v12, "BOOLValue");

    }
    else
    {
      v7->_includeExperimentData = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("includePayload"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("includePayload"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_includePayload = objc_msgSend(v14, "BOOLValue");

    }
    else
    {
      v7->_includePayload = 0;
    }

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  objc_super v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)AMSUIWebFetchTreatmentsAction;
  v3 = -[AMSUIWebAction runAction](&v41, sel_runAction);
  -[AMSUIWebFetchTreatmentsAction areaIds](self, "areaIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE083E0], "defaultTreatmentStore");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v4);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v8;
      v44 = 2114;
      v45 = v9;
      v46 = 2114;
      v47 = v10;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching treatments (areas: %{public}@)", buf, 0x20u);

    }
    objc_msgSend(v38, "treatmentsForAreas:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "thenWithBlock:", &__block_literal_global_26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v12, 0);
    if (-[AMSUIWebFetchTreatmentsAction includeExperimentData](self, "includeExperimentData"))
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v4;
        v17 = v12;
        v18 = objc_opt_class();
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        v12 = v17;
        v4 = v16;
        v44 = 2114;
        v45 = v19;
        v46 = 2114;
        v47 = v20;
        _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching experiment data (areas: %{public}@)", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x24BE083E0], "defaultTreatmentStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "experimentDataForAreas:", v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "thenWithBlock:", &__block_literal_global_31_0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "addObject:", v23);
    }
    if (-[AMSUIWebFetchTreatmentsAction includePayload](self, "includePayload"))
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_opt_class();
        AMSLogKey();
        v37 = v12;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v26;
        v44 = 2114;
        v45 = v27;
        v46 = 2114;
        v47 = v28;
        _os_log_impl(&dword_211102000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching payload (areas: %{public}@)", buf, 0x20u);

        v12 = v37;
      }

      objc_msgSend(MEMORY[0x24BE083E0], "defaultTreatmentStore");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "treatmentsPayloadForAreas:", v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "thenWithBlock:", &__block_literal_global_34);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "addObject:", v31);
    }
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithAll:", v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "thenWithBlock:", &__block_literal_global_36);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = MEMORY[0x24BDAC760];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_4;
    v40[3] = &unk_24CB4F560;
    v40[4] = self;
    objc_msgSend(v33, "addErrorBlock:", v40);
    v39[0] = v34;
    v39[1] = 3221225472;
    v39[2] = __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_40;
    v39[3] = &unk_24CB51230;
    v39[4] = self;
    objc_msgSend(v33, "addSuccessBlock:", v39);

  }
  else
  {
    v35 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "promiseWithError:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v33;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE08340];
  v7 = CFSTR("treatments");
  objc_msgSend(a2, "ams_mapWithTransform:", &__block_literal_global_25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BE08300];
  v5 = a3;
  v6 = a2;
  v7 = [v4 alloc];
  objc_msgSend(v5, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithFirst:second:", v6, v8);
  return v9;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_29(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE08340];
  v8 = CFSTR("experimentData");
  v9[0] = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_32(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE08340];
  v8 = CFSTR("payload");
  v9[0] = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_2_35(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ams_reduceWithInitialResult:updateAccumulatingResult:", MEMORY[0x24BDBD1B8], &__block_literal_global_38);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_dictionaryByAddingEntriesFromDictionary:");
}

void __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_4(uint64_t a1, void *a2)
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

void __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_40(uint64_t a1, void *a2)
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

- (NSArray)areaIds
{
  return self->_areaIds;
}

- (void)setAreaIds:(id)a3
{
  objc_storeStrong((id *)&self->_areaIds, a3);
}

- (BOOL)includeExperimentData
{
  return self->_includeExperimentData;
}

- (void)setIncludeExperimentData:(BOOL)a3
{
  self->_includeExperimentData = a3;
}

- (BOOL)includePayload
{
  return self->_includePayload;
}

- (void)setIncludePayload:(BOOL)a3
{
  self->_includePayload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areaIds, 0);
}

@end
