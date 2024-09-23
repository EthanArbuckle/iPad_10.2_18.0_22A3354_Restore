@implementation HKBluetoothDeviceDataSource

- (HKBluetoothDeviceDataSource)init
{
  return -[HKBluetoothDeviceDataSource initWithDiscoveryType:](self, "initWithDiscoveryType:", objc_opt_class());
}

- (HKBluetoothDeviceDataSource)initWithDiscoveryType:(Class)a3
{
  HKBluetoothDeviceDataSource *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKBluetoothDeviceDataSource;
  result = -[HKObserverBridge init](&v5, sel_init);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_DiscoveryType = a3;
    result->_lock_isDiscoveryActive = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[HKBluetoothDeviceDataSource _endDiscovery]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HKBluetoothDeviceDataSource;
  -[HKObserverBridge dealloc](&v3, sel_dealloc);
}

- (void)_endDiscovery
{
  void *v2;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    v2 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  }
}

- (id)_devicesWithError:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;

  if (a1)
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsBluetoothDiscovery");

    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
      if (*(_BYTE *)(a1 + 48))
        objc_msgSend(*(id *)(a1 + 40), "discoveredDevices");
      else
        objc_msgSend(*(id *)(a1 + 56), "devicesWithDiscoveryFlags:error:", 0x800000, a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)pairedDevicesWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[HKBluetoothDeviceDataSource _devicesWithError:]((uint64_t)self, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_filter:", &__block_literal_global_113);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __54__HKBluetoothDeviceDataSource_pairedDevicesWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isGuestPaired") ^ 1;
}

- (id)_beginDiscoveryWithObserver:(id)a1
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1 + 8);
    if (*((_QWORD *)a1 + 5))
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        -[HKBluetoothDeviceDataSource _beginDiscoveryWithObserver:].cold.1((uint64_t)a1, v4);

      objc_msgSend(*((id *)a1 + 5), "invalidate");
      *((_BYTE *)a1 + 48) = 0;
    }
    v5 = objc_alloc_init((Class)objc_opt_class());
    v6 = objc_opt_class();
    objc_msgSend(v5, "setDiscoveryFlags:", 0x800000);
    objc_msgSend(v5, "setLabel:", CFSTR("HKBluetoothDeviceDataSource"));
    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke;
    v18[3] = &unk_1E37F54D0;
    v20 = v6;
    v8 = v3;
    v19 = v8;
    objc_msgSend(v5, "setDeviceFoundHandler:", v18);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_10;
    v15[3] = &unk_1E37F54D0;
    v17 = v6;
    v16 = v8;
    objc_msgSend(v5, "setDeviceLostHandler:", v15);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_11;
    v14[3] = &__block_descriptor_40_e17_v16__0__NSError_8lu32l8;
    v14[4] = v6;
    objc_msgSend(v5, "setErrorHandler:", v14);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_14;
    v12[3] = &unk_1E37F1458;
    v12[4] = a1;
    v9 = v5;
    v13 = v9;
    objc_msgSend(v9, "activateWithCompletion:", v12);
    objc_storeStrong((id *)a1 + 5, v5);
    os_unfair_lock_unlock((os_unfair_lock_t)a1 + 8);
    v10 = v13;
    a1 = v9;

  }
  return a1;
}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device found: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "notifyObserversOfChangeForKey:newValue:", CFSTR("CBDiscoveryObservation"), 0);

}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device lost: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "notifyObserversOfChangeForKey:newValue:", CFSTR("CBDiscoveryObservation"), 0);

}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_11_cold_1(a1, (uint64_t)v3, v4);

}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(v4 + 40))
  {
    *(_BYTE *)(v4 + 48) = 1;
    v4 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_14_cold_1(a1 + 32, (uint64_t)v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v7;
    v12 = 2048;
    v13 = v8;
    v9 = v7;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Activated CBDiscovery:%p", (uint8_t *)&v10, 0x16u);

  }
}

- (void)registerObserverForDevicePairingChanges:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__HKBluetoothDeviceDataSource_registerObserverForDevicePairingChanges_updateHandler___block_invoke;
  v8[3] = &unk_1E37EBBB8;
  v9 = v6;
  v7 = v6;
  -[HKObserverBridge registerObserver:forKey:newValueHandler:](self, "registerObserver:forKey:newValueHandler:", a3, CFSTR("CBDiscoveryObservation"), v8);

}

uint64_t __85__HKBluetoothDeviceDataSource_registerObserverForDevicePairingChanges_updateHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterObserverForDevicePairingChanges:(id)a3
{
  -[HKObserverBridge unregisterObserver:forKey:](self, "unregisterObserver:forKey:", a3, CFSTR("CBDiscoveryObservation"));
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  HKBluetoothDeviceDataSource *v8;
  NSObject *v9;
  HKBluetoothDeviceDataSource *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("CBDiscoveryObservation")))
  {
    -[HKBluetoothDeviceDataSource _beginDiscoveryWithObserver:](self, v7);
    v8 = (HKBluetoothDeviceDataSource *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[HKBluetoothDeviceDataSource makeAndRegisterBridgedObserverForKey:handle:].cold.1();

    v8 = self;
  }
  v10 = v8;

  return v10;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("CBDiscoveryObservation")))
  {
    -[HKBluetoothDeviceDataSource _endDiscovery]((uint64_t)self);
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[HKBluetoothDeviceDataSource unregisterBridgedObserver:forKey:].cold.1();

  }
}

- (HKCBDiscovery)discovery
{
  return self->_discovery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_lock_discovery, 0);
}

- (void)_beginDiscoveryWithObserver:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;

  v4 = 138543362;
  v5 = (id)OUTLINED_FUNCTION_2_2();
  v3 = v5;
  _os_log_fault_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] CBDiscovery beginning while another is currently running", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_11_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, a3, (uint64_t)a3, "[%{public}@] Error during CBDiscovery: %{public}@", (uint8_t *)&v4);
}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_14_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  v5 = OUTLINED_FUNCTION_0_7(v4);
  OUTLINED_FUNCTION_0_11(&dword_19A0E6000, a3, v6, "[%{public}@] Error activating CBDiscovery: %{public}@", v7);

  OUTLINED_FUNCTION_1_0();
}

- (void)makeAndRegisterBridgedObserverForKey:handle:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_2_2();
  v1 = OUTLINED_FUNCTION_0_7(v0);
  OUTLINED_FUNCTION_2_10(&dword_19A0E6000, v2, v3, "[%{public}@] Unsupported registration key: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)unregisterBridgedObserver:forKey:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_2_2();
  v1 = OUTLINED_FUNCTION_0_7(v0);
  OUTLINED_FUNCTION_2_10(&dword_19A0E6000, v2, v3, "[%{public}@] Unsupported unregistration key: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
