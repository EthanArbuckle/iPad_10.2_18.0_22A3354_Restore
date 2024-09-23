@implementation FigInstallVirtualDisplay

void __FigInstallVirtualDisplay_block_invoke()
{
  void *v0;
  uint64_t MaxCount;
  unint64_t v2;
  const __CFDictionary *ModelSpecificPropertyList;
  const __CFDictionary *v4;
  NSObject *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *value;
  _QWORD __dst[10];

  __dst[9] = *MEMORY[0x1E0C80C00];
  v0 = (void *)*MEMORY[0x1E0C9AE50];
  value = (void *)*MEMORY[0x1E0C9AE50];
  MaxCount = FigVirtualFramebufferGetMaxCount();
  if (MaxCount)
  {
    v2 = MaxCount;
    ModelSpecificPropertyList = (const __CFDictionary *)FigCreateModelSpecificPropertyList();
    v4 = ModelSpecificPropertyList;
    if (ModelSpecificPropertyList)
    {
      if (CFDictionaryGetValueIfPresent(ModelSpecificPropertyList, CFSTR("StartWirelessDisplayServer"), (const void **)&value))
      {
        if (value != v0)
        {
LABEL_13:
          CFRelease(v4);
          return;
        }
      }
      else
      {
        value = v0;
      }
    }
    memset(__dst, 0, 64);
    if (v2 >= 9)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (FigVirtualFramebufferGetFramebufs(__dst, 8uLL))
    {
      if (IOMobileFramebufferInstallVirtualDisplays())
      {
        v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    if (v4)
      goto LABEL_13;
  }
}

@end
