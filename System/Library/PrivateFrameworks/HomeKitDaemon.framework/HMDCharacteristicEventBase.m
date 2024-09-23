@implementation HMDCharacteristicEventBase

- (HMDCharacteristicEventBase)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  HMDCharacteristicEventBase *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSUUID *accessoryUUID;
  uint64_t v12;
  NSNumber *serviceID;
  uint64_t v14;
  NSNumber *characteristicInstanceID;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDCharacteristicEventBase;
  v7 = -[HMDEvent initWithModel:home:](&v17, sel_initWithModel_home_, v6, a4);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v6, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithUUIDString:", v9);
    accessoryUUID = v7->_accessoryUUID;
    v7->_accessoryUUID = (NSUUID *)v10;

    objc_msgSend(v6, "serviceID");
    v12 = objc_claimAutoreleasedReturnValue();
    serviceID = v7->_serviceID;
    v7->_serviceID = (NSNumber *)v12;

    objc_msgSend(v6, "characteristicID");
    v14 = objc_claimAutoreleasedReturnValue();
    characteristicInstanceID = v7->_characteristicInstanceID;
    v7->_characteristicInstanceID = (NSNumber *)v14;

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
  v8.super_class = (Class)HMDCharacteristicEventBase;
  -[HMDEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isActive
{
  return (-[HMDEvent activationType](self, "activationType") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCharacteristicEventBase;
  if (-[HMDEvent isCompatibleWithEvent:](&v9, sel_isCompatibleWithEvent_, v4))
  {
    -[HMDCharacteristicEventBase characteristic](self, "characteristic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDCharacteristicEventBase;
  -[HMDEvent _registerForMessages](&v7, sel__registerForMessages);
  -[HMDEvent home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEventBase accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleCharacteristicsChangedNotification_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v5);

  }
}

- (void)__handleCharacteristicsChangedPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDCharacteristicEventBase *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  HMDCharacteristicEventBase *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v37 = v4;
    -[HMDEvent eventTrigger](self, "eventTrigger");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "home");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v36 = v5;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (!v6)
      goto LABEL_26;
    v7 = v6;
    v40 = *(_QWORD *)v42;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v40)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        -[HMDCharacteristicEventBase characteristicInstanceID](self, "characteristicInstanceID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "instanceID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v11))
          goto LABEL_22;
        -[HMDCharacteristicEventBase accessoryUUID](self, "accessoryUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accessory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "isEqual:", v14);

        if (!v15)
          continue;
        v16 = (void *)MEMORY[0x227676638]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = (uint64_t)v19;
          v47 = 2112;
          v48 = (const char *)v9;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Received notification that characteristic changed state, evaluating if trigger needs to be executed, %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v9, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[HMDCharacteristicEventBase _evaluateNewValue:](v17, "_evaluateNewValue:", v20);

        +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCharacteristicEventBase characteristic](v17, "characteristic");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "type");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v10, "shouldNotCacheCharacteristicOfType:", v23);

        if ((v24 & 1) == 0)
        {
          objc_msgSend(v9, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCharacteristicEventBase setPreviousValue:](v17, "setPreviousValue:", v25);

          objc_msgSend(v38, "saveToCurrentAccountWithReason:", CFSTR("kCharacteristicPreviousValue"));
        }
        if (v21)
        {
          v26 = -[HMDCharacteristicEventBase isActive](v17, "isActive");
          v27 = (void *)MEMORY[0x227676638]();
          v28 = v17;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v30;
            *(_DWORD *)buf = 138543874;
            v32 = "Not firing";
            if (v26)
              v32 = "Firing";
            v46 = v30;
            v33 = "is not";
            if (v26)
              v33 = "is";
            v47 = 2080;
            v48 = v32;
            v49 = 2080;
            v50 = v33;
            _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@%s event because it %s active", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v27);
          if (v26)
          {
            -[HMDEvent delegate](v28, "delegate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (id)objc_msgSend(v11, "didOccurEvent:causingDevice:", v28, 0);
LABEL_22:

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      if (!v7)
      {
LABEL_26:

        v5 = v36;
        v4 = v37;
        break;
      }
    }
  }

}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDEvent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HMDCharacteristicEventBase_handleCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_evaluateNewValue:(id)a3
{
  return 0;
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
  v12.super_class = (Class)HMDCharacteristicEventBase;
  -[HMDEvent createPayload](&v12, sel_createPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCharacteristicEventBase accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kAccessoryUUID"));

  -[HMDCharacteristicEventBase serviceID](self, "serviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("kServiceInstanceID"));

  -[HMDCharacteristicEventBase characteristicInstanceID](self, "characteristicInstanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("kCharacteristicInstanceID"));

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

- (void)replaceCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_characteristic, a3);
}

- (HMDCharacteristic)characteristic
{
  HMDCharacteristic *characteristic;
  void *v4;
  void *v5;

  characteristic = self->_characteristic;
  if (!characteristic)
  {
    -[HMDEvent eventTrigger](self, "eventTrigger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase fixCharacteristicInHome:](self, "fixCharacteristicInHome:", v5);

    characteristic = self->_characteristic;
  }
  return characteristic;
}

- (void)fixCharacteristicInHome:(id)a3
{
  id v4;
  HMDCharacteristic *characteristic;
  void *v6;
  NSUUID *v7;
  NSUUID *accessoryUUID;
  void *v9;
  NSNumber *v10;
  NSNumber *serviceID;
  NSNumber *v12;
  NSNumber *characteristicInstanceID;
  void *v14;
  void *v15;
  void *v16;
  HMDCharacteristic *v17;
  HMDCharacteristic *v18;
  void *v19;
  HMDCharacteristicEventBase *v20;
  NSObject *v21;
  void *v22;
  HMDCharacteristic *v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  HMDCharacteristic *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  characteristic = self->_characteristic;
  if (characteristic)
  {
    -[HMDCharacteristic accessory](characteristic, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    accessoryUUID = self->_accessoryUUID;
    self->_accessoryUUID = v7;

    -[HMDCharacteristic service](self->_characteristic, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "instanceID");
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    serviceID = self->_serviceID;
    self->_serviceID = v10;

    -[HMDCharacteristic instanceID](self->_characteristic, "instanceID");
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    characteristicInstanceID = self->_characteristicInstanceID;
    self->_characteristicInstanceID = v12;

  }
  else
  {
    -[HMDCharacteristicEventBase accessoryUUID](self, "accessoryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase serviceID](self, "serviceID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristicInstanceID](self, "characteristicInstanceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = 0;
    +[HMDCharacteristicEventBase lookForCharacteristicByAccessoryUUID:serviceID:characteristicID:inHome:checkForSupport:outError:shouldLog:](HMDCharacteristicEventBase, "lookForCharacteristicByAccessoryUUID:serviceID:characteristicID:inHome:checkForSupport:outError:shouldLog:", v14, v15, v16, v4, 0, 0, v25);
    v17 = (HMDCharacteristic *)objc_claimAutoreleasedReturnValue();
    v18 = self->_characteristic;
    self->_characteristic = v17;

    if (self->_characteristic)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = self->_characteristic;
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        v28 = 2112;
        v29 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Found characteristic, re-evaluating the event trigger %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      -[HMDEvent eventTrigger](v20, "eventTrigger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "reEvaluate:", 2);

    }
  }

}

- (HMDCharacteristicEventBase)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDCharacteristicEventBase *v6;
  HMDCharacteristicEventBase *v7;
  void *v8;
  uint64_t v9;
  NSUUID *accessoryUUID;
  uint64_t v11;
  NSNumber *serviceID;
  uint64_t v13;
  NSNumber *characteristicInstanceID;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  objc_super v22;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)HMDCharacteristicEventBase;
  v6 = -[HMDEvent initWithCoder:](&v22, sel_initWithCoder_, v4);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_characteristic, v5);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v8);
    accessoryUUID = v7->_accessoryUUID;
    v7->_accessoryUUID = (NSUUID *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceInstanceID"));
    v11 = objc_claimAutoreleasedReturnValue();
    serviceID = v7->_serviceID;
    v7->_serviceID = (NSNumber *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristicInstanceID"));
    v13 = objc_claimAutoreleasedReturnValue();
    characteristicInstanceID = v7->_characteristicInstanceID;
    v7->_characteristicInstanceID = (NSNumber *)v13;

    allowedCharValueTypes();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("HM.previousValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicEventBase characteristic](v7, "characteristic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "shouldNotCacheCharacteristicOfType:", v19);

    if ((v20 & 1) == 0)
      objc_storeStrong(&v7->_previousValue, v16);

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDCharacteristicEventBase;
  -[HMDEvent encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v5, CFSTR("characteristic"));

  -[HMDCharacteristicEventBase characteristicInstanceID](self, "characteristicInstanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("characteristicInstanceID"));

  -[HMDCharacteristicEventBase serviceID](self, "serviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serviceInstanceID"));

  -[HMDCharacteristicEventBase accessoryUUID](self, "accessoryUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("accessoryUUID"));

  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "shouldNotCacheCharacteristicOfType:", v12))
  {

LABEL_5:
    goto LABEL_6;
  }
  -[HMDCharacteristicEventBase previousValue](self, "previousValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDCharacteristicEventBase previousValue](self, "previousValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HM.previousValue"));
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDCharacteristicEventBase *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  uint64_t v18;
  void *v19;
  HMDCharacteristicEventBase *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  HMDCharacteristicEventBase *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDCharacteristicEventBase *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  objc_super v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v45.receiver = self;
  v45.super_class = (Class)HMDCharacteristicEventBase;
  v7 = -[HMDEvent _activate:completionHandler:](&v45, sel__activate_completionHandler_, a3, 0);
  -[HMDCharacteristicEventBase characteristic](self, "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCharacteristicEventBase characteristic](self, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "properties");

    if ((v10 & 1) != 0)
    {
      if (v7)
      {
        v24 = -[HMDCharacteristicEventBase isActive](self, "isActive");
        v25 = (void *)MEMORY[0x227676638]();
        v26 = self;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          HMFEnabledStatusToString();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v28;
          v49 = 2112;
          v50 = v29;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Changing characteristic notification state to %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        v30 = (void *)MEMORY[0x24BDD17C8];
        -[HMDEvent uuid](v26, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "UUIDString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("com.apple.HomeKitDaemon.characteristicEvents"), v32);
        v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        -[HMDCharacteristicEventBase characteristic](v26, "characteristic");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "accessory");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCharacteristicEventBase characteristic](v26, "characteristic");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v35;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", v24, v36, v16);

        v37 = _Block_copy(v6);
        v38 = v37;
        if (v37)
          (*((void (**)(void *, _QWORD))v37 + 2))(v37, 0);

        v7 = 1;
      }
      else
      {
        v39 = (void *)MEMORY[0x227676638]();
        v40 = self;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v48 = v42;
          _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Not changing characteristic notification state because activation type has not changed", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v39);
        v43 = _Block_copy(v6);
        v16 = (void (**)(_QWORD, _QWORD))v43;
        if (v43)
          (*((void (**)(void *, _QWORD))v43 + 2))(v43, 0);
        v7 = 0;
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
        -[HMDCharacteristicEventBase characteristic](v12, "characteristic");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v14;
        v49 = 2112;
        v50 = v15;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Trigger contains a characteristic event (%@) which does not support notification, cannot enable the event trigger", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v16 = (void (**)(_QWORD, _QWORD))_Block_copy(v6);
      if (v16)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v18 = 7;
LABEL_11:
        objc_msgSend(v17, "hmErrorWithCode:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v16)[2](v16, v23);

      }
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Characteristic is not yet available yet due to lack of PV or Resident sync, cannot enable the event trigger", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v16 = (void (**)(_QWORD, _QWORD))_Block_copy(v6);
    if (v16)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = 27;
      goto LABEL_11;
    }
  }

  return v7;
}

- (void)setCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_characteristic, a3);
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (NSNumber)serviceID
{
  return self->_serviceID;
}

- (NSNumber)characteristicInstanceID
{
  return self->_characteristicInstanceID;
}

- (id)previousValue
{
  return self->_previousValue;
}

- (void)setPreviousValue:(id)a3
{
  objc_storeStrong(&self->_previousValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previousValue, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

void __71__HMDCharacteristicEventBase_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "__handleCharacteristicsChangedPayload:", v2);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_173479 != -1)
    dispatch_once(&logCategory__hmf_once_t0_173479, &__block_literal_global_173480);
  return (id)logCategory__hmf_once_v1_173481;
}

+ (id)compareValueOfCharacteristic:(id)a3 againstValue:(id)a4 operatorType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(a5, "unsignedIntegerValue");
  objc_msgSend(v8, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stepValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v8, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = compareCharacteristicValue(v13, v7, v9, v11);
  objc_msgSend(v12, "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)lookForCharacteristicByAccessoryUUID:(id)a3 serviceID:(id)a4 characteristicID:(id)a5 inHome:(id)a6 checkForSupport:(BOOL)a7 outError:(id *)a8 shouldLog:(BOOL)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v10 = a7;
  v59 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  objc_msgSend(v18, "accessoryWithUUID:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  if (v17 && v16 && v21)
  {
    objc_msgSend(v21, "findCharacteristic:forService:", v17, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
    {
      if (a9)
      {
        v35 = (void *)MEMORY[0x227676638]();
        v36 = a1;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = v35;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v52 = v38;
          v53 = 2112;
          v54 = v17;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Cannot find the given characteristic ID %@ in accessory", buf, 0x16u);

          v35 = v49;
        }

        objc_autoreleasePoolPop(v35);
      }
      if (a8)
      {
        v28 = (void *)MEMORY[0x24BDD1540];
        v29 = 3;
        goto LABEL_27;
      }
LABEL_40:
      v34 = 0;
      goto LABEL_45;
    }
    if ((objc_msgSend(v22, "properties") & 1) == 0)
    {
      if (a9)
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = a1;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = v24;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v52 = v27;
          v53 = 2112;
          v54 = v23;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Given characteristic %@ does not support notification", buf, 0x16u);

          v24 = v48;
        }

        objc_autoreleasePoolPop(v24);
      }
      if (a8)
      {
        v28 = (void *)MEMORY[0x24BDD1540];
        v29 = 7;
LABEL_27:
        objc_msgSend(v28, "hmErrorWithCode:", v29);
        v34 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

        goto LABEL_46;
      }
      goto LABEL_40;
    }
    if (!v10)
    {
LABEL_44:
      v34 = v23;
      goto LABEL_45;
    }
    objc_msgSend(v23, "service");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "type");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "isEqual:", CFSTR("00000073-0000-1000-8000-0026BB765291")))
    {
      objc_msgSend(v50, "type");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v46, "isEqual:", CFSTR("00000089-0000-1000-8000-0026BB765291")) & 1) != 0)
      {
        v45 = objc_msgSend(v18, "isResidentSupported");

        if ((v45 & 1) == 0)
        {
          if (a9)
          {
            v40 = (void *)MEMORY[0x227676638]();
            v41 = a1;
            HMFGetOSLogHandle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v47 = v40;
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v52 = v43;
              _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@The given characteristic is of type programmable switch and input event, but resident is not available", buf, 0xCu);

              v40 = v47;
            }

            objc_autoreleasePoolPop(v40);
          }
          if (a8)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_40;
        }
        goto LABEL_43;
      }

    }
LABEL_43:

    goto LABEL_44;
  }
  if (a9)
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = a1;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v52 = v33;
      v53 = 2112;
      v54 = v21;
      v55 = 2112;
      v56 = v16;
      v57 = 2112;
      v58 = v17;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Associated accessory %@, service ID %@ or characteristic ID %@ is invalid", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v30);
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v34 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
LABEL_46:

  return v34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __41__HMDCharacteristicEventBase_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_173481;
  logCategory__hmf_once_v1_173481 = v0;

}

@end
