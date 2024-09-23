@implementation SysDropSession

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__SysDropSession_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1)
    dispatch_once(&signpostLog_onceToken, block);
  return (OS_os_log *)(id)signpostLog_log;
}

void __29__SysDropSession_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (SysDropSession)init
{
  SysDropSession *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  SFAirDropDiscoveryController *v5;
  SFAirDropDiscoveryController *airDropController;
  SysDropSession *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SysDropSession;
  v2 = -[SysDropSession init](&v9, sel_init);
  if (v2)
  {
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_proxSetupActiveToken = -1;
    v5 = (SFAirDropDiscoveryController *)objc_alloc_init(getSFAirDropDiscoveryControllerClass());
    airDropController = v2->_airDropController;
    v2->_airDropController = v5;

    -[SFAirDropDiscoveryController setDelegate:](v2->_airDropController, "setDelegate:", v2);
    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  SysDropSession *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SysDropSession *)FatalErrorF();
    -[SysDropSession _cleanup](v3, v4);
  }
  else
  {
    -[SysDropSession _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SysDropSession;
    -[SysDropSession dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  void (**progressHandler)(id, uint64_t, _QWORD);

  -[SysDropSession _cleanupSession](self, "_cleanupSession");
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  }
  self->_progressHandler = 0;

}

- (void)_cleanupSession
{
  SFSession *sfSession;

  if (!self->_startedFromSetup)
  {
    -[SFSession invalidate](self->_sfSession, "invalidate");
    sfSession = self->_sfSession;
    self->_sfSession = 0;

  }
}

- (BOOL)sysDropActivated
{
  return self->_activateCalled;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__SysDropSession_activate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SysDropSession_activate__block_invoke(uint64_t a1)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[8])
    return objc_msgSend(v1, "_run");
  else
    return objc_msgSend(v1, "_activate");
}

- (void)_activate
{
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_activateCalled = 1;
  self->_startTicks = mach_absolute_time();
  notify_register_check("com.apple.sharing.wha-prox-setup", &self->_proxSetupActiveToken);
  notify_set_state(self->_proxSetupActiveToken, 1uLL);
  notify_post("com.apple.sharing.wha-prox-setup");
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SysDropSession _run](self, "_run");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__SysDropSession_invalidate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SysDropSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  -[SysDropSession _cleanup](self, "_cleanup");
}

- (void)disconnect
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__SysDropSession_disconnect__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __28__SysDropSession_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 152);
  *(_QWORD *)(v2 + 152) = 0;

}

- (void)_run
{
  int v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v3 = -[SysDropSession _runSFSessionStart](self, "_runSFSessionStart");
    if (v3 == 4 || v3 == 2)
    {
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        -[SFSession identifier](self->_sfSession, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      -[SFSession identifier](self->_sfSession, "identifier", v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = -[SysDropSession _setupHandlers](self, "_setupHandlers");
        if (v5 == 4 || v5 == 2)
        {
          v6 = -[SysDropSession _runPreCheck](self, "_runPreCheck");
          if (v6 == 4 || v6 == 2)
          {
            if (self->_sysdiagnoseDone
              || (v9 = -[SysDropSession _runSysdiagnose](self, "_runSysdiagnose"), v9 == 4)
              || v9 == 2)
            {
              if (_os_feature_enabled_impl() && self->_homePodCanRPFileTransfer)
              {
                v7 = -[SysDropSession _runReceiveRPFileTransferSysdiagnose](self, "_runReceiveRPFileTransferSysdiagnose");
                if (v7 != 2 && v7 != 4)
                  return;
              }
              else
              {
                v8 = -[SysDropSession _runAirDrop](self, "_runAirDrop");
                if (v8 != 4 && v8 != 2)
                  return;
              }
              -[SysDropSession _runFileTransferComplete](self, "_runFileTransferComplete");
            }
          }
        }
      }
    }
  }
}

- (int)_runSFSessionStart
{
  int sfSessionState;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  SFSession *v8;
  SFSession *sfSession;
  uint64_t v10;
  SFSession *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  uint8_t buf[16];

  sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4 && sfSessionState != 2)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SysDropSession > 30)
        goto LABEL_14;
      if (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_sfSessionState)
      {
LABEL_14:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = -[SysDropSession signpostID](self, "signpostID");
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SFSessionStart", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_sfSessionState = 1;
      if (self->_sfSession)
      {
        if (gLogCategory_SysDropSession <= 30
          && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_sfSessionState = 4;
      }
      else
      {
        objc_msgSend(0, "invalidate");
        v8 = (SFSession *)objc_alloc_init(MEMORY[0x24BE901B0]);
        sfSession = self->_sfSession;
        self->_sfSession = v8;

        -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
        -[SFSession setLabel:](self->_sfSession, "setLabel:", CFSTR("SysDrop"));
        -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
        -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", *MEMORY[0x24BE90398]);
        -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", 1);
        v10 = MEMORY[0x24BDAC760];
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __36__SysDropSession__runSFSessionStart__block_invoke;
        v16[3] = &unk_24FCD4138;
        v16[4] = self;
        -[SFSession setErrorHandler:](self->_sfSession, "setErrorHandler:", v16);
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __36__SysDropSession__runSFSessionStart__block_invoke_2;
        v15[3] = &unk_24FCD3FE8;
        v15[4] = self;
        -[SFSession setInterruptionHandler:](self->_sfSession, "setInterruptionHandler:", v15);
        v11 = self->_sfSession;
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __36__SysDropSession__runSFSessionStart__block_invoke_3;
        v14[3] = &unk_24FCD4138;
        v14[4] = self;
        -[SFSession activateWithCompletion:](v11, "activateWithCompletion:", v14);
        v13[0] = v10;
        v13[1] = 3221225472;
        v13[2] = __36__SysDropSession__runSFSessionStart__block_invoke_37;
        v13[3] = &unk_24FCD3F48;
        v13[4] = self;
        -[SFSession setReceivedObjectHandler:](self->_sfSession, "setReceivedObjectHandler:", v13);
      }
    }
  }
  return self->_sfSessionState;
}

uint64_t __36__SysDropSession__runSFSessionStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", a2, CFSTR("SFSessionError"));
}

void __36__SysDropSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BDD1100];
  v9 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("?");
  if (v4)
    v6 = (const __CFString *)v4;
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -6762, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_reportError:label:", v8, CFSTR("SFSessionInterruption"));

}

void __36__SysDropSession__runSFSessionStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  NSObject *v14;
  uint64_t v15;
  os_signpost_id_t v16;
  uint64_t v17;
  void *v18;
  uint8_t v19[16];
  uint8_t buf[16];
  uint8_t v21[16];
  uint8_t v22[16];

  v3 = a2;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20);
  if (v3)
  {
    if (!v4)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SFSessionStart", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)v19 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "SFSessionStart", (const char *)&unk_22F7B8AEE, v19, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("SFSessionActivate"));
  }
  else
  {
    if (!v4)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v13 = v12;
        if (os_signpost_enabled(v11))
        {
          *(_WORD *)v22 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SFSessionStart", (const char *)&unk_22F7B8AEE, v22, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_END, v16, "SFSessionStart", (const char *)&unk_22F7B8AEE, v21, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = 4;
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      objc_msgSend(*(id *)(a1 + 32), "_run", v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_run", v17);
    }
  }

}

void __36__SysDropSession__runSFSessionStart__block_invoke_37(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (gLogCategory_SysDropSession <= 30)
  {
    if (gLogCategory_SysDropSession != -1 || (v6 = _LogCategory_Initialize(), v5 = v8, v6))
    {
      v7 = v5;
      LogPrintF();
      v5 = v8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "handlePeerEvent:flags:", v5, a2, v7);

}

- (int)_runPreCheck
{
  switch(self->_preCheckState)
  {
    case 0:
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SysDropSession _runPreCheckRequest](self, "_runPreCheckRequest");
      break;
    case 1:
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_10;
      }
      break;
    case 2:
    case 4:
      return self->_preCheckState;
    default:
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
LABEL_10:
        LogPrintF();
      }
      break;
  }
  return self->_preCheckState;
}

- (void)_runPreCheckRequest
{
  id v3;
  SFSession *sfSession;
  id v5;
  _QWORD v6[5];

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  self->_preCheckState = 1;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("sd_rpft_cap"));
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    v5 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__SysDropSession__runPreCheckRequest__block_invoke;
  v6[3] = &unk_24FCD4618;
  v6[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("sysdrop_check"), &unk_24FCE3A98, v3, v6, v5);

}

uint64_t __37__SysDropSession__runPreCheckRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runPreCheckResponse:error:", a4, a2);
}

- (void)_runPreCheckResponse:(id)a3 error:(id)a4
{
  id v6;
  unsigned int Int64Ranged;
  uint64_t Int64;
  BOOL v9;
  uint64_t v10;
  const char *v11;
  void (**progressHandler)(id, uint64_t, void *);
  void *v13;
  const char *v14;
  char *v15;

  v15 = (char *)a3;
  v6 = a4;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    v14 = v15;
    LogPrintF();
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  Int64 = CFDictionaryGetInt64();
  v9 = Int64 != 0;
  if (gLogCategory_SysDropSession <= 30)
  {
    v10 = Int64;
    if (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize())
    {
      v11 = "no";
      if (v10)
        v11 = "yes";
      v14 = v11;
      LogPrintF();
    }
  }
  self->_sysdiagnoseStatus = Int64Ranged;
  self->_homePodCanRPFileTransfer = v9;
  self->_preCheckState = 4;
  self->_sysdiagnoseDone = Int64Ranged == 2;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    -[SysDropSession createSysDropAirDropEvent:error:](self, "createSysDropAirDropEvent:error:", 5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    progressHandler[2](progressHandler, 906, v13);

  }
  -[SysDropSession _run](self, "_run", v14);

}

- (int)_runSysdiagnose
{
  int sysdiagnoseState;
  void (**progressHandler)(id, uint64_t, void *);
  void *v5;

  sysdiagnoseState = self->_sysdiagnoseState;
  if (sysdiagnoseState == 1)
  {
    if (self->_sysdiagnoseStatus == 2)
    {
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_sysdiagnoseState = 4;
    }
    else if (gLogCategory_SysDropSession <= 30
           && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (!sysdiagnoseState)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_sysdiagnoseState = 1;
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      -[SysDropSession createSysDropSysDiagnoseEvent:](self, "createSysDropSysDiagnoseEvent:", self->_setupError);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      progressHandler[2](progressHandler, 907, v5);

    }
  }
  return self->_sysdiagnoseState;
}

- (int)_runAirDrop
{
  int airDropState;
  void (**progressHandler)(id, uint64_t, void *);
  void *v5;

  airDropState = self->_airDropState;
  if (airDropState == 1)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (!airDropState)
  {
    -[SysDropSession enableAirDropForEveryone](self, "enableAirDropForEveryone");
    self->_airDropState = 1;
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      -[SysDropSession createSysDropAirDropEvent:error:](self, "createSysDropAirDropEvent:error:", 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      progressHandler[2](progressHandler, 906, v5);

    }
  }
  return self->_airDropState;
}

- (int)_runReceiveRPFileTransferSysdiagnose
{
  int rpFileTransferState;
  void (**progressHandler)(id, uint64_t, void *);
  void *v5;

  rpFileTransferState = self->_rpFileTransferState;
  if (rpFileTransferState == 1)
  {
    if (self->_transferCompleted)
    {
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_rpFileTransferState = 4;
    }
    else if (gLogCategory_SysDropSession <= 30
           && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (!rpFileTransferState)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_rpFileTransferState = 1;
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      -[SysDropSession createSysDropRPFileTransferEvent:error:fileTransferProgress:](self, "createSysDropRPFileTransferEvent:error:fileTransferProgress:", 0, 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      progressHandler[2](progressHandler, 909, v5);

    }
  }
  return self->_rpFileTransferState;
}

- (int)_runFileTransferComplete
{
  int rpFileCompleteState;
  void (**progressHandler)(id, uint64_t, void *);
  void *v5;

  rpFileCompleteState = self->_rpFileCompleteState;
  if (rpFileCompleteState == 1)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (!rpFileCompleteState)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_rpFileCompleteState = 1;
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      -[SysDropSession createSysDropRPFileTransferEvent:error:fileTransferProgress:](self, "createSysDropRPFileTransferEvent:error:fileTransferProgress:", 2, 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      progressHandler[2](progressHandler, 910, v5);

    }
  }
  return self->_rpFileCompleteState;
}

- (void)fileTransferCompleted:(id)a3
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
  v7[2] = __40__SysDropSession_fileTransferCompleted___block_invoke;
  v7[3] = &unk_24FCD4290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __40__SysDropSession_fileTransferCompleted___block_invoke(uint64_t a1)
{
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (id)fileTransferredSysDiagnosePath
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[RPFileTransferItem itemURL](self->_transferItem, "itemURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RPFileTransferItem itemURL](self->_transferItem, "itemURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SysDropSession <= 60
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = &stru_24FCD5B38;
  }
  return v6;
}

- (int)_setupHandlers
{
  int result;
  SFSession *sfSession;
  _QWORD v5[5];

  result = self->_setupHandlersState;
  if (!result)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_setupHandlersState = 4;
    sfSession = self->_sfSession;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __32__SysDropSession__setupHandlers__block_invoke;
    v5[3] = &unk_24FCD4690;
    v5[4] = self;
    -[SFSession registerRequestID:options:handler:](sfSession, "registerRequestID:options:handler:", CFSTR("_hds_rpft_sysdrop"), &unk_24FCE3AC0, v5);
    return self->_setupHandlersState;
  }
  return result;
}

void __32__SysDropSession__setupHandlers__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  HDSFileTransferService *v10;
  uint64_t v11;
  HDSFileTransferService *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  HDSFileTransferService *v17;
  _QWORD v18[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10 = objc_alloc_init(HDSFileTransferService);
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __32__SysDropSession__setupHandlers__block_invoke_2;
  v18[3] = &unk_24FCD41D8;
  v18[4] = *(_QWORD *)(a1 + 32);
  -[HDSFileTransferService setFileTransferProgressHandler:](v10, "setFileTransferProgressHandler:", v18);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __32__SysDropSession__setupHandlers__block_invoke_3;
  v16[3] = &unk_24FCD4640;
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v10;
  v12 = v10;
  -[HDSFileTransferService setFileTransferCompletionHandler:](v12, "setFileTransferCompletionHandler:", v16);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __32__SysDropSession__setupHandlers__block_invoke_4;
  v14[3] = &unk_24FCD4668;
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v13 = v9;
  -[HDSFileTransferService handleSysDropStartFileTransferRequest:responseHandler:](v12, "handleSysDropStartFileTransferRequest:responseHandler:", v8, v14);

}

void __32__SysDropSession__setupHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 136);
  if (v5 && !*(_BYTE *)(v4 + 122))
  {
    v7 = v3;
    objc_msgSend((id)v4, "createSysDropRPFileTransferEvent:error:fileTransferProgress:", 1, 0, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, 909, v6);

    v3 = v7;
  }

}

void __32__SysDropSession__setupHandlers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    v9 = v11;
    v10 = v5;
    LogPrintF();
  }
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v11, CFSTR("File Transfer Disconnected"));
  }
  else if (v5)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      v9 = 0;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "fileTransferCompleted:", v5, v9, v10);
    v6 = *(void **)(a1 + 40);
    if (v6)
      objc_msgSend(v6, "invalidate");
  }
  else
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = *(void **)(a1 + 32);
    NSErrorF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reportError:label:", v8, CFSTR("File Transfer Did not complete"));

  }
}

void __32__SysDropSession__setupHandlers__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  id v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    v4 = v3;
    if (gLogCategory_SysDropSession <= 30)
    {
      if (gLogCategory_SysDropSession != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
      {
        v6 = v4;
        LogPrintF();
        v4 = v7;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v4, CFSTR("Failed To Setup File Transfer receiver"), v6);
  }
  else
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "sysdiagnoseCompleted");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)enableAirDropForEveryone
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  __CFString *v6;
  uint64_t v7;

  -[SFAirDropDiscoveryController setDiscoverableMode:](self->_airDropController, "setDiscoverableMode:", 2);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.sharingd.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v2, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v7)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    v6 = CFSTR("Not set");
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("DiscoverableMode"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (id)_getAirDropID
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  __CFString *v6;
  id v8;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.sharingd.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v2, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    v6 = &stru_24FCD5B38;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("AirDropID"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v6;
}

- (id)_getAirDropDiscoverableMode
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  __CFString *v6;
  id v8;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.sharingd.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v2, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    v6 = &stru_24FCD5B38;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("DiscoverableMode"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v6;
}

- (id)createSysDropSysDiagnoseEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("sd_er"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("sd_er"));
  }
  objc_msgSend(v3, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("sd_ed"));

  objc_msgSend(v3, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("sd_de"));

  return v5;
}

- (id)createSysDropAirDropEvent:(unsigned int)a3 error:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSError *setupError;
  void *v12;
  void *v13;
  void *v14;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("sd_ad_e"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "code"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("sd_ad_er"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("sd_ad_er"));
  }
  objc_msgSend(v6, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("sd_ad_ed"));
  setupError = self->_setupError;
  if (setupError)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSError code](setupError, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("sd_er"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("sd_er"));
  }
  -[NSError domain](self->_setupError, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("sd_ed"));

  -[NSError description](self->_setupError, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("sd_de"));

  return v7;
}

- (id)createSysDropRPFileTransferEvent:(unsigned int)a3 error:(id)a4 fileTransferProgress:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSError *setupError;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  float v19;
  float v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v26;
  double v27;
  uint64_t v28;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("sd_rp_e"));

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("sd_rp_er"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("sd_rp_er"));
  }
  objc_msgSend(v9, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("sd_rp_ed"));
  setupError = self->_setupError;
  if (setupError)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSError code](setupError, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("sd_er"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("sd_er"));
  }
  -[NSError domain](self->_setupError, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("sd_ed"));

  -[NSError description](self->_setupError, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("sd_de"));

  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    v26 = objc_msgSend(v8, "transferredByteCount");
    v28 = objc_msgSend(v8, "totalByteCount");
    LogPrintF();
  }
  if (v8)
  {
    v19 = (float)objc_msgSend(v8, "transferredByteCount");
    v20 = v19 / (float)objc_msgSend(v8, "totalByteCount");
  }
  else
  {
    v20 = -1.0;
  }
  *(float *)&v18 = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18, v26, v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("sd_rp_pr"));

  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    v27 = v20;
    LogPrintF();
  }
  if (v8)
    objc_msgSend(v8, "remainingSeconds");
  else
    v22 = -1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22, *(_QWORD *)&v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("sd_rp_rs"));

  if (objc_msgSend(v8, "type"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "type"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("sd_pt"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("sd_pt"));
  }

  return v10;
}

- (void)startAirDropSysdiagnose
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t, void *);
  void *v8;
  void (**v9)(id, uint64_t, void *);
  void *v10;
  void (**progressHandler)(id, uint64_t, void *);
  void *v12;
  SFSession *sfSession;
  void *v14;
  _QWORD v15[5];

  -[SysDropSession _getAirDropID](self, "_getAirDropID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[SysDropSession _getAirDropDiscoverableMode](self, "_getAirDropDiscoverableMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("Everyone")) & 1) != 0)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR("sd_ad_id"));
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        v14 = v6;
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
      if (progressHandler)
      {
        -[SysDropSession createSysDropAirDropEvent:error:](self, "createSysDropAirDropEvent:error:", 5, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        progressHandler[2](progressHandler, 906, v12);

      }
      sfSession = self->_sfSession;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __41__SysDropSession_startAirDropSysdiagnose__block_invoke;
      v15[3] = &unk_24FCD4618;
      v15[4] = self;
      -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("sysdrop_ad"), &unk_24FCE3AE8, v6, v15, v14);

    }
    else
    {
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7 = (void (**)(id, uint64_t, void *))self->_progressHandler;
      -[SysDropSession createSysDropAirDropEvent:error:](self, "createSysDropAirDropEvent:error:", 2, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 906, v8);

    }
  }
  else
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = (void (**)(id, uint64_t, void *))self->_progressHandler;
    -[SysDropSession createSysDropAirDropEvent:error:](self, "createSysDropAirDropEvent:error:", 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 906, v10);

  }
}

void __41__SysDropSession_startAirDropSysdiagnose__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 128);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SysDropSession_startAirDropSysdiagnose__block_invoke_2;
  block[3] = &unk_24FCD42E0;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v10 = v6;
  v11 = v7;
  dispatch_async(v9, block);

}

void __41__SysDropSession_startAirDropSysdiagnose__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD **)(a1 + 48);
  v3 = v2[17];
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "createSysDropAirDropEvent:error:", 3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, 906, v5);

  }
  else
  {
    objc_msgSend(v2, "createSysDropAirDropEvent:error:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, 906, v4);

    objc_msgSend(*(id *)(a1 + 48), "_run");
  }
}

- (void)sysdiagnoseCompleted
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SysDropSession_sysdiagnoseCompleted__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__SysDropSession_sysdiagnoseCompleted__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 2;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)handlePeerEvent:(id)a3 flags:(unsigned int)a4
{
  id v5;
  unsigned int sysdiagnoseStatus;
  void *v7;
  id v8;

  if ((a4 & 1) == 0)
  {
    v5 = a3;
    self->_sysdiagnoseStatus = CFDictionaryGetInt64Ranged();
    CFDictionaryGetInt64Ranged();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (gLogCategory_SysDropSession <= 30)
    {
      if (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    sysdiagnoseStatus = self->_sysdiagnoseStatus;
    if (sysdiagnoseStatus == 3)
    {
      NSErrorF();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SysDropSession _reportError:label:](self, "_reportError:label:", v7, CFSTR("SysDrop Sysdiagnose Error"));

    }
    else if (sysdiagnoseStatus == 2)
    {
      -[SysDropSession sysdiagnoseCompleted](self, "sysdiagnoseCompleted");
    }
    else if (gLogCategory_SysDropSession <= 30
           && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_reportError:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  int v8;
  double v9;
  id v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**progressHandler)(id, uint64_t, void *);
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = gLogCategory_SysDropSession;
  if (gLogCategory_SysDropSession <= 30)
  {
    if (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize())
    {
      -[SFSession identifier](self->_sfSession, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v8 = gLogCategory_SysDropSession;
  }
  if (v8 <= 60 && (v8 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  FPrintF();
  -[SysDropSession _cleanupSession](self, "_cleanupSession", v7, v6);
  if (self->_totalSecs == 0.0)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_totalSecs = v9;
  }
  if (objc_msgSend(v6, "code") != -6723)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v30[0] = v7;
    v29[0] = CFSTR("label");
    v29[1] = CFSTR("errDomain");
    objc_msgSend(v6, "domain");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = CFSTR("?");
    v30[1] = v13;
    v29[2] = CFSTR("errCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "code"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v14;
    v29[3] = CFSTR("totalMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_totalSecs * 1000.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addEntriesFromDictionary:", v16);

    HDSMetricsLog(CFSTR("com.apple.sharing.ASSetupError"), v10);
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      v27 = CFSTR("eo");
      v18 = v6;
      if (!v6)
      {
        v19 = (void *)MEMORY[0x24BDD1540];
        v20 = *MEMORY[0x24BDD1100];
        v25 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
        v21 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v21;
        if (v21)
          v22 = (const __CFString *)v21;
        else
          v22 = CFSTR("?");
        v26 = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, -6700, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      progressHandler[2](progressHandler, 30, v23);

      if (!v6)
      {

      }
    }

  }
}

- (void)discoveryControllerSettingsDidChange:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_SysDropSession <= 30
    && ((v6 = v3, gLogCategory_SysDropSession != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)discoveryControllerVisibilityDidChange:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_SysDropSession <= 30
    && ((v6 = v3, gLogCategory_SysDropSession != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)discoveryControllerLegacyModePropertiesDidChange:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_SysDropSession <= 30
    && ((v6 = v3, gLogCategory_SysDropSession != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (NSError)setupError
{
  return self->_setupError;
}

- (void)setSetupError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)startedFromSetup
{
  return self->_startedFromSetup;
}

- (void)setStartedFromSetup:(BOOL)a3
{
  self->_startedFromSetup = a3;
}

- (BOOL)sysDropFailed
{
  return self->_sysDropFailed;
}

- (void)setSysDropFailed:(BOOL)a3
{
  self->_sysDropFailed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupError, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_rpFileTransferError, 0);
  objc_storeStrong((id *)&self->_transferItem, 0);
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong((id *)&self->_airDropController, 0);
}

@end
