@implementation CMSystemSoundMgr

void __CMSystemSoundMgr_Initialize_block_invoke()
{
  NSObject *v0;

  v0 = MXGetSerialQueue();
  MXDispatchAsyncAndWait((uint64_t)"CMSystemSoundMgr_Initialize_block_invoke", (uint64_t)"CMSessionManager_SystemSounds.m", 323, 0, 0, v0, (uint64_t)&__block_literal_global_3_4);
}

uint64_t __CMSystemSoundMgr_Initialize_block_invoke_2()
{
  _QWORD *v0;
  int v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  MEMORY[0x1940352BC](gCMSS_12);
  v0 = (_QWORD *)gCMSS_0;
  if (gCMSS_0)
  {
    v1 = dword_1EE2B3F38;
    do
    {
      if (v1)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v1 = dword_1EE2B3F38;
      }
      v0 = (_QWORD *)*v0;
    }
    while (v0);
  }
  return MEMORY[0x1940352C8](gCMSS_12);
}

@end
