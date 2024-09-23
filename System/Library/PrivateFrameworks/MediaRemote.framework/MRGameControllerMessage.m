@implementation MRGameControllerMessage

- (MRGameControllerMessage)initWithGameControllerEvent:(id)a3 controllerID:(unint64_t)a4
{
  id v6;
  MRGameControllerMessage *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRGameControllerMessage;
  v7 = -[MRProtocolMessage init](&v9, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "setControllerID:", a4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v6);
  }

  return v7;
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
  return 18;
}

- (BOOL)shouldLog
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasMotion") ^ 1;

  return v3;
}

@end
