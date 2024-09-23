@implementation HAPCharacteristicWriteRequestTuple

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  _BOOL8 v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _NSZone *v21;
  void *v22;
  void *v23;

  -[HAPCharacteristicWriteRequestTuple value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EFA2EAA8) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[HAPCharacteristicWriteRequestTuple value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_5:
    -[HAPCharacteristicWriteRequestTuple value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    goto LABEL_6;
  }
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
LABEL_6:
  v23 = (void *)v7;

  v8 = (void *)objc_opt_class();
  -[HAPCharacteristicWriteRequestTuple characteristic](self, "characteristic");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  -[HAPCharacteristicWriteRequestTuple authorizationData](self, "authorizationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  v12 = -[HAPCharacteristicWriteRequestTuple timedWrite](self, "timedWrite");
  v13 = -[HAPCharacteristicWriteRequestTuple includeResponseValue](self, "includeResponseValue");
  v14 = -[HAPCharacteristicWriteRequestTuple writeType](self, "writeType");
  -[HAPCharacteristicWriteRequestTuple contextData](self, "contextData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = a3;
  v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
  objc_msgSend(v8, "writeRequestTupleForCharacteristic:value:authorizationData:timedWrite:responseValue:type:contextData:", v9, v23, v11, v12, v13, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAPCharacteristicWriteRequestTuple enableEvents](self, "enableEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", v21);
  objc_msgSend(v17, "setEnableEvents:", v19);

  return v17;
}

- (NSString)description
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  -[HAPCharacteristicWriteRequestTuple characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAPCharacteristicWriteRequestTuple writeType](self, "writeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicWriteRequestTuple characteristic](self, "characteristic");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "type");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HAPShortUUIDType(v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicWriteRequestTuple characteristic](self, "characteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicWriteRequestTuple characteristic](self, "characteristic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stateNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicWriteRequestTuple initialValue](self, "initialValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicWriteRequestTuple value](self, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@(%@): %@/%@/%@/%@ %@->%@"), v17, v7, v19, v8, v10, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void)setCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_characteristic, a3);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (NSData)authorizationData
{
  return self->_authorizationData;
}

- (void)setAuthorizationData:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationData, a3);
}

- (BOOL)timedWrite
{
  return self->_timedWrite;
}

- (void)setTimedWrite:(BOOL)a3
{
  self->_timedWrite = a3;
}

- (unint64_t)writeType
{
  return self->_writeType;
}

- (void)setWriteType:(unint64_t)a3
{
  self->_writeType = a3;
}

- (BOOL)includeResponseValue
{
  return self->_includeResponseValue;
}

- (void)setIncludeResponseValue:(BOOL)a3
{
  self->_includeResponseValue = a3;
}

- (NSNumber)enableEvents
{
  return self->_enableEvents;
}

- (void)setEnableEvents:(id)a3
{
  objc_storeStrong((id *)&self->_enableEvents, a3);
}

- (NSData)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
  objc_storeStrong((id *)&self->_contextData, a3);
}

- (NSUUID)hmdAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHmdAccessoryUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)initialValue
{
  return self->_initialValue;
}

- (void)setInitialValue:(id)a3
{
  objc_storeStrong(&self->_initialValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_hmdAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_enableEvents, 0);
  objc_storeStrong((id *)&self->_authorizationData, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8
{
  return (id)objc_msgSend(a1, "writeRequestTupleForCharacteristic:value:authorizationData:timedWrite:responseValue:type:contextData:", a3, a4, a5, a6, a7, a8, 0);
}

+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8 contextData:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  HAPCharacteristicWriteRequestTuple *v18;
  HAPCharacteristicWriteRequestTuple *v19;
  void *v20;

  v10 = a7;
  v11 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a9;
  v18 = objc_alloc_init(HAPCharacteristicWriteRequestTuple);
  v19 = v18;
  if (v18)
  {
    -[HAPCharacteristicWriteRequestTuple setCharacteristic:](v18, "setCharacteristic:", v14);
    objc_msgSend(v14, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristicWriteRequestTuple setInitialValue:](v19, "setInitialValue:", v20);

    -[HAPCharacteristicWriteRequestTuple setValue:](v19, "setValue:", v15);
    -[HAPCharacteristicWriteRequestTuple setAuthorizationData:](v19, "setAuthorizationData:", v16);
    -[HAPCharacteristicWriteRequestTuple setTimedWrite:](v19, "setTimedWrite:", v11);
    -[HAPCharacteristicWriteRequestTuple setIncludeResponseValue:](v19, "setIncludeResponseValue:", v10);
    -[HAPCharacteristicWriteRequestTuple setWriteType:](v19, "setWriteType:", a8);
    -[HAPCharacteristicWriteRequestTuple setContextData:](v19, "setContextData:", v17);
  }

  return v19;
}

@end
