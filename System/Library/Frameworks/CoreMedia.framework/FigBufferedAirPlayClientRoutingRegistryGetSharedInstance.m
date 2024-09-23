@implementation FigBufferedAirPlayClientRoutingRegistryGetSharedInstance

void __FigBufferedAirPlayClientRoutingRegistryGetSharedInstance_block_invoke()
{
  unsigned int v0;
  _QWORD *Instance;
  _QWORD *v2;
  dispatch_queue_t v3;
  CFMutableDictionaryRef Mutable;
  pthread_mutex_t *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v7;
  uint64_t v8;
  unsigned int v9;
  _BYTE *v10;
  int v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  _BYTE *v16;
  os_log_type_t type;
  int v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v0 = FigNote_AllowInternalDefaultLogs() != 0;
  fig_note_initialize_category_with_default_work_cf((uint64_t)&gFigBufferedAirPlayClientRoutingRegistryTrace[1], CFSTR("routingRegistry_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", v0, 0, gFigBufferedAirPlayClientRoutingRegistryTrace);
  fig_note_initialize_category_with_default_work_cf((uint64_t)&dword_1EE141EA8, CFSTR("routingRegistry_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", 1u, 0, &qword_1EE141EA0);
  if (dword_1EE141EA8 == 256)
    dword_1EE141EA8 = 0;
  if (FigBufferedAirPlayClientRoutingRegistryGetTypeID_once != -1)
    dispatch_once(&FigBufferedAirPlayClientRoutingRegistryGetTypeID_once, &__block_literal_global_18);
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    v2 = Instance;
    Instance[2] = 0;
    Instance[3] = 0;
    Instance[4] = 0;
    v3 = dispatch_queue_create("com.apple.airplay.FigBufferedAirPlayClientRoutingRegistry.notification", 0);
    v2[2] = v3;
    if (v3)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v2[3] = Mutable;
      if (Mutable)
      {
        v5 = FigSimpleMutexCreate();
        v2[4] = v5;
        if (v5)
        {
          if (FigBufferedAirPlayClientRoutingRegistryCreate_onceToken != -1)
            dispatch_once(&FigBufferedAirPlayClientRoutingRegistryCreate_onceToken, &__block_literal_global_15);
          if (dword_1EE141EA8)
          {
            v18 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141EA0, 1, &v18, &type);
            v7 = v18;
            if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
              v9 = v7;
            else
              v9 = v7 & 0xFFFFFFFE;
            if (v9)
            {
              v19 = 136315138;
              v20 = "FigBufferedAirPlayClientRoutingRegistryCreate";
              v10 = (_BYTE *)_os_log_send_and_compose_impl();
              LOBYTE(v7) = v18;
            }
            else
            {
              v10 = 0;
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141EA0, 1u, 1, v10, v10 != v23, v7, 0, v8);
          }
          FigBufferedAirPlayClientRoutingRegistryGetSharedInstance_sFigBufferedAirPlayClientRoutingRegistry = (uint64_t)v2;
          return;
        }
      }
      v11 = -17721;
    }
    else
    {
      v11 = FigSignalErrorAt(4294949575, 0, 0, 0, 0, 0, 0);
    }
    CFRelease(v2);
  }
  else
  {
    v11 = -17721;
  }
  if (v11 && dword_1EE141EA8)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141EA0, 1, &v18, &type);
    v13 = v18;
    if (os_log_type_enabled(v12, type))
      v15 = v13;
    else
      v15 = v13 & 0xFFFFFFFE;
    if (v15)
    {
      v19 = 136315394;
      v20 = "FigBufferedAirPlayClientRoutingRegistryGetSharedInstance_block_invoke";
      v21 = 1024;
      v22 = v11;
      v16 = (_BYTE *)_os_log_send_and_compose_impl();
      LOBYTE(v13) = v18;
    }
    else
    {
      v16 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141EA0, 1u, 1, v16, v16 != v23, v13, 0, v14);
  }
}

@end
