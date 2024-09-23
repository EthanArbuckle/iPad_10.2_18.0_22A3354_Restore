@implementation FigHapticEngineCreate

uint64_t __FigHapticEngineCreate_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;

  if (dword_1EE2A3500)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end
