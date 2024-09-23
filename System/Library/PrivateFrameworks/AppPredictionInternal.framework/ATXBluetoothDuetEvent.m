@implementation ATXBluetoothDuetEvent

- (ATXBluetoothDuetEvent)initWithBluetoothState:(int64_t)a3 deviceType:(int64_t)a4 deviceName:(id)a5 hardwareAddress:(id)a6 startDate:(id)a7 endDate:(id)a8
{
  id v14;
  id v15;
  ATXBluetoothDuetEvent *v16;
  ATXBluetoothDuetEvent *v17;
  uint64_t v18;
  NSString *deviceIdentifier;
  uint64_t v20;
  NSString *deviceName;
  objc_super v23;

  v14 = a5;
  v15 = a6;
  v16 = 0;
  if (v15 && a7)
  {
    v23.receiver = self;
    v23.super_class = (Class)ATXBluetoothDuetEvent;
    v17 = -[ATXDuetEvent initWithStartDate:endDate:](&v23, sel_initWithStartDate_endDate_, a7, a8);
    if (v17)
    {
      v18 = objc_msgSend(v15, "copy");
      deviceIdentifier = v17->_deviceIdentifier;
      v17->_deviceIdentifier = (NSString *)v18;

      v20 = objc_msgSend(v14, "copy");
      deviceName = v17->_deviceName;
      v17->_deviceName = (NSString *)v20;

      v17->_bluetoothState = a3;
      v17->_deviceType = a4;
    }
    self = v17;
    v16 = self;
  }

  return v16;
}

- (ATXBluetoothDuetEvent)initWithDKEvent:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  ATXBluetoothDuetEvent *v24;
  NSObject *v26;
  void *v27;
  id v28;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXBluetoothDuetEvent.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

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
    objc_msgSend(MEMORY[0x1E0D159B8], "deviceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ATXBluetoothDuetEvent initWithDKEvent:].cold.1();
      v24 = 0;
      goto LABEL_18;
    }
    v13 = +[ATXBluetoothDuetEvent deviceTypeFromBluetoothDeviceType:](ATXBluetoothDuetEvent, "deviceTypeFromBluetoothDeviceType:", v12);
    if (v13 != 2)
    {
      v14 = v13;
      objc_msgSend(v5, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D159B8], "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v5, "metadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D159B8], "address");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v19);
        v20 = objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = -[NSObject copy](v17, "copy");
            v21 = -[NSObject copy](v20, "copy");
            objc_msgSend(v5, "startDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "endDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            self = -[ATXBluetoothDuetEvent initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:](self, "initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:", v9, v14, v28, v21, v22, v23);

            v24 = self;
LABEL_26:

LABEL_18:
            goto LABEL_19;
          }
        }
        __atxlog_handle_default();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[ATXBluetoothDuetEvent initWithDKEvent:].cold.3();

      }
      else
      {
        __atxlog_handle_default();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[ATXBluetoothDuetEvent initWithDKEvent:].cold.2();
      }
      v24 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXBluetoothDuetEvent initWithDKEvent:].cold.4(v5, v12);
  }
  v24 = 0;
LABEL_19:

  return v24;
}

- (ATXBluetoothDuetEvent)initWithCurrentContextStoreValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  ATXBluetoothDuetEvent *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  objc_class *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForBluetoothDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForBluetoothDataDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_16:
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXBluetoothDuetEvent initWithCurrentContextStoreValues].cold.1(v16, v41, v42, v43, v44, v45, v46, v47);
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "bluetoothNameKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) == 0)
  {
    __atxlog_handle_default();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      -[ATXBluetoothDuetEvent initWithCurrentContextStoreValues].cold.4(v5, v49);

    v50 = (void *)MEMORY[0x1E0C99DA0];
    v51 = *MEMORY[0x1E0C99768];
    objc_msgSend(MEMORY[0x1E0D15C58], "bluetoothNameKey");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v16);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "raise:format:", v51, CFSTR("Value for 'bluetoothNameKey' in ContextStore's 'keyPathForBluetoothDataDictionary' is not an NSString. Found %@ instead"), v54);

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "bluetoothNameKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (__CFString *)v13;
  else
    v15 = &stru_1E82FDC98;
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0D15C58], "bluetoothAddressKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = objc_opt_isKindOfClass();

  if ((v19 & 1) == 0)
  {
    __atxlog_handle_default();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      -[ATXBluetoothDuetEvent initWithCurrentContextStoreValues].cold.3(v55, v56, v57, v58, v59, v60, v61, v62);

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Value for 'bluetoothAddressKey' in ContextStore's 'keyPathForBluetoothDataDictionary' is not an NSString."));
LABEL_18:
    v40 = 0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "bluetoothAddressKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (__CFString *)v21;
  else
    v23 = &stru_1E82FDC98;
  v24 = v23;

  objc_msgSend(MEMORY[0x1E0D15C58], "bluetoothConnectionStatusKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v27 = objc_opt_isKindOfClass();

  if ((v27 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D15C58], "bluetoothConnectionStatusKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v29, "integerValue");

    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D15C58], "bluetoothDeviceTypeKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithLong:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = +[ATXBluetoothDuetEvent deviceTypeFromBluetoothDeviceType:](ATXBluetoothDuetEvent, "deviceTypeFromBluetoothDeviceType:", v33);

    objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForBluetoothDataDictionary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastModifiedDateForContextualKeyPath:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    if (v36)
      v39 = v36;
    else
      v39 = (void *)v37;
    self = -[ATXBluetoothDuetEvent initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:](self, "initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:", v71, v34, v16, v24, v39, v37);

    v40 = self;
  }
  else
  {
    __atxlog_handle_default();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      -[ATXBluetoothDuetEvent initWithCurrentContextStoreValues].cold.2(v63, v64, v65, v66, v67, v68, v69, v70);

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Value for 'bluetoothConnectionStatusKey' in ContextStore's 'keyPathForBluetoothDataDictionary' is not an NSNumber."));
    v40 = 0;
  }

LABEL_19:
  return v40;
}

+ (id)mostRecentOrActiveBluetoothConnectedEventFromCurrentContextStoreValues
{
  ATXBluetoothDuetEvent *v2;
  void *v3;
  uint64_t v4;

  v2 = -[ATXBluetoothDuetEvent initWithCurrentContextStoreValues]([ATXBluetoothDuetEvent alloc], "initWithCurrentContextStoreValues");
  v3 = v2;
  if (v2 && !-[ATXBluetoothDuetEvent bluetoothState](v2, "bluetoothState"))
  {
    +[ATXBluetoothDuetEvent convertActiveBluetoothDisconnectedEventIntoInactiveBluetoothConnectedEvent:](ATXBluetoothDuetEvent, "convertActiveBluetoothDisconnectedEventIntoInactiveBluetoothConnectedEvent:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

+ (id)convertActiveBluetoothDisconnectedEventIntoInactiveBluetoothConnectedEvent:(id)a3
{
  id v3;
  ATXBluetoothDuetEvent *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXBluetoothDuetEvent *v10;

  v3 = a3;
  v4 = [ATXBluetoothDuetEvent alloc];
  v5 = objc_msgSend(v3, "deviceType");
  objc_msgSend(v3, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ATXBluetoothDuetEvent initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:](v4, "initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:", 1, v5, v6, v7, v8, v9);
  return v10;
}

- (id)description
{
  void *v3;
  NSString *deviceName;
  NSString *deviceIdentifier;
  int64_t bluetoothState;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  deviceName = self->_deviceName;
  deviceIdentifier = self->_deviceIdentifier;
  bluetoothState = self->_bluetoothState;
  -[ATXDuetEvent startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Device name: %@, Device id: %@, Bluetooth state: %ld, start date: %@, end date: %@"), deviceName, deviceIdentifier, bluetoothState, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (int64_t)deviceTypeFromBluetoothDeviceType:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  if ((unint64_t)(v3 - 3) > 0x2B)
    return 2;
  else
    return qword_1C9E80B68[v3 - 3];
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

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXBluetoothDuetEvent bluetoothState](self, "bluetoothState"), CFSTR("codingKeyForBluetoothState"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXBluetoothDuetEvent deviceType](self, "deviceType"), CFSTR("codingKeyForDeviceType"));
  -[ATXBluetoothDuetEvent deviceName](self, "deviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForDeviceName"));

  -[ATXBluetoothDuetEvent deviceIdentifier](self, "deviceIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("codingKeyForHardwareAddress"));

}

- (ATXBluetoothDuetEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXBluetoothDuetEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForStartDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.Bluetooth"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_anchor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForEndDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.Bluetooth"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15)
      || (v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingKeyForBluetoothState")),
          -[ATXBluetoothDuetEvent checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", v16, CFSTR("codingKeyForBluetoothState"), v4, CFSTR("com.apple.proactive.ATXDuetEvent.Bluetooth"), -1))|| (v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingKeyForDeviceType")), -[ATXBluetoothDuetEvent checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", v17, CFSTR("codingKeyForDeviceType"), v4, CFSTR("com.apple.proactive.ATXDuetEvent.Bluetooth"), -1)))
    {
      v10 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0D81610];
      v20 = objc_opt_class();
      __atxlog_handle_anchor();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v20, CFSTR("codingKeyForDeviceName"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.Bluetooth"), -1, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22
        && (objc_msgSend(v4, "error"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v23, !v23))
      {
        v24 = (void *)MEMORY[0x1E0D81610];
        v25 = objc_opt_class();
        __atxlog_handle_anchor();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v25, CFSTR("codingKeyForHardwareAddress"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.Bluetooth"), -1, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27
          && (objc_msgSend(v4, "error"), v28 = (void *)objc_claimAutoreleasedReturnValue(), v28, !v28))
        {
          self = -[ATXBluetoothDuetEvent initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:](self, "initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:", v16, v17, v22, v27, v8, v14);
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
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)initWithDKEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "Value for metadata key for BluetoothConnected 'deviceType' is not a number, %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDKEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "Value for metadata key for BluetoothConnected 'name' is not a string, %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDKEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "Value for metadata key for BluetoothConnected 'address' is not a string, %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDKEvent:(void *)a1 .cold.4(void *a1, NSObject *a2)
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

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithCurrentContextStoreValues
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15C58], "bluetoothNameKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v8, "Value for 'bluetoothNameKey' in ContextStore's 'keyPathForBluetoothDataDictionary' is not an NSString. Found %@ instead", v9);

  OUTLINED_FUNCTION_1_1();
}

@end
