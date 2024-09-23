@implementation PrettyPrintContainerDescription

uint64_t __captureDeferredPhotoProcessor_PrettyPrintContainerDescription_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  if (dword_1ECFE9390)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWDeferredTransactionBroker openTransaction:pid:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance", v8, v10), "openTransaction:pid:", 2, *(unsigned int *)(a1[6] + 32));
  if ((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a1[7]))
  {
    v4 = -[BWDeferredProcessingContainerManager createProcessingContainerWithApplicationID:captureRequestIdentifier:openForPeeking:err:](+[BWDeferredProcessingContainerManager sharedInstance](BWDeferredProcessingContainerManager, "sharedInstance"), "createProcessingContainerWithApplicationID:captureRequestIdentifier:openForPeeking:err:", *(_QWORD *)(a1[6] + 24), a1[7], 1, &v12);
    v5 = v4;
    if (v12)
    {
      v11 = v1;
      LODWORD(v9) = v12;
      FigDebugAssert3();
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = (id)objc_msgSend(v4, "prettyDescription");
    }
  }
  else
  {
    v11 = v1;
    LODWORD(v9) = 0;
    FigDebugAssert3();
    v5 = 0;
  }

  if (dword_1ECFE9390)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return -[BWDeferredTransactionBroker closeTransaction:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance", v9, v11), "closeTransaction:", 2);
}

@end
