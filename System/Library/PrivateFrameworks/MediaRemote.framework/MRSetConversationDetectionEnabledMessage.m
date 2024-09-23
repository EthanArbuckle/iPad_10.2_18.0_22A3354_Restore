@implementation MRSetConversationDetectionEnabledMessage

- (MRSetConversationDetectionEnabledMessage)initWithOutputDeviceUID:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _MRSetConversationDetectionEnabledMessageProtobuf *v7;
  MRSetConversationDetectionEnabledMessage *v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_MRSetConversationDetectionEnabledMessageProtobuf);
  -[_MRSetConversationDetectionEnabledMessageProtobuf setOutputDeviceUID:](v7, "setOutputDeviceUID:", v6);

  -[_MRSetConversationDetectionEnabledMessageProtobuf setEnabled:](v7, "setEnabled:", v4);
  v8 = -[MRSetConversationDetectionEnabledMessage initWithUnderlyingCodableMessage:error:](self, "initWithUnderlyingCodableMessage:error:", v7, 0);

  return v8;
}

- (MRSetConversationDetectionEnabledMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6;
  MRSetConversationDetectionEnabledMessage *v7;
  uint64_t v8;
  NSString *outputDeviceUID;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRSetConversationDetectionEnabledMessage;
  v7 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](&v11, sel_initWithUnderlyingCodableMessage_error_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "outputDeviceUID");
    v8 = objc_claimAutoreleasedReturnValue();
    outputDeviceUID = v7->_outputDeviceUID;
    v7->_outputDeviceUID = (NSString *)v8;

    v7->_enabled = objc_msgSend(v6, "enabled");
  }

  return v7;
}

- (unint64_t)type
{
  return 130;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

@end
