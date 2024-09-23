@implementation CDMCATIProtoRequestCommand

- (CDMCATIProtoRequestCommand)initWithRequest:(id)a3
{
  id v5;
  CDMCATIProtoRequestCommand *v6;
  CDMCATIProtoRequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMCATIProtoRequestCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (SIRINLUINTERNALCATICATIRequest)request
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
