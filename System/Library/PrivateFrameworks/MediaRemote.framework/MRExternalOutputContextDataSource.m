@implementation MRExternalOutputContextDataSource

- (MRExternalOutputContextDataSource)initWithUniqueIdentifier:(id)a3
{
  id v5;
  MRExternalOutputContextDataSource *v6;
  MRExternalOutputContextDataSource *v7;
  NSMutableArray *v8;
  NSMutableArray *outputDevices;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRExternalOutputContextDataSource;
  v6 = -[MRExternalOutputContextDataSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uniqueIdentifier, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    outputDevices = v7->_outputDevices;
    v7->_outputDevices = v8;

  }
  return v7;
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (float)volume
{
  MRExternalOutputContextDataSource *v2;
  float masterVolume;

  v2 = self;
  objc_sync_enter(v2);
  masterVolume = v2->_masterVolume;
  objc_sync_exit(v2);

  return masterVolume;
}

- (unsigned)volumeControlCapabilities
{
  MRExternalOutputContextDataSource *v2;
  unsigned int masterVolumeControlCapabilities;

  v2 = self;
  objc_sync_enter(v2);
  masterVolumeControlCapabilities = v2->_masterVolumeControlCapabilities;
  objc_sync_exit(v2);

  return masterVolumeControlCapabilities;
}

- (BOOL)isVolumeMuted
{
  MRExternalOutputContextDataSource *v2;
  BOOL groupVolumeMuted;

  v2 = self;
  objc_sync_enter(v2);
  groupVolumeMuted = v2->_groupVolumeMuted;
  objc_sync_exit(v2);

  return groupVolumeMuted;
}

- (void)updateOutputDevices:(id)a3
{
  MRExternalOutputContextDataSource *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v7, "mr_allOutputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mr_redactClusterMembers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRExternalOutputContextDataSource _updateOutputDevices:]((id *)&v4->super.super.isa, v6);

  objc_sync_exit(v4);
}

- (void)_updateOutputDevices:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  float v14;
  float v15;
  float v16;
  float v17;
  int v18;
  void *v19;
  MRAVDistantOutputDevice *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_msgSend(a1[7], "mutableCopy");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v22 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __58__MRExternalOutputContextDataSource__updateOutputDevices___block_invoke;
          v23[3] = &unk_1E30C5F68;
          v23[4] = v10;
          objc_msgSend(v4, "msv_firstWhere:", v23);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v10, "mergingVolumeFrom:", v11);
            v12 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[7], "removeObject:", v11);
            objc_msgSend(a1[7], "addObject:", v12);
            -[MROutputContextDataSource notifyOutputDeviceChanged:](a1, v12);
            v13 = -[NSObject volumeCapabilities](v12, "volumeCapabilities");
            if (v13 != objc_msgSend(v11, "volumeCapabilities"))
              -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](a1, -[NSObject volumeCapabilities](v12, "volumeCapabilities"), v12);
            -[NSObject volume](v12, "volume");
            v15 = v14;
            objc_msgSend(v11, "volume");
            if (vabds_f32(v15, v16) > 0.001)
            {
              -[NSObject volume](v12, "volume");
              -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](a1, v12, v17);
            }
            v18 = -[NSObject isVolumeMuted](v12, "isVolumeMuted");
            if (v18 != objc_msgSend(v11, "isVolumeMuted"))
              -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](a1, -[NSObject isVolumeMuted](v12, "isVolumeMuted"), v12);
          }
          else
          {
            objc_msgSend(v10, "uid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v20 = [MRAVDistantOutputDevice alloc];
              objc_msgSend(v10, "descriptor");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = -[MRAVDistantOutputDevice initWithDescriptor:](v20, "initWithDescriptor:", v21);

              objc_msgSend(a1[7], "addObject:", v12);
              -[MROutputContextDataSource notifyOutputDeviceAdded:](a1, v12);
              -[MRExternalOutputContextDataSource _reevaluateMasterVolumeControlCapabilities](a1);
              -[MRExternalOutputContextDataSource _reevaluateMasterVolume]((float *)a1);
              -[MRExternalOutputContextDataSource _reevaluateGroupVolumeMuted](a1);
            }
            else
            {
              _MRLogForCategory(0);
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v10;
                _os_log_fault_impl(&dword_193827000, v12, OS_LOG_TYPE_FAULT, "Empty outputDeviceUID: %@", buf, 0xCu);
              }
            }
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v7);
    }

    v3 = v22;
  }

}

uint64_t __58__MRExternalOutputContextDataSource__updateOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)_reevaluateMasterVolumeControlCapabilities
{
  int v2;

  if (a1)
  {
    v2 = -[MRExternalOutputContextDataSource _calculateMasterVolumeCapabilities]((uint64_t)a1);
    if (v2 != a1[17])
    {
      a1[17] = v2;
      -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](a1, a1[17], 0);
    }
  }
}

- (void)_reevaluateMasterVolume
{
  float v2;

  if (a1)
  {
    v2 = -[MRExternalOutputContextDataSource _calculateMasterVolume]((uint64_t)a1);
    if (vabds_f32(v2, a1[16]) > 0.001)
    {
      a1[16] = v2;
      -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](a1, 0, a1[16]);
    }
  }
}

- (void)_reevaluateGroupVolumeMuted
{
  uint64_t v2;

  if (a1)
  {
    v2 = -[MRExternalOutputContextDataSource _calculateGroupMute]((uint64_t)a1);
    if (a1[72] != (_DWORD)v2)
    {
      a1[72] = v2;
      -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](a1, v2, 0);
    }
  }
}

- (void)removeOutputDevices:(id)a3
{
  id v4;
  MRExternalOutputContextDataSource *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id obj;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v17 = (void *)-[NSMutableArray copy](v5->_outputDevices, "copy");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v7 = v17;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v21 != v9)
                objc_enumerationMutation(v7);
              v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(v11, "uid");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "isEqualToString:", v6))
              {

              }
              else
              {
                objc_msgSend(v11, "parentUID");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v13, "isEqualToString:", v6);

                if (!v14)
                  continue;
              }
              -[NSMutableArray removeObject:](v5->_outputDevices, "removeObject:", v11);
              -[MROutputContextDataSource notifyOutputDeviceRemoved:](v5, v11);
            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v8);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }

  -[MRExternalOutputContextDataSource _reevaluateMasterVolume]((float *)v5);
  -[MRExternalOutputContextDataSource _reevaluateGroupVolumeMuted](v5);
  -[MRExternalOutputContextDataSource _reevaluateMasterVolumeControlCapabilities](v5);

  objc_sync_exit(v5);
}

- (void)removeAllOutputDevices
{
  MRExternalOutputContextDataSource *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2->_outputDevices;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[MROutputContextDataSource notifyOutputDeviceRemoved:](v2, *(void **)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  -[NSMutableArray removeAllObjects](v2->_outputDevices, "removeAllObjects", (_QWORD)v7);
  -[MRExternalOutputContextDataSource _reevaluateGroupVolumeMuted](v2);
  -[MRExternalOutputContextDataSource _reevaluateMasterVolume]((float *)v2);
  -[MRExternalOutputContextDataSource _reevaluateMasterVolumeControlCapabilities](v2);
  objc_sync_exit(v2);

}

- (void)updateVolumeControlCapabilities:(unsigned int)a3 outputDeviceUID:(id)a4
{
  _QWORD v4[5];
  unsigned int v5;
  _QWORD v6[4];
  unsigned int v7;
  _QWORD v8[4];
  unsigned int v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke;
  v8[3] = &__block_descriptor_36_e26_B16__0__MRAVOutputDevice_8l;
  v9 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke_2;
  v6[3] = &__block_descriptor_36_e45_v16__0___MRAVOutputDeviceDescriptorProtobuf_8l;
  v7 = a3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke_3;
  v4[3] = &unk_1E30C88C0;
  v4[4] = self;
  v5 = a3;
  -[MRExternalOutputContextDataSource _updateOutputDevice:predicate:update:action:](self, a4, v8, v6, v4);
}

BOOL __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "volumeCapabilities") != *(_DWORD *)(a1 + 32);
}

uint64_t __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVolumeCapabilities:", *(unsigned int *)(a1 + 32));
}

void __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke_3(uint64_t a1, void *a2)
{
  -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](*(void **)(a1 + 32), *(unsigned int *)(a1 + 40), a2);
  -[MRExternalOutputContextDataSource _reevaluateMasterVolumeControlCapabilities](*(_DWORD **)(a1 + 32));
}

- (void)_updateOutputDevice:(void *)a3 predicate:(void *)a4 update:(void *)a5 action:
{
  id v9;
  unsigned int (**v10)(id, void *);
  void (**v11)(id, void *);
  void (**v12)(id, MRAVDistantOutputDevice *);
  id *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  MRAVDistantOutputDevice *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v13 = a1;
    objc_sync_enter(v13);
    if (v9)
    {
      v14 = v13[7];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __81__MRExternalOutputContextDataSource__updateOutputDevice_predicate_update_action___block_invoke;
      v23[3] = &unk_1E30C5F68;
      v15 = v9;
      v24 = v15;
      objc_msgSend(v14, "msv_firstWhere:", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "descriptor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10[2](v10, v17))
          v11[2](v11, v18);
        v19 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v18);
        objc_msgSend(v13[7], "removeObject:", v17);
        objc_msgSend(v13[7], "addObject:", v19);
        v12[2](v12, v19);

      }
      else
      {
        _MRLogForCategory(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v26 = v21;
          v27 = 2048;
          v28 = v13;
          v29 = 2114;
          v30 = v15;
          v22 = v21;
          _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Attempted to update a non-existent outputDevice %{public}@", buf, 0x20u);

        }
      }

    }
    objc_sync_exit(v13);

  }
}

- (void)updateVolume:(float)a3 outputDeviceUID:(id)a4
{
  _QWORD v4[5];
  float v5;
  _QWORD v6[4];
  float v7;
  _QWORD v8[5];
  float v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke;
  v8[3] = &unk_1E30C88E8;
  v9 = a3;
  v8[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke_2;
  v6[3] = &__block_descriptor_36_e45_v16__0___MRAVOutputDeviceDescriptorProtobuf_8l;
  v7 = a3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke_3;
  v4[3] = &unk_1E30C88C0;
  v4[4] = self;
  v5 = a3;
  -[MRExternalOutputContextDataSource _updateOutputDevice:predicate:update:action:](self, a4, v8, v6, v4);
}

BOOL __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke(uint64_t a1, void *a2)
{
  float v3;
  float v4;

  objc_msgSend(a2, "volume");
  v3 = *(float *)(a1 + 40);
  return vabds_f32(v4, v3) > 0.001 || *(float *)(*(_QWORD *)(a1 + 32) + 64) + 0.001 < v3;
}

uint64_t __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setVolume:", a3);
}

void __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke_3(uint64_t a1, void *a2)
{
  -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](*(void **)(a1 + 32), a2, *(float *)(a1 + 40));
  -[MRExternalOutputContextDataSource _reevaluateMasterVolume](*(float **)(a1 + 32));
}

- (void)updateVolumeMuted:(BOOL)a3 outputDeviceUID:(id)a4
{
  _QWORD v4[5];
  BOOL v5;
  _QWORD v6[4];
  BOOL v7;
  _QWORD v8[4];
  BOOL v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke;
  v8[3] = &__block_descriptor_33_e26_B16__0__MRAVOutputDevice_8l;
  v9 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke_2;
  v6[3] = &__block_descriptor_33_e45_v16__0___MRAVOutputDeviceDescriptorProtobuf_8l;
  v7 = a3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke_3;
  v4[3] = &unk_1E30C8950;
  v4[4] = self;
  v5 = a3;
  -[MRExternalOutputContextDataSource _updateOutputDevice:predicate:update:action:](self, a4, v8, v6, v4);
}

BOOL __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) != objc_msgSend(a2, "isVolumeMuted");
}

uint64_t __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVolumeMuted:", *(unsigned __int8 *)(a1 + 32));
}

void __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke_3(uint64_t a1, void *a2)
{
  -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](*(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 40), a2);
  -[MRExternalOutputContextDataSource _reevaluateGroupVolumeMuted](*(_BYTE **)(a1 + 32));
}

uint64_t __81__MRExternalOutputContextDataSource__updateOutputDevice_predicate_update_action___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)outputDevices
{
  id v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MRAVDistantOutputDevice *v21;
  void *v22;
  void *v23;
  void *v24;
  MRExternalOutputContextDataSource *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  obj = self;
  objc_sync_enter(obj);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = obj->_outputDevices;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v7, "parentUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(v7, "uid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9 == 0;

          if (v10)
            continue;
          objc_msgSend(v7, "uid");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, v8);
        }

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v4);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = obj->_outputDevices;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v15, "parentUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "parentUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("MROutputContextDataSource.m"), 583, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parent"));

          }
          objc_msgSend(v18, "descriptor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "descriptor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addActivatedClusterMembers:", v20);

          v21 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v19);
          objc_msgSend(v15, "parentUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, v22);

        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v12);
  }

  objc_msgSend(v2, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(obj);
  return v24;
}

- (void)initializeVolumeCapabilitiesForLegacyCleints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MRExternalOutputContextDataSource outputDevices](self, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "volumeCapabilities"))
          -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](self, objc_msgSend(v8, "volumeCapabilities"), v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  v9 = -[MRExternalOutputContextDataSource volumeControlCapabilities](self, "volumeControlCapabilities");
  if ((_DWORD)v9)
    -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](self, v9, 0);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MRExternalOutputContextDataSource *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray msv_map:](v4->_outputDevices, "msv_map:", &__block_literal_global_134_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("outputDevices"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_uniqueIdentifier, CFSTR("uid"));

}

uint64_t __53__MRExternalOutputContextDataSource_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptor");
}

- (MRExternalOutputContextDataSource)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MRExternalOutputContextDataSource *v12;
  uint64_t v13;
  NSMutableArray *outputDevices;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = [v4 alloc];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("outputDevices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "msv_map:", &__block_literal_global_143);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MRExternalOutputContextDataSource initWithUniqueIdentifier:]([MRExternalOutputContextDataSource alloc], "initWithUniqueIdentifier:", v11);
  v13 = objc_msgSend(v10, "mutableCopy");
  outputDevices = v12->_outputDevices;
  v12->_outputDevices = (NSMutableArray *)v13;

  v12->_masterVolumeControlCapabilities = -[MRExternalOutputContextDataSource _calculateMasterVolumeCapabilities]((uint64_t)v12);
  v12->_masterVolume = -[MRExternalOutputContextDataSource _calculateMasterVolume]((uint64_t)v12);
  v12->_groupVolumeMuted = -[MRExternalOutputContextDataSource _calculateGroupMute]((uint64_t)v12);

  return v12;
}

MRAVDistantOutputDevice *__51__MRExternalOutputContextDataSource_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVDistantOutputDevice *v3;

  v2 = a2;
  v3 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v2);

  return v3;
}

- (uint64_t)_calculateMasterVolumeCapabilities
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 56);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    LODWORD(v4) = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v1);
        v4 = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "volumeCapabilities", (_QWORD)v8) | v4;
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (float)_calculateMasterVolume
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  uint64_t i;
  void *v7;
  float v8;
  float v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 56);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    v5 = 0.0;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "volumeCapabilities", (_QWORD)v11) & 2) != 0)
        {
          objc_msgSend(v7, "volume");
          if (v8 > v5)
          {
            objc_msgSend(v7, "volume");
            v5 = v9;
          }
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (uint64_t)_calculateGroupMute
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v1 = *(id *)(a1 + 56);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v2)
    {
      v3 = v2;
      v4 = 0;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v1);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if ((objc_msgSend(v7, "volumeCapabilities", (_QWORD)v9) & 8) != 0)
            v4 |= objc_msgSend(v7, "isVolumeMuted");
        }
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v3);
    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
