@implementation RegisterForDeviceThermalLevelNotification

void __cmsmdevicestate_RegisterForDeviceThermalLevelNotification_block_invoke_2(int a1, int token)
{
  NSObject *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t state64[21];

  state64[20] = *MEMORY[0x1E0C80C00];
  state64[0] = 0;
  notify_get_state(token, state64);
  if (state64[0] < 0x28)
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDeviceState_DeactivateHardwareSafetySession(CFSTR("non-resumable.thermalLevelDisengaged"));
  }
  else
  {
    if (dword_1EE2B3F38)
    {
      v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDeviceState_InterruptAllActiveSessionsAndSystemSounds();
  }
}

uint64_t __cmsmdevicestate_RegisterForDeviceThermalLevelNotification_block_invoke()
{
  const char *v0;
  NSObject *global_queue;

  v0 = (const char *)*MEMORY[0x1E0C83A00];
  global_queue = dispatch_get_global_queue(0, 0);
  return notify_register_dispatch(v0, (int *)&cmsmdevicestate_RegisterForDeviceThermalLevelNotification_thermalPressureToken, global_queue, &__block_literal_global_122);
}

@end
