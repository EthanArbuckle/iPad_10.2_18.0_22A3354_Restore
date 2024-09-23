@implementation MRRegisterGameControllerMessage

- (MRRegisterGameControllerMessage)initWithProperties:(id)a3
{
  id v4;
  MRRegisterGameControllerMessage *v5;
  _MRRegisterGameControllerMessageProtobuf *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRRegisterGameControllerMessage;
  v5 = -[MRProtocolMessage init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRRegisterGameControllerMessageProtobuf);
    -[_MRRegisterGameControllerMessageProtobuf setProperties:](v6, "setProperties:", v4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

  }
  return v5;
}

- (_MRGameControllerPropertiesProtobuf)properties
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_MRGameControllerPropertiesProtobuf *)v3;
}

- (unint64_t)type
{
  return 19;
}

@end
