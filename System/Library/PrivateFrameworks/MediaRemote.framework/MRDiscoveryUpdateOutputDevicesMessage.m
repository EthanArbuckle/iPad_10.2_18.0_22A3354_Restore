@implementation MRDiscoveryUpdateOutputDevicesMessage

- (MRDiscoveryUpdateOutputDevicesMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6;
  MRDiscoveryUpdateOutputDevicesMessage *v7;
  MRAVRoutingDiscoverySessionConfiguration *v8;
  void *v9;
  uint64_t v10;
  MRAVRoutingDiscoverySessionConfiguration *configuration;
  void *v12;
  uint64_t v13;
  NSArray *outputDevices;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRDiscoveryUpdateOutputDevicesMessage;
  v7 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](&v16, sel_initWithUnderlyingCodableMessage_error_, v6, a4);
  if (v7)
  {
    v8 = [MRAVRoutingDiscoverySessionConfiguration alloc];
    objc_msgSend(v6, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MRAVRoutingDiscoverySessionConfiguration initWithProtobuf:](v8, "initWithProtobuf:", v9);
    configuration = v7->_configuration;
    v7->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v10;

    objc_msgSend(v6, "outputDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mr_map:", &__block_literal_global_39);
    v13 = objc_claimAutoreleasedReturnValue();
    outputDevices = v7->_outputDevices;
    v7->_outputDevices = (NSArray *)v13;

  }
  return v7;
}

MRAVDistantOutputDevice *__80__MRDiscoveryUpdateOutputDevicesMessage_initWithUnderlyingCodableMessage_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVDistantOutputDevice *v3;

  v2 = a2;
  v3 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v2);

  return v3;
}

- (MRDiscoveryUpdateOutputDevicesMessage)initWithOutputDevices:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  MRDiscoveryUpdateOutputDevicesMessage *v8;
  uint64_t v9;
  NSArray *outputDevices;
  uint64_t v11;
  MRAVRoutingDiscoverySessionConfiguration *configuration;
  _MRDiscoveryUpdateOutputDevicesProtobufMessage *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MRDiscoveryUpdateOutputDevicesMessage;
  v8 = -[MRProtocolMessage init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    outputDevices = v8->_outputDevices;
    v8->_outputDevices = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v11;

    v13 = objc_alloc_init(_MRDiscoveryUpdateOutputDevicesProtobufMessage);
    objc_msgSend(v6, "mr_map:", &__block_literal_global_43);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    -[_MRDiscoveryUpdateOutputDevicesProtobufMessage setOutputDevices:](v13, "setOutputDevices:", v15);

    objc_msgSend(v7, "protobuf");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRDiscoveryUpdateOutputDevicesProtobufMessage setConfiguration:](v13, "setConfiguration:", v16);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v8, "setUnderlyingCodableMessage:", v13);
  }

  return v8;
}

uint64_t __77__MRDiscoveryUpdateOutputDevicesMessage_initWithOutputDevices_configuration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptor");
}

- (unint64_t)type
{
  return 109;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
}

@end
