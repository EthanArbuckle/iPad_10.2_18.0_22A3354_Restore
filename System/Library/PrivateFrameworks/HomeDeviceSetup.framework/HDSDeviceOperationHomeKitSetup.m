@implementation HDSDeviceOperationHomeKitSetup

- (HDSDeviceOperationHomeKitSetup)init
{
  HDSDeviceOperationHomeKitSetup *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDSDeviceOperationHomeKitSetup;
  v2 = -[HDSDeviceOperationHomeKitSetup init](&v6, sel_init);
  if (v2)
  {
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_timeoutInSeconds = 300.0;
  }
  return v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HDSDeviceOperationHomeKitSetup_activate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __42__HDSDeviceOperationHomeKitSetup_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__HDSDeviceOperationHomeKitSetup_invalidate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __44__HDSDeviceOperationHomeKitSetup_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 240);
  if (v2)
  {
    if (!*(_BYTE *)(v1 + 201) || !*(_QWORD *)(v1 + 168))
      goto LABEL_9;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "_endActiveAssertion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(void **)(v1 + 240);
    if (v2)
    {
LABEL_9:
      *(_QWORD *)(v1 + 240) = 0;

      v1 = *(_QWORD *)(a1 + 32);
    }
  }
  NSErrorWithOSStatusF();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v1, "_completeWithError:errorLabel:", v4, 0);

}

- (void)_cleanup
{
  id completionHandler;
  id pauseHandler;
  id promptForHomeHandler;
  id promptForRoomHandler;
  id promptToInstallHomeAppHandler;
  TRSession *trSession;
  OS_dispatch_source *timeoutTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  TROperationQueue *trOperationQueue;
  HMAccessoryBrowser *homeKitBrowser;
  HMAccessory *homeKitAccessory;
  HMHome *homeKitSelectedHome;
  HMRoom *homeKitSelectedRoom;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  pauseHandler = self->_pauseHandler;
  self->_pauseHandler = 0;

  promptForHomeHandler = self->_promptForHomeHandler;
  self->_promptForHomeHandler = 0;

  promptForRoomHandler = self->_promptForRoomHandler;
  self->_promptForRoomHandler = 0;

  promptToInstallHomeAppHandler = self->_promptToInstallHomeAppHandler;
  self->_promptToInstallHomeAppHandler = 0;

  trSession = self->_trSession;
  self->_trSession = 0;

  self->_active = 0;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v10 = timeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  -[TROperationQueue invalidate](self->_trOperationQueue, "invalidate");
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  -[HMAccessoryBrowser stopSearchingForNewAccessories](self->_homeKitBrowser, "stopSearchingForNewAccessories");
  homeKitBrowser = self->_homeKitBrowser;
  self->_homeKitBrowser = 0;

  -[HMDeviceSetupOperation cancel](self->_homeKitDeviceSetupOperation, "cancel");
  -[HMDeviceSetupOperation setCompletionBlock:](self->_homeKitDeviceSetupOperation, "setCompletionBlock:", 0);
  homeKitAccessory = self->_homeKitAccessory;
  self->_homeKitAccessory = 0;

  homeKitSelectedHome = self->_homeKitSelectedHome;
  self->_homeKitSelectedHome = 0;

  homeKitSelectedRoom = self->_homeKitSelectedRoom;
  self->_homeKitSelectedRoom = 0;

}

- (void)_removeAccessoryIfNeeded
{
  if (self->_homeKitAddedAccessory)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HMHome removeAccessory:completionHandler:](self->_homeKitSelectedHome, "removeAccessory:completionHandler:", self->_homeKitAccessory, &__block_literal_global_0);
  }
}

void __58__HDSDeviceOperationHomeKitSetup__removeAccessoryIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  void *v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90)
    {
      v6 = v2;
      if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();

        return;
      }
    }
  }
  else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    v6 = 0;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5)
      goto LABEL_7;
  }

}

- (void)_completeWithError:(id)a3 errorLabel:(id)a4
{
  id v6;
  double v7;
  double v8;
  int v9;
  double metricNonUserSeconds;
  void (**completionHandler)(id, id, id);
  double v12;
  double metricUserSeconds;
  id v14;

  v14 = a3;
  v6 = a4;
  if (!self->_active)
    goto LABEL_19;
  if (!v14)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    v8 = v7;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup >= 31)
    {
      self->_metricNonUserSeconds = v7 + self->_metricNonUserSeconds;
      self->_state = 4;
      goto LABEL_19;
    }
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize())
    {
      v12 = v8;
      LogPrintF();
    }
    v9 = gLogCategory_HDSDeviceOperationHomeKitSetup;
    metricNonUserSeconds = v8 + self->_metricNonUserSeconds;
    self->_metricNonUserSeconds = metricNonUserSeconds;
    self->_state = 4;
    if (v9 > 30)
      goto LABEL_19;
    if (v9 == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_19;
      metricNonUserSeconds = self->_metricNonUserSeconds;
    }
    v12 = metricNonUserSeconds;
    metricUserSeconds = self->_metricUserSeconds;
LABEL_18:
    LogPrintF();
    goto LABEL_19;
  }
  self->_state = 3;
  -[HDSDeviceOperationHomeKitSetup _removeAccessoryIfNeeded](self, "_removeAccessoryIfNeeded");
  if (objc_msgSend(v14, "code") != -6723)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup > 60
      || gLogCategory_HDSDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_19;
    }
    v12 = *(double *)&v14;
    goto LABEL_18;
  }
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_18;
  }
LABEL_19:
  completionHandler = (void (**)(id, id, id))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, v14, v6);
  -[HDSDeviceOperationHomeKitSetup _cleanup](self, "_cleanup", *(_QWORD *)&v12, *(_QWORD *)&metricUserSeconds);

}

- (void)homeAppInstallChoice:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__HDSDeviceOperationHomeKitSetup_homeAppInstallChoice___block_invoke;
  v4[3] = &unk_24FCD4268;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __55__HDSDeviceOperationHomeKitSetup_homeAppInstallChoice___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 88) = 1;
    if (*(_BYTE *)(v1 + 40))
      objc_msgSend(*(id *)(v1 + 32), "_restoreHomeApp");
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (id)homeKitAccessory
{
  return self->_homeKitAccessory;
}

- (void)resume
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__HDSDeviceOperationHomeKitSetup_resume__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__HDSDeviceOperationHomeKitSetup_resume__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup >= 31)
    {
      *(_BYTE *)(v1 + 9) = 0;
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize())
        LogPrintF();
      v3 = gLogCategory_HDSDeviceOperationHomeKitSetup;
      *(_BYTE *)(*(_QWORD *)(v2 + 32) + 9) = 0;
      if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 16) = mach_absolute_time();
    objc_msgSend(*(id *)(v2 + 32), "_startTimeout:", *(double *)(*(_QWORD *)(v2 + 32) + 448));
    return objc_msgSend(*(id *)(v2 + 32), "_run");
  }
  return result;
}

- (void)selectHome:(id)a3
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
  v7[2] = __45__HDSDeviceOperationHomeKitSetup_selectHome___block_invoke;
  v7[3] = &unk_24FCD4290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __45__HDSDeviceOperationHomeKitSetup_selectHome___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    *(double *)(*(_QWORD *)(a1 + 32) + 288) = v2 + *(double *)(*(_QWORD *)(a1 + 32) + 288);
    if ((objc_msgSend(*(id *)(a1 + 32), "_isOwnerOfHome:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(a1 + 40));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = mach_absolute_time();
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "_startTimeout:", *(double *)(*(_QWORD *)(a1 + 32) + 448));
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
    else
    {
      NSErrorWithOSStatusF();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v3, "mutableCopy");
      v5 = v4;
      if (v4)
        v6 = v4;
      else
        v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v7 = v6;

      objc_msgSend(*(id *)(a1 + 40), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("SFErrorKeyHomeName"));

      objc_msgSend(*(id *)(a1 + 40), "owner");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("SFErrorKeyHomeOwnerAccount"));

      v11 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(v14, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, objc_msgSend(v14, "code"), v7);

      objc_msgSend(*(id *)(a1 + 32), "_completeWithError:errorLabel:", v13, CFSTR("HDS-HK-NotHomeOwner"));
    }
  }
}

- (void)reselectHome
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HDSDeviceOperationHomeKitSetup_reselectHome__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __46__HDSDeviceOperationHomeKitSetup_reselectHome__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 112) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (void)selectRoom:(id)a3
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
  v7[2] = __45__HDSDeviceOperationHomeKitSetup_selectRoom___block_invoke;
  v7[3] = &unk_24FCD4290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __45__HDSDeviceOperationHomeKitSetup_selectRoom___block_invoke(uint64_t result)
{
  uint64_t v1;
  double v2;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    *(double *)(*(_QWORD *)(v1 + 32) + 288) = v2 + *(double *)(*(_QWORD *)(v1 + 32) + 288);
    *(_QWORD *)(*(_QWORD *)(v1 + 32) + 16) = mach_absolute_time();
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)(*(_QWORD *)(v1 + 32) + 256), *(id *)(v1 + 40));
    objc_msgSend(*(id *)(v1 + 32), "_startTimeout:", *(double *)(*(_QWORD *)(v1 + 32) + 448));
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (void)_startTimeout:(double)a3
{
  OS_dispatch_source *timeoutTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  _QWORD v11[6];

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v6 = timeoutTimer;
    dispatch_source_cancel(v6);
    v7 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v9 = self->_timeoutTimer;
  self->_timeoutTimer = v8;

  v10 = self->_timeoutTimer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__HDSDeviceOperationHomeKitSetup__startTimeout___block_invoke;
  v11[3] = &unk_24FCD42B8;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  dispatch_source_set_event_handler(v10, v11);
  HDSDispatchTimerSet(self->_timeoutTimer, a3, -1.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
}

void __48__HDSDeviceOperationHomeKitSetup__startTimeout___block_invoke(uint64_t a1)
{
  unsigned int v2;
  const char *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) - 10;
  if (v2 > 0x26)
    v3 = "HomeKitSetupUnknownState?";
  else
    v3 = off_24FCD44B8[v2];
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 60
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v4)
  {
    v5 = v4;
    dispatch_source_cancel(v5);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = 0;

  }
  v8 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_completeWithError:errorLabel:", v9, CFSTR("HDS-HK-TimeOut"), v3);

}

- (void)_run
{
  uint64_t v3;
  uint64_t v4;
  int state;
  int v6;
  void *v7;
  void *v8;
  char v9;
  void (**promptToInstallHomeAppHandler)(id);
  HMHome *v11;
  HMHome *homeKitSelectedHome;
  HMHome *v13;
  id v14;
  double accessorySyncSeconds;
  _BOOL4 v16;
  id v17;
  int v18;
  int v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  OS_dispatch_source *timeoutTimer;
  NSObject *v29;
  OS_dispatch_source *v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  double homekitDataSyncSeconds;
  uint64_t v35;
  id v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD1100];
  v4 = *MEMORY[0x24BDD0FC8];
  state = self->_state;
  while (2)
  {
    switch(state)
    {
      case 0:
        self->_state = 10;
        -[HDSDeviceOperationHomeKitSetup _runInit](self, "_runInit");
        goto LABEL_140;
      case 10:
        if (self->_homeKitHomeManagerReady)
        {
          v6 = 11;
          goto LABEL_139;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 11:
        v6 = 12;
        goto LABEL_139;
      case 12:
        if (-[HMHomeManager dataSyncState](self->_homeKitHomeManager, "dataSyncState") == 5)
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v21 = (void *)MEMORY[0x24BDD1540];
          v39 = v4;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          v24 = CFSTR("?");
          if (v22)
            v24 = (const __CFString *)v22;
          v40[0] = v24;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1, v35);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", v3, 301024, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = CFSTR("HDS-HK-RequiresConfigurationReset");
LABEL_171:
          -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v26, v27);

          goto LABEL_140;
        }
        if (-[HMHomeManager dataSyncState](self->_homeKitHomeManager, "dataSyncState") == 2)
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v31 = (void *)MEMORY[0x24BDD1540];
          v37 = v4;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
          v32 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v32;
          v33 = CFSTR("?");
          if (v32)
            v33 = (const __CFString *)v32;
          v38 = v33;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1, v35);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", v3, 301011, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = CFSTR("HDS-HK-KeychainNotEnabled");
          goto LABEL_171;
        }
        if (-[HMHomeManager isDataSyncInProgress](self->_homeKitHomeManager, "isDataSyncInProgress"))
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            v35 = -[HMHomeManager dataSyncState](self->_homeKitHomeManager, "dataSyncState", v35);
            goto LABEL_175;
          }
        }
        else if (-[HMHomeManager status](self->_homeKitHomeManager, "status"))
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            v35 = -[HMHomeManager status](self->_homeKitHomeManager, "status", v35);
            goto LABEL_175;
          }
        }
        else
        {
          self->_state = 13;
          mach_absolute_time();
          UpTicksToSecondsF();
          self->_homekitDataSyncSeconds = homekitDataSyncSeconds;
          if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30)
            goto LABEL_140;
          if (gLogCategory_HDSDeviceOperationHomeKitSetup == -1)
          {
            if (!_LogCategory_Initialize())
              goto LABEL_140;
            homekitDataSyncSeconds = self->_homekitDataSyncSeconds;
          }
          v35 = *(_QWORD *)&homekitDataSyncSeconds;
LABEL_175:
          LogPrintF();
        }
LABEL_140:
        v20 = self->_state == state;
        state = self->_state;
        if (!v20)
          continue;
        return;
      case 13:
        if (self->_keyExchangeOnly)
          goto LABEL_45;
        v6 = 14;
        goto LABEL_139;
      case 14:
        if (!self->_promptToInstallHomeAppHandler)
          goto LABEL_17;
        objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", CFSTR("com.apple.Home"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isInstalled");

        if ((v9 & 1) != 0)
          goto LABEL_17;
        self->_state = 15;
        promptToInstallHomeAppHandler = (void (**)(id))self->_promptToInstallHomeAppHandler;
        goto LABEL_153;
      case 15:
        if (self->_homeAppInstallUserDidChoose)
        {
LABEL_17:
          v6 = 16;
          goto LABEL_139;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 16:
        -[HDSDeviceOperationHomeKitSetup _runHomeKitAutoSelectHome:](self, "_runHomeKitAutoSelectHome:", 0);
        v11 = (HMHome *)objc_claimAutoreleasedReturnValue();
        homeKitSelectedHome = self->_homeKitSelectedHome;
        self->_homeKitSelectedHome = v11;

        if (!self->_homeKitSelectedHome)
          goto LABEL_140;
        goto LABEL_25;
      case 17:
        if (self->_homeKitSelectedHome)
          goto LABEL_25;
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 18:
        if (self->_homeKitSelectedHome)
        {
LABEL_25:
          v6 = 19;
          goto LABEL_139;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 19:
        -[HDSDeviceOperationHomeKitSetup _updateHomeStats](self, "_updateHomeStats");
        self->_state = 20;
        -[HDSDeviceOperationHomeKitSetup _runHomeKitSelectRoom](self, "_runHomeKitSelectRoom");
        goto LABEL_140;
      case 20:
        if (self->_reselectHome)
        {
          self->_reselectHome = 0;
          v13 = self->_homeKitSelectedHome;
          self->_homeKitSelectedHome = 0;

          self->_state = 17;
          v14 = -[HDSDeviceOperationHomeKitSetup _runHomeKitAutoSelectHome:](self, "_runHomeKitAutoSelectHome:", 1);
          goto LABEL_140;
        }
        if (self->_homeKitSelectedRoom || self->_homeKitSelectedRoomName)
        {
          v18 = 21;
          if (self->_isCLIMode)
          {
            if (+[HDSDefaults waitForAccessorySync](HDSDefaults, "waitForAccessorySync"))
              v18 = 22;
            else
              v18 = 21;
          }
          self->_state = v18;
          goto LABEL_140;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30
          || gLogCategory_HDSDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_140;
        }
        goto LABEL_175;
      case 21:
        if (!self->_pauseAfterUserInput || !self->_pauseHandler)
          goto LABEL_45;
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        timeoutTimer = self->_timeoutTimer;
        if (timeoutTimer)
        {
          v29 = timeoutTimer;
          dispatch_source_cancel(v29);
          v30 = self->_timeoutTimer;
          self->_timeoutTimer = 0;

        }
        self->_paused = 1;
        self->_state = 24;
        promptToInstallHomeAppHandler = (void (**)(id))self->_pauseHandler;
LABEL_153:
        promptToInstallHomeAppHandler[2](promptToInstallHomeAppHandler);
        goto LABEL_140;
      case 22:
        if (!self->_isCLIMode
          || !+[HDSDefaults waitForAccessorySync](HDSDefaults, "waitForAccessorySync"))
        {
          goto LABEL_138;
        }
        self->_accessorySyncStartTicks = mach_absolute_time();
        self->_state = 23;
        -[HDSDeviceOperationHomeKitSetup _syncAccessoriesInSelectedRoom](self, "_syncAccessoriesInSelectedRoom");
        goto LABEL_140;
      case 23:
        if (!self->_accessorySyncDone)
          goto LABEL_140;
        mach_absolute_time();
        UpTicksToSecondsF();
        self->_accessorySyncSeconds = accessorySyncSeconds;
        if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30)
          goto LABEL_138;
        if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1)
          goto LABEL_40;
        if (_LogCategory_Initialize())
        {
          accessorySyncSeconds = self->_accessorySyncSeconds;
LABEL_40:
          v35 = *(_QWORD *)&accessorySyncSeconds;
          LogPrintF();
        }
LABEL_138:
        v6 = 21;
        goto LABEL_139;
      case 24:
        if (!self->_paused)
        {
LABEL_45:
          v6 = 25;
          goto LABEL_139;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 25:
        self->_state = 26;
        -[HDSDeviceOperationHomeKitSetup _runHomeKitDeviceSetup](self, "_runHomeKitDeviceSetup");
        goto LABEL_140;
      case 26:
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 27:
        if (self->_keyExchangeOnly)
          goto LABEL_130;
        -[HDSDeviceOperationHomeKitSetup _runHomeKitAddAccessory](self, "_runHomeKitAddAccessory");
        goto LABEL_140;
      case 28:
        if (self->_homeKitAddedAccessory)
        {
          v6 = 29;
LABEL_139:
          self->_state = v6;
          goto LABEL_140;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30
          || gLogCategory_HDSDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_140;
        }
        goto LABEL_175;
      case 29:
        -[HDSDeviceOperationHomeKitSetup _runHomeKitSetupRoom:](self, "_runHomeKitSetupRoom:", 0);
        goto LABEL_140;
      case 30:
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 31:
        -[HDSDeviceOperationHomeKitSetup _runHomeKitAssignRoom](self, "_runHomeKitAssignRoom");
        goto LABEL_140;
      case 32:
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 33:
        if (self->_stereoRole)
        {
          v6 = 36;
        }
        else if (self->_tvAudioInput)
        {
LABEL_113:
          v6 = 39;
        }
        else if (self->_appDataSelf)
        {
          v6 = 34;
        }
        else
        {
LABEL_66:
          v6 = 42;
        }
        goto LABEL_139;
      case 34:
        self->_state = 35;
        -[HDSDeviceOperationHomeKitSetup _runHomeKitAddAppData](self, "_runHomeKitAddAppData");
        goto LABEL_140;
      case 35:
        if (self->_homeKitAddedAppData)
          goto LABEL_66;
        goto LABEL_140;
      case 36:
        v36 = 0;
        v16 = -[HDSDeviceOperationHomeKitSetup _runHomeKitConfigureStereoPairAndReturnError:](self, "_runHomeKitConfigureStereoPairAndReturnError:", &v36);
        v17 = v36;
        if (v17)
        {
          -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v17, CFSTR("HDS-HK-StereoPair-Preflights"));
        }
        else
        {
          if (v16)
            v19 = 37;
          else
            v19 = 38;
          self->_state = v19;
        }

        goto LABEL_140;
      case 37:
        if (!self->_configuredStereoPair)
          goto LABEL_140;
        v6 = 38;
        goto LABEL_139;
      case 38:
        goto LABEL_113;
      case 39:
        if (!self->_tvAudioInput)
          goto LABEL_74;
        -[HDSDeviceOperationHomeKitSetup _runHomeKitUpdateAppleTVAudioDestination](self, "_runHomeKitUpdateAppleTVAudioDestination");
        v6 = 40;
        goto LABEL_139;
      case 40:
        if (!self->_configuredTVAudio)
          goto LABEL_140;
LABEL_74:
        v6 = 41;
        goto LABEL_139;
      case 41:
        goto LABEL_66;
      case 42:
        self->_state = 43;
        -[HDSDeviceOperationHomeKitSetup _runPersonalRequestsStart](self, "_runPersonalRequestsStart");
        goto LABEL_140;
      case 43:
        if (!self->_personalRequestsDone)
          goto LABEL_140;
        v6 = 44;
        goto LABEL_139;
      case 44:
        self->_state = 45;
        -[HDSDeviceOperationHomeKitSetup _runUpdateUserListeningHistoryStart](self, "_runUpdateUserListeningHistoryStart");
        goto LABEL_140;
      case 45:
        if (!self->_userListeningHistoryDone)
          goto LABEL_140;
        if (self->_psgHomePods && self->_psgStereoPairs)
          v6 = 46;
        else
LABEL_130:
          v6 = 48;
        goto LABEL_139;
      case 46:
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_130;
      case 47:
        if (!self->_createUpdatePSGDone)
          goto LABEL_140;
        goto LABEL_130;
      case 48:
        -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", 0, 0);
        goto LABEL_140;
      default:
        goto LABEL_140;
    }
  }
}

- (void)_runInit
{
  TROperationQueue *v3;
  TROperationQueue *trOperationQueue;
  void *v5;
  void *v6;
  HMHomeManager *v7;
  HMHomeManager *homeKitHomeManager;
  NSObject *v9;
  NSObject *hdsutilHKToken;
  HMHomeManager *v11;

  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_startTicks = mach_absolute_time();
  self->_homeKitDataSyncStartTicks = mach_absolute_time();
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[HDSDeviceOperationHomeKitSetup _startTimeout:](self, "_startTimeout:", self->_timeoutInSeconds);
  v3 = (TROperationQueue *)objc_alloc_init(getTROperationQueueClass());
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = v3;

  if (self->_isCLIMode)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[objc_class defaultConfiguration](getHMMutableHomeManagerConfigurationClass(), "defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setAdaptive:", 1);
    v7 = (HMHomeManager *)objc_msgSend(objc_alloc(getHMHomeManagerClass()), "initWithHomeMangerConfiguration:", v6);
    homeKitHomeManager = self->_homeKitHomeManager;
    self->_homeKitHomeManager = v7;

    -[HMHomeManager _beginActiveAssertionWithReason:](self->_homeKitHomeManager, "_beginActiveAssertionWithReason:", CFSTR("hdsutil Started"));
    v9 = objc_claimAutoreleasedReturnValue();
    hdsutilHKToken = self->_hdsutilHKToken;
    self->_hdsutilHKToken = v9;

  }
  else
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = (HMHomeManager *)objc_alloc_init(getHMHomeManagerClass());
    v5 = self->_homeKitHomeManager;
    self->_homeKitHomeManager = v11;
  }

  -[HMHomeManager setDelegate:](self->_homeKitHomeManager, "setDelegate:", self);
}

- (void)_runHomeKitDeviceSetup
{
  HMAccessoryBrowser *v3;
  HMAccessoryBrowser *homeKitBrowser;
  TRSession *v5;
  NSUUID *sessionID;
  id v7;
  HMDeviceSetupOperation *v8;
  HMDeviceSetupOperation *homeKitDeviceSetupOperation;
  void *v10;
  HMDeviceSetupOperation *v11;
  HMDeviceSetupOperation *v12;
  uint64_t v13;
  NSUUID *v14;
  _QWORD v15[5];

  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_keyExchangeOnly)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = (HMAccessoryBrowser *)objc_alloc_init(getHMAccessoryBrowserClass());
    homeKitBrowser = self->_homeKitBrowser;
    self->_homeKitBrowser = v3;

    -[HMAccessoryBrowser setDelegate:](self->_homeKitBrowser, "setDelegate:", self);
    -[HMAccessoryBrowser startSearchingForNewAccessories](self->_homeKitBrowser, "startSearchingForNewAccessories");
  }
  v5 = self->_trSession;
  if (!v5)
  {
    NSErrorWithOSStatusF();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v10, CFSTR("HDS-HK-NoTR"));

    goto LABEL_30;
  }
  sessionID = self->_sessionID;
  v7 = objc_alloc(getHMDeviceSetupOperationClass());
  if (sessionID)
  {
    v8 = (HMDeviceSetupOperation *)objc_msgSend(v7, "initWithSession:sessionIdentifier:", v5, self->_sessionID);
    homeKitDeviceSetupOperation = self->_homeKitDeviceSetupOperation;
    self->_homeKitDeviceSetupOperation = v8;

    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      v14 = self->_sessionID;
LABEL_19:
      LogPrintF();
    }
  }
  else
  {
    v11 = (HMDeviceSetupOperation *)objc_msgSend(v7, "initWithSession:", v5);
    v12 = self->_homeKitDeviceSetupOperation;
    self->_homeKitDeviceSetupOperation = v11;

    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_19;
    }
  }
  if (self->_userInteractive)
    v13 = 33;
  else
    v13 = 9;
  -[HMDeviceSetupOperation setQualityOfService:](self->_homeKitDeviceSetupOperation, "setQualityOfService:", v13, v14);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__HDSDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke;
  v15[3] = &unk_24FCD3FE8;
  v15[4] = self;
  -[HMDeviceSetupOperation setCompletionBlock:](self->_homeKitDeviceSetupOperation, "setCompletionBlock:", v15);
  -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", self->_homeKitDeviceSetupOperation);
  self->_startTicksForHomeKitSteps = mach_absolute_time();
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_30:

}

void __56__HDSDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 232);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HDSDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke_2;
  block[3] = &unk_24FCD3FE8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __56__HDSDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;

  mach_absolute_time();
  UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = v2;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296);
    LogPrintF();
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 8))
  {
    objc_msgSend(*(id *)(v3 + 96), "accessory");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v4;

    v7 = *(_QWORD **)(a1 + 32);
    if (!v7[13])
    {
      NSErrorWithOSStatusF();
      v8 = objc_claimAutoreleasedReturnValue();
      v12 = (id)v8;
      v10 = CFSTR("HDS-HK-DeviceSetup-NoHKAccessory");
      v9 = v7;
      goto LABEL_11;
    }
    if (+[HDSDefaults sysDropForceErrorLateEnabled](HDSDefaults, "sysDropForceErrorLateEnabled"))
    {
      NSErrorWithOSStatusF();
      v8 = objc_claimAutoreleasedReturnValue();
      v12 = (id)v8;
      v9 = *(void **)(a1 + 32);
      v10 = CFSTR("Force-Failure");
LABEL_11:
      objc_msgSend(v9, "_completeWithError:errorLabel:", v8, v10, v11);

      return;
    }
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = 27;
    objc_msgSend(*(id *)(a1 + 32), "_run");
  }
}

- (id)_runHomeKitAutoSelectHome:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  int *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  int v18;
  OS_dispatch_source *timeoutTimer;
  NSObject *v20;
  OS_dispatch_source *v21;
  double v22;
  double v23;
  int v24;
  int v25;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[HMHomeManager homes](self->_homeKitHomeManager, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a3)
  {
    if (!objc_msgSend(v5, "count"))
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[HDSDeviceOperationHomeKitSetup _runHomeKitAddHome](self, "_runHomeKitAddHome");
LABEL_52:
      v7 = 0;
      goto LABEL_53;
    }
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && -[HDSDeviceOperationHomeKitSetup _isOwnerOfHome:](self, "_isOwnerOfHome:", v7))
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_53;
      }

    }
  }
  v8 = &OBJC_IVAR___HDSSetupSession__skipWiFiSetup;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    v27 = objc_msgSend(v6, "count");
    LogPrintF();
  }
  if (self->_promptForHomeHandler)
  {
    -[HMHomeManager currentHome](self->_homeKitHomeManager, "currentHome");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
      {
        v13 = 0;
        v14 = *(_QWORD *)v30;
LABEL_21:
        v15 = 0;
        v28 = v13 + v12;
        while (1)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v15), "uniqueIdentifier", v27);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v10);

          if ((v17 & 1) != 0)
            break;
          if (v12 == ++v15)
          {
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            v13 = v28;
            if (v12)
              goto LABEL_21;
            break;
          }
        }
        v8 = &OBJC_IVAR___HDSSetupSession__skipWiFiSetup;
      }

    }
    v18 = v8[634];
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      v20 = timeoutTimer;
      dispatch_source_cancel(v20);
      v21 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
    mach_absolute_time();
    UpTicksToSecondsF();
    v23 = v22;
    v24 = v8[634];
    if (v24 <= 30 && (v24 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_metricNonUserSeconds = v23 + self->_metricNonUserSeconds;
    self->_startTicks = mach_absolute_time();
    v25 = v8[634];
    if (v25 <= 30 && (v25 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_state = 17;
    (*((void (**)(void))self->_promptForHomeHandler + 2))();

    goto LABEL_52;
  }
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v6, "firstObject", v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_53:

  return v7;
}

- (void)_runHomeKitAddHome
{
  HMHomeManager *homeKitHomeManager;
  void *v4;
  _QWORD v5[5];

  self->_state = 18;
  homeKitHomeManager = self->_homeKitHomeManager;
  initSFLocalizedStringForKey(CFSTR("MY_HOME"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__HDSDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke;
  v5[3] = &unk_24FCD4308;
  v5[4] = self;
  -[HMHomeManager addHomeWithName:completionHandler:](homeKitHomeManager, "addHomeWithName:completionHandler:", v4, v5);

}

void __52__HDSDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 232);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HDSDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke_2;
  block[3] = &unk_24FCD42E0;
  block[4] = v7;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __52__HDSDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke_2(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v3;
  id v4;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[8])
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_completeWithError:errorLabel:", v3, CFSTR("HDS-HK-AddHome"));
    }
    else if (*(_QWORD *)(a1 + 48))
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
    else
    {
      NSErrorWithOSStatusF();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_completeWithError:errorLabel:", v4, CFSTR("HDS-HK-AddHome"));

    }
  }
}

- (void)_runHomeKitSelectRoom
{
  HMHome *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  HDSDeviceOperationHomeKitSetup *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  OS_dispatch_source *timeoutTimer;
  NSObject *v23;
  OS_dispatch_source *v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**promptForRoomHandlerDetailed)(id, void *, id, id, void *);
  void *v35;
  HMRoom *v36;
  HMRoom *homeKitSelectedRoom;
  void (**promptForRoomHandler)(id, void *, uint64_t);
  double v39;
  id v40;
  id v41;
  void *v42;
  HMHome *v43;
  uint64_t v44;
  HDSDeviceOperationHomeKitSetup *v45;
  void *v46;
  id v47;
  _QWORD v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = self->_homeKitSelectedHome;
  if (*(_OWORD *)&self->_promptForRoomHandler != 0)
  {
    v45 = self;
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v43 = v3;
    -[HMHome rooms](v3, "rooms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v54 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 && (objc_msgSend(v4, "containsObject:", v10) & 1) == 0)
            objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "sortUsingSelector:");
    v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v11 = objc_msgSend(&unk_24FCE3A68, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v46 = 0;
      v14 = *(_QWORD *)v50;
      v15 = self;
      do
      {
        v16 = 0;
        v44 = v13;
        v17 = 10 - v13;
        do
        {
          if (*(_QWORD *)v50 != v14)
            objc_enumerationMutation(&unk_24FCE3A68);
          initSFLocalizedStringForKey(*(void **)(*((_QWORD *)&v49 + 1) + 8 * v16));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            -[HDSDeviceOperationHomeKitSetup _normalizedString:](v15, "_normalizedString:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v48[0] = MEMORY[0x24BDAC760];
            v48[1] = 3221225472;
            v48[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke;
            v48[3] = &unk_24FCD4330;
            v48[4] = v19;
            if (objc_msgSend(v4, "indexOfObjectPassingTest:", v48) == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v47, "addObject:", v18);
              if (v17 == v16)
              {
                v20 = v18;

                v46 = v20;
                v15 = v45;
              }
            }

          }
          ++v16;
        }
        while (v12 != v16);
        v13 = v44 + v12;
        v12 = objc_msgSend(&unk_24FCE3A68, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v12);
    }
    else
    {
      v46 = 0;
      v15 = self;
    }
    v3 = v43;
    -[HDSDeviceOperationHomeKitSetup _removeSimilarRoomNames:home:](v15, "_removeSimilarRoomNames:home:", v47, v43);
    objc_msgSend(v47, "sortUsingSelector:", sel_localizedStandardCompare_);
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v47);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    timeoutTimer = v15->_timeoutTimer;
    if (timeoutTimer)
    {
      v23 = timeoutTimer;
      dispatch_source_cancel(v23);
      v24 = v45->_timeoutTimer;
      v45->_timeoutTimer = 0;

      v15 = v45;
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    v26 = v25;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      v39 = v26;
      LogPrintF();
    }
    v15->_metricNonUserSeconds = v26 + v15->_metricNonUserSeconds;
    v15->_startTicks = mach_absolute_time();
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v15->_promptForRoomHandler
      && v15->_promptForRoomHandlerDetailed
      && gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v27 = objc_msgSend(v4, "count", *(_QWORD *)&v39);
    v28 = v27;
    if (v15->_promptForRoomHandlerDetailed)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v30 = v46;
      }
      else
      {
        v30 = v46;
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          v40 = v46;
          LogPrintF();
        }
        if (v46)
          v32 = objc_msgSend(v47, "indexOfObject:", v46);
        else
          v32 = 0;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v32, 1, v40);
        v33 = objc_claimAutoreleasedReturnValue();

        v29 = (void *)v33;
        v15 = v45;
      }
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        v41 = v47;
        v42 = v29;
        v40 = v4;
        LogPrintF();
      }
      promptForRoomHandlerDetailed = (void (**)(id, void *, id, id, void *))v15->_promptForRoomHandlerDetailed;
      -[HMHome name](v43, "name", v40, v41, v42);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      promptForRoomHandlerDetailed[2](promptForRoomHandlerDetailed, v35, v4, v47, v29);

    }
    else
    {
      if (v27)
      {
        v31 = 0;
        v30 = v46;
      }
      else
      {
        v30 = v46;
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v46)
          v31 = objc_msgSend(v21, "indexOfObject:", v46);
        else
          v31 = 0;
      }
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      promptForRoomHandler = (void (**)(id, void *, uint64_t))v15->_promptForRoomHandler;
      if (promptForRoomHandler)
        promptForRoomHandler[2](promptForRoomHandler, v21, v31);
    }

    goto LABEL_80;
  }
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[HMHome roomForEntireHome](v3, "roomForEntireHome");
  v36 = (HMRoom *)objc_claimAutoreleasedReturnValue();
  homeKitSelectedRoom = self->_homeKitSelectedRoom;
  self->_homeKitSelectedRoom = v36;

  if (!self->_homeKitSelectedRoom)
  {
    NSErrorWithOSStatusF();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v4, CFSTR("HDS-HK-RoomSelection"));
LABEL_80:

  }
}

BOOL __55__HDSDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  v5 = objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32));
  if (!v5)
    *a4 = 1;
  return v5 == 0;
}

- (void)_runHomeKitAddAccessory
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  HMAccessory *v12;
  void *v13;
  HMAccessory *v14;
  HMAccessory *homeKitAccessory;
  HMHome *homeKitSelectedHome;
  HMAccessory *v17;
  uint64_t v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  self->_state = 28;
  -[HMAccessory uniqueIdentifier](self->_homeKitAccessory, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMHome accessories](self->_homeKitSelectedHome, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", v3);

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_14;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitAccessory = self->_homeKitAccessory;
    self->_homeKitAccessory = v12;
    v14 = v12;

    self->_homeKitAddedAccessory = 1;
  }
  else
  {
LABEL_9:

LABEL_14:
    self->_startTicksForHomeKitSteps = mach_absolute_time();
    -[HDSDeviceOperationHomeKitSetup pairedPeer](self, "pairedPeer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (HMAccessory *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HMAccessory setPeerIdentifier:](self->_homeKitAccessory, "setPeerIdentifier:", v14, v14);
      }
      else
      {
        -[HMAccessory setPeerIdentifier:](self->_homeKitAccessory, "setPeerIdentifier:", v14, v18);
      }
    }
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitSelectedHome = self->_homeKitSelectedHome;
    v17 = self->_homeKitAccessory;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __57__HDSDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke;
    v19[3] = &unk_24FCD4138;
    v19[4] = self;
    -[HMHome addAccessory:completionHandler:](homeKitSelectedHome, "addAccessory:completionHandler:", v17, v19);
  }

}

void __57__HDSDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 232);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HDSDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke_2;
  v7[3] = &unk_24FCD4290;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __57__HDSDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  mach_absolute_time();
  result = UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) = v3;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
      result = LogPrintF();
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "stopSearchingForNewAccessories", v7);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = 0;

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      return objc_msgSend(*(id *)(a1 + 32), "_completeWithError:errorLabel:", v6, CFSTR("HDS-HK-AddAccessory"));
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 196) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_updateAccount");
      return objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
  return result;
}

- (void)_runHomeKitSetupRoom:(BOOL)a3
{
  HMRoom *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSString *v14;
  HMRoom *homeKitSelectedRoom;
  void *v16;
  HMHome *homeKitSelectedHome;
  NSString *homeKitSelectedRoomName;
  _QWORD v19[5];
  BOOL v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = self->_homeKitSelectedRoom;
  if (v5)
  {
LABEL_2:
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitSelectedRoom = self->_homeKitSelectedRoom;
    self->_homeKitSelectedRoom = v5;
    v14 = v5;

    self->_state = 31;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[HMHome rooms](self->_homeKitSelectedHome, "rooms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
LABEL_7:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", self->_homeKitSelectedRoomName);

        if ((v13 & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v8)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v5 = v11;

      if (v5)
        goto LABEL_2;
    }
    else
    {
LABEL_13:

    }
    v14 = self->_homeKitSelectedRoomName;
    if (v14)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
        LogPrintF();
      }
      self->_state = 30;
      homeKitSelectedHome = self->_homeKitSelectedHome;
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke;
      v19[3] = &unk_24FCD4380;
      v19[4] = self;
      v20 = a3;
      -[HMHome addRoomWithName:completionHandler:](homeKitSelectedHome, "addRoomWithName:completionHandler:", v14, v19, homeKitSelectedRoomName);
    }
    else
    {
      NSErrorWithOSStatusF();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v16, CFSTR("HDS-HK-NoRoomName"));

    }
  }

}

void __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 232);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_2;
  v11[3] = &unk_24FCD4358;
  v11[4] = v7;
  v12 = v6;
  v13 = v5;
  v14 = *(_BYTE *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    v3 = *(void **)(a1 + 40);
    if (v3 || (v6 = *(void **)(a1 + 48)) == 0)
    {
      if (objc_msgSend(v3, "code") == 1 && !*(_BYTE *)(a1 + 56))
      {
        v7 = dispatch_time(0, 2000000000);
        v8 = *(void **)(a1 + 40);
        v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_3;
        block[3] = &unk_24FCD4290;
        v10 = v8;
        v11 = *(_QWORD *)(a1 + 32);
        v14 = v10;
        v15 = v11;
        dispatch_after(v7, v9, block);

      }
      else
      {
        v5 = *(void **)(a1 + 32);
        v4 = *(_QWORD *)(a1 + 40);
        if (v4)
        {
          objc_msgSend(*(id *)(a1 + 32), "_completeWithError:errorLabel:", v4, CFSTR("HDS-HK-AddRoomWithName"));
        }
        else
        {
          NSErrorWithOSStatusF();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "_completeWithError:errorLabel:", v12, CFSTR("HDS-HK-AddRoomWithName"));

        }
      }
    }
    else
    {
      objc_storeStrong((id *)(v1 + 120), v6);
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = 31;
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
}

uint64_t __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_3(uint64_t a1)
{
  uint64_t v3;

  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    v3 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "_runHomeKitSetupRoom:", 1, v3);
  return objc_msgSend(*(id *)(a1 + 40), "_run");
}

- (void)_runHomeKitAssignRoom
{
  HMHome *homeKitSelectedHome;
  HMAccessory *homeKitAccessory;
  HMRoom *homeKitSelectedRoom;
  void *v6;
  _QWORD v7[5];

  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    -[HMRoom name](self->_homeKitSelectedRoom, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  self->_state = 32;
  self->_startTicksForHomeKitSteps = mach_absolute_time();
  homeKitSelectedHome = self->_homeKitSelectedHome;
  homeKitAccessory = self->_homeKitAccessory;
  homeKitSelectedRoom = self->_homeKitSelectedRoom;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke;
  v7[3] = &unk_24FCD4138;
  v7[4] = self;
  -[HMHome assignAccessory:toRoom:completionHandler:](homeKitSelectedHome, "assignAccessory:toRoom:completionHandler:", homeKitAccessory, homeKitSelectedRoom, v7);
}

void __55__HDSDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 232);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke_2;
  v7[3] = &unk_24FCD4290;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

_BYTE *__55__HDSDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BYTE *result;
  uint64_t v4;

  mach_absolute_time();
  UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312) = v2;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = *(_BYTE **)(a1 + 32);
  if (result[8])
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      return (_BYTE *)objc_msgSend(result, "_completeWithError:errorLabel:", v4, CFSTR("HDS-HK-AssignRoom"));
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = 33;
      return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
  return result;
}

- (void)_runHomeKitAddAppData
{
  HMAccessory *homeKitAccessory;
  void *v4;
  uint64_t v5;
  NSDictionary *appDataSelf;
  id v7;
  HMAccessory *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  homeKitAccessory = self->_homeKitAccessory;
  if (homeKitAccessory)
  {
    -[HMAccessory applicationData](homeKitAccessory, "applicationData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    appDataSelf = self->_appDataSelf;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke;
    v11[3] = &unk_24FCD43A8;
    v12 = v4;
    v7 = v4;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](appDataSelf, "enumerateKeysAndObjectsUsingBlock:", v11);
    v8 = self->_homeKitAccessory;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_2;
    v10[3] = &unk_24FCD4138;
    v10[4] = self;
    -[HMAccessory updateApplicationData:completionHandler:](v8, "updateApplicationData:completionHandler:", v7, v10);

  }
  else
  {
    NSErrorWithOSStatusF();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v9, CFSTR("HDS-HK-AppData-NoHKAccessory"));

  }
}

uint64_t __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 232);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_3;
  v7[3] = &unk_24FCD4290;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 40);
    if (v2)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
          || (v3 = _LogCategory_Initialize(), v2 = *(_QWORD *)(v1 + 40), v3))
        {
          LogPrintF();
          v2 = *(_QWORD *)(v1 + 40);
        }
      }
      return objc_msgSend(*(id *)(v1 + 32), "_completeWithError:errorLabel:", v2, CFSTR("HDS-HK-AddAppData"));
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(*(_QWORD *)(v1 + 32) + 128) = 1;
      return objc_msgSend(*(id *)(v1 + 32), "_run");
    }
  }
  return result;
}

- (BOOL)_runHomeKitConfigureStereoPairAndReturnError:(id *)a3
{
  HMAccessory *v5;
  Class HMMediaSystemBuilderClass;
  HMAccessory *homeKitAccessory;
  void *v8;
  HMHome *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  int stereoRole;
  Class HMMediaSystemRoleClass;
  BOOL v16;
  uint64_t v18;
  int v19;
  Class v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v5 = self->_stereoCounterpart;
  if (!v5 || (self->_stereoRole & 0xFFFFFFFE) != 2)
    goto LABEL_19;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_homeKitAccessory)
  {
    if (a3)
      goto LABEL_18;
    goto LABEL_19;
  }
  HMMediaSystemBuilderClass = getHMMediaSystemBuilderClass();
  homeKitAccessory = self->_homeKitAccessory;
  v32[0] = v5;
  v32[1] = homeKitAccessory;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(HMMediaSystemBuilderClass) = -[objc_class isStereoPairingSupportedForAccessories:](HMMediaSystemBuilderClass, "isStereoPairingSupportedForAccessories:", v8);

  if ((HMMediaSystemBuilderClass & 1) == 0)
  {
    if (a3)
    {
LABEL_18:
      NSErrorWithOSStatusF();
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_19:
    v16 = 0;
    goto LABEL_20;
  }
  v9 = self->_homeKitSelectedHome;
  if (v9)
  {
    v10 = self->_homeKitSelectedRoomName;
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(getHMMediaSystemBuilderClass()), "initWithHome:", v9);
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "setName:", v10);
        -[HMAccessory mediaProfile](self->_homeKitAccessory, "mediaProfile");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          stereoRole = self->_stereoRole;
          HMMediaSystemRoleClass = getHMMediaSystemRoleClass();
          if (stereoRole == 2)
            -[objc_class leftRole](HMMediaSystemRoleClass, "leftRole");
          else
            -[objc_class rightRole](HMMediaSystemRoleClass, "rightRole");
          v18 = objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(objc_alloc(getHMMediaSystemComponentClass()), "initWithMediaProfile:role:", v13, v18);
          v28 = (void *)v18;
          if (v27)
          {
            -[HMAccessory mediaProfile](v5, "mediaProfile");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v19 = self->_stereoRole;
              v20 = getHMMediaSystemRoleClass();
              if (v19 == 2)
                -[objc_class rightRole](v20, "rightRole");
              else
                -[objc_class leftRole](v20, "leftRole");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(objc_alloc(getHMMediaSystemComponentClass()), "initWithMediaProfile:role:", v26, v24);
              v16 = v21 != 0;
              v25 = (void *)v21;
              if (v21)
              {
                self->_stereoPairStartTicks = mach_absolute_time();
                if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
                v22 = (void *)v27;
                v31[0] = v27;
                v31[1] = v25;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setComponents:", v23);

                v29[0] = MEMORY[0x24BDAC760];
                v29[1] = 3221225472;
                v29[2] = __79__HDSDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke;
                v29[3] = &unk_24FCD43F8;
                v29[4] = self;
                v30 = v12;
                objc_msgSend(v30, "commitWithCompletionHandler:", v29);

              }
              else
              {
                v22 = (void *)v27;
                if (a3)
                {
                  NSErrorWithOSStatusF();
                  *a3 = (id)objc_claimAutoreleasedReturnValue();
                }
              }

            }
            else
            {
              if (a3)
              {
                NSErrorWithOSStatusF();
                v16 = 0;
                *a3 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v16 = 0;
              }
              v22 = (void *)v27;
            }

          }
          else
          {
            if (a3)
            {
              NSErrorWithOSStatusF();
              v16 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v16 = 0;
            }
            v22 = 0;
          }

        }
        else if (a3)
        {
          NSErrorWithOSStatusF();
          v16 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }

      }
      else if (a3)
      {
        NSErrorWithOSStatusF();
        v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }

    }
    else if (a3)
    {
      NSErrorWithOSStatusF();
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else if (a3)
  {
    NSErrorWithOSStatusF();
    v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

LABEL_20:
  return v16;
}

void __79__HDSDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344) = v7;
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __79__HDSDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke_2;
    v11[3] = &unk_24FCD43D0;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    v14 = v6;
    v15 = *(id *)(a1 + 40);
    dispatch_async(v8, v11);

  }
}

void __79__HDSDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
        || (v5 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v5))
      {
        LogPrintF();
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_completeWithError:errorLabel:", v2, CFSTR("HDS-HK-StereoPair"));
    return;
  }
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_15;
        v3 = *(void **)(a1 + 48);
      }
      objc_msgSend(v3, "uniqueIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
LABEL_15:
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 129) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 136), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_run");
    return;
  }
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = *(void **)(a1 + 40);
  NSErrorWithOSStatusF();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_completeWithError:errorLabel:", v8, CFSTR("HDS-HK-StereoPair-NoMediaSystem"));

}

- (void)_runHomeKitUpdateAppleTVAudioDestination
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  self->_odeonStartTicks = mach_absolute_time();
  -[HMAccessory audioDestinationController](self->_tvAudioInput, "audioDestinationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 136;
    if (!self->_configuredStereoPair)
      v4 = 104;
    v5 = *(id *)((char *)&self->super.isa + v4);
    if (v5)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __74__HDSDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke;
      v7[3] = &unk_24FCD4160;
      v7[4] = self;
      v8 = v3;
      objc_msgSend(v8, "updateDestination:options:completionHandler:", v5, 2, v7);

    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 115
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      NSErrorWithOSStatusF();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v6, CFSTR("HDS-HK-NoAudioDestination"));

    }
  }
  else
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 115
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v5, CFSTR("HDS-HK-Odeon-NoAudioDestinationController"));
  }

}

void __74__HDSDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  mach_absolute_time();
  UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) = v4;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 8))
  {
    v6 = *(NSObject **)(v5 + 232);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__HDSDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke_2;
    block[3] = &unk_24FCD42E0;
    block[4] = v5;
    v8 = v3;
    v9 = *(id *)(a1 + 40);
    dispatch_async(v6, block);

  }
}

uint64_t __74__HDSDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v6;

  mach_absolute_time();
  UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) = v2;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 60)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
        || (v4 = _LogCategory_Initialize(), v3 = *(_QWORD *)(a1 + 40), v4))
      {
        LogPrintF();
        v3 = *(_QWORD *)(a1 + 40);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_completeWithError:errorLabel:", v3, CFSTR("HDS-HK-Odeon"));
  }
  else
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "_run");
  }
}

- (id)_homeKitFindSettingsWithKeyPath:(id)a3 group:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "keyPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v6);

        if ((v15 & 1) != 0)
        {
          v20 = v13;
          goto LABEL_19;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v10)
        continue;
      break;
    }
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "groups", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
LABEL_11:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v18)
        objc_enumerationMutation(v8);
      -[HDSDeviceOperationHomeKitSetup _homeKitFindSettingsWithKeyPath:group:](self, "_homeKitFindSettingsWithKeyPath:group:", v6, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20)
        break;
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v17)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_19:
    v21 = v20;
  }
  else
  {
LABEL_17:
    v21 = 0;
  }

  return v21;
}

- (void)_runUpdateUserListeningHistoryStart
{
  HMAccessory *v3;
  HMHome *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];

  v3 = self->_homeKitAccessory;
  if (v3)
  {
    v4 = self->_homeKitSelectedHome;
    -[HMHome owner](self->_homeKitSelectedHome, "owner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HMHome owner](v4, "owner");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userSettingsForHome:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "settings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "rootGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSDeviceOperationHomeKitSetup _homeKitFindSettingsWithKeyPath:group:](self, "_homeKitFindSettingsWithKeyPath:group:", CFSTR("root.siri.identifyVoice"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10
        && (objc_msgSend(v10, "value"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "BOOLValue"),
            v11,
            (v12 & 1) != 0))
      {
        objc_msgSend(v5, "userListeningHistoryUpdateControlForHome:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");
        if (v14)
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          objc_msgSend(v14, "addAccessory:", v3);
          v16 = mach_absolute_time();
          v17 = MEMORY[0x24BDAC760];
          self->_startTicksForHomeKitSteps = v16;
          v18[0] = v17;
          v18[1] = 3221225472;
          v18[2] = __69__HDSDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke;
          v18[3] = &unk_24FCD4138;
          v18[4] = self;
          objc_msgSend(v5, "updateUserListeningHistoryUpdateControl:forHome:completionHandler:", v14, v4, v18);
        }
        else
        {
          NSErrorWithOSStatusF();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v15, CFSTR("HDS-HK-ULH-CreateAccessFail"));

        }
      }
      else
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 50
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_userListeningHistoryDone = 1;
      }

    }
    else
    {
      NSErrorWithOSStatusF();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v8, CFSTR("HDS-HK-NotOwner"));
    }

  }
  else
  {
    NSErrorWithOSStatusF();
    v4 = (HMHome *)objc_claimAutoreleasedReturnValue();
    -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v4, CFSTR("NoAccessory"));
  }

}

void __69__HDSDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 232);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__HDSDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke_2;
  v7[3] = &unk_24FCD4290;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __69__HDSDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int v5;

  mach_absolute_time();
  result = UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = v3;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
          || (v5 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 40), v5))
        {
          LogPrintF();
          v4 = *(_QWORD *)(a1 + 40);
        }
      }
      return objc_msgSend(*(id *)(a1 + 32), "_completeWithError:errorLabel:", v4, CFSTR("HDS-HK-ULH-UpdateAccessControlFailed"));
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 1;
      return objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
  return result;
}

- (void)_runPersonalRequestsStart
{
  HMHome *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  HMHome *v25;
  id obj;
  HMAccessory *v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (self->_personalRequestsEnabled)
  {
    v27 = self->_homeKitAccessory;
    if (v27)
    {
      v3 = self->_homeKitSelectedHome;
      -[HMHome owner](self->_homeKitSelectedHome, "owner");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        objc_msgSend(v4, "assistantAccessControlForHome:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v6, "mutableCopy");
        if (v7)
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          objc_msgSend(v7, "setEnabled:", 1);
          if (_os_feature_enabled_impl())
          {
            v22 = v7;
            v23 = v6;
            v24 = v5;
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v25 = v3;
            -[HMHome accessories](v3, "accessories");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v30 != v13)
                    objc_enumerationMutation(obj);
                  v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                  objc_msgSend(v15, "category");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "categoryType");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  getHMAccessoryCategoryTypeHomePod();
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) != 0)
                  {
                    objc_msgSend(v15, "uniqueIdentifier");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMAccessory uniqueIdentifier](v27, "uniqueIdentifier");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v19, "isEqual:", v20);

                    if (!v21)
                    {

                      v5 = v24;
                      v3 = v25;
                      v7 = v22;
                      v6 = v23;
                      goto LABEL_34;
                    }
                  }
                  else
                  {

                  }
                }
                v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
              }
              while (v12);
            }

            if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
              && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            v7 = v22;
            objc_msgSend(v22, "setAllowUnauthenticatedRequests:", 1);
            v5 = v24;
            v3 = v25;
            v6 = v23;
          }
LABEL_34:
          self->_startTicksForHomeKitSteps = mach_absolute_time();
          objc_msgSend(v7, "addAccessory:", v27);
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = __59__HDSDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke;
          v28[3] = &unk_24FCD4138;
          v28[4] = self;
          objc_msgSend(v5, "updateAssistantAccessControl:forHome:completionHandler:", v7, v3, v28);
        }
        else
        {
          NSErrorWithOSStatusF();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v10, CFSTR("HDS-HK-PR-CreateAccessFail"));

        }
      }
      else
      {
        NSErrorWithOSStatusF();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v9, CFSTR("HDS-HK-NotOwner"));

      }
    }
    else
    {
      NSErrorWithOSStatusF();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSDeviceOperationHomeKitSetup _completeWithError:errorLabel:](self, "_completeWithError:errorLabel:", v8, CFSTR("HDS-HK-NoAccessory"));

    }
  }
  else
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_personalRequestsDone = 1;
  }
}

void __59__HDSDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 232);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HDSDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke_2;
  v7[3] = &unk_24FCD4290;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __59__HDSDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int v5;

  mach_absolute_time();
  result = UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320) = v3;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
          || (v5 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 40), v5))
        {
          LogPrintF();
          v4 = *(_QWORD *)(a1 + 40);
        }
      }
      return objc_msgSend(*(id *)(a1 + 32), "_completeWithError:errorLabel:", v4, CFSTR("HDS-HK-PR-UpdateAccessControlFailed"));
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 1;
      return objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
  return result;
}

- (void)homeManagerDidUpdateDataSyncState:(id)a3
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
  v7[2] = __68__HDSDeviceOperationHomeKitSetup_homeManagerDidUpdateDataSyncState___block_invoke;
  v7[3] = &unk_24FCD4290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __68__HDSDeviceOperationHomeKitSetup_homeManagerDidUpdateDataSyncState___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(v1 + 40), "dataSyncState");
      LogPrintF();
    }
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HDSDeviceOperationHomeKitSetup_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __60__HDSDeviceOperationHomeKitSetup_homeManagerDidUpdateHomes___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 197) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__HDSDeviceOperationHomeKitSetup_homeManager_didUpdateStatus___block_invoke;
  v5[3] = &unk_24FCD42B8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __62__HDSDeviceOperationHomeKitSetup_homeManager_didUpdateStatus___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (void)addHomePodsToAccessorySync:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *homePodsAccessorySyncing;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  homePodsAccessorySyncing = self->_homePodsAccessorySyncing;
  self->_homePodsAccessorySyncing = v5;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "remoteLoginHandler", v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "loggedInAccount");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            v19 = v12;
            LogPrintF();
          }
          objc_msgSend(v12, "setDelegate:", self, v19);
          v17 = self->_homePodsAccessorySyncing;
          objc_msgSend(v12, "uniqueIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "UUIDString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setValue:forKey:](v17, "setValue:forKey:", v12, v16);
          goto LABEL_17;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v12, "remoteLoginHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "loggedInAccount");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v16;
          LogPrintF();
LABEL_17:

          continue;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  if (-[NSMutableDictionary count](self->_homePodsAccessorySyncing, "count"))
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HDSDeviceOperationHomeKitSetup _timeoutForAccessorySync](self, "_timeoutForAccessorySync", v19);
  }
  else
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v18 = self->_homePodsAccessorySyncing;
    self->_homePodsAccessorySyncing = 0;

    self->_accessorySyncDone = 1;
    self->_state = 23;
    -[HDSDeviceOperationHomeKitSetup _run](self, "_run");
  }

}

- (id)findStereoCounterpartsWithSupportedVersions:(unint64_t)a3
{
  HMRoom *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  HMRoom *v9;
  uint64_t v10;
  HMRoom *i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  char v42;
  void *v44;
  void *v45;
  uint64_t v46;
  HMRoom *v47;
  id v48;
  unint64_t v49;
  void *v50;
  HDSDeviceOperationHomeKitSetup *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = self->_homeKitSelectedRoom;
  if (v5)
    goto LABEL_2;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[HMHome rooms](self->_homeKitSelectedHome, "rooms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (HMRoom *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (!v9)
    goto LABEL_87;
  v10 = *(_QWORD *)v57;
  do
  {
    for (i = 0; i != v9; i = (HMRoom *)((char *)i + 1))
    {
      if (*(_QWORD *)v57 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", self->_homeKitSelectedRoomName);

      if ((v14 & 1) != 0)
      {
        v9 = v12;

        v5 = v9;
        if (!v9)
          return v9;
LABEL_2:
        v6 = self->_iTunesAccountID;
        if (v6)
        {
          v7 = v6;
          SFNormalizeEmailAddress(v6, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v50 = 0;
        }
        v51 = self;
        v47 = v5;
        v48 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        -[HMRoom accessories](v5, "accessories");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        if (!v16)
        {
LABEL_86:

          v9 = (HMRoom *)objc_msgSend(v48, "copy");
          v8 = v47;
          goto LABEL_87;
        }
        v17 = v16;
        v18 = *(_QWORD *)v53;
        v49 = a3;
        while (2)
        {
          v19 = 0;
LABEL_17:
          if (*(_QWORD *)v53 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v19);
          objc_msgSend(v20, "category", v44, v46);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "categoryType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          getHMAccessoryCategoryTypeHomePod();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqual:", v23);

          if (v24)
          {
            -[HDSDeviceOperationHomeKitSetup _mediaSystemForAccessory:](v51, "_mediaSystemForAccessory:", v20);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                goto LABEL_23;
              }
              goto LABEL_83;
            }
            if ((objc_msgSend(v20, "supportedStereoPairVersions") & a3) == 0)
            {
              if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                v44 = (void *)a3;
                v46 = objc_msgSend(v20, "supportedStereoPairVersions");
                goto LABEL_23;
              }
              goto LABEL_83;
            }
            if ((-[objc_class supportsMediaSystem:](getHMMediaSystemBuilderClass(), "supportsMediaSystem:", v20) & 1) != 0)
            {
              objc_msgSend(v20, "remoteLoginHandler");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "loggedInAccount");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "username");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "remoteLoginHandler");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
              {
                if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  objc_msgSend(v20, "remoteLoginHandler");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  LogPrintF();

                }
              }
              else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                     && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              objc_msgSend(v20, "remoteLoginHandler", v44);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "loggedInAccount");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  objc_msgSend(v20, "remoteLoginHandler");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "loggedInAccount");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  LogPrintF();

                }
              }
              else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                     && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              objc_msgSend(v20, "remoteLoginHandler", v45);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "loggedInAccount");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "username");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  objc_msgSend(v20, "remoteLoginHandler");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "loggedInAccount");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "username");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  LogPrintF();

                }
              }
              else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                     && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              if (v28)
              {
                SFNormalizeEmailAddress(v28, 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v38 = 0;
              }
              v39 = v38;
              v40 = v50;
              v41 = v40;
              if (v39 == v40)
              {

              }
              else
              {
                if ((v50 != 0) == (v39 == 0))
                {

                  goto LABEL_78;
                }
                v42 = objc_msgSend(v39, "isEqual:", v40);

                if ((v42 & 1) == 0)
                {
LABEL_78:
                  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                  {
                    v44 = v41;
                    v46 = (uint64_t)v39;
                    LogPrintF();
                  }
                  goto LABEL_82;
                }
              }
              objc_msgSend(v48, "addObject:", v20, v44);
LABEL_82:

              a3 = v49;
              goto LABEL_83;
            }
            if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
              && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            {
LABEL_23:
              LogPrintF();
            }
LABEL_83:

          }
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            if (!v17)
              goto LABEL_86;
            continue;
          }
          goto LABEL_17;
        }
      }
    }
    v9 = (HMRoom *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  }
  while (v9);
LABEL_87:

  return v9;
}

- (id)findTVs
{
  HMRoom *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  HMRoom *v26;
  void *v27;
  HMRoom *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = self->_homeKitSelectedRoom;
  if (v3)
  {
LABEL_2:
    v28 = v3;
    v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[HMRoom accessories](v3, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v31;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v31 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
          objc_msgSend(v9, "category", v27);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "categoryType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          getHMAccessoryCategoryTypeAppleTV();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (v13)
          {
            objc_msgSend(v9, "audioDestinationController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v9, "audioDestinationController");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "destination");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  v27 = v9;
                  LogPrintF();
                }
              }
              else
              {
                objc_msgSend(v29, "addObject:", v9);
              }

            }
            else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                   && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            {
              v27 = v9;
              LogPrintF();
            }
          }
          ++v8;
        }
        while (v6 != v8);
        v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        v6 = v17;
      }
      while (v17);
    }

    v18 = (void *)objc_msgSend(v29, "copy");
    v19 = v28;
    goto LABEL_25;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HMHome rooms](self->_homeKitSelectedHome, "rooms");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v18)
  {
LABEL_25:

    return v18;
  }
  v21 = *(_QWORD *)v35;
LABEL_28:
  v22 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v21)
      objc_enumerationMutation(v19);
    v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v22);
    objc_msgSend(v23, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqual:", self->_homeKitSelectedRoomName);

    if ((v25 & 1) != 0)
      break;
    if (v18 == (void *)++v22)
    {
      v18 = (void *)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v18)
        goto LABEL_28;
      goto LABEL_25;
    }
  }
  v26 = v23;

  v3 = v26;
  if (v26)
    goto LABEL_2;
  return 0;
}

- (id)homePodsInHomeRoom:(id)a3 roomName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v21 = (id)objc_opt_new();
  if (v5 && v6)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = v5;
    objc_msgSend(v5, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "room");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "category");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "categoryType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "isEqualToString:", v6))
          {
            getHMAccessoryCategoryTypeHomePod();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqualToString:", v17);

            if (v18)
              objc_msgSend(v21, "addObject:", v12);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v5 = v20;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  return v21;
}

- (BOOL)_isOwnerOfHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "homeAccessControlForUser:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isOwner");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_mediaSystemForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v5, "mediaSystems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v7 = *(_QWORD *)v30;
    v21 = v5;
    v22 = v3;
    v24 = v6;
    v20 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v9, "components");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "mediaProfile");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "accessory");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "uniqueIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v17, "isEqual:", v4) & 1) != 0)
              {
                v18 = v9;

                v5 = v21;
                v3 = v22;
                v6 = v24;
                goto LABEL_19;
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v12)
              continue;
            break;
          }
        }

        v6 = v24;
        v7 = v20;
      }
      v18 = 0;
      v5 = v21;
      v3 = v22;
      v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)_normalizedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[ ]+"), CFSTR(" "), 1024, 0, objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_removeSimilarRoomNames:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  const char *v50;
  void *v51;
  id v52;
  unint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v54 = a4;
  objc_msgSend(v54, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v6, "count");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v51 = v8;
      v52 = v6;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDSDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "caseInsensitiveCompare:", v8))
        {
          v53 = v10;
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          objc_msgSend(v54, "actionSets");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v68;
LABEL_7:
            v18 = 0;
            while (1)
            {
              if (*(_QWORD *)v68 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v18);
              objc_msgSend(v19, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDSDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                if (!objc_msgSend(v13, "caseInsensitiveCompare:", v21))
                  break;
              }

              if (v16 == ++v18)
              {
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
                if (v16)
                  goto LABEL_7;
                goto LABEL_14;
              }
            }
            objc_msgSend(v19, "name");
            v22 = (id)objc_claimAutoreleasedReturnValue();

            if (!v22)
              goto LABEL_18;
            v23 = "ActionSet";
          }
          else
          {
LABEL_14:

LABEL_18:
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            objc_msgSend(v54, "serviceGroups");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v64;
LABEL_20:
              v28 = 0;
              while (1)
              {
                if (*(_QWORD *)v64 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v28);
                objc_msgSend(v29, "name");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDSDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (v31)
                {
                  if (!objc_msgSend(v13, "caseInsensitiveCompare:", v31))
                    break;
                }

                if (v26 == ++v28)
                {
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
                  if (v26)
                    goto LABEL_20;
                  goto LABEL_27;
                }
              }
              objc_msgSend(v29, "name");
              v22 = (id)objc_claimAutoreleasedReturnValue();

              if (!v22)
                goto LABEL_30;
              v23 = "ServiceGroup";
            }
            else
            {
LABEL_27:

LABEL_30:
              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              objc_msgSend(v54, "triggers");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v60;
LABEL_32:
                v36 = 0;
                while (1)
                {
                  if (*(_QWORD *)v60 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v36);
                  objc_msgSend(v37, "name");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HDSDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v39)
                  {
                    if (!objc_msgSend(v13, "caseInsensitiveCompare:", v39))
                      break;
                  }

                  if (v34 == ++v36)
                  {
                    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                    if (v34)
                      goto LABEL_32;
                    goto LABEL_39;
                  }
                }
                objc_msgSend(v37, "name");
                v22 = (id)objc_claimAutoreleasedReturnValue();

                if (!v22)
                  goto LABEL_42;
                v23 = "Trigger";
              }
              else
              {
LABEL_39:

LABEL_42:
                v57 = 0u;
                v58 = 0u;
                v55 = 0u;
                v56 = 0u;
                objc_msgSend(v54, "zones");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
                if (!v41)
                {
LABEL_51:

LABEL_62:
                  ++v11;
                  v8 = v51;
                  v6 = v52;
                  v10 = v53;
                  goto LABEL_60;
                }
                v42 = v41;
                v43 = *(_QWORD *)v56;
LABEL_44:
                v44 = 0;
                while (1)
                {
                  if (*(_QWORD *)v56 != v43)
                    objc_enumerationMutation(v40);
                  v45 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v44);
                  objc_msgSend(v45, "name");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HDSDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v46);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v47)
                  {
                    if (!objc_msgSend(v13, "caseInsensitiveCompare:", v47))
                      break;
                  }

                  if (v42 == ++v44)
                  {
                    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
                    if (v42)
                      goto LABEL_44;
                    goto LABEL_51;
                  }
                }
                objc_msgSend(v45, "name");
                v22 = (id)objc_claimAutoreleasedReturnValue();

                if (!v22)
                  goto LABEL_62;
                v23 = "Zone";
              }
            }
          }
          v8 = v51;
          v6 = v52;
          v10 = v53;
        }
        else
        {
          v22 = v8;
          v23 = "Home";
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          v49 = v22;
          v50 = v23;
          v48 = v13;
          LogPrintF();
        }
        objc_msgSend(v6, "removeObjectAtIndex:", v11, v48, v49, v50);
        --v10;

LABEL_60:
      }
      while (v11 < v10);
    }
  }

}

- (void)_syncAccessoriesInSelectedRoom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    -[HDSDeviceOperationHomeKitSetup homeKitSelectedHome](self, "homeKitSelectedHome");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSDeviceOperationHomeKitSetup homeKitSelectedRoomName](self, "homeKitSelectedRoomName");
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  -[HDSDeviceOperationHomeKitSetup homeKitSelectedHome](self, "homeKitSelectedHome", v7, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSDeviceOperationHomeKitSetup homeKitSelectedRoomName](self, "homeKitSelectedRoomName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSDeviceOperationHomeKitSetup homePodsInHomeRoom:roomName:](self, "homePodsInHomeRoom:roomName:", v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HDSDeviceOperationHomeKitSetup addHomePodsToAccessorySync:](self, "addHomePodsToAccessorySync:", v9);
}

- (void)_restoreHomeApp
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = (void *)objc_msgSend(objc_alloc(getASDSystemAppRequestClass()), "initWithBundleID:", CFSTR("com.apple.Home"));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__HDSDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke;
  v5[3] = &unk_24FCD4160;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "startWithErrorHandler:", v5);

}

void __49__HDSDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__HDSDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke_2;
  v7[3] = &unk_24FCD4290;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __49__HDSDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
         && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 40), "bundleID");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

- (void)_timeoutForAccessorySync
{
  dispatch_time_t v3;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v3 = dispatch_time(0, 30000000000);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HDSDeviceOperationHomeKitSetup__timeoutForAccessorySync__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_after(v3, dispatchQueue, block);
}

uint64_t __58__HDSDeviceOperationHomeKitSetup__timeoutForAccessorySync__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 184))
  {
    v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 192) = 1;
    v2 = *(_QWORD *)(v1 + 32);
    v3 = *(void **)(v2 + 184);
    *(_QWORD *)(v2 + 184) = 0;

    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 48) = 23;
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (void)_updateHomeStats
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMHome accessories](self->_homeKitSelectedHome, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "category");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "categoryType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        getHMAccessoryCategoryTypeHomePod();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
        {
          self->_hasHomePod = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    if (self->_hasHomePod)
      v12 = "yes";
    else
      v12 = "no";
    v15 = v12;
    LogPrintF();
  }
  -[HMHome users](self->_homeKitSelectedHome, "users", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  self->_hasMultipleUsers = v14 != 0;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_updateAccount
{
  void *v3;
  ACAccount *v4;
  void *v5;
  _QWORD v6[4];
  ACAccount *v7;
  id v8;

  -[HMAccessory remoteLoginHandler](self->_homeKitAccessory, "remoteLoginHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = self->_iTunesAccount;
    if (v4)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        -[ACAccount username](v4, "username");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __48__HDSDeviceOperationHomeKitSetup__updateAccount__block_invoke;
      v6[3] = &unk_24FCD4160;
      v7 = v4;
      v8 = v3;
      objc_msgSend(v8, "updateLoggedInAccount:completionHandler:", v7, v6);

    }
    else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
           && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90
         && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __48__HDSDeviceOperationHomeKitSetup__updateAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90)
    {
      v10 = v3;
      if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (v7 = _LogCategory_Initialize(), v4 = v10, v7))
      {
        objc_msgSend(*(id *)(a1 + 32), "username");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
LABEL_8:

        v4 = v10;
      }
    }
  }
  else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    v10 = 0;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (v8 = _LogCategory_Initialize(), v4 = 0, v8))
    {
      objc_msgSend(*(id *)(a1 + 32), "username");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "loggedInAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "username");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      goto LABEL_8;
    }
  }

}

- (void)accessory:(id)a3 didUpdateLoggedInAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  _QWORD block[5];
  id v10;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_homePodsAccessorySyncing)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__HDSDeviceOperationHomeKitSetup_accessory_didUpdateLoggedInAccount___block_invoke;
    block[3] = &unk_24FCD4290;
    block[4] = self;
    v10 = v6;
    dispatch_async(dispatchQueue, block);

  }
}

void __69__HDSDeviceOperationHomeKitSetup_accessory_didUpdateLoggedInAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      v10 = v11;
      LogPrintF();
    }
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
    objc_msgSend(v11, "uniqueIdentifier", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v7);

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count"))
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 184);
    *(_QWORD *)(v8 + 184) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 192) = 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = 23;
    objc_msgSend(*(id *)(a1 + 32), "_run");
  }

}

- (NSDictionary)appDataSelf
{
  return self->_appDataSelf;
}

- (void)setAppDataSelf:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (HMAccessory)tvAudioInput
{
  return self->_tvAudioInput;
}

- (void)setTvAudioInput:(id)a3
{
  objc_storeStrong((id *)&self->_tvAudioInput, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)userInteractive
{
  return self->_userInteractive;
}

- (void)setUserInteractive:(BOOL)a3
{
  self->_userInteractive = a3;
}

- (BOOL)hasHomePod
{
  return self->_hasHomePod;
}

- (BOOL)hasMultipleUsers
{
  return self->_hasMultipleUsers;
}

- (BOOL)homeKitAddedAccessory
{
  return self->_homeKitAddedAccessory;
}

- (HMHomeManager)homeKitHomeManager
{
  return self->_homeKitHomeManager;
}

- (BOOL)homeKitHomeManagerReady
{
  return self->_homeKitHomeManagerReady;
}

- (HMHome)homeKitSelectedHome
{
  return self->_homeKitSelectedHome;
}

- (NSString)homeKitSelectedRoomName
{
  return self->_homeKitSelectedRoomName;
}

- (NSString)iTunesAccountID
{
  return self->_iTunesAccountID;
}

- (void)setITunesAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setITunesAccount:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesAccount, a3);
}

- (BOOL)keyExchangeOnly
{
  return self->_keyExchangeOnly;
}

- (void)setKeyExchangeOnly:(BOOL)a3
{
  self->_keyExchangeOnly = a3;
}

- (double)metricNonUserSeconds
{
  return self->_metricNonUserSeconds;
}

- (double)metricUserSeconds
{
  return self->_metricUserSeconds;
}

- (double)setupDeviceNonUserSeconds
{
  return self->_setupDeviceNonUserSeconds;
}

- (double)addDeviceNonUserSeconds
{
  return self->_addDeviceNonUserSeconds;
}

- (double)assignRoomNonUserSeconds
{
  return self->_assignRoomNonUserSeconds;
}

- (double)personalRequestsNonUserSeconds
{
  return self->_personalRequestsNonUserSeconds;
}

- (double)ulhNonUserSeconds
{
  return self->_ulhNonUserSeconds;
}

- (double)homekitDataSyncSeconds
{
  return self->_homekitDataSyncSeconds;
}

- (double)stereoPairSeconds
{
  return self->_stereoPairSeconds;
}

- (double)accessorySyncSeconds
{
  return self->_accessorySyncSeconds;
}

- (CUPairedPeer)pairedPeer
{
  return self->_pairedPeer;
}

- (void)setPairedPeer:(id)a3
{
  objc_storeStrong((id *)&self->_pairedPeer, a3);
}

- (BOOL)pauseAfterUserInput
{
  return self->_pauseAfterUserInput;
}

- (void)setPauseAfterUserInput:(BOOL)a3
{
  self->_pauseAfterUserInput = a3;
}

- (id)pauseHandler
{
  return self->_pauseHandler;
}

- (void)setPauseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (BOOL)personalRequestsEnabled
{
  return self->_personalRequestsEnabled;
}

- (void)setPersonalRequestsEnabled:(BOOL)a3
{
  self->_personalRequestsEnabled = a3;
}

- (id)promptForHomeHandler
{
  return self->_promptForHomeHandler;
}

- (void)setPromptForHomeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (id)promptForRoomHandler
{
  return self->_promptForRoomHandler;
}

- (void)setPromptForRoomHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (id)promptForRoomHandlerDetailed
{
  return self->_promptForRoomHandlerDetailed;
}

- (void)setPromptForRoomHandlerDetailed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)promptToInstallHomeAppHandler
{
  return self->_promptToInstallHomeAppHandler;
}

- (void)setPromptToInstallHomeAppHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (HMAccessory)stereoCounterpart
{
  return self->_stereoCounterpart;
}

- (void)setStereoCounterpart:(id)a3
{
  objc_storeStrong((id *)&self->_stereoCounterpart, a3);
}

- (NSArray)psgHomePods
{
  return self->_psgHomePods;
}

- (void)setPsgHomePods:(id)a3
{
  objc_storeStrong((id *)&self->_psgHomePods, a3);
}

- (NSArray)psgStereoPairs
{
  return self->_psgStereoPairs;
}

- (void)setPsgStereoPairs:(id)a3
{
  objc_storeStrong((id *)&self->_psgStereoPairs, a3);
}

- (HMMediaGroup)existingMediaGroup
{
  return self->_existingMediaGroup;
}

- (void)setExistingMediaGroup:(id)a3
{
  objc_storeStrong((id *)&self->_existingMediaGroup, a3);
}

- (int)stereoRole
{
  return self->_stereoRole;
}

- (void)setStereoRole:(int)a3
{
  self->_stereoRole = a3;
}

- (TRSession)trSession
{
  return self->_trSession;
}

- (void)setTrSession:(id)a3
{
  objc_storeStrong((id *)&self->_trSession, a3);
}

- (double)timeoutInSeconds
{
  return self->_timeoutInSeconds;
}

- (void)setTimeoutInSeconds:(double)a3
{
  self->_timeoutInSeconds = a3;
}

- (double)odeonSeconds
{
  return self->_odeonSeconds;
}

- (void)setOdeonSeconds:(double)a3
{
  self->_odeonSeconds = a3;
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_existingMediaGroup, 0);
  objc_storeStrong((id *)&self->_psgStereoPairs, 0);
  objc_storeStrong((id *)&self->_psgHomePods, 0);
  objc_storeStrong((id *)&self->_stereoCounterpart, 0);
  objc_storeStrong(&self->_promptToInstallHomeAppHandler, 0);
  objc_storeStrong(&self->_promptForRoomHandlerDetailed, 0);
  objc_storeStrong(&self->_promptForRoomHandler, 0);
  objc_storeStrong(&self->_promptForHomeHandler, 0);
  objc_storeStrong(&self->_pauseHandler, 0);
  objc_storeStrong((id *)&self->_pairedPeer, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_iTunesAccountID, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoomName, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedHome, 0);
  objc_storeStrong((id *)&self->_homeKitHomeManager, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_tvAudioInput, 0);
  objc_storeStrong((id *)&self->_appDataSelf, 0);
  objc_storeStrong((id *)&self->_homePodsAccessorySyncing, 0);
  objc_storeStrong((id *)&self->_hdsutilHKToken, 0);
  objc_storeStrong((id *)&self->_homeKitMediaSystem, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoom, 0);
  objc_storeStrong((id *)&self->_homeKitAccessory, 0);
  objc_storeStrong((id *)&self->_homeKitDeviceSetupOperation, 0);
  objc_storeStrong((id *)&self->_homeKitBrowser, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
