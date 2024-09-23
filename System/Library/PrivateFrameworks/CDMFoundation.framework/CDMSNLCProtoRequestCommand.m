@implementation CDMSNLCProtoRequestCommand

- (CDMSNLCProtoRequestCommand)initWithParserRequest:(id)a3 rewriteMsg:(id)a4
{
  id v7;
  id v8;
  CDMSNLCProtoRequestCommand *v9;
  CDMSNLCProtoRequestCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMSNLCProtoRequestCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parserRequest, a3);
    objc_storeStrong((id *)&v10->_rewriteMsg, a4);
  }

  return v10;
}

- (SIRINLUINTERNALITFMITFMParserRequest)parserRequest
{
  return self->_parserRequest;
}

- (SIRINLUEXTERNALRewriteMessage)rewriteMsg
{
  return self->_rewriteMsg;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewriteMsg, 0);
  objc_storeStrong((id *)&self->_parserRequest, 0);
}

@end
