@implementation BWFigCaptureAttachedAccessoriesMonitor

- (BOOL)walletAccessoryConnected
{
  FigMemoryBarrier();
  return self->_walletAccessoryUUID != 0;
}

- (BOOL)batteryPackAccessoryConnected
{
  FigMemoryBarrier();
  return self->_batteryPackAccessoryUUID != 0;
}

+ (id)sharedAttachedAccessoriesMonitor
{
  if (sharedAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitorLockOnce != -1)
    dispatch_once(&sharedAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitorLockOnce, &__block_literal_global_107);
  return (id)sharedAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitor;
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

BWFigCaptureAttachedAccessoriesMonitor *__74__BWFigCaptureAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitor__block_invoke()
{
  BWFigCaptureAttachedAccessoriesMonitor *result;

  sharedAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitorLock = FigSimpleMutexCreate();
  result = objc_alloc_init(BWFigCaptureAttachedAccessoriesMonitor);
  sharedAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitor = (uint64_t)result;
  return result;
}

- (BWFigCaptureAttachedAccessoriesMonitor)init
{
  BWFigCaptureAttachedAccessoriesMonitor *v2;
  void *v3;
  objc_super v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v5.receiver = self;
  v5.super_class = (Class)BWFigCaptureAttachedAccessoriesMonitor;
  v2 = -[BWFigCaptureAttachedAccessoriesMonitor init](&v5, sel_init);
  if (v2)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3052000000;
    v10 = __Block_byref_object_copy__37;
    v11 = __Block_byref_object_dispose__37;
    v3 = (void *)getACCConnectionInfoClass_softClass;
    v12 = getACCConnectionInfoClass_softClass;
    if (!getACCConnectionInfoClass_softClass)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __getACCConnectionInfoClass_block_invoke;
      v6[3] = &unk_1E491EC40;
      v6[4] = &v7;
      __getACCConnectionInfoClass_block_invoke((uint64_t)v6);
      v3 = (void *)v8[5];
    }
    _Block_object_dispose(&v7, 8);
    v2->_connectionInfoProvider = (ACCConnectionInfo *)(id)objc_msgSend(v3, "sharedInstance");
    v2->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.sharedattachedaccessories.notification", 0);
    -[ACCConnectionInfo registerDelegate:](v2->_connectionInfoProvider, "registerDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACCConnectionInfo registerDelegate:](self->_connectionInfoProvider, "registerDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)BWFigCaptureAttachedAccessoriesMonitor;
  -[BWFigCaptureAttachedAccessoriesMonitor dealloc](&v3, sel_dealloc);
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 forConnection:(id)a6
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *notificationQueue;
  _QWORD block[7];
  int v14;
  int v15;
  os_log_type_t type;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE93F0)
  {
    v17 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__BWFigCaptureAttachedAccessoriesMonitor_accessoryEndpointAttached_transportType_protocol_forConnection___block_invoke;
  block[3] = &unk_1E4922AA0;
  v14 = a4;
  v15 = a5;
  block[4] = self;
  block[5] = a3;
  block[6] = a6;
  dispatch_sync(notificationQueue, block);
}

uint64_t __105__BWFigCaptureAttachedAccessoriesMonitor_accessoryEndpointAttached_transportType_protocol_forConnection___block_invoke(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  BOOL v3;
  int v4;
  void *v6;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(result + 56) != 13)
    return result;
  v1 = result;
  v2 = *(_DWORD *)(result + 60);
  v3 = v2 > 0xE;
  v4 = (1 << v2) & 0x4402;
  if (v3 || v4 == 0)
    return result;
  v6 = *(void **)(*(_QWORD *)(result + 32) + 8);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v7 = (_QWORD *)getkACCProperties_Endpoint_NFC_TypeSymbolLoc_ptr;
  v18 = getkACCProperties_Endpoint_NFC_TypeSymbolLoc_ptr;
  if (!getkACCProperties_Endpoint_NFC_TypeSymbolLoc_ptr)
  {
    v8 = (void *)CoreAccessoriesLibrary();
    v7 = dlsym(v8, "kACCProperties_Endpoint_NFC_Type");
    v16[3] = (uint64_t)v7;
    getkACCProperties_Endpoint_NFC_TypeSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v15, 8);
  if (!v7)
    __105__BWFigCaptureAttachedAccessoriesMonitor_accessoryEndpointAttached_transportType_protocol_forConnection___block_invoke_cold_1();
  result = objc_msgSend((id)objc_msgSend(v6, "accessoryPropertySync:forEndpoint:connection:", *v7, *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48)), "intValue");
  if ((result - 87) > 1)
  {
    if ((_DWORD)result != 66)
      return result;
    if (*(_QWORD *)(*(_QWORD *)(v1 + 32) + 32))
    {
      if (dword_1ECFE93F0)
        goto LABEL_12;
      return result;
    }
    if (dword_1ECFE93F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v12 = 32;
LABEL_23:
    *(_QWORD *)(*(_QWORD *)(v1 + 32) + v12) = *(id *)(v1 + 48);
    v13 = CFSTR("NewPropertyValue");
    v14 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    CMNotificationCenterGetDefaultLocalCenter();
    return CMNotificationCenterPostNotification();
  }
  if (!*(_QWORD *)(*(_QWORD *)(v1 + 32) + 24))
  {
    if (dword_1ECFE93F0)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v12 = 24;
    goto LABEL_23;
  }
  if (dword_1ECFE93F0)
  {
LABEL_12:
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)accessoryConnectionDetached:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *notificationQueue;
  _QWORD block[6];
  os_log_type_t type;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE93F0)
  {
    v9 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__BWFigCaptureAttachedAccessoriesMonitor_accessoryConnectionDetached___block_invoke;
  block[3] = &unk_1E491E748;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(notificationQueue, block);
}

uint64_t __70__BWFigCaptureAttachedAccessoriesMonitor_accessoryConnectionDetached___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  _QWORD v7[21];

  v7[20] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24)))
  {
    if (dword_1ECFE93F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = 24;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
    if (!(_DWORD)result)
      return result;
    if (dword_1ECFE93F0)
    {
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = 32;
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + v5) = 0;
  v6 = CFSTR("NewPropertyValue");
  v7[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

void __105__BWFigCaptureAttachedAccessoriesMonitor_accessoryEndpointAttached_transportType_protocol_forConnection___block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkACCProperties_Endpoint_NFC_Type(void)"), CFSTR("BWFigCaptureAttachedAccessoriesMonitor.m"), 31, CFSTR("%s"), dlerror());
  __break(1u);
}

@end
