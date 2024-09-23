@implementation AVFigCommChannelUUIDOutputContextCommunicationChannelImpl

- (AVFigCommChannelUUIDOutputContextCommunicationChannelImpl)init
{
  return -[AVFigCommChannelUUIDOutputContextCommunicationChannelImpl initWithRoutingContext:commChannelUUID:](self, "initWithRoutingContext:commChannelUUID:", 0, 0);
}

- (AVFigCommChannelUUIDOutputContextCommunicationChannelImpl)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 commChannelUUID:(__CFString *)a4
{
  AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *v6;
  AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *v7;
  OpaqueFigRoutingContext *v8;
  __CFString *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVFigCommChannelUUIDOutputContextCommunicationChannelImpl;
  v6 = -[AVFigCommChannelUUIDOutputContextCommunicationChannelImpl init](&v11, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  if (!a3)
  {
    a4 = 0;
    v6->_routingContext = 0;
    goto LABEL_9;
  }
  v8 = (OpaqueFigRoutingContext *)CFRetain(a3);
  v7->_routingContext = v8;
  if (!v8)
    goto LABEL_10;
  if (!a4)
  {
    v7->_commChannelUUID = 0;
    goto LABEL_9;
  }
  v9 = (__CFString *)CFRetain(a4);
  v7->_commChannelUUID = v9;
  if (!v9)
  {
LABEL_10:
    a4 = 0;
    goto LABEL_9;
  }
  a4 = v7;
LABEL_9:

  return (AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *)a4;
}

- (void)dealloc
{
  OpaqueFigRoutingContext *routingContext;
  __CFString *commChannelUUID;
  objc_super v5;

  routingContext = self->_routingContext;
  if (routingContext)
    CFRelease(routingContext);
  commChannelUUID = self->_commChannelUUID;
  if (commChannelUUID)
    CFRelease(commChannelUUID);
  v5.receiver = self;
  v5.super_class = (Class)AVFigCommChannelUUIDOutputContextCommunicationChannelImpl;
  -[AVFigCommChannelUUIDOutputContextCommunicationChannelImpl dealloc](&v5, sel_dealloc);
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  __CFString *commChannelUUID;
  OpaqueFigRoutingContext *routingContext;
  void (*v11)(OpaqueFigRoutingContext *, __CFString *, id, void (*)(uint64_t, uint64_t, signed int, void (**)(_QWORD, _QWORD)), uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = objc_msgSend(a4, "copy", v12, v13);
  routingContext = self->_routingContext;
  commChannelUUID = self->_commChannelUUID;
  v11 = *(void (**)(OpaqueFigRoutingContext *, __CFString *, id, void (*)(uint64_t, uint64_t, signed int, void (**)(_QWORD, _QWORD)), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 120);
  if (v11)
    v11(routingContext, commChannelUUID, a3, AVFigRoutingContextSendDataCompletion, v8);
}

- (AVOutputContextCommunicationChannel)parentCommunicationChannel
{
  return (AVOutputContextCommunicationChannel *)objc_loadWeak((id *)&self->_parentChannel);
}

- (void)setParentCommunicationChannel:(id)a3
{
  objc_storeWeak((id *)&self->_parentChannel, a3);
}

- (__CFString)commChannelUUID
{
  return self->_commChannelUUID;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentChannel);
}

@end
