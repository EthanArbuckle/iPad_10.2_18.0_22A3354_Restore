@implementation CBCharacteristic

- (CBCharacteristic)initWithService:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CBCharacteristic *v10;
  void *v11;
  uint64_t v12;
  NSNumber *handle;
  uint64_t v14;
  NSNumber *valueHandle;
  uint64_t v16;
  NSData *value;
  uint64_t v18;
  CBPeripheral *peripheral;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)CBCharacteristic;
  v10 = -[CBAttribute initWithUUID:](&v21, sel_initWithUUID_, v9);

  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCharacteristicProperties"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_properties = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCharacteristicHandle"));
    v12 = objc_claimAutoreleasedReturnValue();
    handle = v10->_handle;
    v10->_handle = (NSNumber *)v12;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCharacteristicValueHandle"));
    v14 = objc_claimAutoreleasedReturnValue();
    valueHandle = v10->_valueHandle;
    v10->_valueHandle = (NSNumber *)v14;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
    v16 = objc_claimAutoreleasedReturnValue();
    value = v10->_value;
    v10->_value = (NSData *)v16;

    v10->_valueTimestamp = 0;
    objc_msgSend(v6, "peripheral");
    v18 = objc_claimAutoreleasedReturnValue();
    peripheral = v10->_peripheral;
    v10->_peripheral = (CBPeripheral *)v18;

    objc_storeWeak((id *)&v10->_service, v6);
    v10->_isBroadcasted = 0;
    v10->_isNotifying = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t properties;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CBAttribute UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  properties = self->_properties;
  -[CBCharacteristic value](self, "value");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (self->_isNotifying)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, UUID = %@, properties = 0x%lX, value = %@, notifying = %@>"), v4, self, v5, properties, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)invalidate
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_descriptors;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidate", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[CBCharacteristic setDescriptors:](self, "setDescriptors:", 0);
  -[CBPeripheral removeAttributeForHandle:](self->_peripheral, "removeAttributeForHandle:", self->_valueHandle);
  -[CBPeripheral removeAttributeForHandle:](self->_peripheral, "removeAttributeForHandle:", self->_handle);
}

- (id)handleValueUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBCharacteristic setValue:](self, "setValue:", v5);
  self->_valueTimestamp = objc_msgSend(v6, "unsignedLongLongValue");

  return self;
}

- (id)handleValueBroadcasted:(id)a3
{
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isBroadcasted = objc_msgSend(v4, "BOOLValue");

  return self;
}

- (id)handleValueNotifying:(id)a3
{
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isNotifying = objc_msgSend(v4, "BOOLValue");

  return self;
}

- (id)handleDescriptorsDiscovered:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CBDescriptor *v12;
  void *v13;
  CBPeripheral *peripheral;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  CBCharacteristic *v18;
  void *v19;
  __int128 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CBCharacteristic *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  CBDescriptor *v31;
  __int16 v32;
  CBCharacteristic *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDescriptors"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_descriptors);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v4;
  v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (!v24)
  {
LABEL_25:

    v19 = (void *)objc_msgSend(v5, "copy");
    -[CBCharacteristic setDescriptors:](v25, "setDescriptors:", v19);

    v18 = v25;
    goto LABEL_26;
  }
  v8 = *(_QWORD *)v27;
  *(_QWORD *)&v7 = 138412546;
  v21 = v7;
  v22 = v6;
  v23 = v5;
LABEL_4:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v27 != v8)
      objc_enumerationMutation(v6);
    v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDescriptorHandle"), v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral attributeForHandle:](v25->_peripheral, "attributeForHandle:", v11);
    v12 = (CBDescriptor *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
        goto LABEL_16;
      goto LABEL_5;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || objc_msgSend(v13, "length") != 2 && objc_msgSend(v13, "length") != 4 && objc_msgSend(v13, "length") != 16)
    {
      break;
    }
    v12 = -[CBDescriptor initWithCharacteristic:dictionary:]([CBDescriptor alloc], "initWithCharacteristic:dictionary:", v25, v10);
    peripheral = v25->_peripheral;
    -[CBDescriptor handle](v12, "handle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral setAttribute:forHandle:](peripheral, "setAttribute:forHandle:", v12, v15);

    v6 = v22;
    v5 = v23;
    if ((objc_msgSend(v23, "containsObject:", v12) & 1) == 0)
    {
LABEL_16:
      objc_msgSend(v5, "addObject:", v12);
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v16 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v21;
        v31 = v12;
        v32 = 2112;
        v33 = v25;
        _os_log_debug_impl(&dword_1A82A2000, v16, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
      }
    }
LABEL_5:

    if (v24 == ++v9)
    {
      v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (!v24)
        goto LABEL_25;
      goto LABEL_4;
    }
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v17 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBCharacteristic handleDescriptorsDiscovered:].cold.1((uint64_t)v11, (uint64_t)v25, v17);

  v6 = v22;
  v18 = 0;
  v5 = v23;
LABEL_26:

  return v18;
}

- (CBService)service
{
  return (CBService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (CBCharacteristicProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (NSData)value
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)descriptors
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDescriptors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)isBroadcasted
{
  return self->_isBroadcasted;
}

- (BOOL)isNotifying
{
  return self->_isNotifying;
}

- (void)setIsNotifying:(BOOL)a3
{
  self->_isNotifying = a3;
}

- (unint64_t)valueTimestamp
{
  return self->_valueTimestamp;
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (NSNumber)handle
{
  return self->_handle;
}

- (NSNumber)valueHandle
{
  return self->_valueHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueHandle, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_service);
}

- (void)handleDescriptorsDiscovered:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl(&dword_1A82A2000, log, OS_LOG_TYPE_DEBUG, "Data in %@ does not contain a valid UUID for descriptor handle = %@", (uint8_t *)&v3, 0x16u);
}

@end
