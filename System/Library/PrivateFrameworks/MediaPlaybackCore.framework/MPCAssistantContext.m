@implementation MPCAssistantContext

- (MPCAssistantContext)init
{
  MPCAssistantContext *v2;
  MPCAssistantDiscovery *v3;
  MPCAssistantDiscovery *discovery;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPCAssistantContext;
  v2 = -[MPCAssistantContext init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MPCAssistantDiscovery);
    discovery = v2->_discovery;
    v2->_discovery = v3;

  }
  return v2;
}

- (void)modifySystemMusicContextForDestination:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  MPCAssistantDiscovery *discovery;
  void *v12;
  void *v13;
  uint64_t v14;
  MPCAssistantDiscovery *v15;
  _QWORD aBlock[4];
  id v17;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__MPCAssistantContext_modifySystemMusicContextForDestination_completion___block_invoke;
  aBlock[3] = &unk_24CAB9910;
  v8 = v7;
  v17 = v8;
  v9 = _Block_copy(aBlock);
  objc_msgSend(v6, "outputGroupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    discovery = self->_discovery;
    objc_msgSend(v6, "outputGroupID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantDiscovery discoverAirplayDevicesMatchingGroupID:completion:](discovery, "discoverAirplayDevicesMatchingGroupID:completion:", v12, v9);
  }
  else
  {
    objc_msgSend(v6, "outputDeviceUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
    {
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
      goto LABEL_6;
    }
    v15 = self->_discovery;
    objc_msgSend(v6, "outputDeviceUIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantDiscovery discoverAirplayDevicesMatchingUIDs:completion:](v15, "discoverAirplayDevicesMatchingUIDs:completion:", v12, v9);
  }

LABEL_6:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);
}

void __73__MPCAssistantContext_modifySystemMusicContextForDestination_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "Setting output devices on the shared audio presentation context: %{public}@", buf, 0xCu);
    }

    dispatch_get_global_queue(0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MRAVOutputContextGetSharedAudioPresentationContext();
    v7 = *(id *)(a1 + 32);
    MRAVOutputContextSetOutputDevices();

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    MPCAssistantCreateError(1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }

}

void __73__MPCAssistantContext_modifySystemMusicContextForDestination_completion___block_invoke_1(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = a2;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "Failed to set output devices on the shared audio presentation context: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    MPCAssistantCreateError(4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

@end
