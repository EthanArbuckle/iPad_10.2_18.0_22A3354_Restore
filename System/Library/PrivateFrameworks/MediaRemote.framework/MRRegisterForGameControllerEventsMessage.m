@implementation MRRegisterForGameControllerEventsMessage

- (MRRegisterForGameControllerEventsMessage)initWithInputMode:(unsigned int)a3
{
  char v3;
  MRRegisterForGameControllerEventsMessage *v4;
  _MRRegisterForGameControllerEventsMessageProtobuf *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRRegisterForGameControllerEventsMessage;
  v4 = -[MRProtocolMessage init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(_MRRegisterForGameControllerEventsMessageProtobuf);
    -[_MRRegisterForGameControllerEventsMessageProtobuf setInputModeFlags:](v5, "setInputModeFlags:", MRProtobufFromGameControllerInputMode(v3));
    -[MRProtocolMessage setUnderlyingCodableMessage:](v4, "setUnderlyingCodableMessage:", v5);

  }
  return v4;
}

- (unsigned)inputMode
{
  void *v2;
  unsigned int v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MRGameControllerInputModeFromProtobuf(objc_msgSend(v2, "inputModeFlags"));

  return v3;
}

- (unint64_t)type
{
  return 22;
}

@end
