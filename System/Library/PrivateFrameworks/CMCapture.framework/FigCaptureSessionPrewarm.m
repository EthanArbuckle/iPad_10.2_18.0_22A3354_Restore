@implementation FigCaptureSessionPrewarm

void __FigCaptureSessionPrewarm_block_invoke(uint64_t a1)
{
  int v1;
  float v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD handler[17];

  handler[16] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 32))
  {
    v1 = *(unsigned __int8 *)(a1 + 33);
    os_unfair_lock_lock(&sFigCaptureSessionPrewarming);
    if (byte_1ECFE9E08)
    {

      getpid();
      qword_1ECFE9E10 = FigOSTransactionCreate();
      cs_initMemoryPoolSize(v1 != 0);
      v2 = *(float *)&dword_1ECFE9E00;
      if (*(float *)&dword_1ECFE9E00 <= 0.0)
      {
        dword_1ECFE9E00 = 1077936128;
        v2 = 3.0;
      }
      if (qword_1ECFE9DF0)
      {
        if (dword_1ECFE9590)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        captureSession_cancelMemoryPoolPrewarmingTimeoutTimer();
      }
      else if (dword_1ECFE9590)
      {
        v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v6 = qword_1ECFE9DF8;
      if (!qword_1ECFE9DF8)
      {
        v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
        v6 = dispatch_queue_create("com.apple.coremedia.capturesession.memoryPoolTimeout", v7);
        qword_1ECFE9DF8 = (uint64_t)v6;
      }
      v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);
      v9 = dispatch_time(0, (uint64_t)(float)(v2 * 1000000000.0));
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v2 * 0.1 * 1000000000.0));
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __captureSession_prewarmMemoryPool_block_invoke;
      handler[3] = &unk_1E491E720;
      handler[4] = v8;
      dispatch_source_set_event_handler(v8, handler);
      qword_1ECFE9DF0 = (uint64_t)v8;
      dispatch_activate(v8);
    }
    else if (dword_1ECFE9590)
    {
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    os_unfair_lock_unlock(&sFigCaptureSessionPrewarming);
  }
}

@end
