@implementation FigVirtualFramebufferServerLivesInMediaProcess

uint64_t __FigVirtualFramebufferServerLivesInMediaProcess_block_invoke()
{
  int v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v0 = FVDUtilsSessionServerEnabled();
  if (v0)
    LOBYTE(v0) = FigVirtualDisplayPrefsGetBooleanWithDefault(CFSTR("fvfbserver_in_media_process"), FigVirtualFramebufferServerLivesInMediaProcess_result);
  FigVirtualFramebufferServerLivesInMediaProcess_result = v0;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  return fig_log_call_emit_and_clean_up_after_send_and_compose();
}

@end
