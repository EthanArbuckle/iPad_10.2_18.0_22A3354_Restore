@implementation CRKInvalidateTransportOperation

- (CRKInvalidateTransportOperation)initWithTransport:(id)a3
{
  id v5;
  CRKInvalidateTransportOperation *v6;
  CRKInvalidateTransportOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKInvalidateTransportOperation;
  v6 = -[CRKInvalidateTransportOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transport, a3);

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__CRKInvalidateTransportOperation_main__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __39__CRKInvalidateTransportOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  objc_msgSend(*(id *)(a1 + 32), "transport");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)transportDidInvalidate:(id)a3
{
  if (-[CRKInvalidateTransportOperation isExecuting](self, "isExecuting", a3))
    -[CRKInvalidateTransportOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

- (CATTransport)transport
{
  return self->_transport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
}

@end
