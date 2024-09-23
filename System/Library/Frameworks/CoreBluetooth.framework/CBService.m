@implementation CBService

- (CBService)initWithPeripheral:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CBService *v10;
  void *v11;
  uint64_t v12;
  NSNumber *startHandle;
  uint64_t v14;
  NSNumber *endHandle;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CBService;
  v10 = -[CBAttribute initWithUUID:](&v17, sel_initWithUUID_, v9);

  if (v10)
  {
    objc_storeWeak((id *)&v10->_peripheral, v6);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isPrimary = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceStartHandle"));
    v12 = objc_claimAutoreleasedReturnValue();
    startHandle = v10->_startHandle;
    v10->_startHandle = (NSNumber *)v12;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceEndHandle"));
    v14 = objc_claimAutoreleasedReturnValue();
    endHandle = v10->_endHandle;
    v10->_endHandle = (NSNumber *)v14;

  }
  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_isPrimary)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[CBAttribute UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, isPrimary = %@, UUID = %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)invalidate
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_includedServices;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  -[CBService setIncludedServices:](self, "setIncludedServices:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_characteristics;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "invalidate", (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

  -[CBService setCharacteristics:](self, "setCharacteristics:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_peripheral);
  objc_msgSend(WeakRetained, "removeAttributeForHandle:", self->_startHandle);

}

- (id)handleIncludedServicesDiscovered:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  CBService *v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id *p_peripheral;
  id WeakRetained;
  CBService *v16;
  void *v17;
  CBService *v18;
  uint64_t v19;
  void *v20;
  id v21;
  CBService *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  CBService *v27;
  CBService *v28;
  void *v29;
  __int128 v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  CBService *v39;
  __int16 v40;
  CBService *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_includedServices);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v4;
  v7 = self;
  v8 = v6;
  v32 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (!v32)
  {
LABEL_25:

    v28 = v7;
    v29 = (void *)objc_msgSend(v5, "copy");
    -[CBService setIncludedServices:](v28, "setIncludedServices:", v29);

    v27 = v28;
    goto LABEL_26;
  }
  v10 = *(_QWORD *)v35;
  *(_QWORD *)&v9 = 138412546;
  v31 = v9;
LABEL_4:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v10)
      objc_enumerationMutation(v8);
    v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceStartHandle"), v31);
    v13 = objc_claimAutoreleasedReturnValue();
    p_peripheral = (id *)&v7->_peripheral;
    WeakRetained = objc_loadWeakRetained((id *)&v7->_peripheral);
    v33 = (void *)v13;
    objc_msgSend(WeakRetained, "attributeForHandle:", v13);
    v16 = (CBService *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if ((objc_msgSend(v5, "containsObject:", v16) & 1) == 0)
        goto LABEL_16;
      goto LABEL_5;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || objc_msgSend(v17, "length") != 2 && objc_msgSend(v17, "length") != 4 && objc_msgSend(v17, "length") != 16)
    {
      break;
    }
    v18 = [CBService alloc];
    v19 = v10;
    v20 = v5;
    v21 = v8;
    v22 = v7;
    v23 = objc_loadWeakRetained((id *)&v7->_peripheral);
    v16 = -[CBService initWithPeripheral:dictionary:](v18, "initWithPeripheral:dictionary:", v23, v12);

    v24 = objc_loadWeakRetained(p_peripheral);
    -[CBService startHandle](v16, "startHandle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAttribute:forHandle:", v16, v25);

    v7 = v22;
    v8 = v21;
    v5 = v20;
    v10 = v19;

    if ((objc_msgSend(v5, "containsObject:", v16) & 1) == 0)
    {
LABEL_16:
      objc_msgSend(v5, "addObject:", v16);
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v26 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v31;
        v39 = v16;
        v40 = 2112;
        v41 = v7;
        _os_log_debug_impl(&dword_1A82A2000, v26, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
      }
    }
LABEL_5:

    if (v32 == ++v11)
    {
      v32 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (!v32)
        goto LABEL_25;
      goto LABEL_4;
    }
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBService handleIncludedServicesDiscovered:].cold.1();

  v27 = 0;
LABEL_26:

  return v27;
}

- (id)handleCharacteristicsDiscovered:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id WeakRetained;
  CBCharacteristic *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  CBService *v21;
  void *v22;
  __int128 v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  CBCharacteristic *v32;
  __int16 v33;
  CBService *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCharacteristics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_characteristics);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  v25 = v6;
  if (!v7)
  {
LABEL_25:

    v22 = (void *)objc_msgSend(v5, "copy");
    -[CBService setCharacteristics:](self, "setCharacteristics:", v22);

    v6 = v25;
    v21 = self;
    goto LABEL_26;
  }
  v9 = v7;
  v26 = *(_QWORD *)v28;
  *(_QWORD *)&v8 = 138412546;
  v24 = v8;
LABEL_4:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v28 != v26)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCharacteristicHandle"), v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_peripheral);
    objc_msgSend(WeakRetained, "attributeForHandle:", v12);
    v14 = (CBCharacteristic *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if ((objc_msgSend(v5, "containsObject:", v14) & 1) == 0)
        goto LABEL_16;
      goto LABEL_5;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || objc_msgSend(v15, "length") != 2 && objc_msgSend(v15, "length") != 4 && objc_msgSend(v15, "length") != 16)
    {
      break;
    }
    v14 = -[CBCharacteristic initWithService:dictionary:]([CBCharacteristic alloc], "initWithService:dictionary:", self, v11);
    v16 = objc_loadWeakRetained((id *)&self->_peripheral);
    -[CBCharacteristic handle](v14, "handle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAttribute:forHandle:", v14, v17);

    v18 = objc_loadWeakRetained((id *)&self->_peripheral);
    -[CBCharacteristic valueHandle](v14, "valueHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAttribute:forHandle:", v14, v19);

    v6 = v25;
    if ((objc_msgSend(v5, "containsObject:", v14) & 1) == 0)
    {
LABEL_16:
      objc_msgSend(v5, "addObject:", v14);
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v20 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v24;
        v32 = v14;
        v33 = 2112;
        v34 = self;
        _os_log_debug_impl(&dword_1A82A2000, v20, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
      }
    }
LABEL_5:

    if (v9 == ++v10)
    {
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (!v9)
        goto LABEL_25;
      goto LABEL_4;
    }
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBService handleCharacteristicsDiscovered:].cold.1();

  v21 = 0;
LABEL_26:

  return v21;
}

- (CBPeripheral)peripheral
{
  return (CBPeripheral *)objc_loadWeakRetained((id *)&self->_peripheral);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (NSArray)includedServices
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIncludedServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)characteristics
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCharacteristics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)startHandle
{
  return self->_startHandle;
}

- (NSNumber)endHandle
{
  return self->_endHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endHandle, 0);
  objc_storeStrong((id *)&self->_startHandle, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_includedServices, 0);
  objc_destroyWeak((id *)&self->_peripheral);
}

- (void)handleIncludedServicesDiscovered:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1A82A2000, v0, v1, "Data in %@ does not contain a valid UUID for included service handle = %@");
}

- (void)handleCharacteristicsDiscovered:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1A82A2000, v0, v1, "Data in %@ does not contain a valid UUID for characteristic handle = %@");
}

@end
