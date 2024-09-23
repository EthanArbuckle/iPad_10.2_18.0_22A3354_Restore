@implementation AVOutputContextCommunicationChannel

- (AVOutputContextCommunicationChannel)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available"), v2, v3, v4, v5, v6, v8), 0);
  objc_exception_throw(v7);
}

- (AVOutputContextCommunicationChannel)initWithOutputContextCommunicationChannelImpl:(id)a3
{
  AVOutputContextCommunicationChannel *v4;
  AVOutputContextCommunicationChannelInternal *v5;
  AVOutputContextCommunicationChannelImpl *impl;
  AVOutputContextCommunicationChannel *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVOutputContextCommunicationChannel;
  v4 = -[AVOutputContextCommunicationChannel init](&v9, sel_init);
  if (v4
    && (v5 = objc_alloc_init(AVOutputContextCommunicationChannelInternal), (v4->_ivars = v5) != 0)
    && (v4->_ivars->impl = (AVOutputContextCommunicationChannelImpl *)a3, (impl = v4->_ivars->impl) != 0))
  {
    -[AVOutputContextCommunicationChannelImpl setParentCommunicationChannel:](impl, "setParentCommunicationChannel:", v4);
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  AVOutputContextCommunicationChannelInternal *ivars;
  objc_super v4;

  ivars = self->_ivars;
  if (ivars)
  {

    ivars = self->_ivars;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVOutputContextCommunicationChannel;
  -[AVOutputContextCommunicationChannel dealloc](&v4, sel_dealloc);
}

- (AVOutputContextCommunicationChannelImpl)impl
{
  return self->_ivars->impl;
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputContextCommunicationChannelImpl sendData:completionHandler:](-[AVOutputContextCommunicationChannel impl](self, "impl", v8, v9), "sendData:completionHandler:", a3, a4);
}

- (__CFString)commChannelUUID
{
  AVOutputContextCommunicationChannelImpl *v2;

  v2 = -[AVOutputContextCommunicationChannel impl](self, "impl");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (__CFString *)-[AVOutputContextCommunicationChannelImpl commChannelUUID](v2, "commChannelUUID");
  else
    return 0;
}

@end
