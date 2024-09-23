@implementation EnsureClientEstablished

void __remoteExternalStorageDeviceManagerClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  const void *v4;
  unsigned int v5;
  int v6;
  useconds_t v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("FigExternalStorageDeviceManager_ServerConnectionDied"));
    v4 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0CA54B8], (const void *)*MEMORY[0x1E0C9AE50]);
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0CA54A8], v4);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else if (!gFigExternalStorageDeviceManagerRemoteClient)
    {
      v5 = 1;
      v6 = 250;
      v7 = 250000;
      do
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        usleep(v7);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
        if (gFigExternalStorageDeviceManagerRemoteClient)
          break;
        v7 += 250000;
        v6 += 250;
      }
      while (v5++ < 3);
    }
    CFRelease(v3);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -16150;
  }
}

@end
