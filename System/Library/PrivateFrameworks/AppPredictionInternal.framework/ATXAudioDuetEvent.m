@implementation ATXAudioDuetEvent

- (ATXAudioDuetEvent)initWithAudioState:(int64_t)a3 deviceIdentifier:(id)a4 portType:(id)a5 portName:(id)a6 routeChangeReason:(id)a7 startDate:(id)a8 endDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  ATXAudioDuetEvent *v19;
  ATXAudioDuetEvent *v20;
  ATXAudioDuetEvent *v21;
  uint64_t v22;
  NSString *deviceIdentifier;
  uint64_t v24;
  NSString *portType;
  uint64_t v26;
  NSString *portName;
  objc_super v29;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = 0;
  if (v15 && a8)
  {
    v29.receiver = self;
    v29.super_class = (Class)ATXAudioDuetEvent;
    v20 = -[ATXDuetEvent initWithStartDate:endDate:](&v29, sel_initWithStartDate_endDate_, a8, a9);
    v21 = v20;
    if (v20)
    {
      v20->_audioState = a3;
      v22 = objc_msgSend(v15, "copy");
      deviceIdentifier = v21->_deviceIdentifier;
      v21->_deviceIdentifier = (NSString *)v22;

      v24 = objc_msgSend(v16, "copy");
      portType = v21->_portType;
      v21->_portType = (NSString *)v24;

      v26 = objc_msgSend(v17, "copy");
      portName = v21->_portName;
      v21->_portName = (NSString *)v26;

      objc_storeStrong((id *)&v21->_routeChangeReason, a7);
    }
    self = v21;
    v19 = self;
  }

  return v19;
}

- (ATXAudioDuetEvent)initWithDKEvent:(id)a3
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
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  ATXAudioDuetEvent *v24;
  NSObject *v25;
  void *v27;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAudioDuetEvent.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

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

    objc_msgSend(v5, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D159A8], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ATXAudioDuetEvent initWithDKEvent:].cold.1();
      v24 = 0;
      goto LABEL_30;
    }
    objc_msgSend(v5, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D159A8], "portType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      __atxlog_handle_default();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXAudioDuetEvent initWithDKEvent:].cold.2();
      v24 = 0;
      goto LABEL_29;
    }
    objc_msgSend(v5, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D159A8], "portName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "metadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D159A8], "routeChangeReason");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "endDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[ATXAudioDuetEvent initWithAudioState:deviceIdentifier:portType:portName:routeChangeReason:startDate:endDate:](self, "initWithAudioState:deviceIdentifier:portType:portName:routeChangeReason:startDate:endDate:", v9, v12, v15, v18, v21, v22, v23);

          v24 = self;
LABEL_28:

LABEL_29:
LABEL_30:

          goto LABEL_31;
        }
      }
      __atxlog_handle_default();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[ATXAudioDuetEvent initWithDKEvent:].cold.4();

    }
    else
    {
      __atxlog_handle_default();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[ATXAudioDuetEvent initWithDKEvent:].cold.3();
    }
    v24 = 0;
    goto LABEL_28;
  }
  __atxlog_handle_default();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[ATXScreenLockStateDuetEvent initWithDKEvent:].cold.1(v5, v12);
  v24 = 0;
LABEL_31:

  return v24;
}

- (ATXAudioDuetEvent)initWithCurrentContextStoreValues
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
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  ATXAudioDuetEvent *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  const __CFString *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  __CFString *v54;
  __CFString *v55;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForAudioOutputDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    __atxlog_handle_default();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.1();

    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.7();

    v45 = (void *)MEMORY[0x1E0C99DA0];
    v46 = *MEMORY[0x1E0C99768];
    v47 = CFSTR("ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSDictionary.");
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "audioOutputStatusKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    __atxlog_handle_default();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.6();

    v45 = (void *)MEMORY[0x1E0C99DA0];
    v46 = *MEMORY[0x1E0C99768];
    v47 = CFSTR("Value for 'audioOutputStatusKey' in ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSNumber.");
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "audioOutputStatusKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(MEMORY[0x1E0D15C58], "audioIdentifierKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) == 0)
  {
    __atxlog_handle_default();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.5();

    v45 = (void *)MEMORY[0x1E0C99DA0];
    v46 = *MEMORY[0x1E0C99768];
    v47 = CFSTR("Value for 'audioIdentifierKey' in ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSString.");
LABEL_30:
    objc_msgSend(v45, "raise:format:", v46, v47);
LABEL_31:
    v42 = 0;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "audioIdentifierKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (__CFString *)v16;
  else
    v18 = &stru_1E82FDC98;
  v55 = v18;

  objc_msgSend(MEMORY[0x1E0D15C58], "audioPortTypeKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v21 = objc_opt_isKindOfClass();

  if ((v21 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D15C58], "audioPortTypeKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (__CFString *)v23;
    else
      v25 = &stru_1E82FDC98;
    v26 = v25;

    objc_msgSend(MEMORY[0x1E0D15C58], "audioPortNameKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) != 0)
    {
      v54 = v26;
      objc_msgSend(MEMORY[0x1E0D15C58], "audioPortNameKey");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (v31)
        v33 = (__CFString *)v31;
      else
        v33 = &stru_1E82FDC98;
      v34 = v33;

      objc_msgSend(MEMORY[0x1E0D15C58], "audioRouteChangeReasonKey");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v37 = objc_opt_isKindOfClass();

      if ((v37 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0D15C58], "audioRouteChangeReasonKey");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v55;
        self = -[ATXAudioDuetEvent initWithAudioState:deviceIdentifier:portType:portName:routeChangeReason:startDate:endDate:](self, "initWithAudioState:deviceIdentifier:portType:portName:routeChangeReason:startDate:endDate:", v11, v55, v54, v34, v39, v40, v40);

        v42 = self;
      }
      else
      {
        __atxlog_handle_default();
        v53 = objc_claimAutoreleasedReturnValue();
        v41 = v55;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.2();

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Value for 'audioRouteChangeReasonKey' in ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSNumber."));
        v42 = 0;
      }

      v26 = v54;
    }
    else
    {
      __atxlog_handle_default();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.3();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Value for 'audioPortNameKey' in ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSString."));
      v42 = 0;
      v41 = v55;
    }

  }
  else
  {
    __atxlog_handle_default();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.4();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Value for 'audioPortTypeKey' in ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSString."));
    v42 = 0;
    v41 = v55;
  }

LABEL_32:
  return v42;
}

- (id)description
{
  void *v3;
  NSString *deviceIdentifier;
  NSString *portType;
  NSString *portName;
  int64_t audioState;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  deviceIdentifier = self->_deviceIdentifier;
  portType = self->_portType;
  portName = self->_portName;
  audioState = self->_audioState;
  -[ATXDuetEvent startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DeviceAudioOutputExternal - Device identifier: %@, port type: %@, port name: %@, audio connected state: %ld, start date: %@, end date: %@"), deviceIdentifier, portType, portName, audioState, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ATXDuetEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForStartDate"));

  -[ATXDuetEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForEndDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXAudioDuetEvent audioState](self, "audioState"), CFSTR("codingKeyForAudioState"));
  -[ATXAudioDuetEvent deviceIdentifier](self, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForDeviceId"));

  -[ATXAudioDuetEvent portType](self, "portType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("codingKeyForPortType"));

  -[ATXAudioDuetEvent portName](self, "portName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("codingKeyForPortName"));

  -[ATXAudioDuetEvent routeChangeReason](self, "routeChangeReason");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("codingKeyForRouteChangeReason"));

}

- (ATXAudioDuetEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXAudioDuetEvent *v10;
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
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForStartDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.Audio"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_anchor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForEndDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.Audio"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15)
      || (v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingKeyForAudioState")),
          -[ATXAudioDuetEvent checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", v16, CFSTR("codingKeyForAudioState"), v4, CFSTR("com.apple.proactive.ATXDuetEvent.Audio"), -1)))
    {
      v10 = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0D81610];
      v19 = objc_opt_class();
      __atxlog_handle_anchor();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v19, CFSTR("codingKeyForDeviceId"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.Audio"), -1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21
        && (objc_msgSend(v4, "error"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, !v22))
      {
        v23 = (void *)MEMORY[0x1E0D81610];
        v24 = objc_opt_class();
        __atxlog_handle_anchor();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v24, CFSTR("codingKeyForPortType"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.Audio"), -1, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26
          && (objc_msgSend(v4, "error"), v27 = (void *)objc_claimAutoreleasedReturnValue(), v27, !v27))
        {
          v37 = (void *)MEMORY[0x1E0D81610];
          v28 = objc_opt_class();
          __atxlog_handle_anchor();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v28, CFSTR("codingKeyForPortName"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.Audio"), -1, v29);
          v30 = objc_claimAutoreleasedReturnValue();

          v31 = (void *)v30;
          if (v30
            && (objc_msgSend(v4, "error"), v32 = (void *)objc_claimAutoreleasedReturnValue(), v32, !v32))
          {
            v38 = (void *)MEMORY[0x1E0D81610];
            v33 = objc_opt_class();
            __atxlog_handle_anchor();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v33, CFSTR("codingKeyForRouteChangeReason"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.Audio"), -1, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35
              && (objc_msgSend(v4, "error"), v36 = (void *)objc_claimAutoreleasedReturnValue(), v36, !v36))
            {
              self = -[ATXAudioDuetEvent initWithAudioState:deviceIdentifier:portType:portName:routeChangeReason:startDate:endDate:](self, "initWithAudioState:deviceIdentifier:portType:portName:routeChangeReason:startDate:endDate:", v16, v21, v26, v31, v35, v8, v14);
              v10 = self;
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

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)audioState
{
  return self->_audioState;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)portType
{
  return self->_portType;
}

- (NSString)portName
{
  return self->_portName;
}

- (NSNumber)routeChangeReason
{
  return self->_routeChangeReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeChangeReason, 0);
  objc_storeStrong((id *)&self->_portName, 0);
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
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

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Value for metadata key for DeviceAudioOutputExternal 'identifier' is not a string, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDKEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Value for metadata key for DeviceAudioOutputExternal 'portType' is not a string, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
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

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Value for metadata key for DeviceAudioOutputExternal 'portName' is not a string, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
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

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Value for metadata key for DeviceAudioOutputExternal 'routeChangeReason' is not a number, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
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
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSDictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
