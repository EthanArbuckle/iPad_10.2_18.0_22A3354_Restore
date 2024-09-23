@implementation CMSessionMgrShouldHijackAudioRoute

uint64_t __CMSessionMgrShouldHijackAudioRoute_block_invoke(uint64_t a1)
{
  OpaqueFigEndpoint *v2;
  OpaqueFigEndpoint *v3;
  uint64_t CMBaseObject;
  void (*v5)(uint64_t, __CFString *, _QWORD, CFNumberRef *);
  uint64_t result;
  unsigned int v7;
  BOOL v8;
  char v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v13;
  unsigned int valuePtr;
  CFNumberRef number[17];

  number[16] = *(CFNumberRef *)MEMORY[0x1E0C80C00];
  v2 = FigRoutingManagerCopyEndpointWithDeviceID(*(_QWORD *)(a1 + 32), 1, *MEMORY[0x1E0CA3A80], 0);
  valuePtr = 0;
  if (!v2)
    goto LABEL_21;
  v3 = v2;
  number[0] = 0;
  CMBaseObject = FigEndpointGetCMBaseObject();
  v5 = *(void (**)(uint64_t, __CFString *, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v5)
  {
    v5(CMBaseObject, CFSTR("VAE_PortID"), *MEMORY[0x1E0C9AE00], number);
    if (number[0])
    {
      CFNumberGetValue(number[0], kCFNumberIntType, &valuePtr);
      if (number[0])
      {
        CFRelease(number[0]);
        number[0] = 0;
      }
    }
  }
  CFRelease(v3);
  if (!valuePtr || !MXBluetoothServices_IsPortBTManaged(valuePtr, 1))
  {
LABEL_21:
    **(_BYTE **)(a1 + 40) = 0;
    **(_QWORD **)(a1 + 48) = 0x1E30A8EA8;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = CMSM_GetHighestPriorityOfLocalSessionPlayingToDevice(*(_QWORD *)(a1 + 32));
  v7 = *(_DWORD *)(a1 + 56);
  if (v7 < result)
    goto LABEL_24;
  v8 = (_DWORD)result == 501 && v7 == 501;
  v9 = !v8;
  if (v8)
    v10 = CFSTR("AmbiguousPriority");
  else
    v10 = 0;
  result = CMSMVAUtility_IsBluetoothSharingSessionEnabled(0);
  if ((_DWORD)result)
  {
    if (dword_1EE2B3F38)
    {
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
LABEL_24:
    v9 = 0;
    v10 = CFSTR("LowerPriority");
  }
  **(_BYTE **)(a1 + 40) = v9;
  **(_QWORD **)(a1 + 48) = v10;
  if (dword_1EE2B3F38)
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end
