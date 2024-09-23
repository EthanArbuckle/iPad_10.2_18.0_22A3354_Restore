@implementation AVResourceReclamationController

AVResourceReclamationController *__52__AVResourceReclamationController_defaultController__block_invoke()
{
  AVResourceReclamationController *result;

  result = objc_alloc_init(AVResourceReclamationController);
  defaultController_sController = (uint64_t)result;
  return result;
}

- (AVResourceReclamationController)init
{
  AVResourceReclamationController *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  objc_super v8;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  v8.receiver = self;
  v8.super_class = (Class)AVResourceReclamationController;
  v3 = -[AVResourceReclamationController self](&v8, sel_self);
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create("AVResourceReclamationControllerSQ", v4);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("AVResourceReclamationControllerCBQ", v5);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->_figSetterQueue = (OS_dispatch_queue *)dispatch_queue_create("AVResourceReclamationControlleFSQ", v6);
    v3->_resourceReclamationObservers = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3->_assertionReasons = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3->_assertionId = 0;
    v3->_isEnrolled = 0;
  }
  return v3;
}

+ (id)defaultController
{
  if (defaultController_sCreateControllerOnce != -1)
    dispatch_once(&defaultController_sCreateControllerOnce, &__block_literal_global_15);
  return (id)defaultController_sController;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_stateQueue);
  dispatch_release((dispatch_object_t)self->_figSetterQueue);
  dispatch_release((dispatch_object_t)self->_callbackQueue);

  if (self->_notificationToken)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_notificationToken);
  v3.receiver = self;
  v3.super_class = (Class)AVResourceReclamationController;
  -[AVResourceReclamationController dealloc](&v3, sel_dealloc);
}

- (void)_resetEnrollmentTestOnly
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVResourceReclamationController__resetEnrollmentTestOnly__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __59__AVResourceReclamationController__resetEnrollmentTestOnly__block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  }
  return result;
}

- (void)handlePurgedNotification:(id)a3
{
  void *v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVResourceReclamationEvent *v8;
  NSObject *stateQueue;
  _QWORD block[6];
  os_log_type_t type;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__18;
  v17 = __Block_byref_object_dispose__18;
  v18 = 0;
  v18 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_msgSend(a3, "userInfo");
  v6 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CA5488]);
  if (v6)
  {
    if (dword_1ECDECE58)
    {
      v12 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v8 = -[AVResourceReclamationEvent initWithEventIdentifier:]([AVResourceReclamationEvent alloc], "initWithEventIdentifier:", v6);
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__AVResourceReclamationController_AVResourceReclamation__handlePurgedNotification___block_invoke;
    block[3] = &unk_1E302FDB0;
    block[4] = self;
    block[5] = &v13;
    dispatch_sync(stateQueue, block);
    -[AVResourceReclamationController informReclamationEvent:toObservers:](self, "informReclamationEvent:toObservers:", v8, v14[5]);
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __83__AVResourceReclamationController_AVResourceReclamation__handlePurgedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectEnumerator", 0), "allObjects");
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if (*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:");
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)registerForPurgeNotification
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = *MEMORY[0x1E0CA5498];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__AVResourceReclamationController_AVResourceReclamation__registerForPurgeNotification__block_invoke;
  v6[3] = &unk_1E302FA38;
  objc_copyWeak(&v7, &location);
  v4 = (void *)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v3, 0, 0, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

uint64_t __86__AVResourceReclamationController_AVResourceReclamation__registerForPurgeNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
    return objc_msgSend(Weak, "handlePurgedNotification:", a2);
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  return fig_log_call_emit_and_clean_up_after_send_and_compose();
}

- (void)permitReclamationWhileSuspended
{
  NSObject *figSetterQueue;
  uint64_t v4;
  NSObject *stateQueue;
  id v6;
  NSObject *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD block[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (!-[AVResourceReclamationController isEnrolled](self, "isEnrolled"))
  {
    figSetterQueue = self->_figSetterQueue;
    v4 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke;
    block[3] = &unk_1E3031C38;
    block[4] = &v15;
    dispatch_sync(figSetterQueue, block);
    if (!*((_DWORD *)v16 + 6))
    {
      stateQueue = self->_stateQueue;
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke_2;
      v9[3] = &unk_1E302FD60;
      v9[4] = self;
      v9[5] = &v11;
      dispatch_sync(stateQueue, v9);
      if (*((_BYTE *)v12 + 24))
      {
        v6 = -[AVResourceReclamationController registerForPurgeNotification](self, "registerForPurgeNotification");
        v7 = self->_stateQueue;
        v8[0] = v4;
        v8[1] = 3221225472;
        v8[2] = __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke_3;
        v8[3] = &unk_1E302FCE8;
        v8[4] = self;
        v8[5] = v6;
        dispatch_sync(v7, v8);
      }
    }
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

uint64_t __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigProcessStateMonitorEnrollEligibleConnectionsInPurge();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 56) ^ 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 56) = 1;
  return result;
}

uint64_t __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke_3(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 64) = *(_QWORD *)(result + 40);
  return result;
}

- (id)addReclamationEventObserver:(id)a3
{
  NSObject *stateQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__AVResourceReclamationController_AVResourceReclamation__addReclamationEventObserver___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(stateQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

AVResourceReclamationEventObserverToken *__86__AVResourceReclamationController_AVResourceReclamation__addReclamationEventObserver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  AVResourceReclamationEventObserverToken *result;

  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("T@%lld"), FigGetContinuousUpTimeNanoseconds());
  objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKey:", a1[5], v2);
  result = -[AVResourceReclamationEventObserverToken initWithDetails:]([AVResourceReclamationEventObserverToken alloc], "initWithDetails:", v2);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)_removeObserverToken:(id)a3
{
  NSObject *stateQueue;
  _QWORD v4[6];

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__AVResourceReclamationController_AVResourceReclamation___removeObserverToken___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(stateQueue, v4);
}

uint64_t __79__AVResourceReclamationController_AVResourceReclamation___removeObserverToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "details"));
}

- (void)informReclamationEvent:(id)a3 toObservers:(id)a4
{
  NSObject *callbackQueue;
  _QWORD block[7];

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__AVResourceReclamationController_AVResourceReclamation__informReclamationEvent_toObservers___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = a4;
  block[5] = self;
  block[6] = a3;
  dispatch_async(callbackQueue, block);
}

uint64_t __93__AVResourceReclamationController_AVResourceReclamation__informReclamationEvent_toObservers___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__AVResourceReclamationController_AVResourceReclamation__informReclamationEvent_toObservers___block_invoke_2;
  v3[3] = &unk_1E3032C18;
  v4 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __93__AVResourceReclamationController_AVResourceReclamation__informReclamationEvent_toObservers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "reclamationController:didReclaimObjectsWithEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)isEnrolled
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AVResourceReclamationController_AVResourceReclamation__isEnrolled__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__AVResourceReclamationController_AVResourceReclamation__isEnrolled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (AVResourceReclamationEvent)mostRecentReclamationEvent
{
  if (-[AVResourceReclamationController isEnrolled](self, "isEnrolled"))
    FigProcessStateMonitorGetServerPurgeState();
  return (AVResourceReclamationEvent *)0;
}

- (BOOL)ensureIntegrityOfResourcesCreatedSince:(id)a3
{
  AVResourceReclamationEvent *v4;
  unint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = -[AVResourceReclamationController mostRecentReclamationEvent](self, "mostRecentReclamationEvent");
  if (!v4)
  {
    v5 = 0;
    if (a3)
      goto LABEL_3;
    return v5 == 0;
  }
  v5 = objc_msgSend(-[AVResourceReclamationEvent eventIdentifier](v4, "eventIdentifier"), "unsignedLongLongValue");
  if (!a3)
    return v5 == 0;
LABEL_3:
  if (dword_1ECDECE58)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v5 <= objc_msgSend((id)objc_msgSend(a3, "eventIdentifier", v8, v9), "unsignedLongLongValue");
}

- (void)ensureIntegrityOfResourcesCreatedSince:(id)a3 completionHandler:(id)a4
{
  NSObject *callbackQueue;
  _QWORD block[7];

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__AVResourceReclamationController_AVResourceReclamation__ensureIntegrityOfResourcesCreatedSince_completionHandler___block_invoke;
  block[3] = &unk_1E3031B30;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __115__AVResourceReclamationController_AVResourceReclamation__ensureIntegrityOfResourcesCreatedSince_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "ensureIntegrityOfResourcesCreatedSince:", *(_QWORD *)(a1 + 40)));
}

- (void)_releaseResourceReclamationAssertion:(id)a3
{
  NSObject *stateQueue;
  uint64_t v6;
  NSObject *figSetterQueue;
  _QWORD v8[5];
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__18;
  v14 = __Block_byref_object_dispose__18;
  v15 = 0;
  if (-[AVResourceReclamationController isEnrolled](self, "isEnrolled"))
  {
    stateQueue = self->_stateQueue;
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__AVResourceReclamationController_AVResourceReclamation___releaseResourceReclamationAssertion___block_invoke;
    block[3] = &unk_1E3030FB8;
    block[5] = a3;
    block[6] = &v10;
    block[4] = self;
    dispatch_sync(stateQueue, block);
    if (v11[5])
    {
      figSetterQueue = self->_figSetterQueue;
      v8[0] = v6;
      v8[1] = 3221225472;
      v8[2] = __95__AVResourceReclamationController_AVResourceReclamation___releaseResourceReclamationAssertion___block_invoke_2;
      v8[3] = &unk_1E3031C38;
      v8[4] = &v10;
      dispatch_sync(figSetterQueue, v8);
    }
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __95__AVResourceReclamationController_AVResourceReclamation___releaseResourceReclamationAssertion___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "valueForKey:", objc_msgSend(*(id *)(a1 + 40), "details"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "details"));
}

void __95__AVResourceReclamationController_AVResourceReclamation___releaseResourceReclamationAssertion___block_invoke_2(uint64_t a1)
{
  FigProcessStateMonitorMayPurgeClientObjects();

}

- (id)takeAssertionPreventingResourceReclamationWithReason:(id)a3
{
  NSObject *figSetterQueue;
  uint64_t v6;
  NSObject *stateQueue;
  AVResourceReclamationAssertion *v8;
  AVResourceReclamationAssertion *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVResourceReclamationAssertion *v11;
  _QWORD v13[7];
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
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
  v22 = __Block_byref_object_copy__18;
  v23 = __Block_byref_object_dispose__18;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (!-[AVResourceReclamationController isEnrolled](self, "isEnrolled"))
    goto LABEL_6;
  figSetterQueue = self->_figSetterQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__AVResourceReclamationController_AVResourceReclamation__takeAssertionPreventingResourceReclamationWithReason___block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = a3;
  block[5] = &v15;
  dispatch_sync(figSetterQueue, block);
  if (*((_DWORD *)v16 + 6))
  {
LABEL_6:
    v9 = 0;
  }
  else
  {
    stateQueue = self->_stateQueue;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __111__AVResourceReclamationController_AVResourceReclamation__takeAssertionPreventingResourceReclamationWithReason___block_invoke_2;
    v13[3] = &unk_1E3030FB8;
    v13[5] = a3;
    v13[6] = &v19;
    v13[4] = self;
    dispatch_sync(stateQueue, v13);
    v8 = [AVResourceReclamationAssertion alloc];
    v9 = -[AVResourceReclamationAssertion initWithDetails:](v8, "initWithDetails:", v20[5]);
    if (dword_1ECDECE58)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v11 = v9;
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t __111__AVResourceReclamationController_AVResourceReclamation__takeAssertionPreventingResourceReclamationWithReason___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigProcessStateMonitorMustNotPurgeClientObjects();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __111__AVResourceReclamationController_AVResourceReclamation__takeAssertionPreventingResourceReclamationWithReason___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a1[4];
  v4 = *(_QWORD *)(v3 + 48) + 1;
  *(_QWORD *)(v3 + 48) = v4;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend(v2, "stringWithFormat:", CFSTR("A%lld@%lld"), v4, FigGetContinuousUpTimeNanoseconds());
  return objc_msgSend(*(id *)(a1[4] + 40), "setValue:forKey:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

@end
