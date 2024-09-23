@implementation ATXScreenLockStateDuetEvent

- (ATXScreenLockStateDuetEvent)initWithScreenLockState:(int64_t)a3 startDate:(id)a4 endDate:(id)a5
{
  ATXScreenLockStateDuetEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXScreenLockStateDuetEvent;
  result = -[ATXDuetEvent initWithStartDate:endDate:](&v7, sel_initWithStartDate_endDate_, a4, a5);
  if (result)
    result->_screenLockState = a3;
  return result;
}

- (ATXScreenLockStateDuetEvent)initWithDKEvent:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ATXScreenLockStateDuetEvent *v12;
  NSObject *v13;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXScreenLockStateDuetEvent.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    objc_msgSend(v5, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ATXScreenLockStateDuetEvent initWithScreenLockState:startDate:endDate:](self, "initWithScreenLockState:startDate:endDate:", v9, v10, v11);

    v12 = self;
  }
  else
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXScreenLockStateDuetEvent initWithDKEvent:].cold.1(v5, v13);

    v12 = 0;
  }

  return v12;
}

- (ATXScreenLockStateDuetEvent)initWithCurrentContextStoreValues
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ATXScreenLockStateDuetEvent *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForDeviceLockStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXScreenLockStateDuetEvent initWithCurrentContextStoreValues].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXScreenLockStateDuetEvent initWithCurrentContextStoreValues].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("ContextStore's 'keyPathForDeviceLockStatus' is not an NSNumber."));
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  v6 = objc_msgSend(v5, "integerValue");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXScreenLockStateDuetEvent initWithScreenLockState:startDate:endDate:](self, "initWithScreenLockState:startDate:endDate:", v6, v7, v7);

  v8 = self;
LABEL_11:

  return v8;
}

- (id)identifier
{
  return CFSTR("Common-ScreenLockState-Identifier");
}

- (id)description
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = -[ATXScreenLockStateDuetEvent screenLockState](self, "screenLockState");
  -[ATXDuetEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Screen Lock state: %ld, start date: %@, end date: %@"), v4, v5, v6);

  return v7;
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
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ATXDuetEvent startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("codingKeyForStartDate"));

  -[ATXDuetEvent endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("codingKeyForEndDate"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[ATXScreenLockStateDuetEvent screenLockState](self, "screenLockState"), CFSTR("codingKeyForScreenLockState"));
}

- (ATXScreenLockStateDuetEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXScreenLockStateDuetEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForStartDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.ScreenLockState"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_anchor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForEndDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.ScreenLockState"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15)
      || (v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingKeyForScreenLockState")),
          -[ATXScreenLockStateDuetEvent checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", v16, CFSTR("codingKeyForScreenLockState"), v4, CFSTR("com.apple.proactive.ATXDuetEvent.ScreenLockState"), -1)))
    {
      v10 = 0;
    }
    else
    {
      self = -[ATXScreenLockStateDuetEvent initWithScreenLockState:startDate:endDate:](self, "initWithScreenLockState:startDate:endDate:", v16, v8, v14);
      v10 = self;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)screenLockState
{
  return self->_screenLockState;
}

- (void)initWithDKEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Value of _DKEvent was %@, not %@", (uint8_t *)&v8, 0x16u);

}

- (void)initWithCurrentContextStoreValues
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ContextStore's 'keyPathForDeviceLockStatus' is not an NSNumber.", a5, a6, a7, a8, 0);
}

@end
