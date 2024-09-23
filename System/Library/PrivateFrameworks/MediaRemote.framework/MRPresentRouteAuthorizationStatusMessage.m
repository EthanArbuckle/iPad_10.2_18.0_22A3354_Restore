@implementation MRPresentRouteAuthorizationStatusMessage

- (MRPresentRouteAuthorizationStatusMessage)initWithRoute:(id)a3 status:(int)a4
{
  id v7;
  MRPresentRouteAuthorizationStatusMessage *v8;
  MRPresentRouteAuthorizationStatusMessage *v9;
  _MRPresentRouteAuthorizationStatusMessageProtobuf *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRPresentRouteAuthorizationStatusMessage;
  v8 = -[MRProtocolMessage init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_route, a3);
    v10 = objc_alloc_init(_MRPresentRouteAuthorizationStatusMessageProtobuf);
    -[MRAVOutputDevice descriptor](v9->_route, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPresentRouteAuthorizationStatusMessageProtobuf setRoute:](v10, "setRoute:", v11);

    if (a4 >= 0xA)
      v12 = 0xFFFFFFFFLL;
    else
      v12 = a4;
    -[_MRPresentRouteAuthorizationStatusMessageProtobuf setStatus:](v10, "setStatus:", v12);
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

- (int)status
{
  void *v2;
  unsigned int v3;
  int v4;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");
  if (v3 >= 0xA)
    v4 = -1;
  else
    v4 = v3;

  return v4;
}

- (unint64_t)type
{
  return 61;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
}

@end
