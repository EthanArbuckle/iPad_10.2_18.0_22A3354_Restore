@implementation CMSessionMgrSystemSoundUnduckMedia

void __CMSessionMgrSystemSoundUnduckMedia_block_invoke(uint64_t a1)
{
  unsigned int v1;
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __CFArray *v4;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x1940352BC](gCMSM);
  v4 = cmsmCopySessionsToUnduck(v1);
  MEMORY[0x1940352C8](gCMSM);
  if (v4)
  {
    cmsmUnduckSessions(v4, v1, (_BYTE *)(v2 + 24));
    CFRelease(v4);
  }
}

@end
