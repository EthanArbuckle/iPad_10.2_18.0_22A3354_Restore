@implementation FigVirtualDisplaySourceConduitCreate

void __FigVirtualDisplaySourceConduitCreate_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 96))
  {
    srcconduit_submitPixelBuffer(v1, *(CVPixelBufferRef *)(v1 + 104), *(_QWORD *)(v1 + 120), *(unsigned int *)(v1 + 128), *(const void **)(v1 + 112));
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

@end
