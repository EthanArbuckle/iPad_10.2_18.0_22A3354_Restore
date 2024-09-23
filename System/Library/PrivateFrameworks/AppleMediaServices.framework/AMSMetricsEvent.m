@implementation AMSMetricsEvent

- (void)setSuppressEngagement:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (-[AMSMetricsEvent engagementEvent](self, "engagementEvent"))
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempting to suppress engagement for engagement event", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsEvent _setProperty:forBodyKey:clientOnly:](self, "_setProperty:forBodyKey:clientOnly:");

  }
}

- (NSDictionary)underlyingDictionary
{
  os_unfair_lock_s *p_internalStateLock;
  void *v4;

  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_underlyingDictionary, 1);
  os_unfair_lock_unlock(p_internalStateLock);
  return (NSDictionary *)v4;
}

- (BOOL)suppressEngagement
{
  void *v2;
  char v3;

  -[AMSMetricsEvent _propertyForBodyKey:clientOnly:](self, "_propertyForBodyKey:clientOnly:", CFSTR("suppressEngagement"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)removePropertiesForKeys:(id)a3
{
  os_unfair_lock_s *p_internalStateLock;
  id v5;

  p_internalStateLock = &self->_internalStateLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectsForKeys:](self->_underlyingDictionary, "removeObjectsForKeys:", v5);

  os_unfair_lock_unlock(p_internalStateLock);
}

- (BOOL)engagementEvent
{
  void *v2;
  char v3;

  -[AMSMetricsEvent _propertyForBodyKey:clientOnly:](self, "_propertyForBodyKey:clientOnly:", CFSTR("engagementEvent"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)diagnosticsSubmissionBugType
{
  return (NSString *)-[AMSMetricsEvent _propertyForBodyKey:clientOnly:](self, "_propertyForBodyKey:clientOnly:", CFSTR("diagnosticsSubmissionBugType"), 1);
}

- (BOOL)checkDiagnosticsAndUsageSetting
{
  void *v2;
  char v3;

  -[AMSMetricsEvent _propertyForBodyKey:clientOnly:](self, "_propertyForBodyKey:clientOnly:", CFSTR("checkDU"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSDictionary)dictionaryForPosting
{
  os_unfair_lock_s *p_internalStateLock;
  void *v4;

  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary mutableCopy](self->_underlyingDictionary, "mutableCopy");
  os_unfair_lock_unlock(p_internalStateLock);
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("clientOnlyProperties"));
  return (NSDictionary *)v4;
}

- (void)setAppVersion:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("appVersion"));
}

- (void)setTopic:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("topic"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_internalStateLock;
  void *v6;
  ACAccount *account;
  NSNumber *v8;
  ACAccount *v9;
  void *v10;

  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", self->_underlyingDictionary, 1);
  account = self->_account;
  v8 = self->_databasePID;
  v9 = account;
  os_unfair_lock_unlock(p_internalStateLock);
  v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithSanitizedUnderlyingDictionary:account:databasePID:", v6, v9, v8);

  return v10;
}

- (id)_initWithSanitizedUnderlyingDictionary:(id)a3 account:(id)a4 databasePID:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSMetricsEvent *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSMetricsEvent;
  v12 = -[AMSMetricsEvent init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    v12->_internalStateLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_underlyingDictionary, a3);
    objc_storeStrong(p_isa + 3, a4);
    objc_storeStrong(p_isa + 4, a5);
  }

  return p_isa;
}

- (void)setAnonymous:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("anonymous"));

}

- (NSDictionary)databaseEventBody
{
  void *v3;
  void *v4;
  void *v5;

  -[AMSMetricsEvent underlyingDictionaryOverride](self, "underlyingDictionaryOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!v4)
  {
    os_unfair_lock_lock_with_options();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", self->_underlyingDictionary, 1);
    os_unfair_lock_unlock(&self->_internalStateLock);
  }
  +[AMSDefaults metricsCanaryIdentifier](AMSDefaults, "metricsCanaryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("canaryIdentifier"));

  return (NSDictionary *)v4;
}

- (NSDictionary)underlyingDictionaryOverride
{
  return self->_underlyingDictionaryOverride;
}

- (void)addPropertiesWithDictionary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AMSMetricsEvent topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", 0x1E255E360);

  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0x1E255E360, CFSTR("topic"));
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary addEntriesFromDictionary:](self->_underlyingDictionary, "addEntriesFromDictionary:", v7);
  os_unfair_lock_unlock(&self->_internalStateLock);

}

- (id)_propertyForBodyKey:(id)a3 clientOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  os_unfair_lock_s *p_internalStateLock;
  NSMutableDictionary *underlyingDictionary;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  underlyingDictionary = self->_underlyingDictionary;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](underlyingDictionary, "objectForKeyedSubscript:", CFSTR("clientOnlyProperties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](underlyingDictionary, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_internalStateLock);

  return v10;
}

- (id)propertyForBodyKey:(id)a3
{
  return -[AMSMetricsEvent _propertyForBodyKey:clientOnly:](self, "_propertyForBodyKey:clientOnly:", a3, 0);
}

- (NSString)topic
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("topic"));
}

- (BOOL)isAnonymous
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("anonymous"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (ACAccount)account
{
  os_unfair_lock_s *p_internalStateLock;
  ACAccount *v4;

  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_account;
  os_unfair_lock_unlock(p_internalStateLock);
  return v4;
}

- (NSString)canaryIdentifier
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("canaryIdentifier"));
}

- (NSString)clientIdentifier
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientId"));
}

+ (id)_deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v25 = a1;
  objc_msgSend(a1, "_propertyValueClassesForKnownProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    v10 = CFSTR("topic");
    *(_QWORD *)&v7 = 138543874;
    v24 = v7;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x18D78A1C4]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v12;
          v15 = v14;
          if (objc_msgSend(v14, "isEqualToString:", CFSTR("mtTopic")))
          {
            objc_msgSend(v27, "objectForKeyedSubscript:", v10);
            v16 = v10;
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v10 = v16;
              goto LABEL_19;
            }

            v15 = (void *)v16;
            v10 = v16;
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", v14, v24);
          v18 = objc_claimAutoreleasedReturnValue();
          +[AMSMetricsEvent _deepCopiedJSONObjectOrNilForObject:key:enforcingClassUsingKnownPropertiesClassMapping:](AMSMetricsEvent, "_deepCopiedJSONObjectOrNilForObject:key:enforcingClassUsingKnownPropertiesClassMapping:", v18, v15, v26);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, v15);

        }
        else
        {
          +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "OSLogObject", v24);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            AMSLogKey();
            v19 = v10;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            AMSHashIfNeeded(v12);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v33 = v25;
            v34 = 2114;
            v35 = v20;
            v36 = 2114;
            v37 = v21;
            _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempting to add a property with non-NSString key: %{public}@", buf, 0x20u);

            v10 = v19;
          }
        }

        v14 = v15;
LABEL_19:

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v8);
  }

  return v27;
}

- (void)_setProperty:(id)a3 forBodyKey:(id)a4 clientOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  if (v13)
  {
    objc_msgSend((id)objc_opt_class(), "_propertyValueClassesForKnownProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetricsEvent _deepCopiedJSONObjectOrNilForObject:key:enforcingClassUsingKnownPropertiesClassMapping:](AMSMetricsEvent, "_deepCopiedJSONObjectOrNilForObject:key:enforcingClassUsingKnownPropertiesClassMapping:", v13, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_13;
  }
  else
  {
    v10 = 0;
  }
  os_unfair_lock_lock_with_options();
  v11 = self->_underlyingDictionary;
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_underlyingDictionary, "objectForKeyedSubscript:", CFSTR("clientOnlyProperties"));
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v12;
        goto LABEL_12;
      }
      v11 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v12, "mutableCopy");

    }
    else
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_underlyingDictionary, "setObject:forKeyedSubscript:", v11, CFSTR("clientOnlyProperties"));
  }
LABEL_12:
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v8);
  os_unfair_lock_unlock(&self->_internalStateLock);

LABEL_13:
}

+ (id)_deepCopiedJSONObjectOrNilForObject:(id)a3 key:(id)a4 enforcingClassUsingKnownPropertiesClassMapping:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _BOOL4 v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[AMSMetricsEvent _deepCopiedJSONObjectOrNilForObject:](AMSMetricsEvent, "_deepCopiedJSONObjectOrNilForObject:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = a1;
      v41 = 2114;
      v42 = v20;
      v43 = 2114;
      v44 = v21;
      v45 = 2114;
      v46 = (uint64_t)v22;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [FILE A RADAR] Invalid metrics property. Property must be JSON serializable. Key: %{public}@ Property: %{public}@", buf, 0x2Au);

    }
    goto LABEL_15;
  }
  v12 = objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  if (!v12)
    goto LABEL_17;
  v13 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = a1;
      v41 = 2114;
      v42 = v16;
      v43 = 2114;
      v44 = v17;
      v45 = 2114;
      v46 = v13;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to set NSNull as property value from dictionary: key = %{public}@, expected value class = %{public}@. Not setting any value for this key.", buf, 0x2Au);

    }
    goto LABEL_9;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_17:
    v23 = v11;
    goto LABEL_18;
  }
  v25 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v26 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v26;
  if (v25)
  {
    if (!v26)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v9);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v40 = a1;
      v41 = 2114;
      v42 = v37;
      v43 = 2114;
      v44 = v36;
      v45 = 2114;
      v46 = (uint64_t)v28;
      v47 = 2114;
      v48 = (id)objc_opt_class();
      v49 = 2114;
      v50 = v13;
      v29 = v48;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempting to set property of invalid class from dictionary: key = %{public}@, value = %{public}@, value class = %{public}@, expected class = %{public}@", buf, 0x3Eu);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v31, 0);

    goto LABEL_15;
  }
  if (!v26)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "OSLogObject");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    AMSLogKey();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v40 = a1;
    v41 = 2114;
    v42 = v38;
    v43 = 2114;
    v44 = v33;
    v45 = 2114;
    v46 = (uint64_t)v34;
    v47 = 2114;
    v48 = (id)objc_opt_class();
    v49 = 2114;
    v50 = v13;
    v35 = v48;
    _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Attempting to set property of invalid class from dictionary: key = %{public}@, value = %{public}@, value class = %{public}@, expected class = %{public}@", buf, 0x3Eu);

  }
LABEL_9:

LABEL_15:
  v23 = 0;
LABEL_18:

  return v23;
}

+ (id)_deepCopiedJSONObjectOrNilForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB36D8];
  v25[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isValidJSONObject:", v6);

  if ((v5 & 1) != 0)
  {
    AMSMetricsEventDeepCopyJSONObject(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB36D8];
    v24 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v8, "dataWithJSONObject:options:error:", v9, 0, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;

    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = a1;
      v20 = 2114;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error converting object to JSON data: %{public}@", buf, 0x20u);

    }
    v7 = 0;
  }

  return v7;
}

+ (id)_propertyValueClassesForKnownProperties
{
  _QWORD v3[22];
  _QWORD v4[23];

  v4[22] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("app");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("appVersion");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("anonymous");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("baseVersion");
  v4[3] = objc_opt_class();
  v3[4] = CFSTR("canaryIdentifier");
  v4[4] = objc_opt_class();
  v3[5] = CFSTR("clientEventId");
  v4[5] = objc_opt_class();
  v3[6] = CFSTR("clientId");
  v4[6] = objc_opt_class();
  v3[7] = CFSTR("engagementMetrics");
  v4[7] = objc_opt_class();
  v3[8] = CFSTR("eventTime");
  v4[8] = objc_opt_class();
  v3[9] = CFSTR("eventType");
  v4[9] = objc_opt_class();
  v3[10] = CFSTR("eventVersion");
  v4[10] = objc_opt_class();
  v3[11] = CFSTR("osBuildVersion");
  v4[11] = objc_opt_class();
  v3[12] = CFSTR("osName");
  v4[12] = objc_opt_class();
  v3[13] = CFSTR("osVersion");
  v4[13] = objc_opt_class();
  v3[14] = CFSTR("timezoneOffset");
  v4[14] = objc_opt_class();
  v3[15] = CFSTR("topic");
  v4[15] = objc_opt_class();
  v3[16] = CFSTR("clientOnlyProperties");
  v4[16] = objc_opt_class();
  v3[17] = CFSTR("checkDU");
  v4[17] = objc_opt_class();
  v3[18] = CFSTR("diagnosticsSubmissionBugType");
  v4[18] = objc_opt_class();
  v3[19] = CFSTR("preventSampling");
  v4[19] = objc_opt_class();
  v3[20] = CFSTR("engagementEvent");
  v4[20] = objc_opt_class();
  v3[21] = CFSTR("suppressEngagement");
  v4[21] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 22);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDictionaryOverride, 0);
  objc_storeStrong((id *)&self->_databasePID, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_underlyingDictionary, 0);
}

- (AMSMetricsEvent)initWithTopic:(id)a3
{
  id v4;
  AMSMetricsEvent *v5;
  AMSMetricsEvent *v6;
  uint64_t v7;
  NSMutableDictionary *underlyingDictionary;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AMSMetricsEvent;
  v5 = -[AMSMetricsEvent init](&v32, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_internalStateLock._os_unfair_lock_opaque = 0;
    AMSMetricsEventDefaultUnderlyingDictionary();
    v7 = objc_claimAutoreleasedReturnValue();
    underlyingDictionary = v6->_underlyingDictionary;
    v6->_underlyingDictionary = (NSMutableDictionary *)v7;

    v9 = 0x1E0CB3000uLL;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v4, "copy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_underlyingDictionary, "setObject:forKeyedSubscript:", v10, CFSTR("topic"));
    }
    else
    {
      v11 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v12 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v12;
      if (v11)
      {
        if (!v12)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "OSLogObject");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0CB3940];
          v16 = objc_opt_class();
          v17 = v16;
          if (v14)
          {
            AMSLogKey();
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] "), v17, v9);
          }
          else
          {
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: "), v16);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v34 = v18;
          v35 = 2114;
          v36 = v25;
          v37 = 2114;
          v38 = v26;
          v27 = v26;
          _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@Attempting to construct metrics event with non-NSString topic: topic = %{public}@, topic class = %{public}@", buf, 0x20u);
          if (v14)
          {

            v18 = (void *)v9;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v19, 0);
      }
      else
      {
        if (!v12)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "OSLogObject");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          AMSLogKey();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0CB3940];
          v22 = objc_opt_class();
          v23 = v22;
          if (v20)
          {
            AMSLogKey();
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v23, v9);
          }
          else
          {
            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22);
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v4);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v34 = v24;
          v35 = 2114;
          v36 = v28;
          v37 = 2114;
          v38 = v29;
          v30 = v29;
          _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_FAULT, "%{public}@Attempting to construct metrics event with non-NSString topic: topic = %{public}@, topic class = %{public}@", buf, 0x20u);
          if (v20)
          {

            v24 = (void *)v9;
          }

        }
      }

    }
    if (objc_msgSend(v4, "isEqual:", 0x1E255E360))
      -[AMSMetricsEvent setCheckDiagnosticsAndUsageSetting:](v6, "setCheckDiagnosticsAndUsageSetting:", 1);
  }

  return v6;
}

- (void)setPreventSampling:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent _setProperty:forBodyKey:clientOnly:](self, "_setProperty:forBodyKey:clientOnly:", v4, CFSTR("preventSampling"), 1);

}

- (void)setEventVersion:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventVersion"));
}

- (void)setProperty:(id)a3 forBodyKey:(id)a4
{
  -[AMSMetricsEvent _setProperty:forBodyKey:clientOnly:](self, "_setProperty:forBodyKey:clientOnly:", a3, a4, 0);
}

- (void)setEventType:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventType"));
}

- (NSString)eventType
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventType"));
}

- (BOOL)preventSampling
{
  void *v2;
  char v3;

  -[AMSMetricsEvent _propertyForBodyKey:clientOnly:](self, "_propertyForBodyKey:clientOnly:", CFSTR("preventSampling"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (AMSMetricsEvent)initWithDatabaseEventBody:(id)a3 account:(id)a4 databasePID:(id)a5
{
  return (AMSMetricsEvent *)-[AMSMetricsEvent _initWithUnderlyingDictionary:account:databasePID:addBasefields:](self, "_initWithUnderlyingDictionary:account:databasePID:addBasefields:", a3, a4, a5, 0);
}

- (id)_initWithUnderlyingDictionary:(id)a3 account:(id)a4 databasePID:(id)a5 addBasefields:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  if (a6)
  {
    v10 = a5;
    v11 = a4;
    v12 = a3;
    AMSMetricsEventDefaultUnderlyingDictionary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetricsEvent _deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:](AMSMetricsEvent, "_deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:", v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "addEntriesFromDictionary:", v14);
  }
  else
  {
    v15 = a5;
    v16 = a4;
    v14 = a3;
    +[AMSMetricsEvent _deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:](AMSMetricsEvent, "_deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v17 = -[AMSMetricsEvent _initWithSanitizedUnderlyingDictionary:account:databasePID:](self, "_initWithSanitizedUnderlyingDictionary:account:databasePID:", v13, a4, a5);
  return v17;
}

- (void)setAccount:(id)a3
{
  ACAccount *v4;
  ACAccount *account;

  v4 = (ACAccount *)a3;
  os_unfair_lock_lock_with_options();
  account = self->_account;
  self->_account = v4;

  os_unfair_lock_unlock(&self->_internalStateLock);
}

- (NSNumber)databasePID
{
  os_unfair_lock_s *p_internalStateLock;
  NSNumber *v4;

  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_databasePID;
  os_unfair_lock_unlock(p_internalStateLock);
  return v4;
}

- (AMSMetricsEvent)initWithUnderlyingDictionary:(id)a3
{
  return (AMSMetricsEvent *)-[AMSMetricsEvent _initWithUnderlyingDictionary:account:databasePID:addBasefields:](self, "_initWithUnderlyingDictionary:account:databasePID:addBasefields:", a3, 0, 0, 1);
}

- (id)initForEngagement
{
  void *v3;
  void *v4;
  id v5;

  AMSMetricsEventDefaultUnderlyingDictionary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clientOnlyProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("engagementEvent"));

  v5 = -[AMSMetricsEvent _initWithSanitizedUnderlyingDictionary:account:databasePID:](self, "_initWithSanitizedUnderlyingDictionary:account:databasePID:", v3, 0, 0);
  return v5;
}

+ (id)createEventFromAuthenticationContext:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AMSMetricsEvent *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_topicFromAuthenticationContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[AMSMetricsEvent initWithTopic:]([AMSMetricsEvent alloc], "initWithTopic:", v8);
    -[AMSMetricsEvent setProperty:forBodyKey:](v9, "setProperty:forBodyKey:", CFSTR("SignIn"), CFSTR("dialogType"));
    -[AMSMetricsEvent setProperty:forBodyKey:](v9, "setProperty:forBodyKey:", CFSTR("dialog"), CFSTR("eventType"));
    objc_msgSend(v6, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
      v12 = CFSTR("Password");
    else
      v12 = CFSTR("UserNamePassword");
    -[AMSMetricsEvent setProperty:forBodyKey:](v9, "setProperty:forBodyKey:", v12, CFSTR("dialogId"));
    v13 = CFSTR("Ok");
    if (v7)
    {
      if (objc_msgSend(v7, "code") == -7003)
      {
        v13 = CFSTR("Cancel");
        v14 = CFSTR("cancel");
      }
      else
      {
        v14 = CFSTR("enterPassword");
      }
      v15 = CFSTR("failure");
    }
    else
    {
      v14 = CFSTR("ok");
      v15 = CFSTR("success");
    }
    -[AMSMetricsEvent setProperty:forBodyKey:](v9, "setProperty:forBodyKey:", v14, CFSTR("actionType"));
    -[AMSMetricsEvent setProperty:forBodyKey:](v9, "setProperty:forBodyKey:", v15, CFSTR("result"));
    -[AMSMetricsEvent setProperty:forBodyKey:](v9, "setProperty:forBodyKey:", v13, CFSTR("targetId"));
    objc_msgSend(v6, "clientInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("metricsAuthenticationAttempts"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMetricsEvent setProperty:forBodyKey:](v9, "setProperty:forBodyKey:", v17, CFSTR("userActions"));

    }
    objc_msgSend(a1, "_buyParamsStringFromAuthenticationContext:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
    {
      v23 = CFSTR("buyParams");
      v24[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMetricsEvent setProperty:forBodyKey:](v9, "setProperty:forBodyKey:", v20, CFSTR("details"));

    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsUserAgentKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      -[AMSMetricsEvent setProperty:forBodyKey:](v9, "setProperty:forBodyKey:", v21, CFSTR("userAgent"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)metricsAuthenticationAttemptDictionaryForAuthKitError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("authenticate"), CFSTR("targetId"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), (uint64_t)(v7 * 1000.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("responseTime"));
  if (v3)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("failure"), CFSTR("result"));
    v9 = objc_msgSend(v3, "code");
    v10 = CFSTR("unknown");
    if (v9 == -7006)
      v10 = CFSTR("invalidCredentials");
    if (v9 == -7010)
      v10 = CFSTR("badServerResponse");
    if (v9 == -7028)
      v11 = CFSTR("maxNumberOfAttemptsReached");
    else
      v11 = v10;
    v12 = CFSTR("reason");
  }
  else
  {
    v11 = CFSTR("success");
    v12 = CFSTR("result");
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

  return v4;
}

+ (id)_buyParamsFromString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count") == 2)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (!v14)
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  v15 = (void *)objc_msgSend(v4, "copy");

  return v15;
}

+ (id)_buyParamsStringFromAuthenticationContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateOptionsCreateAccountQueryParamsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("product"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_topicFromAuthenticationContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_buyParamsStringFromAuthenticationContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "_buyParamsFromString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mtTopic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)sanitizedObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
LABEL_5:
    v6 = v5;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "timeIntervalSince1970");
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%lld"), (uint64_t)v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v11);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x18D78A1C4]();
          objc_msgSend(a1, "sanitizedObject:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v6, "addObject:", v18);

          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v13);
    }
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = v4;
    v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v11);
          v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          v24 = (void *)MEMORY[0x18D78A1C4]();
          objc_msgSend(a1, "sanitizedObject:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v6, "addObject:", v25);

          objc_autoreleasePoolPop(v24);
        }
        v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v20);
    }
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __35__AMSMetricsEvent_sanitizedObject___block_invoke;
    v27[3] = &unk_1E2543838;
    v29 = a1;
    v6 = v26;
    v28 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v27);

  }
  else
  {
    v6 = 0;
  }
LABEL_6:

  return v6;
}

void __35__AMSMetricsEvent_sanitizedObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x18D78A1C4]();
  objc_msgSend(*(id *)(a1 + 40), "sanitizedObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v7)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  objc_autoreleasePoolPop(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_internalStateLock;
  id v5;
  id v6;

  p_internalStateLock = &self->_internalStateLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_underlyingDictionary, 1);
  os_unfair_lock_unlock(p_internalStateLock);
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("underlyingDictionary"));

}

- (AMSMetricsEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  AMSMetricsEvent *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "ams_JSONClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("underlyingDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSMetricsEvent initWithUnderlyingDictionary:](self, "initWithUnderlyingDictionary:", v7);
  return v8;
}

- (NSString)app
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("app"));
}

- (NSString)appVersion
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("appVersion"));
}

- (NSNumber)baseVersion
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("baseVersion"));
}

- (NSString)clientEventID
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientEventId"));
}

- (NSDictionary)engagementMetrics
{
  return (NSDictionary *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("engagementMetrics"));
}

- (NSNumber)eventTime
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventTime"));
}

- (NSNumber)eventVersion
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventVersion"));
}

- (NSString)osBuildVersion
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("osBuildVersion"));
}

- (NSString)osName
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("osName"));
}

- (NSString)osVersion
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("osVersion"));
}

- (NSNumber)timezoneOffset
{
  return (NSNumber *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("timezoneOffset"));
}

- (void)setApp:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("app"));
}

- (void)setBaseVersion:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("baseVersion"));
}

- (void)setCanaryIdentifier:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("canaryIdentifier"));
}

- (void)setCheckDiagnosticsAndUsageSetting:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent _setProperty:forBodyKey:clientOnly:](self, "_setProperty:forBodyKey:clientOnly:", v4, CFSTR("checkDU"), 1);

}

- (void)setClientEventID:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("clientEventId"));
}

- (void)setClientIdentifier:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("clientId"));
}

- (void)setDiagnosticsSubmissionBugType:(id)a3
{
  -[AMSMetricsEvent _setProperty:forBodyKey:clientOnly:](self, "_setProperty:forBodyKey:clientOnly:", a3, CFSTR("diagnosticsSubmissionBugType"), 1);
}

- (void)setEventTime:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventTime"));
}

- (void)setOsBuildVersion:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("osBuildVersion"));
}

- (void)setOsName:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("osName"));
}

- (void)setOsVersion:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("osVersion"));
}

- (void)setTimezoneOffset:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("timezoneOffset"));
}

@end
