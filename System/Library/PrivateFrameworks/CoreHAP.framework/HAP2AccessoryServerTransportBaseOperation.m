@implementation HAP2AccessoryServerTransportBaseOperation

- (void)setTransport:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 280), 0);
}

- (HAP2AccessoryServerTransportBaseOperation)initWithName:(id)a3 transport:(id)a4
{
  id v7;
  HAP2AccessoryServerTransportBaseOperation *v8;
  HAP2AccessoryServerTransportBaseOperation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAP2AccessoryServerTransportBaseOperation;
  v8 = -[HAP2AsynchronousOperation initWithName:](&v11, sel_initWithName_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_transport, a4);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
}

@end
