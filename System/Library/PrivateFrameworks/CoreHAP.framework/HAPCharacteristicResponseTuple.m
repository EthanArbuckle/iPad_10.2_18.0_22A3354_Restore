@implementation HAPCharacteristicResponseTuple

- (NSError)error
{
  return self->_error;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

+ (id)responseTupleForCharacteristic:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  HAPCharacteristicResponseTuple *v7;
  HAPCharacteristicResponseTuple *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(HAPCharacteristicResponseTuple);
  v8 = v7;
  if (v7)
  {
    -[HAPCharacteristicResponseTuple setCharacteristic:](v7, "setCharacteristic:", v5);
    objc_msgSend(v5, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristicResponseTuple setValue:](v8, "setValue:", v9);

    objc_msgSend(v5, "valueUpdatedTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristicResponseTuple setValueUpdatedTime:](v8, "setValueUpdatedTime:", v10);

    objc_msgSend(v5, "stateNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristicResponseTuple setStateNumber:](v8, "setStateNumber:", v11);

    objc_msgSend(v5, "notificationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristicResponseTuple setNotificationContext:](v8, "setNotificationContext:", v12);

    -[HAPCharacteristicResponseTuple setError:](v8, "setError:", v6);
  }

  return v8;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setValueUpdatedTime:(id)a3
{
  objc_storeStrong((id *)&self->_valueUpdatedTime, a3);
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void)setStateNumber:(id)a3
{
  objc_storeStrong((id *)&self->_stateNumber, a3);
}

- (void)setNotificationContext:(id)a3
{
  objc_storeStrong((id *)&self->_notificationContext, a3);
}

- (void)setCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_characteristic, a3);
}

- (id)value
{
  return self->_value;
}

- (NSDate)valueUpdatedTime
{
  return self->_valueUpdatedTime;
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (NSData)notificationContext
{
  return self->_notificationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;

  -[HAPCharacteristicResponseTuple characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[HAPCharacteristicResponseTuple characteristic](self, "characteristic");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HAPShortUUIDType(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicResponseTuple characteristic](self, "characteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicResponseTuple stateNumber](self, "stateNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicResponseTuple value](self, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicResponseTuple valueUpdatedTime](self, "valueUpdatedTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicResponseTuple error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: %@/%@/%@/%@ %@/%@/%@"), v6, v18, v8, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
