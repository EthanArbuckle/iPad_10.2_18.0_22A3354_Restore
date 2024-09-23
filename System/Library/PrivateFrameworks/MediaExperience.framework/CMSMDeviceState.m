@implementation CMSMDeviceState

void __CMSMDeviceState_UpdateDeviceConfiguration_block_invoke()
{
  void *v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v2;
  NSObject *v3;
  const void *v4;
  NSObject *v5;
  NSObject *v6;

  v0 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "infoDictionary"), "objectForKey:", CFSTR("CFBundleIdentifier"));
  gDeviceState = 0;
  if (objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.mediaserverd")))
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    LOBYTE(gDeviceState) = 1;
  }
  else if (objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.audiomxd")))
  {
    if (dword_1EE2B3F38)
    {
      v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    HIBYTE(gDeviceState) = 1;
  }
  else
  {
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = (const void *)MGCopyAnswer();
  if (FigCFEqual())
  {
    byte_1EE2B29C4 = 1;
  }
  else if (FigCFEqual())
  {
    byte_1EE2B29C3 = 1;
  }
  else if (FigCFEqual())
  {
    byte_1EE2B29C5 = 1;
  }
  else if (FigCFEqual())
  {
    byte_1EE2B29C6 = 1;
  }
  else if (FigCFEqual())
  {
    byte_1EE2B29C7 = 1;
  }
  if (MGGetProductType() == 4231109337)
  {
    if (dword_1EE2B3F38)
    {
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    byte_1EE2B29CA = 1;
  }
  if (MGGetProductType() == 1908832379)
  {
    if (dword_1EE2B3F38)
    {
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    byte_1EE2B29CA = 1;
  }
  if (v4)
    CFRelease(v4);
}

uint64_t __CMSMDeviceState_SupportsBeacon_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = MGGetBoolAnswer();
  CMSMDeviceState_SupportsBeacon_supportsBeaconMode = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

void __CMSMDeviceState_CopyHardwareSafetySession_block_invoke()
{
  BOOL v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD *v2;
  uint64_t v3;
  double v4;

  if (CMSessionCreate(&qword_1EE2B2A68))
    v0 = 1;
  else
    v0 = qword_1EE2B2A68 == 0;
  if (v0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (qword_1EE2B2A68)
    {
      CFRelease((CFTypeRef)qword_1EE2B2A68);
      qword_1EE2B2A68 = 0;
    }
  }
  else
  {
    _CMSessionSetProperty((_QWORD *)qword_1EE2B2A68, CFSTR("ClientName"), (uint64_t)CFSTR("HardwareSafetySession"));
    v2 = (_QWORD *)qword_1EE2B2A68;
    v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
    _CMSessionSetProperty(v2, CFSTR("ClientPID"), v3);
    _CMSessionSetProperty((_QWORD *)qword_1EE2B2A68, CFSTR("AudioHardwareControlFlags"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0));
    _CMSessionSetProperty((_QWORD *)qword_1EE2B2A68, CFSTR("IAmHardwareSafetySession"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));
    _CMSessionSetProperty((_QWORD *)qword_1EE2B2A68, CFSTR("DoesntActuallyPlayAudio"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));
    _CMSessionSetProperty((_QWORD *)qword_1EE2B2A68, CFSTR("InterruptionStyle"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1));
    _CMSessionSetProperty((_QWORD *)qword_1EE2B2A68, CFSTR("ClientPriority"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 10));
    _CMSessionSetProperty((_QWORD *)qword_1EE2B2A68, CFSTR("PrefersSpeechDetectEnabled"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0));
    LODWORD(v4) = 1036831949;
    _CMSessionSetProperty((_QWORD *)qword_1EE2B2A68, CFSTR("InterruptionFadeDuration"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4));
  }
}

uint64_t __CMSMDeviceState_DeviceHasHardwareRingerSwitch_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = MGGetBoolAnswer();
  CMSMDeviceState_DeviceHasHardwareRingerSwitch_hasPhysicalSwitch = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

void __CMSMDeviceState_UpdateSmartCoverState_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSMUtility_UpdateSecureMicrophonePolicy(0);
}

uint64_t __CMSMDeviceState_IsHomePodHub_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __CMSMDeviceState_DeviceHasExclaveCapability_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = MGGetBoolAnswer();
  CMSMDeviceState_DeviceHasExclaveCapability_deviceHasExclaveCapability = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end
