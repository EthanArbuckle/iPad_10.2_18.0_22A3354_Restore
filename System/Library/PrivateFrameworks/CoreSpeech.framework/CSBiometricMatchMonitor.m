@implementation CSBiometricMatchMonitor

- (CSBiometricMatchMonitor)init
{
  CSBiometricMatchMonitor *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  BKDevice *biometricDevice;
  NSObject *v12;
  id v14;
  objc_super v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE buf[24];
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CSBiometricMatchMonitor;
  v2 = -[CSEventMonitor init](&v15, sel_init);
  if (v2)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v3 = (void *)getBKDeviceClass_softClass;
    v19 = getBKDeviceClass_softClass;
    if (!getBKDeviceClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getBKDeviceClass_block_invoke;
      v21 = &unk_1E7C287B8;
      v22 = &v16;
      __getBKDeviceClass_block_invoke((uint64_t)buf);
      v3 = (void *)v17[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v16, 8);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v5 = (void *)getBKDeviceManagerClass_softClass;
    v19 = getBKDeviceManagerClass_softClass;
    if (!getBKDeviceManagerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getBKDeviceManagerClass_block_invoke;
      v21 = &unk_1E7C287B8;
      v22 = &v16;
      __getBKDeviceManagerClass_block_invoke((uint64_t)buf);
      v5 = (void *)v17[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v16, 8);
    objc_msgSend(v6, "availableDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v4, "deviceWithDescriptor:error:", v8, &v14);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v14;
    biometricDevice = v2->_biometricDevice;
    v2->_biometricDevice = (BKDevice *)v9;

    if (v10 || !v2->_biometricDevice)
    {
      v12 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[CSBiometricMatchMonitor init]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s Failed to create biometricdevice with error %@", buf, 0x16u);
      }
    }

  }
  return v2;
}

- (void)startObserving
{
  BKDevice *biometricDevice;

  biometricDevice = self->_biometricDevice;
  if (biometricDevice)
    -[BKDevice setDelegate:](biometricDevice, "setDelegate:", self);
}

- (BOOL)getLastBiometricMatchEvent:(BOOL *)a3 atTime:(unint64_t *)a4
{
  BKDevice *biometricDevice;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  _BOOL4 v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  biometricDevice = self->_biometricDevice;
  if (!biometricDevice)
  {
    v15 = *MEMORY[0x1E0D18F60];
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR);
    if (!v14)
      return v14;
    *(_DWORD *)buf = 136315138;
    v19 = "-[CSBiometricMatchMonitor getLastBiometricMatchEvent:atTime:]";
    _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s ERR: Biometric device is nil - Bailing out", buf, 0xCu);
LABEL_15:
    LOBYTE(v14) = 0;
    return v14;
  }
  v17 = 0;
  -[BKDevice lastMatchEventWithError:](biometricDevice, "lastMatchEventWithError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = *MEMORY[0x1E0D18F60];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSBiometricMatchMonitor getLastBiometricMatchEvent:atTime:]";
      v20 = 2112;
      *(_QWORD *)v21 = v8;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s BiometricMatchEvents unavailable with error %@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  if (v10)
  {
    v11 = v9;
    v12 = objc_msgSend(v7, "result");
    v13 = objc_msgSend(v7, "timeStamp");
    *(_DWORD *)buf = 136315650;
    v19 = "-[CSBiometricMatchMonitor getLastBiometricMatchEvent:atTime:]";
    v20 = 1024;
    *(_DWORD *)v21 = v12;
    v21[2] = 2048;
    *(_QWORD *)&v21[3] = v13;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s BiometricMatchEvent: result = %u, timeStamp = %llu", buf, 0x1Cu);

  }
  if (a3)
    *a3 = objc_msgSend(v7, "result");
  if (a4)
    *a4 = objc_msgSend(v7, "timeStamp");

  LOBYTE(v14) = 1;
  return v14;
}

- (void)device:(id)a3 matchEventOccurred:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  CSBiometricMatchMonitorDelegate **p_delegate;
  id WeakRetained;
  char v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v14 = 136315650;
    v15 = "-[CSBiometricMatchMonitor device:matchEventOccurred:]";
    v16 = 1024;
    v17 = objc_msgSend(v7, "result");
    v18 = 2048;
    v19 = objc_msgSend(v7, "timeStamp");
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s BiometricMatchEventOccurred: result = %u, timeStamp = %llu", (uint8_t *)&v14, 0x1Cu);

  }
  if (v7)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v13, "biometricMatchMonitorDidReceiveMatchAttempt:atTime:", objc_msgSend(v7, "result"), objc_msgSend(v7, "timeStamp"));

    }
  }

}

- (unint64_t)getBiometricMatchResultForTriggerTimeStamp:(unint64_t)a3
{
  double v4;
  double v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSBiometricMatchMonitor getBiometricMatchResultForTriggerTimeStamp:]";
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s triggerTimeStamp is nil - Bailing out", buf, 0xCu);
    }
    return 0;
  }
  v14 = 0;
  v13 = 0;
  CSMachAbsoluteTimeToMachContinuousTime();
  if (!-[CSBiometricMatchMonitor getLastBiometricMatchEvent:atTime:](self, "getLastBiometricMatchEvent:atTime:", &v14, &v13))
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSBiometricMatchMonitor getBiometricMatchResultForTriggerTimeStamp:]";
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s No biometric information available", buf, 0xCu);
    }
    return 0;
  }
  CSMachAbsoluteTimeGetTimeInterval();
  v5 = v4;
  v6 = v14;
  v7 = *MEMORY[0x1E0D18F60];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v6 && v5 < 3.0)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSBiometricMatchMonitor getBiometricMatchResultForTriggerTimeStamp:]";
      v17 = 2048;
      v18 = v5;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Biometric match happened in last %f secs", buf, 0x16u);
    }
    return 1;
  }
  else
  {
    if (v8)
    {
      v12 = CFSTR("MATCH");
      v16 = "-[CSBiometricMatchMonitor getBiometricMatchResultForTriggerTimeStamp:]";
      *(_DWORD *)buf = 136315650;
      if (!v6)
        v12 = CFSTR("MIS-MATCH");
      v17 = 2112;
      v18 = *(double *)&v12;
      v19 = 2048;
      v20 = v5;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Biometric match result: %@ happened in last %f secs", buf, 0x20u);
      v6 = v14;
    }
    if (v6)
      return 3;
    else
      return 2;
  }
}

- (CSBiometricMatchMonitorDelegate)delegate
{
  return (CSBiometricMatchMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BKDevice)biometricDevice
{
  return self->_biometricDevice;
}

- (void)setBiometricDevice:(id)a3
{
  objc_storeStrong((id *)&self->_biometricDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)sharedInstance
{
  if ((CSIsHorseman() & 1) != 0 || (objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
    return 0;
  if (sharedInstance_onceToken_1318 != -1)
    dispatch_once(&sharedInstance_onceToken_1318, &__block_literal_global_1319);
  return (id)sharedInstance_biometricMatchMonitor;
}

void __41__CSBiometricMatchMonitor_sharedInstance__block_invoke()
{
  CSBiometricMatchMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSBiometricMatchMonitor);
  v1 = (void *)sharedInstance_biometricMatchMonitor;
  sharedInstance_biometricMatchMonitor = (uint64_t)v0;

}

@end
