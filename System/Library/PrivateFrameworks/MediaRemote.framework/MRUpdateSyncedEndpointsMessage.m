@implementation MRUpdateSyncedEndpointsMessage

- (MRUpdateSyncedEndpointsMessage)initWithEndpoints:(id)a3 endpointFeature:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  MRUpdateSyncedEndpointsMessage *v7;
  _MRUpdateEndpointsMessageProtobuf *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRUpdateSyncedEndpointsMessage;
  v7 = -[MRProtocolMessage init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(_MRUpdateEndpointsMessageProtobuf);
    objc_msgSend(v6, "mr_map:", &__block_literal_global_61);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    -[_MRUpdateEndpointsMessageProtobuf setEndpoints:](v8, "setEndpoints:", v10);

    -[_MRUpdateEndpointsMessageProtobuf setEndpointFeatures:](v8, "setEndpointFeatures:", v4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v8);

  }
  return v7;
}

uint64_t __68__MRUpdateSyncedEndpointsMessage_initWithEndpoints_endpointFeature___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptor");
}

- (NSArray)endpoints
{
  NSArray *endpoints;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  endpoints = self->_endpoints;
  if (!endpoints)
  {
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mr_map:", &__block_literal_global_63);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_endpoints;
    self->_endpoints = v6;

    endpoints = self->_endpoints;
  }
  return endpoints;
}

MRAVDistantEndpoint *__43__MRUpdateSyncedEndpointsMessage_endpoints__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVDistantEndpoint *v3;

  v2 = a2;
  v3 = -[MRAVDistantEndpoint initWithDescriptor:]([MRAVDistantEndpoint alloc], "initWithDescriptor:", v2);

  return v3;
}

- (unsigned)features
{
  void *v2;
  unsigned int v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "endpointFeatures");

  return v3;
}

- (unint64_t)type
{
  return 102;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
}

@end
