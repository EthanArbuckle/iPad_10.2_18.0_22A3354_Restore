@implementation AMSBagValue

- (id)valuePromise
{
  AMSMutablePromise *v3;
  AMSMutablePromise *v4;
  _QWORD v6[4];
  AMSMutablePromise *v7;

  v3 = objc_alloc_init(AMSMutablePromise);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__AMSBagValue_valuePromise__block_invoke;
  v6[3] = &unk_1E253F2F0;
  v4 = v3;
  v7 = v4;
  -[AMSBagValue valueWithCompletion:](self, "valueWithCompletion:", v6);

  return v4;
}

- (AMSBagValue)valueWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  AMSBagValue *result;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;
  _QWORD aBlock[4];
  id v19;
  AMSBagValue *v20;
  id v21;

  v4 = a3;
  +[AMSBagValue globalBagValueStorage](AMSBagValue, "globalBagValueStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", self);

  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__AMSBagValue_valueWithCompletion___block_invoke;
  aBlock[3] = &unk_1E253F188;
  v8 = v6;
  v19 = v8;
  v20 = self;
  v9 = v4;
  v21 = v9;
  v10 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  -[AMSBagValue dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_12;
  v14[3] = &unk_1E253F2C8;
  objc_copyWeak(&v16, &location);
  v12 = v10;
  v14[4] = self;
  v15 = v12;
  objc_msgSend(v11, "loadWithCompletion:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return result;
}

- (AMSBagDataSourceProtocol)dataSource
{
  return (AMSBagDataSourceProtocol *)objc_loadWeakRetained((id *)&self->_dataSource);
}

+ (AMSThreadSafeSet)globalBagValueStorage
{
  if (_MergedGlobals_85 != -1)
    dispatch_once(&_MergedGlobals_85, &__block_literal_global_18);
  return (AMSThreadSafeSet *)(id)qword_1ECEACFD8;
}

- (NSString)key
{
  return self->_key;
}

void __35__AMSBagValue_valueWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  AMSPair *v9;
  void *v10;
  AMSPair *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[6];
  id v29;
  _QWORD v30[5];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(*(id *)(a1 + 32), "valueType") && v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_8;
      v31[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    if (!v7)
    {
      v21 = *(void **)(a1 + 32);
      objc_msgSend(v21, "dataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "key");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "defaultValueForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_processedDefaultValuePromise:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_6;
      v30[3] = &unk_1E253F228;
      v30[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v25, "continueWithBlock:", v30);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 0;
      goto LABEL_12;
    }
LABEL_8:
    if (!+[AMSBagValue _value:isKindOfValueType:](AMSBagValue, "_value:isKindOfValueType:", v7, objc_msgSend(*(id *)(a1 + 32), "valueType")))
    {
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "valueType");
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AMSErrorWithFormat(202, CFSTR("Bag Key Value Type Mismatch"), CFSTR("The bag value for %@ doesn't match the type you requested. (requestedValueType = %li | actualValueClass = %@)"), v15, v16, v17, v18, v19, (uint64_t)v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, void *))(v13 + 16))(v13, 0, 0, 1, v20);

LABEL_13:
      goto LABEL_14;
    }
    v9 = [AMSPair alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AMSPair initWithFirst:second:](v9, "initWithFirst:second:", v7, v10);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_44;
    v28[3] = &unk_1E253F278;
    v28[4] = *(_QWORD *)(a1 + 32);
    v26 = *(id *)(a1 + 48);
    v28[5] = *(_QWORD *)(a1 + 40);
    v29 = v26;
    objc_msgSend(v12, "addFinishBlock:", v28);

    goto LABEL_13;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_14:

}

- (unint64_t)valueType
{
  return self->_valueType;
}

+ (id)_valueFromDictionary:(id)a3 forBagKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  unint64_t i;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x18D78A1C4]();
  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; ++i)
    {
      if (i >= objc_msgSend(v11, "count"))
      {
        v10 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
LABEL_9:
        v10 = 0;
        goto LABEL_12;
      }
      if (i == objc_msgSend(v11, "count") - 1)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_9;

      v5 = v14;
    }
    v10 = v14;
LABEL_12:

LABEL_13:
  }
  objc_autoreleasePoolPop(v7);

  return v10;
}

- (void)_applyTransformsToValue:(id)a3 index:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id, _QWORD);
  void *v10;
  unint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  AMSMutablePromise *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  void (**v21)(id, id, _QWORD);
  int64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, id, _QWORD))a5;
  if (a4 < 0)
    goto LABEL_6;
  -[AMSBagValue transformBlocks](self, "transformBlocks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 <= a4
    || (-[AMSBagValue transformBlocks](self, "transformBlocks"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "objectAtIndexedSubscript:", a4),
        v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
LABEL_6:
    v9[2](v9, v8, 0);
  }
  else
  {
    ((void (**)(_QWORD, id))v13)[2](v13, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", 60.0);
      -[AMSMutablePromise finishWithPromise:](v15, "finishWithPromise:", v14);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __56__AMSBagValue__applyTransformsToValue_index_completion___block_invoke;
      v20[3] = &unk_1E253F318;
      v20[4] = self;
      v22 = a4;
      v21 = v9;
      -[AMSPromise addFinishBlock:](v15, "addFinishBlock:", v20);

    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        -[AMSBagValue key](self, "key");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v24 = v18;
        v25 = 2048;
        v26 = a4;
        v27 = 2114;
        v28 = v19;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Transform (%ld) block returned nil promise for %{public}@. Resolving with previous value.", buf, 0x20u);

      }
      v9[2](v9, v8, 0);
    }

  }
}

void __35__AMSBagValue_valueWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v8;
  id v9;
  __CFString *v10;
  os_log_type_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  if (v9)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" [%@]"), *(_QWORD *)(a1 + 32));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = &stru_1E2548760;
    }
    if (a4)
      v11 = OS_LOG_TYPE_ERROR;
    else
      v11 = OS_LOG_TYPE_DEBUG;
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, v11))
    {
      v17 = v10;
      v14 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v19 = v14;
      v20 = 2114;
      v21 = v17;
      v22 = 2114;
      v23 = v15;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v16;
      _os_log_impl(&dword_18C849000, v13, v11, "%{public}@:%{public}@ Failed to fetch value: %{public}@. %{public}@ %{public}@", buf, 0x34u);

      v10 = v17;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __27__AMSBagValue_valuePromise__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2);
}

- (NSArray)transformBlocks
{
  return self->_transformBlocks;
}

+ (BOOL)_value:(id)a3 isKindOfValueType:(unint64_t)a4
{
  id v5;
  char isKindOfClass;

  v5 = a3;
  if (a4 >= 7)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)_processedDefaultValuePromise:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  AMSOptional *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = -[AMSBagValue valueType](self, "valueType");
  if (v5 && v6 == 5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__AMSBagValue__processedDefaultValuePromise___block_invoke;
    v11[3] = &unk_1E253F1D8;
    v11[4] = self;
    +[AMSBagURLParser URLBySubstitutingVariablesInURLString:usingPromiseBlock:](AMSBagURLParser, "URLBySubstitutingVariablesInURLString:usingPromiseBlock:", v5, v11);
    v7 = (AMSOptional *)objc_claimAutoreleasedReturnValue();
    -[AMSOptional thenWithBlock:](v7, "thenWithBlock:", &__block_literal_global_57);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v4);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

id __35__AMSBagValue_valueWithCompletion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AMSPair *v23;
  void *v24;
  AMSPair *v25;
  void *v26;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "OSLogObject");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0CB3940];
        if (v8)
        {
          v10 = objc_opt_class();
          AMSLogKey();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v12;
        }
        AMSLogableError(v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v12;
        v30 = 2114;
        v31 = v20;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received error when processing default value. error = %{public}@", buf, 0x16u);
        if (v8)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v14, 0);
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB3940];
        if (v15)
        {
          v17 = objc_opt_class();
          AMSLogKey();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v19;
        }
        AMSLogableError(v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        v30 = 2114;
        v31 = v21;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_FAULT, "%{public}@Unexpectedly received error when processing default value. error = %{public}@", buf, 0x16u);
        if (v15)

      }
    }

  }
  objc_msgSend(v4, "value");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = [AMSPair alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22 != 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[AMSPair initWithFirst:second:](v23, "initWithFirst:second:", v22, v24);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

id __35__AMSBagValue_valueWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  AMSOptional *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v5);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "key");
    v7 = (AMSOptional *)objc_claimAutoreleasedReturnValue();
    AMSErrorWithFormat(200, CFSTR("Invalid Bag Value"), CFSTR("The URL was malformed for key: %@"), v9, v10, v11, v12, v13, (uint64_t)v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __35__AMSBagValue_valueWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  AMSOptional *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v5);
  objc_msgSend(v3, "finishWithResult:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformBlocks, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (BOOL)isLoaded
{
  void *v2;
  char v3;

  -[AMSBagValue dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoaded");

  return v3;
}

- (AMSBagValue)valueWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[AMSBagValue valuePromise](self, "valuePromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSBagValue *)v5;
}

- (AMSBagValue)initWithDataSource:(id)a3 key:(id)a4 valueType:(unint64_t)a5 account:(id)a6
{
  id v10;
  id v11;
  id v12;
  AMSBagValue *v13;
  AMSBagValue *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AMSBagValue;
  v13 = -[AMSBagValue init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_account, a6);
    objc_storeWeak((id *)&v14->_dataSource, v10);
    objc_storeStrong((id *)&v14->_key, a4);
    v14->_valueType = a5;
  }

  return v14;
}

- (AMSBagValue)initWithDataSource:(id)a3 key:(id)a4 valueType:(unint64_t)a5
{
  return -[AMSBagValue initWithDataSource:key:valueType:account:](self, "initWithDataSource:key:valueType:account:", a3, a4, a5, 0);
}

void __36__AMSBagValue_globalBagValueStorage__block_invoke()
{
  AMSThreadSafeSet *v0;
  void *v1;

  v0 = objc_alloc_init(AMSThreadSafeSet);
  v1 = (void *)qword_1ECEACFD8;
  qword_1ECEACFD8 = (uint64_t)v0;

}

AMSMutablePromise *__35__AMSBagValue_valueWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  void *v6;
  AMSMutablePromise *v7;
  _QWORD v9[4];
  AMSMutablePromise *v10;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_3;
  v9[3] = &unk_1E253F1B0;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v5, "valueForURLVariable:account:completion:", v3, v6, v9);

  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

+ (id)failingBagValueWithKey:(id)a3 valueType:(unint64_t)a4 error:(id)a5
{
  id v7;
  id v8;
  AMSFailingBagValue *v9;

  v7 = a3;
  v8 = a5;
  v9 = -[AMSFailingBagValue initWithKey:valueType:error:]([AMSFailingBagValue alloc], "initWithKey:valueType:error:", v7, a4, v8);

  return v9;
}

+ (id)frozenBagValueWithKey:(id)a3 value:(id)a4 valueType:(unint64_t)a5
{
  id v7;
  id v8;
  AMSFrozenBagValue *v9;

  v7 = a3;
  v8 = a4;
  v9 = -[AMSFrozenBagValue initWithKey:value:valueType:]([AMSFrozenBagValue alloc], "initWithKey:value:valueType:", v7, v8, a5);

  return v9;
}

+ (id)bagValueWithKey:(id)a3 valueType:(unint64_t)a4 valuePromise:(id)a5
{
  id v7;
  id v8;
  AMSBridgedBagValue *v9;

  v7 = a3;
  v8 = a5;
  v9 = -[AMSBridgedBagValue initWithKey:valueType:valuePromise:]([AMSBridgedBagValue alloc], "initWithKey:valueType:valuePromise:", v7, a4, v8);

  return v9;
}

- (id)transformWithBlock:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  AMSBagValue *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSBagValue dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagValue key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSBagValue valueType](self, "valueType");
  -[AMSBagValue account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSBagValue initWithDataSource:key:valueType:account:](v5, "initWithDataSource:key:valueType:account:", v6, v7, v8, v9);

  -[AMSBagValue transformBlocks](self, "transformBlocks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = v14;

  v16 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v15, "addObject:", v16);

  -[AMSBagValue setTransformBlocks:](v10, "setTransformBlocks:", v15);
  return v10;
}

void __35__AMSBagValue_valueWithCompletion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  AMSOptional *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[6];
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend((id)objc_opt_class(), "globalBagValueStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", WeakRetained);

  if (v5)
  {
    objc_msgSend(v5, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBagValue _valueFromDictionary:forBagKey:](AMSBagValue, "_valueFromDictionary:forBagKey:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(WeakRetained, "valueType");
    v13 = MEMORY[0x1E0C809B0];
    if (v12 == 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v25[0] = v13;
      v25[1] = 3221225472;
      v25[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_2;
      v25[3] = &unk_1E253F1D8;
      v25[4] = WeakRetained;
      +[AMSBagURLParser URLBySubstitutingVariablesInURLString:usingPromiseBlock:](AMSBagURLParser, "URLBySubstitutingVariablesInURLString:usingPromiseBlock:", v11, v25);
      v14 = (AMSOptional *)objc_claimAutoreleasedReturnValue();
      v24[0] = v13;
      v24[1] = 3221225472;
      v24[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_4;
      v24[3] = &unk_1E253F200;
      v24[4] = WeakRetained;
      -[AMSOptional continueWithBlock:](v14, "continueWithBlock:", v24);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v11);
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;

    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_5;
    v22[3] = &unk_1E253F2A0;
    v17 = *(id *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 32);
    v22[4] = WeakRetained;
    v22[5] = v18;
    v23 = v17;
    objc_msgSend(v16, "addFinishBlock:", v22);

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(WeakRetained, "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Unable to retrieve %@ because we failed to load the bag."), v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = *(_QWORD *)(a1 + 40);
    AMSError(203, CFSTR("Bag Load Failed"), v11, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, void *))(v21 + 16))(v21, 0, 0, 1, v16);
  }

}

void __35__AMSBagValue_valueWithCompletion___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  char v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
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
        AMSLogKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB3940];
        if (v9)
        {
          v11 = objc_opt_class();
          AMSLogKey();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v13;
        }
        AMSLogableError(v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v13;
        v41 = 2114;
        v42 = v21;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received error when handling value after default-checking. error = %{public}@", buf, 0x16u);
        if (v9)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v15, 0);
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB3940];
        if (v16)
        {
          v18 = objc_opt_class();
          AMSLogKey();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v20;
        }
        AMSLogableError(v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v20;
        v41 = 2114;
        v42 = v22;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_FAULT, "%{public}@Unexpectedly received error when handling value after default-checking. error = %{public}@", buf, 0x16u);
        if (v16)

      }
    }

  }
  objc_msgSend(v5, "first");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "second");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  if (v23)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __35__AMSBagValue_valueWithCompletion___block_invoke_49;
    v36[3] = &unk_1E253F250;
    v26 = *(void **)(a1 + 40);
    v37 = *(id *)(a1 + 48);
    v38 = v25;
    objc_msgSend(v26, "_applyTransformsToValue:index:completion:", v23, 0, v36);
    v27 = v37;
  }
  else
  {
    v28 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "key");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    AMSErrorWithFormat(204, CFSTR("Bag Value Missing"), CFSTR("The bag does not contain %@ nor did anyone register a default value. %@"), v29, v30, v31, v32, v33, (uint64_t)v27);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v28 + 16))(v28, 0, 0, 0, v34);

  }
}

uint64_t __35__AMSBagValue_valueWithCompletion___block_invoke_49(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), 1, a3);
}

void __56__AMSBagValue__applyTransformsToValue_index_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
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
      v9 = objc_opt_class();
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544130;
      v13 = v9;
      v14 = 2048;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Transform (%ld) failed for %{public}@. %{public}@", (uint8_t *)&v12, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_applyTransformsToValue:index:completion:", v5, *(_QWORD *)(a1 + 48) + 1, *(_QWORD *)(a1 + 40));
  }

}

- (void)_handleSuccessWithValue:(id)a3 isDefault:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  v8 = a3;
  v9 = a5;
  +[AMSBagValue globalBagValueStorage](AMSBagValue, "globalBagValueStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", self);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__AMSBagValue__handleSuccessWithValue_isDefault_completion___block_invoke;
  v12[3] = &unk_1E253F250;
  v11 = v9;
  v13 = v11;
  v14 = a4;
  -[AMSBagValue _applyTransformsToValue:index:completion:](self, "_applyTransformsToValue:index:completion:", v8, 0, v12);

}

uint64_t __60__AMSBagValue__handleSuccessWithValue_isDefault_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), a3);
}

- (id)_processedDefaultValue:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];

  v4 = a3;
  v5 = v4;
  if (-[AMSBagValue valueType](self, "valueType") == 5)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __38__AMSBagValue__processedDefaultValue___block_invoke;
      v7[3] = &unk_1E253F340;
      v7[4] = self;
      +[AMSBagURLParser URLBySubstitutingVariablesInURLString:usingBlock:](AMSBagURLParser, "URLBySubstitutingVariablesInURLString:usingBlock:", v4, v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

id __38__AMSBagValue__processedDefaultValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForURLVariable:account:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

AMSMutablePromise *__45__AMSBagValue__processedDefaultValuePromise___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  void *v6;
  AMSMutablePromise *v7;
  _QWORD v9[4];
  AMSMutablePromise *v10;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__AMSBagValue__processedDefaultValuePromise___block_invoke_2;
  v9[3] = &unk_1E253F1B0;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v5, "valueForURLVariable:account:completion:", v3, v6, v9);

  return v7;
}

void __45__AMSBagValue__processedDefaultValuePromise___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  AMSOptional *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v5);
  objc_msgSend(v3, "finishWithResult:", v4);

}

id __45__AMSBagValue__processedDefaultValuePromise___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void)setTransformBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_transformBlocks, a3);
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

@end
