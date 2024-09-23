@implementation AMSUIWebFetchTreatmentAreasAction

- (AMSUIWebFetchTreatmentAreasAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebFetchTreatmentAreasAction *v7;
  void *v8;
  NSArray *v9;
  NSArray *namespaceIds;
  void *v11;
  NSArray *v12;
  NSArray *topicIds;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebFetchTreatmentAreasAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v15, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("namespaceIds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    namespaceIds = v7->_namespaceIds;
    v7->_namespaceIds = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topicIds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    topicIds = v7->_topicIds;
    v7->_topicIds = v12;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  objc_super v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)AMSUIWebFetchTreatmentAreasAction;
  v3 = -[AMSUIWebAction runAction](&v39, sel_runAction);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  -[AMSUIWebFetchTreatmentAreasAction namespaceIds](self, "namespaceIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x24BE08000;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v5);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v10;
      v42 = 2114;
      v43 = v11;
      v44 = 2114;
      v45 = v12;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching areas (namespaces: %{public}@)", buf, 0x20u);

      v6 = 0x24BE08000uLL;
    }

    objc_msgSend(*(id *)(v6 + 992), "defaultTreatmentStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "areasForNamespaces:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "thenWithBlock:", &__block_literal_global_25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v15);
  }
  -[AMSUIWebFetchTreatmentAreasAction topicIds](self, "topicIds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v16);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v16;
      v20 = v4;
      v21 = v5;
      v22 = v6;
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v23;
      v6 = v22;
      v5 = v21;
      v4 = v20;
      v16 = v36;
      v42 = 2114;
      v43 = v24;
      v44 = 2114;
      v45 = v25;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching areas (topics: %{public}@)", buf, 0x20u);

    }
    objc_msgSend(*(id *)(v6 + 992), "defaultTreatmentStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "areasForTopics:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "thenWithBlock:", &__block_literal_global_17_0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v28);
  }
  v29 = objc_msgSend(v4, "count");
  v30 = (void *)MEMORY[0x24BE08340];
  if (v29)
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithAll:", v4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "thenWithBlock:", &__block_literal_global_21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_4;
    v38[3] = &unk_24CB4F560;
    v38[4] = self;
    objc_msgSend(v32, "addErrorBlock:", v38);
    v37[0] = v33;
    v37[1] = 3221225472;
    v37[2] = __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_25;
    v37[3] = &unk_24CB51230;
    v37[4] = self;
    objc_msgSend(v32, "addSuccessBlock:", v37);
  }
  else
  {
    AMSError();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "promiseWithError:", v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v32;
}

id __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke(uint64_t a1, void *a2)
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
  v8 = CFSTR("namespaceAreas");
  v9[0] = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_16(uint64_t a1, void *a2)
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
  v8 = CFSTR("topicAreas");
  v9[0] = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ams_reduceWithInitialResult:updateAccumulatingResult:", MEMORY[0x24BDBD1B8], &__block_literal_global_23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_dictionaryByAddingEntriesFromDictionary:");
}

void __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_4(uint64_t a1, void *a2)
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

void __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_25(uint64_t a1, void *a2)
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

- (NSArray)namespaceIds
{
  return self->_namespaceIds;
}

- (void)setNamespaceIds:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceIds, a3);
}

- (NSArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
  objc_storeStrong((id *)&self->_topicIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_namespaceIds, 0);
}

@end
