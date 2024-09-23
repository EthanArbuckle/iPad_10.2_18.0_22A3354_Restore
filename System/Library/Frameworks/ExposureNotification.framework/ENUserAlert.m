@implementation ENUserAlert

- (ENUserAlert)init
{
  ENUserAlert *v2;
  ENUserAlert *v3;
  ENUserAlert *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENUserAlert;
  v2 = -[ENUserAlert init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ENUserAlert *v2;
  SEL v3;
  id v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateDone)
  {
    v2 = (ENUserAlert *)FatalErrorF();
    -[ENUserAlert activateWithCompletionHandler:](v2, v3, v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ENUserAlert;
    -[ENUserAlert dealloc](&v5, sel_dealloc);
  }
}

- (void)activateWithCompletionHandler:(id)a3
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
  v7[2] = __45__ENUserAlert_activateWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C38AE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __45__ENUserAlert_activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    ENErrorF(10);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory__ENUserAlert <= 90 && (gLogCategory__ENUserAlert != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_autoInvalidate");
LABEL_16:

    return;
  }
  if (*(_BYTE *)(v2 + 9))
  {
    ENErrorF(10);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory__ENUserAlert <= 90 && (gLogCategory__ENUserAlert != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    goto LABEL_16;
  }
  if (gLogCategory_ENUserAlert <= 30)
  {
    if (gLogCategory_ENUserAlert != -1 || (v3 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v3))
    {
      LogPrintF_safe();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v2 + 8) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *v21;
  NSString *v22;
  void *v23;
  NSString *v24;
  NSString *v25;
  void *v26;
  __CFUserNotification *v27;
  __CFUserNotification *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v34;
  __CFRunLoop *Main;
  uint64_t v36;
  void *v37;
  SInt32 error;
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v4 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  v47 = 0;
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __46__ENUserAlert__activateWithCompletionHandler___block_invoke;
  v39[3] = &unk_24C38B668;
  v41 = &v42;
  v5 = v4;
  v39[4] = self;
  v40 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v39);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = self->_titleKey;
  v9 = v8;
  if (v8)
  {
    ENLocalizedString(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_titleParameter;
    if (v11)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v10, v11);

      v10 = (void *)v12;
    }
    v13 = *MEMORY[0x24BDBD6D8];

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v13);
  }

  v14 = self->_subTitleKey;
  v15 = v14;
  if (v14)
  {
    ENLocalizedString(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_subTitleParameter;
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v16, -[NSObject unsignedIntValue](v17, "unsignedIntValue"));
      else
        v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v16, v17);
      v19 = (void *)v18;

      v16 = v19;
    }
    v20 = *MEMORY[0x24BDBD6E0];

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v20);
  }

  v21 = self->_defaultButtonTitleKey;
  v22 = v21;
  if (v21)
  {
    ENLocalizedString(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BDBD6F8]);

  }
  v24 = self->_alternativeButtonTitleKey;
  v25 = v24;
  if (v24)
  {
    ENLocalizedString(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BDBD6F0]);

  }
  if (self->_showOnLockScreen)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBD6E8]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB0E50]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BEB0E38]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB0DF8]);
  }
  error = 0;
  v27 = CFUserNotificationCreate(0, self->_timeoutSeconds, 2uLL, &error, (CFDictionaryRef)v7);
  v28 = v27;
  if (!v27)
    goto LABEL_24;
  self->_userNotification = v27;
  pthread_mutex_lock(&gENUserAlertMutex);
  v29 = (void *)gENUserAlertMap;
  if (!gENUserAlertMap)
  {
    v30 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v31 = (void *)gENUserAlertMap;
    gENUserAlertMap = (uint64_t)v30;

    v29 = (void *)gENUserAlertMap;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", self, v32);

  pthread_mutex_unlock(&gENUserAlertMutex);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v28, (CFUserNotificationCallBack)_responseCallback, 0);
  v34 = RunLoopSource;
  if (RunLoopSource)
  {
    self->_userRLS = RunLoopSource;
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v34, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }
  else
  {
LABEL_24:
    ENErrorF(11);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v43[5];
    v43[5] = v36;

  }
  v6[2](v6);

  _Block_object_dispose(&v42, 8);
}

uint64_t __46__ENUserAlert__activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENUserAlert <= 90 && (gLogCategory__ENUserAlert != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_autoInvalidate");
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
  block[2] = __25__ENUserAlert_invalidate__block_invoke;
  block[3] = &unk_24C38AE38;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__ENUserAlert_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  if (gLogCategory_ENUserAlert <= 30)
  {
    if (gLogCategory_ENUserAlert != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF_safe();
  }
  v2 = *(_QWORD *)(v1 + 32);
  if (!*(_BYTE *)(v2 + 9))
  {
    *(_BYTE *)(v2 + 9) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_autoInvalidate");
  }
  return result;
}

- (void)_autoInvalidate
{
  __CFRunLoopSource *userRLS;
  const __CFString *v4;
  __CFRunLoop *Main;
  __CFUserNotification *userNotification;
  void *v7;
  void *v8;

  if (!self->_invalidateCalled
    && gLogCategory_ENUserAlert <= 30
    && (gLogCategory_ENUserAlert != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  self->_invalidateCalled = 1;
  userRLS = self->_userRLS;
  if (userRLS)
  {
    v4 = (const __CFString *)*MEMORY[0x24BDBD5A0];
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, userRLS, v4);
    CFRelease(userRLS);
    self->_userRLS = 0;
  }
  userNotification = self->_userNotification;
  if (userNotification)
  {
    pthread_mutex_lock(&gENUserAlertMutex);
    v7 = (void *)gENUserAlertMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", userNotification);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

    pthread_mutex_unlock(&gENUserAlertMutex);
    if (!self->_dismissed)
      CFUserNotificationCancel(userNotification);
    CFRelease(userNotification);
    self->_userNotification = 0;
  }
  -[ENUserAlert _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  id actionHandler;
  void (**v4)(_QWORD);
  id invalidationHandler;
  void (**v6)(id, uint64_t);

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_userNotification)
  {
    v6 = (void (**)(id, uint64_t))MEMORY[0x20BD2F464](self->_actionHandler, a2);
    actionHandler = self->_actionHandler;
    self->_actionHandler = 0;

    if (v6)
      v6[2](v6, 11);
    v4 = (void (**)(_QWORD))MEMORY[0x20BD2F464](self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v4)
      v4[2](v4);
    self->_invalidateDone = 1;
    if (gLogCategory_ENUserAlert <= 30 && (gLogCategory_ENUserAlert != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();

  }
}

- (void)_responseCallback:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__ENUserAlert__responseCallback_responseFlags___block_invoke;
  block[3] = &unk_24C38BA88;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __47__ENUserAlert__responseCallback_responseFlags___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(id, uint64_t);

  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (gLogCategory_ENUserAlert <= 30 && (gLogCategory_ENUserAlert != -1 || _LogCategory_Initialize()))
    {
      v6 = *(_QWORD *)(a1 + 48);
      LogPrintF_safe();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 1;
    v2 = *(_QWORD *)(a1 + 48);
    v7 = (void (**)(id, uint64_t))MEMORY[0x20BD2F464](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 112);
    *(_QWORD *)(v3 + 112) = 0;

    if (v7)
    {
      if ((v2 & 3) == 3)
        v5 = 10;
      else
        v5 = (v2 & 3) + 1;
      v7[2](v7, v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "_autoInvalidate", v6);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)titleParameter
{
  return self->_titleParameter;
}

- (void)setTitleParameter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)subTitleKey
{
  return self->_subTitleKey;
}

- (void)setSubTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSObject)subTitleParameter
{
  return self->_subTitleParameter;
}

- (void)setSubTitleParameter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)defaultButtonTitleKey
{
  return self->_defaultButtonTitleKey;
}

- (void)setDefaultButtonTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)alternativeButtonTitleKey
{
  return self->_alternativeButtonTitleKey;
}

- (void)setAlternativeButtonTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)showOnLockScreen
{
  return self->_showOnLockScreen;
}

- (void)setShowOnLockScreen:(BOOL)a3
{
  self->_showOnLockScreen = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_alternativeButtonTitleKey, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitleKey, 0);
  objc_storeStrong((id *)&self->_subTitleParameter, 0);
  objc_storeStrong((id *)&self->_subTitleKey, 0);
  objc_storeStrong((id *)&self->_titleParameter, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
