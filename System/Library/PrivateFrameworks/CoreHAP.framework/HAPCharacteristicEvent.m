@implementation HAPCharacteristicEvent

- (HAPCharacteristicEvent)initWithCharacteristic:(id)a3
{
  id v4;
  HAPCharacteristicEvent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *serverIdentifier;
  uint64_t v10;
  NSNumber *accessoryInstanceID;
  uint64_t v12;
  NSNumber *serviceInstanceID;
  uint64_t v14;
  NSNumber *characteristicInstanceID;
  uint64_t v16;
  id value;
  uint64_t v18;
  NSNumber *stateNumber;
  uint64_t v20;
  NSDate *updateTime;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HAPCharacteristicEvent;
  v5 = -[HAPCharacteristicEvent init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    serverIdentifier = v5->_serverIdentifier;
    v5->_serverIdentifier = (NSString *)v8;

    objc_msgSend(v7, "instanceID");
    v10 = objc_claimAutoreleasedReturnValue();
    accessoryInstanceID = v5->_accessoryInstanceID;
    v5->_accessoryInstanceID = (NSNumber *)v10;

    objc_msgSend(v6, "instanceID");
    v12 = objc_claimAutoreleasedReturnValue();
    serviceInstanceID = v5->_serviceInstanceID;
    v5->_serviceInstanceID = (NSNumber *)v12;

    objc_msgSend(v4, "instanceID");
    v14 = objc_claimAutoreleasedReturnValue();
    characteristicInstanceID = v5->_characteristicInstanceID;
    v5->_characteristicInstanceID = (NSNumber *)v14;

    objc_msgSend(v4, "value");
    v16 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (id)v16;

    objc_msgSend(v4, "stateNumber");
    v18 = objc_claimAutoreleasedReturnValue();
    stateNumber = v5->_stateNumber;
    v5->_stateNumber = (NSNumber *)v18;

    objc_msgSend(v4, "valueUpdatedTime");
    v20 = objc_claimAutoreleasedReturnValue();
    updateTime = v5->_updateTime;
    v5->_updateTime = (NSDate *)v20;

  }
  return v5;
}

- (HAPCharacteristicEvent)init
{

  return 0;
}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (NSNumber)accessoryInstanceID
{
  return self->_accessoryInstanceID;
}

- (NSNumber)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (NSNumber)characteristicInstanceID
{
  return self->_characteristicInstanceID;
}

- (id)value
{
  return self->_value;
}

- (NSDate)updateTime
{
  return self->_updateTime;
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong((id *)&self->_updateTime, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceID, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
  objc_storeStrong((id *)&self->_accessoryInstanceID, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
}

+ (id)eventWithCharacteristic:(id)a3
{
  id v3;
  HAPCharacteristicEvent *v4;

  v3 = a3;
  v4 = -[HAPCharacteristicEvent initWithCharacteristic:]([HAPCharacteristicEvent alloc], "initWithCharacteristic:", v3);

  return v4;
}

@end
