@implementation FigProcessStateMonitor

void __FigProcessStateMonitor_handleMessage_block_invoke(uint64_t a1)
{
  int v2;
  _xpc_connection_s *v3;
  void *v4;
  void *v5;
  void *v6;
  CFTypeRef *v7;
  uint64_t v8;
  int v9;
  const __CFAllocator *v10;
  int MustNotPurgeClientObjects;
  int v12;
  CFAbsoluteTime Current;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v15;
  uint64_t v16;
  unsigned int v17;
  CFTypeRef *v18;
  void *v19;
  void *uint64;
  int64_t *v21;
  int64_t *v22;
  void *v23;
  id v24;
  int v25;
  CFTypeRef v26;
  uint64_t v27;
  os_log_type_t type;
  int v29;
  _QWORD v30[5];
  int v31;
  const char *v32;
  __int16 v33;
  uint64_t v34;
  CFTypeRef cf[17];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 64);
  if (v2 == 1685024867)
  {
    v19 = *(void **)(a1 + 48);
    uint64 = (void *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), ".objectID");
    if (uint64)
    {
      v21 = (int64_t *)FigCFWeakReferenceTableCopyValue(gServedObjects, uint64);
      if (v21)
      {
        v22 = v21;
        xpc_dictionary_set_int64(v19, "ProcessStateMonitorLastPurgeEvent", v21[9]);
        CFRelease(v22);
        MustNotPurgeClientObjects = 0;
        goto LABEL_28;
      }
LABEL_30:
      v27 = 4294947864;
      uint64 = 0;
      goto LABEL_31;
    }
LABEL_29:
    v27 = 4294947866;
LABEL_31:
    MustNotPurgeClientObjects = FigSignalErrorAt(v27, (uint64_t)uint64, 0, 0, 0, 0, 0);
    goto LABEL_28;
  }
  if (v2 == 1835954287)
  {
    v23 = *(void **)(a1 + 40);
    cf[0] = 0;
    uint64 = (void *)xpc_dictionary_get_uint64(v23, ".objectID");
    if (uint64)
    {
      v24 = FigCFWeakReferenceTableCopyValue(gServedObjects, uint64);
      if (v24)
      {
        v8 = (uint64_t)v24;
        v25 = FigXPCMessageCopyCFString(v23, "ProcessStateMonitorAssertion", cf);
        v26 = cf[0];
        if (v25)
        {
          MustNotPurgeClientObjects = v25;
          if (!cf[0])
            goto LABEL_27;
        }
        else
        {
          MustNotPurgeClientObjects = figProcessStateMonitorMustNotPurgeClientObjects(v8, cf[0]);
          v26 = cf[0];
          if (!cf[0])
          {
LABEL_27:
            CFRelease((CFTypeRef)v8);
            goto LABEL_28;
          }
        }
        CFRelease(v26);
        goto LABEL_27;
      }
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v2 != 1701408885)
  {
    MustNotPurgeClientObjects = -16158;
    goto LABEL_28;
  }
  v3 = *(_xpc_connection_s **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = (void *)xpc_dictionary_get_uint64(v4, ".objectID");
  if (!v5)
  {
    MustNotPurgeClientObjects = FigSignalErrorAt(4294947866, 0, 0, 0, 0, 0, 0);
    v8 = 0;
    goto LABEL_9;
  }
  v6 = v5;
  v7 = (CFTypeRef *)FigCFWeakReferenceTableCopyValue(gServedObjects, v5);
  v8 = (uint64_t)v7;
  if (!v7)
  {
    v9 = FigSignalErrorAt(4294947864, 0, 0, 0, 0, 0, 0);
    goto LABEL_34;
  }
  v9 = FigXPCServerCopyMemoryRecipient(v3, v7 + 4);
  if (v9)
  {
LABEL_34:
    MustNotPurgeClientObjects = v9;
    goto LABEL_9;
  }
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  MustNotPurgeClientObjects = FigMemoryRecipientCopyBlockBufferFromXPCMessage((const __CFAllocator *)*MEMORY[0x1E0C9AE00], *(_QWORD *)(v8 + 32), v4, "ProcessStateMonitorShmem", (CMBlockBufferRef *)(v8 + 40));
  if (!MustNotPurgeClientObjects)
  {
    v12 = *(_DWORD *)(v8 + 16);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __figProcessStateMonitorHandleEnrollInPurge_block_invoke;
    v30[3] = &__block_descriptor_40_e8_v12__0i8l;
    v30[4] = v6;
    FigPurgeAndRenewProcessStateTrackerStartTrackingPIDWithBlock(v12, (uint64_t)v30);
    *(_BYTE *)(v8 + 80) = 1;
    Current = CFAbsoluteTimeGetCurrent();
    *(_QWORD *)(v8 + 88) = CFDateCreate(v10, Current);
  }
LABEL_9:
  if (dword_1EE141E28)
  {
    v29 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E20, 1, &v29, &type);
    v15 = v29;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v17 = v15;
    else
      v17 = v15 & 0xFFFFFFFE;
    if (v17)
    {
      v31 = 136315394;
      v32 = "figProcessStateMonitorHandleEnrollInPurge";
      v33 = 2114;
      v34 = v8;
      v18 = (CFTypeRef *)_os_log_send_and_compose_impl();
      LOBYTE(v15) = v29;
    }
    else
    {
      v18 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E20, 1u, 1, v18, v18 != cf, v15, 0, v16);
  }
  if (v8)
    goto LABEL_27;
LABEL_28:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = MustNotPurgeClientObjects;
}

void __FigProcessStateMonitor_noReplyHandleMessage_block_invoke(uint64_t a1)
{
  int v1;
  _xpc_connection_s *v2;
  uint64_t uint64;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v5;
  uint64_t v6;
  unsigned int v7;
  pid_t pid;
  CFTypeRef *v9;
  void *v10;
  void *v11;
  id v12;
  const void *v13;
  int v14;
  CFTypeRef v15;
  uint64_t v16;
  os_log_type_t type;
  int v18[2];
  const char *v19;
  __int16 v20;
  pid_t v21;
  __int16 v22;
  uint64_t v23;
  CFTypeRef cf[17];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 56);
  if (v1 != 1836082031)
  {
    if (v1 == 1684632432)
    {
      v2 = *(_xpc_connection_s **)(a1 + 32);
      uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), ".objectID");
      FigXPCServerDisassociateObjectWithConnection(v2, uint64);
      if (dword_1EE141E28)
      {
        v18[0] = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E20, 1, v18, &type);
        v5 = v18[0];
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
          v7 = v5;
        else
          v7 = v5 & 0xFFFFFFFE;
        if (v7)
        {
          pid = xpc_connection_get_pid(v2);
          v18[1] = 136315650;
          v19 = "figProcessStateMonitorHandleDispose";
          v20 = 1024;
          v21 = pid;
          v22 = 2048;
          v23 = uint64;
          v9 = (CFTypeRef *)_os_log_send_and_compose_impl();
          LOBYTE(v5) = v18[0];
        }
        else
        {
          v9 = 0;
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E20, 1u, 1, v9, v9 != cf, v5, 0, v6);
      }
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -16158;
    }
    return;
  }
  v10 = *(void **)(a1 + 40);
  cf[0] = 0;
  v11 = (void *)xpc_dictionary_get_uint64(v10, ".objectID");
  if (!v11)
  {
    v16 = 4294947866;
LABEL_22:
    FigSignalErrorAt(v16, 0, 0, 0, 0, 0, 0);
    return;
  }
  v12 = FigCFWeakReferenceTableCopyValue(gServedObjects, v11);
  if (!v12)
  {
    v16 = 4294947864;
    goto LABEL_22;
  }
  v13 = v12;
  v14 = FigXPCMessageCopyCFString(v10, "ProcessStateMonitorAssertion", cf);
  v15 = cf[0];
  if (!v14)
  {
    figProcessStateMonitorMayPurgeClientObjects((uint64_t)v13, cf[0]);
    v15 = cf[0];
  }
  if (v15)
    CFRelease(v15);
  CFRelease(v13);
}

@end
