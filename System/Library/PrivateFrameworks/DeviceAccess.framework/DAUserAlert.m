@implementation DAUserAlert

- (DAUserAlert)init
{
  DAUserAlert *v2;
  DAUserAlert *v3;
  DAUserAlert *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DAUserAlert;
  v2 = -[DAUserAlert init](&v6, sel_init);
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
  DAUserAlert *v2;
  SEL v3;
  id v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateDone)
  {
    v2 = (DAUserAlert *)FatalErrorF();
    -[DAUserAlert activateWithCompletionHandler:](v2, v3, v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DAUserAlert;
    -[DAUserAlert dealloc](&v5, sel_dealloc);
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
  v7[2] = __45__DAUserAlert_activateWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D169230;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __45__DAUserAlert_activateWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 8))
  {
    DAErrorF(350002, (uint64_t)"activate already called", a3, a4, a5, a6, a7, a8, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_DAUserAlert <= 90 && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_autoInvalidate");
LABEL_16:

    return;
  }
  if (*(_BYTE *)(v9 + 9))
  {
    DAErrorF(350002, (uint64_t)"activate after invalidate", a3, a4, a5, a6, a7, a8, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_DAUserAlert <= 90 && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    goto LABEL_16;
  }
  if (gLogCategory_DAUserAlert <= 30)
  {
    if (gLogCategory_DAUserAlert != -1 || (v10 = _LogCategory_Initialize(), v9 = *(_QWORD *)(a1 + 32), v10))
    {
      LogPrintF();
      v9 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v9 + 8) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id v7;
  NSString *v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  NSString *v16;
  uint64_t *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  NSString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __CFUserNotification *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __CFUserNotification *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  __CFRunLoopSource *RunLoopSource;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __CFRunLoopSource *v53;
  __CFRunLoop *Main;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  SInt32 error;
  _QWORD aBlock[5];
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;

  v4 = a3;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__2;
  v66 = __Block_byref_object_dispose__2;
  v67 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__DAUserAlert__activateWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_24D169258;
  v61 = &v62;
  v5 = v4;
  aBlock[4] = self;
  v60 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = self->_titleKey;
  v9 = (uint64_t *)MEMORY[0x24BDBD6D8];
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", v8, &stru_24D169BB8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = self->_titleParameter;
    if (v12)
    {
      v57 = (uint64_t)v12;
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v11);

      v11 = (void *)v13;
    }
    v14 = *v9;

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v14);
  }

  v15 = self->_localizedTitle;
  if (v15)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, *v9);

  v16 = self->_subTitleKey;
  v17 = (uint64_t *)MEMORY[0x24BDBD6E0];
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", v16, &stru_24D169BB8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = self->_subTitleParameter;
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = objc_alloc(MEMORY[0x24BDD17C8]);
        v57 = -[NSObject unsignedIntValue](v20, "unsignedIntValue");
        v22 = objc_msgSend(v21, "initWithFormat:", v19);
      }
      else
      {
        v57 = (uint64_t)v20;
        v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v19);
      }
      v23 = (void *)v22;

      v19 = v23;
    }
    v24 = *v17;

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v24);
  }

  v25 = self->_localizedMessage;
  if (v25)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, *v17);

  v26 = self->_defaultButtonTitleKey;
  if (v26)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CULocalizedStringEx();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x24BDBD6F8];

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, v29);
  }

  v30 = self->_alternativeButtonTitleKey;
  if (v30)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CULocalizedStringEx();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *MEMORY[0x24BDBD6F0];

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, v33);
  }

  if (self->_showOnLockScreen)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBD6E8]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB0E50]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BEB0E38]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB0DF8]);
  }
  error = 0;
  v34 = CFUserNotificationCreate(0, self->_timeoutSeconds, 2uLL, &error, (CFDictionaryRef)v7);
  v41 = v34;
  if (!v34)
  {
    DAErrorF(350004, (uint64_t)"Create alert failed (%d)", v35, v36, v37, v38, v39, v40, error);
    v55 = objc_claimAutoreleasedReturnValue();
LABEL_30:
    v56 = (void *)v63[5];
    v63[5] = v55;

    goto LABEL_27;
  }
  self->_userNotification = v34;
  pthread_mutex_lock(&gDAUserAlertMutex);
  v42 = (void *)gDAUserAlertMap;
  if (!gDAUserAlertMap)
  {
    v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v44 = (void *)gDAUserAlertMap;
    gDAUserAlertMap = (uint64_t)v43;

    v42 = (void *)gDAUserAlertMap;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v41);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", self, v45);

  pthread_mutex_unlock(&gDAUserAlertMutex);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v41, (CFUserNotificationCallBack)_responseCallback, 0);
  v53 = RunLoopSource;
  if (!RunLoopSource)
  {
    DAErrorF(350004, (uint64_t)"Create alert RLS failed", v47, v48, v49, v50, v51, v52, v57);
    v55 = objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  self->_userRLS = RunLoopSource;
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v53, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
LABEL_27:

  v6[2](v6);
  _Block_object_dispose(&v62, 8);

}

uint64_t __46__DAUserAlert__activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DAUserAlert <= 90 && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

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
  block[2] = __25__DAUserAlert_invalidate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__DAUserAlert_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  if (gLogCategory_DAUserAlert <= 30)
  {
    if (gLogCategory_DAUserAlert != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
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
    && gLogCategory_DAUserAlert <= 30
    && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
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
    pthread_mutex_lock(&gDAUserAlertMutex);
    v7 = (void *)gDAUserAlertMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", userNotification);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

    pthread_mutex_unlock(&gDAUserAlertMutex);
    if (!self->_dismissed)
      CFUserNotificationCancel(userNotification);
    CFRelease(userNotification);
    self->_userNotification = 0;
  }
  -[DAUserAlert _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  id actionHandler;
  void (**v4)(_QWORD);
  id invalidationHandler;
  void (**v6)(id, uint64_t);

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_userNotification)
  {
    v6 = (void (**)(id, uint64_t))_Block_copy(self->_actionHandler);
    actionHandler = self->_actionHandler;
    self->_actionHandler = 0;

    if (v6)
      v6[2](v6, 15);
    v4 = (void (**)(_QWORD))_Block_copy(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v4)
      v4[2](v4);
    self->_invalidateDone = 1;
    if (gLogCategory_DAUserAlert <= 30 && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
      LogPrintF();

  }
}

- (void)_responseCallback:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__DAUserAlert__responseCallback_responseFlags___block_invoke;
  block[3] = &unk_24D169280;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __47__DAUserAlert__responseCallback_responseFlags___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(id, uint64_t);

  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (gLogCategory_DAUserAlert <= 30 && (gLogCategory_DAUserAlert != -1 || _LogCategory_Initialize()))
    {
      v6 = *(_QWORD *)(a1 + 48);
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 1;
    v2 = *(_QWORD *)(a1 + 48);
    v7 = (void (**)(id, uint64_t))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 112));
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

+ (id)accessoryRemovalAlert:(id)a3 appName:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  DAUserAlert *v18;
  void *v19;
  void *v20;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CULocalizedStringEx();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CULocalizedStringEx();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CULocalizedStringEx();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  GestaltGetDeviceClass();
  CUGestaltDeviceClassToString();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v13;
  v17 = v16;

  v18 = objc_alloc_init(DAUserAlert);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAUserAlert setLocalizedTitle:](v18, "setLocalizedTitle:", v19);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v11, v7, v6, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[DAUserAlert setLocalizedMessage:](v18, "setLocalizedMessage:", v20);
  -[DAUserAlert setDefaultButtonTitleKey:](v18, "setDefaultButtonTitleKey:", CFSTR("DeviceRemoveAlertPrimaryKey"));
  -[DAUserAlert setAlternativeButtonTitleKey:](v18, "setAlternativeButtonTitleKey:", CFSTR("DeviceRemoveAlertSecondaryKey"));

  return v18;
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

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void)setLocalizedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localizedMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
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
