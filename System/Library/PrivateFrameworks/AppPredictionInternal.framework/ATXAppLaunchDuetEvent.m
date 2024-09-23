@implementation ATXAppLaunchDuetEvent

- (ATXAppLaunchDuetEvent)initWithBundleId:(id)a3 appLaunchState:(int64_t)a4 launchReason:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12;
  id v13;
  ATXAppLaunchDuetEvent *v14;
  uint64_t v15;
  NSString *bundleId;
  uint64_t v17;
  NSString *launchReason;
  objc_super v20;

  v12 = a3;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ATXAppLaunchDuetEvent;
  v14 = -[ATXDuetEvent initWithStartDate:endDate:](&v20, sel_initWithStartDate_endDate_, a6, a7);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    bundleId = v14->_bundleId;
    v14->_bundleId = (NSString *)v15;

    v14->_appLaunchState = a4;
    v17 = objc_msgSend(v13, "copy");
    launchReason = v14->_launchReason;
    v14->_launchReason = (NSString *)v17;

  }
  return v14;
}

- (ATXAppLaunchDuetEvent)initWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  return -[ATXAppLaunchDuetEvent initWithBundleId:appLaunchState:launchReason:startDate:endDate:](self, "initWithBundleId:appLaunchState:launchReason:startDate:endDate:", a3, 1, CFSTR("unknown"), a4, a5);
}

- (ATXAppLaunchDuetEvent)initWithDKEvent:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  ATXAppLaunchDuetEvent *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  NSObject *v27;
  void *v28;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAppLaunchDuetEvent.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("unknown")))
    {
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXAppLaunchDuetEvent initWithDKEvent:].cold.1();
      goto LABEL_23;
    }
    objc_msgSend(v5, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D159A0], "extensionHostIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10 && -[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.springboard")))
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ATXAppLaunchDuetEvent initWithDKEvent:].cold.4();
LABEL_22:

LABEL_23:
      v11 = 0;
LABEL_24:

      goto LABEL_25;
    }
    +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allInstalledAppsKnownToSpringBoard");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v9);

    if ((v17 & 1) == 0)
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ATXAppLaunchDuetEvent initWithDKEvent:].cold.3();
      goto LABEL_22;
    }
    objc_msgSend(v5, "metadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D159A0], "launchReason");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = &stru_1E82FDC98;
    if (v20)
      v22 = (__CFString *)v20;
    v23 = v22;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend((id)objc_opt_class(), "_acceptableLaunchReason:", v23))
      {
        objc_msgSend(v5, "startDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[ATXAppLaunchDuetEvent initWithBundleId:appLaunchState:launchReason:startDate:endDate:](self, "initWithBundleId:appLaunchState:launchReason:startDate:endDate:", v9, 1, v23, v24, v25);

        v11 = self;
LABEL_30:

        goto LABEL_24;
      }
    }
    else
    {
      __atxlog_handle_default();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[ATXAppLaunchDuetEvent initWithDKEvent:].cold.2((uint64_t)v23, v27);

    }
    v11 = 0;
    goto LABEL_30;
  }
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.5(v5, v9);
  v11 = 0;
LABEL_25:

  return v11;
}

- (ATXAppLaunchDuetEvent)initWithCurrentContextStoreValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  ATXAppLaunchDuetEvent *v23;
  ATXAppLaunchDuetEvent *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  NSObject *v30;
  NSObject *v32;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForAppDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    __atxlog_handle_default();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[ATXAppLaunchDuetEvent initWithCurrentContextStoreValues].cold.1();

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[ATXAppLaunchDuetEvent initWithCurrentContextStoreValues].cold.4();

    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99768];
    v29 = CFSTR("ContextStore's 'keyPathForAppDataDictionary' is not an NSDictionary.");
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    __atxlog_handle_default();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[ATXAppLaunchDuetEvent initWithCurrentContextStoreValues].cold.3();

    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99768];
    v29 = CFSTR("Value for 'appBundleIdKey' in ContextStore's 'keyPathForAppDataDictionary' is not an NSString.");
LABEL_21:
    objc_msgSend(v27, "raise:format:", v28, v29);
LABEL_22:
    v24 = 0;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (__CFString *)v10;
  else
    v12 = &stru_1E82FDC98;
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0D15C58], "appLaunchReasonKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D15C58], "appLaunchReasonKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (__CFString *)v18;
    else
      v20 = &stru_1E82FDC98;
    v21 = v20;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[ATXAppLaunchDuetEvent initWithBundleId:appLaunchState:launchReason:startDate:endDate:](self, "initWithBundleId:appLaunchState:launchReason:startDate:endDate:", v13, 1, v21, v22, v22);

    self = v23;
    v24 = self;
  }
  else
  {
    __atxlog_handle_default();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[ATXAppLaunchDuetEvent initWithCurrentContextStoreValues].cold.2();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Value for 'appLaunchReasonKey' in ContextStore's 'keyPathForAppDataDictionary' is not an NSString."));
    v24 = 0;
  }

LABEL_23:
  return v24;
}

- (id)description
{
  void *v3;
  NSString *bundleId;
  int64_t appLaunchState;
  NSString *launchReason;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  bundleId = self->_bundleId;
  appLaunchState = self->_appLaunchState;
  launchReason = self->_launchReason;
  -[ATXDuetEvent startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("App bundleId: %@, App launch state: %ld, App launch reason: %@, start date: %@, end date: %@"), bundleId, appLaunchState, launchReason, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)_acceptableLaunchReason:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ATXDuetEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForStartDate"));

  -[ATXDuetEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForEndDate"));

  -[ATXAppLaunchDuetEvent bundleId](self, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForBundleId"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXAppLaunchDuetEvent appLaunchState](self, "appLaunchState"), CFSTR("codingKeyForAppLaunchState"));
  -[ATXAppLaunchDuetEvent launchReason](self, "launchReason");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("codingKeyForLaunchReason"));

}

- (ATXAppLaunchDuetEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXAppLaunchDuetEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForStartDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.AppLaunch"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_anchor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForEndDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.AppLaunch"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_anchor();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("codingKeyForBundleId"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.AppLaunch"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19
        || (objc_msgSend(v4, "error"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, v20)
        || (v21 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingKeyForAppLaunchState")),
            -[ATXAppLaunchDuetEvent checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", v21, CFSTR("codingKeyForAppLaunchState"), v4, CFSTR("com.apple.proactive.ATXDuetEvent.AppLaunch"), -1)))
      {
        v10 = 0;
      }
      else
      {
        v23 = (void *)MEMORY[0x1E0D81610];
        v24 = objc_opt_class();
        __atxlog_handle_anchor();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v24, CFSTR("codingKeyForLaunchReason"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.AppLaunch"), -1, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26
          && (objc_msgSend(v4, "error"), v27 = (void *)objc_claimAutoreleasedReturnValue(), v27, !v27))
        {
          self = -[ATXAppLaunchDuetEvent initWithBundleId:appLaunchState:launchReason:startDate:endDate:](self, "initWithBundleId:appLaunchState:launchReason:startDate:endDate:", v19, v21, v26, v8, v14);
          v10 = self;
        }
        else
        {
          v10 = 0;
        }

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (int64_t)appLaunchState
{
  return self->_appLaunchState;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)initWithDKEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Received app launch event but bundleId is 'unknown'.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDKEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Value for metadata key 'launchReason' is not a string, %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithDKEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Skipping apps not on SpringBoard.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDKEvent:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Skipping springboard based hosts.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCurrentContextStoreValues
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ContextStore's 'keyPathForAppDataDictionary' is not an NSDictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
