@implementation FigVirtualFramebufferGetRemoteFramebufs

void __FigVirtualFramebufferGetRemoteFramebufs_block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  const __CFAllocator *v4;
  uint64_t v5;
  int v6;
  uint64_t DerivedStorage;
  NSObject *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  _QWORD block[5];
  os_log_type_t type;
  unsigned int v22;
  void *v23;
  os_log_type_t v24[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  CFRunLoopSourceContext context;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_queue_create("com.apple.coremedia.vfbremote.connect", 0);
  FigVirtualFramebufferGetRemoteFramebufs_framebufs = (uint64_t)malloc_type_calloc(*(_QWORD *)(a1 + 32), 8uLL, 0x2004093837F09uLL);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = 0;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      v5 = FigVirtualFramebufferGetRemoteFramebufs_framebufs;
      v23 = 0;
      memset(&context.retain, 0, 40);
      FigVirtualFramebufferGetClassID();
      v6 = CMDerivedObjectCreate();
      if (v6)
        break;
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      *(_DWORD *)(DerivedStorage + 24) = v3 + 1;
      *(_QWORD *)DerivedStorage = 0;
      *(_QWORD *)(DerivedStorage + 16) = v2;
      dispatch_retain(v2);
      *(_QWORD *)(DerivedStorage + 8) = 0;
      *(_QWORD *)(DerivedStorage + 32) = FigSimpleMutexCreate();
      *(_QWORD *)(DerivedStorage + 40) = CFDictionaryCreateMutable(v4, 0, 0, MEMORY[0x1E0C9B3A0]);
      *(_DWORD *)(DerivedStorage + 64) = -1;
      *(_QWORD *)(DerivedStorage + 72) = FigSimpleMutexCreate();
      context.version = 0;
      context.info = v23;
      context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))vfbremote_hotplugSourceSchedule;
      context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))vfbremote_hotplugSourceCancel;
      context.perform = (void (__cdecl *)(void *))vfbremote_hotplugSourcePerform;
      *(_QWORD *)(DerivedStorage + 88) = CFRunLoopSourceCreate(v4, 0, &context);
      *(_QWORD *)(DerivedStorage + 120) = FigSimpleMutexCreate();
      context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))vfbremote_vsyncSourceSchedule;
      context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))vfbremote_vsyncSourceCancel;
      context.perform = (void (__cdecl *)(void *))vfbremote_vsyncSourcePerform;
      *(_QWORD *)(DerivedStorage + 136) = CFRunLoopSourceCreate(v4, 0, &context);
      *(_QWORD *)(DerivedStorage + 192) = FigSimpleMutexCreate();
      context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))vfbremote_hdcpSourceSchedule;
      context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))vfbremote_hdcpSourceCancel;
      context.perform = (void (__cdecl *)(void *))vfbremote_hdcpSourcePerform;
      *(_QWORD *)(DerivedStorage + 208) = CFRunLoopSourceCreate(v4, 0, &context);
      v8 = *(NSObject **)(DerivedStorage + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = __vfbremote_create_block_invoke;
      block[3] = &__block_descriptor_tmp_2_1;
      block[4] = v23;
      dispatch_async(v8, block);
      *(_QWORD *)(v5 + 8 * v3) = v23;
      v22 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v10 = v22;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v11 = v10;
      else
        v11 = v10 & 0xFFFFFFFE;
      if (v11)
      {
        v12 = *(_DWORD *)(DerivedStorage + 24);
        *(_DWORD *)v24 = 136315394;
        v25 = "vfbremote_create";
        v26 = 1024;
        v27 = v12;
        _os_log_send_and_compose_impl();
      }
      ++v3;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (v3 >= *(_QWORD *)(a1 + 32))
        goto LABEL_12;
    }
    v13 = v6;
    v22 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v15 = v22;
    if (os_log_type_enabled(v14, type))
      v16 = v15;
    else
      v16 = v15 & 0xFFFFFFFE;
    if (v16)
    {
      *(_DWORD *)v24 = 136315650;
      v25 = "vfbremote_create";
      v26 = 1024;
      v27 = 1199;
      v28 = 1024;
      v29 = v13;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    LODWORD(block[0]) = 0;
    v24[0] = OS_LOG_TYPE_DEFAULT;
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v18 = block[0];
    if (os_log_type_enabled(v17, v24[0]))
      v19 = v18;
    else
      v19 = v18 & 0xFFFFFFFE;
    if (v19)
    {
      LODWORD(context.version) = 136315650;
      *(CFIndex *)((char *)&context.version + 4) = (CFIndex)"FigVirtualFramebufferGetRemoteFramebufs_block_invoke";
      WORD2(context.info) = 1024;
      *(_DWORD *)((char *)&context.info + 6) = 1268;
      WORD1(context.retain) = 1024;
      HIDWORD(context.retain) = v13;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v3 = 0;
  }
LABEL_12:
  dispatch_release(v2);
  FigVirtualFramebufferGetRemoteFramebufs_framebufCount = v3;
}

@end
