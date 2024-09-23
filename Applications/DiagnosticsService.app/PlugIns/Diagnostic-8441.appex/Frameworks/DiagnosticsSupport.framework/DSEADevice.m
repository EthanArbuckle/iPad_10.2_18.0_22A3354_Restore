@implementation DSEADevice

+ (id)deviceWithSerialNumber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithSerialNumber:", v4);

  return v5;
}

- (DSEADevice)initWithSerialNumber:(id)a3
{
  id v4;
  DSEADevice *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DSEADevice;
  v5 = -[DSEADevice init](&v21, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectedAccessories"));

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
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serialNumber", (_QWORD)v17));
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
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithModelNumber:", v4);

  return v5;
}

- (DSEADevice)initWithModelNumber:(id)a3
{
  id v4;
  DSEADevice *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DSEADevice;
  v5 = -[DSEADevice init](&v21, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectedAccessories"));

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
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelNumber", (_QWORD)v17));
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
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  DSEADevice *v15;
  id v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedAccessories"));

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
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "modelNumber"));
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
  v16 = objc_msgSend(v4, "copy");

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
  v6 = -[DSEADevice init](&v9, "init");
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
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[8];
  _QWORD v33[8];

  v32[0] = CFSTR("capabilities");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[DSEADevice device](self, "device"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v31, "accessoryCapabilities")));
  v33[0] = v30;
  v32[1] = CFSTR("firmwareRevision");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[DSEADevice device](self, "device"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firmwareRevision"));
  v28 = (void *)v3;
  if (!v3)
    v3 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v22 = (void *)v3;
  v33[1] = v3;
  v32[2] = CFSTR("hardwareRevision");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[DSEADevice device](self, "device"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "hardwareRevision"));
  v5 = (void *)v4;
  if (!v4)
    v4 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = (void *)v4;
  v33[2] = v4;
  v32[3] = CFSTR("MACAddress");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DSEADevice device](self, "device"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "macAddress"));
  v7 = (void *)v6;
  if (!v6)
    v6 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v26 = v5;
  v20 = (void *)v6;
  v33[3] = v6;
  v32[4] = CFSTR("modelNumber");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DSEADevice device](self, "device"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "modelNumber"));
  v9 = (void *)v8;
  if (!v8)
    v8 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = (void *)v8;
  v33[4] = v8;
  v32[5] = CFSTR("name");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DSEADevice device](self, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v12 = v11;
  if (!v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v33[5] = v12;
  v32[6] = CFSTR("serialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DSEADevice device](self, "device"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serialNumber"));
  v15 = v14;
  if (!v14)
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v33[6] = v15;
  v32[7] = CFSTR("connectionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DSEADevice device](self, "device"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "connectionID")));
  v33[7] = v17;
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 8));

  if (!v14)
  if (!v11)

  if (!v9)
  if (!v7)

  if (!v26)
  if (!v28)

  return v23;
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
