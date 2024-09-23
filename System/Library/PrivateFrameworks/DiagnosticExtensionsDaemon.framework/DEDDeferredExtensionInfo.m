@implementation DEDDeferredExtensionInfo

+ (id)log
{
  if (log_onceToken_4 != -1)
    dispatch_once(&log_onceToken_4, &__block_literal_global_21);
  return (id)log__log;
}

void __31__DEDDeferredExtensionInfo_log__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ded-deferred-info");
  v1 = (void *)log__log;
  log__log = (uint64_t)v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (double)recommendedGracePeriodForDate:(id)a3
{
  double v3;
  double v4;

  objc_msgSend(a3, "timeIntervalSinceNow");
  v4 = 10.0;
  if (v3 > 60.0)
  {
    v4 = 30.0;
    if (v3 > 300.0)
    {
      if (v3 <= 1800.0)
      {
        return 60.0;
      }
      else if (v3 <= 3600.0)
      {
        return 600.0;
      }
      else if (v3 <= 21600.0)
      {
        return 900.0;
      }
      else
      {
        return dbl_21470E290[v3 > 43200.0];
      }
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bugSessionIdentifier;
  id v5;

  bugSessionIdentifier = self->_bugSessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bugSessionIdentifier, CFSTR("bugSessionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dedIdentifier, CFSTR("dedIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_triggerDate, CFSTR("triggerDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("gracePeriod"), self->_gracePeriod);
  objc_msgSend(v5, "encodeBool:forKey:", self->_scheduled, CFSTR("scheduled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresClassBDataAccess, CFSTR("requiresClassBDataAccess"));

}

- (DEDDeferredExtensionInfo)initWithCoder:(id)a3
{
  id v4;
  DEDDeferredExtensionInfo *v5;
  uint64_t v6;
  NSString *bugSessionIdentifier;
  uint64_t v8;
  DEDExtensionIdentifier *dedIdentifier;
  uint64_t v10;
  NSDate *triggerDate;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSDictionary *parameters;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DEDDeferredExtensionInfo;
  v5 = -[DEDDeferredExtensionInfo init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bugSessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bugSessionIdentifier = v5->_bugSessionIdentifier;
    v5->_bugSessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dedIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    dedIdentifier = v5->_dedIdentifier;
    v5->_dedIdentifier = (DEDExtensionIdentifier *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    triggerDate = v5->_triggerDate;
    v5->_triggerDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("gracePeriod"));
    v5->_gracePeriod = v12;
    v5->_scheduled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("scheduled"));
    v5->_requiresClassBDataAccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresClassBDataAccess"));
    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("parameters"));
    v20 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v20;

  }
  return v5;
}

+ (id)archivedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDExtensionIdentifier archivedClasses](DEDExtensionIdentifier, "archivedClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v9);

  return v8;
}

- (DEDDeferredExtensionInfo)initWithBugSessionIdentifier:(id)a3 dedIdentifier:(id)a4 runOnDate:(id)a5 withGracePeriod:(double)a6
{
  id v11;
  id v12;
  id v13;
  DEDDeferredExtensionInfo *v14;
  DEDDeferredExtensionInfo *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DEDDeferredExtensionInfo;
  v14 = -[DEDDeferredExtensionInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_bugSessionIdentifier, a3);
    objc_storeStrong((id *)&v15->_dedIdentifier, a4);
    objc_storeStrong((id *)&v15->_triggerDate, a5);
    v15->_gracePeriod = a6;
    v15->_scheduled = 0;
  }

  return v15;
}

- (void)setTriggerDate:(id)a3
{
  objc_storeStrong((id *)&self->_triggerDate, a3);
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

+ (id)allInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("deferred-execution-info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(a1, "archivedClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    if (v8)
    {
      objc_msgSend(a1, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[DEDDeferredExtensionInfo allInfo].cold.1((uint64_t)v8, v9);

      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v7;
    }
    v12 = v10;

  }
  else
  {
    objc_msgSend(a1, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_INFO, "Creating dictionary for deferred execution info", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)addToStore
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "activityString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v2, v3, "Archiving failed for extension: %{public}@\nReason:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)removeFromStore
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "activityString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v2, v3, "Archiving failed for extension: %{public}@\nReason: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

+ (void)checkIn
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[16];
  _QWORD handler[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __35__DEDDeferredExtensionInfo_checkIn__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_activity_register("com.apple.diagnosticextensionsd.reschedule", v3, handler);
  objc_msgSend(a1, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_DEFAULT, "Rescheduling all activities", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "allInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDAnalytics didCheckInDeferredExtensionsWithCount:](DEDAnalytics, "didCheckInDeferredExtensionsWithCount:", objc_msgSend(v5, "count"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v5, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "schedule");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v8);
  }

}

void __35__DEDDeferredExtensionInfo_checkIn__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  NSObject *v3;
  uint8_t v4[16];

  if (!xpc_activity_get_state(activity))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "Reschedule activity checking in.", v4, 2u);
    }

  }
}

- (id)criteria
{
  xpc_object_t v3;
  void *v4;
  double v5;
  double v6;
  const char *v7;
  double v8;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6B8], 0);
  if (-[DEDDeferredExtensionInfo requiresClassBDataAccess](self, "requiresClassBDataAccess"))
  {
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6C8], 1);
  }
  else
  {
    -[DEDDeferredExtensionInfo triggerDate](self, "triggerDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5;

    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x24BDAC5B8], (uint64_t)v6);
  }
  v7 = (const char *)*MEMORY[0x24BDAC5D8];
  -[DEDDeferredExtensionInfo gracePeriod](self, "gracePeriod");
  xpc_dictionary_set_int64(v3, v7, (uint64_t)v8);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  return v3;
}

- (void)schedule
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  _QWORD handler[4];
  id v15;
  DEDDeferredExtensionInfo *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[DEDDeferredExtensionInfo setScheduled:](self, "setScheduled:", 1);
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DEDDeferredExtensionInfo activityString](self, "activityString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("transaction.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "UTF8String");
  v7 = (void *)os_transaction_create();
  objc_msgSend((id)objc_opt_class(), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDDeferredExtensionInfo activityString](self, "activityString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v9;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling deferred DE: %{public}@", buf, 0xCu);

  }
  -[DEDDeferredExtensionInfo activityString](self, "activityString");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  v12 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __36__DEDDeferredExtensionInfo_schedule__block_invoke;
  handler[3] = &unk_24D1E50F8;
  v15 = v7;
  v16 = self;
  v13 = v7;
  xpc_activity_register(v11, v12, handler);

  -[DEDDeferredExtensionInfo addToStore](self, "addToStore");
}

void __36__DEDDeferredExtensionInfo_schedule__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "activityString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v6;
        _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Deferred DE is now executing (%{public}@)", (uint8_t *)&v10, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 40), "run");
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "activityString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "Deferred DE is checking in (%{public}@)", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "criteria");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_activity_set_criteria(v3, v9);

  }
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[DEDDaemon sharedInstance](DEDDaemon, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDeferredExtensionInfo bugSessionIdentifier](self, "bugSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "Starting deferred DE for bug session: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  -[DEDDeferredExtensionInfo dedIdentifier](self, "dedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDeferredExtensionInfo parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finallyStartDiagnosticWithIdentifier:parameters:completion:", v9, v10, 0);

}

- (void)unschedule
{
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[DEDDeferredExtensionInfo unschedule]";
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[DEDDeferredExtensionInfo setScheduled:](self, "setScheduled:", 0);
  -[DEDDeferredExtensionInfo removeFromStore](self, "removeFromStore");
  -[DEDDeferredExtensionInfo activityString](self, "activityString");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_activity_unregister((const char *)objc_msgSend(v4, "UTF8String"));

}

- (BOOL)isOverdue
{
  DEDDeferredExtensionInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  -[DEDDeferredExtensionInfo triggerDate](self, "triggerDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "earlierDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDeferredExtensionInfo triggerDate](v2, "triggerDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v5 == v6;

  return (char)v2;
}

- (NSString)activityString
{
  NSString *activityString;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  activityString = self->_activityString;
  if (!activityString)
  {
    v4 = (void *)objc_opt_class();
    -[DEDDeferredExtensionInfo bugSessionIdentifier](self, "bugSessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDDeferredExtensionInfo dedIdentifier](self, "dedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityStringForBugSessionIdentifier:dedIdentifier:", v5, v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_activityString;
    self->_activityString = v7;

    activityString = self->_activityString;
  }
  return activityString;
}

+ (id)activityStringForBugSessionIdentifier:(id)a3 dedIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "extensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "ded_mapWithBlock:", &__block_literal_global_46);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ded_rejectItemsPassingTest:", &__block_literal_global_48);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v11, "count") >= 3)
  {
    objc_msgSend(v11, "subarrayWithRange:", objc_msgSend(v11, "count") - 2, 2);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  if (objc_msgSend(v11, "count"))
  {
    if (objc_msgSend(v6, "invocationNumber"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "invocationNumber"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObject:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
    }
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd.%@.%@"), v5, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __80__DEDDeferredExtensionInfo_activityStringForBugSessionIdentifier_dedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lowercaseString");
}

uint64_t __80__DEDDeferredExtensionInfo_activityStringForBugSessionIdentifier_dedIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("apple")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("diagnosticextension")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("diagnosticextensions"));
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[DEDDeferredExtensionInfo activityString](self, "activityString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)bugSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (DEDExtensionIdentifier)dedIdentifier
{
  return (DEDExtensionIdentifier *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (BOOL)requiresClassBDataAccess
{
  return self->_requiresClassBDataAccess;
}

- (void)setRequiresClassBDataAccess:(BOOL)a3
{
  self->_requiresClassBDataAccess = a3;
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)scheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_dedIdentifier, 0);
  objc_storeStrong((id *)&self->_bugSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_activityString, 0);
}

+ (void)allInfo
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "Unarchiving failed for reason: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
