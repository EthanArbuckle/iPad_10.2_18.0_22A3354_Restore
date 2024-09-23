@implementation MRSetListeningModeMessage

- (MRSetListeningModeMessage)initWithListeningMode:(id)a3 outputDeviceUID:(id)a4
{
  id v6;
  id v7;
  _MRSetListeningModeMessageProtobuf *v8;
  MRSetListeningModeMessage *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_MRSetListeningModeMessageProtobuf);
  -[_MRSetListeningModeMessageProtobuf setListeningMode:](v8, "setListeningMode:", v7);

  -[_MRSetListeningModeMessageProtobuf setOutputDeviceUID:](v8, "setOutputDeviceUID:", v6);
  v9 = -[MRSetListeningModeMessage initWithUnderlyingCodableMessage:error:](self, "initWithUnderlyingCodableMessage:error:", v8, 0);

  return v9;
}

- (MRSetListeningModeMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6;
  MRSetListeningModeMessage *v7;
  uint64_t v8;
  NSString *listeningMode;
  uint64_t v10;
  NSString *outputDeviceUID;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRSetListeningModeMessage;
  v7 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](&v13, sel_initWithUnderlyingCodableMessage_error_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "listeningMode");
    v8 = objc_claimAutoreleasedReturnValue();
    listeningMode = v7->_listeningMode;
    v7->_listeningMode = (NSString *)v8;

    objc_msgSend(v6, "outputDeviceUID");
    v10 = objc_claimAutoreleasedReturnValue();
    outputDeviceUID = v7->_outputDeviceUID;
    v7->_outputDeviceUID = (NSString *)v10;

  }
  return v7;
}

- (unint64_t)type
{
  return 110;
}

- (NSString)listeningMode
{
  return self->_listeningMode;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong((id *)&self->_listeningMode, 0);
}

@end
