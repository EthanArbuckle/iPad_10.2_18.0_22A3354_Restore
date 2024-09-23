@implementation CHSRemoteDeviceService

- (CHSRemoteDeviceService)init
{
  void *v3;
  CHSRemoteDeviceService *v4;

  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CHSRemoteDeviceService initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (CHSRemoteDeviceService)initWithConnection:(id)a3
{
  id v5;
  CHSRemoteDeviceService *v6;
  CHSRemoteDeviceService *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lock_monitors;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSRemoteDeviceService;
  v6 = -[CHSRemoteDeviceService init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_monitors = v7->_lock_monitors;
    v7->_lock_monitors = v8;

    objc_storeStrong((id *)&v7->_connection, a3);
    -[CHSChronoServicesConnection addClient:](v7->_connection, "addClient:", v7);
  }

  return v7;
}

- (id)browseNearbyDevicesWithHandler:(id)a3 error:(id *)a4
{
  id v6;
  CHSChronoServicesConnection *connection;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *);
  void *v23;
  CHSRemoteDeviceService *v24;
  id v25;
  uint64_t *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  connection = self->_connection;
  v30 = 0;
  v31 = 0;
  -[CHSChronoServicesConnection subscribeToRemoteDevices:outRemoteDevices:](connection, "subscribeToRemoteDevices:outRemoteDevices:", &v31, &v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v31;
  v10 = v30;
  v37 = v8;
  if (a4)
    *a4 = objc_retainAutorelease(v9);
  if (v9)
  {
    CHSLogChronoServices();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v9;
      _os_log_impl(&dword_18FB18000, v11, OS_LOG_TYPE_DEFAULT, "Error acquiring monitor assertion %@", buf, 0xCu);
    }

    objc_msgSend((id)v33[5], "invalidate");
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke;
    v27[3] = &unk_1E2A5B8F0;
    v27[4] = self;
    v29 = v6;
    v15 = v13;
    v28 = v15;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke((uint64_t)v27);
    os_unfair_lock_unlock(&self->_lock);
    v16 = objc_alloc(MEMORY[0x1E0D01868]);
    objc_msgSend(v15, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    v21 = 3221225472;
    v22 = __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke_2;
    v23 = &unk_1E2A5B918;
    v26 = &v32;
    v24 = self;
    v18 = v15;
    v25 = v18;
    v12 = (void *)objc_msgSend(v16, "initWithIdentifier:forReason:invalidationBlock:", v17, CFSTR("monitor devices"), &v20);

    if (objc_msgSend(v10, "count", v20, v21, v22, v23, v24))
      -[CHSRemoteDeviceService nearbyDevicesDidChange:](self, "nearbyDevicesDidChange:", v10);

  }
  _Block_object_dispose(&v32, 8);

  return v12;
}

void __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v2 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v1, "setObject:forKey:");

}

void __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke_2(_QWORD *a1)
{
  os_unfair_lock_s *v2;
  void *v3;
  os_unfair_lock_s *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "invalidate");
  v2 = (os_unfair_lock_s *)a1[4];
  v3 = (void *)a1[5];
  v4 = v2 + 2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke_3;
  v5[3] = &unk_1E2A5A290;
  v5[4] = v2;
  v6 = v3;
  os_unfair_lock_assert_not_owner(v4);
  os_unfair_lock_lock(v4);
  __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke_3((uint64_t)v5);
  os_unfair_lock_unlock(v4);

}

uint64_t __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)nearbyDevicesDidChange:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CHSRemoteDeviceService_nearbyDevicesDidChange___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __49__CHSRemoteDeviceService_nearbyDevicesDidChange___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

void __49__CHSRemoteDeviceService_nearbyDevicesDidChange___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v6[2](v6, *(_QWORD *)(a1 + 40), 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (id)allPairedDevices
{
  return -[CHSChronoServicesConnection allPairedDevices](self->_connection, "allPairedDevices");
}

- (void)pairDevice:(id)a3 completion:(id)a4
{
  -[CHSChronoServicesConnection pairDevice:completion:](self->_connection, "pairDevice:completion:", a3, a4);
}

- (BOOL)unpairDevice:(id)a3 error:(id *)a4
{
  return -[CHSChronoServicesConnection unpairDevice:error:](self->_connection, "unpairDevice:error:", a3, a4);
}

- (BOOL)toggleRemoteWidgetsEnabled:(BOOL)a3 error:(id *)a4
{
  return -[CHSChronoServicesConnection toggleRemoteWidgetsEnabled:error:](self->_connection, "toggleRemoteWidgetsEnabled:error:", a3, a4);
}

- (BOOL)reloadRemoteWidgetsWithError:(id *)a3
{
  return -[CHSChronoServicesConnection reloadRemoteWidgetsWithError:](self->_connection, "reloadRemoteWidgetsWithError:", a3);
}

- (BOOL)remoteWidgetsEnabled
{
  return -[CHSChronoServicesConnection remoteWidgetsEnabled](self->_connection, "remoteWidgetsEnabled");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_monitors, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
