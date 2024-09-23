@implementation HMDCharacteristicWriteAction

- (HMDCharacteristicWriteAction)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDCharacteristicWriteAction)initWithUUID:(id)a3 characteristic:(id)a4 targetValue:(id)a5 actionSet:(id)a6
{
  id v10;
  id v11;
  HMDCharacteristicWriteAction *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSUUID *accessoryUUID;
  uint64_t v18;
  NSNumber *serviceID;
  uint64_t v20;
  NSNumber *characteristicID;
  objc_super v23;

  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMDCharacteristicWriteAction;
  v12 = -[HMDAction initWithUUID:actionSet:](&v23, sel_initWithUUID_actionSet_, a3, a6);
  if (v12)
  {
    objc_msgSend(v10, "service");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_home, v15);

    objc_msgSend(v14, "uuid");
    v16 = objc_claimAutoreleasedReturnValue();
    accessoryUUID = v12->_accessoryUUID;
    v12->_accessoryUUID = (NSUUID *)v16;

    objc_msgSend(v13, "instanceID");
    v18 = objc_claimAutoreleasedReturnValue();
    serviceID = v12->_serviceID;
    v12->_serviceID = (NSNumber *)v18;

    objc_msgSend(v10, "instanceID");
    v20 = objc_claimAutoreleasedReturnValue();
    characteristicID = v12->_characteristicID;
    v12->_characteristicID = (NSNumber *)v20;

    objc_storeStrong(&v12->_targetValue, a5);
  }

  return v12;
}

- (HMDCharacteristicWriteAction)initWithUUID:(id)a3 accessoryUUID:(id)a4 serviceIID:(id)a5 characteristicIID:(id)a6 targetValue:(id)a7 actionSet:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDCharacteristicWriteAction *v18;
  void *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDCharacteristicWriteAction;
  v18 = -[HMDAction initWithUUID:actionSet:](&v23, sel_initWithUUID_actionSet_, a3, v17);
  if (v18)
  {
    objc_msgSend(v17, "home", v21, v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v18->_home, v19);

    objc_storeStrong((id *)&v18->_accessoryUUID, a4);
    objc_storeStrong((id *)&v18->_serviceID, a5);
    objc_storeStrong((id *)&v18->_characteristicID, a6);
    objc_storeStrong(&v18->_targetValue, a7);
  }

  return v18;
}

- (unint64_t)type
{
  return 0;
}

- (HMDCharacteristic)characteristic
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDCharacteristicWriteAction serviceID](self, "serviceID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[HMDCharacteristicWriteAction characteristicID](self, "characteristicID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[HMDCharacteristicWriteAction accessory](self, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicWriteAction characteristicID](self, "characteristicID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicWriteAction serviceID](self, "serviceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findCharacteristic:forService:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return (HMDCharacteristic *)v9;
}

- (id)stateDump
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAction uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteAction characteristic](self, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteAction targetValue](self, "targetValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Action uuid: %@, Characteristic %@  value %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dictionaryRepresentation
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
  objc_super v16;

  -[HMDCharacteristicWriteAction characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HMDCharacteristicWriteAction;
  -[HMDAction dictionaryRepresentation](&v16, sel_dictionaryRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessoryToEncodeForXPCTransportForAccessory(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("kAccessoryUUID"));

  objc_msgSend(v3, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "instanceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("kServiceInstanceID"));

  objc_msgSend(v3, "instanceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("kCharacteristicInstanceID"));

  -[HMDCharacteristicWriteAction targetValue](self, "targetValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("kCharacteristicValue"));

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (BOOL)isActionForCharacteristic:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v4 = a3;
  objc_msgSend(v4, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCharacteristicWriteAction characteristic](self, "characteristic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "instanceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "instanceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isEqual:", v5) && objc_msgSend(v14, "isEqual:", v7))
    v18 = objc_msgSend(v17, "isEqualToString:", v10);
  else
    v18 = 0;

  return v18;
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCharacteristicWriteAction;
  if (-[HMDAction isCompatibleWithAction:](&v13, sel_isCompatibleWithAction_, v4))
  {
    -[HMDCharacteristicWriteAction characteristicID](self, "characteristicID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characteristicID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[HMDCharacteristicWriteAction serviceID](self, "serviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[HMDCharacteristicWriteAction accessoryUUID](self, "accessoryUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accessoryUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)requiresDeviceUnlock
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteAction characteristic](self, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "requiresDeviceUnlock:forService:", v5, v7);

  return v8;
}

- (BOOL)isUnsecuringAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteAction characteristic](self, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "requiresDeviceUnlock:forService:", v5, v7))
  {
    objc_msgSend(v4, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicWriteAction targetValue](self, "targetValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "allowsSecuringWriteFor:withValue:", v8, v9) ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)entitlementsForNotification
{
  void *v3;
  unint64_t v4;
  objc_super v6;
  objc_super v7;

  -[HMDCharacteristicWriteAction accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasTelevisionService") && (_os_feature_enabled_impl() & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDCharacteristicWriteAction;
    v4 = -[HMDAction entitlementsForNotification](&v7, sel_entitlementsForNotification) | 4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)HMDCharacteristicWriteAction;
    v4 = -[HMDAction entitlementsForNotification](&v6, sel_entitlementsForNotification);
  }

  return v4;
}

- (HMDHAPAccessory)accessory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDCharacteristicWriteAction accessoryUUID](self, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDCharacteristicWriteAction home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicWriteAction accessoryUUID](self, "accessoryUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryWithUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }
  return (HMDHAPAccessory *)v8;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteAction accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (id)associatedAccessories
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[HMDCharacteristicWriteAction accessory](self, "accessory");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

- (BOOL)isStaleWithAccessory:(id)a3
{
  void *v4;
  BOOL v5;

  if (!-[HMDCharacteristicWriteAction isAssociatedWithAccessory:](self, "isAssociatedWithAccessory:", a3))
    return 0;
  -[HMDCharacteristicWriteAction characteristic](self, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (HMDCharacteristicWriteAction)initWithCoder:(id)a3
{
  id v4;
  HMDAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCharacteristicWriteAction *v11;
  HMDCharacteristicWriteAction *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDAction initWithCoder:]([HMDAction alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    allowedCharValueTypes();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("characteristicValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAction uuid](v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAction actionSet](v5, "actionSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDCharacteristicWriteAction initWithUUID:characteristic:targetValue:actionSet:](self, "initWithUUID:characteristic:targetValue:actionSet:", v9, v6, v8, v10);

    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18.receiver = v11;
      v18.super_class = (Class)HMDCharacteristicWriteAction;
      v16 = -[HMDCharacteristicWriteAction class](&v18, sel_class);
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode base class: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDCharacteristicWriteAction;
  v4 = a3;
  -[HMDAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMDCharacteristicWriteAction characteristic](self, "characteristic", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("characteristic"));

  -[HMDCharacteristicWriteAction targetValue](self, "targetValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("characteristicValue"));

}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HMDCharacteristicWriteAction *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    -[HMDCharacteristicWriteAction _processWriteActionModelUpdated:message:](self, "_processWriteActionModelUpdated:message:", v13, v10);
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v17;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = (id)objc_opt_class();
      v18 = v25;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v19);

  }
}

- (void)_processWriteActionModelUpdated:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDCharacteristicWriteAction *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDCharacteristicWriteAction *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  _QWORD v33[3];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "transactionResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAction actionSet](self, "actionSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("targetValue"));

  if (!v11)
  {
    v20 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v9, "home");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v9 && v12)
  {
    objc_msgSend(v6, "targetValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicWriteAction setTargetValue:](self, "setTargetValue:", v14);

    v32[0] = CFSTR("kActionUUID");
    -[HMDAction uuid](self, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v16;
    v32[1] = CFSTR("kActionInfo");
    -[HMDCharacteristicWriteAction dictionaryRepresentation](self, "dictionaryRepresentation");
    v31 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v17;
    v32[2] = CFSTR("kHomeUUID");
    objc_msgSend(v13, "uuid");
    v30 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v31;
LABEL_6:
    v21 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "respondWithPayload:", v20));
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      v36 = 2112;
      v37 = v20;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Responding to client after updating action with response %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v8, "markChanged");
    if (-[HMDCharacteristicWriteAction isSecureAction](v22, "isSecureAction"))
      objc_msgSend(v8, "markSaveToAssistant");
    goto LABEL_13;
  }
  v25 = (void *)MEMORY[0x227676638]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v35 = v28;
    v36 = 2112;
    v37 = v6;
    v38 = 2112;
    v39 = v9;
    v40 = 2112;
    v41 = v13;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Write action Model object (%@) missing actionset %@ or home %@ ", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v25);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v29);

  v20 = 0;
LABEL_13:

}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDCharacteristicWriteActionModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCharacteristicWriteActionModel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = [HMDCharacteristicWriteActionModel alloc];
  -[HMDAction uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAction actionSet](self, "actionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  -[HMDCharacteristicWriteAction characteristic](self, "characteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteActionModel setAccessory:](v9, "setAccessory:", v13);

  objc_msgSend(v10, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "instanceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteActionModel setServiceID:](v9, "setServiceID:", v15);

  objc_msgSend(v10, "instanceID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteActionModel setCharacteristicID:](v9, "setCharacteristicID:", v16);

  -[HMDCharacteristicWriteAction targetValue](self, "targetValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteActionModel setTargetValue:](v9, "setTargetValue:", v17);

  return v9;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAction uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicWriteAction characteristic](self, "characteristic", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("characteristic"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicWriteAction targetValue](self, "targetValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("target value"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)targetValue
{
  return self->_targetValue;
}

- (void)setTargetValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (NSNumber)serviceID
{
  return self->_serviceID;
}

- (NSNumber)characteristicID
{
  return self->_characteristicID;
}

- (NSDictionary)actionInformation
{
  return self->_actionInformation;
}

- (NSString)dumpState
{
  return self->_dumpState;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_dumpState, 0);
  objc_storeStrong((id *)&self->_actionInformation, 0);
  objc_storeStrong((id *)&self->_characteristicID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong(&self->_targetValue, 0);
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kActionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "unsignedIntegerValue"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15
        && ((objc_msgSend(v7, "accessoryWithUUID:", v15),
             v16 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_opt_class(),
             (objc_opt_isKindOfClass() & 1) == 0)
          ? (v17 = 0)
          : (v17 = v16),
            v18 = v17,
            v16,
            v18))
      {

        objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v19 && v20)
        {
          objc_msgSend(v18, "findCharacteristic:forService:", v20, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
          v24 = v23;

          if (v24)
          {

            v25 = objc_alloc((Class)a1);
            objc_msgSend(MEMORY[0x24BDD1880], "UUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v25, "initWithUUID:characteristic:targetValue:actionSet:", v26, v22, v14, 0);

LABEL_28:
            goto LABEL_29;
          }
        }
        v35 = (void *)MEMORY[0x227676638]();
        v36 = a1;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v40 = v35;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v38;
          v43 = 2112;
          v44 = v21;
          v45 = 2112;
          v46 = v19;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find characteristic: %@-%@", buf, 0x20u);

          v35 = v40;
        }

        objc_autoreleasePoolPop(v35);
      }
      else
      {
        v27 = (void *)MEMORY[0x227676638]();
        v28 = a1;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v30;
          v43 = 2112;
          v44 = v15;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find accessory with identifier: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);

      }
    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = a1;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v34;
        v43 = 2112;
        v44 = v6;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Missing target value: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
    }
    v13 = 0;
    goto LABEL_28;
  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = a1;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v12;
    v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Invalid action type: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = 0;
LABEL_29:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_164344 != -1)
    dispatch_once(&logCategory__hmf_once_t13_164344, &__block_literal_global_164345);
  return (id)logCategory__hmf_once_v14_164346;
}

void __43__HMDCharacteristicWriteAction_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_164346;
  logCategory__hmf_once_v14_164346 = v0;

}

@end
