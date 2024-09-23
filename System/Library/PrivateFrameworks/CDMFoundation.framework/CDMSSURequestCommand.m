@implementation CDMSSURequestCommand

- (CDMSSURequestCommand)initWithParserRequest:(id)a3
{
  id v5;
  CDMSSURequestCommand *v6;
  CDMSSURequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSSURequestCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_parserRequest, a3);

  return v7;
}

- (SIRINLUINTERNALSSUSSURequest)parserRequest
{
  return self->_parserRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parserRequest, 0);
}

@end
