@implementation FigWiredMemory

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (FigWiredMemory)initWithLength:(unint64_t)a3
{
  FigWiredMemory *v4;
  FigWiredMemory *v5;
  vm_size_t v6;
  const void **p_bytes;
  NSObject *v8;
  char v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)FigWiredMemory;
  v4 = -[FigWiredMemory init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = (a3 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8];
    v4->_roundedLength = v6;
    p_bytes = (const void **)&v4->_bytes;
    if (vm_allocate(*MEMORY[0x1E0C83DA0], (vm_address_t *)&v4->_bytes, v6, 1694498817) || !*p_bytes)
    {
      FigDebugAssert3();
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      ReportMemoryException();

      return 0;
    }
    else
    {
      if (mlock(*p_bytes, v5->_roundedLength))
      {
        v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        ReportMemoryException();
        v9 = 0;
      }
      else
      {
        v9 = 1;
      }
      v5->_isWired = v9;
      v5->_length = a3;
    }
  }
  return v5;
}

- (void)dealloc
{
  void *bytes;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  objc_super v6;
  os_log_type_t type;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  bytes = self->_bytes;
  if (bytes)
  {
    if (self->_isWired && munlock(bytes, self->_roundedLength))
    {
      v8 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (MEMORY[0x1A858E460](*MEMORY[0x1E0C83DA0], self->_bytes, self->_roundedLength))
    {
      v8 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)FigWiredMemory;
  -[FigWiredMemory dealloc](&v6, sel_dealloc);
}

- (void)bytes
{
  return self->_bytes;
}

- (unint64_t)length
{
  return self->_length;
}

@end
