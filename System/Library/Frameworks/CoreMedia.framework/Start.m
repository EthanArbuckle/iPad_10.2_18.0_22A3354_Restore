@implementation Start

uint64_t __tcp_Start_block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t DerivedStorage;
  pthread_t *v6;
  const __CFDictionary *v7;
  uint64_t (*v8)(const void *);
  uint64_t v9;
  void *values;
  int v11[2];
  uint64_t v12;

  v1 = (_QWORD *)result;
  v12 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(*(_QWORD *)(result + 40) + 48))
  {
    if (pipe(v11))
    {
      result = (uint64_t)__error();
      *(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = *(_DWORD *)result;
      goto LABEL_15;
    }
    v2 = v1[5];
    v3 = v11[1];
    *(_DWORD *)(v2 + 104) = v11[0];
    *(_DWORD *)(v2 + 92) = v3;
    fcntl(v3, 4, 4);
    if (CFEqual(*(CFTypeRef *)(v1[5] + 24), CFSTR("Client")))
    {
      v4 = v1[6];
      DerivedStorage = CMBaseObjectGetDerivedStorage(v4);
      v6 = (pthread_t *)(DerivedStorage + 112);
      if (!*(_QWORD *)(DerivedStorage + 112))
      {
        *(_BYTE *)(DerivedStorage + 120) = 0;
        values = CFSTR("FigTransportConnectionTCP.client");
        v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&kFigThreadCreateKey_Identifier, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v8 = tcp_clientThreadMain;
LABEL_9:
        FigThreadCreate((uint64_t)v8, v4, 0x1Cu, 1, v7, v6);
        if (v7)
          CFRelease(v7);
        result = 0;
        goto LABEL_12;
      }
    }
    else
    {
      if (!CFEqual(*(CFTypeRef *)(v1[5] + 24), CFSTR("Server")))
      {
        result = FigSignalErrorAt(4294955246, 0, 0, 0, 0, 0, 0);
LABEL_12:
        *(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = result;
        goto LABEL_13;
      }
      v4 = v1[6];
      v9 = CMBaseObjectGetDerivedStorage(v4);
      v6 = (pthread_t *)(v9 + 112);
      if (!*(_QWORD *)(v9 + 112))
      {
        *(_BYTE *)(v9 + 120) = 0;
        values = CFSTR("FigTransportConnectionTCP.server");
        v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&kFigThreadCreateKey_Identifier, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v8 = tcp_serverThreadMain;
        goto LABEL_9;
      }
    }
    result = 4294955243;
    goto LABEL_12;
  }
LABEL_13:
  if (!*(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24))
    ++*(_DWORD *)(v1[5] + 48);
LABEL_15:
  if (*(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24))
    return tcp_CleanupFileDescriptors(v1[6]);
  return result;
}

void __usb_Start_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t DerivedStorage;
  const __CFAllocator *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v12;
  uint64_t v13;
  unsigned int v14;
  void **v15;
  uint64_t v16;
  const __CFAllocator *v17;
  const __CFDictionary *v18;
  dispatch_semaphore_t v19;
  const __CFDictionary *v20;
  os_log_type_t type;
  int v22;
  void *v23;
  int v24;
  const char *v25;
  void *values[17];

  values[16] = *(void **)MEMORY[0x1E0C80C00];
  v2 = a1[5];
  if (*(_DWORD *)(v2 + 88))
    goto LABEL_24;
  if (CFEqual(*(CFTypeRef *)(v2 + 72), CFSTR("Client")))
  {
    v3 = a1[6];
    DerivedStorage = CMBaseObjectGetDerivedStorage(v3);
    *(_BYTE *)(DerivedStorage + 40) = 0;
    *(_BYTE *)(DerivedStorage + 24) = 0;
    *(_QWORD *)(DerivedStorage + 200) = dispatch_semaphore_create(0);
    values[0] = CFSTR("FigTransportConnectionUSB.messagesending");
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&kFigThreadCreateKey_Identifier, (const void **)values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    FigThreadCreate((uint64_t)usb_messageSendingThreadMain, v3, 0x1Cu, 1, v6, (pthread_t *)(DerivedStorage + 192));
    if (v6)
      CFRelease(v6);
    values[0] = CFSTR("FigTransportConnectionUSB.client");
    v7 = CFDictionaryCreate(v5, (const void **)&kFigThreadCreateKey_Identifier, (const void **)values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    FigThreadCreate((uint64_t)usb_clientThreadMain, v3, 0x1Cu, 1, v7, (pthread_t *)(DerivedStorage + 128));
    if (v7)
      CFRelease(v7);
    v8 = 0;
  }
  else
  {
    if (CFEqual(*(CFTypeRef *)(a1[5] + 72), CFSTR("Server")))
    {
      v9 = a1[6];
      v10 = CMBaseObjectGetDerivedStorage(v9);
      v22 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v22, &type);
      v12 = v22;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v14 = v12;
      else
        v14 = v12 & 0xFFFFFFFE;
      if (v14)
      {
        v24 = 136315138;
        v25 = "usb_startServer";
        v15 = (void **)_os_log_send_and_compose_impl();
        LOBYTE(v12) = v22;
      }
      else
      {
        v15 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v15, v15 != values, v12, 0, v13);
      *(_BYTE *)(v10 + 40) = 0;
      *(_BYTE *)(v10 + 24) = 0;
      *(_QWORD *)(v10 + 200) = dispatch_semaphore_create(0);
      v23 = CFSTR("FigTransportConnectionUSB.messagesending");
      v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v18 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&kFigThreadCreateKey_Identifier, (const void **)&v23, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      FigThreadCreate((uint64_t)usb_messageSendingThreadMain, v9, 0x1Cu, 1, v18, (pthread_t *)(v10 + 192));
      if (v18)
        CFRelease(v18);
      v19 = dispatch_semaphore_create(0);
      *(_QWORD *)(v10 + 144) = v19;
      if (v19)
      {
        v23 = CFSTR("FigTransportConnectionUSB.server");
        v20 = CFDictionaryCreate(v17, (const void **)&kFigThreadCreateKey_Identifier, (const void **)&v23, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        FigThreadCreate((uint64_t)usb_serverThreadMain, v9, 0x1Cu, 1, v20, (pthread_t *)(v10 + 128));
        if (v20)
          CFRelease(v20);
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v10 + 144), 0xFFFFFFFFFFFFFFFFLL);
        v8 = *(_DWORD *)(v10 + 152);
        dispatch_release(*(dispatch_object_t *)(v10 + 144));
        *(_QWORD *)(v10 + 144) = 0;
        goto LABEL_23;
      }
      v16 = 4294955245;
    }
    else
    {
      v16 = 4294955246;
    }
    v8 = FigSignalErrorAt(v16, 0, 0, 0, 0, 0, 0);
  }
LABEL_23:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v8;
LABEL_24:
  if (!*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    ++*(_DWORD *)(a1[5] + 88);
}

@end
