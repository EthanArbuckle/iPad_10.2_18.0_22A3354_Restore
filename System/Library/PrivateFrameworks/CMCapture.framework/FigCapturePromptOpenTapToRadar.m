@implementation FigCapturePromptOpenTapToRadar

void __FigCapturePromptOpenTapToRadar_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ModelSpecificName;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  CFOptionFlags responseFlags[21];

  responseFlags[20] = *MEMORY[0x1E0C80C00];
  responseFlags[0] = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 48), 0.0, responseFlags);
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (!responseFlags[0])
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 72);
    if (os_variant_has_internal_ui())
    {
      ModelSpecificName = FigCaptureGetModelSpecificName();
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@: %@"), ModelSpecificName, (id)MGCopyAnswer(), v3);
      v10 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v10, "setScheme:", CFSTR("tap-to-radar"));
      objc_msgSend(v10, "setHost:", CFSTR("new"));
      v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Title"), v9));
      objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Description"), v4));
      v12 = v6 - 1;
      if ((unint64_t)(v6 - 1) <= 2)
      {
        v13 = off_1E4928268[v12];
        v14 = off_1E4928280[v12];
        objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentName"), off_1E4928250[v12]));
        objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentVersion"), v13));
        objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentID"), v14));
      }
      if ((unint64_t)(v5 - 1) <= 9)
        objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Classification"), off_1E4928298[v5 - 1]));
      if ((unint64_t)(v7 - 1) <= 5)
        objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Reproducibility"), off_1E49282E8[v7 - 1]));
      objc_msgSend(v10, "setQueryItems:", v11);
      v15 = objc_msgSend(v10, "URL");
      if (v15)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "openURL:configuration:completionHandler:", v15, 0, &__block_literal_global_151);
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

@end
