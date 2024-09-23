@implementation CopyPreferredDeviceAddress

id __mxBluetoothServices_CopyPreferredDeviceAddress_block_invoke(uint64_t a1, void *a2)
{
  id result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "action"))
    goto LABEL_17;
  result = (id)objc_msgSend(a2, "action");
  if ((_DWORD)result == 4)
  {
    if (*(_BYTE *)(a1 + 60))
    {
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      result = (id)objc_msgSend(a2, "deviceAddress", v11, v13);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
      return result;
    }
    if (!dword_1EE2B3F38)
      return result;
    goto LABEL_17;
  }
  if (objc_msgSend(a2, "action") != 5)
  {
    if (objc_msgSend(a2, "action") == 3)
    {
      objc_msgSend(a2, "reason");
      if (FigCFStringFind())
      {
        if (*(_DWORD *)(a1 + 56) == 501)
        {
          if (dword_1EE2B3F38)
          {
            v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }
      }
    }
    if (objc_msgSend(a2, "action", v11, v13) == 6)
    {
      if (dword_1EE2B3F38)
      {
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    result = (id)objc_msgSend(a2, "deviceAddress", v12, v14);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (dword_1EE2B3F38)
      goto LABEL_28;
    return result;
  }
  if (!*(_QWORD *)(a1 + 48))
  {
LABEL_17:
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    return (id)fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  **(_QWORD **)(a1 + 48) = (id)objc_msgSend(a2, "wxInfo");
  if (dword_1EE2B3F38)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = (id)objc_msgSend(a2, "deviceAddress", v11, v13);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (dword_1EE2B3F38)
  {
LABEL_28:
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    return (id)fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end
