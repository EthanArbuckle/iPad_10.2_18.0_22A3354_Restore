@implementation AVOutputDeviceAuthorizationSession

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (id)sharedAuthorizationSession
{
  if (sharedAuthorizationSession_onceToken != -1)
    dispatch_once(&sharedAuthorizationSession_onceToken, &__block_literal_global_14);
  return (id)sharedAuthorizationSession_session;
}

void __64__AVOutputDeviceAuthorizationSession_sharedAuthorizationSession__block_invoke()
{
  OpaqueFigEndpointUIAgent *v0;
  AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *v1;

  v0 = +[AVFigEndpointUIAgentOutputContextManagerImpl copySharedEndpointUIAgent](AVFigEndpointUIAgentOutputContextManagerImpl, "copySharedEndpointUIAgent");
  v1 = -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl initWithFigEndpointUIAgent:]([AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl alloc], "initWithFigEndpointUIAgent:", v0);
  sharedAuthorizationSession_session = -[AVOutputDeviceAuthorizationSession initWithOutputDeviceAuthorizationSessionImpl:]([AVOutputDeviceAuthorizationSession alloc], "initWithOutputDeviceAuthorizationSessionImpl:", v1);
  AVOutputDeviceAuthorizationTokenTypePIN_block_invoke_notificationToken = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserverForName:object:queue:usingBlock:", 0x1E304D5F8, 0, 0, &__block_literal_global_21);

  if (v0)
    CFRelease(v0);
}

void __64__AVOutputDeviceAuthorizationSession_sharedAuthorizationSession__block_invoke_2()
{
  OpaqueFigEndpointUIAgent *v0;
  AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *v1;

  v0 = +[AVFigEndpointUIAgentOutputContextManagerImpl copySharedEndpointUIAgent](AVFigEndpointUIAgentOutputContextManagerImpl, "copySharedEndpointUIAgent");
  v1 = -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl initWithFigEndpointUIAgent:]([AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl alloc], "initWithFigEndpointUIAgent:", v0);
  objc_msgSend((id)sharedAuthorizationSession_session, "outputDeviceAuthorizationSessionImplDidExpireWithReplacementImpl:", v1);

  if (v0)
    CFRelease(v0);
}

- (AVOutputDeviceAuthorizationSession)initWithOutputDeviceAuthorizationSessionImpl:(id)a3
{
  AVOutputDeviceAuthorizationSession *v4;
  AVOutputDeviceAuthorizationSessionInternal *v5;
  AVOutputDeviceAuthorizationSession *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceAuthorizationSession;
  v4 = -[AVOutputDeviceAuthorizationSession init](&v8, sel_init);
  if (v4
    && (v5 = objc_alloc_init(AVOutputDeviceAuthorizationSessionInternal), (v4->_ivars = v5) != 0)
    && (v4->_ivars->impl = (AVOutputDeviceAuthorizationSessionImpl *)a3) != 0)
  {
    v4->_ivars->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.outputdeviceauthorizationsession.ivars");
    -[AVOutputDeviceAuthorizationSessionImpl setParentAuthorizationSession:](v4->_ivars->impl, "setParentAuthorizationSession:", v4);
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
  AVOutputDeviceAuthorizationSessionInternal *ivars;
  NSObject *ivarAccessQueue;
  objc_super v5;

  ivars = self->_ivars;
  if (ivars)
  {

    ivars = self->_ivars;
    ivarAccessQueue = ivars->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      ivars = self->_ivars;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVOutputDeviceAuthorizationSession;
  -[AVOutputDeviceAuthorizationSession dealloc](&v5, sel_dealloc);
}

- (id)impl
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__17;
  v10 = __Block_byref_object_dispose__17;
  v11 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVOutputDeviceAuthorizationSession_impl__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __42__AVOutputDeviceAuthorizationSession_impl__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (AVOutputDeviceAuthorizationSessionDelegate)delegate
{
  return (AVOutputDeviceAuthorizationSessionDelegate *)objc_loadWeak((id *)&self->_ivars->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_ivars->delegate, a3);
}

- (void)outputDeviceAuthorizationSessionImpl:(id)a3 didProvideAuthorizationRequest:(id)a4
{
  AVOutputDeviceAuthorizationSessionDelegate *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = -[AVOutputDeviceAuthorizationSession delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (dword_1EE2B01D0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[AVOutputDeviceAuthorizationSessionDelegate outputDeviceAuthorizationSession:didProvideAuthorizationRequest:](v6, "outputDeviceAuthorizationSession:didProvideAuthorizationRequest:", self, a4, v9, v10);
  }
  else if (dword_1EE2B01D0)
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)outputDeviceAuthorizationSessionImpl:(id)a3 shouldRetryAuthorizationRequest:(id)a4 reason:(id)a5
{
  AVOutputDeviceAuthorizationSessionDelegate *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = -[AVOutputDeviceAuthorizationSession delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (dword_1EE2B01D0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return -[AVOutputDeviceAuthorizationSessionDelegate outputDeviceAuthorizationSession:shouldRetryAuthorizationRequest:reason:](v8, "outputDeviceAuthorizationSession:shouldRetryAuthorizationRequest:reason:", self, a4, a5, v12, v13);
  }
  else
  {
    if (dword_1EE2B01D0)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
}

- (void)outputDeviceAuthorizationSessionImplDidExpireWithReplacementImpl:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  v12 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__AVOutputDeviceAuthorizationSession_outputDeviceAuthorizationSessionImplDidExpireWithReplacementImpl___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  objc_msgSend((id)v8[5], "setParentAuthorizationSession:", 0);
  objc_msgSend(a3, "setParentAuthorizationSession:", self);

  _Block_object_dispose(&v7, 8);
}

id __103__AVOutputDeviceAuthorizationSession_outputDeviceAuthorizationSessionImplDidExpireWithReplacementImpl___block_invoke(uint64_t a1)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24));

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)outputDeviceAuthorizationSessionWithEndpointUIAgent:(OpaqueFigEndpointUIAgent *)a3
{
  AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *v3;
  AVOutputDeviceAuthorizationSession *v4;

  v3 = -[AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl initWithFigEndpointUIAgent:]([AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl alloc], "initWithFigEndpointUIAgent:", a3);
  v4 = -[AVOutputDeviceAuthorizationSession initWithOutputDeviceAuthorizationSessionImpl:]([AVOutputDeviceAuthorizationSession alloc], "initWithOutputDeviceAuthorizationSessionImpl:", v3);

  return v4;
}

@end
