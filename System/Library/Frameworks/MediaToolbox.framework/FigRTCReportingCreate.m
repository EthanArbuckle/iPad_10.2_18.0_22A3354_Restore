@implementation FigRTCReportingCreate

uint64_t __FigRTCReportingCreate_block_invoke_3(uint64_t a1)
{
  uint64_t result;
  BOOL v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = FigIsItOKToLogURLs();
  if ((_DWORD)result)
  {
    if (*(_BYTE *)(a1 + 32))
      v3 = dword_1EE2A3020 == 0;
    else
      v3 = 1;
    if (!v3)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

@end
