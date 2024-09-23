@implementation MRRegisterVoiceInputDeviceResponseMessage

- (MRRegisterVoiceInputDeviceResponseMessage)initWithDeviceID:(unsigned int)a3 errorCode:(int64_t)a4
{
  uint64_t v5;
  MRRegisterVoiceInputDeviceResponseMessage *v6;
  _MRRegisterVoiceInputDeviceResponseMessageProtobuf *v7;
  objc_super v9;

  v5 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)MRRegisterVoiceInputDeviceResponseMessage;
  v6 = -[MRProtocolMessage init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(_MRRegisterVoiceInputDeviceResponseMessageProtobuf);
    -[_MRRegisterVoiceInputDeviceResponseMessageProtobuf setDeviceID:](v7, "setDeviceID:", v5);
    -[_MRRegisterVoiceInputDeviceResponseMessageProtobuf setErrorCode:](v7, "setErrorCode:", a4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v6, "setUnderlyingCodableMessage:", v7);

  }
  return v6;
}

- (unint64_t)type
{
  return 29;
}

- (unsigned)deviceID
{
  void *v2;
  unsigned int v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceID");

  return v3;
}

- (int64_t)errorCode
{
  void *v2;
  int64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "errorCode");

  return v3;
}

@end
