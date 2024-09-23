@implementation AMSEngagementAppEventFilterModel

- (BOOL)matchesEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  -[AMSEngagementAppEventFilterModel definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("filter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = +[AMSEngagementAppEventFilterModel matchEvent:toFilter:](AMSEngagementAppEventFilterModel, "matchEvent:toFilter:", v4, v7);
  return v8;
}

- (NSDictionary)definition
{
  return self->_definition;
}

+ (BOOL)matchEvent:(id)a3 toFilter:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__AMSEngagementAppEventFilterModel_matchEvent_toFilter___block_invoke;
    v10[3] = &unk_1E2541740;
    v12 = &v14;
    v13 = a1;
    v11 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
    v8 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __56__AMSEngagementAppEventFilterModel_matchEvent_toFilter___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *context;
  void *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  context = (void *)MEMORY[0x18D78A1C4]();
  v21 = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v7);
  v23 = v6;
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v10);

  v24 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v8, 0, &v24);
  v13 = v24;
  if (v13)
  {
    +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v16;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v23;
      v31 = 2114;
      v32 = v18;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Regex failure. keyPath = %{public}@, error = %{public}@", buf, 0x2Au);

    }
  }
  v19 = objc_msgSend(v12, "rangeOfFirstMatchInString:options:range:", v11, 0, 0, objc_msgSend(v11, "length"));
  if (!v12 || v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

  objc_autoreleasePoolPop(context);
}

- (unint64_t)components
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[AMSEngagementAppEventFilterModel definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("components"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMSEngagementAppEventFilterModel definition](self, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("components"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (BOOL)allowsResponse
{
  void *v2;
  void *v3;
  char v4;

  -[AMSEngagementAppEventFilterModel definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("allowsResponse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (AMSEngagementAppEventFilterModel)initWithCacheObject:(id)a3
{
  void *v4;
  id v5;
  AMSEngagementAppEventFilterModel *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("definition"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = -[AMSEngagementAppEventFilterModel initWithDefinition:](self, "initWithDefinition:", v5);
  return v6;
}

- (AMSEngagementAppEventFilterModel)initWithDefinition:(id)a3
{
  id v5;
  AMSEngagementAppEventFilterModel *v6;
  AMSEngagementAppEventFilterModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSEngagementAppEventFilterModel;
  v6 = -[AMSEngagementAppEventFilterModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_definition, a3);

  return v7;
}

- (AMSEngagementAppEventFilterModel)init
{
  return -[AMSEngagementAppEventFilterModel initWithDefinition:](self, "initWithDefinition:", 0);
}

- (id)exportObject
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("definition");
  -[AMSEngagementAppEventFilterModel definition](self, "definition");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = MEMORY[0x1E0C9AA70];
  if (v2)
    v4 = v2;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
}

@end
