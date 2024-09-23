@implementation _BMXPCConnection

- (id)_initWithConnection:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _BMXPCTransport *v8;
  id *v9;
  id *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = -[_BMXPCTransport initWithConnection:]([_BMXPCTransport alloc], "initWithConnection:", v7);

  v12.receiver = self;
  v12.super_class = (Class)_BMXPCConnection;
  v9 = (id *)-[_BMXPCConnection _initWithCustomTransport:](&v12, sel__initWithCustomTransport_, v8);
  v10 = v9;
  if (v9)
  {
    if (v6)
      objc_msgSend(v9, "_setQueue:", v6);
    objc_storeStrong(v10 + 20, v8);
  }

  return v10;
}

- (void)_setTargetUserIdentifier:(unsigned int)a3
{
  -[_BMXPCTransport _setTargetUserIdentifier:](self->_transport, "_setTargetUserIdentifier:", *(_QWORD *)&a3);
}

- (id)bm_transport
{
  return self->_transport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
}

@end
