@implementation AVOutputDeviceCommunicationChannel

- (AVOutputDeviceCommunicationChannel)initWithOutputDeviceCommunicationChannelImpl:(id)a3
{
  AVOutputDeviceCommunicationChannel *v4;
  id v5;
  AVOutputDeviceCommunicationChannel *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceCommunicationChannel;
  v4 = -[AVOutputDeviceCommunicationChannel init](&v8, sel_init);
  if (v4 && (v5 = a3, (v4->_impl = (AVOutputDeviceCommunicationChannelImpl *)v5) != 0))
  {
    objc_msgSend(v5, "setParentChannel:", v4);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceCommunicationChannel;
  -[AVOutputDeviceCommunicationChannel dealloc](&v3, sel_dealloc);
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  -[AVOutputDeviceCommunicationChannelImpl sendData:completionHandler:](self->_impl, "sendData:completionHandler:", a3, a4);
}

- (void)close
{
  -[AVOutputDeviceCommunicationChannelImpl close](self->_impl, "close");
}

- (void)setDelegate:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVOutputDeviceCommunicationChannelDelegate)delegate
{
  return (AVOutputDeviceCommunicationChannelDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)communicationChannelImpl:(id)a3 didReceiveData:(id)a4
{
  id Weak;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(Weak, "communicationChannel:didReceiveData:", self, a4, v9, v10);
  }
  else if (dword_1ECDECED8)
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)communicationChannelImplDidClose:(id)a3
{
  id Weak;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(Weak, "communicationChannelDidClose:", self, v7, v8);
  }
  else if (dword_1ECDECED8)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
