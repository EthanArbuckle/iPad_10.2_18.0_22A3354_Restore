@implementation CMIOExtensionFigCaptureStreamStart

intptr_t __CMIOExtensionFigCaptureStreamStart_block_invoke(uint64_t a1, void *a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (a2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(a2, "code");
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
