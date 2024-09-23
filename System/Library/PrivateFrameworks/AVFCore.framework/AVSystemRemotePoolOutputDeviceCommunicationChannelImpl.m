@implementation AVSystemRemotePoolOutputDeviceCommunicationChannelImpl

- (AVSystemRemotePoolOutputDeviceCommunicationChannelImpl)initWithDeviceID:(id)a3 channelUUID:(__CFString *)a4 outputContext:(id)a5
{
  AVSystemRemotePoolOutputDeviceCommunicationChannelImpl *v8;
  AVOutputContext *v9;
  uint64_t v10;
  __CFString *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVSystemRemotePoolOutputDeviceCommunicationChannelImpl;
  v8 = -[AVSystemRemotePoolOutputDeviceCommunicationChannelImpl init](&v13, sel_init);
  if (!v8)
    goto LABEL_10;
  v9 = (AVOutputContext *)a5;
  v8->_outputContext = v9;
  if (!v9)
    goto LABEL_10;
  if (!-[AVOutputContext figRoutingContext](v9, "figRoutingContext"))
    goto LABEL_10;
  v10 = objc_msgSend(a3, "copy");
  v8->_deviceID = (NSString *)v10;
  if (!v10)
    goto LABEL_10;
  if (!a4)
  {
    v8->_commChannelUUID = 0;
    goto LABEL_9;
  }
  v11 = (__CFString *)CFRetain(a4);
  v8->_commChannelUUID = v11;
  if (!v11)
  {
LABEL_10:
    a4 = 0;
    goto LABEL_9;
  }
  a4 = v8;
LABEL_9:

  return (AVSystemRemotePoolOutputDeviceCommunicationChannelImpl *)a4;
}

- (void)dealloc
{
  __CFString *commChannelUUID;
  objc_super v4;

  commChannelUUID = self->_commChannelUUID;
  if (commChannelUUID)
    CFRelease(commChannelUUID);

  v4.receiver = self;
  v4.super_class = (Class)AVSystemRemotePoolOutputDeviceCommunicationChannelImpl;
  -[AVSystemRemotePoolOutputDeviceCommunicationChannelImpl dealloc](&v4, sel_dealloc);
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigRoutingContext *v8;
  __CFString *commChannelUUID;
  NSString *deviceID;
  void (*v11)(OpaqueFigRoutingContext *, NSString *, __CFString *, id, void (*)(uint64_t, uint64_t, signed int, void (**)(_QWORD, _QWORD)), uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a4, "copy");
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = -[AVOutputContext figRoutingContext](self->_outputContext, "figRoutingContext", v12, v13);
  deviceID = self->_deviceID;
  commChannelUUID = self->_commChannelUUID;
  v11 = *(void (**)(OpaqueFigRoutingContext *, NSString *, __CFString *, id, void (*)(uint64_t, uint64_t, signed int, void (**)(_QWORD, _QWORD)), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 160);
  if (v11)
    v11(v8, deviceID, commChannelUUID, a3, AVSystemRemotePoolOutputDeviceCommunicationChannelSendDataCompletion, v6);
}

- (void)close
{
  OpaqueFigRoutingContext *v3;
  NSString *deviceID;
  __CFString *commChannelUUID;
  void (*v6)(OpaqueFigRoutingContext *, NSString *, __CFString *);

  v3 = -[AVOutputContext figRoutingContext](self->_outputContext, "figRoutingContext");
  deviceID = self->_deviceID;
  commChannelUUID = self->_commChannelUUID;
  v6 = *(void (**)(OpaqueFigRoutingContext *, NSString *, __CFString *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 168);
  if (v6)
    v6(v3, deviceID, commChannelUUID);
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
