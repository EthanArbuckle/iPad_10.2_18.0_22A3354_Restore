@implementation MRSetDiscoveryModeMessage

- (MRSetDiscoveryModeMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6;
  MRSetDiscoveryModeMessage *v7;
  MRAVRoutingDiscoverySessionConfiguration *v8;
  void *v9;
  uint64_t v10;
  MRAVRoutingDiscoverySessionConfiguration *configuration;
  MRAVRoutingDiscoverySessionConfiguration *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRSetDiscoveryModeMessage;
  v7 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](&v14, sel_initWithUnderlyingCodableMessage_error_, v6, a4);
  if (v7)
  {
    v7->_mode = objc_msgSend(v6, "mode");
    if (objc_msgSend(v6, "hasConfiguration"))
    {
      v8 = [MRAVRoutingDiscoverySessionConfiguration alloc];
      objc_msgSend(v6, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[MRAVRoutingDiscoverySessionConfiguration initWithProtobuf:](v8, "initWithProtobuf:", v9);
      configuration = v7->_configuration;
      v7->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v10;

LABEL_6:
      goto LABEL_7;
    }
    if (objc_msgSend(v6, "hasFeatures"))
    {
      v12 = -[MRAVRoutingDiscoverySessionConfiguration initWithEndpointFeatures:]([MRAVRoutingDiscoverySessionConfiguration alloc], "initWithEndpointFeatures:", objc_msgSend(v6, "features"));
      v9 = v7->_configuration;
      v7->_configuration = v12;
      goto LABEL_6;
    }
  }
LABEL_7:

  return v7;
}

- (MRSetDiscoveryModeMessage)initWithMode:(unsigned int)a3 configuration:(id)a4
{
  uint64_t v4;
  id v6;
  MRSetDiscoveryModeMessage *v7;
  MRSetDiscoveryModeMessage *v8;
  uint64_t v9;
  MRAVRoutingDiscoverySessionConfiguration *configuration;
  _MRSetDiscoveryModeProtobufMessage *v11;
  void *v12;
  objc_super v14;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRSetDiscoveryModeMessage;
  v7 = -[MRProtocolMessage init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_mode = v4;
    v9 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v9;

    v11 = objc_alloc_init(_MRSetDiscoveryModeProtobufMessage);
    -[_MRSetDiscoveryModeProtobufMessage setMode:](v11, "setMode:", v4);
    objc_msgSend(v6, "protobuf");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRSetDiscoveryModeProtobufMessage setConfiguration:](v11, "setConfiguration:", v12);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v8, "setUnderlyingCodableMessage:", v11);
  }

  return v8;
}

- (MRSetDiscoveryModeMessage)initWithMode:(unsigned int)a3 features:(unsigned int)a4
{
  uint64_t v4;
  MRAVRoutingDiscoverySessionConfiguration *v6;
  MRSetDiscoveryModeMessage *v7;

  v4 = *(_QWORD *)&a3;
  v6 = -[MRAVRoutingDiscoverySessionConfiguration initWithEndpointFeatures:]([MRAVRoutingDiscoverySessionConfiguration alloc], "initWithEndpointFeatures:", *(_QWORD *)&a4);
  v7 = -[MRSetDiscoveryModeMessage initWithMode:configuration:](self, "initWithMode:configuration:", v4, v6);

  return v7;
}

- (unint64_t)type
{
  return 101;
}

- (unsigned)mode
{
  return self->_mode;
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
