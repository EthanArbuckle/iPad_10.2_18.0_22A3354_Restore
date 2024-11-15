@implementation AVOutputDeviceFrecentsReader

- (AVOutputDeviceFrecentsReader)init
{
  return -[AVOutputDeviceFrecentsReader initWithFrecentsFilePath:error:](self, "initWithFrecentsFilePath:error:", 0, 0);
}

- (AVOutputDeviceFrecentsReader)initWithFrecentsFilePath:(id)a3 error:(id *)a4
{
  AVOutputDeviceFrecentsReader *v6;
  AVOutputDeviceFrecentsReader *v7;
  AVOutputDeviceFrecentsReader *v8;
  uint64_t v9;
  void *v10;
  NSDictionary *v11;
  NSObject *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_class *v14;
  objc_super v16;
  _QWORD v17[23];

  v17[22] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AVOutputDeviceFrecentsReader;
  v17[0] = 0;
  v6 = -[AVOutputDeviceFrecentsReader init](&v16, sel_init);
  v7 = v6;
  v8 = 0;
  if (a3)
  {
    if (v6)
    {
      v8 = (AVOutputDeviceFrecentsReader *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", a3, 0, v17);
      if (v8)
      {
        v9 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, v17);
        if (v9)
        {
          v10 = (void *)v9;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = (NSDictionary *)objc_msgSend(v10, "copy");
LABEL_14:
            v7->_frecents = v11;
            v8 = v7;
            goto LABEL_15;
          }
          if (dword_1ECDECED8)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v14 = (objc_class *)MEMORY[0x1E0C99D80];
        }
        else
        {
          if (dword_1ECDECED8)
          {
            v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v14 = (objc_class *)MEMORY[0x1E0C99D80];
        }
        v11 = (NSDictionary *)objc_alloc_init(v14);
        goto LABEL_14;
      }
    }
  }
LABEL_15:
  if (a4 && !v8)
    *a4 = (id)v17[0];

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceFrecentsReader;
  -[AVOutputDeviceFrecentsReader dealloc](&v3, sel_dealloc);
}

- (NSArray)deviceIDs
{
  return -[NSDictionary allKeys](self->_frecents, "allKeys");
}

- (id)frecencyInfoForDeviceWithID:(id)a3
{
  id v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = -[NSDictionary objectForKeyedSubscript:](self->_frecents, "objectForKeyedSubscript:");
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (dword_1ECDECED8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return 0;
    }
  }
  return v3;
}

@end
