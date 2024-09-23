@implementation EnsureDataChannelConfigurationIsValid

void __videoReceiver_EnsureDataChannelConfigurationIsValid_block_invoke(uint64_t a1)
{
  CFIndex ChannelCount;
  CFIndex v3;
  CFIndex v4;
  int OutputQueueTypeAtIndex;
  uint64_t DerivedStorage;
  const void *UInt64;
  int v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  int v11;

  ChannelCount = FigDataChannelConfigurationGetChannelCount(*(_QWORD *)(a1 + 40));
  if (ChannelCount < 1)
    return;
  v3 = ChannelCount;
  v4 = 0;
  while (1)
  {
    OutputQueueTypeAtIndex = FigDataChannelConfigurationGetOutputQueueTypeAtIndex(*(_QWORD *)(a1 + 40), v4);
    if (OutputQueueTypeAtIndex == 2)
      break;
    if (OutputQueueTypeAtIndex == 1)
    {
      FigDataChannelConfigurationGetCAImageQueueIDAtIndex(*(_QWORD *)(a1 + 40), v4);
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      UInt64 = (const void *)FigCFNumberCreateUInt64();
      v8 = CFDictionaryContainsKey(*(CFDictionaryRef *)(DerivedStorage + 16), UInt64);
      if (UInt64)
        CFRelease(UInt64);
      if (!v8)
      {
        if (dword_1EE2A2D38 >= 2)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v11 = -15574;
        goto LABEL_18;
      }
    }
LABEL_10:
    if (v3 == ++v4)
      return;
  }
  if (FigDataChannelConfigurationGetFigDataQueueAtIndex(*(_QWORD *)(a1 + 40), v4))
    goto LABEL_10;
  if (dword_1EE2A2D38 >= 2)
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v11 = -15578;
LABEL_18:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11;
}

@end
