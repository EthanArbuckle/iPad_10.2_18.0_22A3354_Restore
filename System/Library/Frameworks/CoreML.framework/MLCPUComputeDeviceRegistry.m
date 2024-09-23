@implementation MLCPUComputeDeviceRegistry

- (NSArray)registeredComputeDevices
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[MLCPUComputeDeviceRegistry cpuDevice](self, "cpuDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (MLCPUComputeDevice)cpuDevice
{
  return self->_cpuDevice;
}

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MLCPUComputeDeviceRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken_15430 != -1)
    dispatch_once(&sharedRegistry_onceToken_15430, block);
  return (id)sharedRegistry_registry_15431;
}

void __44__MLCPUComputeDeviceRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[MLCPUComputeDevice physicalDevice](MLCPUComputeDevice, "physicalDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithCpuDevice:", v4);
  v3 = (void *)sharedRegistry_registry_15431;
  sharedRegistry_registry_15431 = v2;

}

- (MLCPUComputeDeviceRegistry)initWithCpuDevice:(id)a3
{
  id v5;
  MLCPUComputeDeviceRegistry *v6;
  MLCPUComputeDeviceRegistry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLCPUComputeDeviceRegistry;
  v6 = -[MLCPUComputeDeviceRegistry init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cpuDevice, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuDevice, 0);
}

@end
