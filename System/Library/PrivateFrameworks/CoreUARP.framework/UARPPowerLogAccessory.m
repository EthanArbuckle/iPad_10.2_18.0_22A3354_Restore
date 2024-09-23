@implementation UARPPowerLogAccessory

- (UARPPowerLogAccessory)initWithModelNumber:(id)a3 uuid:(id)a4 stagingWindowPeriodSeconds:(unsigned int)a5
{
  id v8;
  id v9;
  UARPPowerLogAccessory *v10;
  os_log_t v11;
  OS_os_log *log;
  uint64_t v13;
  NSString *modelNumber;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UARPPowerLogAccessory;
  v10 = -[UARPPowerLogAccessory init](&v18, sel_init);
  if (v10)
  {
    v11 = os_log_create("com.apple.accessoryupdater.uarp", "powerLogAccessory");
    log = v10->_log;
    v10->_log = (OS_os_log *)v11;

    v13 = objc_msgSend(v8, "copy");
    modelNumber = v10->_modelNumber;
    v10->_modelNumber = (NSString *)v13;

    objc_storeStrong((id *)&v10->_uuid, a4);
    v15 = dispatch_queue_create("UARPPowerLogAccessory", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

    v10->_stagingWindowTimerIntervalNS = 1000000000 * a5;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_stagingInProgress)
    -[UARPPowerLogAccessory stagingStopped](self, "stagingStopped");
  v3.receiver = self;
  v3.super_class = (Class)UARPPowerLogAccessory;
  -[UARPPowerLogAccessory dealloc](&v3, sel_dealloc);
}

- (void)setReachableWithActiveFirmwareVersion:(id)a3 stagedFirmwareVersion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__UARPPowerLogAccessory_setReachableWithActiveFirmwareVersion_stagedFirmwareVersion___block_invoke;
  block[3] = &unk_24CEA3E08;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __85__UARPPowerLogAccessory_setReachableWithActiveFirmwareVersion_stagedFirmwareVersion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 80))
  {
    v3 = *(NSObject **)(v2 + 24);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      return;
    v4 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v4;
    v5 = "%@ marked reachable, but already reachable";
    v6 = v3;
    v7 = 12;
  }
  else
  {
    *(_BYTE *)(v2 + 80) = 1;
    UARPPowerLogAccessoryReachable(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 40), *(void **)(a1 + 48));
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      return;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = 138412802;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v5 = "%@ reachable activeFW=%@, stagedFW=%@";
    v6 = v8;
    v7 = 32;
  }
  _os_log_impl(&dword_212D08000, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v12, v7);
}

- (void)setUnreachable
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__UARPPowerLogAccessory_setUnreachable__block_invoke;
  block[3] = &unk_24CEA38E0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __39__UARPPowerLogAccessory_setUnreachable__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 80))
  {
    *(_BYTE *)(v2 + 80) = 0;
    UARPPowerLogAccessoryUnreachable(*(void **)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(a1 + 32), "stagingStopped");
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      return;
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v4;
    v5 = "%@ unreachable";
  }
  else
  {
    v3 = *(NSObject **)(v2 + 24);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      return;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    v5 = "%@ marked unreachable, but already unreachable";
  }
  _os_log_impl(&dword_212D08000, v3, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v7, 0xCu);
}

- (void)setAssetOfferedWithVersion:(id)a3 activeFirmwareVersion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__UARPPowerLogAccessory_setAssetOfferedWithVersion_activeFirmwareVersion___block_invoke;
  block[3] = &unk_24CEA3E08;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __74__UARPPowerLogAccessory_setAssetOfferedWithVersion_activeFirmwareVersion___block_invoke(id *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t)(a1 + 4);
  v1 = a1[4];
  if (*((_BYTE *)v1 + 81))
  {
    v3 = *((_QWORD *)v1 + 3);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __74__UARPPowerLogAccessory_setAssetOfferedWithVersion_activeFirmwareVersion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  else
  {
    UARPPowerLogAssetOffered(*((void **)v1 + 1), a1[5], a1[6]);
    objc_msgSend(a1[4], "startStagingWindowTimer");
    v11 = objc_msgSend(a1[5], "copy");
    v12 = a1[4];
    v13 = (void *)v12[8];
    v12[8] = v11;

    v14 = objc_msgSend(a1[6], "copy");
    v15 = a1[4];
    v16 = (void *)v15[9];
    v15[9] = v14;

    objc_msgSend(a1[4], "resetStagingWindowStartOffset");
    *((_BYTE *)a1[4] + 81) = 1;
    v17 = *((_QWORD *)a1[4] + 3);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = a1[5];
      v18 = a1[6];
      v20 = a1[4];
      v21 = 138412802;
      v22 = v20;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_212D08000, v17, OS_LOG_TYPE_INFO, "%@ asset offered. offeredFW=%@, activeFW=%@", (uint8_t *)&v21, 0x20u);
    }
  }
}

- (void)setStagingCompleteForStagedFirmareVersion:(id)a3 activeFirmareVersion:(id)a4 status:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__UARPPowerLogAccessory_setStagingCompleteForStagedFirmareVersion_activeFirmareVersion_status___block_invoke;
  block[3] = &unk_24CEA3D68;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v16 = a5;
  v11 = v8;
  v12 = v9;
  dispatch_sync(queue, block);

}

void __95__UARPPowerLogAccessory_setStagingCompleteForStagedFirmareVersion_activeFirmareVersion_status___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 32;
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 81))
  {
    UARPPowerLogStagingComplete(*(void **)(v1 + 8), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "stagingStopped");
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      v15 = 138412802;
      v16 = v7;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_212D08000, v4, OS_LOG_TYPE_INFO, "%@ staging complete. stagedFW=%@, activeFW=%@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    v8 = *(NSObject **)(v1 + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __95__UARPPowerLogAccessory_setStagingCompleteForStagedFirmareVersion_activeFirmareVersion_status___block_invoke_cold_1(v2, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)startStagingWindowTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *stagingWindowTimer;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  stagingWindowTimer = self->_stagingWindowTimer;
  self->_stagingWindowTimer = v3;

  objc_initWeak(&location, self);
  v5 = self->_stagingWindowTimer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__UARPPowerLogAccessory_startStagingWindowTimer__block_invoke;
  v7[3] = &unk_24CEA2750;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v5, v7);
  v6 = dispatch_time(0, self->_stagingWindowTimerIntervalNS);
  dispatch_source_set_timer((dispatch_source_t)self->_stagingWindowTimer, v6, self->_stagingWindowTimerIntervalNS, 0x5F5E100uLL);
  dispatch_resume((dispatch_object_t)self->_stagingWindowTimer);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__UARPPowerLogAccessory_startStagingWindowTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stagingWindowTimeFired");

}

- (void)stagingWindowTimeFired
{
  NSObject *log;
  NSString *stagingActiveFirmwareVersion;
  NSString *stagingStagingFirmwareVersion;
  unsigned int stagingWindowStartOffset;
  unsigned int stagingWindowBytesTransferred;
  int v8;
  UARPPowerLogAccessory *v9;
  __int16 v10;
  NSString *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  UARPPowerLogStagingStatus(self->_modelNumber, self->_stagingActiveFirmwareVersion, self->_stagingStagingFirmwareVersion, self->_stagingWindowStartOffset, self->_stagingWindowBytesTransferred);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    stagingActiveFirmwareVersion = self->_stagingActiveFirmwareVersion;
    stagingStagingFirmwareVersion = self->_stagingStagingFirmwareVersion;
    stagingWindowStartOffset = self->_stagingWindowStartOffset;
    stagingWindowBytesTransferred = self->_stagingWindowBytesTransferred;
    v8 = 138413314;
    v9 = self;
    v10 = 2112;
    v11 = stagingActiveFirmwareVersion;
    v12 = 2112;
    v13 = stagingStagingFirmwareVersion;
    v14 = 1024;
    v15 = stagingWindowStartOffset;
    v16 = 1024;
    v17 = stagingWindowBytesTransferred;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%@ staging timer fired. activeFW=%@, stagingFW=%@, off=%u, tx=%u", (uint8_t *)&v8, 0x2Cu);
  }
  self->_stagingWindowStartOffset += self->_stagingWindowBytesTransferred;
  self->_stagingWindowBytesTransferred = 0;
}

- (void)updateStagingProgressWithRequestedOffset:(unsigned int)a3 requestedLength:(unsigned int)a4
{
  NSObject *queue;
  _QWORD v5[5];
  unsigned int v6;
  unsigned int v7;

  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__UARPPowerLogAccessory_updateStagingProgressWithRequestedOffset_requestedLength___block_invoke;
  v5[3] = &unk_24CEA4068;
  v5[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_sync(queue, v5);
}

void __82__UARPPowerLogAccessory_updateStagingProgressWithRequestedOffset_requestedLength___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 81))
  {
    objc_msgSend((id)v2, "setStagingWindowStartOffset:", *(unsigned int *)(a1 + 40));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) += *(_DWORD *)(a1 + 44);
  }
  else
  {
    v4 = *(NSObject **)(v2 + 24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __82__UARPPowerLogAccessory_updateStagingProgressWithRequestedOffset_requestedLength___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)setStagingWindowStartOffset:(unsigned int)a3
{
  if (!self->_stagingWindowStartOffsetInitialUpdateComplete)
  {
    self->_stagingWindowStartOffset = a3;
    self->_stagingWindowStartOffsetInitialUpdateComplete = 1;
  }
}

- (void)resetStagingWindowStartOffset
{
  self->_stagingWindowStartOffset = 0;
  self->_stagingWindowStartOffsetInitialUpdateComplete = 0;
}

- (void)stagingStopped
{
  NSObject *stagingWindowTimer;
  OS_dispatch_source *v4;
  NSString *stagingActiveFirmwareVersion;
  NSString *stagingStagingFirmwareVersion;

  stagingWindowTimer = self->_stagingWindowTimer;
  if (stagingWindowTimer)
  {
    dispatch_source_cancel(stagingWindowTimer);
    v4 = self->_stagingWindowTimer;
    self->_stagingWindowTimer = 0;

  }
  stagingActiveFirmwareVersion = self->_stagingActiveFirmwareVersion;
  self->_stagingActiveFirmwareVersion = 0;

  stagingStagingFirmwareVersion = self->_stagingStagingFirmwareVersion;
  self->_stagingStagingFirmwareVersion = 0;

  self->_stagingInProgress = 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *uuid;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uuid = self->_uuid;
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](uuid, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *modelNumber;
  NSUUID *uuid;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  modelNumber = self->_modelNumber;
  uuid = self->_uuid;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_reachable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_stagingInProgress);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ %@ reachable=%@, staging=%@>"), v5, modelNumber, uuid, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (BOOL)stagingInProgress
{
  return self->_stagingInProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_stagingStagingFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_stagingActiveFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_stagingWindowTimer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
}

void __74__UARPPowerLogAccessory_setAssetOfferedWithVersion_activeFirmwareVersion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "%@: Attemping to start staging when it is already running", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __95__UARPPowerLogAccessory_setStagingCompleteForStagedFirmareVersion_activeFirmareVersion_status___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "%@: Attemping to complete staging when staging was never started", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __82__UARPPowerLogAccessory_updateStagingProgressWithRequestedOffset_requestedLength___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "%@: Attempingt to update staging status when staging is not running", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
