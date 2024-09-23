@implementation MNEVChargingStateMonitor

- (MNEVChargingStateMonitor)initWithTargetBatteryCharge:(id)a3
{
  id v5;
  MNEVChargingStateMonitor *v6;
  MNEVChargingStateMonitor *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  MNEVChargingStateMonitor *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MNEVChargingStateMonitor;
  v6 = -[MNEVChargingStateMonitor init](&v18, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  objc_storeStrong((id *)&v6->_targetBatteryCharge, a3);
  v7->_shouldShowChargingInfo = 0;
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "measurementByConvertingToUnit:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    *(_DWORD *)buf = 67109120;
    v20 = (int)(v11 * 1000.0);
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "Monitoring battery charge updates. Target battery charge: %d Wh", buf, 8u);

  }
  +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerObserver:", v7);
  objc_msgSend(v12, "lastVehicle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v12, "lastVehicle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNEVChargingStateMonitor _updateForVehicle:forceDelegateCallback:](v7, "_updateForVehicle:forceDelegateCallback:", v14, 1);

LABEL_6:
    v15 = v7;
    goto LABEL_10;
  }
  GEOFindOrCreateLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "Failed to get selected vehicle.", buf, 2u);
  }

  v15 = 0;
LABEL_10:

  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  -[NSTimer invalidate](self->_timer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)MNEVChargingStateMonitor;
  -[MNEVChargingStateMonitor dealloc](&v4, sel_dealloc);
}

- (void)updateForLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  uint8_t v14[16];

  v4 = a3;
  if (!self->_shouldShowChargingInfo)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_arrivalDate);
    v7 = v6;
    GEOConfigGetDouble();
    v9 = v8;

    if (v7 > v9)
    {
      objc_msgSend(v4, "speed");
      v11 = v10;
      GEOConfigGetDouble();
      if (v11 <= v12)
      {
        GEOFindOrCreateLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEFAULT, "Notifying should show charging info because user stopped near charging station waypoint.", v14, 2u);
        }

        -[MNEVChargingStateMonitor _notifyShouldShowChargingInfo](self, "_notifyShouldShowChargingInfo");
      }
    }
  }

}

- (void)_startTimer
{
  NSDate *v3;
  NSDate *arrivalDate;
  void *v5;
  void *v6;
  void *v7;
  NSTimer *v8;
  NSTimer *timer;
  _QWORD v10[4];
  id v11[2];
  id location;

  if (!self->_timer)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    arrivalDate = self->_arrivalDate;
    self->_arrivalDate = v3;

    GEOConfigGetDouble();
    v6 = v5;
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0C99E88];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__MNEVChargingStateMonitor__startTimer__block_invoke;
    v10[3] = &unk_1E61D1BE0;
    v11[1] = v6;
    objc_copyWeak(v11, &location);
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, *(double *)&v6);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timer = self->_timer;
    self->_timer = v8;

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __39__MNEVChargingStateMonitor__startTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "Notifying should show charging info because max timer fired after %g seconds.", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyShouldShowChargingInfo");

}

- (void)_notifyShouldShowChargingInfo
{
  id v3;

  if (!self->_shouldShowChargingInfo)
  {
    self->_shouldShowChargingInfo = 1;
    -[NSTimer invalidate](self->_timer, "invalidate");
    -[MNEVChargingStateMonitor delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "evChargingStateMonitorShouldShowChargingInfo:", self);

  }
}

- (void)virtualGarageManager:(id)a3 didUpdateSelectedVehicle:(id)a4
{
  -[MNEVChargingStateMonitor _updateForVehicle:forceDelegateCallback:](self, "_updateForVehicle:forceDelegateCallback:", a4, 0);
}

- (void)_updateForVehicle:(id)a3 forceDelegateCallback:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MNEVChargingStateMonitor *v10;
  BOOL v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MNEVChargingStateMonitor__updateForVehicle_forceDelegateCallback___block_invoke;
  v8[3] = &unk_1E61D1C08;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  MNRunAsynchronouslyOnMainThread(v8);

}

void __68__MNEVChargingStateMonitor__updateForVehicle_forceDelegateCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  NSObject *v19;
  int v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentVehicleState");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_msgSend(*(id *)(a1 + 32), "isPureElectricVehicle");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentVehicleState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isCharging");

      if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16) != (_DWORD)v6)
      {
        GEOFindOrCreateLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 67109120;
          v21 = v6;
          _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "VirtualGarage did change charging state: %d", (uint8_t *)&v20, 8u);
        }

        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 16) = v6;
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "evChargingStateMonitor:didChangeChargingState:", *(_QWORD *)(a1 + 40), v6);

      }
      objc_msgSend(*(id *)(a1 + 32), "currentVehicleState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentBatteryCapacity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isGreaterThanOrEqualToMeasurement:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));

      if (v11)
      {
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "currentVehicleState");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "currentBatteryCapacity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "measurementByConvertingToUnit:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          v20 = 67109120;
          v21 = (int)(v17 * 1000.0);
          _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_DEFAULT, "Target battery charge reached. Current battery: %d Wh", (uint8_t *)&v20, 8u);

        }
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "evChargingStateMonitor:didReachTargetBatteryCharge:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));

      }
      if ((_DWORD)v6 && (*(_BYTE *)(a1 + 48) || !*(_BYTE *)(*(_QWORD *)(a1 + 40) + 17)))
      {
        GEOFindOrCreateLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_DEFAULT, "Notify should show charging info because charging state set to true", (uint8_t *)&v20, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "_notifyShouldShowChargingInfo");
      }
    }
  }
}

- (NSMeasurement)targetBatteryCharge
{
  return self->_targetBatteryCharge;
}

- (MNEVChargingStateMonitorDelegate)delegate
{
  return (MNEVChargingStateMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetBatteryCharge, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
