@implementation CDMOverridesProtoRequestCommand

- (CDMOverridesProtoRequestCommand)initWithRequest:(id)a3
{
  id v5;
  CDMOverridesProtoRequestCommand *v6;
  CDMOverridesProtoRequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMOverridesProtoRequestCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (SIRINLUINTERNALOVERRIDESOverridesRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
