@implementation ATXChargerPluggedInDuetEvent

- (ATXChargerPluggedInDuetEvent)initWithChargerPluggedInState:(int64_t)a3 adapterType:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v10;
  ATXChargerPluggedInDuetEvent *v11;
  ATXChargerPluggedInDuetEvent *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXChargerPluggedInDuetEvent;
  v11 = -[ATXDuetEvent initWithStartDate:endDate:](&v17, sel_initWithStartDate_endDate_, a5, a6);
  v12 = v11;
  if (v11)
  {
    v11->_chargerPluggedInState = a3;
    v13 = objc_msgSend(v10, "copy");
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = &unk_1E83CD2D0;
    objc_storeStrong((id *)&v12->_adapterType, v15);

  }
  return v12;
}

- (ATXChargerPluggedInDuetEvent)initWithDKEvent:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  ATXChargerPluggedInDuetEvent *v15;
  NSObject *v16;
  void *v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXChargerPluggedInDuetEvent.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXScreenLockStateDuetEvent initWithDKEvent:].cold.1(v5, v12);
    goto LABEL_12;
  }
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v5, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D159E0], "adapterType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ATXChargerPluggedInDuetEvent initWithDKEvent:].cold.1((uint64_t)v12, v16);

LABEL_12:
      v15 = 0;
      goto LABEL_13;
    }
  }
  objc_msgSend(v5, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXChargerPluggedInDuetEvent initWithChargerPluggedInState:adapterType:startDate:endDate:](self, "initWithChargerPluggedInState:adapterType:startDate:endDate:", v9, v12, v13, v14);

  v15 = self;
LABEL_13:

  return v15;
}

- (ATXChargerPluggedInDuetEvent)initWithCurrentContextStoreValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  ATXChargerPluggedInDuetEvent *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  NSObject *v23;
  void *v25;
  id v26;
  void *v27;
  ATXChargerPluggedInDuetEvent *v28;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForBatteryStateDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D15C58], "batteryExternalConnectedKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0D15C58], "batteryExternalConnectedKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");

        objc_msgSend(MEMORY[0x1E0D15C58], "batteryAdapterTypeKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_opt_class();
          v14 = objc_opt_isKindOfClass();
          v15 = v13;
          if ((v14 & 1) == 0)
          {
            __atxlog_handle_default();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              -[ATXChargerPluggedInDuetEvent initWithCurrentContextStoreValues].cold.2();

            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Value for 'batteryAdapterTypeKey' in ContextStore's 'keyPathForBatteryStateDataDictionary' is not an NSNumber."));
            v17 = 0;
            goto LABEL_23;
          }
        }
        else
        {
          v15 = &unk_1E83CD2D0;
        }
        v25 = (void *)MEMORY[0x1E0C99D68];
        v26 = v15;
        objc_msgSend(v25, "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[ATXChargerPluggedInDuetEvent initWithChargerPluggedInState:adapterType:startDate:endDate:](self, "initWithChargerPluggedInState:adapterType:startDate:endDate:", v11, v26, v27, v27);

        self = v28;
        v17 = self;
LABEL_23:

        goto LABEL_20;
      }
      __atxlog_handle_default();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[ATXChargerPluggedInDuetEvent initWithCurrentContextStoreValues].cold.3();

      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = *MEMORY[0x1E0C99768];
      v22 = CFSTR("Value for 'batteryExternalConnectedKey' in ContextStore's 'keyPathForBatteryStateDataDictionary' is not an NSNumber.");
    }
    else
    {
      __atxlog_handle_default();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ATXChargerPluggedInDuetEvent initWithCurrentContextStoreValues].cold.4();

      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = *MEMORY[0x1E0C99768];
      v22 = CFSTR("ContextStore's 'keyPathForBatteryStateDataDictionary' is not an NSDictionary.");
    }
    objc_msgSend(v20, "raise:format:", v21, v22);
  }
  else
  {
    __atxlog_handle_default();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXChargerPluggedInDuetEvent initWithCurrentContextStoreValues].cold.1();

  }
  v17 = 0;
LABEL_20:

  return v17;
}

- (id)identifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ChargerPluggedIn_1_%@"), self->_adapterType);
}

- (id)description
{
  id v3;
  int64_t chargerPluggedInState;
  NSNumber *adapterType;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  chargerPluggedInState = self->_chargerPluggedInState;
  adapterType = self->_adapterType;
  -[ATXDuetEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Charger Plugged In state: %ld, adapter type: %@, start date: %@, end date: %@"), chargerPluggedInState, adapterType, v6, v7);

  return v8;
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
  id v7;

  v4 = a3;
  -[ATXDuetEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForStartDate"));

  -[ATXDuetEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForEndDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXChargerPluggedInDuetEvent chargerPluggedInState](self, "chargerPluggedInState"), CFSTR("codingKeyForChargerPluggedInState"));
  -[ATXChargerPluggedInDuetEvent adapterType](self, "adapterType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForAdapterType"));

}

- (ATXChargerPluggedInDuetEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXChargerPluggedInDuetEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForStartDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_anchor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForEndDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15)
      || (v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingKeyForChargerPluggedInState")),
          -[ATXChargerPluggedInDuetEvent checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", v16, CFSTR("codingKeyForChargerPluggedInState"), v4, CFSTR("com.apple.proactive.ATXDuetEvent"), -1)))
    {
      v10 = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0D81610];
      v19 = objc_opt_class();
      __atxlog_handle_anchor();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v19, CFSTR("codingKeyForAdapterType"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21
        && (objc_msgSend(v4, "error"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, !v22))
      {
        self = -[ATXChargerPluggedInDuetEvent initWithChargerPluggedInState:adapterType:startDate:endDate:](self, "initWithChargerPluggedInState:adapterType:startDate:endDate:", v16, v21, v8, v14);
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

  return v10;
}

- (int64_t)chargerPluggedInState
{
  return self->_chargerPluggedInState;
}

- (NSNumber)adapterType
{
  return self->_adapterType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapterType, 0);
}

- (void)initWithDKEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Value for metadata key for ChargerPluggedIn 'adapterType' is not an NSNumber, %@", (uint8_t *)&v2, 0xCu);
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
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ContextStore's 'keyPathForBatteryStateDataDictionary' is not an NSDictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
