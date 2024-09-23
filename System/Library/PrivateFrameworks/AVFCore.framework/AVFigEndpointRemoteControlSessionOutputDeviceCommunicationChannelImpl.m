@implementation AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl

- (AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl)initWithRemoteControlSession:(OpaqueFigEndpointRemoteControlSession *)a3
{
  AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *v4;
  AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *v5;
  unsigned int (*v6)(OpaqueFigEndpointRemoteControlSession *, void (*)(uint64_t, uint64_t, uint64_t, void *), AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *);
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl;
  v4 = -[AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl init](&v8, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (!a3)
  {
    v4->_remoteControlSession = 0;
    goto LABEL_9;
  }
  a3 = (OpaqueFigEndpointRemoteControlSession *)CFRetain(a3);
  v5->_remoteControlSession = a3;
  if (a3)
  {
    v6 = *(unsigned int (**)(OpaqueFigEndpointRemoteControlSession *, void (*)(uint64_t, uint64_t, uint64_t, void *), AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v6 && !v6(a3, AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImplHandleEvent, v5))
    {
      a3 = v5;
      goto LABEL_9;
    }
LABEL_8:
    a3 = 0;
  }
LABEL_9:

  return (AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *)a3;
}

- (void)dealloc
{
  OpaqueFigEndpointRemoteControlSession *remoteControlSession;
  objc_super v4;

  -[AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl close](self, "close");
  remoteControlSession = self->_remoteControlSession;
  if (remoteControlSession)
    CFRelease(remoteControlSession);
  v4.receiver = self;
  v4.super_class = (Class)AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl;
  -[AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl dealloc](&v4, sel_dealloc);
}

- (void)_didReceiveData:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputDeviceCommunicationChannel communicationChannelImpl:didReceiveData:](-[AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl parentChannel](self, "parentChannel", v6, v7), "communicationChannelImpl:didReceiveData:", self, a3);
}

- (void)_didCloseCommunicationChannel
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputDeviceCommunicationChannel communicationChannelImplDidClose:](-[AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl parentChannel](self, "parentChannel", v4, v5), "communicationChannelImplDidClose:", self);
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigEndpointRemoteControlSession *remoteControlSession;
  void (*v9)(OpaqueFigEndpointRemoteControlSession *, id, void (*)(signed int, uint64_t, void (**)(_QWORD, _QWORD)), uint64_t);

  v6 = objc_msgSend(a4, "copy");
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  remoteControlSession = self->_remoteControlSession;
  v9 = *(void (**)(OpaqueFigEndpointRemoteControlSession *, id, void (*)(signed int, uint64_t, void (**)(_QWORD, _QWORD)), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v9)
    v9(remoteControlSession, a3, AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImplSendDataCompletion, v6);
}

- (void)close
{
  OpaqueFigEndpointRemoteControlSession *remoteControlSession;
  void (*v4)(OpaqueFigEndpointRemoteControlSession *, _QWORD, _QWORD);
  OpaqueFigEndpointRemoteControlSession *v5;
  void (*v6)(OpaqueFigEndpointRemoteControlSession *);

  remoteControlSession = self->_remoteControlSession;
  v4 = *(void (**)(OpaqueFigEndpointRemoteControlSession *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 16);
  if (v4)
    v4(remoteControlSession, 0, 0);
  v5 = self->_remoteControlSession;
  v6 = *(void (**)(OpaqueFigEndpointRemoteControlSession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v6)
    v6(v5);
}

- (AVOutputDeviceCommunicationChannel)parentChannel
{
  return (AVOutputDeviceCommunicationChannel *)objc_loadWeak((id *)&self->_parentChannel);
}

- (void)setParentChannel:(id)a3
{
  objc_storeWeak((id *)&self->_parentChannel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentChannel);
}

@end
