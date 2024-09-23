@implementation DMTSharingDiscoveryPrimitives

- (DMTSharingDiscoveryPrimitives)init
{
  DMTSharingDiscoveryPrimitives *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *discoveryCallbackQueue;
  uint64_t v5;
  SFDeviceDiscovery *deviceDiscovery;
  uint64_t v7;
  NSMutableDictionary *foundDevicesByIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DMTSharingDiscoveryPrimitives;
  v2 = -[DMTSharingDiscoveryPrimitives init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.devicemanagementtools.discovery", 0);
    discoveryCallbackQueue = v2->_discoveryCallbackQueue;
    v2->_discoveryCallbackQueue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new();
    deviceDiscovery = v2->_deviceDiscovery;
    v2->_deviceDiscovery = (SFDeviceDiscovery *)v5;

    -[SFDeviceDiscovery setDispatchQueue:](v2->_deviceDiscovery, "setDispatchQueue:", v2->_discoveryCallbackQueue);
    -[SFDeviceDiscovery setDiscoveryFlags:](v2->_deviceDiscovery, "setDiscoveryFlags:", 0x8000);
    -[SFDeviceDiscovery setPurpose:](v2->_deviceDiscovery, "setPurpose:", CFSTR("RemoteManagementPairing"));
    -[SFDeviceDiscovery setChangeFlags:](v2->_deviceDiscovery, "setChangeFlags:", 1);
    -[SFDeviceDiscovery setFastScanMode:](v2->_deviceDiscovery, "setFastScanMode:", 1);
    -[SFDeviceDiscovery setScanRate:](v2->_deviceDiscovery, "setScanRate:", 50);
    v7 = objc_opt_new();
    foundDevicesByIdentifier = v2->_foundDevicesByIdentifier;
    v2->_foundDevicesByIdentifier = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[DMTSharingDiscoveryPrimitives addDependencyHandlers](self, "addDependencyHandlers");
  objc_initWeak(&location, self);
  -[DMTSharingDiscoveryPrimitives deviceDiscovery](self, "deviceDiscovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__DMTSharingDiscoveryPrimitives_activateWithCompletion___block_invoke;
  v7[3] = &unk_24E5A0218;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "activateWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __56__DMTSharingDiscoveryPrimitives_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setActivated:", v4 == 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)deactivate
{
  id v2;

  -[DMTSharingDiscoveryPrimitives deviceDiscovery](self, "deviceDiscovery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (id)sessionForDevice:(id)a3
{
  id v3;
  DMTCatalystSharingBackedDeviceSession *v4;

  v3 = a3;
  v4 = -[DMTCatalystSharingBackedDeviceSession initWithDevice:]([DMTCatalystSharingBackedDeviceSession alloc], "initWithDevice:", v3);

  return v4;
}

- (void)addDependencyHandlers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke;
  v18[3] = &unk_24E5A0240;
  objc_copyWeak(&v19, &location);
  -[DMTSharingDiscoveryPrimitives deviceDiscovery](self, "deviceDiscovery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInvalidationHandler:", v18);

  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_2;
  v16[3] = &unk_24E5A0240;
  objc_copyWeak(&v17, &location);
  -[DMTSharingDiscoveryPrimitives deviceDiscovery](self, "deviceDiscovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterruptionHandler:", v16);

  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_8;
  v14[3] = &unk_24E5A0268;
  objc_copyWeak(&v15, &location);
  -[DMTSharingDiscoveryPrimitives deviceDiscovery](self, "deviceDiscovery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeviceLostHandler:", v14);

  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_10;
  v12[3] = &unk_24E5A0268;
  objc_copyWeak(&v13, &location);
  -[DMTSharingDiscoveryPrimitives deviceDiscovery](self, "deviceDiscovery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeviceFoundHandler:", v12);

  objc_copyWeak(&v11, &location);
  -[DMTSharingDiscoveryPrimitives deviceDiscovery](self, "deviceDiscovery", v3, 3221225472, __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_11, &unk_24E5A0290);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceChangedHandler:", &v10);

  -[DMTSharingDiscoveryPrimitives deviceDiscovery](self, "deviceDiscovery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeoutHandler:", &__block_literal_global_1);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setInvalidated:", 1);
    objc_msgSend(v4, "invalidationHandler");
    v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      DMTErrorWithCodeAndUserInfo(10, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v2)[2](v2, v3);

    }
    WeakRetained = v4;
  }

}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "isInvalidated"))
    {
      _DMTLogGeneral_0();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_21FD69000, (os_log_t)v3, OS_LOG_TYPE_INFO, "Interrupted after invalidation, no-op", v5, 2u);
      }
    }
    else
    {
      objc_msgSend(v2, "setInvalidated:", 1);
      objc_msgSend(v2, "invalidationHandler");
      v3 = objc_claimAutoreleasedReturnValue();
      DMTErrorWithCodeAndUserInfo(11, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    }
  }

}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v3, "deviceActionType") == 21)
  {
    objc_msgSend(WeakRetained, "foundDevicesByIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      _DMTLogGeneral_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_8_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

    }
    objc_msgSend(WeakRetained, "foundDevicesByIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v17);

    objc_msgSend(WeakRetained, "deviceLostHandler");
    v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v18)[2](v18, v7);

  }
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _DMTLogGeneral_0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_10_cold_1(v3, v5);

    objc_msgSend(WeakRetained, "handleDevice:", v3);
  }

}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_11(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _DMTLogGeneral_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_11_cold_1((uint64_t)v5, a3, v7);

    if ((a3 & 1) != 0)
    {
      _DMTLogGeneral_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138412546;
        v10 = v5;
        v11 = 1024;
        v12 = objc_msgSend(v5, "deviceActionType");
        _os_log_impl(&dword_21FD69000, v8, OS_LOG_TYPE_INFO, "Advertisement data changed for device: %@ with action type: %d", (uint8_t *)&v9, 0x12u);
      }

      objc_msgSend(WeakRetained, "handleDevice:", v5);
    }
  }

}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_13()
{
  NSObject *v0;

  _DMTLogGeneral_0();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_13_cold_1(v0);

}

- (void)handleDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DMTSharingDevice *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (objc_msgSend(v4, "deviceActionType") == 21)
  {
    -[DMTSharingDiscoveryPrimitives foundDevicesByIdentifier](self, "foundDevicesByIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (DMTSharingDevice *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _DMTLogGeneral_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
        -[DMTSharingDiscoveryPrimitives handleDevice:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
    else
    {
      v7 = -[DMTSharingDevice initWithDevice:]([DMTSharingDevice alloc], "initWithDevice:", v4);
      -[DMTSharingDiscoveryPrimitives foundDevicesByIdentifier](self, "foundDevicesByIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATSharingDevice identifier](v7, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v7, v16);

      -[DMTSharingDiscoveryPrimitives deviceFoundHandler](self, "deviceFoundHandler");
      v8 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, DMTSharingDevice *))(v8 + 16))(v8, v7);
    }

  }
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)discoveryCallbackQueue
{
  return self->_discoveryCallbackQueue;
}

- (SFDeviceDiscovery)deviceDiscovery
{
  return self->_deviceDiscovery;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSMutableDictionary)foundDevicesByIdentifier
{
  return self->_foundDevicesByIdentifier;
}

- (void)setFoundDevicesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_foundDevicesByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundDevicesByIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_discoveryCallbackQueue, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_8_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21FD69000, a1, a3, "Primitives reported a device lost that we've never seen (%{public}@).  This is a known Sharing behavior. Falling through anyways.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_10_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = objc_msgSend(a1, "deviceActionType");
  OUTLINED_FUNCTION_2(&dword_21FD69000, a2, v3, "deviceFoundHandler was called for device: %@ with action type: %d", (uint8_t *)&v4);
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_11_cold_1(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  OUTLINED_FUNCTION_2(&dword_21FD69000, a3, (uint64_t)a3, "deviceChangedHandler was called for device: %@ with change flags: %d", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_13_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21FD69000, log, OS_LOG_TYPE_DEBUG, "timeoutHandler was called, we're not sure why", v1, 2u);
}

- (void)handleDevice:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21FD69000, a2, a3, "Primitives reported a device found that we've already seen (%{public}@). This is a known Sharing behavior.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
