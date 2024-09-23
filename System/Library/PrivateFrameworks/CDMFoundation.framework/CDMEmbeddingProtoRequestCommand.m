@implementation CDMEmbeddingProtoRequestCommand

- (CDMEmbeddingProtoRequestCommand)initWithRequest:(id)a3
{
  id v5;
  CDMEmbeddingProtoRequestCommand *v6;
  CDMEmbeddingProtoRequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMEmbeddingProtoRequestCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (SIRINLUINTERNALEMBEDDINGEmbeddingRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
