@implementation FigCaptureSessionAttachToClient

void __FigCaptureSessionAttachToClient_block_invoke(uint64_t a1)
{
  __int128 *v2;
  __int128 v3;
  uint32_t PIDFromAuditToken;
  _DWORD *v5;
  uint64_t v6;
  __int128 v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  void *v24;
  __int128 v25;
  const void *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (__int128 *)(a1 + 48);
  v3 = *(_OWORD *)(a1 + 64);
  v30 = *(_OWORD *)(a1 + 48);
  v31 = v3;
  PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(&v30);
  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 52));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *v2;
  *(_OWORD *)(v6 + 36) = v2[1];
  *(_OWORD *)(v6 + 20) = v7;
  v8 = *(os_unfair_lock_s **)(a1 + 32);
  v8[4]._os_unfair_lock_opaque = PIDFromAuditToken;
  os_unfair_lock_unlock(v8 + 13);
  dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 120), &__block_literal_global_63);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v10 = v2[1];
  v32 = *v2;
  v33 = v10;
  if (v9)
  {
    v11 = *v2;
    *(_OWORD *)(v9 + 24) = v2[1];
    *(_OWORD *)(v9 + 8) = v11;
    v30 = v32;
    v31 = v33;
    *(_DWORD *)(v9 + 40) = FigCaptureGetPIDFromAuditToken(&v30);
    objc_msgSend((id)v9, "_updateLoggingPrefix");
  }
  if (dword_1ECFE9590)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  captureSession_transitionToSessionLaunchPrewarmStatus(*(_QWORD *)(a1 + 40), 2);
  v13 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v13 + 256))
  {

    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigCaptureSession-%d"), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_OWORD *)(v15 + 36);
    v32 = *(_OWORD *)(v15 + 20);
    v33 = v16;
    v17 = objc_alloc(MEMORY[0x1E0CFF1C8]);
    v30 = v32;
    v31 = v33;
    v18 = objc_msgSend(v17, "initSiblingSession:auditToken:clientIdentifier:autoReconnect:", 0xFFFFFFFFLL, &v30, v14, 0);
    v19 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v19 + 216) = v18;
    v20 = objc_msgSend(*(id *)(v19 + 624), "micSourcePipeline");
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(v21 + 216);
    v23 = *(_OWORD *)(v21 + 36);
    v30 = *(_OWORD *)(v21 + 20);
    v31 = v23;
    -[FigCaptureMicSourcePipeline updateWithAudioSession:clientAuditToken:](v20, v22, &v30);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = 0;
    captureSession_startObservingAudioInterruptionNotification(*(_QWORD *)(a1 + 40));
    v13 = *(_QWORD *)(a1 + 32);
  }
  v24 = *(void **)(v13 + 624);
  v25 = *(_OWORD *)(v13 + 36);
  v30 = *(_OWORD *)(v13 + 20);
  v31 = v25;
  objc_msgSend(v24, "updateClientAuditToken:", &v30, v28, v29);
  v26 = *(const void **)(a1 + 40);
  v27 = v2[1];
  v30 = *v2;
  v31 = v27;
  captureSession_createClientApplicationStateMonitor(v26, &v30);
  if (*v5 == 1)
    kdebug_trace();
}

@end
