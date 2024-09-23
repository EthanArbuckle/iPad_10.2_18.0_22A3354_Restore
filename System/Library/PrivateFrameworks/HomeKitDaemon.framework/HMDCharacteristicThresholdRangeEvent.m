@implementation HMDCharacteristicThresholdRangeEvent

- (HMDCharacteristicThresholdRangeEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  HMDCharacteristicThresholdRangeEvent *v7;
  uint64_t v8;
  NSNumber *min;
  uint64_t v10;
  NSNumber *max;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  v7 = -[HMDCharacteristicEventBase initWithModel:home:](&v13, sel_initWithModel_home_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "min");
    v8 = objc_claimAutoreleasedReturnValue();
    min = v7->_min;
    v7->_min = (NSNumber *)v8;

    objc_msgSend(v6, "max");
    v10 = objc_claimAutoreleasedReturnValue();
    max = v7->_max;
    v7->_max = (NSNumber *)v10;

  }
  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  -[HMDCharacteristicEventBase description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicThresholdRangeEvent min](self, "min");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicThresholdRangeEvent max](self, "max");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Char-Threshold-Event: %@, min: %@, max: %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)createPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v12.receiver = self;
  v12.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  -[HMDCharacteristicEventBase createPayload](&v12, sel_createPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCharacteristicThresholdRangeEvent min](self, "min");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCharacteristicThresholdRangeEvent min](self, "min");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"));

  }
  -[HMDCharacteristicThresholdRangeEvent max](self, "max");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCharacteristicThresholdRangeEvent max](self, "max");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));

  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (id)emptyModelObject
{
  HMDCharacteristicThresholdRangeEventModel *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCharacteristicThresholdRangeEventModel *v7;

  v3 = [HMDCharacteristicThresholdRangeEventModel alloc];
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
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6)
  {
    -[HMDCharacteristicThresholdRangeEvent emptyModelObject](self, "emptyModelObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMin:", v5);
    objc_msgSend(v8, "setMax:", v6);
    -[HMDEvent eventTrigger](self, "eventTrigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backingStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transaction:options:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "add:", v8);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __61__HMDCharacteristicThresholdRangeEvent__handleUpdateRequest___block_invoke;
    v16[3] = &unk_24E79BCC8;
    v17 = v4;
    v18 = v8;
    v15 = v8;
    objc_msgSend(v14, "run:", v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v7);

  }
}

- (BOOL)_isValueInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  -[HMDCharacteristicThresholdRangeEvent min](self, "min");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[HMDCharacteristicThresholdRangeEvent max](self, "max");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_9;
  }
  -[HMDCharacteristicThresholdRangeEvent min](self, "min");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (-[HMDCharacteristicThresholdRangeEvent min](self, "min"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v4, "compare:", v8),
        v8,
        v9 != -1))
  {
    -[HMDCharacteristicThresholdRangeEvent max](self, "max");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10
      || (-[HMDCharacteristicThresholdRangeEvent max](self, "max"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v4, "compare:", v11),
          v11,
          v12 != 1))
    {
      v13 = 1;
      goto LABEL_11;
    }
  }
LABEL_9:
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)_evaluateNewValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDCharacteristicThresholdRangeEvent *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDCharacteristicThresholdRangeEvent *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  BOOL v26;
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
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v4 && v6)
  {
    -[HMDCharacteristicEventBase characteristic](self, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicEventBase compareValueOfCharacteristic:againstValue:operatorType:](HMDCharacteristicEventBase, "compareValueOfCharacteristic:againstValue:operatorType:", v8, v6, &unk_24E96BD98);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if ((v10 & 1) != 0)
    {
      if (!-[HMDCharacteristicThresholdRangeEvent _isValueInRange:](self, "_isValueInRange:", v6))
      {
        v7 = -[HMDCharacteristicThresholdRangeEvent _isValueInRange:](self, "_isValueInRange:", v4);
        goto LABEL_10;
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v14;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@The value hasn't changed from previous value, ignoring", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
    }
    v7 = 0;
  }
LABEL_10:
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v26 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristic](v16, "characteristic");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicThresholdRangeEvent min](v16, "min");
    v27 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicThresholdRangeEvent max](v16, "max");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristic](v16, "characteristic");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v6;
    v34 = 2112;
    v35 = v20;
    v36 = 2112;
    v37 = v21;
    v38 = 2112;
    v39 = v22;
    v40 = 2112;
    v41 = v23;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Evaluated event, should fire (did enter range): %@, previous value: %@, current value: %@, min: %@, max: %@, %@", buf, 0x48u);

    v15 = v27;
    v7 = v26;

  }
  objc_autoreleasePoolPop(v15);

  return v7;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  return -[HMDCharacteristicEventBase isCompatibleWithEvent:](&v4, sel_isCompatibleWithEvent_, a3);
}

- (HMDCharacteristicThresholdRangeEvent)initWithCoder:(id)a3
{
  id v4;
  HMDCharacteristicThresholdRangeEvent *v5;
  uint64_t v6;
  NSNumber *min;
  uint64_t v8;
  NSNumber *max;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  v5 = -[HMDCharacteristicEventBase initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"));
    v6 = objc_claimAutoreleasedReturnValue();
    min = v5->_min;
    v5->_min = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));
    v8 = objc_claimAutoreleasedReturnValue();
    max = v5->_max;
    v5->_max = (NSNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  v4 = a3;
  -[HMDCharacteristicEventBase encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMDCharacteristicThresholdRangeEvent min](self, "min", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"));

  -[HMDCharacteristicThresholdRangeEvent max](self, "max");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));

}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDCharacteristicThresholdRangeEventModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCharacteristicThresholdRangeEventModel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = [HMDCharacteristicThresholdRangeEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicThresholdRangeEventModel setEndEvent:](v9, "setEndEvent:", v10);

  -[HMDCharacteristicEventBase accessoryUUID](self, "accessoryUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicThresholdRangeEventModel setAccessory:](v9, "setAccessory:", v12);

  -[HMDCharacteristicEventBase serviceID](self, "serviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicThresholdRangeEventModel setServiceID:](v9, "setServiceID:", v13);

  -[HMDCharacteristicEventBase characteristicInstanceID](self, "characteristicInstanceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicThresholdRangeEventModel setCharacteristicID:](v9, "setCharacteristicID:", v14);

  -[HMDCharacteristicThresholdRangeEvent min](self, "min");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicThresholdRangeEventModel setMin:](v9, "setMin:", v15);

  -[HMDCharacteristicThresholdRangeEvent max](self, "max");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicThresholdRangeEventModel setMax:](v9, "setMax:", v16);

  return v9;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCharacteristicThresholdRangeEvent *v12;
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
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
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
    v27 = 138543362;
    v28 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", (uint8_t *)&v27, 0xCu);

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
    if ((objc_msgSend(v17, "propertyWasSet:", CFSTR("min")) & 1) != 0
      || objc_msgSend(v17, "propertyWasSet:", CFSTR("max")))
    {
      -[HMDCharacteristicThresholdRangeEvent min](v12, "min");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "min");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = HMFEqualObjects();

      if (!v20
        || (-[HMDCharacteristicThresholdRangeEvent max](v12, "max"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v17, "max"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = HMFEqualObjects(),
            v22,
            v21,
            (v23 & 1) == 0))
      {
        objc_msgSend(v17, "min");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCharacteristicThresholdRangeEvent setMin:](v12, "setMin:", v24);

        objc_msgSend(v17, "max");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCharacteristicThresholdRangeEvent setMax:](v12, "setMax:", v25);

        -[HMDEvent eventTrigger](v12, "eventTrigger");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "markChangedForMessage:", v10);

      }
    }
    objc_msgSend(v10, "respondWithSuccess");
  }

}

- (id)analyticsTriggerEventData
{
  HMDAnalyticsTriggerEventData *v3;
  HMDAnalyticsCharacteristicThresholdEventData *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  -[HMDAnalyticsTriggerEventData setEndEvent:](v3, "setEndEvent:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v4 = objc_alloc_init(HMDAnalyticsCharacteristicThresholdEventData);
  -[HMDCharacteristicThresholdRangeEvent min](self, "min");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAnalyticsCharacteristicThresholdEventData setMinPresent:](v4, "setMinPresent:", v5 != 0);

  -[HMDCharacteristicThresholdRangeEvent max](self, "max");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAnalyticsCharacteristicThresholdEventData setMaxPresent:](v4, "setMaxPresent:", v6 != 0);

  -[HMDAnalyticsTriggerEventData setCharThresholdEvent:](v3, "setCharThresholdEvent:", v4);
  return v3;
}

- (NSNumber)min
{
  return self->_min;
}

- (void)setMin:(id)a3
{
  objc_storeStrong((id *)&self->_min, a3);
}

- (NSNumber)max
{
  return self->_max;
}

- (void)setMax:(id)a3
{
  objc_storeStrong((id *)&self->_max, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
}

void __61__HMDCharacteristicThresholdRangeEvent__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "min");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"));

    objc_msgSend(*(id *)(a1 + 40), "max");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));

    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "respondWithPayload:", v6);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_145876 != -1)
    dispatch_once(&logCategory__hmf_once_t0_145876, &__block_literal_global_145877);
  return (id)logCategory__hmf_once_v1_145878;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __51__HMDCharacteristicThresholdRangeEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_145878;
  logCategory__hmf_once_v1_145878 = v0;

}

@end
