@implementation CDMLVCRequestCommand

- (CDMLVCRequestCommand)initWithParserRequest:(id)a3 rewriteMsg:(id)a4 overridesInputs:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDMLVCRequestCommand *v12;
  CDMLVCRequestCommand *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CDMLVCRequestCommand;
  v12 = -[CDMBaseCommand init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parserRequest, a3);
    objc_storeStrong((id *)&v13->_rewriteMsg, a4);
    objc_storeStrong((id *)&v13->_overridesInputs, a5);
  }

  return v13;
}

- (SIRINLUINTERNALITFMITFMParserRequest)parserRequest
{
  return self->_parserRequest;
}

- (SIRINLUEXTERNALRewriteMessage)rewriteMsg
{
  return self->_rewriteMsg;
}

- (NSMutableArray)overridesInputs
{
  return self->_overridesInputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridesInputs, 0);
  objc_storeStrong((id *)&self->_rewriteMsg, 0);
  objc_storeStrong((id *)&self->_parserRequest, 0);
}

@end
