@implementation MNParkedVehicleDetector

- (void)dealloc
{
  objc_super v3;

  -[MNParkedVehicleDetector stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)MNParkedVehicleDetector;
  -[MNParkedVehicleDetector dealloc](&v3, sel_dealloc);
}

- (void)startMonitoring
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD handler[4];
  id v8;
  uint8_t buf[16];
  _QWORD v10[4];
  id v11;
  id location;

  if (!self->_isMonitoring)
  {
    self->_isMonitoring = 1;
    self->_state = 0;
    objc_initWeak(&location, self);
    objc_msgSend(getRTRoutineManagerClass(), "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__MNParkedVehicleDetector_startMonitoring__block_invoke;
    v10[3] = &unk_1E61D85F0;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v3, "startMonitoringVehicleEventsWithHandler:", v10);

    MNGetMNParkedVehicleDetectorLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Started monitoring vehicle events from RTRoutineManager", buf, 2u);
    }

    v6 = MEMORY[0x1E0C80D38];
    _GEOConfigAddDelegateListenerForKey();

    -[MNParkedVehicleDetector _updateVehicleMonitorShouldStart:](self, "_updateVehicleMonitorShouldStart:", 1);
    handler[0] = v4;
    handler[1] = 3221225472;
    handler[2] = __42__MNParkedVehicleDetector_startMonitoring__block_invoke_12;
    handler[3] = &unk_1E61D2F68;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch("com.apple.navd.SimulateParkedVehicleEvent", &self->_simulateParkedVehicleEventToken, MEMORY[0x1E0C80D38], handler);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __42__MNParkedVehicleDetector_startMonitoring__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MNParkedVehicleDetector_startMonitoring__block_invoke_2;
  block[3] = &unk_1E61D85C8;
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v12);

}

void __42__MNParkedVehicleDetector_startMonitoring__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  int v13;
  _BYTE v14[14];
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    MNGetMNParkedVehicleDetectorLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v13 = 138412290;
      *(_QWORD *)v14 = v3;
      _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_ERROR, "Error monitoring vehicle events: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "count"))
      return;
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v2 = objc_claimAutoreleasedReturnValue();
    MNGetMNParkedVehicleDetectorLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "count");
      -[NSObject identifier](v2, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject location](v2, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "latitude");
      v9 = v8;
      -[NSObject location](v2, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "longitude");
      v13 = 67109890;
      *(_DWORD *)v14 = v5;
      *(_WORD *)&v14[4] = 2112;
      *(_QWORD *)&v14[6] = v6;
      v15 = 2048;
      v16 = v9;
      v17 = 2048;
      v18 = v11;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "Vehicle event (%d) received from RTRoutineManager: %@, %f, %f", (uint8_t *)&v13, 0x26u);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_updateForParkedCar");

  }
}

void __42__MNParkedVehicleDetector_startMonitoring__block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  MNGetMNParkedVehicleDetectorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "Simulating parked vehicle event.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateForParkedCar");

}

- (void)stopMonitoring
{
  NSTimer *locationStoppedTimer;
  NSTimer *vehicleDisconnectExpirationTimer;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  if (self->_isMonitoring)
  {
    -[NSTimer invalidate](self->_locationStoppedTimer, "invalidate");
    locationStoppedTimer = self->_locationStoppedTimer;
    self->_locationStoppedTimer = 0;

    -[NSTimer invalidate](self->_vehicleDisconnectExpirationTimer, "invalidate");
    vehicleDisconnectExpirationTimer = self->_vehicleDisconnectExpirationTimer;
    self->_vehicleDisconnectExpirationTimer = 0;

    notify_cancel(self->_simulateParkedVehicleEventToken);
    self->_simulateParkedVehicleEventToken = 0;
    GEOConfigRemoveDelegateListenerForAllKeys();
    -[MNParkedVehicleDetector _updateVehicleMonitorShouldStart:](self, "_updateVehicleMonitorShouldStart:", 0);
    objc_msgSend(getRTRoutineManagerClass(), "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopMonitoringVehicleEvents");

    MNGetMNParkedVehicleDetectorLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "Stopped monitoring vehicle events from RTRoutineManager", v7, 2u);
    }

    self->_isMonitoring = 0;
  }
}

- (void)updateForLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  NSTimer *v9;
  NSTimer *v10;
  NSObject *v11;
  NSTimer *locationStoppedTimer;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "speed");
  v6 = v5;
  GEOConfigGetDouble();
  if (v6 >= v7)
  {
    self->_locationStoppedCondition = 0;
    if (self->_locationStoppedTimer)
    {
      MNGetMNParkedVehicleDetectorLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEBUG, "Resetting stopped location timer.", (uint8_t *)&v20, 2u);
      }

      locationStoppedTimer = self->_locationStoppedTimer;
    }
    else
    {
      locationStoppedTimer = 0;
    }
    -[NSTimer invalidate](locationStoppedTimer, "invalidate");
    v10 = self->_locationStoppedTimer;
    self->_locationStoppedTimer = 0;
  }
  else
  {
    if (self->_locationStoppedTimer)
      goto LABEL_13;
    MNGetMNParkedVehicleDetectorLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEBUG, "Starting stopped location timer.", (uint8_t *)&v20, 2u);
    }

    GEOConfigGetDouble();
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__locationStoppedTimer_, 0, 0);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v10 = self->_locationStoppedTimer;
    self->_locationStoppedTimer = v9;
  }

LABEL_13:
  GEOConfigGetDouble();
  v14 = v13;
  objc_msgSend(v4, "speed");
  if (v15 >= v14)
  {
    if (self->_state == 1)
    {
      MNGetMNParkedVehicleDetectorLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "speed");
        v20 = 134218240;
        v21 = v17;
        v22 = 2048;
        v23 = v14;
        _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_DEFAULT, "Location exceeds speed threshold while in parked state: %0.2f >= %0.2f", (uint8_t *)&v20, 0x16u);
      }

      -[MNParkedVehicleDetector _updateForResumeDriving](self, "_updateForResumeDriving");
    }
    else if (self->_vehicleDisconnectedCondition)
    {
      MNGetMNParkedVehicleDetectorLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "speed");
        v20 = 134218240;
        v21 = v19;
        v22 = 2048;
        v23 = v14;
        _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_DEFAULT, "Vehicle disconnect signal was detected but speed is too fast (%0.2f >= %0.2f) so ignoring signal.", (uint8_t *)&v20, 0x16u);
      }

      -[MNParkedVehicleDetector _expireVehicleDisconnectSignal](self, "_expireVehicleDisconnectSignal");
    }
  }

}

- (void)_locationStoppedTimer:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MNParkedVehicleDetector__locationStoppedTimer___block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __49__MNParkedVehicleDetector__locationStoppedTimer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MNGetMNParkedVehicleDetectorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    GEOConfigGetDouble();
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_INFO, "Detected stopped location for consecutive %g seconds.", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_checkParkingConditions");
}

- (void)_updateForParkedCar
{
  id WeakRetained;

  if (self->_state != 1)
  {
    self->_state = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "parkedVehicleDetectorDidDetectParkedVehicle:", self);

  }
}

- (void)_updateForResumeDriving
{
  id WeakRetained;

  if (self->_state)
  {
    self->_state = 0;
    self->_vehicleDisconnectedCondition = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "parkedVehicleDetectorDidDetectResumeDriving:", self);

  }
}

- (void)_updateVehicleMonitorShouldStart:(BOOL)a3
{
  _BOOL4 v3;
  int BOOL;
  MNVehicleMonitor *v6;
  MNVehicleMonitor *vehicleMonitor;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  MNVehicleMonitor *v11;
  __int16 v12;
  __int16 v13;

  v3 = a3;
  BOOL = GEOConfigGetBOOL();
  if (v3 && BOOL)
  {
    v6 = objc_alloc_init(MNVehicleMonitor);
    vehicleMonitor = self->_vehicleMonitor;
    self->_vehicleMonitor = v6;

    -[MNVehicleMonitor setDelegate:](self->_vehicleMonitor, "setDelegate:", self);
    -[MNVehicleMonitor startMonitoring](self->_vehicleMonitor, "startMonitoring");
    MNGetMNParkedVehicleDetectorLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v9 = "Started monitoring vehicle events from MNVehicleMonitor";
      v10 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else
  {
    -[MNVehicleMonitor setDelegate:](self->_vehicleMonitor, "setDelegate:", 0);
    -[MNVehicleMonitor stopMonitoring](self->_vehicleMonitor, "stopMonitoring");
    v11 = self->_vehicleMonitor;
    self->_vehicleMonitor = 0;

    MNGetMNParkedVehicleDetectorLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v9 = "Stopped monitoring vehicle events from MNVehicleMonitor";
      v10 = (uint8_t *)&v12;
      goto LABEL_7;
    }
  }

}

- (void)_checkParkingConditions
{
  NSObject *v3;
  _BOOL4 vehicleDisconnectedCondition;
  _BOOL4 locationStoppedCondition;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_isMonitoring)
  {
    MNGetMNParkedVehicleDetectorLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      vehicleDisconnectedCondition = self->_vehicleDisconnectedCondition;
      locationStoppedCondition = self->_locationStoppedCondition;
      v7[0] = 67109376;
      v7[1] = vehicleDisconnectedCondition;
      v8 = 1024;
      v9 = locationStoppedCondition;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "vehicleDisconnected: %d, locationStopped: %d", (uint8_t *)v7, 0xEu);
    }

    if (self->_vehicleDisconnectedCondition && self->_locationStoppedCondition)
    {
      MNGetMNParkedVehicleDetectorLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "Triggering parked car event.", (uint8_t *)v7, 2u);
      }

      -[MNParkedVehicleDetector _updateForParkedCar](self, "_updateForParkedCar");
    }
  }
}

- (void)_expireVehicleDisconnectSignal
{
  NSTimer *vehicleDisconnectExpirationTimer;

  self->_vehicleDisconnectedCondition = 0;
  vehicleDisconnectExpirationTimer = self->_vehicleDisconnectExpirationTimer;
  self->_vehicleDisconnectExpirationTimer = 0;

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  unsigned int BOOL;
  uint64_t v6;

  if ((_DWORD)NavigationConfig_Parking_EasyParkingDetection == a3.var0 && off_1EEECA220 == a3.var1)
  {
    BOOL = GEOConfigGetBOOL();
    if (self->_isMonitoring)
      v6 = BOOL;
    else
      v6 = 0;
    -[MNParkedVehicleDetector _updateVehicleMonitorShouldStart:](self, "_updateVehicleMonitorShouldStart:", v6);
  }
}

- (void)vehicleMonitorDidConnectToVehicle:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MNParkedVehicleDetector_vehicleMonitorDidConnectToVehicle___block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __61__MNParkedVehicleDetector_vehicleMonitorDidConnectToVehicle___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateForResumeDriving");
}

- (void)vehicleMonitorDidDisconnectFromVehicle:(id)a3
{
  _QWORD block[5];

  if (GEOConfigGetBOOL())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__MNParkedVehicleDetector_vehicleMonitorDidDisconnectFromVehicle___block_invoke;
    block[3] = &unk_1E61D23C8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __66__MNParkedVehicleDetector_vehicleMonitorDidDisconnectFromVehicle___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10[2];
  id buf[2];

  MNGetMNParkedVehicleDetectorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "Vehicle disconnect received from MNVehicleMonitor.", (uint8_t *)buf, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_checkParkingConditions");
  GEOConfigGetDouble();
  v4 = v3;
  objc_initWeak(buf, *(id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1E0C99E88];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__MNParkedVehicleDetector_vehicleMonitorDidDisconnectFromVehicle___block_invoke_17;
  v9[3] = &unk_1E61D1BE0;
  objc_copyWeak(v10, buf);
  v10[1] = v4;
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, *(double *)&v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 64);
  *(_QWORD *)(v7 + 64) = v6;

  objc_destroyWeak(v10);
  objc_destroyWeak(buf);
}

void __66__MNParkedVehicleDetector_vehicleMonitorDidDisconnectFromVehicle___block_invoke_17(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 72))
  {
    MNGetMNParkedVehicleDetectorLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 134217984;
      v7 = v5;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "Expiring _vehicleDisconnectedCondition because %g seconds has elapsed since the vehicle disconnect.", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(v3, "_expireVehicleDisconnectSignal");
  }

}

- (MNParkedVehicleDetectorDelegate)delegate
{
  return (MNParkedVehicleDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleDisconnectExpirationTimer, 0);
  objc_storeStrong((id *)&self->_locationStoppedTimer, 0);
  objc_storeStrong((id *)&self->_vehicleMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
