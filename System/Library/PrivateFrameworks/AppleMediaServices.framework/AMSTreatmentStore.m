@implementation AMSTreatmentStore

uint64_t __50__AMSTreatmentStore_encodeExperimentDataForTopic___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_encodeExperimentData:", a2);
}

id __44__AMSTreatmentStore_experimentDataForAreas___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = CFSTR("areaId");
    v7 = CFSTR("bucket");
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      v24 = v5;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
        {
          v33[0] = v6;
          v33[1] = v7;
          v34[0] = v10;
          v34[1] = &unk_1E25AFAE8;
          v33[2] = CFSTR("treatmentId");
          v34[2] = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v13);
        }
        else
        {
          objc_msgSend(v25, "objectForKey:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v14;
          if (v14)
          {
            v31[0] = v6;
            v31[1] = v7;
            v32[0] = v10;
            v32[1] = &unk_1E25AFB00;
            v31[2] = CFSTR("treatmentId");
            objc_msgSend(v14, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v32[2] = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
            v16 = v8;
            v17 = a1;
            v18 = v7;
            v19 = v3;
            v20 = v6;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v21);

            v6 = v20;
            v3 = v19;
            v7 = v18;
            a1 = v17;
            v8 = v16;
            v5 = v24;

          }
        }

        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v5);
  }

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_encodeExperimentData:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v6;
      v27 = 2114;
      v28 = v7;
      v29 = 2114;
      v30 = v3;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Serializing experiment data: %{public}@", buf, 0x20u);

    }
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v24;
    +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v8)
    {
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_opt_class();
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v13;
        v27 = 2114;
        v28 = v14;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Serialized experiment data successfully", buf, 0x16u);

      }
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
      if (!objc_msgSend(v15, "length"))
      {
        AMSError(0, CFSTR("Treatment Store Failure"), CFSTR("Failed to encode experiment data"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        AMSLogKey();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v19;
        v27 = 2114;
        v28 = v20;
        v29 = 2114;
        v30 = v21;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Experiment data serialization error: %{public}@", buf, 0x20u);

      }
      AMSError(3, CFSTR("Treatment Store Failure"), CFSTR("Failed to encode experiment data due to a JSON serialization error"), v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v16;
LABEL_21:

    goto LABEL_22;
  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", &stru_1E2548760);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v17;
}

- (AMSTreatmentStore)initWithCachePolicy:(int64_t)a3
{
  AMSTreatmentStore *v4;
  AMSTreatmentStore *v5;
  AMSEngagement *v6;
  AMSEngagement *engagement;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMSTreatmentStore;
  v4 = -[AMSTreatmentStore init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cachePolicy = a3;
    v6 = objc_alloc_init(AMSEngagement);
    engagement = v5->_engagement;
    v5->_engagement = v6;

  }
  return v5;
}

- (id)encodeExperimentDataForTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  AMSTreatmentStore *v12;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSTreatmentStore areasForTopics:](self, "areasForTopics:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__AMSTreatmentStore_encodeExperimentDataForTopic___block_invoke;
    v10[3] = &unk_1E253E3F0;
    v11 = v5;
    v12 = self;
    objc_msgSend(v7, "thenWithBlock:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AMSError(2, CFSTR("Failed to find treatment"), CFSTR("No topic"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)areasForTopics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  AMSMutablePromise *v8;
  void *v9;
  uint64_t v10;
  AMSMutablePromise *v11;
  AMSMutablePromise *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  AMSMutablePromise *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  AMSTreatmentStore *v25;
  AMSMutablePromise *v26;
  _QWORD v27[4];
  AMSMutablePromise *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v30 = objc_opt_class();
    v31 = 2114;
    v32 = v5;
    v33 = 2114;
    v34 = v4;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching areas (topics: %{public}@)", buf, 0x20u);
  }

  v8 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 3.0);
  -[AMSTreatmentStore _treatmentStoreService](self, "_treatmentStoreService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __36__AMSTreatmentStore_areasForTopics___block_invoke;
  v27[3] = &unk_1E253E120;
  v11 = v8;
  v28 = v11;
  objc_msgSend(v9, "addErrorBlock:", v27);
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __36__AMSTreatmentStore_areasForTopics___block_invoke_2;
  v23[3] = &unk_1E2546590;
  v24 = v4;
  v25 = self;
  v12 = v11;
  v26 = v12;
  v13 = v4;
  objc_msgSend(v9, "addSuccessBlock:", v23);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __36__AMSTreatmentStore_areasForTopics___block_invoke_4;
  v21[3] = &unk_1E253D950;
  v21[4] = self;
  v14 = v5;
  v22 = v14;
  -[AMSPromise addErrorBlock:](v12, "addErrorBlock:", v21);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __36__AMSTreatmentStore_areasForTopics___block_invoke_39;
  v19[3] = &unk_1E25465B8;
  v19[4] = self;
  v20 = v14;
  v15 = v14;
  -[AMSPromise addSuccessBlock:](v12, "addSuccessBlock:", v19);
  v16 = v20;
  v17 = v12;

  return v17;
}

- (id)_treatmentStoreService
{
  void *v2;
  void *v3;

  -[AMSTreatmentStore engagement](self, "engagement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "treatmentStoreService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AMSEngagement)engagement
{
  return self->_engagement;
}

void __40__AMSTreatmentStore_areasForNamespaces___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  v6 = objc_msgSend(v4, "cachePolicy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AMSTreatmentStore_areasForNamespaces___block_invoke_3;
  v7[3] = &unk_1E2540008;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "areasForNamespaces:cachePolicy:completion:", v3, v6, v7);

}

void __40__AMSTreatmentStore_treatmentsForAreas___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  v6 = objc_msgSend(v4, "cachePolicy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AMSTreatmentStore_treatmentsForAreas___block_invoke_3;
  v7[3] = &unk_1E2540008;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "treatmentsForAreas:cachePolicy:completion:", v3, v6, v7);

}

void __36__AMSTreatmentStore_areasForTopics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  v6 = objc_msgSend(v4, "cachePolicy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__AMSTreatmentStore_areasForTopics___block_invoke_3;
  v7[3] = &unk_1E2540008;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "areasForTopics:cachePolicy:completion:", v3, v6, v7);

}

- (int64_t)cachePolicy
{
  return self->_cachePolicy;
}

void __36__AMSTreatmentStore_areasForTopics___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    AMSLogableError(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch areas (error: %{public}@)", (uint8_t *)&v9, 0x20u);

  }
}

void __36__AMSTreatmentStore_areasForTopics___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v9);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      AMSError(7, CFSTR("Treatment Store Failure"), CFSTR("Areas not found"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagement, 0);
}

id __50__AMSTreatmentStore_encodeExperimentDataForTopic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "experimentDataForAreas:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AMSTreatmentStore_encodeExperimentDataForTopic___block_invoke_2;
  v7[3] = &unk_1E253D638;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "thenWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)experimentDataForAreas:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  +[AMSDefaults treatmentOverrides](AMSDefaults, "treatmentOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__AMSTreatmentStore_experimentDataForAreas___block_invoke;
  v17[3] = &unk_1E253D348;
  v7 = v5;
  v18 = v7;
  objc_msgSend(v4, "ams_filterUsingTest:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    -[AMSTreatmentStore treatmentsForAreas:](self, "treatmentsForAreas:", v8);
  else
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __44__AMSTreatmentStore_experimentDataForAreas___block_invoke_2;
  v14[3] = &unk_1E253E3F0;
  v15 = v4;
  v16 = v7;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v9, "thenWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

BOOL __44__AMSTreatmentStore_experimentDataForAreas___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)treatmentsForAreas:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  AMSMutablePromise *v8;
  void *v9;
  uint64_t v10;
  AMSMutablePromise *v11;
  AMSMutablePromise *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  AMSMutablePromise *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  AMSTreatmentStore *v25;
  AMSMutablePromise *v26;
  _QWORD v27[4];
  AMSMutablePromise *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v30 = objc_opt_class();
    v31 = 2114;
    v32 = v5;
    v33 = 2114;
    v34 = v4;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching treatments (areas: %{public}@)", buf, 0x20u);
  }

  v8 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 3.0);
  -[AMSTreatmentStore _treatmentStoreService](self, "_treatmentStoreService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __40__AMSTreatmentStore_treatmentsForAreas___block_invoke;
  v27[3] = &unk_1E253E120;
  v11 = v8;
  v28 = v11;
  objc_msgSend(v9, "addErrorBlock:", v27);
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __40__AMSTreatmentStore_treatmentsForAreas___block_invoke_2;
  v23[3] = &unk_1E2546590;
  v24 = v4;
  v25 = self;
  v12 = v11;
  v26 = v12;
  v13 = v4;
  objc_msgSend(v9, "addSuccessBlock:", v23);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __40__AMSTreatmentStore_treatmentsForAreas___block_invoke_4;
  v21[3] = &unk_1E253D950;
  v21[4] = self;
  v14 = v5;
  v22 = v14;
  -[AMSPromise addErrorBlock:](v12, "addErrorBlock:", v21);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __40__AMSTreatmentStore_treatmentsForAreas___block_invoke_48;
  v19[3] = &unk_1E25465B8;
  v19[4] = self;
  v20 = v14;
  v15 = v14;
  -[AMSPromise addSuccessBlock:](v12, "addSuccessBlock:", v19);
  v16 = v20;
  v17 = v12;

  return v17;
}

void __42__AMSTreatmentStore_defaultTreatmentStore__block_invoke()
{
  AMSTreatmentStore *v0;
  void *v1;

  v0 = objc_alloc_init(AMSTreatmentStore);
  v1 = (void *)qword_1ECEAD8E8;
  qword_1ECEAD8E8 = (uint64_t)v0;

}

- (AMSTreatmentStore)init
{
  return -[AMSTreatmentStore initWithCachePolicy:](self, "initWithCachePolicy:", 1);
}

void __40__AMSTreatmentStore_treatmentsForAreas___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v9);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      AMSError(7, CFSTR("Treatment Store Failure"), CFSTR("Areas not found"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

- (id)areasForNamespaces:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  AMSMutablePromise *v8;
  void *v9;
  uint64_t v10;
  AMSMutablePromise *v11;
  AMSMutablePromise *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  AMSMutablePromise *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  AMSTreatmentStore *v25;
  AMSMutablePromise *v26;
  _QWORD v27[4];
  AMSMutablePromise *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v30 = objc_opt_class();
    v31 = 2114;
    v32 = v5;
    v33 = 2114;
    v34 = v4;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching areas (namespaces: %{public}@)", buf, 0x20u);
  }

  v8 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 3.0);
  -[AMSTreatmentStore _treatmentStoreService](self, "_treatmentStoreService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __40__AMSTreatmentStore_areasForNamespaces___block_invoke;
  v27[3] = &unk_1E253E120;
  v11 = v8;
  v28 = v11;
  objc_msgSend(v9, "addErrorBlock:", v27);
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __40__AMSTreatmentStore_areasForNamespaces___block_invoke_2;
  v23[3] = &unk_1E2546590;
  v24 = v4;
  v25 = self;
  v12 = v11;
  v26 = v12;
  v13 = v4;
  objc_msgSend(v9, "addSuccessBlock:", v23);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __40__AMSTreatmentStore_areasForNamespaces___block_invoke_4;
  v21[3] = &unk_1E253D950;
  v21[4] = self;
  v14 = v5;
  v22 = v14;
  -[AMSPromise addErrorBlock:](v12, "addErrorBlock:", v21);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __40__AMSTreatmentStore_areasForNamespaces___block_invoke_37;
  v19[3] = &unk_1E25465B8;
  v19[4] = self;
  v20 = v14;
  v15 = v14;
  -[AMSPromise addSuccessBlock:](v12, "addSuccessBlock:", v19);
  v16 = v20;
  v17 = v12;

  return v17;
}

+ (id)defaultTreatmentStore
{
  if (_MergedGlobals_147 != -1)
    dispatch_once(&_MergedGlobals_147, &__block_literal_global_128);
  return (id)qword_1ECEAD8E8;
}

uint64_t __40__AMSTreatmentStore_areasForNamespaces___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __40__AMSTreatmentStore_areasForNamespaces___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v9);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      AMSError(7, CFSTR("Treatment Store Failure"), CFSTR("Areas not found"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

void __40__AMSTreatmentStore_areasForNamespaces___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    AMSLogableError(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch areas (error: %{public}@)", (uint8_t *)&v9, 0x20u);

  }
}

void __40__AMSTreatmentStore_areasForNamespaces___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetched areas: %{public}@", (uint8_t *)&v8, 0x20u);
  }

}

uint64_t __36__AMSTreatmentStore_areasForTopics___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __36__AMSTreatmentStore_areasForTopics___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetched areas: %{public}@", (uint8_t *)&v8, 0x20u);
  }

}

- (id)synchronizeTreatments
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = objc_opt_class();
    v21 = 2114;
    v22 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Synchronizing treatments", buf, 0x16u);
  }

  -[AMSTreatmentStore _treatmentStoreService](self, "_treatmentStoreService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __42__AMSTreatmentStore_synchronizeTreatments__block_invoke;
  v18[3] = &unk_1E25465E0;
  v18[4] = self;
  objc_msgSend(v6, "thenWithBlock:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "promiseWithTimeout:", 3.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "binaryPromiseAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __42__AMSTreatmentStore_synchronizeTreatments__block_invoke_2;
  v16[3] = &unk_1E253D950;
  v16[4] = self;
  v11 = v3;
  v17 = v11;
  objc_msgSend(v10, "addErrorBlock:", v16);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __42__AMSTreatmentStore_synchronizeTreatments__block_invoke_47;
  v14[3] = &unk_1E253E2B0;
  v14[4] = self;
  v15 = v11;
  v12 = v11;
  objc_msgSend(v10, "addSuccessBlock:", v14);

  return v10;
}

id __42__AMSTreatmentStore_synchronizeTreatments__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSBinaryPromise *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = objc_alloc_init(AMSBinaryPromise);
  v5 = objc_msgSend(*(id *)(a1 + 32), "cachePolicy");
  -[AMSBinaryPromise completionHandlerAdapter](v4, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeTreatmentsWithCachePolicy:completion:", v5, v6);

  -[AMSBinaryPromise promiseAdapter](v4, "promiseAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __42__AMSTreatmentStore_synchronizeTreatments__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    AMSLogableError(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to synchronize treatments (error: %{public}@)", (uint8_t *)&v9, 0x20u);

  }
}

void __42__AMSTreatmentStore_synchronizeTreatments__block_invoke_47(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Synchronized treatments successfully", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __40__AMSTreatmentStore_treatmentsForAreas___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __40__AMSTreatmentStore_treatmentsForAreas___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    AMSLogableError(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch treatments (error: %{public}@)", (uint8_t *)&v9, 0x20u);

  }
}

void __40__AMSTreatmentStore_treatmentsForAreas___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedTreatmentsConfig](AMSLogConfig, "sharedTreatmentsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetched treatments: %{public}@", (uint8_t *)&v8, 0x20u);
  }

}

- (id)treatmentsPayloadForAreas:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  +[AMSDefaults treatmentOverrides](AMSDefaults, "treatmentOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__AMSTreatmentStore_treatmentsPayloadForAreas___block_invoke;
  v17[3] = &unk_1E253D348;
  v7 = v5;
  v18 = v7;
  objc_msgSend(v4, "ams_filterUsingTest:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    -[AMSTreatmentStore treatmentsForAreas:](self, "treatmentsForAreas:", v8);
  else
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __47__AMSTreatmentStore_treatmentsPayloadForAreas___block_invoke_2;
  v14[3] = &unk_1E253E3F0;
  v15 = v4;
  v16 = v7;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v9, "thenWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

BOOL __47__AMSTreatmentStore_treatmentsPayloadForAreas___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

id __47__AMSTreatmentStore_treatmentsPayloadForAreas___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  id v20;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count") + 1);
  objc_msgSend(v22, "addObject:", CFSTR("1"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (!v5)
    goto LABEL_15;
  v6 = v5;
  v7 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(obj);
      v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = &unk_1E25AFAE8;
      }
      else
      {
        objc_msgSend(v20, "objectForKey:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          continue;
        v12 = &unk_1E25AFB00;
      }
      v27[0] = v9;
      objc_msgSend(v12, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v14;
      v27[2] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("+"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        objc_msgSend(v22, "addObject:", v16);

    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  }
  while (v6);
LABEL_15:

  if (objc_msgSend(v22, "count") == 1)
  {
    v17 = &stru_1E2548760;
  }
  else
  {
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR("#"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)attemptConnectionInTests
{
  return _attemptConnectionInTests;
}

+ (void)setAttemptConnectionInTests:(BOOL)a3
{
  _attemptConnectionInTests = a3;
}

- (void)setEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_engagement, a3);
}

@end
