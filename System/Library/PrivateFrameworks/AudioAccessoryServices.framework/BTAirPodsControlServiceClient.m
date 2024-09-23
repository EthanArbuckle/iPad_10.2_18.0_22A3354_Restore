@implementation BTAirPodsControlServiceClient

- (BTAirPodsControlServiceClient)init
{
  BTAirPodsControlServiceClient *v2;
  BTAirPodsControlServiceClient *v3;
  BTAirPodsControlServiceClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTAirPodsControlServiceClient;
  v2 = -[BTAirPodsControlServiceClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__BTAirPodsControlServiceClient_invalidate__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__BTAirPodsControlServiceClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 49))
  {
    v2 = result;
    *(_BYTE *)(v1 + 49) = 1;
    if (gLogCategory_BTAirPodsControlServiceClient <= 30
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    return objc_msgSend(*(id *)(v2 + 32), "_invalidate");
  }
  return result;
}

- (void)_invalidate
{
  void *v3;
  CBCentralManager *centralManager;
  CBPeripheral *peripheral;
  NSMutableArray *requestArray;

  BTErrorF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTAirPodsControlServiceClient _abortRequestsWithError:](self, "_abortRequestsWithError:", v3);

  -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0);
  centralManager = self->_centralManager;
  self->_centralManager = 0;

  -[CBPeripheral setDelegate:](self->_peripheral, "setDelegate:", 0);
  peripheral = self->_peripheral;
  self->_peripheral = 0;

  requestArray = self->_requestArray;
  self->_requestArray = 0;

  if (gLogCategory_BTAirPodsControlServiceClient <= 30
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)getSilentModeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__BTAirPodsControlServiceClient_getSilentModeWithCompletionHandler___block_invoke;
  v7[3] = &unk_25081CD40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __68__BTAirPodsControlServiceClient_getSilentModeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BTAirPodsControlRequest *v14;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49))
  {
    v14 = objc_alloc_init(BTAirPodsControlRequest);
    -[BTAirPodsControlRequest setClient:](v14, "setClient:", *(_QWORD *)(a1 + 32));
    -[BTAirPodsControlRequest setGetHandler:](v14, "setGetHandler:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_setupTimeoutForRequest:", v14);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 72);
      *(_QWORD *)(v7 + 72) = v6;

      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    }
    objc_msgSend(v5, "addObject:", v14);
    if (gLogCategory_BTAirPodsControlServiceClient <= 30
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 104);
      if (v10)
      {
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        objc_msgSend(*(id *)(a1 + 32), "_run", v12);
        goto LABEL_22;
      }
      v11 = *(_QWORD *)(v9 + 112);
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 32), "_run", v11);
    goto LABEL_22;
  }
  BTErrorF();
  v14 = (BTAirPodsControlRequest *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_BTAirPodsControlServiceClient <= 90
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(v2 + 104);
    if (v3)
    {
      objc_msgSend(*(id *)(v2 + 104), "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = *(void **)(v2 + 112);
    }
    CUPrintNSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

    if (v3)
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
LABEL_22:

}

- (void)setSilentMode:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__BTAirPodsControlServiceClient_setSilentMode_completionHandler___block_invoke;
  block[3] = &unk_25081D5E8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __65__BTAirPodsControlServiceClient_setSilentMode_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  char *v15;
  void *v16;
  char *v17;
  void *v18;
  BTAirPodsControlRequest *v19;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 49))
  {
    BTErrorF();
    v2 = objc_claimAutoreleasedReturnValue();
    v19 = (BTAirPodsControlRequest *)v2;
    if (gLogCategory_BTAirPodsControlServiceClient <= 90)
    {
      if (gLogCategory_BTAirPodsControlServiceClient != -1 || (v14 = _LogCategory_Initialize(), v2 = (uint64_t)v19, v14))
      {
        v4 = *(_QWORD *)(a1 + 32);
        v5 = *(_QWORD *)(v4 + 104);
        if (v5)
        {
          objc_msgSend(*(id *)(v4 + 104), "identifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v6 = *(void **)(v4 + 112);
        }
        CUPrintNSError();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = (uint64_t)v19;
        if (v5)
        {

          v2 = (uint64_t)v19;
        }
      }
    }
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2, v3);
  }
  else
  {
    v19 = objc_alloc_init(BTAirPodsControlRequest);
    -[BTAirPodsControlRequest setClient:](v19, "setClient:", *(_QWORD *)(a1 + 32));
    -[BTAirPodsControlRequest setEnabled:](v19, "setEnabled:", *(unsigned __int8 *)(a1 + 48));
    -[BTAirPodsControlRequest setSetHandler:](v19, "setSetHandler:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_setupTimeoutForRequest:", v19);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 72);
      *(_QWORD *)(v9 + 72) = v8;

      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    }
    objc_msgSend(v7, "addObject:", v19);
    if (gLogCategory_BTAirPodsControlServiceClient <= 30
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(v11 + 104);
      if (v12)
      {
        objc_msgSend(*(id *)(v11 + 104), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = *(void **)(v11 + 112);
      }
      v15 = *(_BYTE *)(a1 + 48) ? "yes" : "no";
      v16 = v13;
      v17 = v15;
      LogPrintF_safe();
      if (v12)

    }
    objc_msgSend(*(id *)(a1 + 32), "_run", v16, v17);
  }

}

- (BOOL)isFindmyManaged
{
  void *v3;
  CBCentralManager *centralManager;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self->_deviceSN)
  {
    v3 = (void *)objc_msgSend((id)objc_opt_new(), "init");
    objc_msgSend(v3, "addObject:", self->_deviceSN);
    centralManager = self->_centralManager;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48__BTAirPodsControlServiceClient_isFindmyManaged__block_invoke;
    v7[3] = &unk_25081D610;
    v7[4] = &v8;
    -[CBCentralManager retrievePeripheralsWithFindMySerialNumberStrings:completion:](centralManager, "retrievePeripheralsWithFindMySerialNumberStrings:completion:", v3, v7);

    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __48__BTAirPodsControlServiceClient_isFindmyManaged__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "managedByFindMy");

  if (gLogCategory_BTAirPodsControlServiceClient <= 30
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v4, "count");
    LogPrintF_safe();
  }

}

- (void)_abortRequestsWithError:(id)a3
{
  BTAirPodsControlRequest *requestCurrent;
  BTAirPodsControlRequest *v5;
  id v6;

  v6 = a3;
  requestCurrent = self->_requestCurrent;
  if (!requestCurrent)
    goto LABEL_5;
  self->_requestCurrent = 0;
  v5 = requestCurrent;

LABEL_3:
  -[BTAirPodsControlServiceClient _completeRequest:error:](self, "_completeRequest:error:", v5, v6);
  while (1)
  {

LABEL_5:
    if (!-[NSMutableArray count](self->_requestArray, "count"))
      break;
    -[NSMutableArray popFirstObject](self->_requestArray, "popFirstObject");
    v5 = (BTAirPodsControlRequest *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_3;
  }

}

- (void)_completeRequest:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  const char *v14;
  void *v15;
  BTAirPodsControlRequest *v16;

  v16 = (BTAirPodsControlRequest *)a3;
  v6 = a4;
  -[BTAirPodsControlRequest getHandler](v16, "getHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = "GetSilentMode";
  else
    v8 = "SetSilentMode";

  if (v6)
  {
    if (gLogCategory_BTAirPodsControlServiceClient <= 90
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v14 = v8;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else if (gLogCategory_BTAirPodsControlServiceClient <= 30
         && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    v14 = v8;
    LogPrintF_safe();
  }
  -[BTAirPodsControlRequest timeoutTimer](v16, "timeoutTimer", v14, v15);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    dispatch_source_cancel(v9);
    -[BTAirPodsControlRequest setTimeoutTimer:](v16, "setTimeoutTimer:", 0);
  }
  -[BTAirPodsControlRequest getHandler](v16, "getHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[BTAirPodsControlRequest getHandler](v16, "getHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL, id))v12)[2](v12, -[BTAirPodsControlRequest enabled](v16, "enabled"), v6);
  }
  else
  {
    -[BTAirPodsControlRequest setHandler](v16, "setHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_21;
    -[BTAirPodsControlRequest setHandler](v16, "setHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), id))v12[2])(v12, v6);
  }

LABEL_21:
  -[BTAirPodsControlRequest setClient:](v16, "setClient:", 0);
  -[BTAirPodsControlRequest setGetHandler:](v16, "setGetHandler:", 0);
  -[BTAirPodsControlRequest setSetHandler:](v16, "setSetHandler:", 0);
  -[NSMutableArray removeObject:](self->_requestArray, "removeObject:", v16);
  if (self->_requestCurrent == v16)
  {
    self->_requestCurrent = 0;

  }
  -[BTAirPodsControlServiceClient _run](self, "_run");

}

- (void)_reportError:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!self->_invalidateCalled && gLogCategory_BTAirPodsControlServiceClient <= 90)
  {
    if (gLogCategory_BTAirPodsControlServiceClient != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      CUPrintNSError();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      v4 = v7;
    }
  }
  self->_state = 3;
  -[BTAirPodsControlServiceClient _abortRequestsWithError:](self, "_abortRequestsWithError:", v4, v6);

}

- (void)_setupTimeoutForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_source_t v7;
  id v8;
  NSObject *v9;
  _QWORD handler[4];
  dispatch_source_t v11;
  id v12;
  BTAirPodsControlServiceClient *v13;

  v4 = a3;
  objc_msgSend(v4, "timeoutTimer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    dispatch_source_cancel(v5);
  v7 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v4, "setTimeoutTimer:", v7);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __57__BTAirPodsControlServiceClient__setupTimeoutForRequest___block_invoke;
  handler[3] = &unk_25081D638;
  v11 = v7;
  v12 = v4;
  v13 = self;
  v8 = v4;
  v9 = v7;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet();
  dispatch_activate(v9);

}

void __57__BTAirPodsControlServiceClient__setupTimeoutForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "setTimeoutTimer:", 0);
    v6 = a1 + 40;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v6 + 8);
    BTErrorF();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_completeRequest:error:", v4, v7);

  }
}

- (void)_run
{
  int state;
  int v4;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      state = self->_state;
      switch(state)
      {
        case 0:
          if (-[BTAirPodsControlServiceClient _runInit](self, "_runInit"))
          {
            v4 = 10;
            goto LABEL_21;
          }
          break;
        case 10:
          if (-[CBCentralManager state](self->_centralManager, "state") == 5)
            goto LABEL_18;
          break;
        case 11:
          if (-[BTAirPodsControlServiceClient _runConnectStart](self, "_runConnectStart"))
            goto LABEL_18;
          break;
        case 12:
          if (self->_connected)
          {
            v4 = 13;
            goto LABEL_21;
          }
          break;
        case 13:
          self->_state = 14;
          break;
        case 14:
          if (-[BTAirPodsControlServiceClient _runDiscoverServicesStart](self, "_runDiscoverServicesStart"))
            goto LABEL_18;
          break;
        case 15:
          if (self->_airpodsCaseControlServiceObj)
          {
            v4 = 16;
            goto LABEL_21;
          }
          break;
        case 16:
          if (-[BTAirPodsControlServiceClient _runDiscoverCharacteristicsStart](self, "_runDiscoverCharacteristicsStart"))
          {
LABEL_18:
            v4 = self->_state + 1;
            goto LABEL_21;
          }
          break;
        case 17:
          if (self->_airpodsCaseControlCharacteristicObj)
          {
            v4 = 18;
LABEL_21:
            self->_state = v4;
          }
          break;
        case 18:
          -[BTAirPodsControlServiceClient _runProcessRequests](self, "_runProcessRequests");
          break;
        default:
          break;
      }
      if (self->_state == state)
        break;
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
}

- (BOOL)_runInit
{
  CBCentralManager **p_centralManager;
  CBCentralManager *v4;
  id v5;
  OS_dispatch_queue *dispatchQueue;
  void *v7;
  CBUUID *v8;
  CBUUID *v9;
  CBUUID *v10;
  CBUUID *v11;
  BOOL v12;
  void *v13;
  void *airpodsCaseControlCharacteristicUUID;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  p_centralManager = &self->_centralManager;
  v4 = self->_centralManager;
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDBB220]);
    dispatchQueue = self->_dispatchQueue;
    v16 = *MEMORY[0x24BDBB028];
    v17[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (CBCentralManager *)objc_msgSend(v5, "initWithDelegate:queue:options:", self, dispatchQueue, v7);

    if (!v4)
    {
      BTErrorF();
      v4 = (CBCentralManager *)objc_claimAutoreleasedReturnValue();
      -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v4);
      v12 = 0;
      goto LABEL_14;
    }
    objc_storeStrong((id *)p_centralManager, v4);
  }
  v8 = self->_airpodsCaseControlServiceUUID;
  if (v8)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("2EE26CD4-C04E-41CE-905A-B4054F5D1770"));
  v9 = (CBUUID *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v8 = v9;
    objc_storeStrong((id *)&self->_airpodsCaseControlServiceUUID, v9);
LABEL_7:
    v10 = self->_airpodsCaseControlCharacteristicUUID;
    if (v10)
    {
      v11 = v10;
      v12 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("71060001-413A-41EA-AF86-8CECFA21D057"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13 != 0;
      if (v13)
      {
        v11 = v13;
        airpodsCaseControlCharacteristicUUID = self->_airpodsCaseControlCharacteristicUUID;
        self->_airpodsCaseControlCharacteristicUUID = v11;
      }
      else
      {
        BTErrorF();
        airpodsCaseControlCharacteristicUUID = (void *)objc_claimAutoreleasedReturnValue();
        -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", airpodsCaseControlCharacteristicUUID, CFSTR("71060001-413A-41EA-AF86-8CECFA21D057"));
        v11 = 0;
      }

    }
    goto LABEL_13;
  }
  BTErrorF();
  v8 = (CBUUID *)objc_claimAutoreleasedReturnValue();
  -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v8, CFSTR("2EE26CD4-C04E-41CE-905A-B4054F5D1770"));
  v12 = 0;
LABEL_13:

LABEL_14:
  return v12;
}

- (BOOL)_runConnectStart
{
  CBDevice *peerDevice;
  NSString *v4;
  NSString *deviceUUID;
  uint64_t v6;
  void *v7;
  CBCentralManager *centralManager;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSString *deviceSN;
  uint64_t v15;
  void *v16;
  void *v17;
  CBCentralManager *v18;
  void *v19;
  NSUUID *peerUUID;
  _QWORD v21[5];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  peerDevice = self->_peerDevice;
  if (peerDevice)
  {
    -[CBDevice identifier](peerDevice, "identifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_3:
      BTErrorF();
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v4);
LABEL_23:

      return 0;
    }
LABEL_6:
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
    if (v6)
    {
      v7 = (void *)v6;
      centralManager = self->_centralManager;
      v23[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBCentralManager retrievePeripheralsWithIdentifiers:](centralManager, "retrievePeripheralsWithIdentifiers:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_storeStrong((id *)&self->_peerUUID, v7);
        objc_storeStrong((id *)&self->_peripheral, v11);
        -[CBPeripheral setDelegate:](self->_peripheral, "setDelegate:", self);
        if (gLogCategory_BTAirPodsControlServiceClient <= 30
          && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
        {
          peerUUID = self->_peerUUID;
          LogPrintF_safe();
        }
        -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", self->_peripheral, 0, peerUUID);

        return 1;
      }
      BTErrorF();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v19, v7);

    }
    else
    {
      BTErrorF();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v7, v4);
    }

    goto LABEL_23;
  }
  deviceUUID = self->_deviceUUID;
  if (deviceUUID)
  {
    v4 = deviceUUID;
    goto LABEL_6;
  }
  deviceSN = self->_deviceSN;
  if (!deviceSN)
  {
    if (!self->_peerUUID)
      goto LABEL_3;
    return 1;
  }
  -[NSString dataUsingEncoding:](deviceSN, "dataUsingEncoding:", 4);
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_3;
  v16 = (void *)v15;
  v22 = v15;
  v12 = 1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_centralManager;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __49__BTAirPodsControlServiceClient__runConnectStart__block_invoke;
  v21[3] = &unk_25081D660;
  v21[4] = self;
  -[CBCentralManager retrievePeripheralsWithFindMySerialNumbers:completion:](v18, "retrievePeripheralsWithFindMySerialNumbers:completion:", v17, v21);

  return v12;
}

void __49__BTAirPodsControlServiceClient__runConnectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v3 = a2;
  v17 = v3;
  if (gLogCategory_BTAirPodsControlServiceClient <= 30)
  {
    if (gLogCategory_BTAirPodsControlServiceClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v17, v4))
    {
      v14 = objc_msgSend(v3, "count");
      LogPrintF_safe();
      v3 = v17;
    }
  }
  objc_msgSend(v3, "firstObject", v14);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = v8;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(v11 + 56);
  if (v12)
  {
    if (gLogCategory_BTAirPodsControlServiceClient <= 30)
    {
      if (gLogCategory_BTAirPodsControlServiceClient != -1)
      {
LABEL_8:
        v16 = v12;
        LogPrintF_safe();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "connectPeripheral:options:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), 0, v16);
        goto LABEL_14;
      }
      v13 = _LogCategory_Initialize();
      v11 = *(_QWORD *)(a1 + 32);
      if (v13)
      {
        v12 = *(_QWORD *)(v11 + 56);
        goto LABEL_8;
      }
    }
    objc_msgSend(*(id *)(v11 + 40), "connectPeripheral:options:", *(_QWORD *)(v11 + 64), 0, v15);
    goto LABEL_14;
  }
  if (gLogCategory_BTAirPodsControlServiceClient <= 90
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_14:

}

- (BOOL)_runDiscoverServicesStart
{
  CBPeripheral *v3;
  CBUUID *v4;
  CBUUID *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = self->_peripheral;
  if (v3)
  {
    v4 = self->_airpodsCaseControlServiceUUID;
    v5 = v4;
    v6 = v4 != 0;
    if (v4)
    {
      v14[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        -[CBPeripheral identifier](v3, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSObjectOneLine();
        v12 = v8;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      -[CBPeripheral discoverServices:](v3, "discoverServices:", v7, v12, v13);

    }
    else
    {
      BTErrorF();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v11);

    }
  }
  else
  {
    BTErrorF();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v10);

    v6 = 0;
  }

  return v6;
}

- (BOOL)_runDiscoverCharacteristicsStart
{
  CBPeripheral *v3;
  CBService *v4;
  CBUUID *v5;
  CBUUID *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = self->_peripheral;
  if (v3)
  {
    v4 = self->_airpodsCaseControlServiceObj;
    if (v4)
    {
      v5 = self->_airpodsCaseControlCharacteristicUUID;
      v6 = v5;
      v7 = v5 != 0;
      if (v5)
      {
        v18[0] = v5;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_BTAirPodsControlServiceClient <= 30
          && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
        {
          -[CBPeripheral identifier](v3, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[CBService UUID](v4, "UUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          CUPrintNSObjectOneLine();
          v16 = v10;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v9;
          LogPrintF_safe();

        }
        -[CBPeripheral discoverCharacteristics:forService:](v3, "discoverCharacteristics:forService:", v8, v4, v15, v16, v17);

      }
      else
      {
        BTErrorF();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v14);

      }
    }
    else
    {
      BTErrorF();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v13);

      v7 = 0;
    }

  }
  else
  {
    BTErrorF();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v12);

    v7 = 0;
  }

  return v7;
}

- (void)_runProcessRequests
{
  BTAirPodsControlRequest **p_requestCurrent;
  void *v4;
  void *v5;

  p_requestCurrent = &self->_requestCurrent;
  if (!self->_requestCurrent)
  {
    -[NSMutableArray popFirstObject](self->_requestArray, "popFirstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_storeStrong((id *)p_requestCurrent, v4);
      -[BTAirPodsControlServiceClient _runProcessRequest:](self, "_runProcessRequest:", v5);
      v4 = v5;
    }

  }
}

- (void)_runProcessRequest:(id)a3
{
  id v4;
  CBPeripheral *v5;
  CBCharacteristic *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  char *v15;
  __int16 v16;
  char v17;
  char v18;
  __int16 v19;
  char v20;

  v4 = a3;
  v5 = self->_peripheral;
  if (!v5)
  {
    BTErrorF();
    v6 = (CBCharacteristic *)objc_claimAutoreleasedReturnValue();
    -[BTAirPodsControlServiceClient _completeRequest:error:](self, "_completeRequest:error:", v4, v6);
    goto LABEL_18;
  }
  v6 = self->_airpodsCaseControlCharacteristicObj;
  if (!v6)
  {
    BTErrorF();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTAirPodsControlServiceClient _completeRequest:error:](self, "_completeRequest:error:", v4, v12);

    goto LABEL_18;
  }
  objc_msgSend(v4, "getHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v19 = 513;
    v20 = 8;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v19, 3);
    if (gLogCategory_BTAirPodsControlServiceClient > 30
      || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
    -[CBPeripheral identifier](v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    v14 = v10;
  }
  else
  {
    v16 = 1;
    v17 = 8;
    v18 = objc_msgSend(v4, "enabled");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v16, 4);
    if (gLogCategory_BTAirPodsControlServiceClient > 30
      || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
    -[CBPeripheral identifier](v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "enabled"))
      v11 = "yes";
    else
      v11 = "no";
    CUPrintNSDataHex();
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    v15 = v10;
    v13 = v9;
  }
  LogPrintF_safe();

LABEL_17:
  -[CBPeripheral writeValue:forCharacteristic:type:](v5, "writeValue:forCharacteristic:type:", v8, v6, 0, v13, v14, v15);

LABEL_18:
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4;
  id v5;

  if (!self->_invalidateCalled)
  {
    v4 = objc_msgSend(a3, "state");
    if (gLogCategory_BTAirPodsControlServiceClient <= 30
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    if (v4 == 1 || v4 == 4)
    {
      BTErrorF();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v5);

    }
    else if (v4 == 5)
    {
      -[BTAirPodsControlServiceClient _run](self, "_run");
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5;
  id v6;

  if (!self->_invalidateCalled)
  {
    objc_msgSend(a4, "identifier", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", self->_peerUUID) & 1) != 0)
    {
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        v5 = v6;
        LogPrintF_safe();
      }
      self->_connected = 1;
      -[BTAirPodsControlServiceClient _run](self, "_run", v5);
    }
    else if (gLogCategory_BTAirPodsControlServiceClient <= 60
           && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  if (!self->_invalidateCalled)
  {
    v11 = v7;
    objc_msgSend(a4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", self->_peerUUID) & 1) != 0)
    {
      if (gLogCategory_BTAirPodsControlServiceClient <= 90
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      if (v11)
      {
        -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:");
      }
      else
      {
        BTErrorF();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTAirPodsControlServiceClient _reportError:](self, "_reportError:", v9);

      }
    }
    else if (gLogCategory_BTAirPodsControlServiceClient <= 60
           && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    v7 = v11;
  }

}

- (void)centralManager:(id)a3 didUpdateFindMyPeripherals:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (gLogCategory_BTAirPodsControlServiceClient <= 30
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  CBService *v15;
  CBService *v16;
  CBService *airpodsCaseControlServiceObj;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", self->_peerUUID) & 1) != 0)
  {
    objc_msgSend(v5, "services");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        objc_msgSend(v12, "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", self->_airpodsCaseControlServiceUUID);

        if ((v14 & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v16 = v12;

      if (!v16)
        goto LABEL_11;
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSObjectOneLine();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      airpodsCaseControlServiceObj = self->_airpodsCaseControlServiceObj;
      self->_airpodsCaseControlServiceObj = v16;
      v15 = v16;

      -[BTAirPodsControlServiceClient _run](self, "_run");
    }
    else
    {
LABEL_10:

LABEL_11:
      if (gLogCategory_BTAirPodsControlServiceClient > 60
        || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_21;
      }
      CUPrintNSObjectOneLine();
      v15 = (CBService *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

LABEL_21:
    goto LABEL_22;
  }
  if (gLogCategory_BTAirPodsControlServiceClient <= 60
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_22:

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  CBCharacteristic *v21;
  CBCharacteristic *v22;
  CBCharacteristic *airpodsCaseControlCharacteristicObj;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", self->_peerUUID) & 1) != 0)
  {
    objc_msgSend(v8, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqual:", self->_airpodsCaseControlServiceUUID) & 1) == 0)
    {
      if (gLogCategory_BTAirPodsControlServiceClient <= 60
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_23;
    }
    v25 = v10;
    v26 = v9;
    v11 = v7;
    v12 = v8;
    objc_msgSend(v8, "characteristics");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
LABEL_5:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v17);
        objc_msgSend(v18, "UUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqual:", self->_airpodsCaseControlCharacteristicUUID);

        if ((v20 & 1) != 0)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v15)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v22 = v18;

      if (!v22)
        goto LABEL_12;
      v7 = v11;
      v8 = v12;
      v10 = v25;
      v9 = v26;
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        -[CBCharacteristic UUID](v22, "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      airpodsCaseControlCharacteristicObj = self->_airpodsCaseControlCharacteristicObj;
      self->_airpodsCaseControlCharacteristicObj = v22;
      v21 = v22;

      objc_msgSend(v7, "setNotifyValue:forCharacteristic:", 1, v21);
      -[BTAirPodsControlServiceClient _run](self, "_run");
    }
    else
    {
LABEL_11:

LABEL_12:
      v7 = v11;
      v8 = v12;
      v10 = v25;
      v9 = v26;
      if (gLogCategory_BTAirPodsControlServiceClient > 60
        || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_22;
      }
      CUPrintNSObjectOneLine();
      v21 = (CBCharacteristic *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if (gLogCategory_BTAirPodsControlServiceClient <= 60
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_24:

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  if (gLogCategory_BTAirPodsControlServiceClient <= 30
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v12, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  void *v7;
  void *v8;
  BTAirPodsControlRequest *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", self->_peerUUID) & 1) != 0)
  {
    objc_msgSend(v25, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", self->_airpodsCaseControlCharacteristicUUID) & 1) == 0)
    {
      if (gLogCategory_BTAirPodsControlServiceClient <= 60
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_19;
    }
    v9 = self->_requestCurrent;
    if (!v9)
    {
      if (gLogCategory_BTAirPodsControlServiceClient <= 30
        && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_18;
    }
    objc_msgSend(v25, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    if (gLogCategory_BTAirPodsControlServiceClient <= 30
      && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSDataHex();
      v23 = v8;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v7;
      LogPrintF_safe();

    }
    v12 = objc_retainAutorelease(v11);
    v13 = objc_msgSend(v12, "bytes");
    v14 = objc_msgSend(v12, "length");
    if (v14 > 2)
    {
      v15 = v14;
      v16 = (void *)*(unsigned __int16 *)(v13 + 1);
      -[BTAirPodsControlRequest getHandler](v9, "getHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if ((_DWORD)v16 == 2051)
        {
          if (v15 > 3)
          {
            -[BTAirPodsControlRequest setEnabled:](v9, "setEnabled:", *(_BYTE *)(v13 + 3) != 0, v21, v23, v24);
LABEL_16:
            -[BTAirPodsControlServiceClient _completeRequest:error:](self, "_completeRequest:error:", v9, 0, v21);
LABEL_17:

LABEL_18:
LABEL_19:

            goto LABEL_20;
          }
          goto LABEL_34;
        }
        goto LABEL_31;
      }
      if ((_DWORD)v16 != 2049)
      {
LABEL_31:
        CUPrintNSDataHex();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v16;
        goto LABEL_35;
      }
      if (v15 > 4)
      {
        v18 = (void *)*(unsigned __int16 *)(v13 + 3);
        if (!*(_WORD *)(v13 + 3))
          goto LABEL_16;
        CUPrintNSDataHex();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v18;
LABEL_35:
        CBErrorF();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTAirPodsControlServiceClient _completeRequest:error:](self, "_completeRequest:error:", v9, v20, v22);

        goto LABEL_17;
      }
    }
LABEL_34:
    CUPrintNSDataHex();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    goto LABEL_35;
  }
  if (gLogCategory_BTAirPodsControlServiceClient <= 60
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_20:

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", self->_peerUUID) & 1) != 0)
  {
    objc_msgSend(v9, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", self->_airpodsCaseControlCharacteristicUUID) & 1) != 0)
    {
      if (gLogCategory_BTAirPodsControlServiceClient > 30
        || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_7;
      }
    }
    else if (gLogCategory_BTAirPodsControlServiceClient > 60
           || gLogCategory_BTAirPodsControlServiceClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_7;
    }
    LogPrintF_safe();
LABEL_7:

    goto LABEL_8;
  }
  if (gLogCategory_BTAirPodsControlServiceClient <= 60
    && (gLogCategory_BTAirPodsControlServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_8:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (CBDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (NSString)deviceSN
{
  return self->_deviceSN;
}

- (void)setDeviceSN:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSN, a3);
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_deviceSN, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_requestCurrent, 0);
  objc_storeStrong((id *)&self->_requestArray, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_peerUUID, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_airpodsCaseControlServiceUUID, 0);
  objc_storeStrong((id *)&self->_airpodsCaseControlServiceObj, 0);
  objc_storeStrong((id *)&self->_airpodsCaseControlCharacteristicUUID, 0);
  objc_storeStrong((id *)&self->_airpodsCaseControlCharacteristicObj, 0);
}

@end
