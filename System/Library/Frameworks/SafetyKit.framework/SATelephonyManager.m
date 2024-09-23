@implementation SATelephonyManager

- (SATelephonyManager)initWithQueue:(id)a3
{
  id v5;
  SATelephonyManager *v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SATelephonyManager;
  v6 = -[SATelephonyManager init](&v9, sel_init);
  if (v6)
  {
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__callStatusChanged_, *MEMORY[0x24BEB4AB8], 0);
    objc_storeStrong((id *)&v6->_callQueue, a3);

  }
  return v6;
}

id __36__SATelephonyManager_initWithQueue___block_invoke()
{
  return (id)objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
}

- (void)placeVoiceCall:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  sa_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SATelephonyManager placeVoiceCall:completionHandler:].cold.1((uint64_t)v6, v8, v9);

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke;
  v12[3] = &unk_2505B34B0;
  objc_copyWeak(&v15, &location);
  v10 = v7;
  v14 = v10;
  v11 = v6;
  v13 = v11;
  -[SATelephonyManager _canPlaceNewCall:](self, "_canPlaceNewCall:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "setCallInProgress:", 1);
    objc_msgSend(v6, "setCallFailed:", 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB49E8]), "initWithType:value:", 2, *(_QWORD *)(a1 + 32));
    v8 = objc_alloc_init(MEMORY[0x24BEB4950]);
    objc_msgSend(v8, "defaultProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB49D0]), "initWithProvider:", v9);
    objc_msgSend(v10, "setHandle:", v7);
    objc_msgSend(v10, "setShowUIPrompt:", 0);
    v11 = objc_msgSend(v10, "isValid");
    sa_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_cold_1();

      sa_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315395;
        v41 = "-[SATelephonyManager placeVoiceCall:completionHandler:]_block_invoke";
        v42 = 2113;
        v43 = v15;
        _os_log_impl(&dword_23457A000, v14, OS_LOG_TYPE_DEFAULT, "%s - request is valid, request.URL: %{private}@", buf, 0x16u);

      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_8;
      block[3] = &unk_2505B3488;
      v36 = v10;
      objc_copyWeak(&v38, v4);
      v37 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v38);
      v16 = v36;
    }
    else
    {
      v27 = a1;
      v29 = v8;
      v30 = v7;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "URL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v41 = "-[SATelephonyManager placeVoiceCall:completionHandler:]_block_invoke_4";
        v42 = 2112;
        v43 = v10;
        v44 = 2112;
        v45 = v18;
        _os_log_impl(&dword_23457A000, v13, OS_LOG_TYPE_DEFAULT, "%s - request is not valid, request: %@, request.URL: %@", buf, 0x20u);

      }
      v28 = v9;

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v10, "validityErrors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v32;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v32 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v23);
            sa_default_log();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v41 = "-[SATelephonyManager placeVoiceCall:completionHandler:]_block_invoke";
              v42 = 2112;
              v43 = v24;
              _os_log_error_impl(&dword_23457A000, v25, OS_LOG_TYPE_ERROR, "%s - unable to place voice call, error: %@", buf, 0x16u);
            }

            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v21);
      }

      v26 = *(_QWORD *)(v27 + 40);
      +[SAError errorWithCode:](SAError, "errorWithCode:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v16);
      v7 = v30;
      v9 = v28;
      v8 = v29;
    }

  }
  else
  {
    v17 = *(_QWORD *)(a1 + 40);
    +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v7);
  }

}

void __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_2;
  v4[3] = &unk_2505B3460;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "dialWithRequest:completion:", v3, v4);

  objc_destroyWeak(&v6);
}

void __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_3;
  block[3] = &unk_2505B3438;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v10);
}

void __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setCall:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleCallChanged:force:", *(_QWORD *)(a1 + 32), 1);
  (*(void (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) != 0, 0);

}

- (void)_currentCallEndedWithUpdatedFailureStatus:(BOOL)a3
{
  NSObject *callQueue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  callQueue = self->_callQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SATelephonyManager__currentCallEndedWithUpdatedFailureStatus___block_invoke;
  block[3] = &unk_2505B34D8;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(callQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __64__SATelephonyManager__currentCallEndedWithUpdatedFailureStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCallFailed:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(WeakRetained, "_currentCallEnded");

}

- (void)_currentCallEnded
{
  NSObject *callQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  callQueue = self->_callQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__SATelephonyManager__currentCallEnded__block_invoke;
  v4[3] = &unk_2505B3500;
  objc_copyWeak(&v5, &location);
  dispatch_async(callQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__SATelephonyManager__currentCallEnded__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "callInProgress"))
  {
    objc_msgSend(WeakRetained, "setCallInProgress:", 0);
    objc_msgSend(WeakRetained, "setCall:", 0);
    objc_msgSend(WeakRetained, "delegate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "callFailed"))
      v2 = 3;
    else
      v2 = 2;
    objc_msgSend(v1, "telephonyManager:didUpdateVoiceCallStatus:", WeakRetained, v2);

  }
}

- (void)_canPlaceNewCall:(id)a3
{
  id v4;
  NSObject *callQueue;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  _QWORD block[4];
  id v13;

  v4 = a3;
  if (+[SAGestalt inAirplaneMode](SAGestalt, "inAirplaneMode"))
  {
    callQueue = self->_callQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__SATelephonyManager__canPlaceNewCall___block_invoke;
    block[3] = &unk_2505B3528;
    v13 = v4;
    v6 = v4;
    dispatch_async(callQueue, block);

  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __39__SATelephonyManager__canPlaceNewCall___block_invoke_13;
    v8[3] = &unk_2505B3550;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

uint64_t __39__SATelephonyManager__canPlaceNewCall___block_invoke(uint64_t a1)
{
  NSObject *v2;

  sa_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __39__SATelephonyManager__canPlaceNewCall___block_invoke_cold_1(v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__SATelephonyManager__canPlaceNewCall___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SATelephonyManager__canPlaceNewCall___block_invoke_2;
  block[3] = &unk_2505B3438;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v10);
}

void __39__SATelephonyManager__canPlaceNewCall___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    *(_QWORD *)&v5 = 136315138;
    v16 = v5;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      objc_msgSend(WeakRetained, "call", v16, (_QWORD)v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqualToCall:", v10))
        break;
      v11 = objc_msgSend(v9, "status");

      if (v11 != 6)
        goto LABEL_12;
      sa_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16;
        v22 = "-[SATelephonyManager _canPlaceNewCall:]_block_invoke_2";
        _os_log_impl(&dword_23457A000, v12, OS_LOG_TYPE_DEFAULT, "%s - current call out of sync, cleaning up", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "_currentCallEnded");
LABEL_13:
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_15;
      }
    }

LABEL_12:
    if (objc_msgSend(v9, "status") != 6)
    {
      sa_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16;
        v22 = "-[SATelephonyManager _canPlaceNewCall:]_block_invoke";
        _os_log_impl(&dword_23457A000, v14, OS_LOG_TYPE_DEFAULT, "%s - cannot place new call because there is already a call in progress", buf, 0xCu);
      }

      v13 = 0;
      goto LABEL_19;
    }
    goto LABEL_13;
  }
LABEL_15:
  v13 = 1;
LABEL_19:

  sa_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    __39__SATelephonyManager__canPlaceNewCall___block_invoke_2_cold_1(v13, v15);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)handleCallChanged:(id)a3 force:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__SATelephonyManager_handleCallChanged_force___block_invoke;
  v8[3] = &unk_2505B3578;
  objc_copyWeak(&v10, &location);
  v9 = v6;
  v11 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __46__SATelephonyManager_handleCallChanged_force___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (id *)(a1 + 32);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "call");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToCall:", v5);

  sa_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v4, "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 136315394;
      v31 = "-[SATelephonyManager handleCallChanged:force:]_block_invoke";
      v32 = 2112;
      v33 = v10;
      _os_log_impl(&dword_23457A000, v8, OS_LOG_TYPE_DEFAULT, "%s - we found our call, call: %@", (uint8_t *)&v30, 0x16u);

    }
    objc_msgSend(WeakRetained, "call");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "status");
    if (v12 == objc_msgSend(*v4, "status"))
    {
      v13 = *(unsigned __int8 *)(a1 + 48);

      if (!v13)
      {
        sa_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_1(v4, v8);
        goto LABEL_29;
      }
    }
    else
    {

    }
    objc_msgSend(WeakRetained, "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*v4, "status");
    switch(v14)
    {
      case 1:
        sa_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*v4, "handle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 136315650;
          v31 = "-[SATelephonyManager handleCallChanged:force:]_block_invoke";
          v32 = 2112;
          v33 = v23;
          v34 = 2048;
          v35 = 1;
          _os_log_impl(&dword_23457A000, v21, OS_LOG_TYPE_DEFAULT, "%s - updating status for call, call: %@, status: %lu", (uint8_t *)&v30, 0x20u);

        }
        objc_msgSend(WeakRetained, "setCallFailed:", 0);
        v18 = v8;
        v19 = WeakRetained;
        v20 = 1;
        goto LABEL_20;
      case 6:
        sa_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*v4, "handle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "value");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(WeakRetained, "callFailed");
          v30 = 136315650;
          v31 = "-[SATelephonyManager handleCallChanged:force:]_block_invoke";
          v28 = 2;
          if (v27)
            v28 = 3;
          v32 = 2112;
          v33 = v26;
          v34 = 2048;
          v35 = v28;
          _os_log_impl(&dword_23457A000, v24, OS_LOG_TYPE_DEFAULT, "%s - updating status for call, call: %@, status: %lu", (uint8_t *)&v30, 0x20u);

        }
        objc_msgSend(WeakRetained, "_currentCallEndedWithUpdatedFailureStatus:", objc_msgSend(*v4, "sa_hasFailed"));
        break;
      case 3:
        sa_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*v4, "handle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 136315650;
          v31 = "-[SATelephonyManager handleCallChanged:force:]_block_invoke";
          v32 = 2112;
          v33 = v17;
          v34 = 2048;
          v35 = 0;
          _os_log_impl(&dword_23457A000, v15, OS_LOG_TYPE_DEFAULT, "%s - updating status for call, call: %@, status: %lu", (uint8_t *)&v30, 0x20u);

        }
        v18 = v8;
        v19 = WeakRetained;
        v20 = 0;
LABEL_20:
        -[NSObject telephonyManager:didUpdateVoiceCallStatus:](v18, "telephonyManager:didUpdateVoiceCallStatus:", v19, v20);
        break;
      default:
        sa_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_2(v4, v29);

        break;
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_3((id *)(a1 + 32), v8);
  }
LABEL_29:

}

- (void)_callStatusChanged:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SATelephonyManager _callStatusChanged:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_23457A000, v5, OS_LOG_TYPE_DEFAULT, "%s, call: %@", (uint8_t *)&v6, 0x16u);
  }

  -[SATelephonyManager handleCallChanged:force:](self, "handleCallChanged:force:", v4, 0);
}

- (SATelephonyDelegateProtocol)delegate
{
  return (SATelephonyDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)callInProgress
{
  return self->_callInProgress;
}

- (void)setCallInProgress:(BOOL)a3
{
  self->_callInProgress = a3;
}

- (BOOL)callFailed
{
  return self->_callFailed;
}

- (void)setCallFailed:(BOOL)a3
{
  self->_callFailed = a3;
}

- (TUCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
{
  objc_storeStrong((id *)&self->_call, a3);
}

- (OS_dispatch_queue)callQueue
{
  return self->_callQueue;
}

- (void)setCallQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callQueue, 0);
  objc_storeStrong((id *)&self->_call, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)placeVoiceCall:(uint64_t)a3 completionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315395;
  v4 = "-[SATelephonyManager placeVoiceCall:completionHandler:]";
  v5 = 2113;
  v6 = a1;
  OUTLINED_FUNCTION_0(&dword_23457A000, a2, a3, "%s, phoneNumberString: %{private}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __55__SATelephonyManager_placeVoiceCall_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23457A000, v0, v1, "%s - request is valid, request: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void __39__SATelephonyManager__canPlaceNewCall___block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SATelephonyManager _canPlaceNewCall:]_block_invoke";
  _os_log_debug_impl(&dword_23457A000, log, OS_LOG_TYPE_DEBUG, "%s - unable to place voice call, in airplane mode", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __39__SATelephonyManager__canPlaceNewCall___block_invoke_2_cold_1(char a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[SATelephonyManager _canPlaceNewCall:]_block_invoke";
  v4 = 1024;
  v5 = a1 & 1;
  _os_log_debug_impl(&dword_23457A000, a2, OS_LOG_TYPE_DEBUG, "%s, result: %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*a1, "status");
  v7 = 136315650;
  v8 = "-[SATelephonyManager handleCallChanged:force:]_block_invoke";
  v9 = 2112;
  v10 = v5;
  v11 = 2048;
  v12 = v6;
  _os_log_debug_impl(&dword_23457A000, a2, OS_LOG_TYPE_DEBUG, "%s - ignoring status for call since it didn't change, call: %@, status: %lu", (uint8_t *)&v7, 0x20u);

}

void __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23457A000, a2, v5, "%s - unhandled status for call, call: %@", (uint8_t *)v6);

}

void __46__SATelephonyManager_handleCallChanged_force___block_invoke_cold_3(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "callUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23457A000, a2, v4, "%s - ignoring status for non-current call, call: %@", (uint8_t *)v5);

}

@end
