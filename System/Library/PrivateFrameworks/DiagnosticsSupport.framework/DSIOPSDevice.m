@implementation DSIOPSDevice

+ (id)deviceWithAccessory:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  +[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc((Class)a1);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDeviceIdentifiers:", v6);

  return v7;
}

+ (id)deviceMatchingAccessories:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        +[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", (int)objc_msgSend(v10, "intValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          DiagnosticLogHandleForCategory(6);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v10;
            _os_log_fault_impl(&dword_21F54F000, v12, OS_LOG_TYPE_FAULT, "Identifier not found for accessory %@", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeviceIdentifiers:", v4);
  return v13;
}

- (DSIOPSDevice)initWithDeviceIdentifiers:(id)a3
{
  DSIOPSDevice *v4;
  int v5;
  NSObject *v6;
  id v8;
  CFTypeRef blob;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DSIOPSDevice;
  v4 = -[DSIOPSDevice init](&v10, sel_init);
  if (v4)
  {
    blob = 0;
    v5 = IOPSCopyPowerSourcesByTypePrecise();
    DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DSIOPSDevice initWithDeviceIdentifiers:].cold.2(v5, v6);

    if (!v4->_info)
    {

      v4 = 0;
    }
  }

  return v4;
}

- (id)serialNumber
{
  void *v2;
  void *v3;

  -[DSIOPSDevice info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Accessory Identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)information
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[7];
  _QWORD v33[9];

  v33[7] = *MEMORY[0x24BDAC8D0];
  v32[0] = CFSTR("serialNumber");
  -[DSIOPSDevice info](self, "info");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Accessory Identifier"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v33[0] = v3;
  v32[1] = CFSTR("fullChargeCapacity");
  -[DSIOPSDevice info](self, "info");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Max Capacity"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v30 = v4;
  v22 = (void *)v5;
  v33[1] = v5;
  v32[2] = CFSTR("nominalChargeCapacity");
  -[DSIOPSDevice info](self, "info");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Nominal Capacity"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v7;
  v33[2] = v7;
  v32[3] = CFSTR("cycleCount");
  -[DSIOPSDevice info](self, "info");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CycleCount"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v28 = v6;
  v33[3] = v9;
  v32[4] = CFSTR("temperature");
  -[DSIOPSDevice info](self, "info", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Temperature"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[4] = v12;
  v32[5] = CFSTR("isCharging");
  -[DSIOPSDevice info](self, "info");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Is Charging"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[5] = v15;
  v32[6] = CFSTR("powerSourceState");
  -[DSIOPSDevice info](self, "info");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Power Source State"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[6] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 7);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)

  if (!v14)
  if (!v11)

  if (!v10)
  if (!v8)

  if (!v28)
  if (!v30)

  return v24;
}

- (unint64_t)deviceModel
{
  return self->_deviceModel;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)initWithDeviceIdentifiers:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F54F000, log, OS_LOG_TYPE_ERROR, "Could not retrieve power sources list.", v1, 2u);
}

- (void)initWithDeviceIdentifiers:(int)a1 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21F54F000, a2, OS_LOG_TYPE_ERROR, "Could not retrieve power sources info. Error code: %03X", (uint8_t *)v2, 8u);
}

@end
