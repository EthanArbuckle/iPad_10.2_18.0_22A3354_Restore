@implementation AVOutputDeviceAuthorizationRequest

- (AVOutputDeviceAuthorizationRequest)initWithOutputDeviceAuthorizationRequestImpl:(id)a3
{
  AVOutputDeviceAuthorizationRequest *v4;
  AVOutputDeviceAuthorizationRequestInternal *v5;
  AVOutputDeviceAuthorizationRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceAuthorizationRequest;
  v4 = -[AVOutputDeviceAuthorizationRequest init](&v8, sel_init);
  if (v4
    && (v5 = objc_alloc_init(AVOutputDeviceAuthorizationRequestInternal), (v4->_ivars = v5) != 0)
    && (v4->_ivars->impl = (AVOutputDeviceAuthorizationRequestImpl *)a3) != 0)
  {
    v4->_ivars->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.output-device-auth-session.ivars");
    v4->_ivars->status = 0;
    v4->_ivars->error = 0;
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
  AVOutputDeviceAuthorizationRequestInternal *ivars;
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
  v5.super_class = (Class)AVOutputDeviceAuthorizationRequest;
  -[AVOutputDeviceAuthorizationRequest dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, ID=%@, outputDevice=%@, tokenType=%@>"), NSStringFromClass(v4), self, -[AVOutputDeviceAuthorizationRequest ID](self, "ID"), -[AVOutputDeviceAuthorizationRequest outputDevice](self, "outputDevice"), -[AVOutputDeviceAuthorizationRequest authorizationTokenType](self, "authorizationTokenType"));
}

- (id)impl
{
  return self->_ivars->impl;
}

- (int64_t)status
{
  NSObject *ivarAccessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVOutputDeviceAuthorizationRequest_status__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVOutputDeviceAuthorizationRequest_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 24);
  return result;
}

- (NSError)error
{
  NSObject *ivarAccessQueue;
  NSError *v3;
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
  v5[2] = __43__AVOutputDeviceAuthorizationRequest_error__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVOutputDeviceAuthorizationRequest_error__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)ID
{
  return (NSString *)objc_msgSend(-[AVOutputDeviceAuthorizationRequest impl](self, "impl"), "ID");
}

- (AVOutputDevice)outputDevice
{
  return (AVOutputDevice *)objc_msgSend(-[AVOutputDeviceAuthorizationRequest impl](self, "impl"), "outputDevice");
}

- (NSString)authorizationTokenType
{
  return (NSString *)objc_msgSend(-[AVOutputDeviceAuthorizationRequest impl](self, "impl"), "authorizationTokenType");
}

- (void)respondWithAuthorizationToken:(id)a3 completionHandler:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];
  os_log_type_t type;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B01D0)
  {
    v13 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = -[AVOutputDeviceAuthorizationRequest impl](self, "impl", v9, v10);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__AVOutputDeviceAuthorizationRequest_respondWithAuthorizationToken_completionHandler___block_invoke;
  v11[3] = &unk_1E3032BF0;
  v11[4] = self;
  v11[5] = a4;
  objc_msgSend(v8, "respondWithAuthorizationToken:completionHandler:", a3, v11);
}

uint64_t __86__AVOutputDeviceAuthorizationRequest_respondWithAuthorizationToken_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD block[29];

  block[28] = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(*(_QWORD *)(v5 + 8) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__AVOutputDeviceAuthorizationRequest_respondWithAuthorizationToken_completionHandler___block_invoke_2;
  block[3] = &unk_1E302FEE0;
  block[5] = a3;
  block[6] = a2;
  block[4] = v5;
  av_readwrite_dispatch_queue_write(v6, block);
  if (dword_1EE2B01D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2 == 3);
}

uint64_t __86__AVOutputDeviceAuthorizationRequest_respondWithAuthorizationToken_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = result;
  return result;
}

- (void)cancel
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B01D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDeviceAuthorizationRequest impl](self, "impl", v4, v5), "cancel");
}

@end
