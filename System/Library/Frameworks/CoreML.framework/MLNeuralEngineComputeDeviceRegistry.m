@implementation MLNeuralEngineComputeDeviceRegistry

- (NSArray)registeredComputeDevices
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[MLNeuralEngineComputeDeviceRegistry neuralEngineDevice](self, "neuralEngineDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MLNeuralEngineComputeDeviceRegistry neuralEngineDevice](self, "neuralEngineDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

- (MLNeuralEngineComputeDevice)neuralEngineDevice
{
  return self->_neuralEngineDevice;
}

void __53__MLNeuralEngineComputeDeviceRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[MLNeuralEngineComputeDevice physicalDevice](MLNeuralEngineComputeDevice, "physicalDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithNeuralEngineDevice:", v4);
  v3 = (void *)sharedRegistry_registry;
  sharedRegistry_registry = v2;

}

- (MLNeuralEngineComputeDeviceRegistry)initWithNeuralEngineDevice:(id)a3
{
  id v5;
  MLNeuralEngineComputeDeviceRegistry *v6;
  MLNeuralEngineComputeDeviceRegistry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLNeuralEngineComputeDeviceRegistry;
  v6 = -[MLNeuralEngineComputeDeviceRegistry init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_neuralEngineDevice, a3);

  return v7;
}

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MLNeuralEngineComputeDeviceRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1)
    dispatch_once(&sharedRegistry_onceToken, block);
  return (id)sharedRegistry_registry;
}

- (NSArray)registeredAndAccessibleComputeDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[MLNeuralEngineComputeDeviceRegistry neuralEngineDevice](self, "neuralEngineDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MLNeuralEngineComputeDeviceRegistry neuralEngineDevice](self, "neuralEngineDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isAccessible"))
    {
      -[MLNeuralEngineComputeDeviceRegistry neuralEngineDevice](self, "neuralEngineDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neuralEngineDevice, 0);
}

@end
