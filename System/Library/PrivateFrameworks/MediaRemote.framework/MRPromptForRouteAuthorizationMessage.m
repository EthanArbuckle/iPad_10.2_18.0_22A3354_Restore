@implementation MRPromptForRouteAuthorizationMessage

- (MRPromptForRouteAuthorizationMessage)initWithRoute:(id)a3 inputType:(int64_t)a4
{
  id v7;
  MRPromptForRouteAuthorizationMessage *v8;
  MRPromptForRouteAuthorizationMessage *v9;
  _MRPromptForRouteAuthorizationMessageProtobuf *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRPromptForRouteAuthorizationMessage;
  v8 = -[MRProtocolMessage init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_route, a3);
    v10 = objc_alloc_init(_MRPromptForRouteAuthorizationMessageProtobuf);
    objc_msgSend(v7, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPromptForRouteAuthorizationMessageProtobuf setRoute:](v10, "setRoute:", v11);

    if ((unint64_t)(a4 - 1) > 2)
      v12 = 0;
    else
      v12 = dword_193AD9BC0[a4 - 1];
    -[_MRPromptForRouteAuthorizationMessageProtobuf setInputType:](v10, "setInputType:", v12);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v9, "setUnderlyingCodableMessage:", v10);

  }
  return v9;
}

- (MRAVOutputDevice)route
{
  MRAVOutputDevice *route;
  MRAVDistantOutputDevice *v4;
  void *v5;
  void *v6;
  MRAVOutputDevice *v7;
  MRAVOutputDevice *v8;

  route = self->_route;
  if (!route)
  {
    v4 = [MRAVDistantOutputDevice alloc];
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "route");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MRAVDistantOutputDevice initWithDescriptor:](v4, "initWithDescriptor:", v6);
    v8 = self->_route;
    self->_route = v7;

    route = self->_route;
  }
  return route;
}

- (int64_t)inputType
{
  void *v2;
  unsigned int v3;
  int64_t v4;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inputType") - 1;
  if (v3 > 2)
    v4 = 0;
  else
    v4 = qword_193AD9BD0[v3];

  return v4;
}

- (unint64_t)type
{
  return 59;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
}

@end
