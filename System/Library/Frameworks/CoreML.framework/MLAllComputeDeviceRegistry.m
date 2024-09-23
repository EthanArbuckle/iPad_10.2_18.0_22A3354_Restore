@implementation MLAllComputeDeviceRegistry

void __44__MLAllComputeDeviceRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[MLNeuralEngineComputeDeviceRegistry sharedRegistry](MLNeuralEngineComputeDeviceRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLGPUComputeDeviceRegistry sharedRegistry](MLGPUComputeDeviceRegistry, "sharedRegistry", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  +[MLCPUComputeDeviceRegistry sharedRegistry](MLCPUComputeDeviceRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v1, "initWithDeviceRegistries:", v5);
  v7 = (void *)sharedRegistry_registry_20187;
  sharedRegistry_registry_20187 = v6;

}

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MLAllComputeDeviceRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken_20186 != -1)
    dispatch_once(&sharedRegistry_onceToken_20186, block);
  return (id)sharedRegistry_registry_20187;
}

- (NSArray)registeredComputeDevices
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MLAllComputeDeviceRegistry deviceRegistries](self, "deviceRegistries", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "registeredComputeDevices");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)deviceRegistries
{
  return self->_deviceRegistries;
}

- (MLAllComputeDeviceRegistry)initWithDeviceRegistries:(id)a3
{
  id v4;
  MLAllComputeDeviceRegistry *v5;
  uint64_t v6;
  NSArray *deviceRegistries;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLAllComputeDeviceRegistry;
  v5 = -[MLAllComputeDeviceRegistry init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    deviceRegistries = v5->_deviceRegistries;
    v5->_deviceRegistries = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)registeredAndAccessibleComputeDevices
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MLAllComputeDeviceRegistry deviceRegistries](self, "deviceRegistries", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "registeredAndAccessibleComputeDevices");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRegistries, 0);
}

+ (id)registryWithDeviceRegistries:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeviceRegistries:", v4);

  return v5;
}

@end
