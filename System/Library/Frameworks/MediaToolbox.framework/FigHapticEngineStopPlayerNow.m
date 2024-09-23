@implementation FigHapticEngineStopPlayerNow

uint64_t __FigHapticEngineStopPlayerNow_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v5[23];

  v1 = result;
  v5[22] = *(id *)MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v2 = *(_QWORD *)(result + 40);
  v3 = *(_DWORD *)(v2 + 32);
  if (v3)
  {
    if (v3 == 2)
      return result;
    if (v3 == 1)
    {
      *(_DWORD *)(v2 + 32) = 2;
      result = objc_msgSend(*(id *)(v2 + 16), "stopWithCompletionHandler:", &__block_literal_global_15_4);
      if (dword_1EE2A3500)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        return fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return result;
    }
LABEL_9:
    result = FigSignalErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = result;
    return result;
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(result + 48) + 88), "stopAtTime:error:", v5, 0.0);
  if ((result & 1) == 0)
  {
    result = objc_msgSend(v5[0], "code");
    if (result != -4805)
    {
      objc_msgSend(v5[0], "code");
      goto LABEL_9;
    }
  }
  return result;
}

@end
