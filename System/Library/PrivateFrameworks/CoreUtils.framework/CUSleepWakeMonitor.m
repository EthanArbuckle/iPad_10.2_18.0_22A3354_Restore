@implementation CUSleepWakeMonitor

- (CUSleepWakeMonitor)init
{
  CUSleepWakeMonitor *v2;
  CUSleepWakeMonitor *v3;
  CUSleepWakeMonitor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUSleepWakeMonitor;
  v2 = -[CUSleepWakeMonitor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUSleepWakeMonitor;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUSleepWakeMonitor;
  -[CUSleepWakeMonitor dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE067A20;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CUSleepWakeMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CUSleepWakeMonitor_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  uint64_t v8;

  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_6;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUSleepWakeMonitor _invalidate]", 0x1Eu, (uint64_t)"Invalidating\n", v2, v3, v4, v5, v8);
    }
LABEL_6:
    self->_invalidateCalled = 1;
    -[CUSleepWakeMonitor _ensureStopped](self, "_ensureStopped");
    -[CUSleepWakeMonitor _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id v4;
  id sleepWakeHandler;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  LogCategory *ucat;
  uint64_t v11;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      v4 = self->_invalidationHandler;
    }
    else
    {
      v4 = 0;
    }
    self->_invalidationHandler = 0;

    sleepWakeHandler = self->_sleepWakeHandler;
    self->_sleepWakeHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUSleepWakeMonitor _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v6, v7, v8, v9, v11);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_8;
      }
    }
  }
}

- (void)_ensureStarted
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  IONotificationPort **p_powerNotificationPort;
  io_connect_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  LogCategory *v15;
  _BOOL4 v16;
  io_connect_t powerCnx;
  uint64_t v18;
  const char *v19;

  if (self->_powerCnx)
    return;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUSleepWakeMonitor _ensureStarted]", 0x1Eu, (uint64_t)"Monitoring start\n", v2, v3, v4, v5, v18);
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }
LABEL_7:
  p_powerNotificationPort = &self->_powerNotificationPort;
  v9 = IORegisterForSystemPower(self, &self->_powerNotificationPort, (IOServiceInterestCallback)_sleepWakeCallback, &self->_powerNotifier);
  self->_powerCnx = v9;
  if (v9)
  {
    if (*p_powerNotificationPort)
    {
      if (self->_powerNotifier)
      {
        IONotificationPortSetDispatchQueue(*p_powerNotificationPort, (dispatch_queue_t)self->_dispatchQueue);
        return;
      }
      v14 = "notifier null";
    }
    else
    {
      v14 = "port null";
    }
  }
  else
  {
    v14 = "cnx null";
  }
  v15 = self->_ucat;
  if (v15->var0 > 90)
    goto LABEL_18;
  if (v15->var0 == -1)
  {
    v19 = v14;
    v16 = _LogCategory_Initialize((uint64_t)v15, 0x5Au);
    v14 = v19;
    if (!v16)
      goto LABEL_18;
    v15 = self->_ucat;
  }
  LogPrintF((uint64_t)v15, (uint64_t)"-[CUSleepWakeMonitor _ensureStarted]", 0x5Au, (uint64_t)"### Monitoring start failed (%s)\n", v10, v11, v12, v13, (uint64_t)v14);
LABEL_18:
  IODeregisterForSystemPower(&self->_powerNotifier);
  if (*p_powerNotificationPort)
  {
    IONotificationPortDestroy(*p_powerNotificationPort);
    *p_powerNotificationPort = 0;
  }
  powerCnx = self->_powerCnx;
  if (powerCnx)
  {
    IOServiceClose(powerCnx);
    self->_powerCnx = 0;
  }
}

- (void)_ensureStopped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  IONotificationPort *powerNotificationPort;
  io_connect_t powerCnx;
  uint64_t v10;

  if (self->_powerCnx)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUSleepWakeMonitor _ensureStopped]", 0x1Eu, (uint64_t)"Monitoring stop\n", v2, v3, v4, v5, v10);
        goto LABEL_6;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }
LABEL_6:
  IODeregisterForSystemPower(&self->_powerNotifier);
  powerNotificationPort = self->_powerNotificationPort;
  if (powerNotificationPort)
  {
    IONotificationPortDestroy(powerNotificationPort);
    self->_powerNotificationPort = 0;
  }
  powerCnx = self->_powerCnx;
  if (powerCnx)
  {
    IOServiceClose(powerCnx);
    self->_powerCnx = 0;
  }
}

- (void)_sleepWakeHandlerForService:(unsigned int)a3 type:(unsigned int)a4 arg:(void *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  LogCategory *ucat;
  int v14;
  unint64_t v15;
  _QWORD *v16;
  void (*v17)(void);
  io_connect_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  LogCategory *v23;
  void *v24;
  void *v25;
  io_connect_t powerCnx;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  LogCategory *v31;
  _QWORD *v32;
  _QWORD v33[6];
  unsigned int v34;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((int)a4 > -536870369)
  {
    if ((int)a4 > -536870289)
    {
      if ((int)a4 <= -536870257)
      {
        if (a4 == -536870288)
        {
          v12 = "CanSystemSleep";
          goto LABEL_51;
        }
        if (a4 == -536870272)
        {
          v12 = "SystemWillSleep";
          goto LABEL_51;
        }
      }
      else
      {
        switch(a4)
        {
          case 0xE0000290:
            v12 = "SystemWillNotSleep";
            goto LABEL_51;
          case 0xE0000300:
            v12 = "SystemHasPoweredOn";
            goto LABEL_51;
          case 0xE0000310:
            v12 = "SystemWillRestart";
            goto LABEL_51;
        }
      }
    }
    else if ((int)a4 <= -536870337)
    {
      if (a4 == -536870368)
      {
        v12 = "DeviceWillNotPowerOff";
        goto LABEL_51;
      }
      if (a4 == -536870352)
      {
        v12 = "DeviceHasPoweredOn";
        goto LABEL_51;
      }
    }
    else
    {
      switch(a4)
      {
        case 0xE0000240:
          v12 = "CanSystemPowerOff";
          goto LABEL_51;
        case 0xE0000250:
          v12 = "SystemWillPowerOff";
          goto LABEL_51;
        case 0xE0000260:
          v12 = "SystemWillNotPowerOff";
          goto LABEL_51;
      }
    }
  }
  else if ((int)a4 > -536870641)
  {
    if ((int)a4 <= -536870609)
    {
      if (a4 == -536870640)
      {
        v12 = "WasClosed";
        goto LABEL_51;
      }
      if (a4 == -536870624)
      {
        v12 = "BusyStateChange";
        goto LABEL_51;
      }
    }
    else
    {
      switch(a4)
      {
        case 0xE0000130:
          v12 = "PropertyChange";
          goto LABEL_51;
        case 0xE0000200:
          v12 = "CanDevicePowerOff";
          goto LABEL_51;
        case 0xE0000210:
          v12 = "DeviceWillPowerOff";
          goto LABEL_51;
      }
    }
  }
  else if ((int)a4 <= -536870865)
  {
    if (a4 == -536870896)
    {
      v12 = "IsTerminated";
      goto LABEL_51;
    }
    if (a4 == -536870880)
    {
      v12 = "IsSuspended";
      goto LABEL_51;
    }
  }
  else
  {
    switch(a4)
    {
      case 0xE0000030:
        v12 = "IsResumed";
        goto LABEL_51;
      case 0xE0000100:
        v12 = "IsRequestingClose";
        goto LABEL_51;
      case 0xE0000101:
        v12 = "IsAttemptingOpen";
        goto LABEL_51;
    }
  }
  if (a4 == -536870112)
    v12 = "SystemWillPowerOn";
  else
    v12 = "?";
LABEL_51:
  ucat = self->_ucat;
  if (ucat->var0 > 30)
    goto LABEL_55;
  if (ucat->var0 != -1)
    goto LABEL_53;
  if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
  {
    ucat = self->_ucat;
LABEL_53:
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUSleepWakeMonitor _sleepWakeHandlerForService:type:arg:]", 0x1Eu, (uint64_t)"Event: %s\n", v8, v9, v10, v11, (uint64_t)v12);
  }
LABEL_55:
  HIDWORD(v15) = a4;
  LODWORD(v15) = a4 + 536870336;
  v14 = v15 >> 4;
  if (v14 > 3)
  {
    if (v14 != 4)
    {
      if (v14 == 12)
      {
        v16 = _Block_copy(self->_sleepWakeHandler);
        if (v16)
        {
          v17 = (void (*)(void))v16[2];
          v32 = v16;
          goto LABEL_76;
        }
LABEL_77:

        return;
      }
      if (v14 == 13)
      {
        v16 = _Block_copy(self->_sleepWakeHandler);
        if (v16)
        {
          v17 = (void (*)(void))v16[2];
          v32 = v16;
LABEL_76:
          v17();
          v16 = v32;
          goto LABEL_77;
        }
        goto LABEL_77;
      }
      return;
    }
    v24 = _Block_copy(self->_sleepWakeHandler);
    v25 = v24;
    if (v24)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __59__CUSleepWakeMonitor__sleepWakeHandlerForService_type_arg___block_invoke;
      v33[3] = &unk_1E25DD3C8;
      v34 = a4;
      v33[4] = self;
      v33[5] = a5;
      (*((void (**)(void *, uint64_t, _QWORD *))v24 + 2))(v24, 10, v33);
    }
    else
    {
      powerCnx = self->_powerCnx;
      if (!powerCnx)
        return;
      if (IOAllowPowerChange(powerCnx, (intptr_t)a5))
      {
        v31 = self->_ucat;
        if (v31->var0 <= 90)
        {
          if (v31->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v31, 0x5Au))
              goto LABEL_70;
            v31 = self->_ucat;
          }
          LogPrintF((uint64_t)v31, (uint64_t)"-[CUSleepWakeMonitor _sleepWakeHandlerForService:type:arg:]", 0x5Au, (uint64_t)"### Ack failed (%s): %#m\n", v27, v28, v29, v30, (uint64_t)v12);
        }
      }
    }
LABEL_70:

    return;
  }
  if (v14 == 1)
  {
    v16 = _Block_copy(self->_sleepWakeHandler);
    if (v16)
    {
      v17 = (void (*)(void))v16[2];
      v32 = v16;
      goto LABEL_76;
    }
    goto LABEL_77;
  }
  if (v14 == 3)
  {
    v18 = self->_powerCnx;
    if (v18)
    {
      if (IOAllowPowerChange(v18, (intptr_t)a5))
      {
        v23 = self->_ucat;
        if (v23->var0 <= 90)
        {
          if (v23->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v23, 0x5Au))
              return;
            v23 = self->_ucat;
          }
          LogPrintF((uint64_t)v23, (uint64_t)"-[CUSleepWakeMonitor _sleepWakeHandlerForService:type:arg:]", 0x5Au, (uint64_t)"### Ack failed (%s): %#m\n", v19, v20, v21, v22, (uint64_t)v12);
        }
      }
    }
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

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)label
{
  return self->_label;
}

- (id)sleepWakeHandler
{
  return self->_sleepWakeHandler;
}

- (void)setSleepWakeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sleepWakeHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __59__CUSleepWakeMonitor__sleepWakeHandlerForService_type_arg___block_invoke(uint64_t a1)
{
  int v1;
  NSObject *v2;
  _QWORD block[4];
  __int128 v4;
  int v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CUSleepWakeMonitor__sleepWakeHandlerForService_type_arg___block_invoke_2;
  block[3] = &unk_1E25DD3C8;
  v1 = *(_DWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  v2 = *(NSObject **)(v4 + 48);
  v5 = v1;
  dispatch_async(v2, block);
}

uint64_t __59__CUSleepWakeMonitor__sleepWakeHandlerForService_type_arg___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  io_connect_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v8 = *(_QWORD *)(result + 32);
  v9 = *(_DWORD *)(v8 + 12);
  if (!v9)
    return result;
  v10 = result;
  v11 = *(_DWORD *)(result + 48);
  if (v11 > -536870369)
  {
    if (v11 > -536870289)
    {
      if (v11 <= -536870257)
      {
        if (v11 == -536870288)
        {
          v12 = "CanSystemSleep";
          goto LABEL_52;
        }
        if (v11 == -536870272)
        {
          v12 = "SystemWillSleep";
          goto LABEL_52;
        }
      }
      else
      {
        switch(v11)
        {
          case -536870256:
            v12 = "SystemWillNotSleep";
            goto LABEL_52;
          case -536870144:
            v12 = "SystemHasPoweredOn";
            goto LABEL_52;
          case -536870128:
            v12 = "SystemWillRestart";
            goto LABEL_52;
        }
      }
    }
    else if (v11 <= -536870337)
    {
      if (v11 == -536870368)
      {
        v12 = "DeviceWillNotPowerOff";
        goto LABEL_52;
      }
      if (v11 == -536870352)
      {
        v12 = "DeviceHasPoweredOn";
        goto LABEL_52;
      }
    }
    else
    {
      switch(v11)
      {
        case -536870336:
          v12 = "CanSystemPowerOff";
          goto LABEL_52;
        case -536870320:
          v12 = "SystemWillPowerOff";
          goto LABEL_52;
        case -536870304:
          v12 = "SystemWillNotPowerOff";
          goto LABEL_52;
      }
    }
  }
  else if (v11 > -536870641)
  {
    if (v11 <= -536870609)
    {
      if (v11 == -536870640)
      {
        v12 = "WasClosed";
        goto LABEL_52;
      }
      if (v11 == -536870624)
      {
        v12 = "BusyStateChange";
        goto LABEL_52;
      }
    }
    else
    {
      switch(v11)
      {
        case -536870608:
          v12 = "PropertyChange";
          goto LABEL_52;
        case -536870400:
          v12 = "CanDevicePowerOff";
          goto LABEL_52;
        case -536870384:
          v12 = "DeviceWillPowerOff";
          goto LABEL_52;
      }
    }
  }
  else if (v11 <= -536870865)
  {
    if (v11 == -536870896)
    {
      v12 = "IsTerminated";
      goto LABEL_52;
    }
    if (v11 == -536870880)
    {
      v12 = "IsSuspended";
      goto LABEL_52;
    }
  }
  else
  {
    switch(v11)
    {
      case -536870864:
        v12 = "IsResumed";
        goto LABEL_52;
      case -536870656:
        v12 = "IsRequestingClose";
        goto LABEL_52;
      case -536870655:
        v12 = "IsAttemptingOpen";
        goto LABEL_52;
    }
  }
  if (v11 == -536870112)
    v12 = "SystemWillPowerOn";
  else
    v12 = "?";
LABEL_52:
  v13 = *(int **)(v8 + 40);
  if (*v13 <= 30)
  {
    if (*v13 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v13, 0x1Eu))
        goto LABEL_56;
      v13 = *(int **)(*(_QWORD *)(v10 + 32) + 40);
    }
    LogPrintF((uint64_t)v13, (uint64_t)"-[CUSleepWakeMonitor _sleepWakeHandlerForService:type:arg:]_block_invoke_2", 0x1Eu, (uint64_t)"Event: %s async ack\n", a5, a6, a7, a8, (uint64_t)v12);
  }
LABEL_56:
  result = IOAllowPowerChange(v9, *(_QWORD *)(v10 + 40));
  if ((_DWORD)result)
  {
    result = *(_QWORD *)(*(_QWORD *)(v10 + 32) + 40);
    if (*(int *)result <= 90)
    {
      if (*(_DWORD *)result != -1)
        return LogPrintF(result, (uint64_t)"-[CUSleepWakeMonitor _sleepWakeHandlerForService:type:arg:]_block_invoke_2", 0x5Au, (uint64_t)"### Ack failed (%s): %#m\n", v14, v15, v16, v17, (uint64_t)v12);
      result = _LogCategory_Initialize(result, 0x5Au);
      if ((_DWORD)result)
      {
        result = *(_QWORD *)(*(_QWORD *)(v10 + 32) + 40);
        return LogPrintF(result, (uint64_t)"-[CUSleepWakeMonitor _sleepWakeHandlerForService:type:arg:]_block_invoke_2", 0x5Au, (uint64_t)"### Ack failed (%s): %#m\n", v14, v15, v16, v17, (uint64_t)v12);
      }
    }
  }
  return result;
}

uint64_t __32__CUSleepWakeMonitor_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __45__CUSleepWakeMonitor_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  int *v10;
  _BOOL4 v11;
  uint64_t result;
  uint64_t v13;

  v9 = *(_QWORD **)(a1 + 32);
  v10 = (int *)v9[5];
  if (*v10 > 30)
    goto LABEL_5;
  if (*v10 != -1)
    goto LABEL_3;
  v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
  v9 = *(_QWORD **)(a1 + 32);
  if (v11)
  {
    v10 = (int *)v9[5];
LABEL_3:
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUSleepWakeMonitor activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD **)(a1 + 32);
  }
LABEL_5:
  objc_msgSend(v9, "_ensureStarted");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
