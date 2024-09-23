@implementation MLComputePlanDeviceUsage

- (MLComputePlanDeviceUsage)initWithSupportedComputeDevices:(id)a3 preferredComputeDevice:(id)a4 deviceSupportInfoArray:(id)a5
{
  id v8;
  id v9;
  id v10;
  MLComputePlanDeviceUsage *v11;
  uint64_t v12;
  NSArray *supportedComputeDevices;
  uint64_t v14;
  NSArray *deviceSupportInfoArray;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLComputePlanDeviceUsage;
  v11 = -[MLComputePlanDeviceUsage init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    supportedComputeDevices = v11->_supportedComputeDevices;
    v11->_supportedComputeDevices = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_preferredComputeDevice, a4);
    v14 = objc_msgSend(v10, "copy");
    deviceSupportInfoArray = v11->_deviceSupportInfoArray;
    v11->_deviceSupportInfoArray = (NSArray *)v14;

  }
  return v11;
}

- (id)supportInfoForComputeDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MLComputePlanDeviceUsage deviceSupportInfoArray](self, "deviceSupportInfoArray", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "computeDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)supportedComputeDevices
{
  return self->_supportedComputeDevices;
}

- (MLComputeDeviceProtocol)preferredComputeDevice
{
  return self->_preferredComputeDevice;
}

- (NSArray)deviceSupportInfoArray
{
  return self->_deviceSupportInfoArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSupportInfoArray, 0);
  objc_storeStrong((id *)&self->_preferredComputeDevice, 0);
  objc_storeStrong((id *)&self->_supportedComputeDevices, 0);
}

@end
