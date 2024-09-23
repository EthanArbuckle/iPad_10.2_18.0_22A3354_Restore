@implementation MRGameControllerPropertiesMessage

- (MRGameControllerPropertiesMessage)initWithGameControllerProperties:(id)a3 controllerID:(unint64_t)a4
{
  id v6;
  MRGameControllerPropertiesMessage *v7;
  _MRGameControllerPropertiesMessageProtobuf *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRGameControllerPropertiesMessage;
  v7 = -[MRProtocolMessage init](&v10, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(_MRGameControllerPropertiesMessageProtobuf);
    -[_MRGameControllerPropertiesMessageProtobuf setProperties:](v8, "setProperties:", v6);
    -[_MRGameControllerPropertiesMessageProtobuf setControllerID:](v8, "setControllerID:", a4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v8);

  }
  return v7;
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
  return 35;
}

@end
