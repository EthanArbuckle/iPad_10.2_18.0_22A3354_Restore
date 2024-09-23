@implementation SysDropService

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__SysDropService_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_3 != -1)
    dispatch_once(&signpostLog_onceToken_3, block);
  return (OS_os_log *)(id)signpostLog_log_3;
}

void __29__SysDropService_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_3;
  signpostLog_log_3 = (uint64_t)v1;

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

- (SysDropService)init
{
  SysDropService *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SysDropService;
  v2 = -[SysDropService init](&v6, sel_init);
  if (v2)
  {
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    if (gLogCategory_SysDropService <= 30
      && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v2;
}

- (void)dealloc
{
  SysDropService *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SysDropService *)FatalErrorF();
    -[SysDropService _cleanup](v3, v4);
  }
  else
  {
    -[SysDropService _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SysDropService;
    -[SysDropService dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  SFService *sfService;
  SBSSysdiagnoseInterface *sysdropInterface;
  id peerEventHandler;

  sfService = self->_sfService;
  self->_sfService = 0;

  sysdropInterface = self->_sysdropInterface;
  self->_sysdropInterface = 0;

  peerEventHandler = self->_peerEventHandler;
  self->_peerEventHandler = 0;

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__SysDropService_activate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SysDropService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  self->_advertiseFast = CFPrefs_GetInt64() != 0;
  -[SysDropService _sfServiceStart](self, "_sfServiceStart");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__SysDropService_invalidate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SysDropService_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  SBSSysdiagnoseInterface *sysdropInterface;
  uint64_t v4;
  HDSFileTransfer *fileTransferSession;
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_invalidateCalled
    && gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  sysdropInterface = self->_sysdropInterface;
  v4 = MEMORY[0x24BDAC760];
  if (sysdropInterface)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __29__SysDropService__invalidate__block_invoke;
    v7[3] = &unk_24FCD4138;
    v7[4] = self;
    -[SBSSysdiagnoseInterface cancelSysdiagnose:](sysdropInterface, "cancelSysdiagnose:", v7);
  }
  if (!self->_serviceStartedFromSetup)
  {
    if (self->_sfSession)
      -[SysDropService _handleSessionEnded:](self, "_handleSessionEnded:");
    -[SFService invalidate](self->_sfService, "invalidate");
  }
  -[SFSession deregisterRequestID:](self->_sfSession, "deregisterRequestID:", CFSTR("sysdrop_check"));
  -[SFSession deregisterRequestID:](self->_sfSession, "deregisterRequestID:", CFSTR("sysdrop_ad"));
  fileTransferSession = self->_fileTransferSession;
  if (fileTransferSession)
  {
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __29__SysDropService__invalidate__block_invoke_2;
    v6[3] = &unk_24FCD3FE8;
    v6[4] = self;
    -[HDSFileTransfer invalidate:](fileTransferSession, "invalidate:", v6);
  }
  -[SysDropService _cleanup](self, "_cleanup");
}

void __29__SysDropService__invalidate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5
    && gLogCategory_SysDropService <= 60
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = 0;
}

void __29__SysDropService__invalidate__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0;

}

- (void)_sendSysdiagnosePeerUpdate:(unsigned int)a3 inError:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void (**peerEventHandler)(id, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v4 = *(_QWORD *)&a3;
  v17[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[SFSession peer](self->_sfSession, "peer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (v8 = self->_peerEventHandler, v7, v8))
  {
    peerEventHandler = (void (**)(id, void *))self->_peerEventHandler;
    v16[0] = CFSTR("sysdrop_sys_update");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v16[1] = CFSTR("sd_sys_ec");
    v11 = (void *)MEMORY[0x24BDD16E0];
    if (v6)
      v12 = objc_msgSend(v6, "code");
    else
      v12 = 0;
    objc_msgSend(v11, "numberWithInteger:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    v16[2] = CFSTR("sd_sys_ed");
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = CFSTR("NoDomain");
    }
    v17[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    peerEventHandler[2](peerEventHandler, v15);

    if (v6)
  }
  else if (gLogCategory_SysDropService <= 30
         && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_sfServiceStart
{
  SFService *v3;
  SFService *sfService;
  uint64_t v5;
  uint64_t v6;
  SFService *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  if (gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_sfService && self->_sfSession)
  {
    -[SysDropService _handleSessionStarted:](self, "_handleSessionStarted:");
  }
  else
  {
    v3 = (SFService *)objc_alloc_init(MEMORY[0x24BE901A8]);
    sfService = self->_sfService;
    self->_sfService = v3;

    if (self->_advertiseFast)
      -[SFService setAdvertiseRate:](self->_sfService, "setAdvertiseRate:", 50);
    -[SFService setDispatchQueue:](self->_sfService, "setDispatchQueue:", self->_dispatchQueue);
    -[SFService setIdentifier:](self->_sfService, "setIdentifier:", *MEMORY[0x24BE90398]);
    -[SFService setLabel:](self->_sfService, "setLabel:", CFSTR("SysDrop"));
    if (SFDeviceModelCodeGet())
      v5 = 33;
    else
      v5 = 11;
    -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", v5);
    -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", 1);
    -[SFService setTouchRemoteEnabled:](self->_sfService, "setTouchRemoteEnabled:", 1);
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __33__SysDropService__sfServiceStart__block_invoke;
    v11[3] = &unk_24FCD4818;
    v11[4] = self;
    -[SFService setSessionStartedHandler:](self->_sfService, "setSessionStartedHandler:", v11);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __33__SysDropService__sfServiceStart__block_invoke_34;
    v10[3] = &unk_24FCD4840;
    v10[4] = self;
    -[SFService setSessionEndedHandler:](self->_sfService, "setSessionEndedHandler:", v10);
    -[SFService setSessionSecuredHandler:](self->_sfService, "setSessionSecuredHandler:", &__block_literal_global_8);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __33__SysDropService__sfServiceStart__block_invoke_2;
    v9[3] = &unk_24FCD4868;
    v9[4] = self;
    -[SFService setReceivedRequestHandler:](self->_sfService, "setReceivedRequestHandler:", v9);
    v7 = self->_sfService;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __33__SysDropService__sfServiceStart__block_invoke_3;
    v8[3] = &unk_24FCD4138;
    v8[4] = self;
    -[SFService activateWithCompletion:](v7, "activateWithCompletion:", v8);
  }
}

void __33__SysDropService__sfServiceStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SetupSession", (const char *)&unk_22F7B8AEE, v7, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleSessionStarted:", v3);
}

void __33__SysDropService__sfServiceStart__block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SetupSession", (const char *)&unk_22F7B8AEE, v7, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleSessionEnded:", v3);
}

void __33__SysDropService__sfServiceStart__block_invoke_36(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SysDropService <= 30)
  {
    v6 = v2;
    if (gLogCategory_SysDropService != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      objc_msgSend(v3, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v3 = v6;
    }
  }

}

uint64_t __33__SysDropService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRawRequest:flags:responseHandler:", a4, a3);
}

void __33__SysDropService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  id v7;
  void *v8;
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SFServiceStart", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v7 = v3;
  if (v7
    && gLogCategory_SysDropService <= 90
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v7, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

- (void)_handleSessionStarted:(id)a3
{
  id v5;
  SFSession **p_sfSession;
  void *v7;
  uint64_t v8;
  SFSession *sfSession;
  SFSession *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v5 = a3;
  p_sfSession = &self->_sfSession;
  if (self->_sfSession && !self->_serviceStartedFromSetup)
  {
    if (gLogCategory_SysDropService <= 60
      && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSession peer](*p_sfSession, "peer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  else
  {
    if (gLogCategory_SysDropService <= 30
      && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_storeStrong((id *)&self->_sfSession, a3);
    v8 = MEMORY[0x24BDAC760];
    sfSession = self->_sfSession;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __40__SysDropService__handleSessionStarted___block_invoke;
    v14[3] = &unk_24FCD4690;
    v14[4] = self;
    -[SFSession registerRequestID:options:handler:](sfSession, "registerRequestID:options:handler:", CFSTR("sysdrop_check"), &unk_24FCE3E08, v14);
    v10 = self->_sfSession;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __40__SysDropService__handleSessionStarted___block_invoke_2;
    v13[3] = &unk_24FCD4690;
    v13[4] = self;
    -[SFSession registerRequestID:options:handler:](v10, "registerRequestID:options:handler:", CFSTR("sysdrop_ad"), &unk_24FCE3E08, v13);
  }

}

uint64_t __40__SysDropService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreCheckRequest:responseHandler:");
}

uint64_t __40__SysDropService__handleSessionStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAirDropRequest:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3
{
  SFSession *sfSession;
  SFSession *v5;
  int v6;
  void *v7;
  SFSession *v8;

  sfSession = (SFSession *)a3;
  v5 = sfSession;
  if (self->_sfSession == sfSession)
  {
    v8 = sfSession;
    if (sfSession)
    {
      if (gLogCategory_SysDropService <= 30)
      {
        if (gLogCategory_SysDropService != -1 || (v6 = _LogCategory_Initialize(), sfSession = self->_sfSession, v6))
        {
          -[SFSession peer](sfSession, "peer");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

          sfSession = self->_sfSession;
        }
      }
    }
    else
    {
      sfSession = 0;
    }
    self->_sfSession = 0;

    v5 = v8;
  }

}

- (void)_handleAirDropRequest:(id)a3 responseHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v8);

}

- (void)_handlePreCheckRequest:(id)a3 responseHandler:(id)a4
{
  void (**v6)(id, NSError *, _QWORD, id);
  _BOOL4 companionCanRPFileTransfer;
  const char *v8;
  id v9;
  uint64_t sysdiagnoseStatus;
  void *v11;
  NSError *preCheckError;
  const char *v13;
  char *v14;

  v14 = (char *)a3;
  v6 = (void (**)(id, NSError *, _QWORD, id))a4;
  if (gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    v13 = v14;
    LogPrintF();
  }
  companionCanRPFileTransfer = CFDictionaryGetInt64() != 0;
  self->_companionCanRPFileTransfer = companionCanRPFileTransfer;
  if (gLogCategory_SysDropService <= 30)
  {
    if (gLogCategory_SysDropService == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_12;
      companionCanRPFileTransfer = self->_companionCanRPFileTransfer;
    }
    if (companionCanRPFileTransfer)
      v8 = "yes";
    else
      v8 = "no";
    v13 = v8;
    LogPrintF();
  }
LABEL_12:
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  sysdiagnoseStatus = self->_sysdiagnoseStatus;
  if (!(_DWORD)sysdiagnoseStatus)
  {
    -[SysDropService _sysdiagnoseStart](self, "_sysdiagnoseStart");
    sysdiagnoseStatus = self->_sysdiagnoseStatus;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", sysdiagnoseStatus, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("sd_status"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("sd_rpft_cap"));
  if (gLogCategory_SysDropService <= 30)
  {
    if (gLogCategory_SysDropService != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (gLogCategory_SysDropService <= 30
      && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (self->_sysdiagnoseStatus == 3)
    preCheckError = self->_preCheckError;
  else
    preCheckError = 0;
  v6[2](v6, preCheckError, 0, v9);

}

- (void)_handleRawRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5
{
  uint64_t v5;
  void (**v6)(id, uint64_t, void *, _QWORD);
  unsigned __int8 Int64Ranged;
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v5 = *(_QWORD *)&a4;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, void *, _QWORD))a5;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SysDropService <= 50)
  {
    v8 = Int64Ranged;
    if (gLogCategory_SysDropService != -1 || _LogCategory_Initialize())
    {
      v16 = v8;
      v17 = 0;
      LogPrintF();
    }
  }
  v9 = (void *)MEMORY[0x24BDD1540];
  v10 = *MEMORY[0x24BDD1100];
  v18 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("?");
  if (v11)
    v13 = (const __CFString *)v11;
  v19[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1, v16, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -6732, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5, v15, 0);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)peerEventHandler
{
  return self->_peerEventHandler;
}

- (void)setPeerEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SFService)sfService
{
  return self->_sfService;
}

- (void)setSfService:(id)a3
{
  objc_storeStrong((id *)&self->_sfService, a3);
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (BOOL)serviceStartedFromSetup
{
  return self->_serviceStartedFromSetup;
}

- (void)setServiceStartedFromSetup:(BOOL)a3
{
  self->_serviceStartedFromSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong(&self->_peerEventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong((id *)&self->_targetID, 0);
  objc_storeStrong((id *)&self->_preCheckError, 0);
  objc_storeStrong((id *)&self->_sysdropInterface, 0);
  objc_storeStrong((id *)&self->_sysdiagnosePathURL, 0);
}

@end
