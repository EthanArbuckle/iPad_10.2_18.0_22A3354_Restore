@implementation FigSandboxRegistrationServerStart

void __FigSandboxRegistrationServerStart_block_invoke(uint64_t a1)
{
  const char *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v4;
  uint64_t v5;
  unsigned int v6;
  char *v7;
  const __CFAllocator *v8;
  CFMutableDictionaryRef Mutable;
  const void *v10;
  os_log_type_t type;
  int v12[2];
  const char *v13;
  __int16 v14;
  const char *v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (FigServer_IsMediaparserd())
  {
    v2 = 0;
  }
  else if (FigServer_IsMediaplaybackd())
  {
    v2 = "com.apple.coremedia.mediaplaybackd.sandboxserver.xpc";
  }
  else
  {
    v2 = "com.apple.coremedia.sandboxserver.xpc";
  }
  v12[0] = 0;
  type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, v12, &type);
  v4 = v12[0];
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
    v6 = v4;
  else
    v6 = v4 & 0xFFFFFFFE;
  if (v6)
  {
    v12[1] = 136315394;
    v13 = "FigSandboxRegistrationServerStart_block_invoke";
    v14 = 2080;
    v15 = v2;
    v7 = (char *)_os_log_send_and_compose_impl();
    LOBYTE(v4) = v12[0];
  }
  else
  {
    v7 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v7, v7 != &v16, v4, 0, v5);
  gFigSandboxServerXPC_0 = (uint64_t)dispatch_queue_create("FigSandboxServerXPCQueue", 0);
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  gFigSandboxServerXPC_1 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  gFigSandboxServerXPC_2 = (uint64_t)CFBagCreateMutable(v8, 0, 0);
  FigInstallSysdiagnoseBlock((uint64_t)CFSTR("FigSandboxSupportDump"), (uint64_t)&__block_literal_global_32);
  if (v2)
  {
    Mutable = CFDictionaryCreateMutable(v8, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v10 = (const void *)*MEMORY[0x1E0C9AE50];
    FigCFDictionarySetValue(Mutable, CFSTR("xpcServerOption_SelfTerminateOnError"), (const void *)*MEMORY[0x1E0C9AE50]);
    FigCFDictionarySetValue(Mutable, CFSTR("xpcServerOption_OptOutOfPurge"), v10);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCServerStart((uint64_t)v2, (uint64_t)&FigSandboxRegistrationServerStart_callbacks, (uint64_t)Mutable, &gFigSandboxRegistrationServerXPC);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt(4294951145, 0, 0, 0, 0, 0, 0);
  }
}

void __FigSandboxRegistrationServerStart_block_invoke_8()
{
  dispatch_sync((dispatch_queue_t)gFigSandboxServerXPC_0, &__block_literal_global_11_0);
}

void __FigSandboxRegistrationServerStart_block_invoke_2()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v1;
  uint64_t v2;
  unsigned int v3;
  int Count;
  _BYTE *v5;
  const __CFAllocator *v6;
  CFMutableStringRef Mutable;
  CFMutableStringRef v8;
  CFMutableStringRef v9;
  BOOL v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  _BYTE *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  _BYTE *v20;
  os_log_type_t type;
  int v22;
  int v23;
  const char *v24;
  __int16 v25;
  CFMutableStringRef v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v22, &type);
  v1 = v22;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
    v3 = v1;
  else
    v3 = v1 & 0xFFFFFFFE;
  if (v3)
  {
    Count = CFDictionaryGetCount((CFDictionaryRef)gFigSandboxServerXPC_1);
    v23 = 136315394;
    v24 = "FigSandboxRegistrationServerStart_block_invoke_2";
    v25 = 1024;
    LODWORD(v26) = Count;
    v5 = (_BYTE *)_os_log_send_and_compose_impl();
    LOBYTE(v1) = v22;
  }
  else
  {
    v5 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v5, v5 != v27, v1, 0, v2);
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v8 = CFStringCreateMutable(v6, 0);
  v9 = v8;
  if (Mutable)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (!Mutable)
    {
      if (!v8)
        return;
      goto LABEL_14;
    }
  }
  else if (CFDictionaryGetCount((CFDictionaryRef)gFigSandboxServerXPC_1) >= 1)
  {
    CFDictionaryApplyFunction((CFDictionaryRef)gFigSandboxServerXPC_1, (CFDictionaryApplierFunction)figSandboxRegistrationServerCompactDictionaryDescription, Mutable);
    v22 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v22, &type);
    v12 = v22;
    if (os_log_type_enabled(v11, type))
      v14 = v12;
    else
      v14 = v12 & 0xFFFFFFFE;
    if (v14)
    {
      v23 = 136315394;
      v24 = "FigSandboxRegistrationServerStart_block_invoke";
      v25 = 2112;
      v26 = Mutable;
      v15 = (_BYTE *)_os_log_send_and_compose_impl();
      LOBYTE(v12) = v22;
    }
    else
    {
      v15 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v15, v15 != v27, v12, 0, v13);
    CFDictionaryApplyFunction((CFDictionaryRef)gFigSandboxServerXPC_1, (CFDictionaryApplierFunction)figSandboxRegistrationServerPublicDictionaryDescription, v9);
    v22 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v22, &type);
    v17 = v22;
    if (os_log_type_enabled(v16, type))
      v19 = v17;
    else
      v19 = v17 & 0xFFFFFFFE;
    if (v19)
    {
      v23 = 136315394;
      v24 = "FigSandboxRegistrationServerStart_block_invoke";
      v25 = 2114;
      v26 = v9;
      v20 = (_BYTE *)_os_log_send_and_compose_impl();
      LOBYTE(v17) = v22;
    }
    else
    {
      v20 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v20, v20 != v27, v17, 0, v18);
  }
  CFRelease(Mutable);
  if (!v9)
    return;
LABEL_14:
  CFRelease(v9);
}

@end
