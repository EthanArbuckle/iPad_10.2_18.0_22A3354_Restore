@implementation MRUnregisterGameControllerMessage

- (MRUnregisterGameControllerMessage)initWithControllerID:(unint64_t)a3
{
  MRUnregisterGameControllerMessage *v4;
  _MRUnregisterGameControllerMessageProtobuf *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUnregisterGameControllerMessage;
  v4 = -[MRProtocolMessage init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(_MRUnregisterGameControllerMessageProtobuf);
    -[_MRUnregisterGameControllerMessageProtobuf setControllerID:](v5, "setControllerID:", a3);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v4, "setUnderlyingCodableMessage:", v5);

  }
  return v4;
}

- (unint64_t)controllerID
{
  void *v2;
  unint64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "controllerID");

  return v3;
}

- (unint64_t)type
{
  return 21;
}

@end
