@implementation FigBufferedAirPlayGlobalRoutingRegistryRemoteGetShared

void __FigBufferedAirPlayGlobalRoutingRegistryRemoteGetShared_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  __CFDictionary *Mutable;
  NSObject *v6;
  _QWORD *DerivedStorage;
  dispatch_queue_t v8;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  FigBufferedAirPlayGlobalRoutingRegistryGetClassID();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CMDerivedObjectCreate();
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return;
  }
  v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  Mutable = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("FigBufferedAirPlayGlobalRoutingRegistryServerDied"));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
  if (Mutable)
    CFRelease(Mutable);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_9:
    FigBufferedAirPlayGlobalRoutingRegistryRemoteGetShared_sGlobalRoutingRegistry = 0;
    return;
  }
  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  *DerivedStorage = FigBufferedAirPlayGlobalRoutingRegistryRemoteGetShared_xpcClient;
  DerivedStorage[1] = FigBufferedAirPlayClientRoutingRegistryGetSharedInstance();
  v8 = dispatch_queue_create("com.apple.coremedia.globalroutingregistryremote.notification", 0);
  DerivedStorage[2] = v8;
  if (v8)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    goto LABEL_9;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -17721;
}

@end
