@implementation HDDevicePowerMonitor

- (HDDevicePowerMonitor)init
{
  HDDevicePowerMonitor *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  id v5;
  uint64_t v6;
  HKObserverSet *observers;
  CUPowerSourceMonitor *v8;
  CUPowerSourceMonitor *monitor;
  uint64_t v10;
  CUPowerSourceMonitor *v11;
  _QWORD v13[4];
  HDDevicePowerMonitor *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HDDevicePowerMonitor;
  v2 = -[HDDevicePowerMonitor init](&v22, sel_init);
  if (v2)
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    _HKInitializeLogging();
    v5 = objc_alloc(MEMORY[0x1E0CB6988]);
    v6 = objc_msgSend(v5, "initWithName:loggingCategory:", CFSTR("device-power-observers"), *MEMORY[0x1E0CB52C0]);
    observers = v2->_observers;
    v2->_observers = (HKObserverSet *)v6;

    v8 = (CUPowerSourceMonitor *)objc_alloc_init(MEMORY[0x1E0D1B410]);
    monitor = v2->_monitor;
    v2->_monitor = v8;

    -[CUPowerSourceMonitor setDispatchQueue:](v2->_monitor, "setDispatchQueue:", v2->_queue);
    -[CUPowerSourceMonitor setChangeFlags:](v2->_monitor, "setChangeFlags:", 4);
    objc_initWeak(&location, v2);
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __28__HDDevicePowerMonitor_init__block_invoke;
    v19[3] = &unk_1E6D0A578;
    objc_copyWeak(&v20, &location);
    -[CUPowerSourceMonitor setPowerSourceFoundHandler:](v2->_monitor, "setPowerSourceFoundHandler:", v19);
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __28__HDDevicePowerMonitor_init__block_invoke_2;
    v17[3] = &unk_1E6D0A578;
    objc_copyWeak(&v18, &location);
    -[CUPowerSourceMonitor setPowerSourceLostHandler:](v2->_monitor, "setPowerSourceLostHandler:", v17);
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __28__HDDevicePowerMonitor_init__block_invoke_3;
    v15[3] = &unk_1E6D0A5A0;
    objc_copyWeak(&v16, &location);
    -[CUPowerSourceMonitor setPowerSourceChangedHandler:](v2->_monitor, "setPowerSourceChangedHandler:", v15);
    v11 = v2->_monitor;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __28__HDDevicePowerMonitor_init__block_invoke_4;
    v13[3] = &unk_1E6CE8030;
    v14 = v2;
    -[CUPowerSourceMonitor activateWithCompletion:](v11, "activateWithCompletion:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __28__HDDevicePowerMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  dispatch_queue_t *WeakRetained;
  uint8_t buf[4];
  dispatch_queue_t *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(v2);
  v4 = v3;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = WeakRetained;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Discovered a power source: %{public}@.", buf, 0x16u);
    }
    objc_msgSend(v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("InternalBattery"));

    if (v7)
      -[HDDevicePowerMonitor _queue_updatePrimaryPowerSourceState:]((uint64_t)WeakRetained, objc_msgSend(v4, "powerState"));
  }

}

void __28__HDDevicePowerMonitor_init__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  NSObject *v5;
  dispatch_queue_t *WeakRetained;
  uint8_t buf[4];
  dispatch_queue_t *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(v2);
  v4 = v3;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v8 = WeakRetained;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Lost a power source: %{public}@.", buf, 0x16u);
    }
  }

}

void __28__HDDevicePowerMonitor_init__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  dispatch_queue_t *WeakRetained;
  uint8_t buf[4];
  dispatch_queue_t *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(v2);
  v4 = v3;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = WeakRetained;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Power source updated: %{public}@.", buf, 0x16u);
    }
    objc_msgSend(v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("InternalBattery"));

    if (v7)
      -[HDDevicePowerMonitor _queue_updatePrimaryPowerSourceState:]((uint64_t)WeakRetained, objc_msgSend(v4, "powerState"));
  }

}

void __28__HDDevicePowerMonitor_init__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52C0];
  v5 = *MEMORY[0x1E0CB52C0];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to activate power source monitor: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Activated power source monitoring.", (uint8_t *)&v8, 0xCu);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[CUPowerSourceMonitor invalidate](self->_monitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDDevicePowerMonitor;
  -[HDDevicePowerMonitor dealloc](&v3, sel_dealloc);
}

- (void)addDevicePowerObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;

  observers = self->_observers;
  if (a4)
    -[HKObserverSet registerObserver:queue:](observers, "registerObserver:queue:", a3);
  else
    -[HKObserverSet registerObserver:](observers, "registerObserver:", a3);
}

- (void)removeDevicePowerObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)_queue_updatePrimaryPowerSourceState:(uint64_t)a1
{
  unsigned int v4;
  void *v5;
  _QWORD v6[5];
  char v7;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v4 = (a2 < 4) & (0xCu >> (a2 & 0xF));
  if (*(unsigned __int8 *)(a1 + 32) != v4)
  {
    *(_BYTE *)(a1 + 32) = v4;
    v5 = *(void **)(a1 + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__HDDevicePowerMonitor__queue_updatePrimaryPowerSourceState___block_invoke;
    v6[3] = &unk_1E6D0A5C8;
    v6[4] = a1;
    v7 = (a2 < 4) & (0xCu >> (a2 & 0xF));
    objc_msgSend(v5, "notifyObservers:", v6);
  }
}

uint64_t __61__HDDevicePowerMonitor__queue_updatePrimaryPowerSourceState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "devicePowerMonitor:primaryPowerSourceIsCharging:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)primarySourceIsCharging
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__HDDevicePowerMonitor_primarySourceIsCharging__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__HDDevicePowerMonitor_primarySourceIsCharging__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
