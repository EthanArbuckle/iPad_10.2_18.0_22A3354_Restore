@implementation VNProcessingDevice

+ (id)defaultCPUDevice
{
  void *v2;
  VNCPUProcessingDevice *v3;
  void *v4;
  id v5;

  +[VNProcessingDevice _lockStaticObjectsAccessLock](VNProcessingDevice, "_lockStaticObjectsAccessLock");
  v2 = (void *)requestPerformingDevice_defaultCPUDevice;
  if (!requestPerformingDevice_defaultCPUDevice)
  {
    v3 = objc_alloc_init(VNCPUProcessingDevice);
    v4 = (void *)requestPerformingDevice_defaultCPUDevice;
    requestPerformingDevice_defaultCPUDevice = (uint64_t)v3;

    v2 = (void *)requestPerformingDevice_defaultCPUDevice;
  }
  v5 = v2;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock](VNProcessingDevice, "_unlockStaticObjectsAccessLock");
  return v5;
}

+ (id)defaultMetalDevice
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[VNProcessingDevice _lockStaticObjectsAccessLock](VNProcessingDevice, "_lockStaticObjectsAccessLock");
  v3 = (void *)requestPerformingDevice_defaultMetalDevice;
  if (!requestPerformingDevice_defaultMetalDevice)
  {
    VNCreateMetalDevice();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1, "deviceForMetalDevice:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)requestPerformingDevice_defaultMetalDevice;
      requestPerformingDevice_defaultMetalDevice = v5;

    }
    v3 = (void *)requestPerformingDevice_defaultMetalDevice;
  }
  v7 = v3;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock](VNProcessingDevice, "_unlockStaticObjectsAccessLock");
  return v7;
}

+ (id)defaultANEDevice
{
  VNANERuntimeProcessingDevice *v2;
  void *v3;
  id v4;

  +[VNProcessingDevice _lockStaticObjectsAccessLock](VNProcessingDevice, "_lockStaticObjectsAccessLock");
  if (!requestPerformingDevice_defaultANEDevice)
  {
    if (VNHasANE::once_token != -1)
      dispatch_once(&VNHasANE::once_token, &__block_literal_global_31404);
    if (VNHasANE::hasANESupport)
    {
      v2 = objc_alloc_init(VNANERuntimeProcessingDevice);
      v3 = (void *)requestPerformingDevice_defaultANEDevice;
      requestPerformingDevice_defaultANEDevice = (uint64_t)v2;

    }
  }
  v4 = (id)requestPerformingDevice_defaultANEDevice;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock](VNProcessingDevice, "_unlockStaticObjectsAccessLock");
  return v4;
}

+ (void)_unlockStaticObjectsAccessLock
{
  objc_msgSend((id)staticObjectsAccessLock, "unlock");
}

+ (void)_lockStaticObjectsAccessLock
{
  if (_lockStaticObjectsAccessLock_onceToken_createOnceTokenLock != -1)
    dispatch_once(&_lockStaticObjectsAccessLock_onceToken_createOnceTokenLock, &__block_literal_global_27797);
  objc_msgSend((id)staticObjectsAccessLock, "lock");
}

void __50__VNProcessingDevice__lockStaticObjectsAccessLock__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB38E0]);
  v1 = (void *)staticObjectsAccessLock;
  staticObjectsAccessLock = (uint64_t)v0;

}

+ (id)deviceForMetalDevice:(id)a3
{
  id v3;
  VNMetalProcessingDevice *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  +[VNProcessingDevice _lockStaticObjectsAccessLock](VNProcessingDevice, "_lockStaticObjectsAccessLock");
  if (ourMetalToProcessingDeviceMap)
  {
    objc_msgSend((id)ourMetalToProcessingDeviceMap, "objectForKey:", v3);
    v4 = (VNMetalProcessingDevice *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)ourMetalToProcessingDeviceMap;
    ourMetalToProcessingDeviceMap = v5;

  }
  v4 = -[VNMetalProcessingDevice initWithMetalDevice:]([VNMetalProcessingDevice alloc], "initWithMetalDevice:", v3);
  if (v4)
    objc_msgSend((id)ourMetalToProcessingDeviceMap, "setObject:forKey:", v4, v3);
LABEL_7:
  +[VNProcessingDevice _unlockStaticObjectsAccessLock](VNProcessingDevice, "_unlockStaticObjectsAccessLock");

  return v4;
}

- (id)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)hash
{
  objc_class *v2;
  void *v3;
  unint64_t v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v5;

  if (a3 != self)
  {
    v5 = a3;
    objc_opt_class();
    objc_opt_isKindOfClass();

  }
  return a3 == self;
}

- (BOOL)targetsCPU
{
  return 0;
}

- (BOOL)targetsGPU
{
  return 0;
}

- (BOOL)targetsANE
{
  return 0;
}

- (id)computeDevice
{
  return 0;
}

- (id)metalDevice
{
  return 0;
}

- (int)espressoDeviceID
{
  return -1;
}

- (int)espressoEngine
{
  return 0;
}

- (int)espressoStorageType
{
  return 65568;
}

+ (id)allDevices
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  +[VNProcessingDevice _lockStaticObjectsAccessLock](VNProcessingDevice, "_lockStaticObjectsAccessLock");
  v3 = (void *)allDevices;
  if (!allDevices)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "defaultCPUDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    +[VNMetalProcessingDevice allDevices](VNMetalProcessingDevice, "allDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

    objc_msgSend(a1, "defaultANEDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "addObject:", v7);
    v8 = objc_msgSend(v4, "copy");
    v9 = (void *)allDevices;
    allDevices = v8;

    v3 = (void *)allDevices;
  }
  v10 = v3;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock](VNProcessingDevice, "_unlockStaticObjectsAccessLock");
  return v10;
}

+ (id)defaultDevice
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  +[VNProcessingDevice _lockStaticObjectsAccessLock](VNProcessingDevice, "_lockStaticObjectsAccessLock");
  v3 = (void *)requestPerformingDevice_defaultDevice;
  if (!requestPerformingDevice_defaultDevice)
  {
    objc_msgSend(a1, "defaultANEDevice");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)requestPerformingDevice_defaultDevice;
    requestPerformingDevice_defaultDevice = v4;

    v3 = (void *)requestPerformingDevice_defaultDevice;
    if (!requestPerformingDevice_defaultDevice)
    {
      objc_msgSend(a1, "defaultMetalDevice");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)requestPerformingDevice_defaultDevice;
      requestPerformingDevice_defaultDevice = v6;

      v3 = (void *)requestPerformingDevice_defaultDevice;
      if (!requestPerformingDevice_defaultDevice)
      {
        objc_msgSend(a1, "defaultCPUDevice");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)requestPerformingDevice_defaultDevice;
        requestPerformingDevice_defaultDevice = v8;

        v3 = (void *)requestPerformingDevice_defaultDevice;
      }
    }
  }
  v10 = v3;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock](VNProcessingDevice, "_unlockStaticObjectsAccessLock");
  return v10;
}

+ (id)directANEDevice
{
  VNANERuntimeDirectProcessingDevice *v2;
  void *v3;
  id v4;

  +[VNProcessingDevice _lockStaticObjectsAccessLock](VNProcessingDevice, "_lockStaticObjectsAccessLock");
  if (!requestPerformingDevice_directANEDevice)
  {
    if (VNHasANE::once_token != -1)
      dispatch_once(&VNHasANE::once_token, &__block_literal_global_31404);
    if (VNHasANE::hasANESupport)
    {
      v2 = objc_alloc_init(VNANERuntimeDirectProcessingDevice);
      v3 = (void *)requestPerformingDevice_directANEDevice;
      requestPerformingDevice_directANEDevice = (uint64_t)v2;

    }
  }
  v4 = (id)requestPerformingDevice_directANEDevice;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock](VNProcessingDevice, "_unlockStaticObjectsAccessLock");
  return v4;
}

+ (void)forcedCleanup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[VNProcessingDevice _lockStaticObjectsAccessLock](VNProcessingDevice, "_lockStaticObjectsAccessLock");
  v2 = (void *)allDevices;
  allDevices = 0;

  v3 = (void *)requestPerformingDevice_defaultDevice;
  requestPerformingDevice_defaultDevice = 0;

  v4 = (void *)requestPerformingDevice_defaultCPUDevice;
  requestPerformingDevice_defaultCPUDevice = 0;

  v5 = (void *)requestPerformingDevice_defaultMetalDevice;
  requestPerformingDevice_defaultMetalDevice = 0;

  v6 = (void *)requestPerformingDevice_defaultANEDevice;
  requestPerformingDevice_defaultANEDevice = 0;

  v7 = (void *)requestPerformingDevice_directANEDevice;
  requestPerformingDevice_directANEDevice = 0;

  objc_msgSend((id)ourMetalToProcessingDeviceMap, "removeAllObjects");
  +[VNProcessingDevice _unlockStaticObjectsAccessLock](VNProcessingDevice, "_unlockStaticObjectsAccessLock");
}

@end
