@implementation CMSMSleep

void __CMSMSleep_ExtendPlaybackProcessAssertion_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = CMSMUtility_CopyMXCoreSessionWithID(*(_QWORD *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    if (objc_msgSend(v1, "extendBackgroundAppAssertionTimer"))
    {
      dispatch_source_cancel((dispatch_source_t)objc_msgSend(v2, "extendBackgroundAppAssertionTimer"));
      objc_msgSend(v2, "setExtendBackgroundAppAssertionTimer:", 0);
    }
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ((objc_msgSend(v2, "isPlaying", v4, v5) & 1) == 0)
      CMSMSleep_ReleasePlaybackProcessAssertion(v2);

  }
}

void __CMSMSleep_FetchTemporaryPlaybackProcessAssertion_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = CMSMUtility_CopyMXCoreSessionWithID(*(_QWORD *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (objc_msgSend(v2, "resumeBackgroundAppUpdaterTimer", v4, v5))
    {
      dispatch_source_cancel((dispatch_source_t)objc_msgSend(v2, "resumeBackgroundAppUpdaterTimer"));
      objc_msgSend(v2, "setResumeBackgroundAppUpdaterTimer:", 0);
    }
    MX_RunningBoardServices_InvalidateAssertion((void *)objc_msgSend(v2, "resumeAssertionRef"));
    objc_msgSend(v2, "setResumeAssertionRef:", 0);
    objc_msgSend(v2, "setIsTemporaryAssertionEnabled:", 0);

  }
}

@end
