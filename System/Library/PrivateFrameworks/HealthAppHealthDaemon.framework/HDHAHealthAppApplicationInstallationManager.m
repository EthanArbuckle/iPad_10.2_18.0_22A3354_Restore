@implementation HDHAHealthAppApplicationInstallationManager

- (HDHAHealthAppApplicationInstallationManager)initWithProfile:(id)a3
{
  id v4;
  HDHAHealthAppApplicationInstallationManager *v5;
  HDHAHealthAppApplicationInstallationManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDHAHealthAppApplicationInstallationManager;
  v5 = -[HDHAHealthAppApplicationInstallationManager init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialUtilityDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerDaemonReadyObserver:queue:", v6, v6->_queue);

    v11 = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(v11, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "profileManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addProfileManagerObserver:queue:", v6, v6->_queue);

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "nanoSyncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HDHAHealthAppApplicationInstallationManager;
  -[HDHAHealthAppApplicationInstallationManager dealloc](&v5, sel_dealloc);
}

- (void)daemonReady:(id)a3
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "nanoSyncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  v7 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v7, "nanoSyncManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pairedDevicesSnapshot");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HDHAHealthAppApplicationInstallationManager _queue_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:](self, "_queue_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:", v9);
  -[HDHAHealthAppApplicationInstallationManager _queue_installHealthAppIfTinkerProfileExists](self, "_queue_installHealthAppIfTinkerProfileExists");

}

- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4
{
  -[HDHAHealthAppApplicationInstallationManager _requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:](self, "_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:", a4);
}

- (void)_queue_installHealthAppIfTinkerProfileExists
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint8_t buf[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allProfileIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v12 = objc_loadWeakRetained((id *)p_profile);
        objc_msgSend(v12, "daemon");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "profileManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "profileForIdentifier:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "profileType") == 3)
        {
          objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "healthAppNotInstalled");

          if (v17)
          {
            _HKInitializeLogging();
            v18 = *MEMORY[0x24BDD2FE8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_23DB70000, v18, OS_LOG_TYPE_DEFAULT, "Tinker profile detected and Health App is not installed, requesting installation.", buf, 2u);
            }
            -[HDHAHealthAppApplicationInstallationManager _queue_startInstalling](self, "_queue_startInstalling");
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

}

- (void)_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__HDHAHealthAppApplicationInstallationManager__requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot___block_invoke;
  block[3] = &unk_250E7E440;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __107__HDHAHealthAppApplicationInstallationManager__requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:", *(_QWORD *)(a1 + 32));

}

- (void)_queue_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;
  uint8_t buf[16];

  if (!self->_installationRequestInProgress)
  {
    objc_msgSend(a3, "allDeviceInfos");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "healthAppNotInstalled");

    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD2FE8];
    v9 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT);
    if (v5 && v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, "Device paired and Health is not installed, requesting installation.", buf, 2u);
      }
      -[HDHAHealthAppApplicationInstallationManager _queue_startInstalling](self, "_queue_startInstalling");
      goto LABEL_13;
    }
    if (v5)
    {
      if (v9)
      {
        v13 = 0;
        v10 = "Devices paired and Health is already installed, nothing to do.";
        v11 = (uint8_t *)&v13;
LABEL_12:
        _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else if (v9)
    {
      v12 = 0;
      v10 = "No devices paired, nothing to do.";
      v11 = (uint8_t *)&v12;
      goto LABEL_12;
    }
LABEL_13:

  }
}

- (void)_queue_startInstalling
{
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id buf[2];

  self->_installationRequestInProgress = 1;
  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD2FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23DB70000, v3, OS_LOG_TYPE_DEFAULT, "Starting install request for Health app", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  v4 = objc_alloc(MEMORY[0x24BE045F8]);
  v5 = (void *)objc_msgSend(v4, "initWithBundleID:", *MEMORY[0x24BDD4608]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__HDHAHealthAppApplicationInstallationManager__queue_startInstalling__block_invoke;
  v6[3] = &unk_250E7E190;
  objc_copyWeak(&v7, buf);
  objc_msgSend(v5, "startWithErrorHandler:", v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(buf);
}

void __69__HDHAHealthAppApplicationInstallationManager__queue_startInstalling__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  id WeakRetained;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD2FE8];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v10 = 138412290;
      v11 = v3;
      v6 = "Error for request to install Health app: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_23DB70000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    v6 = "Request to install Health app succeeded";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanupInstallRequest");

}

- (void)_cleanupInstallRequest
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__HDHAHealthAppApplicationInstallationManager__cleanupInstallRequest__block_invoke;
  v4[3] = &unk_250E7E100;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __69__HDHAHealthAppApplicationInstallationManager__cleanupInstallRequest__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_cleanupInstallRequest");

}

- (void)_queue_cleanupInstallRequest
{
  ASDSystemAppRequest *systemAppRequest;

  systemAppRequest = self->_systemAppRequest;
  self->_systemAppRequest = 0;

  self->_installationRequestInProgress = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemAppRequest, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
