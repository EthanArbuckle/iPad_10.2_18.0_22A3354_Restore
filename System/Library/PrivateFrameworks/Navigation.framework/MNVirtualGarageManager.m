@implementation MNVirtualGarageManager

- (id)initPrivate
{
  MNVirtualGarageManager *v2;
  uint64_t v3;
  GEOObserverHashTable *observers;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MNVirtualGarageManager;
  v2 = -[MNVirtualGarageManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D272B8]), "initWithProtocol:queue:", &unk_1EEED06B8, 0);
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v3;

    -[MNVirtualGarageManager _standardVirtualGarageProvider](v2, "_standardVirtualGarageProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNVirtualGarageManager setProvider:](v2, "setProvider:", v5);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MNVirtualGarageProvider setVirtualGarageDelegate:](self->_provider, "setVirtualGarageDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MNVirtualGarageManager;
  -[MNVirtualGarageManager dealloc](&v3, sel_dealloc);
}

+ (MNVirtualGarageManager)sharedManager
{
  if (qword_1ED0C4130 != -1)
    dispatch_once(&qword_1ED0C4130, &__block_literal_global_50);
  return (MNVirtualGarageManager *)(id)_MergedGlobals_49;
}

void __39__MNVirtualGarageManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MNVirtualGarageManager initPrivate]([MNVirtualGarageManager alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_49;
  _MergedGlobals_49 = (uint64_t)v0;

}

- (void)setProvider:(id)a3
{
  MNVirtualGarageProvider *v4;
  MNVirtualGarageProvider *provider;
  _BOOL4 v6;
  BOOL v7;
  VGVehicle *lastVehicle;
  MNVirtualGarageProvider *obj;
  MNVirtualGarageProvider *obja;

  v4 = (MNVirtualGarageProvider *)a3;
  provider = self->_provider;
  if (provider != v4)
  {
    if (!provider
      || (obj = v4, v6 = -[MNVirtualGarageManager _isStandardProvider:](self, "_isStandardProvider:"), v4 = obj, !v6)
      || (v7 = -[MNVirtualGarageManager _isStandardProvider:](self, "_isStandardProvider:", self->_provider),
          v4 = obj,
          !v7))
    {
      if (!v4)
      {
        -[MNVirtualGarageManager _standardVirtualGarageProvider](self, "_standardVirtualGarageProvider");
        v4 = (MNVirtualGarageProvider *)objc_claimAutoreleasedReturnValue();
      }
      obja = v4;
      -[MNVirtualGarageProvider setVirtualGarageDelegate:](self->_provider, "setVirtualGarageDelegate:", 0);
      -[MNVirtualGarageProvider stopVirtualGarageUpdates](self->_provider, "stopVirtualGarageUpdates");
      objc_storeStrong((id *)&self->_provider, obja);
      -[MNVirtualGarageProvider setVirtualGarageDelegate:](self->_provider, "setVirtualGarageDelegate:", self);
      lastVehicle = self->_lastVehicle;
      self->_lastVehicle = 0;

      if (self->_isStarted)
        -[MNVirtualGarageProvider startVirtualGarageUpdates](self->_provider, "startVirtualGarageUpdates");
      v4 = obja;
    }
  }

}

- (void)setTraceRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_traceRecorder, a3);
}

- (unint64_t)vehiclesCount
{
  return -[MNVirtualGarageProvider vehiclesCount](self->_provider, "vehiclesCount");
}

- (BOOL)assumesFullCharge
{
  return -[MNVirtualGarageProvider assumesFullCharge](self->_provider, "assumesFullCharge");
}

- (BOOL)isProviderStarted
{
  return -[MNVirtualGarageProvider isStarted](self->_provider, "isStarted");
}

- (void)updatedVehicleStateWithHandler:(id)a3
{
  id v4;
  MNVirtualGarageProvider *provider;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  provider = self->_provider;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__MNVirtualGarageManager_updatedVehicleStateWithHandler___block_invoke;
  v7[3] = &unk_1E61D72D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MNVirtualGarageProvider updatedVehicleStateWithHandler:](provider, "updatedVehicleStateWithHandler:", v7);

}

void __57__MNVirtualGarageManager_updatedVehicleStateWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v10, "displayName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = v6;

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v5);

}

- (void)registerObserver:(id)a3
{
  id v4;
  GEOObserverHashTable *observers;
  char v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v7 = v4;
    if (self->_isStarted)
    {
      -[GEOObserverHashTable registerObserver:](observers, "registerObserver:", v4);
LABEL_6:
      v4 = v7;
      goto LABEL_7;
    }
    v6 = -[GEOObserverHashTable hasObservers](observers, "hasObservers");
    -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", v7);
    v4 = v7;
    if ((v6 & 1) == 0)
    {
      -[MNVirtualGarageManager _start](self, "_start");
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", v4);
    v4 = v6;
    if (self->_isStarted)
    {
      v5 = -[GEOObserverHashTable hasObservers](self->_observers, "hasObservers");
      v4 = v6;
      if ((v5 & 1) == 0)
      {
        -[MNVirtualGarageManager _stop](self, "_stop");
        v4 = v6;
      }
    }
  }

}

- (void)_start
{
  VGVehicle *lastVehicle;

  if (!self->_isStarted)
  {
    lastVehicle = self->_lastVehicle;
    self->_lastVehicle = 0;

    -[MNVirtualGarageProvider startVirtualGarageUpdates](self->_provider, "startVirtualGarageUpdates");
    self->_isStarted = 1;
  }
}

- (void)_stop
{
  VGVehicle *lastVehicle;

  if (self->_isStarted)
  {
    -[MNVirtualGarageProvider stopVirtualGarageUpdates](self->_provider, "stopVirtualGarageUpdates");
    self->_isStarted = 0;
    lastVehicle = self->_lastVehicle;
    self->_lastVehicle = 0;

  }
}

- (id)_standardVirtualGarageProvider
{
  return objc_alloc_init(MNVirtualGarageStandardProvider);
}

- (BOOL)_isStandardProvider:(id)a3
{
  id v3;
  char isKindOfClass;

  if (a3)
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

- (void)virtualGarageProvider:(id)a3 didUpdateSelectedVehicle:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MNVirtualGarageManager *v26;
  _QWORD block[5];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MNGetMNVirtualGarageManagerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v20 = objc_msgSend(v5, "displayedBatteryPercentage");
    objc_msgSend(v5, "currentVehicleState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentEVRange");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "measurementByConvertingToUnit:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v8 = v7;
    objc_msgSend(v5, "currentVehicleState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentBatteryCapacity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "measurementByConvertingToUnit:", v10);
    v26 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;
    objc_msgSend(v5, "currentVehicleState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isCharging");
    objc_msgSend(v5, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentVehicleState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v30 = v20;
    v31 = 2048;
    v32 = v8;
    v33 = 2048;
    v34 = v13;
    v35 = 1024;
    v36 = v15;
    v37 = 2112;
    v38 = v16;
    v39 = 2112;
    v40 = v18;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "Vehicle update | Battery: %lu%%, Range: %0.0f m, Charge: %0.0f kWH, isCharging: %d | %@ %@", buf, 0x3Au);

    self = v26;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MNVirtualGarageManager_virtualGarageProvider_didUpdateSelectedVehicle___block_invoke;
  block[3] = &unk_1E61D1D10;
  block[4] = self;
  v28 = v5;
  v19 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__MNVirtualGarageManager_virtualGarageProvider_didUpdateSelectedVehicle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 | v5 && (v6 = objc_msgSend((id)v4, "isEqual:", v5), (id)v5, (id)v4, !v6))
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "currentVehicleState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentVehicleState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v8 | v10)
      v11 = objc_msgSend((id)v8, "isEqual:", v10) ^ 1;
    else
      v11 = 0;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "recordVirtualGarageVehicleState:isDifferentVehicle:", *(_QWORD *)(a1 + 40), v11);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "displayName");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 56);
  *(_QWORD *)(v13 + 56) = v12;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "virtualGarageManager:didUpdateSelectedVehicle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (VGVehicle)lastVehicle
{
  return self->_lastVehicle;
}

- (NSString)lastVehicleName
{
  return self->_lastVehicleName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastVehicleName, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_traceRecorder, 0);
  objc_storeStrong((id *)&self->_lastVehicle, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
