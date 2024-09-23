@implementation DSEADevice

+ (id)deviceWithSerialNumber:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSerialNumber:", v4);

  return v5;
}

- (DSEADevice)initWithSerialNumber:(id)a3
{
  id v4;
  DSEADevice *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DSEADevice;
  v5 = -[DSEADevice init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectedAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v13, "serialNumber", (_QWORD)v17);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v4);

            if (v15)
            {
              objc_storeStrong((id *)&v5->_device, v13);
              goto LABEL_13;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_13:

    }
    if (!v5->_device)
    {

      v5 = 0;
    }

  }
  return v5;
}

+ (id)deviceWithModelNumber:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelNumber:", v4);

  return v5;
}

- (DSEADevice)initWithModelNumber:(id)a3
{
  id v4;
  DSEADevice *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DSEADevice;
  v5 = -[DSEADevice init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectedAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v13, "modelNumber", (_QWORD)v17);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v4);

            if (v15)
            {
              objc_storeStrong((id *)&v5->_device, v13);
              goto LABEL_13;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_13:

    }
    if (!v5->_device)
    {

      v5 = 0;
    }

  }
  return v5;
}

+ (id)devicesWithModelNumbers:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  DSEADevice *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v12, "modelNumber");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v3, "containsObject:", v13);

          if (v14)
          {
            v15 = -[DSEADevice initWithAccessory:]([DSEADevice alloc], "initWithAccessory:", v12);
            if (v15)
              objc_msgSend(v4, "addObject:", v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v6 = v18;
  }
  v16 = (void *)objc_msgSend(v4, "copy");

  return v16;
}

- (DSEADevice)initWithAccessory:(id)a3
{
  id v5;
  DSEADevice *v6;
  DSEADevice *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSEADevice;
  v6 = -[DSEADevice init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_device, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)information
{
  void *v3;
  uint64_t v4;
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
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[8];
  _QWORD v35[10];

  v35[8] = *MEMORY[0x24BDAC8D0];
  v34[0] = CFSTR("capabilities");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[DSEADevice device](self, "device");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInt:", objc_msgSend(v33, "accessoryCapabilities"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v32;
  v34[1] = CFSTR("firmwareRevision");
  -[DSEADevice device](self, "device");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firmwareRevision");
  v4 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v4;
  v35[1] = v4;
  v34[2] = CFSTR("hardwareRevision");
  -[DSEADevice device](self, "device");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "hardwareRevision");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v5;
  v35[2] = v5;
  v34[3] = CFSTR("MACAddress");
  -[DSEADevice device](self, "device");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "macAddress");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v28 = v6;
  v22 = (void *)v7;
  v35[3] = v7;
  v34[4] = CFSTR("modelNumber");
  -[DSEADevice device](self, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "modelNumber");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v9;
  v35[4] = v9;
  v34[5] = CFSTR("name");
  -[DSEADevice device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[5] = v13;
  v34[6] = CFSTR("serialNumber");
  -[DSEADevice device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serialNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[6] = v16;
  v34[7] = CFSTR("connectionID");
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[DSEADevice device](self, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "connectionID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 8);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
  if (!v12)

  if (!v10)
  if (!v8)

  if (!v28)
  if (!v30)

  return v25;
}

- (EAAccessory)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
