@implementation HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface

- (id)createAssistantDiscovery
{
  return objc_alloc_init(MEMORY[0x1E0D4B308]);
}

- (id)createAssistantConnection
{
  return objc_alloc_init(MEMORY[0x1E0D4B300]);
}

- (id)copyMRAVEndpointOutputDevices:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "mravEndpoint");
  return (id)MRAVEndpointCopyOutputDevices();
}

- (id)setMRAVOutputDeviceVolume:(float)a3 endpoint:(id)a4 outputDeviceUID:(id)a5 queue:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  float v22;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0D519C0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __122__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_setMRAVOutputDeviceVolume_endpoint_outputDeviceUID_queue___block_invoke;
  v18[3] = &unk_1E89A76A8;
  v19 = v9;
  v20 = v10;
  v22 = a3;
  v21 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v12, "futureWithErrorOnlyHandlerAdapterBlock:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D519C0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __154__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint_outputDeviceUID_queue___block_invoke;
  v16[3] = &unk_1E89A76F8;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "futureWithCompletionHandlerAdapterBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __154__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint_outputDeviceUID_queue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "mravEndpoint");
  v5 = v3;
  v4 = v3;
  MRAVEndpointGetOutputDeviceUIDVolumeControlCapabilities();

}

void __154__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint_outputDeviceUID_queue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);

}

void __122__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_setMRAVOutputDeviceVolume_endpoint_outputDeviceUID_queue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "mravEndpoint");
  v5 = v3;
  v4 = v3;
  MRAVEndpointSetOutputDeviceUIDVolume();

}

uint64_t __122__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_setMRAVOutputDeviceVolume_endpoint_outputDeviceUID_queue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
