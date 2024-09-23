@implementation CMCaptureFrameSenderClient

- (CMCaptureFrameSenderClient)initWithConnection:(id)a3 queue:(id)a4
{
  CMCaptureFrameSenderClient *v5;
  pid_t pid;
  const __CFAllocator *v7;
  __SecTask *v8;
  __SecTask *v9;
  CFTypeRef v10;
  CFErrorRef v11;
  NSObject *v12;
  unsigned int v13;
  unsigned int v14;
  _BOOL4 v15;
  CFTypeID v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v18;
  unsigned int v19;
  pid_t v20;
  unsigned int v21;
  OS_xpc_object *v22;
  OS_dispatch_queue *queue;
  _QWORD handler[5];
  id v26;
  objc_super v27;
  os_log_type_t type;
  unsigned int v29;
  CFErrorRef error;
  int v31;
  const char *v32;
  __int16 v33;
  pid_t v34;
  __int16 v35;
  CFErrorRef v36;
  audit_token_t token;
  audit_token_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Need a connection and a queue"), 0));
  v27.receiver = self;
  v27.super_class = (Class)CMCaptureFrameSenderClient;
  v5 = -[CMCaptureFrameSenderClient init](&v27, sel_init);
  if (v5)
  {
    memset(&v38, 0, sizeof(v38));
    xpc_connection_get_audit_token();
    pid = xpc_connection_get_pid((xpc_connection_t)a3);
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    token = v38;
    v8 = SecTaskCreateWithAuditToken(v7, &token);
    v9 = v8;
    if (!v8)
    {
      v15 = 0;
LABEL_23:
      if (dword_1ECFE9790)
      {
        v31 = 0;
        LOBYTE(error) = 0;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v18 = v31;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, (os_log_type_t)error))
          v19 = v18;
        else
          v19 = v18 & 0xFFFFFFFE;
        if (v19)
        {
          v20 = xpc_connection_get_pid((xpc_connection_t)a3);
          v38.val[0] = 136315651;
          *(_QWORD *)&v38.val[1] = "-[CMCaptureFrameSenderClient initWithConnection:queue:]";
          if (v15)
            v21 = 84;
          else
            v21 = 70;
          LOWORD(v38.val[3]) = 1025;
          *(unsigned int *)((char *)&v38.val[3] + 2) = v20;
          HIWORD(v38.val[4]) = 1025;
          v38.val[5] = v21;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v15)
      {
        v22 = (OS_xpc_object *)a3;
        queue = v5->_queue;
        v5->_connection = v22;
        v5->_queue = queue;
        v5->_pid = xpc_connection_get_pid((xpc_connection_t)a3);
        v5->_connectionIsValid = 1;
        objc_initWeak((id *)&token, v5);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __55__CMCaptureFrameSenderClient_initWithConnection_queue___block_invoke;
        handler[3] = &unk_1E491E798;
        objc_copyWeak(&v26, (id *)&token);
        handler[4] = a3;
        xpc_connection_set_event_handler((xpc_connection_t)a3, handler);
        xpc_connection_activate((xpc_connection_t)a3);
        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)&token);
      }
      else
      {

        return 0;
      }
      return v5;
    }
    error = 0;
    v10 = SecTaskCopyValueForEntitlement(v8, CFSTR("com.apple.private.cmcapture.frame-receiver"), &error);
    v11 = error;
    if (error)
    {
      if (dword_1ECFE9790)
      {
        v29 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v13 = v29;
        if (os_log_type_enabled(v12, type))
          v14 = v13;
        else
          v14 = v13 & 0xFFFFFFFE;
        if (v14)
        {
          v31 = 136315651;
          v32 = "_cfs_connectionHasEntitlement";
          v33 = 1025;
          v34 = pid;
          v35 = 2112;
          v36 = error;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v11 = error;
      }
      CFRelease(v11);
      v15 = 0;
      error = 0;
      if (!v10)
        goto LABEL_22;
    }
    else
    {
      if (!v10)
      {
        v15 = 0;
LABEL_22:
        CFRelease(v9);
        goto LABEL_23;
      }
      v16 = CFGetTypeID(v10);
      v15 = v16 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v10) != 0;
    }
    CFRelease(v10);
    goto LABEL_22;
  }
  return v5;
}

void __55__CMCaptureFrameSenderClient_initWithConnection_queue___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  uint64_t v5;
  xpc_object_t reply;
  BOOL v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x1A858E754](a2);
  if (v5 == MEMORY[0x1E0C81310])
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    else
    {
      v7 = a2 != (void *)MEMORY[0x1E0C81260] || WeakRetained == 0;
      if (!v7 && WeakRetained[28])
      {
        if (dword_1ECFE9790)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend(WeakRetained, "_invalidate", v9, v10);
      }
    }
  }
  else if (v5 == MEMORY[0x1E0C812F8])
  {
    reply = xpc_dictionary_create_reply(a2);
    xpc_dictionary_set_int64(reply, "errorReturn", 0);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    xpc_release(reply);
  }

}

- (void)dealloc
{
  OS_xpc_object *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);

  }
  v4.receiver = self;
  v4.super_class = (Class)CMCaptureFrameSenderClient;
  -[CMCaptureFrameSenderClient dealloc](&v4, sel_dealloc);
}

- (void)_invalidate
{
  if (self->_connectionIsValid)
  {
    xpc_connection_cancel(self->_connection);
    self->_connectionIsValid = 0;
  }
}

- (int)sendXCPSampleBuffer:(id)a3
{
  xpc_object_t v5;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  int int64;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "call", "frame-output-notification");
  if (a3)
    xpc_dictionary_set_value(v5, "sample-buffer", a3);
  v6 = xpc_connection_send_message_with_reply_sync(self->_connection, v5);
  if (v6)
  {
    v7 = v6;
    v8 = MEMORY[0x1A858E754]();
    int64 = 0;
    if (a3)
    {
      if (v8 == MEMORY[0x1E0C812F8] && MEMORY[0x1E0C81310] != MEMORY[0x1E0C812F8])
        int64 = xpc_dictionary_get_int64(v7, "errorReturn");
    }
    xpc_release(v7);
  }
  else
  {
    int64 = 0;
  }
  xpc_release(v5);
  return int64;
}

- (BOOL)connectionIsValid
{
  return self->_connectionIsValid;
}

- (int)pid
{
  return self->_pid;
}

@end
