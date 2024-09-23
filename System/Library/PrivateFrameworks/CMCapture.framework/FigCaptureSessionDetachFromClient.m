@implementation FigCaptureSessionDetachFromClient

uint64_t __FigCaptureSessionDetachFromClient_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint32_t PIDFromAuditToken;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 v13;
  const void *v14;
  uint64_t result;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (dword_1ECFE9590)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  captureSession_teardownImageQueueSinkNodesIfNeeded(*(_QWORD *)(a1 + 40), 0);
  captureSession_destroyAudioSessionForMicPipeline();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "invalidate");

  v3 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v3 + 88) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 52));
  v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  *(_OWORD *)(v4 + 36) = v5;
  *(_OWORD *)(v4 + 20) = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(v6 + 36);
  v18 = *(_OWORD *)(v6 + 20);
  v19 = v7;
  PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(&v18);
  v9 = *(os_unfair_lock_s **)(a1 + 32);
  v9[4]._os_unfair_lock_opaque = PIDFromAuditToken;
  os_unfair_lock_unlock(v9 + 13);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 72);
  v16 = *(_OWORD *)(v10 + 20);
  v17 = *(_OWORD *)(v10 + 36);
  if (v11)
  {
    v12 = (__int128 *)(v10 + 20);
    v13 = *v12;
    *(_OWORD *)(v11 + 24) = v12[1];
    *(_OWORD *)(v11 + 8) = v13;
    v18 = v16;
    v19 = v17;
    *(_DWORD *)(v11 + 40) = FigCaptureGetPIDFromAuditToken(&v18);
    objc_msgSend((id)v11, "_updateLoggingPrefix");
  }
  captureSession_updateSessionStateWithApplicationAndLayoutState(*(const void **)(a1 + 40), 1, 0, 0, 0);
  v14 = *(const void **)(*(_QWORD *)(a1 + 32) + 304);
  if (v14)
  {
    CFRelease(v14);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) = 0;
  }
  result = captureSession_transitionToSessionLaunchPrewarmStatus(*(_QWORD *)(a1 + 40), 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  return result;
}

@end
