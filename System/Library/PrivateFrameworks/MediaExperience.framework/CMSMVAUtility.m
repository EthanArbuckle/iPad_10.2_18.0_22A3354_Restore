@implementation CMSMVAUtility

uint64_t __CMSMVAUtility_IsAdditiveRoutingEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v2;
  UInt32 ioDataSize;
  int outData;
  AudioObjectPropertyAddress inAddress;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"sddabolg";
  inAddress.mElement = 0;
  ioDataSize = 4;
  outData = 0;
  result = AudioObjectGetPropertyData(dword_1EE2B3C08, &inAddress, 0, 0, &ioDataSize, &outData);
  if ((_DWORD)result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    if (dword_1EE2B3F38)
    {
      v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
      result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMVAUtility_IsAdditiveRoutingEnabled_isAdditiveRoutingSupportedForHardware = outData == 1;
  }
  return result;
}

@end
