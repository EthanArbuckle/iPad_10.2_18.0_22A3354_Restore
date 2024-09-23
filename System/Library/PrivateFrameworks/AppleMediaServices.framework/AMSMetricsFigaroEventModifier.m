@implementation AMSMetricsFigaroEventModifier

void __56__AMSMetricsFigaroEventModifier_fieldFiltersMatchEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  char v12;
  id v13;

  v13 = a3;
  objc_msgSend(*(id *)(a1 + 32), "propertyForBodyKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    if (!v7)
    {
LABEL_10:
      v9 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (!v8)
    goto LABEL_10;
  v10 = objc_msgSend(v13, "containsObject:", v8);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v11 + 24))
    v12 = v10;
  else
    v12 = 0;
  *(_BYTE *)(v11 + 24) = v12;
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDictionary, 0);
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_sampleSessionKey, 0);
  objc_storeStrong((id *)&self->_fieldFilters, 0);
}

- (BOOL)shouldSkipEvent:(id)a3
{
  void *v3;
  BOOL v4;

  -[AMSMetricsFigaroEventModifier _overridePropertyForKey:](self, "_overridePropertyForKey:", CFSTR("sendDisabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0;

  return v4;
}

- (BOOL)shouldDropEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  -[AMSMetricsFigaroEventModifier _overridePropertyForKey:](self, "_overridePropertyForKey:", CFSTR("disabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "BOOLValue"))
  {
    objc_msgSend(v4, "eventType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    LOBYTE(v19) = 1;
    goto LABEL_17;
  }
  v9 = -[AMSMetricsFigaroEventModifier _shouldSampleEvent:](self, "_shouldSampleEvent:", v4);
  objc_msgSend(v4, "eventType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (!v9)
    goto LABEL_16;
  if (objc_msgSend(v10, "length"))
  {
    -[AMSMetricsFigaroEventModifier _overridePropertyForKey:](self, "_overridePropertyForKey:", CFSTR("blacklistedEvents"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (objc_msgSend(v12, "containsObject:", v8))
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class();
        v16 = v15;
        AMSLogKey();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "topic");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v15;
        v32 = 2114;
        v33 = v17;
        v34 = 2114;
        v35 = v8;
        v36 = 2114;
        v37 = v18;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Override blacklisted eventType: %{public}@ (topic: %{public}@)", buf, 0x2Au);

      }
      goto LABEL_16;
    }

  }
  if (objc_msgSend(v8, "length"))
  {
    -[AMSMetricsFigaroEventModifier metricsDictionary](self, "metricsDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("blacklistedEvents"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;

    v19 = objc_msgSend(v23, "containsObject:", v8);
    if (v19)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_opt_class();
        v29 = v26;
        AMSLogKey();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "topic");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v26;
        v32 = 2114;
        v33 = v27;
        v34 = 2114;
        v35 = v8;
        v36 = 2114;
        v37 = v28;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Blacklisted eventType: %{public}@ (topic: %{public}@)", buf, 0x2Au);

      }
    }

  }
  else
  {
    LOBYTE(v19) = 0;
  }
LABEL_17:

  return v19;
}

- (id)reportingURLForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSMetricsFigaroEventModifier _overridePropertyForKey:](self, "_overridePropertyForKey:", CFSTR("metricsUrl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    -[AMSMetricsFigaroEventModifier metricsDictionary](self, "metricsDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("metricsUrl"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      v15 = 0;
      goto LABEL_12;
    }
    v7 = v10;

    if (!v7)
    {
LABEL_13:
      v15 = 0;
      goto LABEL_14;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("2"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "topic");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLByAppendingPathComponent:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "absoluteString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

LABEL_14:
      v8 = v15;

      goto LABEL_15;
    }
    goto LABEL_13;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (id)preparedEventPromiseWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[AMSMetricsFigaroEventModifier metricsDictionary](self, "metricsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AMSMetricsFigaroEventModifier _overridePropertyForKey:](self, "_overridePropertyForKey:", CFSTR("blacklistedFields"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    if (objc_msgSend(v7, "count"))
      objc_msgSend(v4, "removePropertiesForKeys:", v7);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blacklistedFields"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (objc_msgSend(v10, "count"))
      objc_msgSend(v4, "removePropertiesForKeys:", v10);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)_shouldSampleEvent:(id)a3
{
  BOOL v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  if ((objc_msgSend(a3, "preventSampling") & 1) == 0)
  {
    -[AMSMetricsFigaroEventModifier _overridePropertyForKey:](self, "_overridePropertyForKey:", CFSTR("sampling"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;

      if (!v6)
      {
        v4 = 1;
        goto LABEL_12;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("percentage"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("duration"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "doubleValue");
        v9 = v8;
        objc_msgSend(v7, "doubleValue");
        v11 = v10;
        -[AMSMetricsFigaroEventModifier sampleSessionKey](self, "sampleSessionKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = +[AMSDefaults shouldSampleWithPercentage:sessionDuration:identifier:](AMSDefaults, "shouldSampleWithPercentage:sessionDuration:identifier:", v12, v9, v11);

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v6 = 0;
      v4 = 1;
    }

LABEL_12:
    return v4;
  }
  return 1;
}

- (double)flushInterval
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  -[AMSMetricsFigaroEventModifier _overridePropertyForKey:](self, "_overridePropertyForKey:", CFSTR("postFrequency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMSMetricsFigaroEventModifier _overridePropertyForKey:](self, "_overridePropertyForKey:", CFSTR("postFrequency"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    if (v6 != 0.0)
      goto LABEL_8;
  }
  else
  {

  }
  -[AMSMetricsFigaroEventModifier metricsDictionary](self, "metricsDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("postFrequency"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMSMetricsFigaroEventModifier metricsDictionary](self, "metricsDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("postFrequency"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v6 = v11;

  }
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v12);
  if (v13 == 0.0)
    v14 = 0.0;
  else
    v14 = v13;

  return v14;
}

- (NSDictionary)metricsDictionary
{
  return self->_metricsDictionary;
}

- (id)_overridePropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[AMSMetricsFigaroEventModifier overrideDictionary](self, "overrideDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("properties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDictionary)overrideDictionary
{
  return self->_overrideDictionary;
}

- (AMSMetricsFigaroEventModifier)initWithMetricsDictionary:(id)a3 overrideDictionary:(id)a4
{
  id v7;
  id v8;
  AMSMetricsFigaroEventModifier *v9;
  AMSMetricsFigaroEventModifier *v10;
  uint64_t v11;
  NSDictionary *fieldFilters;
  uint64_t v13;
  NSString *sampleSessionKey;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSMetricsFigaroEventModifier;
  v9 = -[AMSMetricsFigaroEventModifier init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_overrideDictionary, a4);
    objc_storeStrong((id *)&v10->_metricsDictionary, a3);
    -[AMSMetricsFigaroEventModifier _fieldFiltersFromOverrides:](v10, "_fieldFiltersFromOverrides:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    fieldFilters = v10->_fieldFilters;
    v10->_fieldFilters = (NSDictionary *)v11;

    if (-[NSDictionary count](v10->_fieldFilters, "count"))
    {
      -[AMSMetricsFigaroEventModifier _createSampleSessionKey](v10, "_createSampleSessionKey");
      v13 = objc_claimAutoreleasedReturnValue();
      sampleSessionKey = v10->_sampleSessionKey;
      v10->_sampleSessionKey = (NSString *)v13;

    }
  }

  return v10;
}

- (id)_fieldFiltersFromOverrides:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithArray:", &unk_1E25B0140);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fieldFilters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__AMSMetricsFigaroEventModifier__fieldFiltersFromOverrides___block_invoke;
  v14[3] = &unk_1E25438E8;
  v15 = v5;
  v10 = v6;
  v16 = v10;
  v11 = v5;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);
  v12 = v16;
  v13 = v10;

  return v13;
}

- (BOOL)fieldFiltersMatchEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  -[AMSMetricsFigaroEventModifier fieldFilters](self, "fieldFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 1;
    -[AMSMetricsFigaroEventModifier fieldFilters](self, "fieldFilters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__AMSMetricsFigaroEventModifier_fieldFiltersMatchEvent___block_invoke;
    v10[3] = &unk_1E25438C0;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

    v8 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_createSampleSessionKey
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  id obj;
  uint64_t v30;
  AMSMetricsFigaroEventModifier *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v31 = self;
  -[AMSMetricsFigaroEventModifier fieldFilters](self, "fieldFilters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v32)
  {
    v33 = 0;
    v34 = 0;
    v30 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@:"), v8);
        -[AMSMetricsFigaroEventModifier fieldFilters](v31, "fieldFilters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "allObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          if (objc_msgSend(v8, "isEqualToString:", CFSTR("topic")))
          {
            objc_msgSend(v12, "firstObject");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v34 = 0;
          }
        }
        if (!v33)
        {
          if (objc_msgSend(v8, "isEqualToString:", CFSTR("eventType")))
          {
            objc_msgSend(v12, "firstObject");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v33 = 0;
          }
        }
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v36;
          v17 = 1;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v36 != v16)
                objc_enumerationMutation(v13);
              v19 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
              if ((v17 & 1) == 0)
                objc_msgSend(v3, "appendString:", CFSTR(","));
              objc_msgSend(v3, "appendString:", v19);
              v17 = 0;
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            v17 = 0;
          }
          while (v15);
        }

        objc_msgSend(v3, "appendString:", CFSTR(";"));
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v32);
  }
  else
  {
    v33 = 0;
    v34 = 0;
  }

  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ams_SHA1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "hasSuffix:", CFSTR("=")))
  {
    do
    {
      objc_msgSend(v22, "substringToIndex:", objc_msgSend(v22, "length") - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v23;
    }
    while ((objc_msgSend(v23, "hasSuffix:", CFSTR("=")) & 1) != 0);
  }
  else
  {
    v23 = v22;
  }
  if (v34)
    v24 = v34;
  else
    v24 = v33;
  v25 = v24;
  if (v25)
    v26 = v25;
  else
    v26 = CFSTR("Figaro");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v26, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (NSDictionary)fieldFilters
{
  return self->_fieldFilters;
}

void __60__AMSMetricsFigaroEventModifier__fieldFiltersFromOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(void *, _QWORD);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD aBlock[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__AMSMetricsFigaroEventModifier__fieldFiltersFromOverrides___block_invoke_2;
    aBlock[3] = &unk_1E253D398;
    v8 = v7;
    v20 = v8;
    v9 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            v9[2](v9, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        }
        while (v12);
      }

    }
    else
    {
      ((void (**)(void *, id))v9)[2](v9, v6);
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v5, (_QWORD)v15);

  }
}

void __60__AMSMetricsFigaroEventModifier__fieldFiltersFromOverrides___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = *(void **)(a1 + 32);
      objc_msgSend(v6, "stringValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 32);
    }
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (NSString)sampleSessionKey
{
  return self->_sampleSessionKey;
}

@end
