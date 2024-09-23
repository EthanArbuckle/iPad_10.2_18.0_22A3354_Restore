@implementation AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl

- (AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl)initWithFigEndpointUIAgent:(OpaqueFigEndpointUIAgent *)a3
{
  id v5;
  AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *v6;
  AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *v7;
  OpaqueFigEndpointUIAgent *v8;
  AVWeakReference *v9;
  OpaqueFigEndpointUIAgent *agent;
  void (*v11)(OpaqueFigEndpointUIAgent *, uint64_t);
  AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *v12;
  objc_super v14;

  v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v14.receiver = self;
  v14.super_class = (Class)AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl;
  v6 = -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl init](&v14, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  if (!a3)
  {
    v12 = 0;
    v6->_agent = 0;
    goto LABEL_8;
  }
  v8 = (OpaqueFigEndpointUIAgent *)CFRetain(a3);
  v7->_agent = v8;
  if (!v8)
  {
LABEL_9:
    v12 = 0;
    goto LABEL_8;
  }
  v9 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v7);
  v7->_weakObserver = v9;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v9, AVOutputDeviceAuthorizationSessionShowAuthPrompt, *MEMORY[0x1E0D48AE0], v7->_agent, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v7->_weakObserver, AVOutputDeviceAuthorizationSessionShowFinishedWithPrompt, *MEMORY[0x1E0D48AD0], v7->_agent, 0);
  agent = v7->_agent;
  v11 = *(void (**)(OpaqueFigEndpointUIAgent *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v11)
    v11(agent, 1);
  v12 = v7;
LABEL_8:

  return v12;
}

- (void)dealloc
{
  id v3;
  OpaqueFigEndpointUIAgent *agent;
  objc_super v5;

  if (self->_weakObserver)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVOutputDeviceAuthorizationSessionShowAuthPrompt, *MEMORY[0x1E0D48AE0], self->_agent);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVOutputDeviceAuthorizationSessionShowFinishedWithPrompt, *MEMORY[0x1E0D48AD0], self->_agent);
  }

  agent = self->_agent;
  if (agent)
    CFRelease(agent);
  v5.receiver = self;
  v5.super_class = (Class)AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl;
  -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl dealloc](&v5, sel_dealloc);
}

- (OpaqueFigEndpointUIAgent)figEndpointUIAgent
{
  return self->_agent;
}

- (void)_showAuthPromptWithUniqueID:(id)a3 routeDescriptor:(__CFDictionary *)a4 pinMode:(BOOL)a5 reason:(__CFString *)a6
{
  _BOOL4 v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVOutputDevice *v11;
  AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *v12;
  __CFString **v13;
  AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *v14;
  AVOutputDeviceAuthorizationRequest *v15;
  AVOutputDeviceAuthorizationRequest *v16;
  AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *v17;
  AVOutputDeviceAuthorizationRequest *v18;
  NSObject *v19;
  uint64_t v20;
  OpaqueFigEndpointUIAgent *agent;
  void (*v22)(OpaqueFigEndpointUIAgent *, _QWORD, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  if (!a6 && dword_1EE2B01D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (FigCFEqual())
  {
    v11 = +[AVOutputDevice outputDeviceWithRouteDescriptor:withRoutingContext:](AVOutputDevice, "outputDeviceWithRouteDescriptor:withRoutingContext:", a4, 0);
    v12 = [AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl alloc];
    v13 = &AVOutputDeviceAuthorizationTokenTypePIN;
    if (!v6)
      v13 = AVOutputDeviceAuthorizationTokenTypePassword;
    v14 = -[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl initWithID:outputDevice:authorizationTokenType:](v12, "initWithID:outputDevice:authorizationTokenType:", a3, v11, *v13, v23, v24);
    v15 = -[AVOutputDeviceAuthorizationRequest initWithOutputDeviceAuthorizationRequestImpl:]([AVOutputDeviceAuthorizationRequest alloc], "initWithOutputDeviceAuthorizationRequestImpl:", v14);
    -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl _startNewRequest:impl:](self, "_startNewRequest:impl:", v15, v14);

  }
  else if (FigCFEqual())
  {
    v16 = self->_currentRequest;
    if (-[AVOutputDeviceAuthorizationSession outputDeviceAuthorizationSessionImpl:shouldRetryAuthorizationRequest:reason:](-[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl parentAuthorizationSession](self, "parentAuthorizationSession"), "outputDeviceAuthorizationSessionImpl:shouldRetryAuthorizationRequest:reason:", self, v16, CFSTR("AVOutputDeviceAuthorizationRequestRetryReasonIncorrectAuthorizationToken")))
    {
      v17 = -[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl initWithID:outputDevice:authorizationTokenType:]([AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl alloc], "initWithID:outputDevice:authorizationTokenType:", -[AVOutputDeviceAuthorizationRequest ID](v16, "ID"), -[AVOutputDeviceAuthorizationRequest outputDevice](v16, "outputDevice"), -[AVOutputDeviceAuthorizationRequest authorizationTokenType](v16, "authorizationTokenType"));
      v18 = -[AVOutputDeviceAuthorizationRequest initWithOutputDeviceAuthorizationRequestImpl:]([AVOutputDeviceAuthorizationRequest alloc], "initWithOutputDeviceAuthorizationRequestImpl:", v17);
      -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl _notifyCurrentRequestOfTerminalStatus:error:](self, "_notifyCurrentRequestOfTerminalStatus:error:", 2, 0);
      -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl _startNewRequest:impl:](self, "_startNewRequest:impl:", v18, v17);

    }
    else
    {
      if (-[NSString isEqualToString:](-[AVOutputDeviceAuthorizationRequest authorizationTokenType](v16, "authorizationTokenType"), "isEqualToString:", CFSTR("AVOutputDeviceAuthorizationTokenTypePIN")))
      {
        v20 = -11908;
      }
      else
      {
        v20 = -11909;
      }
      -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl _notifyCurrentRequestOfTerminalStatus:error:](self, "_notifyCurrentRequestOfTerminalStatus:error:", 5, AVLocalizedError(CFSTR("AVFoundationErrorDomain"), v20, 0));
      agent = self->_agent;
      v22 = *(void (**)(OpaqueFigEndpointUIAgent *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 8);
      if (v22)
        v22(agent, 0, 1);
    }

  }
  else
  {
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)_startNewRequest:(id)a3 impl:(id)a4
{
  AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *v7;

  self->_currentRequest = (AVOutputDeviceAuthorizationRequest *)a3;
  v7 = (AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *)a4;
  self->_currentRequestImpl = v7;
  -[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl setParentAuthorizationSessionImpl:](v7, "setParentAuthorizationSessionImpl:", self);
  -[AVOutputDeviceAuthorizationSession outputDeviceAuthorizationSessionImpl:didProvideAuthorizationRequest:](-[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl parentAuthorizationSession](self, "parentAuthorizationSession"), "outputDeviceAuthorizationSessionImpl:didProvideAuthorizationRequest:", self, a3);
}

- (void)_notifyCurrentRequestOfTerminalStatus:(int64_t)a3 error:(id)a4
{
  -[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl enterTerminalStatus:error:](self->_currentRequestImpl, "enterTerminalStatus:error:", a3, a4);

  self->_currentRequestImpl = 0;
  self->_currentRequest = 0;
}

- (void)_finishedWithPrompt
{
  -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl _notifyCurrentRequestOfTerminalStatus:error:](self, "_notifyCurrentRequestOfTerminalStatus:error:", 3, 0);
}

- (void)outputDeviceAuthorizationRequestImpl:(id)a3 didRespondWithAuthorizationToken:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigEndpointUIAgent *agent;
  void (*v8)(OpaqueFigEndpointUIAgent *, id, _QWORD);

  if (dword_1EE2B01D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  agent = self->_agent;
  v8 = *(void (**)(OpaqueFigEndpointUIAgent *, id, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v8)
    v8(agent, a4, 0);
}

- (void)outputDeviceAuthorizationRequestImplDidCancel:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigEndpointUIAgent *agent;
  void (*v6)(OpaqueFigEndpointUIAgent *, _QWORD, uint64_t);

  if (dword_1EE2B01D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  agent = self->_agent;
  v6 = *(void (**)(OpaqueFigEndpointUIAgent *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 8);
  if (v6)
    v6(agent, 0, 1);
}

- (AVOutputDeviceAuthorizationSession)parentAuthorizationSession
{
  return (AVOutputDeviceAuthorizationSession *)objc_loadWeak((id *)&self->_parentSession);
}

- (void)setParentAuthorizationSession:(id)a3
{
  objc_storeWeak((id *)&self->_parentSession, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentSession);
}

@end
