@implementation FigRCLCreateConfiguration

void __rcl_FigRCLCreateConfiguration_dispatcher_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  CFURLRef v4;
  CFURLRef v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, uint64_t, _QWORD, CFURLRef, _QWORD, _QWORD, _QWORD, uint64_t, _OWORD *, _QWORD, _QWORD, _QWORD, void (*)(uint64_t, int, int, CMBlockBufferRef, uint64_t, uint64_t, char, int), _QWORD, _QWORD *, _QWORD *);
  _QWORD *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _OWORD v12[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (gFigRemoteConfigLoaderInit != -1)
    dispatch_once_f(&gFigRemoteConfigLoaderInit, 0, (dispatch_function_t)rcl_InitializeLoader);
  v2 = gFRCL_Loader;
  if (gFRCL_Loader && !*(_QWORD *)(gFRCL_Loader + 8))
  {
    if (v1 && *(_QWORD *)v1 && *(_QWORD *)(v1 + 8))
    {
      v3 = *MEMORY[0x1E0C9AE00];
      v4 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFStringRef *)v1, 0);
      if (!v4)
        return;
      v5 = v4;
      v6 = malloc_type_calloc(1uLL, 0x38uLL, 0x10A0040FB48983FuLL);
      if (!v6)
      {
LABEL_13:
        CFRelease(v5);
        return;
      }
      v7 = v6;
      v6[2] = v1;
      v8 = *(_QWORD *)(v2 + 32);
      v9 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD, CFURLRef, _QWORD, _QWORD, _QWORD, uint64_t, _OWORD *, _QWORD, _QWORD, _QWORD, void (*)(uint64_t, int, int, CMBlockBufferRef, uint64_t, uint64_t, char, int), _QWORD, _QWORD *, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (v9)
      {
        memset(v12, 0, 112);
        if (!v9(v8, v3, 0, v5, 0, 0, 0, 4, v12, 0, 0, 0, rcl_HTTPReadCallback, 0, v7 + 3, v7 + 4))
        {
          *v7 = 0;
          v10 = *(_QWORD **)(v2 + 16);
          v7[1] = v10;
          *v10 = v7;
          *(_QWORD *)(v2 + 16) = v7;
          goto LABEL_13;
        }
      }
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      CFRelease(v5);
    }
    else
    {
      v7 = 0;
    }
    rcl_ReleaseConnectionData(v7);
  }
}

@end
