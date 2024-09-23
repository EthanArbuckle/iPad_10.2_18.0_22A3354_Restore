@implementation MRUpdateActiveSystemEndpointMessage

- (MRUpdateActiveSystemEndpointMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6;
  MRUpdateActiveSystemEndpointMessage *v7;
  MRUpdateActiveSystemEndpointRequest *v8;
  void *v9;
  uint64_t v10;
  MRUpdateActiveSystemEndpointRequest *request;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRUpdateActiveSystemEndpointMessage;
  v7 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](&v13, sel_initWithUnderlyingCodableMessage_error_, v6, a4);
  if (v7)
  {
    v8 = [MRUpdateActiveSystemEndpointRequest alloc];
    objc_msgSend(v6, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MRUpdateActiveSystemEndpointRequest initWithProtobuf:](v8, "initWithProtobuf:", v9);
    request = v7->_request;
    v7->_request = (MRUpdateActiveSystemEndpointRequest *)v10;

  }
  return v7;
}

- (MRUpdateActiveSystemEndpointMessage)initWithRequest:(id)a3
{
  id v5;
  MRUpdateActiveSystemEndpointMessage *v6;
  MRUpdateActiveSystemEndpointMessage *v7;
  _MRUpdateActiveSystemEndpointMessageProtobuf *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRUpdateActiveSystemEndpointMessage;
  v6 = -[MRProtocolMessage init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = objc_alloc_init(_MRUpdateActiveSystemEndpointMessageProtobuf);
    objc_msgSend(v5, "protobuf");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRUpdateActiveSystemEndpointMessageProtobuf setRequest:](v8, "setRequest:", v9);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v8);
  }

  return v7;
}

- (unint64_t)type
{
  return 77;
}

- (MRUpdateActiveSystemEndpointRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
