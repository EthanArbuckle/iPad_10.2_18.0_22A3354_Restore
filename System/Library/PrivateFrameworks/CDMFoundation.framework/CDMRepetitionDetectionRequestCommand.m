@implementation CDMRepetitionDetectionRequestCommand

- (CDMRepetitionDetectionRequestCommand)initWithQRRequest:(id)a3
{
  id v5;
  CDMRepetitionDetectionRequestCommand *v6;
  CDMRepetitionDetectionRequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMRepetitionDetectionRequestCommand;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qrRequest, 0);
}

@end
