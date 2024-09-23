@implementation CDMCATIProtoResponseCommand

- (CDMCATIProtoResponseCommand)initWithResponse:(id)a3
{
  id v5;
  CDMCATIProtoResponseCommand *v6;
  CDMCATIProtoResponseCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMCATIProtoResponseCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_response, a3);

  return v7;
}

- (SIRINLUINTERNALCATICATIResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end
