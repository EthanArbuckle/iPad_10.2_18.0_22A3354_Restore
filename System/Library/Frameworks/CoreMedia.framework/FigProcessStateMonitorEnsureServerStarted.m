@implementation FigProcessStateMonitorEnsureServerStarted

void __FigProcessStateMonitorEnsureServerStarted_block_invoke()
{
  unsigned int v0;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v2;
  const __CFAllocator *Default;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v5;
  uint64_t v6;
  unsigned int v7;
  char *v8;
  os_log_type_t type;
  int v10;
  _OWORD v11[3];
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11[0] = xmmword_1E28D8448;
  v11[1] = *(_OWORD *)&off_1E28D8458;
  v11[2] = xmmword_1E28D8468;
  v0 = FigNote_AllowInternalDefaultLogs() != 0;
  fig_note_initialize_category_with_default_work_cf((uint64_t)&gFigProcessStateMonitorServerTrace[1], CFSTR("figprocessstatemonitor_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", v0, 0, gFigProcessStateMonitorServerTrace);
  fig_note_initialize_category_with_default_work_cf((uint64_t)&dword_1EE141E28, CFSTR("figprocessstatemonitor_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", 1u, 0, &qword_1EE141E20);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v2 = Mutable;
    FigProcessStateMonitorEnsureServerStarted_sStateMonitorServerStartResult = FigXPCServerStartWithNewXPCEndpoint((uint64_t)"ProcessStateMonitorServer", (uint64_t)v11, (uint64_t)Mutable, &gFigProcessMonitorServer);
    if (!FigProcessStateMonitorEnsureServerStarted_sStateMonitorServerStartResult)
    {
      Default = CFAllocatorGetDefault();
      FigProcessStateMonitorEnsureServerStarted_sStateMonitorServerStartResult = FigCFWeakReferenceTableCreate(Default, 1, &gServedObjects);
    }
    CFRelease(v2);
  }
  else
  {
    FigProcessStateMonitorEnsureServerStarted_sStateMonitorServerStartResult = FigSignalErrorAt(4294947865, 0, 0, 0, 0, 0, 0);
  }
  if (dword_1EE141E28)
  {
    v10 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E20, 1, &v10, &type);
    v5 = v10;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v7 = v5;
    else
      v7 = v5 & 0xFFFFFFFE;
    if (v7)
    {
      v12 = 136315394;
      v13 = "FigProcessStateMonitorEnsureServerStarted_block_invoke";
      v14 = 1024;
      v15 = FigProcessStateMonitorEnsureServerStarted_sStateMonitorServerStartResult;
      v8 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v5) = v10;
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E20, 1u, 1, v8, v8 != &v16, v5, 0, v6);
  }
}

@end
