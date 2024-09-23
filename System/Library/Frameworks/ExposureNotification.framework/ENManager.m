@implementation ENManager

void __48__ENManager__activateInitial_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_entitlementCheckUpdate:", v3);
  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "_xpcHandleStatusChanged:initial:", v4, *(unsigned __int8 *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __43__ENManager_activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 8) || *(_BYTE *)(v2 + 32)) && (ENErrorF(10), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (id)v3;
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

  }
  else
  {
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_activateInitial:completionHandler:", 1, *(_QWORD *)(a1 + 40));
  }
}

_QWORD *__30__ENManager__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[5] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "_xpcReceivedEvent:", a2);
  return result;
}

uint64_t __23__ENManager_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _xpc_connection_s *v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    v2 = result;
    *(_BYTE *)(v1 + 32) = 1;
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v3 = *(_xpc_connection_s **)(*(_QWORD *)(v2 + 32) + 40);
    if (v3)
      xpc_connection_cancel(v3);
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__ENManager_invalidate__block_invoke;
  block[3] = &unk_24C38AE38;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (ENManager)init
{
  ENManager *v2;
  ENManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ENManager;
  v2 = -[ENManager init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CUXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3 = v2;
  }

  return v2;
}

- (BOOL)exposureNotificationEnabled
{
  return self->_exposureNotificationEnabled;
}

- (id)description
{
  return -[ENManager descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  NSPrintF();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  ENManager *v2;
  SEL v3;
  ENErrorHandler v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateDone)
  {
    v2 = (ENManager *)FatalErrorF();
    -[ENManager activateWithCompletionHandler:](v2, v3, v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ENManager;
    -[ENManager dealloc](&v5, sel_dealloc);
  }
}

- (void)activateWithCompletionHandler:(ENErrorHandler)completionHandler
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = completionHandler;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__ENManager_activateWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_xpcReceivedEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  OS_xpc_object *xpcCnx;
  void *v10;
  id v11;

  v11 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    -[ENManager _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v11);
  }
  else if (v11 == (id)MEMORY[0x24BDACF30])
  {
    -[ENManager _interrupted](self, "_interrupted");
  }
  else if (v11 == (id)MEMORY[0x24BDACF38])
  {
    if (!self->_invalidateCalled
      && gLogCategory__ENManager <= 90
      && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    -[ENManager _invalidated](self, "_invalidated");
  }
  else
  {
    CUXPCDecodeNSErrorIfNeeded();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      ENErrorF(1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }

}

- (void)_xpcHandleStatusChanged:(id)a3 initial:(BOOL)a4
{
  id v6;
  _BOOL4 analyticsEnabled;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  const char *v11;
  const char *v12;
  _BOOL4 exposureNotificationEnabled;
  id v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  _BOOL4 exposureNotificationPaused;
  id v19;
  _BOOL4 v20;
  const char *v21;
  const char *v22;
  unint64_t exposureNotificationStatus;
  unint64_t v24;
  id v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;

  v6 = a3;
  analyticsEnabled = self->_analyticsEnabled;
  v34 = self->_analyticsEnabled;
  if (v6)
  {
    CUXPCDecodeBool();
    v8 = 0;
    if (v8
      && gLogCategory__ENManager <= 90
      && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    v8 = 0;
    v34 = 0;
  }
  v9 = v34;
  v10 = v34 != analyticsEnabled;
  if (v34 != analyticsEnabled)
  {
    if (gLogCategory_ENManager <= 30)
    {
      if (gLogCategory_ENManager != -1)
      {
LABEL_10:
        if (analyticsEnabled)
          v11 = "yes";
        else
          v11 = "no";
        if (v9)
          v12 = "yes";
        else
          v12 = "no";
        v30 = (void *)v11;
        v31 = v12;
        LogPrintF_safe();
        goto LABEL_18;
      }
      if (_LogCategory_Initialize())
      {
        v9 = v34;
        goto LABEL_10;
      }
    }
LABEL_18:
    -[ENManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("analyticsEnabled"), v30, v31);
    self->_analyticsEnabled = v34;
    -[ENManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("analyticsEnabled"));
  }
  exposureNotificationEnabled = self->_exposureNotificationEnabled;
  v33 = self->_exposureNotificationEnabled;

  if (v6)
  {
    CUXPCDecodeBool();
    v14 = 0;
    if (v14
      && gLogCategory__ENManager <= 90
      && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    v14 = 0;
    v33 = 0;
  }
  v15 = v33;
  if (v33 != exposureNotificationEnabled)
  {
    if (gLogCategory_ENManager <= 30)
    {
      if (gLogCategory_ENManager != -1)
      {
LABEL_28:
        if (exposureNotificationEnabled)
          v16 = "yes";
        else
          v16 = "no";
        if (v15)
          v17 = "yes";
        else
          v17 = "no";
        v30 = (void *)v16;
        v31 = v17;
        LogPrintF_safe();
        goto LABEL_36;
      }
      if (_LogCategory_Initialize())
      {
        v15 = v33;
        goto LABEL_28;
      }
    }
LABEL_36:
    -[ENManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("exposureNotificationEnabled"), v30, v31);
    self->_exposureNotificationEnabled = v33;
    -[ENManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("exposureNotificationEnabled"));
    v10 = 1;
  }
  exposureNotificationPaused = self->_exposureNotificationPaused;
  v32 = self->_exposureNotificationPaused;

  if (v6)
  {
    CUXPCDecodeBool();
    v19 = 0;
    if (v19
      && gLogCategory__ENManager <= 90
      && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    v19 = 0;
    v32 = 0;
  }
  v20 = v32;
  if (v32 != exposureNotificationPaused)
  {
    if (gLogCategory_ENManager <= 30)
    {
      if (gLogCategory_ENManager != -1)
      {
LABEL_46:
        if (exposureNotificationPaused)
          v21 = "yes";
        else
          v21 = "no";
        if (v20)
          v22 = "yes";
        else
          v22 = "no";
        v30 = (void *)v21;
        v31 = v22;
        LogPrintF_safe();
        goto LABEL_54;
      }
      if (_LogCategory_Initialize())
      {
        v20 = v32;
        goto LABEL_46;
      }
    }
LABEL_54:
    -[ENManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("exposureNotificationPaused"), v30, v31);
    self->_exposureNotificationPaused = v32;
    -[ENManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("exposureNotificationPaused"));
    v10 = 1;
  }
  exposureNotificationStatus = self->_exposureNotificationStatus;

  if (v6)
  {
    if (CUXPCDecodeSInt64RangedEx() == 6)
      v24 = 0;
    else
      v24 = exposureNotificationStatus;
    v25 = 0;
    if (v25
      && gLogCategory__ENManager <= 90
      && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    v25 = 0;
    v24 = 0;
  }
  if (v24 != exposureNotificationStatus)
  {
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    {
      if (exposureNotificationStatus > 6)
        v26 = "?";
      else
        v26 = (&off_24C38B9C8)[exposureNotificationStatus];
      if (v24 > 6)
        v27 = "?";
      else
        v27 = (&off_24C38B9C8)[v24];
      v30 = (void *)v26;
      v31 = v27;
      LogPrintF_safe();
    }
    -[ENManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("exposureNotificationStatus"), v30, v31);
    self->_exposureNotificationStatus = v24;
    -[ENManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("exposureNotificationStatus"));
    v10 = 1;
  }
  if (v10 && !a4)
  {
    v28 = MEMORY[0x20BD2F464](self->_statusChangedHandler);
    v29 = (void *)v28;
    if (v28)
      (*(void (**)(uint64_t))(v28 + 16))(v28);

  }
}

- (BOOL)_setActivationPropertiesOnRequest:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  int Int64Ranged;
  char v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    v9 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    if (v9)
      xpc_dictionary_set_string(v8, "aiRegion", v9);

    Int64Ranged = CFDictionaryGetInt64Ranged();
    xpc_dictionary_set_int64(v4, "apiV", Int64Ranged);

  }
  v11 = dyld_program_sdk_at_least();
  xpc_dictionary_set_BOOL(v4, "preV2", v11 != 1);

  return 1;
}

- (void)_invalidated
{
  id activityHandler;
  id diagnosisKeysAvailableHandler;
  id invalidationHandler;
  id statusChangedHandler;
  void *v7;
  int v8;
  uint64_t v9;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    v9 = MEMORY[0x20BD2F464](self->_invalidationHandler, a2);
    activityHandler = self->_activityHandler;
    self->_activityHandler = 0;

    diagnosisKeysAvailableHandler = self->_diagnosisKeysAvailableHandler;
    self->_diagnosisKeysAvailableHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    statusChangedHandler = self->_statusChangedHandler;
    self->_statusChangedHandler = 0;

    v7 = (void *)v9;
    if (v9)
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
      v7 = (void *)v9;
    }
    self->_invalidateDone = 1;
    if (gLogCategory_ENManager <= 30)
    {
      if (gLogCategory_ENManager != -1 || (v8 = _LogCategory_Initialize(), v7 = (void *)v9, v8))
      {
        LogPrintF_safe();
        v7 = (void *)v9;
      }
    }

  }
}

- (void)_entitlementCheckUpdate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", CFSTR("ENErrorDomain")))
    {
      v5 = objc_msgSend(v7, "code");

      if (v5 == 3)
      {
        pthread_mutex_lock(&gENManagerLock);
        gENManagerEntitledState = 5;
        pthread_mutex_unlock(&gENManagerLock);
        if (gLogCategory_ENManager > 30 || gLogCategory_ENManager == -1 && !_LogCategory_Initialize())
          goto LABEL_19;
LABEL_9:
        LogPrintF_safe();
        goto LABEL_19;
      }
    }
    else
    {

    }
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    pthread_mutex_lock(&gENManagerLock);
    gENManagerEntitledState = 6;
    pthread_mutex_unlock(&gENManagerLock);
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
      goto LABEL_9;
  }
LABEL_19:

}

- (id)_ensureXPCStarted
{
  OS_xpc_object **p_xpcCnx;
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  OS_xpc_object *v6;
  _xpc_connection_s *mach_service;
  _QWORD v9[5];
  OS_xpc_object *v10;

  p_xpcCnx = &self->_xpcCnx;
  v4 = self->_xpcCnx;
  if (!v4)
  {
    v5 = self->_testListenerEndpoint;
    v6 = v5;
    if (v5)
    {
      mach_service = xpc_connection_create_from_endpoint(v5);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.ExposureNotification", (dispatch_queue_t)self->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __30__ENManager__ensureXPCStarted__block_invoke;
    v9[3] = &unk_24C38B4B0;
    v9[4] = self;
    v4 = mach_service;
    v10 = v4;
    xpc_connection_set_event_handler(v4, v9);
    xpc_connection_activate(v4);

  }
  return v4;
}

- (void)_activateInitial:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  xpc_object_t v8;
  BOOL v9;
  id v10;
  _xpc_connection_s *v11;
  NSObject *dispatchQueue;
  void *v13;
  _QWORD handler[5];
  id v15;
  BOOL v16;
  id v17;

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    v7 = (void *)xpc_copy_entitlement_for_self();
    if (v7)
    {
      self->_isTestEntitlement = 1;
      if (gLogCategory_ENManager <= 50 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
    }

  }
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, "mTyp", 10);
  v17 = 0;
  v9 = -[ENManager _setActivationPropertiesOnRequest:error:](self, "_setActivationPropertiesOnRequest:error:", v8, &v17);
  v10 = v17;
  if (v9)
  {
    -[ENManager _ensureXPCStarted](self, "_ensureXPCStarted");
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __48__ENManager__activateInitial_completionHandler___block_invoke;
    handler[3] = &unk_24C38B468;
    v16 = v4;
    handler[4] = self;
    v15 = v6;
    xpc_connection_send_message_with_reply(v11, v8, dispatchQueue, handler);

  }
  else
  {
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*((void (**)(id, id))v6 + 2))(v6, v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusChangedHandler, 0);
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_diagnosisKeysAvailableHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_activityHandler, 0);
  objc_storeStrong((id *)&self->_remotePresentationController, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_exposureWindows, 0);
  objc_storeStrong((id *)&self->_detectionSession, 0);
}

+ (ENAuthorizationStatus)authorizationStatus
{
  int v2;

  v2 = TCCAccessPreflight();
  if (!v2)
    return 3;
  if (v2 != 1)
    return (unint64_t)(TCCAccessRestricted() != 0);
  if (TCCAccessRestricted())
    return 1;
  return 2;
}

- (void)_reactivate
{
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  -[ENManager _activateInitial:completionHandler:](self, "_activateInitial:completionHandler:", 0, &__block_literal_global_0);
}

void __24__ENManager__reactivate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  id v7;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory__ENManager <= 90)
    {
      v7 = v2;
      if (gLogCategory__ENManager != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
        CUPrintNSError();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

LABEL_8:
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_ENManager <= 30)
  {
    v7 = 0;
    if (gLogCategory_ENManager != -1 || (v5 = _LogCategory_Initialize(), v3 = 0, v5))
    {
      LogPrintF_safe();
      goto LABEL_8;
    }
  }

}

- (void)_interrupted
{
  if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  -[ENManager _xpcHandleStatusChanged:initial:](self, "_xpcHandleStatusChanged:initial:", 0, 0);
  if (self->_activateCalled)
    -[ENManager _reactivate](self, "_reactivate");
}

- (void)_invalidate
{
  ENExposureDetectionClientSession *detectionSession;
  OS_xpc_object *xpcCnx;

  if (!self->_invalidateCalled
    && gLogCategory_ENManager <= 30
    && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  self->_invalidateCalled = 1;
  -[ENExposureDetectionClientSession invalidate](self->_detectionSession, "invalidate");
  detectionSession = self->_detectionSession;
  self->_detectionSession = 0;

  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
    xpc_connection_cancel(xpcCnx);
  -[ENManager _invalidated](self, "_invalidated");
}

- (void)_entitlementCheckWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  int v5;
  void *v6;
  xpc_object_t v7;
  _xpc_connection_s *v8;
  NSObject *dispatchQueue;
  _QWORD handler[5];
  void (**v11)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (self->_exposureNotificationStatus == 4 && !self->_isTestEntitlement)
    goto LABEL_15;
  pthread_mutex_lock(&gENManagerLock);
  v5 = gENManagerEntitledState;
  pthread_mutex_unlock(&gENManagerLock);
  if (v5 == 5)
  {
    ENErrorF(3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

    goto LABEL_12;
  }
  if (v5 == 6)
  {
    v4[2](v4, 0);
  }
  else
  {
LABEL_15:
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "mTyp", 13);
    -[ENManager _ensureXPCStarted](self, "_ensureXPCStarted");
    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __45__ENManager__entitlementCheckWithCompletion___block_invoke;
    handler[3] = &unk_24C38B4D8;
    handler[4] = self;
    v11 = v4;
    xpc_connection_send_message_with_reply(v8, v7, dispatchQueue, handler);

  }
LABEL_12:

}

void __45__ENManager__entitlementCheckWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_entitlementCheckUpdate:", v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getUserTraveledWithCompletionHandler:(ENGetUserTraveledHandler)completionHandler
{
  ENGetUserTraveledHandler v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = completionHandler;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_24C38B528;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_tccCheckWithCompletion:", v4);

}

void __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke_2(uint64_t a1, size_t count)
{
  xpc_object_t v3;
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;

  if (count)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "mTyp", 15);
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke_3;
    handler[3] = &unk_24C38B500;
    v8 = v5;
    xpc_connection_send_message_with_reply(v4, v3, v6, handler);

  }
}

void __50__ENManager_getUserTraveledWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  xpc_object_t xdict;

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    xpc_dictionary_get_BOOL(xdict, "userTraveled");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_tccCheckWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__ENManager__tccCheckWithCompletion___block_invoke;
  v6[3] = &unk_24C38B528;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ENManager _entitlementCheckWithCompletion:](self, "_entitlementCheckWithCompletion:", v6);

}

void __37__ENManager__tccCheckWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t v4;
  _xpc_connection_s *v5;
  void *v6;
  NSObject *v7;
  _QWORD handler[4];
  id v9;

  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "mTyp", 70);
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __37__ENManager__tccCheckWithCompletion___block_invoke_2;
    handler[3] = &unk_24C38B500;
    v9 = v6;
    xpc_connection_send_message_with_reply(v5, v4, v7, handler);

  }
}

void __37__ENManager__tccCheckWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_xpcReceivedMessage:(id)a3
{
  int64_t int64;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  int64 = xpc_dictionary_get_int64(v7, "mTyp");
  switch(int64)
  {
    case 12:
      -[ENManager _xpcHandleStatusChanged:initial:](self, "_xpcHandleStatusChanged:initial:", v7, 0);
      goto LABEL_10;
    case 24:
      -[ENManager _xpcHandlePreAuthorizedDiagnosisKeysAvailable:](self, "_xpcHandlePreAuthorizedDiagnosisKeysAvailable:", v7);
      goto LABEL_10;
    case 19:
      -[ENManager _xpcHandleActivity:](self, "_xpcHandleActivity:", v7);
LABEL_10:
      v5 = v7;
      goto LABEL_11;
  }
  v5 = v7;
  if (gLogCategory__ENManager <= 90)
  {
    if (gLogCategory__ENManager != -1 || (v6 = _LogCategory_Initialize(), v5 = v7, v6))
    {
      LogPrintF_safe();
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)_xpcHandleActivity:(id)a3
{
  uint64_t uint64;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  uint64 = xpc_dictionary_get_uint64(a3, "actF");
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD2F464](self->_activityHandler);
  if (v5)
  {
    v6 = v5;
    v5[2](v5, uint64);
    v5 = (void (**)(_QWORD, _QWORD))v6;
  }

}

- (void)_xpcHandlePreAuthorizedDiagnosisKeysAvailable:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD applier[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD2F464](self->_diagnosisKeysAvailableHandler);
  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__2;
    v18 = __Block_byref_object_dispose__2;
    v6 = MEMORY[0x24BDAC760];
    v19 = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__ENManager__xpcHandlePreAuthorizedDiagnosisKeysAvailable___block_invoke;
    v13[3] = &unk_24C38ACD0;
    v13[4] = &v14;
    v7 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v13);
    xpc_dictionary_get_value(v4, "tekA");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8 && MEMORY[0x20BD2F7B8](v8) == MEMORY[0x24BDACF78])
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      applier[0] = v6;
      applier[1] = 3221225472;
      applier[2] = __59__ENManager__xpcHandlePreAuthorizedDiagnosisKeysAvailable___block_invoke_2;
      applier[3] = &unk_24C38AFC8;
      applier[4] = v10;
      applier[5] = &v14;
      xpc_array_apply(v9, applier);
      if (!v15[5])
      {
        if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v10, "count");
          LogPrintF_safe();
        }
        ((void (**)(_QWORD, id))v5)[2](v5, v10);
      }
    }
    else
    {
      ENErrorF(15);
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = (id)v15[5];
      v15[5] = v11;
    }

    v7[2](v7);
    _Block_object_dispose(&v14, 8);

  }
}

void __59__ENManager__xpcHandlePreAuthorizedDiagnosisKeysAvailable___block_invoke(uint64_t a1)
{
  id v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && gLogCategory__ENManager <= 90
    && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

BOOL __59__ENManager__xpcHandlePreAuthorizedDiagnosisKeysAvailable___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ENTemporaryExposureKey *v5;
  uint64_t v6;
  ENTemporaryExposureKey *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENTemporaryExposureKey alloc];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENTemporaryExposureKey initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      ENNestedErrorF(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 2);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (void)setExposureNotificationEnabled:(BOOL)enabled completionHandler:(ENErrorHandler)completionHandler
{
  ENErrorHandler v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = completionHandler;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke;
  block[3] = &unk_24C38B578;
  block[4] = self;
  v10 = v6;
  v11 = enabled;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;
  char v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke_2;
  v4[3] = &unk_24C38B550;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_tccCheckWithCompletion:", v4);

}

void __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  xpc_object_t v3;
  _xpc_connection_s *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "mTyp", 11);
    xpc_dictionary_set_BOOL(v3, "enbd", *(_BYTE *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(v5 + 80);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke_3;
    v8[3] = &unk_24C38B4D8;
    v8[4] = v5;
    v9 = v6;
    xpc_connection_send_message_with_reply(v4, v3, v7, v8);

  }
}

void __62__ENManager_setExposureNotificationEnabled_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "_xpcHandleStatusChanged:initial:", v4, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setPaused:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ENManager_setPaused_completionHandler___block_invoke;
  block[3] = &unk_24C38B578;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __41__ENManager_setPaused_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 14);
  xpc_dictionary_set_BOOL(v2, "paus", *(_BYTE *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 80);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__ENManager_setPaused_completionHandler___block_invoke_2;
  v7[3] = &unk_24C38B4D8;
  v7[4] = v4;
  v8 = v5;
  xpc_connection_send_message_with_reply(v3, v2, v6, v7);

}

void __41__ENManager_setPaused_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "_xpcHandleStatusChanged:initial:", v4, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)pauseWithExpiration:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  double v12;

  v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    CUPrintDurationDouble();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ENManager_pauseWithExpiration_completionHandler___block_invoke;
  block[3] = &unk_24C38AED8;
  v12 = a3;
  block[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __51__ENManager_pauseWithExpiration_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 14);
  xpc_dictionary_set_BOOL(v2, "paus", 1);
  xpc_dictionary_set_double(v2, "dura", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 80);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__ENManager_pauseWithExpiration_completionHandler___block_invoke_2;
  v7[3] = &unk_24C38B4D8;
  v7[4] = v4;
  v8 = v5;
  xpc_connection_send_message_with_reply(v3, v2, v6, v7);

}

void __51__ENManager_pauseWithExpiration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "_xpcHandleStatusChanged:initial:", v4, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getPreAuthorizeDiagnosisKeysEnabledForRegion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__ENManager_getPreAuthorizeDiagnosisKeysEnabledForRegion_completionHandler___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __76__ENManager_getPreAuthorizeDiagnosisKeysEnabledForRegion_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _xpc_connection_s *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 210);
  v3 = *(_QWORD *)(a1 + 32);
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    xpc_dictionary_set_data(v2, "regionData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 48);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __76__ENManager_getPreAuthorizeDiagnosisKeysEnabledForRegion_completionHandler___block_invoke_2;
    v10[3] = &unk_24C38B500;
    v11 = v8;
    xpc_connection_send_message_with_reply(v7, v2, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __76__ENManager_getPreAuthorizeDiagnosisKeysEnabledForRegion_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  xpc_object_t xdict;

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    xpc_dictionary_get_BOOL(xdict, "enbd");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setPreAuthorizeDiagnosisKeysEnabled:(BOOL)a3 region:(id)a4 completionHandler:(id)a5
{
  -[ENManager _setPreAuthorizeDiagnosisKeysEnabled:region:metadata:completionHandler:](self, "_setPreAuthorizeDiagnosisKeysEnabled:region:metadata:completionHandler:", a3, a4, 0, a5);
}

- (void)_setPreAuthorizeDiagnosisKeysEnabled:(BOOL)a3 region:(id)a4 metadata:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *dispatchQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  ENManager *v20;
  id v21;
  BOOL v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (gLogCategory_ENManager <= 30)
  {
    if (gLogCategory_ENManager != -1 || _LogCategory_Initialize())
      LogPrintF_safe();
    if (gLogCategory_ENManager <= 10 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__ENManager__setPreAuthorizeDiagnosisKeysEnabled_region_metadata_completionHandler___block_invoke;
  block[3] = &unk_24C38B5C8;
  v22 = a3;
  v18 = v11;
  v19 = v10;
  v20 = self;
  v21 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(dispatchQueue, block);

}

void __84__ENManager__setPreAuthorizeDiagnosisKeysEnabled_region_metadata_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _xpc_connection_s *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 211);
  xpc_dictionary_set_BOOL(v2, "enbd", *(_BYTE *)(a1 + 64));
  if (*(_QWORD *)(a1 + 32))
    xpc_dictionary_set_cf_object();
  v3 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    xpc_dictionary_set_data(v2, "regionData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
    objc_msgSend(*(id *)(a1 + 48), "_ensureXPCStarted");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 56);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 80);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __84__ENManager__setPreAuthorizeDiagnosisKeysEnabled_region_metadata_completionHandler___block_invoke_2;
    v10[3] = &unk_24C38B500;
    v11 = v8;
    xpc_connection_send_message_with_reply(v7, v2, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __84__ENManager__setPreAuthorizeDiagnosisKeysEnabled_region_metadata_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getRegionHistoryEnabledWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__ENManager_getRegionHistoryEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __58__ENManager_getRegionHistoryEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 56);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __58__ENManager_getRegionHistoryEnabledWithCompletionHandler___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __58__ENManager_getRegionHistoryEnabledWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  xpc_object_t xdict;

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    xpc_dictionary_get_BOOL(xdict, "enbd");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setRegionHistoryEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ENManager_setRegionHistoryEnabled_completionHandler___block_invoke;
  block[3] = &unk_24C38B578;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __55__ENManager_setRegionHistoryEnabled_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 57);
  xpc_dictionary_set_BOOL(v2, "enbd", *(_BYTE *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __55__ENManager_setRegionHistoryEnabled_completionHandler___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __55__ENManager_setRegionHistoryEnabled_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getRegionMonitorEnabledWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__ENManager_getRegionMonitorEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __58__ENManager_getRegionMonitorEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 61);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __58__ENManager_getRegionMonitorEnabledWithCompletionHandler___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __58__ENManager_getRegionMonitorEnabledWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  xpc_object_t xdict;

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    xpc_dictionary_get_BOOL(xdict, "enbd");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getTravelStatusEnabledWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__ENManager_getTravelStatusEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __57__ENManager_getTravelStatusEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 17);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __57__ENManager_getTravelStatusEnabledWithCompletionHandler___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __57__ENManager_getTravelStatusEnabledWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  xpc_object_t xdict;

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    xpc_dictionary_get_BOOL(xdict, "enbd");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getTravelStatusEnabledForRegion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ENManager_getTravelStatusEnabledForRegion_completionHandler___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __63__ENManager_getTravelStatusEnabledForRegion_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  BOOL v4;
  id v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 17);
  v3 = *(void **)(a1 + 32);
  v11 = 0;
  v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v11);
  v5 = v11;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__ENManager_getTravelStatusEnabledForRegion_completionHandler___block_invoke_2;
    v9[3] = &unk_24C38B500;
    v10 = v7;
    xpc_connection_send_message_with_reply(v6, v2, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __63__ENManager_getTravelStatusEnabledForRegion_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  xpc_object_t xdict;

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    xpc_dictionary_get_BOOL(xdict, "enbd");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setTravelStatusEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__ENManager_setTravelStatusEnabled_completionHandler___block_invoke;
  block[3] = &unk_24C38B578;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __54__ENManager_setTravelStatusEnabled_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 18);
  xpc_dictionary_set_BOOL(v2, "enbd", *(_BYTE *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __54__ENManager_setTravelStatusEnabled_completionHandler___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __54__ENManager_setTravelStatusEnabled_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setTravelStatusEnabled:(BOOL)a3 region:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  ENManager *v15;
  id v16;
  BOOL v17;

  v8 = a4;
  v9 = a5;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ENManager_setTravelStatusEnabled_region_completionHandler___block_invoke;
  block[3] = &unk_24C38B5F0;
  v17 = a3;
  v15 = self;
  v16 = v9;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, block);

}

void __61__ENManager_setTravelStatusEnabled_region_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  BOOL v4;
  id v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 18);
  xpc_dictionary_set_BOOL(v2, "enbd", *(_BYTE *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  v11 = 0;
  v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v11);
  v5 = v11;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__ENManager_setTravelStatusEnabled_region_completionHandler___block_invoke_2;
    v9[3] = &unk_24C38B500;
    v10 = v7;
    xpc_connection_send_message_with_reply(v6, v2, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __61__ENManager_setTravelStatusEnabled_region_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSProgress)detectExposuresWithConfiguration:(ENExposureConfiguration *)configuration completionHandler:(ENDetectExposuresHandler)completionHandler
{
  return -[ENManager detectExposuresWithConfiguration:diagnosisKeyURLs:completionHandler:](self, "detectExposuresWithConfiguration:diagnosisKeyURLs:completionHandler:", configuration, MEMORY[0x24BDBD1A8], completionHandler);
}

- (NSProgress)detectExposuresWithConfiguration:(ENExposureConfiguration *)configuration diagnosisKeyURLs:(NSArray *)diagnosisKeyURLs completionHandler:(ENDetectExposuresHandler)completionHandler
{
  ENExposureConfiguration *v8;
  NSArray *v9;
  ENDetectExposuresHandler v10;
  ENExposureDetectionClientSession *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *dispatchQueue;
  _QWORD block[6];
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = configuration;
  v9 = diagnosisKeyURLs;
  v10 = completionHandler;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    -[NSArray count](v9, "count");
    LogPrintF_safe();
  }
  v11 = objc_alloc_init(ENExposureDetectionClientSession);
  -[ENExposureDetectionClientSession setCompletionHandler:](v11, "setCompletionHandler:", v10);
  -[ENExposureDetectionClientSession setConfiguration:](v11, "setConfiguration:", v8);
  -[ENExposureDetectionClientSession setDiagnosisKeyURLs:](v11, "setDiagnosisKeyURLs:", v9);
  -[ENExposureDetectionClientSession setDispatchQueue:](v11, "setDispatchQueue:", self->_dispatchQueue);
  -[ENExposureDetectionClientSession setManager:](v11, "setManager:", self);
  v12 = objc_alloc(MEMORY[0x24BDD1768]);
  v18 = CFSTR("ENProgressOwnerKey");
  v19[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithParent:userInfo:", 0, v13);

  -[ENExposureDetectionClientSession setProgress:](v11, "setProgress:", v14);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__ENManager_detectExposuresWithConfiguration_diagnosisKeyURLs_completionHandler___block_invoke;
  block[3] = &unk_24C38B618;
  block[4] = self;
  block[5] = v11;
  dispatch_async(dispatchQueue, block);

  return (NSProgress *)v14;
}

uint64_t __81__ENManager_detectExposuresWithConfiguration_diagnosisKeyURLs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
    && gLogCategory_ENManager <= 30
    && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "activate");
}

- (NSProgress)getExposureInfoFromSummary:(ENExposureDetectionSummary *)summary userExplanation:(NSString *)userExplanation completionHandler:(ENGetExposureInfoHandler)completionHandler
{
  NSString *v7;
  id v8;
  NSObject *dispatchQueue;
  id v10;
  NSString *v11;
  id v12;
  _QWORD block[4];
  NSString *v15;
  ENManager *v16;
  id v17;

  v7 = userExplanation;
  v8 = completionHandler;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ENManager_getExposureInfoFromSummary_userExplanation_completionHandler___block_invoke;
  block[3] = &unk_24C38AEB0;
  v15 = v7;
  v16 = self;
  v17 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(dispatchQueue, block);
  v12 = objc_alloc_init(MEMORY[0x24BDD1768]);

  return (NSProgress *)v12;
}

void __74__ENManager_getExposureInfoFromSummary_userExplanation_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 43);
  xpc_dictionary_set_string(v2, "auEx", (const char *)objc_msgSend(*(id *)(a1 + 32), "utf8ValueSafe"));
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = *(NSObject **)(v4 + 80);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__ENManager_getExposureInfoFromSummary_userExplanation_completionHandler___block_invoke_2;
  v7[3] = &unk_24C38B4D8;
  v7[4] = v4;
  v8 = v5;
  xpc_connection_send_message_with_reply(v3, v2, v6, v7);

}

uint64_t __74__ENManager_getExposureInfoFromSummary_userExplanation_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getExposureInfoCompleted:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_getExposureInfoCompleted:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  ENExposureDetectionClientSession *detectionSession;
  _QWORD v17[6];
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v8 = MEMORY[0x24BDAC760];
  v26 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__ENManager__getExposureInfoCompleted_completionHandler___block_invoke;
  v18[3] = &unk_24C38B640;
  v20 = &v21;
  v9 = v7;
  v19 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v18);
  CUXPCDecodeNSErrorIfNeeded();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v22[5];
  v22[5] = v11;

  if (!v22[5])
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    xpc_dictionary_get_array(v6, "exIA");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14
      || (v17[0] = v8,
          v17[1] = 3221225472,
          v17[2] = __57__ENManager__getExposureInfoCompleted_completionHandler___block_invoke_2,
          v17[3] = &unk_24C38AFC8,
          v17[4] = v13,
          v17[5] = &v21,
          xpc_array_apply(v14, v17),
          !v22[5]))
    {
      (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v13, 0);
      -[ENExposureDetectionClientSession invalidate](self->_detectionSession, "invalidate");
      detectionSession = self->_detectionSession;
      self->_detectionSession = 0;

    }
  }
  v10[2](v10);

  _Block_object_dispose(&v21, 8);
}

uint64_t __57__ENManager__getExposureInfoCompleted_completionHandler___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

BOOL __57__ENManager__getExposureInfoCompleted_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ENExposureInfo *v5;
  uint64_t v6;
  ENExposureInfo *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENExposureInfo alloc];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENExposureInfo initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      ENErrorF(12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (NSProgress)getExposureWindowsFromSummary:(ENExposureDetectionSummary *)summary completionHandler:(ENGetExposureWindowsHandler)completionHandler
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v5 = completionHandler;
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__ENManager_getExposureWindowsFromSummary_completionHandler___block_invoke;
  v10[3] = &unk_24C38AE10;
  v10[4] = self;
  v11 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v10);
  v8 = objc_alloc_init(MEMORY[0x24BDD1768]);

  return (NSProgress *)v8;
}

uint64_t __61__ENManager_getExposureWindowsFromSummary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_getExposureWindowsFromIndex:completionHandler:", 0, *(_QWORD *)(a1 + 40));
}

- (void)_getExposureWindowsFromIndex:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  xpc_object_t v7;
  _xpc_connection_s *v8;
  NSObject *dispatchQueue;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "mTyp", 44);
  xpc_dictionary_set_uint64(v7, "expWndIdx", a3);
  -[ENManager _ensureXPCStarted](self, "_ensureXPCStarted");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__ENManager__getExposureWindowsFromIndex_completionHandler___block_invoke;
  v11[3] = &unk_24C38B4D8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  xpc_connection_send_message_with_reply(v8, v7, dispatchQueue, v11);

}

uint64_t __60__ENManager__getExposureWindowsFromIndex_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getExposureWindowsCompleted:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_getExposureWindowsCompleted:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *exposureWindows;
  void *v15;
  void *v16;
  uint64_t uint64;
  NSMutableArray *v18;
  ENExposureDetectionClientSession *detectionSession;
  uint64_t v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[4];
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v7 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  v8 = MEMORY[0x24BDAC760];
  v32 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __60__ENManager__getExposureWindowsCompleted_completionHandler___block_invoke;
  v24[3] = &unk_24C38B668;
  v26 = &v27;
  v9 = v7;
  v24[4] = self;
  v25 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v24);
  CUXPCDecodeNSErrorIfNeeded();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v28[5];
  v28[5] = v11;

  if (!v28[5])
  {
    if (self->_invalidateCalled)
    {
      ENErrorF(6);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v28[5];
      v28[5] = v20;

    }
    else
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      v23[3] = 0;
      if (!self->_exposureWindows)
      {
        v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        exposureWindows = self->_exposureWindows;
        self->_exposureWindows = v13;

      }
      xpc_dictionary_get_array(v6, "expWndA");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v15)
        goto LABEL_7;
      v22[0] = v8;
      v22[1] = 3221225472;
      v22[2] = __60__ENManager__getExposureWindowsCompleted_completionHandler___block_invoke_2;
      v22[3] = &unk_24C38B690;
      v22[4] = self;
      v22[5] = &v27;
      v22[6] = v23;
      xpc_array_apply(v15, v22);
      if (!v28[5])
      {
LABEL_7:
        uint64 = xpc_dictionary_get_uint64(v6, "expWndIdx");
        if (uint64)
        {
          -[ENManager _getExposureWindowsFromIndex:completionHandler:](self, "_getExposureWindowsFromIndex:completionHandler:", uint64, v9);
        }
        else
        {
          (*((void (**)(id, NSMutableArray *))v9 + 2))(v9, self->_exposureWindows);
          v18 = self->_exposureWindows;
          self->_exposureWindows = 0;

          -[ENExposureDetectionClientSession invalidate](self->_detectionSession, "invalidate");
          detectionSession = self->_detectionSession;
          self->_detectionSession = 0;

        }
      }

      _Block_object_dispose(v23, 8);
    }
  }
  v10[2](v10);

  _Block_object_dispose(&v27, 8);
}

void __60__ENManager__getExposureWindowsCompleted_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    (*(void (**)(void))(a1[5] + 16))();
    v2 = a1[4];
    v3 = *(void **)(v2 + 24);
    *(_QWORD *)(v2 + 24) = 0;

    objc_msgSend(*(id *)(a1[4] + 16), "invalidate");
    v4 = a1[4];
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

  }
}

BOOL __60__ENManager__getExposureWindowsCompleted_completionHandler___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  ENExposureWindow *v5;
  uint64_t v6;
  ENExposureWindow *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENExposureWindow alloc];
    v6 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENExposureWindow initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1[4] + 24), "addObject:", v7);
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    }
    else
    {
      ENErrorF(12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1[5] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[5] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (void)preAuthorizeDiagnosisKeysWithCompletionHandler:(ENErrorHandler)completionHandler
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = completionHandler;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__ENManager_preAuthorizeDiagnosisKeysWithCompletionHandler___block_invoke;
  v6[3] = &unk_24C38B6E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ENManager _checkRemoteDialogueRequirementForRequestType:completionHandler:](self, "_checkRemoteDialogueRequirementForRequestType:completionHandler:", 3, v6);

}

void __60__ENManager_preAuthorizeDiagnosisKeysWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void (*v10)(void);
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_7:
    v10();
    goto LABEL_4;
  }
  if (!v5)
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  v7 = v5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__ENManager_preAuthorizeDiagnosisKeysWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_24C38B6B8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v12 = v7;
  v13 = v9;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "_handleRemotePresentationRequest:completionHandler:", v7, v11);

LABEL_4:
}

void __60__ENManager_preAuthorizeDiagnosisKeysWithCompletionHandler___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "receiptId");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_preAuthorizeDiagnosisKeysWithSessionID:completionHandler:");
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    ENErrorF(1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

}

- (void)_preAuthorizeDiagnosisKeysWithSessionID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__ENManager__preAuthorizeDiagnosisKeysWithSessionID_completionHandler___block_invoke;
  block[3] = &unk_24C38AEB0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __71__ENManager__preAuthorizeDiagnosisKeysWithSessionID_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  unsigned __int8 uuid[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 16);
  *(_QWORD *)uuid = 0;
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "getUUIDBytes:", uuid);
  xpc_dictionary_set_uuid(v2, "rpsid", uuid);
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__ENManager__preAuthorizeDiagnosisKeysWithSessionID_completionHandler___block_invoke_2;
  v6[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);

}

void __71__ENManager__preAuthorizeDiagnosisKeysWithSessionID_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_checkRemoteDialogueRequirementForRequestType:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke;
  block[3] = &unk_24C38AED8;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke_2;
  v5[3] = &unk_24C38B708;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "_tccCheckWithCompletion:", v5);

}

void __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke_2(uint64_t a1, size_t count)
{
  xpc_object_t v3;
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;

  if (count)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "mTyp", 212);
    xpc_dictionary_set_int64(v3, "rprt", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke_3;
    handler[3] = &unk_24C38B500;
    v8 = v5;
    xpc_connection_send_message_with_reply(v4, v3, v6, handler);

  }
}

void __77__ENManager__checkRemoteDialogueRequirementForRequestType_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (xpc_dictionary_get_BOOL(v3, "rpn"))
    {
      v5 = objc_opt_class();
      v8 = 0;
      ENXPCDecodeSecureObject(v3, "rpr", v5, &v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if (!v6
        && gLogCategory__ENManager <= 90
        && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v7 = 0;
    }
    if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }

}

- (void)didEnterLegalConsentPage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ENManager_didEnterLegalConsentPage_completionHandler___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __56__ENManager_didEnterLegalConsentPage_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _xpc_connection_s *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 219);
  v3 = *(_QWORD *)(a1 + 32);
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    xpc_dictionary_set_data(v2, "regionData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 48);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__ENManager_didEnterLegalConsentPage_completionHandler___block_invoke_2;
    v10[3] = &unk_24C38B500;
    v11 = v8;
    xpc_connection_send_message_with_reply(v7, v2, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __56__ENManager_didEnterLegalConsentPage_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_handleRemotePresentationRequest:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  ENUIRemotePresentationController *remotePresentationController;
  ENUIRemotePresentationController *v8;
  ENUIRemotePresentationController *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  remotePresentationController = self->_remotePresentationController;
  if (remotePresentationController
    || (ENUICreateRemotePresentationController(),
        v8 = (ENUIRemotePresentationController *)objc_claimAutoreleasedReturnValue(),
        v9 = self->_remotePresentationController,
        self->_remotePresentationController = v8,
        v9,
        (remotePresentationController = self->_remotePresentationController) != 0))
  {
    -[ENUIRemotePresentationController presentWithPresentationRequest:completion:](remotePresentationController, "presentWithPresentationRequest:completion:", v12, v6);
  }
  else
  {
    ENErrorF(11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v6[2](v6, 0, v10);

  }
}

- (void)requestPreAuthorizedDiagnosisKeysWithCompletionHandler:(ENErrorHandler)completionHandler
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = completionHandler;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_24C38B528;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_tccCheckWithCompletion:", v4);

}

void __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  xpc_object_t v3;
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "mTyp", 23);
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke_3;
    handler[3] = &unk_24C38B500;
    v8 = v5;
    xpc_connection_send_message_with_reply(v4, v3, v6, handler);

  }
}

void __68__ENManager_requestPreAuthorizedDiagnosisKeysWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getDiagnosisKeysWithCompletionHandler:(ENGetDiagnosisKeysHandler)completionHandler
{
  -[ENManager getDiagnosisKeysForTesting:forceRefresh:completionHandler:](self, "getDiagnosisKeysForTesting:forceRefresh:completionHandler:", 0, 0, completionHandler);
}

- (void)getTestDiagnosisKeysWithCompletionHandler:(ENGetDiagnosisKeysHandler)completionHandler
{
  -[ENManager getDiagnosisKeysForTesting:forceRefresh:completionHandler:](self, "getDiagnosisKeysForTesting:forceRefresh:completionHandler:", 1, 0, completionHandler);
}

- (void)getDiagnosisKeysForTesting:(BOOL)a3 forceRefresh:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  BOOL v13;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke;
  v10[3] = &unk_24C38B780;
  v12 = a3;
  v13 = a4;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[ENManager _checkRemoteDialogueRequirementForRequestType:completionHandler:](self, "_checkRemoteDialogueRequirementForRequestType:completionHandler:", 2, v10);

}

void __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, char);
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  __int16 v21;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_2;
    v19[3] = &unk_24C38B730;
    v21 = *(_WORD *)(a1 + 48);
    v7 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v7;
    v8 = MEMORY[0x20BD2F464](v19);
    v9 = (void (**)(_QWORD, _QWORD))v8;
    if (v5)
    {
      v10 = *(unsigned __int8 *)(a1 + 48);
      v11 = v5;
      objc_msgSend(v11, "setTestMode:", v10);
      v14 = v6;
      v15 = 3221225472;
      v16 = __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_4;
      v17 = &unk_24C38B758;
      v12 = *(void **)(a1 + 32);
      v18 = *(id *)(a1 + 40);
      objc_msgSend(v12, "_handleRemotePresentationRequest:completionHandler:", v11, &v14);
      objc_msgSend(v11, "receiptId", v14, v15, v16, v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, void *))v9)[2](v9, v13);
    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    }

  }
}

void __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t v4;
  void *v5;
  int64_t v6;
  id v7;
  _xpc_connection_s *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD handler[5];
  id v13;
  unsigned __int8 uuid[8];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (*(_BYTE *)(a1 + 48))
    v6 = 22;
  else
    v6 = 20;
  xpc_dictionary_set_int64(v4, "mTyp", v6);
  xpc_dictionary_set_BOOL(v5, "refr", *(_BYTE *)(a1 + 49));
  if (v3)
  {
    *(_QWORD *)uuid = 0;
    v15 = 0;
    v7 = v5;
    objc_msgSend(v3, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v7, "rpsid", uuid);

  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(v9 + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_3;
  handler[3] = &unk_24C38B4D8;
  handler[4] = v9;
  v13 = v10;
  xpc_connection_send_message_with_reply(v8, v5, v11, handler);

}

uint64_t __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getDiagnosisKeysReply:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __71__ENManager_getDiagnosisKeysForTesting_forceRefresh_completionHandler___block_invoke_4(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_getDiagnosisKeysReply:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v7 = MEMORY[0x24BDAC760];
  v25 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__ENManager__getDiagnosisKeysReply_completionHandler___block_invoke;
  v17[3] = &unk_24C38B640;
  v19 = &v20;
  v8 = v6;
  v18 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v17);
  CUXPCDecodeNSErrorIfNeeded();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v21[5];
  v21[5] = v10;

  if (!v21[5])
  {
    xpc_dictionary_get_value(v5, "tekA");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12 && MEMORY[0x20BD2F7B8](v12) == MEMORY[0x24BDACF78])
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __54__ENManager__getDiagnosisKeysReply_completionHandler___block_invoke_2;
      v16[3] = &unk_24C38AFC8;
      v16[4] = v14;
      v16[5] = &v20;
      xpc_array_apply(v13, v16);
      if (!v21[5])
        (*((void (**)(id, id, _QWORD))v8 + 2))(v8, v14, 0);
    }
    else
    {
      ENErrorF(15);
      v15 = objc_claimAutoreleasedReturnValue();
      v14 = (id)v21[5];
      v21[5] = v15;
    }

  }
  v9[2](v9);

  _Block_object_dispose(&v20, 8);
}

uint64_t __54__ENManager__getDiagnosisKeysReply_completionHandler___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

BOOL __54__ENManager__getDiagnosisKeysReply_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ENTemporaryExposureKey *v5;
  uint64_t v6;
  ENTemporaryExposureKey *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENTemporaryExposureKey alloc];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENTemporaryExposureKey initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      ENNestedErrorF(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (void)resetAllDataWithCompletionHandler:(id)a3
{
  -[ENManager resetDataWithFlags:completionHandler:](self, "resetDataWithFlags:completionHandler:", 4095, a3);
}

- (void)resetDataWithFlags:(unsigned int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ENManager_resetDataWithFlags_completionHandler___block_invoke;
  block[3] = &unk_24C38B7A8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __50__ENManager_resetDataWithFlags_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD handler[4];
  id v9;

  if ((~*(_DWORD *)(a1 + 48) & 0xFFF) != 0)
  {
    if (gLogCategory_ENManager <= 50 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintFlags32();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else if (gLogCategory_ENManager <= 50 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 21);
  v3 = *(unsigned int *)(a1 + 48);
  if ((_DWORD)v3)
    xpc_dictionary_set_uint64(v2, "resFl", v3);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v7);
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __50__ENManager_resetDataWithFlags_completionHandler___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v9 = v5;
  xpc_connection_send_message_with_reply(v4, v2, v6, handler);

}

void __50__ENManager_resetDataWithFlags_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ENManager_diagnosticControl_completion___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __42__ENManager_diagnosticControl_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD handler[4];
  id v9;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 100);
  v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v3)
  {
    xpc_dictionary_set_value(v2, "parm", v3);
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __42__ENManager_diagnosticControl_completion___block_invoke_2;
    handler[3] = &unk_24C38B500;
    v9 = v5;
    xpc_connection_send_message_with_reply(v4, v2, v6, handler);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    ENErrorF(2);
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _xpc_connection_s *))(v7 + 16))(v7, 0, v4);
  }

}

void __42__ENManager_diagnosticControl_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v5 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v4, 0);
    }
    else
    {
      ENErrorF(2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
  }

}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ENManager_diagnosticShow_completion___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __39__ENManager_diagnosticShow_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD handler[4];
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 102);
  v3 = *(id *)(a1 + 32);
  if (v3)
  {
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (!v4)
    {
      v8 = *(_QWORD *)(a1 + 48);
      ENErrorF(2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

      goto LABEL_5;
    }
    v5 = v4;
    xpc_dictionary_set_value(v2, "parm", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __39__ENManager_diagnosticShow_completion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v11 = v6;
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v7, handler);

LABEL_5:
}

void __39__ENManager_diagnosticShow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v5 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v4, 0);
    }
    else
    {
      ENErrorF(2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
  }

}

- (void)triggerNotificationOfType:(int)a3 appBundleIdentifier:(id)a4 classificationName:(id)a5 interval:(id)a6 region:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *dispatchQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  ENManager *v30;
  id v31;
  int v32;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __105__ENManager_triggerNotificationOfType_appBundleIdentifier_classificationName_interval_region_completion___block_invoke;
  block[3] = &unk_24C38B7D0;
  v32 = a3;
  v26 = v14;
  v27 = v16;
  v28 = v15;
  v29 = v17;
  v30 = self;
  v31 = v18;
  v20 = v18;
  v21 = v17;
  v22 = v15;
  v23 = v16;
  v24 = v14;
  dispatch_async(dispatchQueue, block);

}

void __105__ENManager_triggerNotificationOfType_appBundleIdentifier_classificationName_interval_region_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  const char *v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  id v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 103);
  xpc_dictionary_set_int64(v2, "noteType", *(int *)(a1 + 80));
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  if (v3)
    xpc_dictionary_set_string(v2, "aBid", v3);
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_dictionary_set_uint64(v2, "intS", objc_msgSend(v4, "unsignedLongLongValue"));
  v5 = *(void **)(a1 + 48);
  v6 = v2;
  v7 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  if (v7)
    xpc_dictionary_set_string(v6, "expCID", v7);

  v8 = *(id *)(a1 + 56);
  if (v8)
  {
    v16 = 0;
    v9 = ENXPCEncodeSecureObject(v6, "regionData", v8, &v16);
    v10 = v16;
    v11 = v10;
    if (!v9)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      goto LABEL_11;
    }

  }
  objc_msgSend(*(id *)(a1 + 64), "_ensureXPCStarted");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 72);
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 64) + 80);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __105__ENManager_triggerNotificationOfType_appBundleIdentifier_classificationName_interval_region_completion___block_invoke_2;
  v14[3] = &unk_24C38B500;
  v15 = v12;
  xpc_connection_send_message_with_reply((xpc_connection_t)v8, v6, v13, v14);
  v11 = v15;
LABEL_11:

}

void __105__ENManager_triggerNotificationOfType_appBundleIdentifier_classificationName_interval_region_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)exposureDetectionActivate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ENManager_exposureDetectionActivate_completion___block_invoke;
  block[3] = &unk_24C38B5A0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __50__ENManager_exposureDetectionActivate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__ENManager_exposureDetectionActivate_completion___block_invoke_2;
  v5[3] = &unk_24C38B7F8;
  v8 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "_tccCheckWithCompletion:", v5);

}

void __50__ENManager_exposureDetectionActivate_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  xpc_object_t v3;
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "mTyp", 30);
    objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __50__ENManager_exposureDetectionActivate_completion___block_invoke_3;
    handler[3] = &unk_24C38B500;
    v8 = v5;
    xpc_connection_send_message_with_reply(v4, v3, v6, handler);

  }
}

void __50__ENManager_exposureDetectionActivate_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)exposureDetectionAddKeys:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ENManager_exposureDetectionAddKeys_completion___block_invoke;
  block[3] = &unk_24C38AEB0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __49__ENManager_exposureDetectionAddKeys_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  xpc_object_t v10;
  _xpc_connection_s *v11;
  void *v12;
  NSObject *v13;
  _QWORD handler[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 31);
  v3 = xpc_array_create(0, 0);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = xpc_dictionary_create(0, 0, 0);
        objc_msgSend(v9, "encodeWithXPCObject:", v10);
        xpc_array_set_value(v3, 0xFFFFFFFFFFFFFFFFLL, v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  xpc_dictionary_set_value(v2, "tekA", v3);
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 48);
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __49__ENManager_exposureDetectionAddKeys_completion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v15 = v12;
  xpc_connection_send_message_with_reply(v11, v2, v13, handler);

}

void __49__ENManager_exposureDetectionAddKeys_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)exposureDetectionFinishWithCompletion:(id)a3
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
  v7[2] = __51__ENManager_exposureDetectionFinishWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __51__ENManager_exposureDetectionFinishWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 32);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __51__ENManager_exposureDetectionFinishWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __51__ENManager_exposureDetectionFinishWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  ENExposureDetectionSummary *v5;
  id v6;
  ENExposureDetectionSummary *v7;
  id v8;
  id v9;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = 0;
    v5 = -[ENExposureDetectionSummary initWithXPCObject:error:]([ENExposureDetectionSummary alloc], "initWithXPCObject:error:", v3, &v9);
    v6 = v9;
    if (v5)
    {
      v7 = v5;
      v8 = 0;
    }
    else
    {
      v7 = 0;
      v8 = v6;
    }
    (*(void (**)(_QWORD, ENExposureDetectionSummary *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7, v8);

  }
}

- (void)exposureDetectionGetExposureInfoWithMaximumCount:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__ENManager_exposureDetectionGetExposureInfoWithMaximumCount_completion___block_invoke;
  block[3] = &unk_24C38AED8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __73__ENManager_exposureDetectionGetExposureInfoWithMaximumCount_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 33);
  xpc_dictionary_set_uint64(v2, "exIC", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 80);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__ENManager_exposureDetectionGetExposureInfoWithMaximumCount_completion___block_invoke_2;
  v7[3] = &unk_24C38B4D8;
  v7[4] = v4;
  v8 = v5;
  xpc_connection_send_message_with_reply(v3, v2, v6, v7);

}

uint64_t __73__ENManager_exposureDetectionGetExposureInfoWithMaximumCount_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "exposureDetectionGetExposureInfoCompleted:completion:", a2, *(_QWORD *)(a1 + 40));
}

- (void)exposureDetectionGetExposureInfoCompleted:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v7 = MEMORY[0x24BDAC760];
  v25 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __66__ENManager_exposureDetectionGetExposureInfoCompleted_completion___block_invoke;
  v17[3] = &unk_24C38B640;
  v19 = &v20;
  v8 = v6;
  v18 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v17);
  CUXPCDecodeNSErrorIfNeeded();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v21[5];
  v21[5] = v10;

  if (!v21[5])
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    xpc_dictionary_get_array(v5, "exIA");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13
      || (v16[0] = v7,
          v16[1] = 3221225472,
          v16[2] = __66__ENManager_exposureDetectionGetExposureInfoCompleted_completion___block_invoke_2,
          v16[3] = &unk_24C38AFC8,
          v16[4] = v12,
          v16[5] = &v20,
          xpc_array_apply(v13, v16),
          !v21[5]))
    {
      v15 = xpc_dictionary_get_BOOL(v5, "done");
      (*((void (**)(id, id, _BOOL8, _QWORD))v8 + 2))(v8, v12, v15, 0);
    }

  }
  v9[2](v9);

  _Block_object_dispose(&v20, 8);
}

uint64_t __66__ENManager_exposureDetectionGetExposureInfoCompleted_completion___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

BOOL __66__ENManager_exposureDetectionGetExposureInfoCompleted_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ENExposureInfo *v5;
  uint64_t v6;
  ENExposureInfo *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENExposureInfo alloc];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENExposureInfo initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      ENErrorF(12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (void)exposureDetectionFileActivate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ENManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__ENManager_exposureDetectionFileActivate_completion___block_invoke;
  v10[3] = &unk_24C38B7F8;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[ENManager _tccCheckWithCompletion:](self, "_tccCheckWithCompletion:", v10);

}

void __54__ENManager_exposureDetectionFileActivate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_object_t v3;
  void *v4;
  char v5;
  id v6;
  _xpc_connection_s *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "mTyp", 40);
    objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v3);
    v4 = *(void **)(a1 + 40);
    v12 = 0;
    v5 = objc_msgSend(v4, "_setActivationPropertiesOnRequest:error:", v3, &v12);
    v6 = v12;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
      v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 48);
      v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __54__ENManager_exposureDetectionFileActivate_completion___block_invoke_2;
      v10[3] = &unk_24C38B500;
      v11 = v8;
      xpc_connection_send_message_with_reply(v7, v3, v9, v10);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

void __54__ENManager_exposureDetectionFileActivate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)exposureDetectionFileAdd:(id)a3 signatureURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  id v12;
  const char *v13;
  char *v14;
  const char *v15;
  void (**v16)(_QWORD);
  int v17;
  void (**v18)(_QWORD);
  xpc_object_t v19;
  _xpc_connection_s *v20;
  uint64_t v21;
  const char *v22;
  void (**v23)(_QWORD);
  xpc_object_t v24;
  id v25;
  id v26;
  id *v27;
  xpc_object_t v28;
  size_t v29;
  id v30;
  NSObject *dispatchQueue;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void (**v39)(_QWORD);
  void (**v40)(_QWORD);
  id v41;
  id v42;
  _QWORD handler[4];
  id v44;
  id obj;
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  int v52;
  _QWORD v53[5];
  _QWORD v54[4];
  id v55;
  uint64_t *v56;
  uint64_t v57;
  id *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  v8 = a3;
  v42 = a4;
  v9 = a5;
  v57 = 0;
  v58 = (id *)&v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__2;
  v61 = __Block_byref_object_dispose__2;
  v10 = MEMORY[0x24BDAC760];
  v62 = 0;
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke;
  v54[3] = &unk_24C38B640;
  v56 = &v57;
  v41 = v9;
  v55 = v41;
  v11 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v54);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v12 = objc_retainAutorelease(v8);
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  if (!v13 || (v14 = realpath_DARWIN_EXTSN(v13, 0), (v15 = v14) == 0))
  {
    ENErrorF(2);
    v34 = objc_claimAutoreleasedReturnValue();
    v16 = (void (**)(_QWORD))v58[5];
    v58[5] = (id)v34;
    goto LABEL_19;
  }
  v53[0] = v10;
  v53[1] = 3221225472;
  v53[2] = __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_2;
  v53[3] = &__block_descriptor_40_e5_v8__0l;
  v53[4] = v14;
  v16 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v53);
  v17 = open(v15, 0);
  if (v17 < 0 && (!*__error() || *__error()))
  {
    ENErrorF(2);
    v33 = objc_claimAutoreleasedReturnValue();
    v18 = (void (**)(_QWORD))v58[5];
    v58[5] = (id)v33;
    goto LABEL_18;
  }
  v40 = v16;
  v51[0] = v10;
  v51[1] = 3221225472;
  v51[2] = __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_3;
  v51[3] = &__block_descriptor_36_e5_v8__0l;
  v52 = v17;
  v18 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v51);
  v39 = v11;
  v19 = xpc_fd_create(v17);
  if (!v19)
  {
    ENErrorF(1);
    v35 = objc_claimAutoreleasedReturnValue();
    v20 = (_xpc_connection_s *)v58[5];
    v58[5] = (id)v35;
    goto LABEL_17;
  }
  -[ENManager _ensureXPCStarted](self, "_ensureXPCStarted");
  v20 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v49 = 0u;
  xpc_connection_get_audit_token();
  v47 = 0u;
  v48 = 0u;
  v21 = sandbox_extension_issue_file_to_process();
  v22 = (const char *)v21;
  v38 = v12;
  if (!v21)
  {
    ENErrorF(2);
    v36 = objc_claimAutoreleasedReturnValue();
    v23 = (void (**)(_QWORD))v58[5];
    v58[5] = (id)v36;
    goto LABEL_16;
  }
  v46[0] = v10;
  v46[1] = 3221225472;
  v46[2] = __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_4;
  v46[3] = &__block_descriptor_40_e5_v8__0l;
  v46[4] = v21;
  v23 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v46);
  v24 = v42;
  v25 = v42;
  if (!v42)
    goto LABEL_12;
  v26 = objc_alloc(MEMORY[0x24BDBCE50]);
  v27 = v58;
  obj = v58[5];
  v28 = (xpc_object_t)objc_msgSend(v26, "initWithContentsOfURL:options:error:", v25, 0, &obj);
  objc_storeStrong(v27 + 5, obj);
  if (v28)
  {
    v29 = objc_msgSend(v28, "length");
    if (v29 - 65537 > 0xFFFFFFFFFFFEFFFFLL)
    {
      v30 = objc_retainAutorelease(v28);
      v24 = xpc_data_create((const void *)objc_msgSend(v30, "bytes"), v29);

LABEL_12:
      v28 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v28, "mTyp", 41);
      xpc_dictionary_set_value(v28, "fd", v19);
      xpc_dictionary_set_string(v28, "sbTk", v22);
      if (v24)
        xpc_dictionary_set_value(v28, "sigD", v24);
      dispatchQueue = self->_dispatchQueue;
      handler[0] = v10;
      handler[1] = 3221225472;
      handler[2] = __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_5;
      handler[3] = &unk_24C38B500;
      v44 = v41;
      xpc_connection_send_message_with_reply(v20, v28, dispatchQueue, handler);
      v32 = v44;
      v25 = v24;
      goto LABEL_15;
    }
    ENErrorF(2);
    v37 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ENNestedErrorF(v58[5], 1);
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v32 = v58[5];
  v58[5] = (id)v37;
LABEL_15:

  v11 = v39;
  v23[2](v23);
LABEL_16:

  v12 = v38;
LABEL_17:

  v16 = v40;
  v18[2](v18);
LABEL_18:

  v16[2](v16);
LABEL_19:

  v11[2](v11);
  _Block_object_dispose(&v57, 8);

}

uint64_t __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_3(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_4(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

void __62__ENManager_exposureDetectionFileAdd_signatureURL_completion___block_invoke_5(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)exposureDetectionFileFinishWithCompletion:(id)a3
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
  v7[2] = __55__ENManager_exposureDetectionFileFinishWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __55__ENManager_exposureDetectionFileFinishWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 42);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __55__ENManager_exposureDetectionFileFinishWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __55__ENManager_exposureDetectionFileFinishWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  ENExposureDetectionSummary *v5;
  id v6;
  ENExposureDetectionSummary *v7;
  id v8;
  id v9;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = 0;
    v5 = -[ENExposureDetectionSummary initWithXPCObject:error:]([ENExposureDetectionSummary alloc], "initWithXPCObject:error:", v3, &v9);
    v6 = v9;
    if (v5)
    {
      v7 = v5;
      v8 = 0;
    }
    else
    {
      v7 = 0;
      v8 = v6;
    }
    (*(void (**)(_QWORD, ENExposureDetectionSummary *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7, v8);

  }
}

- (void)getDetectionHistoryChecksWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__ENManager_getDetectionHistoryChecksWithCompletion___block_invoke;
  v6[3] = &unk_24C38B868;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ENManager getDetectionHistorySessionsWithCompletion:](self, "getDetectionHistorySessionsWithCompletion:", v6);

}

void __53__ENManager_getDetectionHistoryChecksWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v5)
      v7 = v5;
    else
      v7 = (id)MEMORY[0x24BDBD1A8];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __53__ENManager_getDetectionHistoryChecksWithCompletion___block_invoke_2;
    v10[3] = &unk_24C38B840;
    v8 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10[4] = v6;
    v11 = v9;
    objc_msgSend(v8, "_populateDetectionHistoryChecks:forSessions:sessionIndex:completion:", v6, v7, 0, v10);

  }
}

uint64_t __53__ENManager_getDetectionHistoryChecksWithCompletion___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    a3 = 0;
    v5 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (void)_populateDetectionHistoryChecks:(id)a3 forSessions:(id)a4 sessionIndex:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t, _QWORD);
  ENExposureDetectionHistoryCheck *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSObject *dispatchQueue;
  _QWORD v18[6];
  id v19;
  id v20;
  void (**v21)(id, uint64_t, _QWORD);
  unint64_t v22;
  _QWORD block[5];
  id v24;
  id v25;
  void (**v26)(id, uint64_t, _QWORD);
  unint64_t v27;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t, _QWORD))a6;
  if (objc_msgSend(v11, "count") <= a5)
  {
    v12[2](v12, 1, 0);
  }
  else
  {
    v13 = objc_alloc_init(ENExposureDetectionHistoryCheck);
    objc_msgSend(v11, "objectAtIndexedSubscript:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = a5 + 1;
    -[ENExposureDetectionHistoryCheck setSession:](v13, "setSession:", v14);
    objc_msgSend(v10, "addObject:", v13);
    if (objc_msgSend(v14, "fileCount"))
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __81__ENManager__populateDetectionHistoryChecks_forSessions_sessionIndex_completion___block_invoke_2;
      v18[3] = &unk_24C38B8B8;
      v21 = v12;
      v18[4] = v13;
      v18[5] = self;
      v19 = v10;
      v20 = v11;
      v22 = a5 + 1;
      -[ENManager getDetectionHistoryFilesForSession:completion:](self, "getDetectionHistoryFilesForSession:completion:", v14, v18);

      v16 = v21;
    }
    else
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __81__ENManager__populateDetectionHistoryChecks_forSessions_sessionIndex_completion___block_invoke;
      block[3] = &unk_24C38B890;
      block[4] = self;
      v24 = v10;
      v25 = v11;
      v27 = v15;
      v26 = v12;
      dispatch_async(dispatchQueue, block);

      v16 = v24;
    }

  }
}

uint64_t __81__ENManager__populateDetectionHistoryChecks_forSessions_sessionIndex_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_populateDetectionHistoryChecks:forSessions:sessionIndex:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

uint64_t __81__ENManager__populateDetectionHistoryChecks_forSessions_sessionIndex_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (a2)
    v4 = a2;
  else
    v4 = MEMORY[0x24BDBD1A8];
  objc_msgSend(*(id *)(a1 + 32), "setFiles:", v4);
  return objc_msgSend(*(id *)(a1 + 40), "_populateDetectionHistoryChecks:forSessions:sessionIndex:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
}

- (void)getDetectionHistoryFilesForSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__ENManager_getDetectionHistoryFilesForSession_completion___block_invoke;
  block[3] = &unk_24C38AEB0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __59__ENManager_getDetectionHistoryFilesForSession_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  _xpc_connection_s *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD handler[5];
  id v10;
  unsigned __int8 uuid[8];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 48);
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    *(_QWORD *)uuid = 0;
    v12 = 0;
    v4 = v2;
    objc_msgSend(v3, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "sessID", uuid);

  }
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v8 = *(NSObject **)(v6 + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __59__ENManager_getDetectionHistoryFilesForSession_completion___block_invoke_2;
  handler[3] = &unk_24C38B4D8;
  handler[4] = v6;
  v10 = v7;
  xpc_connection_send_message_with_reply(v5, v2, v8, handler);

}

uint64_t __59__ENManager_getDetectionHistoryFilesForSession_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getDetectionHistoryFilesCompleted:completion:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_getDetectionHistoryFilesCompleted:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v7 = MEMORY[0x24BDAC760];
  v25 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__ENManager__getDetectionHistoryFilesCompleted_completion___block_invoke;
  v17[3] = &unk_24C38B640;
  v19 = &v20;
  v8 = v6;
  v18 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v17);
  CUXPCDecodeNSErrorIfNeeded();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v21[5];
  v21[5] = v10;

  if (!v21[5])
  {
    xpc_dictionary_get_value(v5, "detHF");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12 && MEMORY[0x20BD2F7B8](v12) == MEMORY[0x24BDACF78])
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __59__ENManager__getDetectionHistoryFilesCompleted_completion___block_invoke_2;
      v16[3] = &unk_24C38AFC8;
      v16[4] = v14;
      v16[5] = &v20;
      xpc_array_apply(v13, v16);
      if (!v21[5])
        (*((void (**)(id, id, _QWORD))v8 + 2))(v8, v14, 0);
    }
    else
    {
      ENErrorF(15);
      v15 = objc_claimAutoreleasedReturnValue();
      v14 = (id)v21[5];
      v21[5] = v15;
    }

  }
  v9[2](v9);

  _Block_object_dispose(&v20, 8);
}

uint64_t __59__ENManager__getDetectionHistoryFilesCompleted_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

BOOL __59__ENManager__getDetectionHistoryFilesCompleted_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ENExposureDetectionHistoryFile *v5;
  uint64_t v6;
  ENExposureDetectionHistoryFile *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENExposureDetectionHistoryFile alloc];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENExposureDetectionHistoryFile initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      ENNestedErrorF(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 2);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (void)getDetectionHistorySessionsWithCompletion:(id)a3
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
  v7[2] = __55__ENManager_getDetectionHistorySessionsWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __55__ENManager_getDetectionHistorySessionsWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 49);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 80);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__ENManager_getDetectionHistorySessionsWithCompletion___block_invoke_2;
  v7[3] = &unk_24C38B4D8;
  v7[4] = v4;
  v8 = v5;
  xpc_connection_send_message_with_reply(v3, v2, v6, v7);

}

uint64_t __55__ENManager_getDetectionHistorySessionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getDetectionHistorySessionsCompleted:completion:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_getDetectionHistorySessionsCompleted:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v7 = MEMORY[0x24BDAC760];
  v25 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__ENManager__getDetectionHistorySessionsCompleted_completion___block_invoke;
  v17[3] = &unk_24C38B640;
  v19 = &v20;
  v8 = v6;
  v18 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v17);
  CUXPCDecodeNSErrorIfNeeded();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v21[5];
  v21[5] = v10;

  if (!v21[5])
  {
    xpc_dictionary_get_value(v5, "detHS");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12 && MEMORY[0x20BD2F7B8](v12) == MEMORY[0x24BDACF78])
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __62__ENManager__getDetectionHistorySessionsCompleted_completion___block_invoke_2;
      v16[3] = &unk_24C38AFC8;
      v16[4] = v14;
      v16[5] = &v20;
      xpc_array_apply(v13, v16);
      if (!v21[5])
        (*((void (**)(id, id, _QWORD))v8 + 2))(v8, v14, 0);
    }
    else
    {
      ENErrorF(15);
      v15 = objc_claimAutoreleasedReturnValue();
      v14 = (id)v21[5];
      v21[5] = v15;
    }

  }
  v9[2](v9);

  _Block_object_dispose(&v20, 8);
}

uint64_t __62__ENManager__getDetectionHistorySessionsCompleted_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

BOOL __62__ENManager__getDetectionHistorySessionsCompleted_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ENExposureDetectionHistorySession *v5;
  uint64_t v6;
  ENExposureDetectionHistorySession *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENExposureDetectionHistorySession alloc];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENExposureDetectionHistorySession initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      ENNestedErrorF(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 2);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (void)sendChaffTestVerificationRequestForRegion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__ENManager_sendChaffTestVerificationRequestForRegion_completionHandler___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __73__ENManager_sendChaffTestVerificationRequestForRegion_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  id v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 300);
  xpc_dictionary_set_BOOL(v2, "chaff", 1);
  v3 = *(id *)(a1 + 32);
  if (v3)
  {
    v11 = 0;
    v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v11);
    v5 = v11;
    v6 = v5;
    if (!v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_5;
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__ENManager_sendChaffTestVerificationRequestForRegion_completionHandler___block_invoke_2;
  v9[3] = &unk_24C38B500;
  v10 = v7;
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v8, v9);
  v6 = v10;
LABEL_5:

}

void __73__ENManager_sendChaffTestVerificationRequestForRegion_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v2 == 0);

}

- (void)startSelfReportWebSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ENManager_startSelfReportWebSession_completionHandler___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __57__ENManager_startSelfReportWebSession_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  id v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 303);
  v3 = *(id *)(a1 + 32);
  if (v3)
  {
    v11 = 0;
    v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v11);
    v5 = v11;
    v6 = v5;
    if (!v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_5;
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__ENManager_startSelfReportWebSession_completionHandler___block_invoke_2;
  v9[3] = &unk_24C38B500;
  v10 = v7;
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v8, v9);
  v6 = v10;
LABEL_5:

}

void __57__ENManager_startSelfReportWebSession_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  const char *string;
  void *v5;
  const char *v6;
  void *v7;
  void (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  xpc_object_t xdict;

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  string = xpc_dictionary_get_string(xdict, "APIKey");
  if (string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v6 = xpc_dictionary_get_string(xdict, "nonce");
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      }
      else
      {
        v10 = *(_QWORD *)(a1 + 32);
        ENErrorF(16);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void (**)(void))(v10 + 16);
      }
      v8();

    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD, void *))(v9 + 16))(*(_QWORD *)(a1 + 32), 0, 0, v3);
    }
    else
    {
      ENErrorF(16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, v11);

    }
  }

}

- (void)startTestVerificationSessionWithCode:(id)a3 region:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ENManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__ENManager_startTestVerificationSessionWithCode_region_completionHandler___block_invoke;
  v15[3] = &unk_24C38B8E0;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __75__ENManager_startTestVerificationSessionWithCode_region_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  const char *v5;
  id v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 300);
  v3 = *(void **)(a1 + 32);
  v4 = v2;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "veriC", v5);

  v6 = *(id *)(a1 + 40);
  if (v6)
  {
    v14 = 0;
    v7 = ENXPCEncodeSecureObject(v4, "regionData", v6, &v14);
    v8 = v14;
    v9 = v8;
    if (!v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_7;
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "_ensureXPCStarted");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 56);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 80);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__ENManager_startTestVerificationSessionWithCode_region_completionHandler___block_invoke_2;
  v12[3] = &unk_24C38B500;
  v13 = v10;
  xpc_connection_send_message_with_reply((xpc_connection_t)v6, v4, v11, v12);
  v9 = v13;
LABEL_7:

}

void __75__ENManager_startTestVerificationSessionWithCode_region_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    CUXPCDecodeNSUUID();
    v5 = 0;
    v6 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }
    else
    {
      ENErrorF(1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
  }

}

- (void)fetchTestMetadataForSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__ENManager_fetchTestMetadataForSession_completionHandler___block_invoke;
  block[3] = &unk_24C38AEB0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __59__ENManager_fetchTestMetadataForSession_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  _xpc_connection_s *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  unsigned __int8 uuid[8];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 301);
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    *(_QWORD *)uuid = 0;
    v11 = 0;
    v4 = v2;
    objc_msgSend(v3, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "sessID", uuid);

  }
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__ENManager_fetchTestMetadataForSession_completionHandler___block_invoke_2;
  v8[3] = &unk_24C38B500;
  v9 = v6;
  xpc_connection_send_message_with_reply(v5, v2, v7, v8);

}

void __59__ENManager_fetchTestMetadataForSession_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("meta"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v5, 0);
    }
    else
    {
      ENErrorF(2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
  }

}

- (void)finishTestVerificationForSession:(id)a3 userDidConsent:(BOOL)a4 metadata:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *dispatchQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  ENManager *v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__ENManager_finishTestVerificationForSession_userDidConsent_metadata_completionHandler___block_invoke;
  block[3] = &unk_24C38B908;
  v22 = a4;
  v18 = v10;
  v19 = v11;
  v20 = self;
  v21 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(dispatchQueue, block);

}

void __88__ENManager_finishTestVerificationForSession_userDidConsent_metadata_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  _xpc_connection_s *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  unsigned __int8 uuid[8];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 302);
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    *(_QWORD *)uuid = 0;
    v11 = 0;
    v4 = v2;
    objc_msgSend(v3, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "sessID", uuid);

  }
  xpc_dictionary_set_BOOL(v2, "consent", *(_BYTE *)(a1 + 64));
  xpc_dictionary_set_cf_object();
  objc_msgSend(*(id *)(a1 + 48), "_ensureXPCStarted");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 56);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 80);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__ENManager_finishTestVerificationForSession_userDidConsent_metadata_completionHandler___block_invoke_2;
  v8[3] = &unk_24C38B500;
  v9 = v6;
  xpc_connection_send_message_with_reply(v5, v2, v7, v8);

}

void __88__ENManager_finishTestVerificationForSession_userDidConsent_metadata_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)activeRegionWithCompletion:(id)a3
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
  v7[2] = __40__ENManager_activeRegionWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __40__ENManager_activeRegionWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 50);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __40__ENManager_activeRegionWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __40__ENManager_activeRegionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = (void *)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = objc_opt_class();
    v11 = 0;
    ENXPCDecodeSecureObjectIfPresent(v3, "regionData", v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v6, 0);
    }
    else if (v7)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v7);
    }
    else
    {
      ENErrorF(16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
  }

}

- (void)regionConfigurationWithCompletion:(id)a3
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
  v7[2] = __47__ENManager_regionConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __47__ENManager_regionConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 51);
  xpc_dictionary_set_int64(v2, "cty", 0);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __47__ENManager_regionConfigurationWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __47__ENManager_regionConfigurationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = (void *)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = objc_opt_class();
    v11 = 0;
    ENXPCDecodeSecureObjectIfPresent(v3, "svrCfg", v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v6, 0);
    }
    else if (v7)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v7);
    }
    else
    {
      ENErrorF(16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
  }

}

- (void)allRegionConfigurationsWithCompletion:(id)a3
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
  v7[2] = __51__ENManager_allRegionConfigurationsWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __51__ENManager_allRegionConfigurationsWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 52);
  xpc_dictionary_set_int64(v2, "cty", 0);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __51__ENManager_allRegionConfigurationsWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __51__ENManager_allRegionConfigurationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  const void *data;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  size_t length;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    length = 0;
    data = xpc_dictionary_get_data(v3, "svrCfg", &length);
    if (!data)
      goto LABEL_16;
    if (!length)
      goto LABEL_16;
    v6 = data;
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x24BDBCE50]);
    v14 = (void *)objc_msgSend(v13, "initWithBytes:length:", v6, length);
    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v12, v14, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v18;

    if (v15)
    {
      (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v15, 0);
    }
    else
    {
LABEL_16:
      if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      v16 = *(_QWORD *)(a1 + 32);
      ENNestedErrorF(v4, 11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v15);
    }

  }
}

- (void)allRegionServerConfigurationsWithCompletion:(id)a3
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
  v7[2] = __57__ENManager_allRegionServerConfigurationsWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __57__ENManager_allRegionServerConfigurationsWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 52);
  xpc_dictionary_set_int64(v2, "cty", 10);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __57__ENManager_allRegionServerConfigurationsWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __57__ENManager_allRegionServerConfigurationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v13 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("svrCfg"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)MEMORY[0x24BDBCF20];
        v9 = objc_opt_class();
        v10 = objc_opt_class();
        objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v11, v7, &v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v20;
        if (v12)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        }
        else
        {
          if (gLogCategory__ENManager <= 90
            && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          v14 = *(_QWORD *)(a1 + 32);
          ENErrorF(16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

        }
      }
      else
      {
        v18 = *(_QWORD *)(a1 + 32);
        ENErrorF(16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

        v13 = 0;
      }

    }
    else
    {
      v16 = *(_QWORD *)(a1 + 32);
      ENErrorF(2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

      v13 = 0;
    }

  }
}

- (void)regionServerConfigurationWithCompletion:(id)a3
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
  v7[2] = __53__ENManager_regionServerConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __53__ENManager_regionServerConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 51);
  xpc_dictionary_set_int64(v2, "cty", 10);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __53__ENManager_regionServerConfigurationWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __53__ENManager_regionServerConfigurationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("svrCfg"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = (void *)MEMORY[0x24BDBCF20];
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v17;
      if (v11)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      else
      {
        if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        v13 = *(_QWORD *)(a1 + 32);
        ENErrorF(16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

      }
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 32);
      ENErrorF(2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

      v12 = 0;
    }

  }
}

- (void)agencyConfigurationForLocale:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ENManager_agencyConfigurationForLocale_withCompletion___block_invoke;
  block[3] = &unk_24C38AEB0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __57__ENManager_agencyConfigurationForLocale_withCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  _xpc_connection_s *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD handler[4];
  id v10;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 51);
  xpc_dictionary_set_int64(v2, "cty", 20);
  objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_string(v2, "loc", (const char *)objc_msgSend(v4, "utf8ValueSafe"));

    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __57__ENManager_agencyConfigurationForLocale_withCompletion___block_invoke_2;
    handler[3] = &unk_24C38B500;
    v10 = v6;
    xpc_connection_send_message_with_reply(v5, v2, v7, handler);

  }
  else
  {
    v8 = ENErrorF(2);
  }

}

void __57__ENManager_agencyConfigurationForLocale_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("svrCfg"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = (void *)MEMORY[0x24BDBCF20];
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v12, v6, &v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
      if (v13)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      else
      {
        if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        v15 = *(_QWORD *)(a1 + 32);
        ENErrorF(16);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

      }
    }
    else
    {
      v17 = *(_QWORD *)(a1 + 32);
      ENErrorF(2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

      v14 = 0;
    }

  }
}

- (void)allAgencyConfigurationsForLocale:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ENManager_allAgencyConfigurationsForLocale_withCompletion___block_invoke;
  block[3] = &unk_24C38AEB0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __61__ENManager_allAgencyConfigurationsForLocale_withCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  _xpc_connection_s *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD handler[4];
  id v10;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 52);
  xpc_dictionary_set_int64(v2, "cty", 20);
  objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_string(v2, "loc", (const char *)objc_msgSend(v4, "utf8ValueSafe"));

    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __61__ENManager_allAgencyConfigurationsForLocale_withCompletion___block_invoke_2;
    handler[3] = &unk_24C38B500;
    v10 = v6;
    xpc_connection_send_message_with_reply(v5, v2, v7, handler);

  }
  else
  {
    v8 = ENErrorF(2);
  }

}

void __61__ENManager_allAgencyConfigurationsForLocale_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("svrCfg"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = (void *)MEMORY[0x24BDBCF20];
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v12, v6, &v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
      if (v13)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      else
      {
        if (gLogCategory__ENManager <= 90 && (gLogCategory__ENManager != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        v15 = *(_QWORD *)(a1 + 32);
        ENErrorF(16);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

      }
    }
    else
    {
      v17 = *(_QWORD *)(a1 + 32);
      ENErrorF(2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

      v14 = 0;
    }

  }
}

- (void)getRegionVisitHistoryWithCompletion:(id)a3
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
  v7[2] = __49__ENManager_getRegionVisitHistoryWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __49__ENManager_getRegionVisitHistoryWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 55);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __49__ENManager_getRegionVisitHistoryWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __49__ENManager_getRegionVisitHistoryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = (void *)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rgnHy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDBCF20];
      v8 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v9, v6, &v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v18;
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)(a1 + 32);
      if (v10 || (v13 = v11) != 0)
      {
        (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v10, v13);
      }
      else
      {
        ENErrorF(16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

      }
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 32);
      ENErrorF(2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

      v12 = 0;
    }

  }
}

- (void)regionHistoryWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__ENManager_regionHistoryWithCompletion___block_invoke;
  v6[3] = &unk_24C38B930;
  v7 = v4;
  v5 = v4;
  -[ENManager getRegionVisitHistoryWithCompletion:](self, "getRegionVisitHistoryWithCompletion:", v6);

}

void __41__ENManager_regionHistoryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "region", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setRegionConsent:(int64_t)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  ENErrorF(5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (void)setRegionConsent:(int64_t)a3 region:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  ENErrorF(5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);

}

- (void)setRegionUserConsent:(id)a3 region:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  ENManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v8, "consent");
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__ENManager_setRegionUserConsent_region_completionHandler___block_invoke;
  block[3] = &unk_24C38B958;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(dispatchQueue, block);

}

void __59__ENManager_setRegionUserConsent_region_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _xpc_connection_s *v11;
  void *v12;
  NSObject *v13;
  _QWORD handler[4];
  id v15;
  id v16;
  id v17;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 53);
  v3 = *(_QWORD *)(a1 + 32);
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    xpc_dictionary_set_data(v2, "regionConsent", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
    v7 = *(_QWORD *)(a1 + 40);
    v16 = v5;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    if (v8)
    {
      v10 = objc_retainAutorelease(v8);
      xpc_dictionary_set_data(v2, "regionData", (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
      objc_msgSend(*(id *)(a1 + 48), "_ensureXPCStarted");
      v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 56);
      v13 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 80);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __59__ENManager_setRegionUserConsent_region_completionHandler___block_invoke_2;
      handler[3] = &unk_24C38B500;
      v15 = v12;
      xpc_connection_send_message_with_reply(v11, v2, v13, handler);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v9 = v5;
  }

}

void __59__ENManager_setRegionUserConsent_region_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)deleteExposureDetectionHistoryWithCompletionHandler:(id)a3
{
  -[ENManager resetDataWithFlags:completionHandler:](self, "resetDataWithFlags:completionHandler:", 85, a3);
}

- (void)downloadAndDetectExposure:(BOOL)a3 completionHandler:(id)a4
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
  block[2] = __57__ENManager_downloadAndDetectExposure_completionHandler___block_invoke;
  block[3] = &unk_24C38B578;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __57__ENManager_downloadAndDetectExposure_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 205);
  xpc_dictionary_set_BOOL(v2, "detX", *(_BYTE *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __57__ENManager_downloadAndDetectExposure_completionHandler___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __57__ENManager_downloadAndDetectExposure_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)exposureNotificationGetStatusForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__ENManager_exposureNotificationGetStatusForBundleIdentifier_completion___block_invoke;
  block[3] = &unk_24C38AEB0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __73__ENManager_exposureNotificationGetStatusForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 200);
  xpc_dictionary_set_string(v2, "aBid", (const char *)objc_msgSend(*(id *)(a1 + 32), "utf8ValueSafe"));
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __73__ENManager_exposureNotificationGetStatusForBundleIdentifier_completion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __73__ENManager_exposureNotificationGetStatusForBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  xpc_object_t xdict;

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    xpc_dictionary_get_BOOL(xdict, "enbd");
    xpc_dictionary_get_uint64(xdict, "aBARi");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getDataVaultSizeWithCompletion:(id)a3
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
  v7[2] = __44__ENManager_getDataVaultSizeWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __44__ENManager_getDataVaultSizeWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 214);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __44__ENManager_getDataVaultSizeWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __44__ENManager_getDataVaultSizeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t uint64;
  uint64_t v5;
  void *v6;
  xpc_object_t xdict;

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(xdict, "bytes");
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", uint64);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
}

- (void)getInfoForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ENManager_getInfoForKey_completion___block_invoke;
  block[3] = &unk_24C38AEB0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __38__ENManager_getInfoForKey_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  const char *v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD handler[4];
  id v10;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 201);
  v3 = *(void **)(a1 + 32);
  v4 = v2;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "iStr", v5);

  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __38__ENManager_getInfoForKey_completion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v10 = v7;
  xpc_connection_send_message_with_reply(v6, v4, v8, handler);

}

void __38__ENManager_getInfoForKey_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  xpc_object_t xdict;

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    xpc_dictionary_get_value(xdict, "oObj");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      v6 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v5, 0);
      }
      else
      {
        ENErrorF(15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v8);

      }
    }
    else
    {
      v7 = *(_QWORD *)(a1 + 32);
      ENErrorF(15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v5);
    }

  }
}

- (void)getEntitiesWithCompletion:(id)a3
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
  v7[2] = __39__ENManager_getEntitiesWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __39__ENManager_getEntitiesWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 150);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __39__ENManager_getEntitiesWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __39__ENManager_getEntitiesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void (*v27)(void);
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38[2];
  id v39;
  id v40;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDBCF20];
      v7 = objc_opt_class();
      objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("acEn"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        v40 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v40);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v40;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("auEn"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v37 = v3;
          v39 = v12;
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v8, v13, &v39);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v39;

          objc_msgSend(v14, "firstObject");
          v36 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("avaEn"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = v8;
            v18 = v11;
            v19 = a1;
            v38[1] = v15;
            v20 = v17;
            objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v15;

            objc_msgSend(v21, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tnEn"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              v38[0] = v22;
              objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v24, v38);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v38[0];

              v27 = *(void (**)(void))(*(_QWORD *)(v19 + 32) + 16);
              v11 = v18;
              v28 = (void *)v36;
              v27();
              v22 = v26;
            }
            else
            {
              v35 = *(_QWORD *)(v19 + 32);
              ENErrorF(16);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v35 + 16))(v35, 0, 0, 0, 0, v25);
              v11 = v18;
              v28 = (void *)v36;
            }

            v15 = v22;
            v8 = v20;
          }
          else
          {
            v34 = *(_QWORD *)(a1 + 32);
            ENErrorF(16);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v34 + 16))(v34, 0, 0, 0, 0, v24);
            v28 = (void *)v36;
          }

          v12 = v15;
          v3 = v37;
        }
        else
        {
          v33 = *(_QWORD *)(a1 + 32);
          ENErrorF(16);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v33 + 16))(v33, 0, 0, 0, 0, v28);
        }

      }
      else
      {
        v31 = *(_QWORD *)(a1 + 32);
        ENErrorF(16);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v31 + 16))(v31, 0, 0, 0, 0, v32);

        v12 = 0;
      }

    }
    else
    {
      v29 = *(_QWORD *)(a1 + 32);
      ENErrorF(2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v29 + 16))(v29, 0, 0, 0, 0, v30);

      v12 = 0;
    }

  }
}

- (void)getAllEntitiesWithCompletion:(id)a3
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
  v7[2] = __42__ENManager_getAllEntitiesWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __42__ENManager_getAllEntitiesWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 150);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __42__ENManager_getAllEntitiesWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __42__ENManager_getAllEntitiesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDBCF20];
      v7 = objc_opt_class();
      objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("acEn"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        v37 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v37);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v37;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("auEn"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v36 = v12;
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v8, v13, &v36);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v36;

          objc_msgSend(v14, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("avaEn"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v35 = v15;
            objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v8, v17, &v35);
            v18 = v17;
            v19 = v16;
            v20 = v5;
            v21 = v8;
            v22 = v11;
            v23 = v3;
            v24 = a1;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v35;

            objc_msgSend(v25, "firstObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = *(_QWORD *)(v24 + 32);
            v3 = v23;
            v11 = v22;
            v8 = v21;
            v5 = v20;
            v16 = v19;
            v17 = v18;
            (*(void (**)(void))(v27 + 16))();
            v15 = v34;
          }
          else
          {
            v33 = *(_QWORD *)(a1 + 32);
            ENErrorF(16);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v33 + 16))(v33, 0, 0, 0, v26);
          }

          v12 = v15;
        }
        else
        {
          v32 = *(_QWORD *)(a1 + 32);
          ENErrorF(16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v32 + 16))(v32, 0, 0, 0, v17);
        }

      }
      else
      {
        v30 = *(_QWORD *)(a1 + 32);
        ENErrorF(16);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v30 + 16))(v30, 0, 0, 0, v31);

        v12 = 0;
      }

    }
    else
    {
      v28 = *(_QWORD *)(a1 + 32);
      ENErrorF(2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v28 + 16))(v28, 0, 0, 0, v29);

      v12 = 0;
    }

  }
}

- (void)onboardingDidStartForRegion:(id)a3 withSource:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  ENManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ENManager_onboardingDidStartForRegion_withSource_completion___block_invoke;
  block[3] = &unk_24C38B8E0;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(dispatchQueue, block);

}

void __63__ENManager_onboardingDidStartForRegion_withSource_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _xpc_connection_s *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 209);
  v3 = *(void **)(a1 + 32);
  v4 = v2;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "iStr", v5);

  v6 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v7)
  {
    v9 = objc_retainAutorelease(v7);
    xpc_dictionary_set_data(v4, "regionData", (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    objc_msgSend(*(id *)(a1 + 48), "_ensureXPCStarted");
    v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 56);
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 80);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __63__ENManager_onboardingDidStartForRegion_withSource_completion___block_invoke_2;
    v13[3] = &unk_24C38B500;
    v14 = v11;
    xpc_connection_send_message_with_reply(v10, v4, v12, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __63__ENManager_onboardingDidStartForRegion_withSource_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getLastExposureNotificationWithCompletion:(id)a3
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
  v7[2] = __55__ENManager_getLastExposureNotificationWithCompletion___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __55__ENManager_getLastExposureNotificationWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 204);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __55__ENManager_getLastExposureNotificationWithCompletion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __55__ENManager_getLastExposureNotificationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = objc_opt_class();
    v8 = 0;
    ENXPCDecodeSecureObjectIfPresent(v3, "noteObj", v5, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)setAutomaticRegionSwitchEnabled:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ENManager_setAutomaticRegionSwitchEnabled_completion___block_invoke;
  block[3] = &unk_24C38B578;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __56__ENManager_setAutomaticRegionSwitchEnabled_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 207);
  xpc_dictionary_set_BOOL(v2, "enbd", *(_BYTE *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __56__ENManager_setAutomaticRegionSwitchEnabled_completion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __56__ENManager_setAutomaticRegionSwitchEnabled_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setAvailabilityAlertEnabled:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__ENManager_setAvailabilityAlertEnabled_completion___block_invoke;
  block[3] = &unk_24C38B578;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __52__ENManager_setAvailabilityAlertEnabled_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 215);
  xpc_dictionary_set_BOOL(v2, "enbd", *(_BYTE *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __52__ENManager_setAvailabilityAlertEnabled_completion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __52__ENManager_setAvailabilityAlertEnabled_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setCurrentActiveApp:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ENManager_setCurrentActiveApp_completion___block_invoke;
  block[3] = &unk_24C38AEB0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __44__ENManager_setCurrentActiveApp_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 202);
  xpc_dictionary_set_string(v2, "aBid", (const char *)objc_msgSend(*(id *)(a1 + 32), "utf8ValueSafe"));
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __44__ENManager_setCurrentActiveApp_completion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __44__ENManager_setCurrentActiveApp_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setActiveEntityWithAppBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ENManager_setActiveEntityWithAppBundleID_completion___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __55__ENManager_setActiveEntityWithAppBundleID_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD handler[4];
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 151);
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    xpc_dictionary_set_string(v2, "aBid", (const char *)objc_msgSend(*(id *)(a1 + 32), "utf8ValueSafe"));
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 48);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __55__ENManager_setActiveEntityWithAppBundleID_completion___block_invoke_2;
    handler[3] = &unk_24C38B500;
    v8 = v4;
    xpc_connection_send_message_with_reply(v3, v2, v5, handler);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    ENErrorF(2);
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _xpc_connection_s *))(v6 + 16))(v6, v3);
  }

}

void __55__ENManager_setActiveEntityWithAppBundleID_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setActiveEntityWithRegion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ENManager_setActiveEntityWithRegion_completion___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __50__ENManager_setActiveEntityWithRegion_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  BOOL v4;
  id v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 151);
  v3 = *(void **)(a1 + 32);
  v11 = 0;
  v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v11);
  v5 = v11;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__ENManager_setActiveEntityWithRegion_completion___block_invoke_2;
    v9[3] = &unk_24C38B500;
    v10 = v7;
    xpc_connection_send_message_with_reply(v6, v2, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __50__ENManager_setActiveEntityWithRegion_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setActiveRegion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__ENManager_setActiveRegion_completion___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __40__ENManager_setActiveRegion_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  BOOL v4;
  id v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 206);
  v3 = *(void **)(a1 + 32);
  v11 = 0;
  v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v11);
  v5 = v11;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__ENManager_setActiveRegion_completion___block_invoke_2;
    v9[3] = &unk_24C38B500;
    v10 = v7;
    xpc_connection_send_message_with_reply(v6, v2, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __40__ENManager_setActiveRegion_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setDeveloperServerConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ENManager_setDeveloperServerConfiguration_completionHandler___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __63__ENManager_setDeveloperServerConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD handler[4];
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 54);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v3)
    {
      xpc_dictionary_set_value(v2, "svrCfg", v3);
      objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
      v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 48);
      v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __63__ENManager_setDeveloperServerConfiguration_completionHandler___block_invoke_2;
      handler[3] = &unk_24C38B500;
      v11 = v5;
      xpc_connection_send_message_with_reply(v4, v2, v6, handler);

    }
    else
    {
      v9 = *(_QWORD *)(a1 + 48);
      ENErrorF(2);
      v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _xpc_connection_s *))(v9 + 16))(v9, v4);
    }

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    ENErrorF(2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __63__ENManager_setDeveloperServerConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setWeeklySummaryAlertEnabled:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__ENManager_setWeeklySummaryAlertEnabled_completion___block_invoke;
  block[3] = &unk_24C38B578;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __53__ENManager_setWeeklySummaryAlertEnabled_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 216);
  xpc_dictionary_set_BOOL(v2, "enbd", *(_BYTE *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __53__ENManager_setWeeklySummaryAlertEnabled_completion___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __53__ENManager_setWeeklySummaryAlertEnabled_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)clearDeveloperServerConfigurationWithCompletionHandler:(id)a3
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
  v7[2] = __68__ENManager_clearDeveloperServerConfigurationWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __68__ENManager_clearDeveloperServerConfigurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 54);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __68__ENManager_clearDeveloperServerConfigurationWithCompletionHandler___block_invoke_2;
  handler[3] = &unk_24C38B500;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __68__ENManager_clearDeveloperServerConfigurationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)remotePresentationRequestDidComplete:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ENManager_remotePresentationRequestDidComplete_completion___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __61__ENManager_remotePresentationRequestDidComplete_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  BOOL v4;
  id v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 213);
  v3 = *(void **)(a1 + 32);
  v11 = 0;
  v4 = ENXPCEncodeSecureObject(v2, "rpr", v3, &v11);
  v5 = v11;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__ENManager_remotePresentationRequestDidComplete_completion___block_invoke_2;
    v9[3] = &unk_24C38B500;
    v10 = v7;
    xpc_connection_send_message_with_reply(v6, v2, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __61__ENManager_remotePresentationRequestDidComplete_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchConfigurationsForRegion:(id)a3 forceServerFetch:(BOOL)a4 completion:(id)a5
{
  uint64_t v5;

  if (a4)
    v5 = 2;
  else
    v5 = 0;
  -[ENManager fetchConfigurationsForRegion:fetchReason:completion:](self, "fetchConfigurationsForRegion:fetchReason:completion:", a3, v5, a5);
}

- (void)fetchConfigurationsForRegion:(id)a3 fetchReason:(unsigned int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ENManager *v15;
  id v16;
  unsigned int v17;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__ENManager_fetchConfigurationsForRegion_fetchReason_completion___block_invoke;
  v13[3] = &unk_24C38B980;
  v17 = a4;
  v15 = self;
  v16 = v9;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

void __65__ENManager_fetchConfigurationsForRegion_fetchReason_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  BOOL v4;
  id v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 52);
  xpc_dictionary_set_int64(v2, "cty", 10);
  xpc_dictionary_set_int64(v2, "feRsn", *(unsigned int *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  v11 = 0;
  v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v11);
  v5 = v11;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65__ENManager_fetchConfigurationsForRegion_fetchReason_completion___block_invoke_2;
    v9[3] = &unk_24C38B500;
    v10 = v7;
    xpc_connection_send_message_with_reply(v6, v2, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __65__ENManager_fetchConfigurationsForRegion_fetchReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void (*v24)(_QWORD, void *, void *, void *, _QWORD);
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v15 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    v26 = *(_QWORD *)(a1 + 32);
    ENErrorF(2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v26 + 16))(v26, 0, 0, 0, v27);

    v15 = 0;
    goto LABEL_9;
  }
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rgnCfg"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v12, v13, &v34);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v34;
  v31 = (void *)v14;
  if (!v14)
  {
    v28 = *(_QWORD *)(a1 + 32);
    ENErrorF(16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v28 + 16))(v28, 0, 0, 0, v17);
    v25 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("svrCfg"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v15;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v12, v16, &v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v33;

  if (!v17)
  {
    v29 = *(_QWORD *)(a1 + 32);
    ENErrorF(16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v29 + 16))(v29, 0, 0, 0, v21);
LABEL_16:
    v25 = v31;
    goto LABEL_7;
  }
  v19 = v3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("agnCfg"));
  v20 = objc_claimAutoreleasedReturnValue();

  v32 = v18;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v12, v20, &v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v32;

  v23 = *(_QWORD *)(a1 + 32);
  if (!v21)
  {
    ENErrorF(16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v23 + 16))(v23, 0, 0, 0, v30);

    v18 = v22;
    v16 = (void *)v20;
    v3 = v19;
    goto LABEL_16;
  }
  v24 = *(void (**)(_QWORD, void *, void *, void *, _QWORD))(v23 + 16);
  v25 = v31;
  v24(*(_QWORD *)(a1 + 32), v31, v17, v21, 0);
  v18 = v22;
  v16 = (void *)v20;
  v3 = v19;
LABEL_7:

  v15 = v18;
  v13 = v16;
LABEL_8:

LABEL_9:
LABEL_10:

}

- (void)fetchSubdivisionsForCountry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  ENManager *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_ENManager <= 30 && (gLogCategory_ENManager != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v6, "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke;
  block[3] = &unk_24C38B5A0;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  BOOL v4;
  _xpc_connection_s *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD handler[4];
  id v11;
  _QWORD *v12;
  id obj;
  _QWORD v14[5];
  id v15;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 62);
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__2;
    v14[4] = __Block_byref_object_dispose__2;
    v15 = 0;
    obj = 0;
    v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &obj);
    objc_storeStrong(&v15, obj);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
      v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 48);
      v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke_2;
      handler[3] = &unk_24C38B9A8;
      v11 = v6;
      v12 = v14;
      xpc_connection_send_message_with_reply(v5, v2, v7, handler);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    _Block_object_dispose(v14, 8);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    ENErrorF(15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

  }
}

void __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  xpc_object_t xdict;
  _QWORD applier[6];

  xdict = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    xpc_dictionary_get_array(xdict, "subCodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      goto LABEL_4;
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke_3;
    applier[3] = &unk_24C38AFC8;
    v7 = *(_QWORD *)(a1 + 40);
    applier[4] = v4;
    applier[5] = v7;
    xpc_array_apply(v5, applier);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
LABEL_4:
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __52__ENManager_fetchSubdivisionsForCountry_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *string_ptr;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFF0])
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (string_ptr)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string_ptr);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
      v7 = 1;
      goto LABEL_6;
    }
    v5 = 16;
  }
  else
  {
    v5 = 15;
  }
  ENErrorF(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;
LABEL_6:

  return v7;
}

- (void)showBuddyForRegion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ENManager_showBuddyForRegion_completionHandler___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __50__ENManager_showBuddyForRegion_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  BOOL v4;
  id v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 217);
  v3 = *(void **)(a1 + 32);
  v11 = 0;
  v4 = ENXPCEncodeSecureObject(v2, "regionData", v3, &v11);
  v5 = v11;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__ENManager_showBuddyForRegion_completionHandler___block_invoke_2;
    v9[3] = &unk_24C38B500;
    v10 = v7;
    xpc_connection_send_message_with_reply(v6, v2, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __50__ENManager_showBuddyForRegion_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)verifyTextMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ENManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ENManager_verifyTextMessage_completionHandler___block_invoke;
  block[3] = &unk_24C38B5A0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __49__ENManager_verifyTextMessage_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  BOOL v4;
  id v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "mTyp", 218);
  v3 = *(void **)(a1 + 32);
  v11 = 0;
  v4 = ENXPCEncodeSecureObject(v2, "txtMD", v3, &v11);
  v5 = v11;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__ENManager_verifyTextMessage_completionHandler___block_invoke_2;
    v9[3] = &unk_24C38B500;
    v10 = v7;
    xpc_connection_send_message_with_reply(v6, v2, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __49__ENManager_verifyTextMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (ENActivityHandler)activityHandler
{
  return self->_activityHandler;
}

- (void)setActivityHandler:(ENActivityHandler)activityHandler
{
  objc_setProperty_nonatomic_copy(self, a2, activityHandler, 72);
}

- (dispatch_queue_t)dispatchQueue
{
  return (dispatch_queue_t)self->_dispatchQueue;
}

- (void)setDispatchQueue:(dispatch_queue_t)dispatchQueue
{
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);
}

- (ENStatus)exposureNotificationStatus
{
  return self->_exposureNotificationStatus;
}

- (dispatch_block_t)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(dispatch_block_t)invalidationHandler
{
  objc_setProperty_nonatomic_copy(self, a2, invalidationHandler, 96);
}

- (ENDiagnosisKeysAvailableHandler)diagnosisKeysAvailableHandler
{
  return self->_diagnosisKeysAvailableHandler;
}

- (void)setDiagnosisKeysAvailableHandler:(ENDiagnosisKeysAvailableHandler)diagnosisKeysAvailableHandler
{
  objc_setProperty_nonatomic_copy(self, a2, diagnosisKeysAvailableHandler, 104);
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (OS_xpc_object)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, a3);
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)exposureNotificationPaused
{
  return self->_exposureNotificationPaused;
}

- (BOOL)analyticsEnabled
{
  return self->_analyticsEnabled;
}

@end
