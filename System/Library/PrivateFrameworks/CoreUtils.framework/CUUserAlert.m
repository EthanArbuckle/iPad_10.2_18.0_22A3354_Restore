@implementation CUUserAlert

- (CUUserAlert)init
{
  CUUserAlert *v2;
  CUUserAlert *v3;
  CUUserAlert *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUUserAlert;
  v2 = -[CUUserAlert init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  if (self->_activateCalled && !self->_invalidateDone)
    FatalErrorF((uint64_t)"Activate without invalidate", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v8.receiver);
  v8.receiver = self;
  v8.super_class = (Class)CUUserAlert;
  -[CUUserAlert dealloc](&v8, sel_dealloc);
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
  v7[2] = __38__CUUserAlert_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id v7;
  NSString *v8;
  NSBundle *localizationBundle;
  void *v10;
  void *v11;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  NSBundle *v16;
  void *v17;
  void *v18;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  NSBundle *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *v27;
  NSBundle *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __CFUserNotification *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __CFUserNotification *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  __CFRunLoopSource *RunLoopSource;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __CFRunLoopSource *v49;
  __CFRunLoop *Main;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  SInt32 error;
  _QWORD aBlock[5];
  id v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v4 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__8818;
  v62 = __Block_byref_object_dispose__8819;
  v63 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__CUUserAlert__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_1E25DE160;
  v57 = &v58;
  v5 = v4;
  aBlock[4] = self;
  v56 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = self->_titleKey;
  if (v8)
  {
    localizationBundle = self->_localizationBundle;
    v10 = localizationBundle;
    if (!localizationBundle)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    CULocalizedStringEx(v10, self->_localizationTableName, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!localizationBundle)

    v12 = self->_titleParameter;
    if (v12)
    {
      v53 = (uint64_t)v12;
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v11);

      v11 = (void *)v13;
    }
    v14 = *MEMORY[0x1E0C9B800];

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v14);
  }

  v15 = self->_subtitleKey;
  if (v15)
  {
    v16 = self->_localizationBundle;
    v17 = v16;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    CULocalizedStringEx(v17, self->_localizationTableName, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)

    v19 = self->_subtitleParameter;
    if (v19)
    {
      v53 = (uint64_t)v19;
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v18);

      v18 = (void *)v20;
    }
    v21 = *MEMORY[0x1E0C9B810];

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v21);
  }

  v22 = self->_defaultButtonTitleKey;
  if (v22)
  {
    v23 = self->_localizationBundle;
    v24 = v23;
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    CULocalizedStringEx(v24, self->_localizationTableName, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0C9B838];
    if (!v23)

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v26);
  }

  v27 = self->_alternativeButtonTitleKey;
  if (v27)
  {
    v28 = self->_localizationBundle;
    v29 = v28;
    if (!v28)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    CULocalizedStringEx(v29, self->_localizationTableName, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0C9B830];
    if (!v28)

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, v31);
  }

  error = 0;
  v32 = CFUserNotificationCreate(0, self->_timeoutSeconds, 2uLL, &error, (CFDictionaryRef)v7);
  v38 = v32;
  if (!v32)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"Create alert failed (%d)", v33, v34, v35, v36, v37, error);
    v51 = objc_claimAutoreleasedReturnValue();
LABEL_37:
    v52 = (void *)v59[5];
    v59[5] = v51;

    goto LABEL_34;
  }
  self->_userNotification = v32;
  pthread_mutex_lock(&gCUUserAlertMutex);
  v39 = (void *)gCUUserAlertMap;
  if (!gCUUserAlertMap)
  {
    v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v41 = (void *)gCUUserAlertMap;
    gCUUserAlertMap = (uint64_t)v40;

    v39 = (void *)gCUUserAlertMap;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKeyedSubscript:", self, v42);

  pthread_mutex_unlock(&gCUUserAlertMutex);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v38, (CFUserNotificationCallBack)_responseCallback, 0);
  v49 = RunLoopSource;
  if (!RunLoopSource)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"Create alert RLS failed", v44, v45, v46, v47, v48, v53);
    v51 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  self->_userRLS = RunLoopSource;
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v49, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
LABEL_34:

  v6[2](v6);
  _Block_object_dispose(&v58, 8);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CUUserAlert_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_autoInvalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFRunLoopSource *userRLS;
  const __CFString *v8;
  __CFRunLoop *Main;
  __CFUserNotification *userNotification;
  void *v11;
  void *v12;
  uint64_t v13;

  if (!self->_invalidateCalled
    && gLogCategory_CUUserAlert <= 30
    && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu)))
  {
    LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert _autoInvalidate]", 0x1Eu, (uint64_t)"Auto-invalidate", v2, v3, v4, v5, v13);
  }
  self->_invalidateCalled = 1;
  userRLS = self->_userRLS;
  if (userRLS)
  {
    v8 = (const __CFString *)*MEMORY[0x1E0C9B280];
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, userRLS, v8);
    CFRelease(userRLS);
    self->_userRLS = 0;
  }
  userNotification = self->_userNotification;
  if (userNotification)
  {
    pthread_mutex_lock(&gCUUserAlertMutex);
    v11 = (void *)gCUUserAlertMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", userNotification);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v12);

    pthread_mutex_unlock(&gCUUserAlertMutex);
    if (!self->_dismissed)
      CFUserNotificationCancel(userNotification);
    CFRelease(userNotification);
    self->_userNotification = 0;
  }
  -[CUUserAlert _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  id actionHandler;
  void (**v4)(_QWORD);
  id invalidationHandler;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(id, uint64_t);

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_userNotification)
  {
    v11 = (void (**)(id, uint64_t))_Block_copy(self->_actionHandler);
    actionHandler = self->_actionHandler;
    self->_actionHandler = 0;

    if (v11)
      v11[2](v11, -71148);
    v4 = (void (**)(_QWORD))_Block_copy(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v4)
      v4[2](v4);
    self->_invalidateDone = 1;
    if (gLogCategory_CUUserAlert <= 30
      && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu)))
    {
      LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert _invalidated]", 0x1Eu, (uint64_t)"Invalidated", v6, v7, v8, v9, v10);
    }

  }
}

- (void)_responseCallback:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CUUserAlert__responseCallback_responseFlags___block_invoke;
  block[3] = &unk_1E25DE188;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSBundle)localizationBundle
{
  return self->_localizationBundle;
}

- (void)setLocalizationBundle:(id)a3
{
  objc_storeStrong((id *)&self->_localizationBundle, a3);
}

- (NSString)localizationTableName
{
  return self->_localizationTableName;
}

- (void)setLocalizationTableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)titleParameter
{
  return self->_titleParameter;
}

- (void)setTitleParameter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)subtitleKey
{
  return self->_subtitleKey;
}

- (void)setSubtitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)subtitleParameter
{
  return self->_subtitleParameter;
}

- (void)setSubtitleParameter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)defaultButtonTitleKey
{
  return self->_defaultButtonTitleKey;
}

- (void)setDefaultButtonTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)alternativeButtonTitleKey
{
  return self->_alternativeButtonTitleKey;
}

- (void)setAlternativeButtonTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_alternativeButtonTitleKey, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitleKey, 0);
  objc_storeStrong((id *)&self->_subtitleParameter, 0);
  objc_storeStrong((id *)&self->_subtitleKey, 0);
  objc_storeStrong((id *)&self->_titleParameter, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_localizationTableName, 0);
  objc_storeStrong((id *)&self->_localizationBundle, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __47__CUUserAlert__responseCallback_responseFlags___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void (**v13)(id, uint64_t);

  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (gLogCategory_CUUserAlert <= 30
      && (gLogCategory_CUUserAlert != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu)))
    {
      LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert _responseCallback:responseFlags:]_block_invoke", 0x1Eu, (uint64_t)"User alert response: Flags 0x%lX", a5, a6, a7, a8, *(_QWORD *)(a1 + 48));
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 1;
    v9 = *(_QWORD *)(a1 + 48);
    v13 = (void (**)(id, uint64_t))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 120));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 120);
    *(_QWORD *)(v10 + 120) = 0;

    if (v13)
    {
      if ((v9 & 3) == 3)
        v12 = 10;
      else
        v12 = (v9 & 3) + 1;
      v13[2](v13, v12);
    }
    objc_msgSend(*(id *)(a1 + 32), "_autoInvalidate");

  }
}

uint64_t __25__CUUserAlert_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = result;
  if (gLogCategory_CUUserAlert <= 30)
  {
    if (gLogCategory_CUUserAlert != -1
      || (result = _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu), (_DWORD)result))
    {
      result = LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate", a5, a6, a7, a8, v10);
    }
  }
  v9 = *(_QWORD *)(v8 + 32);
  if (!*(_BYTE *)(v9 + 9))
  {
    *(_BYTE *)(v9 + 9) = 1;
    return objc_msgSend(*(id *)(v8 + 32), "_autoInvalidate");
  }
  return result;
}

uint64_t __39__CUUserAlert__activateWithCompletion___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40);
  if (v8)
  {
    v9 = result;
    if (gLogCategory_CUUserAlert <= 90)
    {
      if (gLogCategory_CUUserAlert == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x5Au))
          goto LABEL_7;
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 48) + 8) + 40);
      }
      NSPrintF((uint64_t)"%{error}", a2, a3, a4, a5, a6, a7, a8, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert _activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %@", v11, v12, v13, v14, (uint64_t)v10);

    }
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(v9 + 40) + 16))();
    return objc_msgSend(*(id *)(v9 + 32), "_autoInvalidate");
  }
  return result;
}

void __38__CUUserAlert_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  uint64_t v37;
  id v38;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 8))
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960575, (uint64_t)"activate already called", a4, a5, a6, a7, a8, v37);
    v10 = objc_claimAutoreleasedReturnValue();
    v38 = (id)v10;
    if (gLogCategory_CUUserAlert <= 90)
    {
      if (gLogCategory_CUUserAlert != -1
        || (v34 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x5Au), v10 = (uint64_t)v38, v34))
      {
        NSPrintF((uint64_t)"%{error}", v10, v11, v12, v13, v14, v15, v16, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %@", v18, v19, v20, v21, (uint64_t)v17);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_autoInvalidate");
LABEL_16:

    return;
  }
  if (*(_BYTE *)(v9 + 9))
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294896148, (uint64_t)"activate after invalidate", a4, a5, a6, a7, a8, v37);
    v22 = objc_claimAutoreleasedReturnValue();
    v38 = (id)v22;
    if (gLogCategory_CUUserAlert <= 90)
    {
      if (gLogCategory_CUUserAlert != -1
        || (v35 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x5Au), v22 = (uint64_t)v38, v35))
      {
        NSPrintF((uint64_t)"%{error}", v22, v23, v24, v25, v26, v27, v28, v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %@", v30, v31, v32, v33, (uint64_t)v29);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  if (gLogCategory_CUUserAlert <= 30)
  {
    if (gLogCategory_CUUserAlert != -1
      || (v36 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUUserAlert, 0x1Eu), v9 = *(_QWORD *)(a1 + 32), v36))
    {
      LogPrintF_safe((uint64_t)&gLogCategory_CUUserAlert, (uint64_t)"-[CUUserAlert activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate: Timeout %.3f", a5, a6, a7, a8, *(_QWORD *)(v9 + 112));
      v9 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v9 + 8) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

@end
