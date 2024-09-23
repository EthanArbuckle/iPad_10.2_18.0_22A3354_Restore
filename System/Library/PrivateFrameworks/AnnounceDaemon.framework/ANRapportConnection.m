@implementation ANRapportConnection

- (ANRapportConnection)init
{
  ANRapportConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *rapportQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *clientQueue;
  uint64_t v8;
  NSMutableDictionary *clients;
  NSArray *activeDevices;
  uint64_t v11;
  NSMapTable *deviceDelegatesToQueues;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  NSDate *lastScanStartTimestamp;
  OS_dispatch_source *timer;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ANRapportConnection;
  v2 = -[ANRapportConnection init](&v21, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.announce.RapportMessageQueue", v3);
    rapportQueue = v2->_rapportQueue;
    v2->_rapportQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.announce.RapportClientQueue", v3);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v8;

    activeDevices = v2->_activeDevices;
    v2->_activeDevices = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 517, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    deviceDelegatesToQueues = v2->_deviceDelegatesToQueues;
    v2->_deviceDelegatesToQueues = (NSMapTable *)v11;

    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberForDefault:", *MEMORY[0x1E0CF7BB8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v16);
    v17 = objc_claimAutoreleasedReturnValue();
    lastScanStartTimestamp = v2->_lastScanStartTimestamp;
    v2->_lastScanStartTimestamp = (NSDate *)v17;

    timer = v2->_timer;
    v2->_timer = 0;

    v2->_isTimerSuspended = 0;
  }
  return v2;
}

+ (id)sharedConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ANRapportConnection_sharedConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, block);
  return (id)sharedConnection_shared;
}

void __39__ANRapportConnection_sharedConnection__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedConnection_shared;
  sharedConnection_shared = v0;

}

- (RPCompanionLinkDevice)localDevice
{
  void *v2;
  void *v3;

  -[ANRapportConnection companionLinkClient](self, "companionLinkClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RPCompanionLinkDevice *)v3;
}

- (NSArray)devices
{
  void *v2;
  void *v3;

  -[ANRapportConnection activeDevices](self, "activeDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)activateLinkWithOptions:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  __int128 *p_buf;
  uint8_t v14[4];
  const __CFString *v15;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  ANLogHandleRapportConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@Activate Rapport link started.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__ANRapportConnection_activateLinkWithOptions___block_invoke;
  v11[3] = &unk_1E938FC70;
  p_buf = &buf;
  v7 = v6;
  v12 = v7;
  -[ANRapportConnection activateLinkWithOptions:completion:](self, "activateLinkWithOptions:completion:", a3, v11);
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  ANLogHandleRapportConnection();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v14 = 138412290;
    v15 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@Activate Rapport link finished.", v14, 0xCu);
  }

  v9 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v9;
}

void __47__ANRapportConnection_activateLinkWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ANLogHandleRapportConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = &stru_1E93913D0;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_ERROR, "%@Activate Rapport link failed with error: %@.", (uint8_t *)&v8, 0x16u);
    }

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)activateLinkWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[ANRapportConnection clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke;
  block[3] = &unk_1E9390668;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  double v4;
  double v5;
  NSObject *v6;
  dispatch_block_t v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(a1 + 48) & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsTimerSuspended:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_cancelTimer");
  }
  objc_msgSend(*(id *)(a1 + 32), "companionLinkClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      ANLogHandleRapportConnection();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v12, OS_LOG_TYPE_DEFAULT, "%@### Forcing Link Active", buf, 0xCu);
      }

    }
    else if ((objc_msgSend(*(id *)(a1 + 32), "_needsScan") & 1) == 0)
    {
      ANLogHandleRapportConnection();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%@### No scan needed.", buf, 0xCu);
      }

      goto LABEL_16;
    }
    ANLogHandleRapportConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@### Will activate link", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastScanStartTimestamp:", v14);

    v15 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_18;
    v26[3] = &unk_1E938F938;
    v27 = *(id *)(a1 + 40);
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_19;
    v22[3] = &unk_1E9390640;
    v23 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v26);
    v16 = *(void **)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    v24 = v17;
    v25 = v18;
    v19 = v23;
    objc_msgSend(v16, "_setupLink:", v22);

    v10 = v27;
    goto LABEL_23;
  }
  ANLogHandleRapportConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@### Rapport Link Already Active", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_startTimer");
  objc_msgSend(*(id *)(a1 + 32), "_remainingScanTimeInterval");
  if (v4 <= 0.0 || (*(_BYTE *)(a1 + 48) & 2) == 0)
  {
LABEL_16:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  v5 = v4;
  ANLogHandleRapportConnection();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = &stru_1E93913D0;
    v30 = 2048;
    v31 = v5;
    _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "%@### Waiting %fl seconds for scan to complete", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_20;
  block[3] = &unk_1E938F938;
  v21 = *(id *)(a1 + 40);
  v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v8 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_get_global_queue(2, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v8, v9, v7);

  v10 = v21;
LABEL_23:

}

uint64_t __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ANLogHandleRapportConnection();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@### Calling activation handler post-scan", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  void *v10;
  void *v11;
  double v12;
  double v13;
  dispatch_time_t v14;
  NSObject *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ANLogHandleRapportConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = &stru_1E93913D0;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_ERROR, "%@Activate Rapport link failed with error: %@.", (uint8_t *)&v16, 0x16u);
    }

    v6 = *(void **)(a1 + 32);
    if (dispatch_block_testcancel(v6))
    {
      ANLogHandleRapportConnection();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@### Activation handler already called. Skipping.", (uint8_t *)&v16, 0xCu);
      }

      goto LABEL_18;
    }
    dispatch_block_cancel(v6);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_16:
    v9();
    goto LABEL_18;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@Rapport Link Activated", (uint8_t *)&v16, 0xCu);
  }

  if ((*(_BYTE *)(a1 + 48) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberForDefault:", *MEMORY[0x1E0CF7BC0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    dispatch_get_global_queue(2, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v14, v15, *(dispatch_block_t *)(a1 + 32));

    goto LABEL_18;
  }
  if (!dispatch_block_testcancel(*(dispatch_block_t *)(a1 + 32)))
  {
    ANLogHandleRapportConnection();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@### Calling activation handler immediately", (uint8_t *)&v16, 0xCu);
    }

    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_16;
  }
LABEL_18:

}

uint64_t __58__ANRapportConnection_activateLinkWithOptions_completion___block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ANLogHandleRapportConnection();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@### Calling activation handler post-scan", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deactivateLinkWithOptions:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[ANRapportConnection clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__ANRapportConnection_deactivateLinkWithOptions___block_invoke;
  v6[3] = &unk_1E9390690;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __49__ANRapportConnection_deactivateLinkWithOptions___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 40);
  if ((v2 & 2) != 0)
  {
    objc_msgSend(*(id *)(result + 32), "setIsTimerSuspended:", 0);
    result = objc_msgSend(*(id *)(v1 + 32), "_startTimer");
    v2 = *(_QWORD *)(v1 + 40);
  }
  if ((v2 & 1) != 0)
    return objc_msgSend(*(id *)(v1 + 32), "_tearDownLink");
  return result;
}

- (void)addDeviceDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ANRapportConnection clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__ANRapportConnection_addDeviceDelegate_queue___block_invoke;
  v11[3] = &unk_1E938FCC0;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __47__ANRapportConnection_addDeviceDelegate_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(WeakRetained, "deviceDelegatesToQueues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(WeakRetained, "devices");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          block[0] = v10;
          block[1] = 3221225472;
          block[2] = __47__ANRapportConnection_addDeviceDelegate_queue___block_invoke_2;
          block[3] = &unk_1E938F668;
          v15 = *(id *)(a1 + 40);
          v16 = WeakRetained;
          v17 = v12;
          dispatch_async(v5, block);

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

  }
}

uint64_t __47__ANRapportConnection_addDeviceDelegate_queue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connection:didFindDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)sendMessage:(id)a3 device:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  ANRapportConnection *v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke;
  v14[3] = &unk_1E9390708;
  objc_copyWeak(&v18, &location);
  v11 = v8;
  v15 = v11;
  v16 = self;
  v12 = v10;
  v17 = v12;
  -[ANRapportConnection _linkForDevice:handler:](self, "_linkForDevice:handler:", v9, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return 0;
}

void __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  int8x16_t v15;
  int8x16_t v16;
  _QWORD v17[4];
  int8x16_t v18;
  id v19;
  id v20;
  _QWORD block[4];
  int8x16_t v22;
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForDefault:", *MEMORY[0x1E0CF7B68]);

  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_simulateDeliveryFailureForMessage:", *(_QWORD *)(a1 + 32));

  }
  else if (v5)
  {
    v10 = objc_loadWeakRetained((id *)(a1 + 56));
    v11 = *(_QWORD *)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_3;
    v17[3] = &unk_1E93906E0;
    v19 = *(id *)(a1 + 48);
    objc_copyWeak(&v20, (id *)(a1 + 56));
    v15 = *(int8x16_t *)(a1 + 32);
    v12 = (id)v15.i64[0];
    v18 = vextq_s8(v15, v15, 8uLL);
    objc_msgSend(v10, "_sendMessage:linkClient:handler:", v11, v5, v17);

    objc_destroyWeak(&v20);
  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_2;
    block[3] = &unk_1E93906B8;
    objc_copyWeak(&v24, (id *)(a1 + 56));
    v16 = *(int8x16_t *)(a1 + 32);
    v14 = (id)v16.i64[0];
    v22 = vextq_s8(v16, v16, 8uLL);
    v23 = v6;
    dispatch_async(v13, block);

    objc_destroyWeak(&v24);
  }

}

void __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:failedDeliveryForMessage:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  if (v6)
  {
    dispatch_get_global_queue(25, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_4;
    v10[3] = &unk_1E93906B8;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    v12 = v6;
    dispatch_async(v8, v10);

    objc_destroyWeak(&v13);
  }

}

void __58__ANRapportConnection_sendMessage_device_responseHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:failedDeliveryForMessage:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)sendDailyRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__ANRapportConnection_sendDailyRequest_handler___block_invoke;
  v9[3] = &unk_1E9390730;
  v8 = v7;
  v10 = v8;
  objc_copyWeak(&v11, &location);
  -[ANRapportConnection _linkForDevice:handler:](self, "_linkForDevice:handler:", v6, v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __48__ANRapportConnection_sendDailyRequest_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_sendDailyRequest:handler:", v3, *(_QWORD *)(a1 + 32));

  }
  else
  {
    ANLogHandleRapportConnection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily failed to get link client to send daily request.", (uint8_t *)&v6, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)registerDailyRequest:(id)a3
{
  id v4;
  RPCompanionLinkClient *companionLinkClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  companionLinkClient = self->_companionLinkClient;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ANRapportConnection_registerDailyRequest___block_invoke;
  v7[3] = &unk_1E9390758;
  v8 = v4;
  v6 = v4;
  -[RPCompanionLinkClient registerRequestID:options:handler:](companionLinkClient, "registerRequestID:options:handler:", CFSTR("com.apple.announce.dailyanalytics"), 0, v7);

}

void __44__ANRapportConnection_registerDailyRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D839C8];
  v7 = a4;
  objc_msgSend(a3, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ANLogHandleRapportConnection();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = &stru_1E93913D0;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Received Daily Request from %@", (uint8_t *)&v11, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v10, 0, 0);

}

- (void)sendHomeLocationStatusRequestToDevice:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ANRapportConnection_sendHomeLocationStatusRequestToDevice_handler___block_invoke;
  v9[3] = &unk_1E9390730;
  v8 = v7;
  v10 = v8;
  objc_copyWeak(&v11, &location);
  -[ANRapportConnection _linkForDevice:handler:](self, "_linkForDevice:handler:", v6, v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __69__ANRapportConnection_sendHomeLocationStatusRequestToDevice_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_sendHomeLocationStatusRequestToDevice:handler:", v3, *(_QWORD *)(a1 + 32));

  }
  else
  {
    ANLogHandleRapportConnection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@### Home Location Status Request failed to get link client", (uint8_t *)&v6, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_simulateDeliveryFailureForMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ANLogHandleRapportConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_ERROR, "%@Forcing Rapport Delivery Failure", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:description:", 1036, *MEMORY[0x1E0CF7C68], CFSTR("Force Delivery Failure Enabled in User Defaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANRapportConnection delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection:failedDeliveryForMessage:withError:", self, v4, v6);

}

- (void)_setupLink:(id)a3
{
  id v4;
  RPCompanionLinkClient *v5;
  RPCompanionLinkClient *companionLinkClient;
  uint64_t v7;
  RPCompanionLinkClient *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v4 = a3;
  -[ANRapportConnection setActiveDevices:](self, "setActiveDevices:", MEMORY[0x1E0C9AA60]);
  -[ANRapportConnection _tearDownLink](self, "_tearDownLink");
  v5 = (RPCompanionLinkClient *)objc_opt_new();
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = v5;

  -[RPCompanionLinkClient setDispatchQueue:](self->_companionLinkClient, "setDispatchQueue:", self->_rapportQueue);
  -[RPCompanionLinkClient setControlFlags:](self->_companionLinkClient, "setControlFlags:", 2084);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __34__ANRapportConnection__setupLink___block_invoke;
  v19[3] = &unk_1E938F518;
  objc_copyWeak(&v20, &location);
  -[RPCompanionLinkClient setInvalidationHandler:](self->_companionLinkClient, "setInvalidationHandler:", v19);
  -[RPCompanionLinkClient setInterruptionHandler:](self->_companionLinkClient, "setInterruptionHandler:", &__block_literal_global_23);
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __34__ANRapportConnection__setupLink___block_invoke_30;
  v17[3] = &unk_1E93907A0;
  objc_copyWeak(&v18, &location);
  -[RPCompanionLinkClient setDeviceFoundHandler:](self->_companionLinkClient, "setDeviceFoundHandler:", v17);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __34__ANRapportConnection__setupLink___block_invoke_32;
  v15[3] = &unk_1E93907A0;
  objc_copyWeak(&v16, &location);
  -[RPCompanionLinkClient setDeviceLostHandler:](self->_companionLinkClient, "setDeviceLostHandler:", v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __34__ANRapportConnection__setupLink___block_invoke_33;
  v13[3] = &unk_1E93907C8;
  objc_copyWeak(&v14, &location);
  -[RPCompanionLinkClient setDeviceChangedHandler:](self->_companionLinkClient, "setDeviceChangedHandler:", v13);
  -[ANRapportConnection _registerHandlers](self, "_registerHandlers");
  v8 = self->_companionLinkClient;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __34__ANRapportConnection__setupLink___block_invoke_35;
  v10[3] = &unk_1E93902D0;
  objc_copyWeak(&v12, &location);
  v9 = v4;
  v11 = v9;
  -[RPCompanionLinkClient activateWithCompletion:](v8, "activateWithCompletion:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __34__ANRapportConnection__setupLink___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ANLogHandleRapportConnection();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@### Rapport Connection Invalidated", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "_handleLinkInvalidation");
}

void __34__ANRapportConnection__setupLink___block_invoke_29()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  ANLogHandleRapportConnection();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v0, OS_LOG_TYPE_DEFAULT, "%@### Rapport Connection Interrupted", (uint8_t *)&v1, 0xCu);
  }

}

void __34__ANRapportConnection__setupLink___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ANLogHandleRapportConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "serviceTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = &stru_1E93913D0;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@### Device Found: %@, Service Types: %@", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(WeakRetained, "_updateDevices");
  objc_msgSend(WeakRetained, "_notifyDeviceDelegatesConnectionDidFindDevice:", v3);

}

void __34__ANRapportConnection__setupLink___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ANLogHandleRapportConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = &stru_1E93913D0;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@### Device Lost: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(WeakRetained, "_updateDevices");
  objc_msgSend(WeakRetained, "_notifyDeviceDelegatesConnectionDidLoseDevice:", v3);

}

void __34__ANRapportConnection__setupLink___block_invoke_33(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ANLogHandleRapportConnection();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412802;
    v9 = &stru_1E93913D0;
    v10 = 1024;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@### Device Changed (flags = %d): %@", (uint8_t *)&v8, 0x1Cu);
  }

  objc_msgSend(WeakRetained, "_updateDevices");
  objc_msgSend(WeakRetained, "_notifyDeviceDelegatesConnectionDidFindDevice:", v5);

}

void __34__ANRapportConnection__setupLink___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  ANLogHandleRapportConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 138412546;
    v16 = &stru_1E93913D0;
    v17 = 2112;
    v18 = v3;
    v7 = "%@### Error activating link '%@'";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v16 = &stru_1E93913D0;
    v7 = "%@### Link activated succcessfully";
    v8 = v6;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
  }
  _os_log_impl(&dword_1D23A0000, v8, v9, v7, buf, v10);
LABEL_7:

  objc_msgSend(WeakRetained, "_startTimer");
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "clientQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__ANRapportConnection__setupLink___block_invoke_36;
    v12[3] = &unk_1E938FDD8;
    v14 = *(id *)(a1 + 32);
    v13 = v3;
    dispatch_async(v11, v12);

  }
}

uint64_t __34__ANRapportConnection__setupLink___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_linkForDevice:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ANRapportConnection *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ANRapportConnection clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ANRapportConnection__linkForDevice_handler___block_invoke;
  block[3] = &unk_1E9390818;
  objc_copyWeak(&v15, &location);
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __46__ANRapportConnection__linkForDevice_handler___block_invoke(id *a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _BYTE *v24;
  id v25;
  uint8_t v26[4];
  const __CFString *v27;
  __int16 v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "clients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("Client"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ANLogHandleRapportConnection();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = &stru_1E93913D0;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@### Found existing link! %@", buf, 0x16u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy__7;
    v34 = __Block_byref_object_dispose__7;
    v35 = (id)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDestinationDevice:", a1[4]);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDispatchQueue:", WeakRetained[4]);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setServiceType:", *MEMORY[0x1E0CF79F8]);
    v9 = (void *)MEMORY[0x1E0C99E08];
    v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v30[0] = CFSTR("Client");
    v30[1] = CFSTR("Count");
    v31[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithDictionary:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "clients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v6, v14);

    ANLogHandleRapportConnection();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v26 = 138412546;
      v27 = &stru_1E93913D0;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_DEFAULT, "%@### Creating new link %@", v26, 0x16u);
    }

    v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __46__ANRapportConnection__linkForDevice_handler___block_invoke_39;
    v20[3] = &unk_1E93907F0;
    v18 = a1[4];
    v19 = a1[5];
    v21 = v18;
    v22 = v19;
    objc_copyWeak(&v25, v2);
    v23 = a1[6];
    v24 = buf;
    objc_msgSend(v17, "activateWithCompletion:", v20);

    objc_destroyWeak(&v25);
    _Block_object_dispose(buf, 8);

  }
}

void __46__ANRapportConnection__linkForDevice_handler___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ANLogHandleRapportConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = &stru_1E93913D0;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_ERROR, "%@### Failed to activate device: %@ with error %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__ANRapportConnection__linkForDevice_handler___block_invoke_40;
    v10[3] = &unk_1E938F960;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    v11 = *(id *)(a1 + 32);
    dispatch_async(v7, v10);

    (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v3, v8);
    objc_destroyWeak(&v12);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = &stru_1E93913D0;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@### Successfully activated device: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __46__ANRapportConnection__linkForDevice_handler___block_invoke_40(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "clients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

- (void)_handleLinkInvalidation
{
  -[ANRapportConnection _cancelTimer](self, "_cancelTimer");
  -[ANRapportConnection _tearDownLink](self, "_tearDownLink");
  -[ANRapportConnection setActiveDevices:](self, "setActiveDevices:", MEMORY[0x1E0C9AA60]);
}

- (void)_tearDownLink
{
  NSObject *v3;
  void *v4;
  RPCompanionLinkClient *companionLinkClient;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ANLogHandleRapportConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ANRapportConnection companionLinkClient](self, "companionLinkClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = &stru_1E93913D0;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@Tearing Down Companion Link: %@", (uint8_t *)&v6, 0x16u);

  }
  -[RPCompanionLinkClient setInvalidationHandler:](self->_companionLinkClient, "setInvalidationHandler:", 0);
  -[RPCompanionLinkClient setInterruptionHandler:](self->_companionLinkClient, "setInterruptionHandler:", 0);
  -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate");
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

}

- (void)_registerHandlers
{
  -[ANRapportConnection _registerMessageRequestHandler](self, "_registerMessageRequestHandler");
  -[ANRapportConnection _registerHomeLocationStatusRequestHandler](self, "_registerHomeLocationStatusRequestHandler");
}

- (void)_registerMessageRequestHandler
{
  RPCompanionLinkClient *companionLinkClient;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  companionLinkClient = self->_companionLinkClient;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__ANRapportConnection__registerMessageRequestHandler__block_invoke;
  v4[3] = &unk_1E9390890;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:](companionLinkClient, "registerRequestID:options:handler:", CFSTR("com.apple.announce.announcement.message"), 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__ANRapportConnection__registerMessageRequestHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D839C8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF7E80], "senderWithID:type:", v9, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ANLogHandleRapportConnection();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = &stru_1E93913D0;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%@### Rapport Received Message from %@", buf, 0x16u);
  }

  dispatch_get_global_queue(33, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ANRapportConnection__registerMessageRequestHandler__block_invoke_42;
  block[3] = &unk_1E9390868;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  block[4] = *(_QWORD *)(a1 + 32);
  v17 = v7;
  v18 = v10;
  v19 = v8;
  v13 = v8;
  v14 = v10;
  v15 = v7;
  dispatch_async(v12, block);

  objc_destroyWeak(&v20);
}

void __53__ANRapportConnection__registerMessageRequestHandler__block_invoke_42(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__ANRapportConnection__registerMessageRequestHandler__block_invoke_2;
  v8[3] = &unk_1E9390840;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v3, "connection:didReceiveMessage:fromSender:senderContext:handler:", v4, v5, v6, v7, v8);

}

uint64_t __53__ANRapportConnection__registerMessageRequestHandler__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_registerHomeLocationStatusRequestHandler
{
  RPCompanionLinkClient *companionLinkClient;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  companionLinkClient = self->_companionLinkClient;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__ANRapportConnection__registerHomeLocationStatusRequestHandler__block_invoke;
  v4[3] = &unk_1E9390890;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:](companionLinkClient, "registerRequestID:options:handler:", CFSTR("com.apple.announce.home-location-status-request"), 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__ANRapportConnection__registerHomeLocationStatusRequestHandler__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  char v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ANLogHandleRapportConnection();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D839C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = &stru_1E93913D0;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@### Rapport Received Home Location Status Request from %@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    dispatch_get_global_queue(33, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ANRapportConnection__registerHomeLocationStatusRequestHandler__block_invoke_46;
    block[3] = &unk_1E938FBD8;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    block[4] = *(_QWORD *)(a1 + 32);
    v15 = v7;
    dispatch_async(v13, block);

    objc_destroyWeak(&v16);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA70], 0, 0);
  }

}

void __64__ANRapportConnection__registerHomeLocationStatusRequestHandler__block_invoke_46(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionDidReceiveRequestForHomeLocationStatus:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updateDevices
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[ANRapportConnection companionLinkClient](self, "companionLinkClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[ANRapportConnection setActiveDevices:](self, "setActiveDevices:", v5);

  ANLogHandleRapportConnection();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[ANRapportConnection activeDevices](self, "activeDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = &stru_1E93913D0;
    v10 = 2048;
    v11 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "%@### Updated Devices (%lu)", (uint8_t *)&v8, 0x16u);

  }
}

- (void)_incrementMessageCountForCompanionLinkClient:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ANRapportConnection__incrementMessageCountForCompanionLinkClient___block_invoke;
  v7[3] = &unk_1E938F2F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __68__ANRapportConnection__incrementMessageCountForCompanionLinkClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "destinationDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("Count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("Count"));

  }
}

- (void)_decrementMessageCountForCompanionLinkClient:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ANRapportConnection__decrementMessageCountForCompanionLinkClient___block_invoke;
  v7[3] = &unk_1E938F2F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __68__ANRapportConnection__decrementMessageCountForCompanionLinkClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "clients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "destinationDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("Count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");
    if (v7 > 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v7 - 1));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("Count"));

    }
    else
    {
      ANLogHandleRapportConnection();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "destinationDevice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = &stru_1E93913D0;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@### Invalidating and Removing Link For: %@", (uint8_t *)&v15, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "clients");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "destinationDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v13);

      objc_msgSend(*(id *)(a1 + 40), "invalidate");
    }

  }
}

- (void)_sendMessage:(id)a3 linkClient:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ANRapportConnection _incrementMessageCountForCompanionLinkClient:](self, "_incrementMessageCountForCompanionLinkClient:", v9);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberForDefault:", *MEMORY[0x1E0CF7BD0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *MEMORY[0x1E0D839E0];
  v22[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__ANRapportConnection__sendMessage_linkClient_handler___block_invoke;
  v16[3] = &unk_1E93908B8;
  v14 = v9;
  v17 = v14;
  objc_copyWeak(&v19, &location);
  v15 = v10;
  v18 = v15;
  objc_msgSend(v14, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.announce.announcement.message"), v8, v13, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __55__ANRapportConnection__sendMessage_linkClient_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  ANLogHandleRapportConnection();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "destinationDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_ERROR, "%@### Rapport Send Failed to: %@, Error: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "destinationDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Send Successful to: %@", (uint8_t *)&v15, 0x16u);

    }
    ANLogHandleRapportConnection();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Response from device: %@", (uint8_t *)&v15, 0x16u);
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_decrementMessageCountForCompanionLinkClient:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_sendDailyRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ANRapportConnection _incrementMessageCountForCompanionLinkClient:](self, "_incrementMessageCountForCompanionLinkClient:", v6);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberForDefault:", *MEMORY[0x1E0CF7BD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0D839E0];
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__ANRapportConnection__sendDailyRequest_handler___block_invoke;
  v13[3] = &unk_1E93908B8;
  v11 = v6;
  v14 = v11;
  objc_copyWeak(&v16, &location);
  v12 = v7;
  v15 = v12;
  objc_msgSend(v11, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.announce.dailyanalytics"), MEMORY[0x1E0C9AA70], v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __49__ANRapportConnection__sendDailyRequest_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  ANLogHandleRapportConnection();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "destinationDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_ERROR, "%@### Rapport Send Daily Request Failed to: %@, Error: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "destinationDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Send Daily Request Successful to: %@", (uint8_t *)&v15, 0x16u);

    }
    ANLogHandleRapportConnection();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Daily Request Response from device: %@", (uint8_t *)&v15, 0x16u);
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_decrementMessageCountForCompanionLinkClient:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_sendHomeLocationStatusRequestToDevice:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ANRapportConnection _incrementMessageCountForCompanionLinkClient:](self, "_incrementMessageCountForCompanionLinkClient:", v6);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberForDefault:", *MEMORY[0x1E0CF7BC8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0D839E0];
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__ANRapportConnection__sendHomeLocationStatusRequestToDevice_handler___block_invoke;
  v13[3] = &unk_1E93908B8;
  v11 = v6;
  v14 = v11;
  objc_copyWeak(&v16, &location);
  v12 = v7;
  v15 = v12;
  objc_msgSend(v11, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.announce.home-location-status-request"), MEMORY[0x1E0C9AA70], v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __70__ANRapportConnection__sendHomeLocationStatusRequestToDevice_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  ANLogHandleRapportConnection();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "destinationDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_ERROR, "%@### Rapport Home Location Status Request Failed to: %@, Error: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "destinationDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Home Location Status Request Successful to: %@", (uint8_t *)&v15, 0x16u);

    }
    ANLogHandleRapportConnection();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@### Rapport Home Location Status Response from device: %@", (uint8_t *)&v15, 0x16u);
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_decrementMessageCountForCompanionLinkClient:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_executeBlockForDelegates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id obj;
  _QWORD block[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANRapportConnection deviceDelegatesToQueues](self, "deviceDelegatesToQueues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        -[ANRapportConnection deviceDelegatesToQueues](self, "deviceDelegatesToQueues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__ANRapportConnection__executeBlockForDelegates___block_invoke;
        block[3] = &unk_1E938FDD8;
        v15 = v4;
        block[4] = v12;
        v18 = v15;
        dispatch_async(v14, block);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

uint64_t __49__ANRapportConnection__executeBlockForDelegates___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_notifyDeviceDelegatesConnectionDidFindDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__ANRapportConnection__notifyDeviceDelegatesConnectionDidFindDevice___block_invoke;
  v6[3] = &unk_1E93908E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ANRapportConnection _executeBlockForDelegates:](self, "_executeBlockForDelegates:", v6);

}

void __69__ANRapportConnection__notifyDeviceDelegatesConnectionDidFindDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "connection:didFindDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyDeviceDelegatesConnectionDidLoseDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__ANRapportConnection__notifyDeviceDelegatesConnectionDidLoseDevice___block_invoke;
  v6[3] = &unk_1E93908E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ANRapportConnection _executeBlockForDelegates:](self, "_executeBlockForDelegates:", v6);

}

void __69__ANRapportConnection__notifyDeviceDelegatesConnectionDidLoseDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "connection:didLoseDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (double)_remainingScanTimeInterval
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  int v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;
  -[ANRapportConnection lastScanStartTimestamp](self, "lastScanStartTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  ANLogHandleRapportConnection();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[ANRapportConnection activeDevices](self, "activeDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANRapportConnection lastScanStartTimestamp](self, "lastScanStartTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413058;
    v20 = &stru_1E93913D0;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@### Active Device Count: %@, Scan Start: %@, Now: %@", (uint8_t *)&v19, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberForDefault:", *MEMORY[0x1E0CF7BC0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  return v17 - (v5 - v8);
}

- (BOOL)_needsScan
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_companionLinkClient)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSince1970");
    v5 = v4;

    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberForDefault:", *MEMORY[0x1E0CF7BC0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    -[ANRapportConnection lastScanStartTimestamp](self, "lastScanStartTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v9 + v11;

    if (v12 >= v5)
      goto LABEL_6;
    ANLogHandleRapportConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[ANRapportConnection lastScanStartTimestamp](self, "lastScanStartTimestamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      v28 = &stru_1E93913D0;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@### Last Scan Completion: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberForDefault:", *MEMORY[0x1E0CF7BB8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    v19 = v5 - v12;
    if (v19 > v18)
    {
      ANLogHandleRapportConnection();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412802;
        v28 = &stru_1E93913D0;
        v29 = 2112;
        v30 = v25;
        v31 = 2112;
        v32 = v26;
        _os_log_impl(&dword_1D23A0000, v24, OS_LOG_TYPE_DEFAULT, "%@### Needs Scan. Elapsed time (%@) since last scan exceeds scan interval (%@)", (uint8_t *)&v27, 0x20u);

      }
    }
    else
    {
LABEL_6:
      -[ANRapportConnection activeDevices](self, "activeDevices");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activeDevicesSupportingAnnounce");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22)
        return 0;
      ANLogHandleRapportConnection();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138412290;
        v28 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v24, OS_LOG_TYPE_DEFAULT, "%@### Needs Scan. No devices.", (uint8_t *)&v27, 0xCu);
      }
    }

  }
  return 1;
}

- (void)_startTimer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  dispatch_source_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[ANRapportConnection isTimerSuspended](self, "isTimerSuspended"))
  {
    ANLogHandleRapportConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@### Ignoring request to start timer. Timer is suspended.", buf, 0xCu);
    }

  }
  else
  {
    -[ANRapportConnection timer](self, "timer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ANRapportConnection _cancelTimer](self, "_cancelTimer");
      ANLogHandleRapportConnection();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@### Creating new deactivation timer", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberForDefault:", *MEMORY[0x1E0CF7BB0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    -[ANRapportConnection clientQueue](self, "clientQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v10);
    -[ANRapportConnection setTimer:](self, "setTimer:", v11);

    -[ANRapportConnection timer](self, "timer");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    dispatch_source_set_timer(v12, v13, (unint64_t)(v9 * 1000000000.0), 0);

    objc_initWeak(&location, self);
    -[ANRapportConnection timer](self, "timer");
    v14 = objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __34__ANRapportConnection__startTimer__block_invoke;
    v22 = &unk_1E938F518;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v14, &v19);

    ANLogHandleRapportConnection();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9, v19, v20, v21, v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = &stru_1E93913D0;
        v27 = 2112;
        v28 = v17;
        _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "%@### Will deactivate client link in (%@) seconds", buf, 0x16u);

      }
    }

    -[ANRapportConnection timer](self, "timer");
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __34__ANRapportConnection__startTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTimerExpired");

}

- (void)_handleTimerExpired
{
  NSObject *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ANLogHandleRapportConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@### Deactivation timer expired", (uint8_t *)&v4, 0xCu);
  }

  -[ANRapportConnection _cancelTimer](self, "_cancelTimer");
  -[ANRapportConnection _tearDownLink](self, "_tearDownLink");
}

- (void)_cancelTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ANRapportConnection timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    ANLogHandleRapportConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[ANRapportConnection timer](self, "timer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = &stru_1E93913D0;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%@### Removing client link deactivation timer %@", (uint8_t *)&v7, 0x16u);

    }
    -[ANRapportConnection timer](self, "timer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v6);

    -[ANRapportConnection setTimer:](self, "setTimer:", 0);
  }
}

- (ANRapportConnectionDelegate)delegate
{
  return (ANRapportConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClient, a3);
}

- (OS_dispatch_queue)rapportQueue
{
  return self->_rapportQueue;
}

- (void)setRapportQueue:(id)a3
{
  objc_storeStrong((id *)&self->_rapportQueue, a3);
}

- (NSMutableDictionary)clients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (NSArray)activeDevices
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setActiveDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)lastScanStartTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastScanStartTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMapTable)deviceDelegatesToQueues
{
  return self->_deviceDelegatesToQueues;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (BOOL)isTimerSuspended
{
  return self->_isTimerSuspended;
}

- (void)setIsTimerSuspended:(BOOL)a3
{
  self->_isTimerSuspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_deviceDelegatesToQueues, 0);
  objc_storeStrong((id *)&self->_lastScanStartTimestamp, 0);
  objc_storeStrong((id *)&self->_activeDevices, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_rapportQueue, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
