@implementation FigClusterSynchronizationManager

void __FigClusterSynchronizationManager_ClientIsPlaying_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v3;
  BOOL v4;

  if (figClusterSynchManager_shouldDisableOdeonStereoClockLink())
  {
    if (dword_1EE2A2EB8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    figClusterSynchManager_ensureStopped();
  }
  else
  {
    v3 = gIsPlaying;
    if (*(unsigned __int8 *)(a1 + 40) != gIsPlaying)
    {
      gIsPlaying = 1;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = figClusterSynchManager_ensureStarted();
      v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) || gClusterClock == 0;
      if (!v4 && *(unsigned __int8 *)(a1 + 40) != v3)
        CFSetApplyFunction((CFSetRef)gAddedIPs, (CFSetApplierFunction)figClusterSynchManager_AddPort, 0);
    }
  }
}

@end
