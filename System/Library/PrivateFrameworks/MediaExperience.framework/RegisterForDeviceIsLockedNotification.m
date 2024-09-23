@implementation RegisterForDeviceIsLockedNotification

uint64_t __cmsmdevicestate_RegisterForDeviceIsLockedNotification_block_invoke()
{
  BOOL v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (sMKBGetLockStatus)
    v0 = sMKBGetLockStatus(0) != 0;
  else
    v0 = 0;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x1940352BC](qword_1EE2B2A60);
  byte_1EE2B29CC = v0;
  return MEMORY[0x1940352C8](qword_1EE2B2A60);
}

@end
