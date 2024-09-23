@implementation FigCaptureSessionObservatory

void __57__FigCaptureSessionObservatory_captureSessionWasCreated___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = malloc_type_calloc(1uLL, 0x48uLL, 0x108004003325E7CuLL);
  NSMapInsert(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40), v2);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t __49__FigCaptureSessionObservatory_registerObserver___block_invoke(uint64_t a1)
{
  return -[FigCaptureSessionObservatory _registerObserver:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)registerObserver:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__FigCaptureSessionObservatory_registerObserver___block_invoke;
    v4[3] = &unk_1E491E748;
    v4[4] = self;
    v4[5] = a3;
    fig_dispatch_async_autoreleasepool(queue, v4);
  }
}

- (void)captureSessionWasCreated:(OpaqueFigCaptureSession *)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (a3)
  {
    CFRetain(a3);
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__FigCaptureSessionObservatory_captureSessionWasCreated___block_invoke;
    v6[3] = &unk_1E491F158;
    v6[4] = self;
    v6[5] = a3;
    fig_dispatch_async_autoreleasepool(queue, v6);
  }
}

- (uint64_t)_registerObserver:(uint64_t)result
{
  uint64_t v2;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  _QWORD *v10;
  FigCaptureSessionProxy *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  FigCaptureSessionProxy *v15;
  FigCaptureSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      v21 = v2;
      LODWORD(v20) = 0;
      FigDebugAssert3();
    }
    objc_msgSend(*(id *)(v4 + 16), "addObject:", a2, v20, v21);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = *(void **)(v4 + 8);
    result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v25;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(v5);
          v9 = *(const void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
          v10 = NSMapGet(*(NSMapTable **)(v4 + 8), v9);
          if (*(_DWORD *)v10 == 2)
          {
            v16 = [FigCaptureSessionProxy alloc];
            v17 = v10[1];
            v18 = *((unsigned __int8 *)v10 + 48);
            v19 = *((_OWORD *)v10 + 2);
            v22 = *((_OWORD *)v10 + 1);
            v23 = v19;
            v15 = -[FigCaptureSessionProxy initWithFigCaptureSession:identifier:clientAuditToken:containsVideoSource:](v16, "initWithFigCaptureSession:identifier:clientAuditToken:containsVideoSource:", v9, v17, &v22, v18);
            objc_msgSend(a2, "captureSessionDidStart:", v15);
          }
          else
          {
            if (*(_DWORD *)v10 != 1)
              goto LABEL_14;
            v11 = [FigCaptureSessionProxy alloc];
            v12 = v10[1];
            v13 = *((unsigned __int8 *)v10 + 48);
            v14 = *((_OWORD *)v10 + 2);
            v22 = *((_OWORD *)v10 + 1);
            v23 = v14;
            v15 = -[FigCaptureSessionProxy initWithFigCaptureSession:identifier:clientAuditToken:containsVideoSource:](v11, "initWithFigCaptureSession:identifier:clientAuditToken:containsVideoSource:", v9, v12, &v22, v13);
            objc_msgSend(a2, "captureSessionWillStart:", v15);
          }

LABEL_14:
          if (-[FigCaptureSessionObservatory _isSessionRecordingMovie:](v4, v9))
            -[FigCaptureSessionObservatory _postMovieRecordingUpdateNotification:forCaptureSession:]((dispatch_queue_t *)v4, 1, v9);
          ++v8;
        }
        while (v6 != v8);
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v6 = result;
      }
      while (result);
    }
  }
  return result;
}

+ (id)sharedObservatory
{
  if (sharedObservatory_once != -1)
    dispatch_once(&sharedObservatory_once, &__block_literal_global_58);
  return (id)sharedObservatory_sharedObservatory;
}

+ (void)initialize
{
  objc_opt_class();
}

FigCaptureSessionObservatory *__49__FigCaptureSessionObservatory_sharedObservatory__block_invoke()
{
  FigCaptureSessionObservatory *result;

  result = objc_alloc_init(FigCaptureSessionObservatory);
  sharedObservatory_sharedObservatory = (uint64_t)result;
  return result;
}

- (FigCaptureSessionObservatory)init
{
  FigCaptureSessionObservatory *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSessionObservatory;
  v2 = -[FigCaptureSessionObservatory init](&v4, sel_init);
  if (v2)
  {
    v2->_captureSessionsStorage = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 259, 1);
    v2->_registeredObservers = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.capturesessionobserver", 0);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionObservatory;
  -[FigCaptureSessionObservatory dealloc](&v3, sel_dealloc);
}

- (void)unregisterObserver:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__FigCaptureSessionObservatory_unregisterObserver___block_invoke;
    v4[3] = &unk_1E491E748;
    v4[4] = self;
    v4[5] = a3;
    fig_dispatch_async_autoreleasepool(queue, v4);
  }
}

uint64_t __51__FigCaptureSessionObservatory_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)_isSessionRecordingMovie:(unint64_t)result
{
  unint64_t v3;
  unint64_t v4;

  if (result)
  {
    v3 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 24));
    result = (unint64_t)NSMapGet(*(NSMapTable **)(v3 + 8), a2);
    if (result)
    {
      v4 = result;
      return objc_msgSend(*(id *)(result + 56), "count") || *(_QWORD *)(v4 + 64) > 0;
    }
  }
  return result;
}

- (dispatch_queue_t)_postMovieRecordingUpdateNotification:(const void *)a3 forCaptureSession:
{
  dispatch_queue_t *v5;
  dispatch_queue_t *v6;
  dispatch_queue_t v7;
  dispatch_queue_t *v8;
  uint64_t v9;
  dispatch_queue_t *v10;
  void *v11;
  dispatch_queue_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    dispatch_assert_queue_V2(result[3]);
    result = (dispatch_queue_t *)NSMapGet((NSMapTable *)v5[1], a3);
    if (result)
    {
      v6 = result;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = v5[2];
      result = (dispatch_queue_t *)-[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (result)
      {
        v8 = result;
        v9 = *(_QWORD *)v14;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
            v12 = v6[1];
            if (a2)
              objc_msgSend(v11, "captureSessionDidStartMovieRecording:", v12);
            else
              objc_msgSend(v11, "captureSessionDidFinishMovieRecording:", v12);
            v10 = (dispatch_queue_t *)((char *)v10 + 1);
          }
          while (v8 != v10);
          result = (dispatch_queue_t *)-[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          v8 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (void)_setStatus:(__int128 *)a3 clientAuditToken:(char)a4 containsVideoSource:(CFTypeRef)cf forCaptureSession:
{
  __int128 v10;
  NSObject *v11;
  _QWORD v12[6];
  int v13;
  __int128 v14;
  __int128 v15;
  char v16;

  if (a1)
  {
    CFRetain(cf);
    v12[1] = 3221225472;
    v10 = a3[1];
    v14 = *a3;
    v11 = *(NSObject **)(a1 + 24);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[2] = __98__FigCaptureSessionObservatory__setStatus_clientAuditToken_containsVideoSource_forCaptureSession___block_invoke;
    v12[3] = &unk_1E49228B0;
    v12[4] = a1;
    v12[5] = cf;
    v13 = a2;
    v15 = v10;
    v16 = a4;
    fig_dispatch_async_autoreleasepool(v11, v12);
  }
}

void __98__FigCaptureSessionObservatory__setStatus_clientAuditToken_containsVideoSource_forCaptureSession___block_invoke(uint64_t a1)
{
  _OWORD *v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  int v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  FigCaptureSessionProxy *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  FigCaptureSessionProxy *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  FigCaptureSessionProxy *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  FigCaptureSessionProxy *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52[2];
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = NSMapGet(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    if (*(_DWORD *)v2 != *(_DWORD *)(a1 + 48)
      || (v4 = v2[2],
          v53 = v2[1],
          v54 = v4,
          v5 = *(_OWORD *)(a1 + 68),
          v52[0] = *(_OWORD *)(a1 + 52),
          v52[1] = v5,
          !FigCaptureAuditTokenProcessesAreEqual(&v53, v52))
      || *((unsigned __int8 *)v3 + 48) != *(unsigned __int8 *)(a1 + 84))
    {
      *(_DWORD *)v3 = *(_DWORD *)(a1 + 48);
      v6 = *(_OWORD *)(a1 + 68);
      v3[1] = *(_OWORD *)(a1 + 52);
      v3[2] = v6;
      *((_BYTE *)v3 + 48) = *(_BYTE *)(a1 + 84);
      v7 = *(_DWORD *)(a1 + 48);
      if (v7)
      {
        v8 = v3 + 1;
        if (v7 == 2)
        {
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v28 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v45;
            do
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v45 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
                v34 = [FigCaptureSessionProxy alloc];
                v35 = *(_QWORD *)(a1 + 40);
                v36 = *((_QWORD *)v3 + 1);
                v37 = *((unsigned __int8 *)v3 + 48);
                v38 = v3[2];
                v53 = *v8;
                v54 = v38;
                v39 = -[FigCaptureSessionProxy initWithFigCaptureSession:identifier:clientAuditToken:containsVideoSource:](v34, "initWithFigCaptureSession:identifier:clientAuditToken:containsVideoSource:", v35, v36, &v53, v37);
                objc_msgSend(v33, "captureSessionDidStart:", v39);

              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
            }
            while (v30);
          }
        }
        else if (v7 == 1)
        {
          v9 = *(_QWORD *)(a1 + 32);
          v10 = *(_QWORD *)(v9 + 32) + 1;
          *(_QWORD *)(v9 + 32) = v10;
          *((_QWORD *)v3 + 1) = v10;
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v49;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v49 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                v17 = [FigCaptureSessionProxy alloc];
                v18 = *(_QWORD *)(a1 + 40);
                v19 = *((_QWORD *)v3 + 1);
                v20 = *((unsigned __int8 *)v3 + 48);
                v21 = v3[2];
                v53 = *v8;
                v54 = v21;
                v22 = -[FigCaptureSessionProxy initWithFigCaptureSession:identifier:clientAuditToken:containsVideoSource:](v17, "initWithFigCaptureSession:identifier:clientAuditToken:containsVideoSource:", v18, v19, &v53, v20);
                objc_msgSend(v16, "captureSessionWillStart:", v22);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            }
            while (v13);
          }
        }
      }
      else
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v23 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v41;
          do
          {
            for (k = 0; k != v25; ++k)
            {
              if (*(_QWORD *)v41 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * k), "captureSessionDidStop:", *((_QWORD *)v3 + 1));
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
          }
          while (v25);
        }
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_setMovieFileOutputRecording:(uint64_t)a3 sectionID:(CFTypeRef)cf forCaptureSession:
{
  NSObject *v8;
  _QWORD v9[7];
  char v10;

  if (a1)
  {
    CFRetain(cf);
    v8 = *(NSObject **)(a1 + 24);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __89__FigCaptureSessionObservatory__setMovieFileOutputRecording_sectionID_forCaptureSession___block_invoke;
    v9[3] = &unk_1E49228D8;
    v9[5] = a3;
    v9[6] = cf;
    v10 = a2;
    v9[4] = a1;
    fig_dispatch_async_autoreleasepool(v8, v9);
  }
}

void __89__FigCaptureSessionObservatory__setMovieFileOutputRecording_sectionID_forCaptureSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  int v6;

  v2 = NSMapGet(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 48));
  if (v2)
  {
    v3 = v2;
    v4 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(_QWORD *)(a1 + 32), *(const void **)(a1 + 48));
    v5 = (id)*((_QWORD *)v3 + 7);
    if (*(_BYTE *)(a1 + 56))
    {
      if (!v5)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        *((_QWORD *)v3 + 7) = v5;
      }
      objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));
      if (!objc_msgSend(*((id *)v3 + 7), "count"))
      {

        *((_QWORD *)v3 + 7) = 0;
      }
    }
    v6 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(_QWORD *)(a1 + 32), *(const void **)(a1 + 48));
    if (v4 != v6)
      -[FigCaptureSessionObservatory _postMovieRecordingUpdateNotification:forCaptureSession:](*(dispatch_queue_t **)(a1 + 32), v6, *(const void **)(a1 + 48));
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

- (void)_setFigAssetWriterRecording:(CFTypeRef)cf forCaptureSession:
{
  NSObject *v6;
  _QWORD v7[6];
  char v8;

  if (a1)
  {
    CFRetain(cf);
    v6 = *(NSObject **)(a1 + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__FigCaptureSessionObservatory__setFigAssetWriterRecording_forCaptureSession___block_invoke;
    v7[3] = &unk_1E4922900;
    v7[4] = a1;
    v7[5] = cf;
    v8 = a2;
    fig_dispatch_async_autoreleasepool(v6, v7);
  }
}

void __78__FigCaptureSessionObservatory__setFigAssetWriterRecording_forCaptureSession___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = NSMapGet(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  if (!v2)
    goto LABEL_8;
  v3 = v2;
  v4 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40));
  v5 = v3[8];
  if (*(_BYTE *)(a1 + 48))
  {
    v6 = v5 + 1;
LABEL_4:
    v3[8] = v6;
    goto LABEL_6;
  }
  v3[8] = v5 - 1;
  if (v5 <= 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v6 = 0;
    goto LABEL_4;
  }
LABEL_6:
  v7 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40));
  if (v4 != v7)
    -[FigCaptureSessionObservatory _postMovieRecordingUpdateNotification:forCaptureSession:](*(dispatch_queue_t **)(a1 + 32), v7, *(const void **)(a1 + 40));
LABEL_8:
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_resetFigAssetWriterRecordingsCountForCaptureSession:(uint64_t)a1
{
  NSObject *v4;
  _QWORD v5[6];

  if (a1)
  {
    CFRetain(cf);
    v4 = *(NSObject **)(a1 + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __85__FigCaptureSessionObservatory__resetFigAssetWriterRecordingsCountForCaptureSession___block_invoke;
    v5[3] = &unk_1E491F158;
    v5[4] = a1;
    v5[5] = cf;
    fig_dispatch_async_autoreleasepool(v4, v5);
  }
}

void __85__FigCaptureSessionObservatory__resetFigAssetWriterRecordingsCountForCaptureSession___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  int v5;

  v2 = NSMapGet(*(NSMapTable **)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    v4 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40));
    v3[8] = 0;
    v5 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40));
    if (v4 != v5)
      -[FigCaptureSessionObservatory _postMovieRecordingUpdateNotification:forCaptureSession:](*(dispatch_queue_t **)(a1 + 32), v5, *(const void **)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
