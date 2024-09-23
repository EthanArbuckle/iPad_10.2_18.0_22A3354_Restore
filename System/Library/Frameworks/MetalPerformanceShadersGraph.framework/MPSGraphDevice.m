@implementation MPSGraphDevice

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", MEMORY[0x1E0C9AA60]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v2;

  if (qword_1EDC0BB60)
    __assert_rtn("+[MPSGraphDevice initialize]", "MPSGraphDevice.mm", 31, "gDeviceSerialQueue == nullptr");
  v4 = dispatch_queue_create("MPSGraphDevice queue", 0);
  v5 = (void *)qword_1EDC0BB60;
  qword_1EDC0BB60 = (uint64_t)v4;

}

- (MPSGraphDevice)initWithDeviceType:(unsigned int)a3 metalDevice:(id)a4
{
  id v7;
  MPSGraphDevice *v8;
  id v9;
  uint64_t v10;
  NSString *metalDeviceName;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphDevice;
  v8 = -[MPSGraphDevice init](&v13, sel_init);
  objc_storeStrong((id *)&v8->_metalDevice, a4);
  if (!v8->_metalDevice)
  {
    v9 = MTLCreateSystemDefaultDevice();
    if (objc_msgSend(v9, "supportsFamily:", 1001))
      objc_storeStrong((id *)&v8->_metalDevice, v9);

  }
  v8->_type = a3;
  objc_msgSend(v7, "name");
  v10 = objc_claimAutoreleasedReturnValue();
  metalDeviceName = v8->_metalDeviceName;
  v8->_metalDeviceName = (NSString *)v10;

  return v8;
}

+ (MPSGraphDevice)deviceWithMTLDevice:(id)metalDevice
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = metalDevice;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v4 = qword_1EDC0BB60;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__MPSGraphDevice_deviceWithMTLDevice___block_invoke;
  v8[3] = &unk_1E0E76C60;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (MPSGraphDevice *)v6;
}

void __38__MPSGraphDevice_deviceWithMTLDevice___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  MPSGraphDevice *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (id)_MergedGlobals_1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v2);
        v6 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!objc_msgSend(v6, "type", (_QWORD)v14))
        {
          objc_msgSend(v6, "metalDevice");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "registryID");
          LOBYTE(v8) = v8 == objc_msgSend(*(id *)(a1 + 32), "registryID");

          if ((v8 & 1) != 0)
          {
            v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v10 = *(void **)(v9 + 40);
            *(_QWORD *)(v9 + 40) = v6;

            goto LABEL_12;
          }
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v11 = -[MPSGraphDevice initWithDeviceType:metalDevice:]([MPSGraphDevice alloc], "initWithDeviceType:metalDevice:", 0, *(_QWORD *)(a1 + 32));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend((id)_MergedGlobals_1, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

- (int64_t)gpuCoreCount
{
  if (self->_metalDevice)
    return *(unsigned __int8 *)(MPSDevice::GetMPSDevice() + 1480);
  else
    return -1;
}

+ (id)ANEDevice
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__MPSGraphDevice_ANEDevice__block_invoke;
  block[3] = &unk_1E0E76C88;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_1EDC0BB60, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __27__MPSGraphDevice_ANEDevice__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  uint64_t v7;
  void *v8;
  MPSGraphDevice *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)_MergedGlobals_1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v6, "type", (_QWORD)v12) == 2)
        {
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v8 = *(void **)(v7 + 40);
          *(_QWORD *)(v7 + 40) = v6;

          goto LABEL_11;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    if (objc_msgSend(MEMORY[0x1E0CFDF48], "hasANE"))
    {
      v9 = -[MPSGraphDevice initWithDeviceType:metalDevice:]([MPSGraphDevice alloc], "initWithDeviceType:metalDevice:", 2, 0);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      objc_msgSend((id)_MergedGlobals_1, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    }
  }
}

+ (id)CPUDevice
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__MPSGraphDevice_CPUDevice__block_invoke;
  block[3] = &unk_1E0E76C88;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_1EDC0BB60, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __27__MPSGraphDevice_CPUDevice__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  uint64_t v7;
  void *v8;
  MPSGraphDevice *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)_MergedGlobals_1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v6, "type", (_QWORD)v12) == 1)
        {
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v8 = *(void **)(v7 + 40);
          *(_QWORD *)(v7 + 40) = v6;

          goto LABEL_11;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v9 = -[MPSGraphDevice initWithDeviceType:metalDevice:]([MPSGraphDevice alloc], "initWithDeviceType:metalDevice:", 1, 0);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend((id)_MergedGlobals_1, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
}

- (id)metalDevice
{
  return self->_metalDevice;
}

- (MPSGraphDeviceType)type
{
  return self->_type;
}

- (NSString)metalDeviceName
{
  return self->_metalDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDeviceName, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end
