@implementation MXBluetoothServices

void __MXBluetoothServices_RegisterForAudioRoutingChanged_block_invoke()
{
  void *v0;

  v0 = (void *)MEMORY[0x194035B20]();
  mxBluetoothServices_handleAudioRoutingChanged();
  objc_autoreleasePoolPop(v0);
}

void __MXBluetoothServices_RegisterForPreemptivePortChanged_block_invoke()
{
  FigPredictedRouting_UpdatePredictedRoute(3);
}

void __MXBluetoothServices_RegisterForPreemptivePortDisconnected_block_invoke()
{
  FigPredictedRouting_UpdatePredictedRoute(4);
}

void __MXBluetoothServices_QueryAudioRoutingActionForNewWirelessPort_block_invoke(_QWORD *a1, void *a2)
{
  __CFString *Mutable;
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (objc_msgSend(a2, "action") == 1)
  {
    CFStringAppend(Mutable, CFSTR("managed, route"));
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    v5 = *(_QWORD *)(a1[5] + 8);
LABEL_7:
    *(_BYTE *)(v5 + 24) = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(a2, "action") == 3
    || objc_msgSend(a2, "action") == 4
    || objc_msgSend(a2, "action") == 6)
  {
    CFStringAppend(Mutable, CFSTR("managed, don't route "));
    v5 = *(_QWORD *)(a1[4] + 8);
    goto LABEL_7;
  }
  if (objc_msgSend(a2, "action") == 2)
  {
    CFStringAppend(Mutable, CFSTR("unmanaged "));
  }
  else if (!objc_msgSend(a2, "action"))
  {
    CFStringAppend(Mutable, CFSTR("invalid(possibly because of timeout) "));
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
LABEL_8:
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (Mutable)
    CFRelease(Mutable);
}

uint64_t __MXBluetoothServices_IsPortBTManaged_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  NSObject *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = objc_msgSend(a2, "action");
  if ((_DWORD)result == 1
    || (result = objc_msgSend(a2, "action"), (_DWORD)result == 3)
    || (result = objc_msgSend(a2, "action"), (_DWORD)result == 4)
    || (result = objc_msgSend(a2, "action"), (_DWORD)result == 6))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    result = objc_msgSend(a2, "action");
    if (!(_DWORD)result)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      result = fig_log_call_emit_and_clean_up_after_send_and_compose();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  if (dword_1EE2B3F38)
  {
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end
