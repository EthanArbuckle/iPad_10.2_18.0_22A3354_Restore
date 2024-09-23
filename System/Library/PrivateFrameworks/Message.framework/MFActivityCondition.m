@implementation MFActivityCondition

+ (MFActivityCondition)alwaysSatisfiedCondition
{
  return (MFActivityCondition *)objc_alloc_init(_MFSatisfiedActivityCondition);
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_cancellationToken, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MFActivityCondition;
  -[MFActivityCondition dealloc](&v3, sel_dealloc);
}

- (MFActivityCondition)init
{
  return -[MFActivityCondition initWithBuilder:](self, "initWithBuilder:", &__block_literal_global_21);
}

- (MFActivityCondition)initWithBuilder:(id)a3
{
  void (**v5)(id, MFActivityCondition *);
  MFActivityCondition *v6;
  MFActivityCondition *v7;
  uint64_t v8;
  EFScheduler *scheduler;
  EFCancelationToken *v10;
  EFCancelationToken *cancellationToken;
  EFCancelationToken *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v5 = (void (**)(id, MFActivityCondition *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFActivityCondition.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v20.receiver = self;
  v20.super_class = (Class)MFActivityCondition;
  v6 = -[MFActivityCondition init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_requireLowPowerModeDisabled = 1;
    v6->_maxThermalPressureLevel = 3;
    v5[2](v5, v6);
    if (-[MFActivityCondition _isValidConfiguration](v7, "_isValidConfiguration"))
    {
      objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mail.MFActivityCondition"), 17);
      v8 = objc_claimAutoreleasedReturnValue();
      scheduler = v7->_scheduler;
      v7->_scheduler = (EFScheduler *)v8;

      v10 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
      cancellationToken = v7->_cancellationToken;
      v7->_cancellationToken = v10;

      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v7);
      v12 = v7->_cancellationToken;
      -[MFActivityCondition conditionsObservable](v7, "conditionsObservable");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __39__MFActivityCondition_initWithBuilder___block_invoke;
      v17[3] = &unk_1E4E8B6E0;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v13, "subscribeWithResultBlock:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EFCancelationToken addCancelable:](v12, "addCancelable:", v14);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

void __39__MFActivityCondition_initWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSatisfied:", objc_msgSend(v4, "BOOLValue"));

}

- (BOOL)isSatisfied
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -86;
  -[MFActivityCondition scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__MFActivityCondition_isSatisfied__block_invoke;
  v5[3] = &unk_1E4E8B708;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performSyncBlock:", v5);

  LOBYTE(v3) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

uint64_t __34__MFActivityCondition_isSatisfied__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 12);
  return result;
}

- (EFObservable)conditionsObservable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id location;
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowPowerModeObservable");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluggedInObservable");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "batteryLevelObservable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wifiObservable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFLockStateMonitor sharedInstance](MFLockStateMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lockStateObservable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mf_thermalStateObservable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0D1EF28];
  v24[0] = v19;
  v24[1] = v8;
  v24[2] = v6;
  v24[3] = v20;
  v24[4] = v10;
  v24[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "combineLatest:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __43__MFActivityCondition_conditionsObservable__block_invoke;
  v21[3] = &unk_1E4E8B730;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v13, "map:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "distinctUntilChanged");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doOnError:", &__block_literal_global_73);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "observeOn:", self->_scheduler);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return (EFObservable *)v17;
}

uint64_t __43__MFActivityCondition_conditionsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  float v16;
  float v17;
  NSObject *v18;
  float v19;
  float v20;
  int v21;
  uint64_t v22;
  _DWORD v24[2];
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  MFLogGeneral();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v24[0] = 67110400;
    v24[1] = v6;
    v25 = 1024;
    v26 = v8;
    v27 = 1024;
    v28 = v10;
    v29 = 1024;
    v30 = v12;
    v31 = 2048;
    v32 = v14;
    v33 = 2048;
    v34 = v17;
    _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "lpm:%d locked:%d wifi:%d onpower:%d thermals:%lu battery:%.2f", (uint8_t *)v24, 0x2Eu);
  }

  if ((objc_msgSend(WeakRetained, "requireExternalPower") ^ 1 | v12) == 1
    && ((objc_msgSend(WeakRetained, "minBatteryLevel"), v19 <= 0.0)
     || (objc_msgSend(WeakRetained, "minBatteryLevel"), v17 >= v20))
    && (objc_msgSend(WeakRetained, "requireLowPowerModeDisabled") & v6 & 1) == 0
    && (objc_msgSend(WeakRetained, "requireWiFi") ^ 1 | v10) == 1)
  {
    v21 = objc_msgSend(WeakRetained, "requireScreenLocked") ^ 1 | v8;
    v22 = MEMORY[0x1E0C9AAA0];
    if (v21 == 1 && v14 <= objc_msgSend(WeakRetained, "maxThermalPressureLevel"))
      v22 = MEMORY[0x1E0C9AAB0];
  }
  else
  {
    v22 = MEMORY[0x1E0C9AAA0];
  }

  return v22;
}

void __43__MFActivityCondition_conditionsObservable__block_invoke_71(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __43__MFActivityCondition_conditionsObservable__block_invoke_71_cold_1(v4, v5, v3);
  }

}

- (BOOL)_isValidConfiguration
{
  float v3;
  float v4;
  NSObject *v5;
  float v6;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[MFActivityCondition minBatteryLevel](self, "minBatteryLevel");
  if (v3 >= 0.0)
  {
    -[MFActivityCondition minBatteryLevel](self, "minBatteryLevel");
    if (v4 <= 1.0)
      return 1;
  }
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MFActivityCondition minBatteryLevel](self, "minBatteryLevel");
    v8 = 134217984;
    v9 = v6;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "invalid battery-level value (%f)", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (BOOL)requireExternalPower
{
  return self->_requireExternalPower;
}

- (void)setRequireExternalPower:(BOOL)a3
{
  self->_requireExternalPower = a3;
}

- (BOOL)requireWiFi
{
  return self->_requireWiFi;
}

- (void)setRequireWiFi:(BOOL)a3
{
  self->_requireWiFi = a3;
}

- (BOOL)requireScreenLocked
{
  return self->_requireScreenLocked;
}

- (void)setRequireScreenLocked:(BOOL)a3
{
  self->_requireScreenLocked = a3;
}

- (float)minBatteryLevel
{
  return self->_minBatteryLevel;
}

- (void)setMinBatteryLevel:(float)a3
{
  self->_minBatteryLevel = a3;
}

- (BOOL)requireLowPowerModeDisabled
{
  return self->_requireLowPowerModeDisabled;
}

- (void)setRequireLowPowerModeDisabled:(BOOL)a3
{
  self->_requireLowPowerModeDisabled = a3;
}

- (int64_t)maxThermalPressureLevel
{
  return self->_maxThermalPressureLevel;
}

- (void)setMaxThermalPressureLevel:(int64_t)a3
{
  self->_maxThermalPressureLevel = a3;
}

- (void)setSatisfied:(BOOL)a3
{
  self->_satisfied = a3;
}

- (EFCancelationToken)cancellationToken
{
  return self->_cancellationToken;
}

- (void)setCancellationToken:(id)a3
{
  objc_storeStrong((id *)&self->_cancellationToken, a3);
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_cancellationToken, 0);
}

void __43__MFActivityCondition_conditionsObservable__block_invoke_71_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "error occurred while observing conditions: %{public}@", buf, 0xCu);

}

@end
