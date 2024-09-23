@implementation MRRegisterHIDDeviceResultMessage

- (MRRegisterHIDDeviceResultMessage)initWithErrorCode:(int64_t)a3 deviceIdentifier:(unint64_t)a4
{
  MRRegisterHIDDeviceResultMessage *v6;
  _MRRegisterHIDDeviceResultMessageProtobuf *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRRegisterHIDDeviceResultMessage;
  v6 = -[MRProtocolMessage init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(_MRRegisterHIDDeviceResultMessageProtobuf);
    -[_MRRegisterHIDDeviceResultMessageProtobuf setErrorCode:](v7, "setErrorCode:", a3);
    -[_MRRegisterHIDDeviceResultMessageProtobuf setDeviceIdentifier:](v7, "setDeviceIdentifier:", a4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v6, "setUnderlyingCodableMessage:", v7);

  }
  return v6;
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

- (unint64_t)deviceIdentifier
{
  void *v2;
  unint64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceIdentifier");

  return v3;
}

- (unint64_t)type
{
  return 7;
}

@end
