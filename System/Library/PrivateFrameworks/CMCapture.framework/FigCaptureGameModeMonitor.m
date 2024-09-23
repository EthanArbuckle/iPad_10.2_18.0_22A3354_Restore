@implementation FigCaptureGameModeMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (FigCaptureGameModeMonitor)initWithStateChangeHandler:(id)a3
{
  FigCaptureGameModeMonitor *v4;
  void *v5;
  NSObject *global_queue;
  uint32_t v7;
  NSObject *v9;
  uint32_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v12;
  unsigned int v13;
  int gameModeNotifyToken;
  _QWORD handler[5];
  os_log_type_t type;
  unsigned int v17;
  objc_super v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint32_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)FigCaptureGameModeMonitor;
  v4 = -[FigCaptureGameModeMonitor init](&v18, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    if ((objc_msgSend(v5, "isDeviceCertifiedFor:", *MEMORY[0x1E0CC6A00]) & 1) != 0)
    {
      v4->_gameModeNotifyToken = 0;
      v4->_gameModeStateChangeHandler = (id)objc_msgSend(a3, "copy");
      global_queue = dispatch_get_global_queue(0, 0);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __56__FigCaptureGameModeMonitor_initWithStateChangeHandler___block_invoke;
      handler[3] = &unk_1E491FB78;
      handler[4] = v4;
      v7 = notify_register_dispatch("com.apple.system.console_mode_changed_camera_jettison_s2r", &v4->_gameModeNotifyToken, global_queue, handler);
      if (!v7)
        return v4;
      v10 = v7;
      v17 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v12 = v17;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if (v13)
      {
        gameModeNotifyToken = v4->_gameModeNotifyToken;
        v19 = 136315650;
        v20 = "-[FigCaptureGameModeMonitor initWithStateChangeHandler:]";
        v21 = 1024;
        v22 = v10;
        v23 = 1024;
        v24 = gameModeNotifyToken;
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      FigDebugAssert3();
      v17 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return 0;
  }
  return v4;
}

uint64_t __56__FigCaptureGameModeMonitor_initWithStateChangeHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;

  if (dword_1EE6BE9B8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_gameModeNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureGameModeMonitor;
  -[FigCaptureGameModeMonitor dealloc](&v3, sel_dealloc);
}

- (BOOL)isGameModeEnabled
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;
  uint64_t state64[21];

  state64[20] = *MEMORY[0x1E0C80C00];
  state64[0] = 0;
  if (notify_get_state(self->_gameModeNotifyToken, state64))
    goto LABEL_5;
  if (dword_1EE6BE9B8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (state64[0] >= 2)
  {
LABEL_5:
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return state64[0] == 1;
}

@end
