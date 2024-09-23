@implementation MNVirtualGarageStandardProvider

- (MNVirtualGarageStandardProvider)init
{
  MNVirtualGarageStandardProvider *v2;
  uint64_t v3;
  geo_isolater *garageIsolater;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNVirtualGarageStandardProvider;
  v2 = -[MNVirtualGarageStandardProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    garageIsolater = v2->_garageIsolater;
    v2->_garageIsolater = (geo_isolater *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_forceUpdateTimer, "invalidate");
  -[MNVirtualGarageStandardProvider stopVirtualGarageUpdates](self, "stopVirtualGarageUpdates");
  v3.receiver = self;
  v3.super_class = (Class)MNVirtualGarageStandardProvider;
  -[MNVirtualGarageStandardProvider dealloc](&v3, sel_dealloc);
}

- (void)startVirtualGarageUpdates
{
  double v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (!self->_isStarted)
  {
    GEOConfigGetDouble();
    self->_forcePeriodicUpdateInterval = v3;
    objc_msgSend(MEMORY[0x1E0DC6BF0], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openForClient:", self);
    objc_msgSend(v4, "registerObserver:", self);
    MNGetMNVirtualGarageManagerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "MNVirtualGarageStandardProvider starting VGVirtualGarage connection.", v6, 2u);
    }

    objc_msgSend(v4, "virtualGarageStartContinuousUpdatesIfNeeded");
    self->_isStarted = 1;
    -[MNVirtualGarageStandardProvider _forceVirtualGarageSyncWithHandler:](self, "_forceVirtualGarageSyncWithHandler:", 0);

  }
}

- (void)stopVirtualGarageUpdates
{
  OS_dispatch_queue *updateQueue;
  NSTimer *forceUpdateTimer;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  if (self->_isStarted)
  {
    updateQueue = self->_updateQueue;
    self->_updateQueue = 0;

    -[NSTimer invalidate](self->_forceUpdateTimer, "invalidate");
    forceUpdateTimer = self->_forceUpdateTimer;
    self->_forceUpdateTimer = 0;

    objc_msgSend(MEMORY[0x1E0DC6BF0], "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterObserver:", self);
    MNGetMNVirtualGarageManagerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "MNVirtualGarageStandardProvider stopping VGVirtualGarage connection.", v7, 2u);
    }

    objc_msgSend(v5, "virtualGarageEndContinuousUpdates");
    objc_msgSend(v5, "closeForClient:", self);
    -[MNVirtualGarageStandardProvider _setVirtualGarage:](self, "_setVirtualGarage:", 0);
    self->_isStarted = 0;

  }
}

- (void)updatedVehicleStateWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC6BF0], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openForClient:", v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__MNVirtualGarageStandardProvider_updatedVehicleStateWithHandler___block_invoke;
    v9[3] = &unk_1E61D8530;
    v10 = v6;
    v11 = v5;
    v12 = v4;
    v7 = v5;
    v8 = v6;
    -[MNVirtualGarageStandardProvider _forceVirtualGarageSyncWithHandler:](self, "_forceVirtualGarageSyncWithHandler:", v9);

  }
}

void __66__MNVirtualGarageStandardProvider_updatedVehicleStateWithHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "closeForClient:", v6);
  (*(void (**)(void))(a1[6] + 16))();

}

- (unint64_t)vehiclesCount
{
  unint64_t vehiclesCount;
  geo_isolater *v5;

  v5 = self->_garageIsolater;
  _geo_isolate_lock_data();
  vehiclesCount = self->_vehiclesCount;
  _geo_isolate_unlock();

  return vehiclesCount;
}

- (BOOL)assumesFullCharge
{
  MNVirtualGarageStandardProvider *v2;
  geo_isolater *v4;

  v2 = self;
  v4 = self->_garageIsolater;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_assumesFullCharge;
  _geo_isolate_unlock();

  return (char)v2;
}

- (void)_setVirtualGarage:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  geo_isolate_sync_data();
  -[MNVirtualGarageStandardProvider _updateCachedPropertiesForGarage:](self, "_updateCachedPropertiesForGarage:", v4);

}

void __53__MNVirtualGarageStandardProvider__setVirtualGarage___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (void)_updateCachedPropertiesForGarage:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

uint64_t __68__MNVirtualGarageStandardProvider__updateCachedPropertiesForGarage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 40), "vehicles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = objc_msgSend(v2, "count");

  result = objc_msgSend(*(id *)(a1 + 40), "shouldAssumeFullCharge");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = result;
  return result;
}

- (id)_selectedVehicle
{
  void *v3;
  geo_isolater *v5;

  v5 = self->_garageIsolater;
  _geo_isolate_lock_data();
  -[VGVirtualGarage selectedVehicle](self->_garage, "selectedVehicle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _geo_isolate_unlock();

  return v3;
}

- (void)_forceVirtualGarageSyncWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC6BF0], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__MNVirtualGarageStandardProvider__forceVirtualGarageSyncWithHandler___block_invoke;
  v8[3] = &unk_1E61D8580;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v7, "virtualGarageGetGarageWithReply:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __70__MNVirtualGarageStandardProvider__forceVirtualGarageSyncWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateCachedPropertiesForGarage:", v5);

  if (v6
    || (objc_msgSend(v5, "selectedVehicle"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    objc_msgSend(v5, "selectedVehicle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isPureElectricVehicle") & 1) != 0)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v5, "selectedVehicle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__MNVirtualGarageStandardProvider__forceVirtualGarageSyncWithHandler___block_invoke_2;
      v15[3] = &unk_1E61D8558;
      v16 = *(id *)(a1 + 40);
      objc_msgSend(v11, "virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:", v13, 0, v15);

    }
    else
    {
      v14 = *(_QWORD *)(a1 + 40);
      if (v14)
        (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v10, 0);
    }

  }
}

uint64_t __70__MNVirtualGarageStandardProvider__forceVirtualGarageSyncWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_sendVirtualGarageUpdateForSelectedVehicle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__MNVirtualGarageStandardProvider__sendVirtualGarageUpdateForSelectedVehicle___block_invoke;
  v6[3] = &unk_1E61D1D10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __78__MNVirtualGarageStandardProvider__sendVirtualGarageUpdateForSelectedVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  uint64_t v5;
  void *v6;
  double *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v4, "virtualGarageProvider:didUpdateSelectedVehicle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = 0;

  v7 = *(double **)(a1 + 32);
  if (v7[4] > 0.0)
  {
    objc_initWeak(&location, v7);
    v8 = (void *)MEMORY[0x1E0C99E88];
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(double *)(v9 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__MNVirtualGarageStandardProvider__sendVirtualGarageUpdateForSelectedVehicle___block_invoke_2;
    v14[3] = &unk_1E61D82F8;
    v14[4] = v9;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, v14, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __78__MNVirtualGarageStandardProvider__sendVirtualGarageUpdateForSelectedVehicle___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MNGetMNVirtualGarageManagerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEBUG, "MNVirtualGarageStandardProvider forcing VirtualGarage periodic update after %0.0f seconds.", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_forceVirtualGarageSyncWithHandler:", 0);

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "selectedVehicle");
  v5 = objc_claimAutoreleasedReturnValue();
  -[MNVirtualGarageStandardProvider _selectedVehicle](self, "_selectedVehicle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!(v6 | v5))
    goto LABEL_9;
  objc_msgSend((id)v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend((id)v5, "currentVehicleState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "currentVehicleState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isSignificantlyDifferentFromVehicleState:", v10);

  if ((v11 & 1) != 0)
  {
LABEL_8:
    -[MNVirtualGarageStandardProvider _setVirtualGarage:](self, "_setVirtualGarage:", v4);
    objc_msgSend(v4, "selectedVehicle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNVirtualGarageStandardProvider _sendVirtualGarageUpdateForSelectedVehicle:](self, "_sendVirtualGarageUpdateForSelectedVehicle:", v15);

    goto LABEL_9;
  }
  MNGetMNVirtualGarageManagerLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)v5, "currentVehicleState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "currentVehicleState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v13;
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_INFO, "MNVirtualGarageStandardProvider received an update to the selected vehicle that was not significantly different from the previous one. Will ignore this update. newSelectedVehicle.state: %@\n currentVehicle.state: %@", (uint8_t *)&v16, 0x16u);

  }
LABEL_9:

}

- (MNVirtualGarageProviderDelegate)virtualGarageDelegate
{
  return (MNVirtualGarageProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setVirtualGarageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_garageIsolater, 0);
  objc_storeStrong((id *)&self->_garage, 0);
  objc_storeStrong((id *)&self->_forceUpdateTimer, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
