@implementation HMDCharacteristicEvent

- (HMDCharacteristicEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  HMDCharacteristicEvent *v7;
  uint64_t v8;
  id eventValue;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCharacteristicEvent;
  v7 = -[HMDCharacteristicEventBase initWithModel:home:](&v11, sel_initWithModel_home_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "eventValue");
    v8 = objc_claimAutoreleasedReturnValue();
    eventValue = v7->_eventValue;
    v7->_eventValue = (id)v8;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)HMDCharacteristicEvent;
  -[HMDCharacteristicEventBase description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEvent eventValue](self, "eventValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Char-Event: %@, event value: %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)emptyModelObject
{
  HMDCharacteristicEventModel *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCharacteristicEventModel *v7;

  v3 = [HMDCharacteristicEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v3, "initWithObjectChangeType:uuid:parentUUID:", 2, v4, v6);

  return v7;
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  objc_msgSend(v8, "validateValueForNotify:outValue:", v7, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;

  if (v9)
  {
    objc_msgSend(v4, "respondWithError:", v9);
  }
  else
  {
    -[HMDCharacteristicEvent emptyModelObject](self, "emptyModelObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEventValue:", v10);
    -[HMDEvent eventTrigger](self, "eventTrigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backingStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transaction:options:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "add:", v17);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __47__HMDCharacteristicEvent__handleUpdateRequest___block_invoke;
    v18[3] = &unk_24E79BCC8;
    v19 = v4;
    v20 = v10;
    objc_msgSend(v16, "run:", v18);

  }
}

- (BOOL)_evaluateNewValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  HMDCharacteristicEvent *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && -[HMDCharacteristicEvent _compareEventValue:](self, "_compareEventValue:", v4))
  {
    if (!v6)
      goto LABEL_5;
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristic](self, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "shouldNotCacheCharacteristicOfType:", v9);

    if ((v10 & 1) == 0)
    {
      -[HMDCharacteristicEventBase characteristic](self, "characteristic");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCharacteristicEventBase compareValueOfCharacteristic:againstValue:operatorType:](HMDCharacteristicEventBase, "compareValueOfCharacteristic:againstValue:operatorType:", v24, v6, &unk_24E96CBC0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v25, "BOOLValue");

    }
    else
    {
LABEL_5:
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristic](v13, "characteristic");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEvent eventValue](v13, "eventValue");
    v27 = v12;
    v19 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristic](v13, "characteristic");
    v26 = v11;
    v21 = v4;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    v32 = 2112;
    v33 = v19;
    v34 = 2112;
    v35 = v18;
    v36 = 2112;
    v37 = v20;
    v38 = 2112;
    v39 = v22;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Evaluated event, should fire: %@, previous value: %@, current value: %@, event monitor value: %@, %@", buf, 0x3Eu);

    v4 = v21;
    v11 = v26;

    v6 = v19;
    v12 = v27;

  }
  objc_autoreleasePoolPop(v12);

  return v11;
}

- (BOOL)_compareEventValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  HMDCharacteristicEvent *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCharacteristicEvent eventValue](self, "eventValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDCharacteristicEventBase characteristic](self, "characteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEvent eventValue](self, "eventValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicEventBase compareValueOfCharacteristic:againstValue:operatorType:](HMDCharacteristicEventBase, "compareValueOfCharacteristic:againstValue:operatorType:", v6, v7, &unk_24E96CBD8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCharacteristicEventBase characteristic](v11, "characteristic");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Characteristic %@ changed value due to any change, evaluating trigger", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 1;
  }

  return v9;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  objc_super v19;

  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19.receiver = self;
  v19.super_class = (Class)HMDCharacteristicEvent;
  -[HMDEvent dumpState](&v19, sel_dumpState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v5, "mutableCopy");

  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characteristicTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instanceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "instanceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEvent eventValue](self, "eventValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("type: %@, accUUID: %@, svcInstanceID: %@, chrInstanceID: %@, event value: %@"), v7, v11, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE3EA90]);
  return v18;
}

- (id)createPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v9.receiver = self;
  v9.super_class = (Class)HMDCharacteristicEvent;
  -[HMDCharacteristicEventBase createPayload](&v9, sel_createPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCharacteristicEvent eventValue](self, "eventValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kCharacteristicValue"));

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDCharacteristicEvent;
  return -[HMDCharacteristicEventBase isCompatibleWithEvent:](&v4, sel_isCompatibleWithEvent_, a3);
}

- (HMDCharacteristicEvent)initWithCoder:(id)a3
{
  id v4;
  HMDCharacteristicEvent *v5;
  void *v6;
  uint64_t v7;
  id eventValue;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDCharacteristicEvent;
  v5 = -[HMDCharacteristicEventBase initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    allowedCharValueTypes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("characteristicValue"));
    v7 = objc_claimAutoreleasedReturnValue();
    eventValue = v5->_eventValue;
    v5->_eventValue = (id)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDCharacteristicEvent;
  -[HMDCharacteristicEventBase encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMDCharacteristicEvent eventValue](self, "eventValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDCharacteristicEvent eventValue](self, "eventValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("characteristicValue"));

  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDCharacteristicEventModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCharacteristicEventModel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = [HMDCharacteristicEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEventModel setEndEvent:](v9, "setEndEvent:", v10);

  -[HMDCharacteristicEventBase accessoryUUID](self, "accessoryUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEventModel setAccessory:](v9, "setAccessory:", v12);

  -[HMDCharacteristicEventBase serviceID](self, "serviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEventModel setServiceID:](v9, "setServiceID:", v13);

  -[HMDCharacteristicEventBase characteristicInstanceID](self, "characteristicInstanceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEventModel setCharacteristicID:](v9, "setCharacteristicID:", v14);

  -[HMDCharacteristicEvent eventValue](self, "eventValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEventModel setEventValue:](v9, "setEventValue:", v15);

  return v9;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCharacteristicEvent *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", (uint8_t *)&v25, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  v15 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    -[HMDEvent eventTrigger](v12, "eventTrigger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("kMigratedEventsToRecordsRequest"));

    if (v20)
    {
      objc_msgSend(v18, "processEventRecords:message:", v17, v10);
    }
    else
    {
      if (objc_msgSend(v17, "propertyWasSet:", CFSTR("eventValue")))
      {
        -[HMDCharacteristicEvent eventValue](v12, "eventValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "eventValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = HMFEqualObjects();

        if ((v23 & 1) == 0)
        {
          objc_msgSend(v17, "eventValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCharacteristicEvent setEventValue:](v12, "setEventValue:", v24);

          objc_msgSend(v18, "markChangedForMessage:", v10);
        }
      }
      objc_msgSend(v10, "respondWithSuccess");
    }

  }
}

- (id)analyticsTriggerEventData
{
  HMDAnalyticsTriggerEventData *v3;
  HMDAnalyticsCharacteristicEventData *v4;
  void *v5;

  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  -[HMDAnalyticsTriggerEventData setEndEvent:](v3, "setEndEvent:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v4 = objc_alloc_init(HMDAnalyticsCharacteristicEventData);
  -[HMDCharacteristicEvent eventValue](self, "eventValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAnalyticsCharacteristicEventData setContainsValue:](v4, "setContainsValue:", v5 != 0);

  -[HMDAnalyticsTriggerEventData setCharEvent:](v3, "setCharEvent:", v4);
  return v3;
}

- (id)eventValue
{
  return self->_eventValue;
}

- (void)setEventValue:(id)a3
{
  objc_storeStrong(&self->_eventValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventValue, 0);
}

void __47__HMDCharacteristicEvent__handleUpdateRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v3);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v7 = CFSTR("kCharacteristicValue");
      v8[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v6);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:", 0);
    }
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_200033 != -1)
    dispatch_once(&logCategory__hmf_once_t0_200033, &__block_literal_global_200034);
  return (id)logCategory__hmf_once_v1_200035;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __37__HMDCharacteristicEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_200035;
  logCategory__hmf_once_v1_200035 = v0;

}

@end
