@implementation MIBUStatusResponse

- (MIBUStatusResponse)init
{
  MIBUStatusResponse *v2;
  MIBUStatusResponse *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUStatusResponse;
  v2 = -[MIBUNFCResponse init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MIBUStatusResponse setSerialNumber:](v2, "setSerialNumber:", 0);
    -[MIBUStatusResponse setOsVersion:](v3, "setOsVersion:", 0);
    -[MIBUStatusResponse setBuildVersion:](v3, "setBuildVersion:", 0);
    -[MIBUStatusResponse setStatus:](v3, "setStatus:", 0);
  }
  return v3;
}

- (id)serialize
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
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[7];

  v26[6] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[MIBUStatusResponse status](self, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || -[MIBUNFCResponse rejected](self, "rejected"))
    goto LABEL_23;
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[MIBUStatusResponse status](self, "status");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v25, "state"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v24;
  -[MIBUStatusResponse serialNumber](self, "serialNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v23;
  -[MIBUStatusResponse osVersion](self, "osVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v6;
  -[MIBUStatusResponse buildVersion](self, "buildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v7;
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[MIBUStatusResponse status](self, "status");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "operation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v10;
  -[MIBUStatusResponse status](self, "status");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "batteryLevel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v3, "serialize:withValue:", &unk_24EB5C508, v13);

  if ((v5 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_2);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUStatusResponse serialize].cold.3();
    goto LABEL_23;
  }
  -[MIBUNFCResponse error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "serializeResponseError:", v14);

  if ((v15 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_12_0);
    v21 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUStatusResponse serialize].cold.2(v21, self);
    goto LABEL_23;
  }
  -[MIBUStatusResponse status](self, "status");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "operationError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "serializeOperationError:", v17);

  if ((v18 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_14);
    v22 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUStatusResponse serialize].cold.1(v22, self);
    goto LABEL_23;
  }
  if (!-[MIBUStatusResponse _serializeOperationDetailsWithSerializer:](self, "_serializeOperationDetailsWithSerializer:", v3)|| !-[MIBUStatusResponse _serializeThermalDetailsWithSerializer:](self, "_serializeThermalDetailsWithSerializer:", v3)|| !-[MIBUStatusResponse _serializeBatteryDetailsWithSerializer:](self, "_serializeBatteryDetailsWithSerializer:", v3))
  {
LABEL_23:
    v19 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "serializedData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v19;
}

void __31__MIBUStatusResponse_serialize__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __31__MIBUStatusResponse_serialize__block_invoke_11()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __31__MIBUStatusResponse_serialize__block_invoke_13()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_deserialize:(id)a3
{
  id v4;
  MIBUDeserializer *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  id v19;
  MIBUDeviceStatus *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;

  v4 = a3;
  v5 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", v4);

  -[MIBUDeserializer deserialize](v5, "deserialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_16);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUStatusResponse _deserialize:].cold.1();
    v27 = 0;
    v12 = 0;
    v15 = 0;
    v14 = 0;
    v38 = 0;
    v39 = 0;
    goto LABEL_24;
  }
  v41 = 0;
  v7 = -[MIBUDeserializer deserializeResponseError:](v5, "deserializeResponseError:", &v41);
  v39 = v41;
  if (!v7)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_18);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUStatusResponse _deserialize:].cold.7();
    goto LABEL_23;
  }
  objc_msgSend(v6, "objectForKey:", &unk_24EB5B760);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_20);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUStatusResponse _deserialize:].cold.2();
LABEL_23:
    v27 = 0;
    v12 = 0;
    v15 = 0;
    v14 = 0;
    v38 = 0;
LABEL_24:
    v11 = 0;
    v9 = 0;
LABEL_30:
    v34 = 0;
    goto LABEL_9;
  }
  v9 = (void *)v8;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5B7C0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_22);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUStatusResponse _deserialize:].cold.3();
    v27 = 0;
    v12 = 0;
    v15 = 0;
    v14 = 0;
    v38 = 0;
    v11 = 0;
    goto LABEL_30;
  }
  v11 = (void *)v10;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5B778);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5B790);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v6, "objectForKey:", &unk_24EB5B7A8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", &unk_24EB5B7D8);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v37 = (void *)v16;
      v40 = 0;
      v17 = -[MIBUDeserializer deserializeOperationError:](v5, "deserializeOperationError:", &v40);
      v18 = v40;
      v38 = v18;
      if (v17)
      {
        v19 = v18;
        v20 = objc_alloc_init(MIBUDeviceStatus);
        -[MIBUStatusResponse setStatus:](self, "setStatus:", v20);

        -[MIBUStatusResponse setSerialNumber:](self, "setSerialNumber:", v12);
        -[MIBUStatusResponse setOsVersion:](self, "setOsVersion:", v14);
        -[MIBUStatusResponse setBuildVersion:](self, "setBuildVersion:", v15);
        v21 = (int)objc_msgSend(v9, "shortValue");
        -[MIBUStatusResponse status](self, "status");
        v36 = v12;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setState:", v21);

        v23 = (int)objc_msgSend(v11, "shortValue");
        -[MIBUStatusResponse status](self, "status");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setOperation:", v23);

        -[MIBUStatusResponse status](self, "status");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setOperationError:", v19);

        -[MIBUStatusResponse status](self, "status");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v37;
        objc_msgSend(v26, "setBatteryLevel:", v37);

        -[MIBUStatusResponse _deserializeThermalDetailsFromDict:](self, "_deserializeThermalDetailsFromDict:", v6);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIBUStatusResponse status](self, "status");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setThermalDetails:", v28);

        -[MIBUStatusResponse _deserializeBatteryDetailsFromDict:](self, "_deserializeBatteryDetailsFromDict:", v6);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIBUStatusResponse status](self, "status");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setBatteryDetails:", v30);

        -[MIBUStatusResponse _deserializeOperationDetailsFromDict:](self, "_deserializeOperationDetailsFromDict:", v6);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIBUStatusResponse status](self, "status");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setOperationDetails:", v32);

        v12 = v36;
        v34 = 1;
      }
      else
      {
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_32);
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          -[MIBUStatusResponse _deserialize:].cold.6();
        v34 = 0;
        v27 = v37;
      }
    }
    else
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_30);
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        -[MIBUStatusResponse _deserialize:].cold.5();
      v27 = 0;
      v38 = 0;
      v34 = 0;
    }
  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_26);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUStatusResponse _deserialize:].cold.4();
    v27 = 0;
    v15 = 0;
    v38 = 0;
    v34 = 0;
    v14 = 0;
  }
LABEL_9:
  -[MIBUNFCResponse setError:](self, "setError:", v39);

  return v34;
}

void __35__MIBUStatusResponse__deserialize___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_17()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_19()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_21()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_25()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_29()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __35__MIBUStatusResponse__deserialize___block_invoke_31()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)_reverseDict:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_serializeDict:(id)a3 fromKeyToTagMapping:(id)a4 withSerializer:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v23 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v14);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
        {
          v29 = v16;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v15;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v23, "serialize:withValue:", v18, v19);

          if ((v20 & 1) == 0)
          {

            v21 = 0;
            goto LABEL_11;
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v11)
        continue;
      break;
    }
  }
  v21 = 1;
LABEL_11:

  return v21;
}

- (id)_deserializeFromTagDict:(id)a3 withKeyToTagMapping:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[MIBUStatusResponse _reverseDict:](self, "_reverseDict:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v9, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v15, v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (BOOL)_serializeOperationDetailsWithSerializer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MIBUStatusResponse status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operationDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("Progress");
  v9[1] = CFSTR("TimeRemaining");
  v10[0] = &unk_24EB5B7F0;
  v10[1] = &unk_24EB5B808;
  v9[2] = CFSTR("TargetOSVersion");
  v9[3] = CFSTR("TargetBuildVersion");
  v10[2] = &unk_24EB5B820;
  v10[3] = &unk_24EB5B838;
  v9[4] = CFSTR("SoftwareUpdatePhase");
  v9[5] = CFSTR("TargetSUBundleSize");
  v10[4] = &unk_24EB5B850;
  v10[5] = &unk_24EB5B868;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MIBUStatusResponse _serializeDict:fromKeyToTagMapping:withSerializer:](self, "_serializeDict:fromKeyToTagMapping:withSerializer:", v6, v7, v4);

  return (char)self;
}

- (id)_deserializeOperationDetailsFromDict:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("Progress");
  v9[1] = CFSTR("TimeRemaining");
  v10[0] = &unk_24EB5B7F0;
  v10[1] = &unk_24EB5B808;
  v9[2] = CFSTR("TargetOSVersion");
  v9[3] = CFSTR("TargetBuildVersion");
  v10[2] = &unk_24EB5B820;
  v10[3] = &unk_24EB5B838;
  v9[4] = CFSTR("SoftwareUpdatePhase");
  v9[5] = CFSTR("TargetSUBundleSize");
  v10[4] = &unk_24EB5B850;
  v10[5] = &unk_24EB5B868;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUStatusResponse _deserializeFromTagDict:withKeyToTagMapping:](self, "_deserializeFromTagDict:withKeyToTagMapping:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_serializeThermalDetailsWithSerializer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[9];
  _QWORD v10[10];

  v10[9] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MIBUStatusResponse status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thermalDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("TSRM/TVRM");
  v9[1] = CFSTR("TSRR/TVRR");
  v10[0] = &unk_24EB5B880;
  v10[1] = &unk_24EB5B898;
  v9[2] = CFSTR("TVRQ");
  v9[3] = CFSTR("TSBE/TVBE");
  v10[2] = &unk_24EB5B8B0;
  v10[3] = &unk_24EB5B8C8;
  v9[4] = CFSTR("TSBQ/TVBQ");
  v9[5] = CFSTR("TSBR/TVBR");
  v10[4] = &unk_24EB5B8E0;
  v10[5] = &unk_24EB5B8F8;
  v9[6] = CFSTR("TSLR/TVRH");
  v9[7] = CFSTR("TG0V");
  v10[6] = &unk_24EB5B910;
  v10[7] = &unk_24EB5B928;
  v9[8] = CFSTR("ThermalPressure");
  v10[8] = &unk_24EB5B940;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MIBUStatusResponse _serializeDict:fromKeyToTagMapping:withSerializer:](self, "_serializeDict:fromKeyToTagMapping:withSerializer:", v6, v7, v4);

  return (char)self;
}

- (id)_deserializeThermalDetailsFromDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  double v16;
  void *v17;
  uint64_t v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[9];
  _QWORD v27[11];

  v27[9] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v26[0] = CFSTR("TSRM/TVRM");
  v26[1] = CFSTR("TSRR/TVRR");
  v27[0] = &unk_24EB5B880;
  v27[1] = &unk_24EB5B898;
  v26[2] = CFSTR("TVRQ");
  v26[3] = CFSTR("TSBE/TVBE");
  v27[2] = &unk_24EB5B8B0;
  v27[3] = &unk_24EB5B8C8;
  v26[4] = CFSTR("TSBQ/TVBQ");
  v26[5] = CFSTR("TSBR/TVBR");
  v27[4] = &unk_24EB5B8E0;
  v27[5] = &unk_24EB5B8F8;
  v26[6] = CFSTR("TSLR/TVRH");
  v26[7] = CFSTR("TG0V");
  v27[6] = &unk_24EB5B910;
  v27[7] = &unk_24EB5B928;
  v26[8] = CFSTR("ThermalPressure");
  v27[8] = &unk_24EB5B940;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUStatusResponse _deserializeFromTagDict:withKeyToTagMapping:](self, "_deserializeFromTagDict:withKeyToTagMapping:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = 0;
          v15 = v14;
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("TG0V")))
          {
            v19 = 0;
            objc_msgSend(v15, "getBytes:length:", &v19, 8);
            v16 = (double)v19 * 0.0000152587891;
            *(float *)&v16 = v16;
            v20 = LODWORD(v16);
          }
          else
          {
            objc_msgSend(v15, "getBytes:length:", &v20, 4);
            LODWORD(v16) = v20;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v17, v13);

        }
        else
        {
          objc_msgSend(v5, "setObject:forKey:", v14, v13);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)_serializeBatteryDetailsWithSerializer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MIBUStatusResponse status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "batteryDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("WARP");
  v9[1] = CFSTR("WAVR");
  v10[0] = &unk_24EB5B958;
  v10[1] = &unk_24EB5B970;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MIBUStatusResponse _serializeDict:fromKeyToTagMapping:withSerializer:](self, "_serializeDict:fromKeyToTagMapping:withSerializer:", v6, v7, v4);

  return (char)self;
}

- (id)_deserializeBatteryDetailsFromDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int16 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[2];
  _QWORD v25[5];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v24[0] = CFSTR("WARP");
  v24[1] = CFSTR("WAVR");
  v25[0] = &unk_24EB5B958;
  v25[1] = &unk_24EB5B970;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v4;
  -[MIBUStatusResponse _deserializeFromTagDict:withKeyToTagMapping:](self, "_deserializeFromTagDict:withKeyToTagMapping:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = 0;
          objc_msgSend(v14, "getBytes:length:", &v18, 2);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v15, v13);

        }
        else
        {
          objc_msgSend(v5, "setObject:forKey:", v14, v13);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v5;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (MIBUDeviceStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

- (void)serialize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to serialize device status, serial number, and nonce", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize payload for StatusUpdate command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize operation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize os version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize battery level", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize operation error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize response error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
