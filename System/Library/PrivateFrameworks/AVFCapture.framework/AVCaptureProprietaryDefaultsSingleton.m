@implementation AVCaptureProprietaryDefaultsSingleton

uint64_t __87__AVCaptureProprietaryDefaultsSingleton__runBlockOnProprietaryDefaultsSourceQueueSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

AVCaptureProprietaryDefaultsSingleton *__69__AVCaptureProprietaryDefaultsSingleton_proprietaryDefaultsSingleton__block_invoke()
{
  AVCaptureProprietaryDefaultsSingleton *result;

  result = objc_alloc_init(AVCaptureProprietaryDefaultsSingleton);
  proprietaryDefaultsSingleton_sProprietaryDefaults = (uint64_t)result;
  return result;
}

- (AVCaptureProprietaryDefaultsSingleton)init
{
  AVCaptureProprietaryDefaultsSingleton *v2;
  const char *v3;
  size_t v4;
  char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVCaptureProprietaryDefaultsSingleton;
  v2 = -[AVCaptureProprietaryDefaultsSingleton init](&v7, sel_init);
  if (v2)
  {
    v3 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.avfoundation.proprietarydefaults.singleton.source_queue.%p"), AVCPDS_DefaultsSourceQueueContext), "UTF8String");
    v4 = strlen(v3) + 1;
    v2->_proprietaryDefaultsSourceQueueLabelLength = v4;
    v5 = (char *)malloc_type_malloc(v4, 0x61CD31C1uLL);
    v2->_proprietaryDefaultsSourceQueueLabel = v5;
    memcpy(v5, v3, v2->_proprietaryDefaultsSourceQueueLabelLength);
    v2->_proprietaryDefaultsSourceQueue = (OS_dispatch_queue *)dispatch_queue_create(v2->_proprietaryDefaultsSourceQueueLabel, 0);
    v2->_proprietaryDefaultChangeNotificationCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.proprietarydefaults.singleton.callback", 0);
    if ((AVCaptureIsRunningInMediaserverd() & 1) == 0)
      +[AVCaptureDevice _registerOnceForServerConnectionDiedNotification](AVCaptureDevice, "_registerOnceForServerConnectionDiedNotification");
    v2->_weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
    v2->_defaultChangedHandlersForObserversForKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_keyObservationsThatFailedToRegisterWithServer = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[AVCaptureProprietaryDefaultsSingleton _updateProprietaryDefaultsSource:](v2, "_updateProprietaryDefaultsSource:", 1);
  }
  return v2;
}

- (void)_updateProprietaryDefaultsSource:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  os_log_type_t type;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((AVCaptureIsRunningInMediaserverd() & 1) != 0)
    v4 = (void *)FigCaptureSourceCopySources();
  else
    v4 = (void *)FigCaptureSourceRemoteCopyCaptureSources();
  v5 = v4;
  v6 = objc_msgSend(v4, "firstObject");
  if (!v6)
  {
    v12 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v5, "count", v8, v9);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__AVCaptureProprietaryDefaultsSingleton__updateProprietaryDefaultsSource___block_invoke;
  v10[3] = &unk_1E4216650;
  v10[4] = self;
  v10[5] = v6;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v10);
  if (v5)
    CFRelease(v5);
}

+ (void)addObserver:(id)a3 forKey:(id)a4 callHandlerForInitialValue:(BOOL)a5 defaultChangedHandler:(id)a6
{
  objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", a3, a4, a5, a6);
}

+ (id)objectForKey:(id)a3
{
  return (id)objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "objectForKey:", a3);
}

+ (id)proprietaryDefaultsSingleton
{
  if (proprietaryDefaultsSingleton_onceToken != -1)
    dispatch_once(&proprietaryDefaultsSingleton_onceToken, &__block_literal_global_13);
  return (id)proprietaryDefaultsSingleton_sProprietaryDefaults;
}

- (void)addObserver:(id)a3 forKey:(id)a4 callHandlerForInitialValue:(BOOL)a5 defaultChangedHandler:(id)a6
{
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  _QWORD v9[8];
  BOOL v10;

  if (!a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("observer must not be nil");
    goto LABEL_8;
  }
  if (!a4)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("key must not be nil");
    goto LABEL_8;
  }
  if (!a6)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("defaultChangedHandler must not be nil");
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0, a6));
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109__AVCaptureProprietaryDefaultsSingleton_addObserver_forKey_callHandlerForInitialValue_defaultChangedHandler___block_invoke;
  v9[3] = &unk_1E4217750;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a3;
  v9[7] = a6;
  v10 = a5;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v9);
}

- (id)objectForKey:(id)a3
{
  void *v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureProprietaryDefaultsSingleton_objectForKey___block_invoke;
  v5[3] = &unk_1E4217778;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = &v6;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_runBlockOnProprietaryDefaultsSourceQueueSync:(id)a3
{
  const char *label;
  NSObject *proprietaryDefaultsSourceQueue;
  _QWORD block[5];

  label = dispatch_queue_get_label(0);
  if (label
    && !strncmp(label, self->_proprietaryDefaultsSourceQueueLabel, self->_proprietaryDefaultsSourceQueueLabelLength))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    proprietaryDefaultsSourceQueue = self->_proprietaryDefaultsSourceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__AVCaptureProprietaryDefaultsSingleton__runBlockOnProprietaryDefaultsSourceQueueSync___block_invoke;
    block[3] = &unk_1E4217180;
    block[4] = a3;
    dispatch_sync(proprietaryDefaultsSourceQueue, block);
  }
}

id __54__AVCaptureProprietaryDefaultsSingleton_objectForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(a1[4] + 40);
  if (v2)
  {
    v3 = a1[5];
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v5 >= 2uLL)
    {
      v6 = (void (*)(uint64_t, uint64_t, uint64_t))v5[4];
      if (v6)
        v6(v2, v3, v4 + 40);
    }
  }
  return *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v7;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__AVCaptureProprietaryDefaultsSingleton_setObject_forKey___block_invoke;
  v8[3] = &unk_1E42177A0;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  v8[7] = &v9;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v8);
  v7 = v10[5];
  if (v7)
  {
    -[AVCaptureProprietaryDefaultsSingleton _handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:](self, "_handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:", a4, a3, v7, 0);

  }
  _Block_object_dispose(&v9, 8);
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "setObject:forKey:", a3, a4);
}

uint64_t __109__AVCaptureProprietaryDefaultsSingleton_addObserver_forKey_callHandlerForInitialValue_defaultChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t (**v4)(id, _QWORD, uint64_t);
  uint64_t result;
  uint64_t v6;
  BOOL v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)v2;
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
  }
  v4 = (uint64_t (**)(id, _QWORD, uint64_t))(id)objc_msgSend(*(id *)(a1 + 56), "copy");
  result = objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 48));
  v6 = result;
  if (result)
  {
    if (v2)
      goto LABEL_9;
  }
  else
  {
    result = objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));
    if (v2)
      goto LABEL_9;
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_registerWithServerToObserveKey:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
LABEL_9:
  if (v6)
    v7 = 1;
  else
    v7 = *(_BYTE *)(a1 + 64) == 0;
  if (!v7)
    return v4[2](v4, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40)));
  return result;
}

- (int)_registerWithServerToObserveKey:(id)a3
{
  OpaqueFigCaptureSource *proprietaryDefaultsSource;
  _QWORD *v5;
  uint64_t (*v6)(OpaqueFigCaptureSource *, id);

  proprietaryDefaultsSource = self->_proprietaryDefaultsSource;
  if (!proprietaryDefaultsSource)
    return -12780;
  v5 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  if (*v5 >= 2uLL && (v6 = (uint64_t (*)(OpaqueFigCaptureSource *, id))v5[6]) != 0)
    return v6(proprietaryDefaultsSource, a3);
  else
    return -12782;
}

- (id)cameraHistoryDownplayOverrideList
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__AVCaptureProprietaryDefaultsSingleton_cameraHistoryDownplayOverrideList__block_invoke;
  v4[3] = &unk_1E42178B8;
  v4[4] = self;
  v4[5] = &v5;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __74__AVCaptureProprietaryDefaultsSingleton_cameraHistoryDownplayOverrideList__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  if (v1)
  {
    v2 = result;
    v3 = getpid();
    v4 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8);
    result = CMBaseObjectGetVTable();
    v5 = *(_QWORD *)(result + 16);
    if (*(_QWORD *)v5 >= 3uLL)
    {
      if (*(_QWORD *)(v5 + 64))
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 80))(v1, v3, v4 + 40);
    }
  }
  return result;
}

+ (id)cameraHistoryDownplayOverrideList
{
  return (id)objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "cameraHistoryDownplayOverrideList");
}

void __58__AVCaptureProprietaryDefaultsSingleton_setObject_forKey___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  void *v7;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v1)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v5 >= 2uLL)
    {
      v6 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v5[5];
      if (v6)
      {
        if (!v6(v1, v3, v4))
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32)+ 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
          v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          if (v7)
          {
            if (!objc_msgSend(v7, "count"))
            {
              objc_msgSend(*(id *)(a1 + 32), "unobserveChangesForKey:", *(_QWORD *)(a1 + 40));

              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = 0;
            }
          }
        }
      }
    }
  }
}

+ (id)proprietaryDefaultsDomainForClient
{
  __int128 v3;

  return (id)objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton", 0, 0, 0, 0), "proprietaryDefaultsDomainForAuditToken:", &v3);
}

- (id)proprietaryDefaultsDomainForAuditToken:(id *)a3
{
  __int128 v3;
  id v4;
  _QWORD v6[6];
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__AVCaptureProprietaryDefaultsSingleton_proprietaryDefaultsDomainForAuditToken___block_invoke;
  v6[3] = &unk_1E4217840;
  v3 = *(_OWORD *)&a3->var0[4];
  v7 = *(_OWORD *)a3->var0;
  v8 = v3;
  v6[4] = self;
  v6[5] = &v9;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v6);
  v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)updateCameraHistory:(id)a3 withCameraInfo:(id)a4 maxLength:(unint64_t)a5 updateCameraHistoryDownplayOverrideList:(BOOL)a6 cameraCanBeInOverrideList:(BOOL)a7
{
  uint64_t v9;
  _QWORD v10[10];
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __152__AVCaptureProprietaryDefaultsSingleton_updateCameraHistory_withCameraInfo_maxLength_updateCameraHistoryDownplayOverrideList_cameraCanBeInOverrideList___block_invoke;
  v10[3] = &unk_1E4217868;
  v10[4] = self;
  v10[5] = a3;
  v11 = a6;
  v12 = a7;
  v10[6] = a4;
  v10[7] = &v13;
  v10[8] = &v19;
  v10[9] = a5;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v10);
  v9 = v20[5];
  if (v9)
  {
    -[AVCaptureProprietaryDefaultsSingleton _handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:](self, "_handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:", a3, v14[5], v9, 0);

  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

+ (void)updateCameraHistory:(id)a3 withCameraInfo:(id)a4 maxLength:(unint64_t)a5 updateCameraHistoryDownplayOverrideList:(BOOL)a6 cameraCanBeInOverrideList:(BOOL)a7
{
  objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "updateCameraHistory:withCameraInfo:maxLength:updateCameraHistoryDownplayOverrideList:cameraCanBeInOverrideList:", a3, a4, a5, a6, a7);
}

uint64_t __80__AVCaptureProprietaryDefaultsSingleton_proprietaryDefaultsDomainForAuditToken___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;
  uint64_t (*v5)(uint64_t, _OWORD *, uint64_t);
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  if (v1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    v3 = *(_OWORD *)(result + 64);
    v7 = *(_OWORD *)(result + 48);
    v8 = v3;
    result = CMBaseObjectGetVTable();
    v4 = *(_QWORD **)(result + 16);
    if (*v4 >= 5uLL)
    {
      v5 = (uint64_t (*)(uint64_t, _OWORD *, uint64_t))v4[12];
      if (v5)
      {
        v6[0] = v7;
        v6[1] = v8;
        return v5(v1, v6, v2 + 40);
      }
    }
  }
  return result;
}

_QWORD *__74__AVCaptureProprietaryDefaultsSingleton__updateProprietaryDefaultsSource___block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  const void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void (*v11)(uint64_t, uint64_t);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result[4] + 40);
  if (result[5] != v1)
  {
    v2 = result;
    if (v1)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", *(_QWORD *)(result[4] + 48), avpds_proprietaryDefaultsSourceNotificationHandler, 0, *(_QWORD *)(result[4] + 40));
      v3 = *(const void **)(v2[4] + 40);
      if (v3)
      {
        CFRelease(v3);
        *(_QWORD *)(v2[4] + 40) = 0;
      }
    }
    result = (_QWORD *)v2[5];
    if (result)
    {
      *(_QWORD *)(v2[4] + 40) = CFRetain(result);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", *(_QWORD *)(v2[4] + 48), avpds_proprietaryDefaultsSourceNotificationHandler, 0, *(_QWORD *)(v2[4] + 40), 0);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = (void *)objc_msgSend(*(id *)(v2[4] + 56), "allKeys", 0);
      result = (_QWORD *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (result)
      {
        v5 = result;
        v6 = *(_QWORD *)v13;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v13 != v6)
              objc_enumerationMutation(v4);
            v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7);
            v9 = *(_QWORD *)(v2[4] + 40);
            if (v9)
              v10 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
            else
              v10 = 0;
            if (*v10 >= 2uLL)
            {
              v11 = (void (*)(uint64_t, uint64_t))v10[6];
              if (v11)
                v11(v9, v8);
            }
            v7 = (_QWORD *)((char *)v7 + 1);
          }
          while (v5 != v7);
          result = (_QWORD *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          v5 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

void __152__AVCaptureProprietaryDefaultsSingleton_updateCameraHistory_withCameraInfo_maxLength_updateCameraHistoryDownplayOverrideList_cameraCanBeInOverrideList___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unsigned int (*v11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v12;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v1)
  {
    v3 = getpid();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(unsigned int *)(a1 + 72);
    v7 = *(unsigned __int8 *)(a1 + 80);
    v8 = *(unsigned __int8 *)(a1 + 81);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v10 >= 3uLL)
    {
      v11 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v10[8];
      if (v11)
      {
        if (!v11(v1, v3, v4, v5, v6, v7, v8, v9 + 40))
        {
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32)+ 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
            v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
            if (v12)
            {
              if (!objc_msgSend(v12, "count"))
              {
                objc_msgSend(*(id *)(a1 + 32), "unobserveChangesForKey:", *(_QWORD *)(a1 + 40));

                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = 0;
              }
            }
          }
        }
      }
    }
  }
}

+ (void)removeObserver:(id)a3 forKey:(id)a4
{
  objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "removeObserver:forKey:", a3, a4);
}

+ (id)objectsForWildcardKey:(id)a3
{
  return (id)objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "objectsForWildcardKey:", a3);
}

+ (void)setObject:(id)a3 forWildcardKey:(id)a4
{
  objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "setObject:forWildcardKey:", a3, a4);
}

+ (__CVBuffer)imageForKey:(id)a3 fillWidth:(int)a4 fillHeight:(int)a5
{
  return (__CVBuffer *)objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "imageForKey:fillWidth:fillHeight:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

+ (int)retryPriorFailedKeyObservationRegistrations
{
  return objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "retryPriorFailedKeyObservationRegistrations");
}

+ (id)proprietaryDefaultsDomainForAuditToken:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton");
  v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return (id)objc_msgSend(v4, "proprietaryDefaultsDomainForAuditToken:", v7);
}

+ (void)updateCameraOverrideHistory:(id)a3 withCameraInfo:(id)a4 setOverride:(BOOL)a5
{
  objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "updateCameraOverrideHistory:withCameraInfo:setOverride:", a3, a4, a5);
}

- (void)dealloc
{
  OpaqueFigCaptureSource *proprietaryDefaultsSource;
  objc_super v4;

  proprietaryDefaultsSource = self->_proprietaryDefaultsSource;
  if (proprietaryDefaultsSource)
    CFRelease(proprietaryDefaultsSource);

  free(self->_proprietaryDefaultsSourceQueueLabel);
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureProprietaryDefaultsSingleton;
  -[AVCaptureProprietaryDefaultsSingleton dealloc](&v4, sel_dealloc);
}

- (void)removeObserver:(id)a3 forKey:(id)a4
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  _QWORD v7[7];

  if (!a3)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = CFSTR("observer must not be nil");
    goto LABEL_6;
  }
  if (!a4)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = CFSTR("key must not be nil");
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0));
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AVCaptureProprietaryDefaultsSingleton_removeObserver_forKey___block_invoke;
  v7[3] = &unk_1E4216898;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a3;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v7);
}

_QWORD *__63__AVCaptureProprietaryDefaultsSingleton_removeObserver_forKey___block_invoke(_QWORD *a1)
{
  _QWORD *result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t, uint64_t);

  result = (_QWORD *)objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  if (result)
  {
    v3 = result;
    result = (_QWORD *)objc_msgSend(result, "objectForKey:", a1[6]);
    if (result)
    {
      objc_msgSend(v3, "removeObjectForKey:", a1[6]);
      result = (_QWORD *)objc_msgSend(v3, "count");
      if (!result)
      {
        objc_msgSend(*(id *)(a1[4] + 56), "setObject:forKeyedSubscript:", 0, a1[5]);
        result = (_QWORD *)objc_msgSend(*(id *)(a1[4] + 64), "removeObject:", a1[5]);
        v4 = *(_QWORD *)(a1[4] + 40);
        if (v4)
        {
          v5 = a1[5];
          result = (_QWORD *)CMBaseObjectGetVTable();
          v6 = (_QWORD *)result[2];
          if (*v6 >= 2uLL)
          {
            v7 = (uint64_t (*)(uint64_t, uint64_t))v6[7];
            if (v7)
              return (_QWORD *)v7(v4, v5);
          }
        }
      }
    }
  }
  return result;
}

- (id)objectsForWildcardKey:(id)a3
{
  void *v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVCaptureProprietaryDefaultsSingleton_objectsForWildcardKey___block_invoke;
  v5[3] = &unk_1E4217778;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = &v6;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

_QWORD *__63__AVCaptureProprietaryDefaultsSingleton_objectsForWildcardKey___block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(result[4] + 40);
  if (v1)
  {
    v2 = result;
    v3 = result[5];
    v4 = *(_QWORD *)(result[6] + 8);
    v5 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v5 >= 7uLL)
    {
      v6 = (void (*)(uint64_t, uint64_t, uint64_t))v5[14];
      if (v6)
        v6(v1, v3, v4 + 40);
    }
    return *(id *)(*(_QWORD *)(v2[6] + 8) + 40);
  }
  return result;
}

- (void)setObject:(id)a3 forWildcardKey:(id)a4
{
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__AVCaptureProprietaryDefaultsSingleton_setObject_forWildcardKey___block_invoke;
  v10[3] = &unk_1E42177A0;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a3;
  v10[7] = &v11;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v10);
  v8 = (void *)v12[5];
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __66__AVCaptureProprietaryDefaultsSingleton_setObject_forWildcardKey___block_invoke_2;
  v9[3] = &unk_1E42177C8;
  v9[4] = self;
  v9[5] = a3;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

  _Block_object_dispose(&v11, 8);
}

id __66__AVCaptureProprietaryDefaultsSingleton_setObject_forWildcardKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t, id *);
  id v7;
  id result;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v5 >= 7uLL && (v6 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, id *))v5[15]) != 0)
    {
      LOBYTE(v2) = v6(v2, v3, v4, &v20) != 0;
      v7 = v20;
    }
    else
    {
      v7 = 0;
      LOBYTE(v2) = 1;
    }
  }
  else
  {
    v7 = 0;
  }
  result = v7;
  if ((v2 & 1) == 0)
  {
    v9 = v20;
    if (v20)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      result = (id)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (result)
      {
        v10 = result;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v9);
            v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12);
            v14 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", v13);
            v15 = v14;
            if (v14 && !objc_msgSend(v14, "count"))
              objc_msgSend(*(id *)(a1 + 32), "unobserveChangesForKey:", v13);
            else
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v15, v13);
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          result = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
          v10 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

uint64_t __66__AVCaptureProprietaryDefaultsSingleton_setObject_forWildcardKey___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:", a2, *(_QWORD *)(a1 + 40), a3, 0);
}

- (__CVBuffer)imageForKey:(id)a3 fillWidth:(int)a4 fillHeight:(int)a5
{
  __CVBuffer *v5;
  _QWORD v7[7];
  int v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__AVCaptureProprietaryDefaultsSingleton_imageForKey_fillWidth_fillHeight___block_invoke;
  v7[3] = &unk_1E42177F0;
  v7[4] = self;
  v7[5] = a3;
  v8 = a5;
  v9 = a4;
  v7[6] = &v10;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v7);
  v5 = (__CVBuffer *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void __74__AVCaptureProprietaryDefaultsSingleton_imageForKey_fillWidth_fillHeight___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  int v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  const void *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (!v2)
    goto LABEL_16;
  v19 = 0;
  v3 = objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v2, 256, 0, 0, &v19);
  if (v19)
    goto LABEL_16;
  if (!v3)
    goto LABEL_16;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithContentsOfURL:", v3);
  if (!v4)
    goto LABEL_16;
  v5 = v4;
  objc_msgSend(v4, "extent");
  v7 = v6;
  objc_msgSend(v5, "extent");
  v9 = v8;
  v10 = *(_DWORD *)(a1 + 56);
  v11 = *(_DWORD *)(a1 + 60);
  if ((double)v11 / v8 <= (double)v10 / v7)
    v12 = (double)v10 / v7;
  else
    v12 = (double)v11 / v8;
  if (v12 >= 1.0)
    goto LABEL_11;
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, v12, v12);
  v17 = v18;
  v13 = objc_msgSend(v5, "imageByApplyingTransform:", &v17);
  if (!v13)
  {
LABEL_16:
    FigDebugAssert3();
    return;
  }
  v5 = (void *)v13;
  v9 = v9 * v12;
  v7 = v7 * v12;
LABEL_11:
  v14 = *MEMORY[0x1E0CA8FF0];
  v20[0] = *MEMORY[0x1E0CA8FE8];
  v20[1] = v14;
  v21[0] = MEMORY[0x1E0C9AAB0];
  v21[1] = MEMORY[0x1E0C9AA70];
  v15 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)v9, (unint64_t)v7, 0x34323076u, v15, (CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)))
  {
    v16 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v16)
    {
      CFRelease(v16);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", MEMORY[0x1E0C9AA70]), "render:toCVPixelBuffer:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    CFAutorelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }
}

- (int)retryPriorFailedKeyObservationRegistrations
{
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD v11[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__AVCaptureProprietaryDefaultsSingleton_retryPriorFailedKeyObservationRegistrations__block_invoke;
  v11[3] = &unk_1E4217818;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = &v28;
  v11[7] = &v22;
  v11[8] = &v16;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v11);
  v3 = objc_msgSend((id)v29[5], "count");
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = objc_msgSend((id)v29[5], "objectAtIndexedSubscript:", i);
      v6 = objc_msgSend((id)v23[5], "objectAtIndexedSubscript:", i);
      v7 = objc_msgSend((id)v17[5], "objectAtIndexedSubscript:", i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = 0;
      else
        v8 = v7;
      -[AVCaptureProprietaryDefaultsSingleton _handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:](self, "_handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:", v6, v8, v5, 0);
    }
  }

  v9 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v9;
}

uint64_t __84__AVCaptureProprietaryDefaultsSingleton_retryPriorFailedKeyObservationRegistrations__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  if (result)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_registerWithServerToObserveKey:", v9);
        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          break;
        objc_msgSend(v3, "addObject:", v9);
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (result)
    {
      v10 = result;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v3);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", v13);
          v14 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", v13);
          if (v14)
          {
            v15 = v14;
            if (objc_msgSend(v14, "count"))
            {
              if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
              {
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              }
              v16 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
              if (!v16)
                v16 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v15);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v13);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v16);
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "unobserveChangesForKey:", v13);
            }
          }
          ++v12;
        }
        while (v10 != v12);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        v10 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)updateCameraOverrideHistory:(id)a3 withCameraInfo:(id)a4 setOverride:(BOOL)a5
{
  uint64_t v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[9];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__AVCaptureProprietaryDefaultsSingleton_updateCameraOverrideHistory_withCameraInfo_setOverride___block_invoke;
  v11[3] = &unk_1E4217890;
  v11[4] = self;
  v11[5] = a3;
  v12 = a5;
  v11[6] = a4;
  v11[7] = &v13;
  v11[8] = &v19;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v11);
  v7 = v20[5];
  if (v7)
  {
    if (dword_1ECFED6E0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v7 = v20[5];
    }
    -[AVCaptureProprietaryDefaultsSingleton _handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:](self, "_handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:", a3, v14[5], v7, 0, v9, v10);

  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

void __96__AVCaptureProprietaryDefaultsSingleton_updateCameraOverrideHistory_withCameraInfo_setOverride___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v1)
  {
    v14[0] = 0;
    v3 = getpid();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(unsigned __int8 *)(a1 + 72);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
    if (*(_QWORD *)v8 >= 3uLL)
    {
      if (*(_QWORD *)(v8 + 64))
      {
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, uint64_t))(v8 + 72))(v1, v3, v4, v5, v6, v14, v7 + 40)&& v14[0] != 0)
        {
          if (dword_1ECFED6E0)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32)+ 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40), v12, v13);
          v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (v11)
          {
            if (!objc_msgSend(v11, "count"))
            {
              objc_msgSend(*(id *)(a1 + 32), "unobserveChangesForKey:", *(_QWORD *)(a1 + 40));

              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = 0;
            }
          }
        }
      }
    }
  }
}

+ (void)updateProprietaryDefaultsSource
{
  objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton"), "_updateProprietaryDefaultsSource:", 1);
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04AF8]))
  {
    v6 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04E28]);
    v7 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04E30]);
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8)
      FigDebugAssert3();
    else
      -[AVCaptureProprietaryDefaultsSingleton _handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:](self, "_handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:", v6, v7, 0, 1);
  }
}

- (void)unobserveChangesForKey:(id)a3
{
  OpaqueFigCaptureSource *proprietaryDefaultsSource;
  _QWORD *v5;
  void (*v6)(OpaqueFigCaptureSource *, id);

  proprietaryDefaultsSource = self->_proprietaryDefaultsSource;
  if (proprietaryDefaultsSource)
  {
    v5 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v5 >= 2uLL)
    {
      v6 = (void (*)(OpaqueFigCaptureSource *, id))v5[7];
      if (v6)
        v6(proprietaryDefaultsSource, a3);
    }
  }
}

- (void)_handleDefaultChangedNotificationForKey:(id)a3 newValue:(id)a4 handlersForKeyObservers:(id)a5 callHandlersAsync:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  NSObject *proprietaryDefaultChangeNotificationCallbackQueue;
  void *context;
  _QWORD block[8];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A1AF16C4](self, a2);
  if (a5)
    goto LABEL_3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__4;
  v29 = __Block_byref_object_dispose__4;
  v30 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __132__AVCaptureProprietaryDefaultsSingleton__handleDefaultChangedNotificationForKey_newValue_handlersForKeyObservers_callHandlersAsync___block_invoke;
  v24[3] = &unk_1E42178E0;
  v24[5] = a3;
  v24[6] = &v25;
  v24[4] = self;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v24, context);
  a5 = (id)v26[5];
  _Block_object_dispose(&v25, 8);
  if (a5)
  {
LABEL_3:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      a4 = 0;
    v10 = (void *)objc_msgSend((id)objc_msgSend(a5, "keyEnumerator", context), "allObjects");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = objc_msgSend(a5, "objectForKey:", v14);
          if (v15)
          {
            if (v6)
            {
              proprietaryDefaultChangeNotificationCallbackQueue = self->_proprietaryDefaultChangeNotificationCallbackQueue;
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __132__AVCaptureProprietaryDefaultsSingleton__handleDefaultChangedNotificationForKey_newValue_handlersForKeyObservers_callHandlersAsync___block_invoke_2;
              block[3] = &unk_1E4217908;
              block[4] = v14;
              block[5] = a3;
              block[6] = a4;
              block[7] = v15;
              dispatch_async(proprietaryDefaultChangeNotificationCallbackQueue, block);
            }
            else
            {
              (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, a3, a4);
            }
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
      }
      while (v11);
    }
  }
  objc_autoreleasePoolPop(context);
}

void __132__AVCaptureProprietaryDefaultsSingleton__handleDefaultChangedNotificationForKey_newValue_handlersForKeyObservers_callHandlersAsync___block_invoke(uint64_t a1)
{
  void *v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    if (!objc_msgSend(v2, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "unobserveChangesForKey:", *(_QWORD *)(a1 + 40));

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = 0;
    }
  }
}

void __132__AVCaptureProprietaryDefaultsSingleton__handleDefaultChangedNotificationForKey_newValue_handlersForKeyObservers_callHandlersAsync___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

@end
