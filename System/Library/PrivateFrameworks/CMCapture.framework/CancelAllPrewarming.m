@implementation CancelAllPrewarming

void __captureDeferredPhotoProcessor_CancelAllPrewarming_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  NSObject *v7;
  _QWORD handler[5];
  os_log_type_t type;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 64))
  {
    if (dword_1ECFE9390)
    {
      v10 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v1 = *(_QWORD *)(a1 + 32);
    }
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v1 + 16));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = v4;
    v5 = dispatch_time(0, 6000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v6 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", *(_QWORD *)(a1 + 40));
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __captureDeferredPhotoProcessor_CancelAllPrewarming_block_invoke_141;
    handler[3] = &unk_1E491E720;
    handler[4] = v6;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 64));
  }
}

void __captureDeferredPhotoProcessor_CancelAllPrewarming_block_invoke_141(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  _BYTE *DerivedStorage;
  _BYTE *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "retainReferencedObject");
  DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    v4 = DerivedStorage;
    if (*DerivedStorage)
    {
      if (!_FigIsCurrentDispatchQueue())
      {
        v8 = v1;
        LODWORD(v6) = 0;
        FigDebugAssert3();
      }
      if (!*((_QWORD *)v4 + 6) || !*v4)
        objc_msgSend(+[FigCaptureDeferredProcessingEngine sharedProcessingEngine](FigCaptureDeferredProcessingEngine, "sharedProcessingEngine", v6, v8), "releaseResourcesForClientPID:", *((unsigned int *)v4 + 8));
      objc_msgSend(+[FigCaptureDeferredProcessingEngine sharedProcessingEngine](FigCaptureDeferredProcessingEngine, "sharedProcessingEngine", v6), "releasePrewarmingResources");

      *((_QWORD *)v4 + 8) = 0;
      if (dword_1ECFE9390)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[BWDeferredTransactionBroker closeTransaction:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance", v7, v8), "closeTransaction:", 1);
    }
  }
  if (v2)
    CFRelease(v2);
}

@end
