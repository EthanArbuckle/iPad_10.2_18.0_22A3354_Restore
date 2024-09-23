@implementation Prewarm

uint64_t __captureDeferredPhotoProcessor_Prewarm_block_invoke(_QWORD *a1)
{
  NSObject *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1[6] + 64);
  if (v2)
  {
    if (dword_1ECFE9390)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v2 = *(NSObject **)(a1[6] + 64);
    }
    dispatch_source_cancel(v2);

    *(_QWORD *)(a1[6] + 64) = 0;
  }
  if (dword_1ECFE9390)
  {
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWDeferredTransactionBroker openTransaction:pid:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance", v6, v7), "openTransaction:pid:", 1, *(unsigned int *)(a1[6] + 32));
  return objc_msgSend(+[FigCaptureDeferredProcessingEngine sharedProcessingEngine](FigCaptureDeferredProcessingEngine, "sharedProcessingEngine"), "ensureGraphForSettings:processingSettings:applicationID:", a1[4], a1[5], *(_QWORD *)(a1[6] + 24));
}

@end
