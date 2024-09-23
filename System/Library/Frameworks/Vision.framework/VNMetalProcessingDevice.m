@implementation VNMetalProcessingDevice

- (VNMetalProcessingDevice)initWithMetalDevice:(id)a3
{
  id v5;
  VNMetalProcessingDevice *v6;
  VNMetalProcessingDevice *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNMetalProcessingDevice;
  v6 = -[VNMetalProcessingDevice init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metalDevice, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNMetalProcessingDevice;
  if (-[VNProcessingDevice isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[VNMetalProcessingDevice metalDevice](self, "metalDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metalDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNMetalProcessingDevice;
  v3 = -[VNProcessingDevice hash](&v7, sel_hash);
  -[VNMetalProcessingDevice metalDevice](self, "metalDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNMetalProcessingDevice;
  -[VNProcessingDevice description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNMetalProcessingDevice metalDevice](self, "metalDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("_%llu"), objc_msgSend(v4, "registryID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)computeDevice
{
  void *v2;
  void *v3;

  -[VNMetalProcessingDevice metalDevice](self, "metalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNComputeDeviceUtilities computeDeviceForMetalDevice:](VNComputeDeviceUtilities, "computeDeviceForMetalDevice:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)targetsGPU
{
  return 1;
}

- (id)metalDevice
{
  return self->_metalDevice;
}

- (int)espressoDeviceID
{
  return espresso_device_id_for_metal_device();
}

- (int)espressoEngine
{
  return 5;
}

- (int)espressoStorageType
{
  return 65552;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

+ (id)allDevices
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc(MEMORY[0x1E0C99D20]);
  v5 = MTLCreateSystemDefaultDevice();
  v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, 0);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMetalDevice:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

@end
