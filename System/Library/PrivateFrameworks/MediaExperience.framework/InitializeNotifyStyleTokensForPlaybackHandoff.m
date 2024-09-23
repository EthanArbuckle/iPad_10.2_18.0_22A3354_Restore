@implementation InitializeNotifyStyleTokensForPlaybackHandoff

uint64_t __cmsmUtility_InitializeNotifyStyleTokensForPlaybackHandoff_block_invoke()
{
  uint32_t v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  NSObject *v3;

  v0 = notify_register_check("com.apple.mediaexperience.fadeinappliedforplaybackhandoff", &gFadeInAppliedForPlaybackHandoffToken);
  gValidFadeInAppliedForPlaybackHandoffToken = v0 == 0;
  if (v0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = notify_register_check("com.apple.mediaexperience.fadeoutappliedforplaybackhandoff", &gFadeOutAppliedForPlaybackHandoffToken);
  gValidFadeOutAppliedForPlaybackHandoffToken = (_DWORD)result == 0;
  if ((_DWORD)result)
  {
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end
