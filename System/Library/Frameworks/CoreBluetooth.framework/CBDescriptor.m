@implementation CBDescriptor

- (CBDescriptor)initWithCharacteristic:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CBDescriptor *v10;
  uint64_t v11;
  NSNumber *handle;
  uint64_t v13;
  id value;
  uint64_t v15;
  CBPeripheral *peripheral;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)CBDescriptor;
  v10 = -[CBAttribute initWithUUID:](&v18, sel_initWithUUID_, v9);

  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDescriptorHandle"));
    v11 = objc_claimAutoreleasedReturnValue();
    handle = v10->_handle;
    v10->_handle = (NSNumber *)v11;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
    v13 = objc_claimAutoreleasedReturnValue();
    value = v10->_value;
    v10->_value = (id)v13;

    objc_msgSend(v6, "peripheral");
    v15 = objc_claimAutoreleasedReturnValue();
    peripheral = v10->_peripheral;
    v10->_peripheral = (CBPeripheral *)v15;

    objc_storeWeak((id *)&v10->_characteristic, v6);
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CBAttribute UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, UUID = %@, value = %@>"), v4, self, v5, self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidate
{
  -[CBPeripheral removeAttributeForHandle:](self->_peripheral, "removeAttributeForHandle:", self->_handle);
}

- (id)handleValueUpdated:(id)a3
{
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBDescriptor setValue:](self, "setValue:", v4);

  return self;
}

- (CBCharacteristic)characteristic
{
  return (CBCharacteristic *)objc_loadWeakRetained((id *)&self->_characteristic);
}

- (void)setCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_characteristic, a3);
}

- (id)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (NSNumber)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_characteristic);
}

@end
