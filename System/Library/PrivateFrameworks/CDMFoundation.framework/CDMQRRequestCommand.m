@implementation CDMQRRequestCommand

- (CDMQRRequestCommand)initWithQRRequest:(id)a3
{
  id v5;
  CDMQRRequestCommand *v6;
  CDMQRRequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMQRRequestCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_qrRequest, a3);

  return v7;
}

- (SIRINLUINTERNALQUERYREWRITEQRRequest)qrRequest
{
  return self->_qrRequest;
}

- (void)setQrRequest:(id)a3
{
  objc_storeStrong((id *)&self->_qrRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qrRequest, 0);
}

@end
