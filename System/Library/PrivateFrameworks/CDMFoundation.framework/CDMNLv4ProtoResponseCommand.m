@implementation CDMNLv4ProtoResponseCommand

- (CDMNLv4ProtoResponseCommand)initWithParserResponse:(id)a3 nluResponse:(id)a4
{
  id v7;
  id v8;
  CDMNLv4ProtoResponseCommand *v9;
  CDMNLv4ProtoResponseCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMNLv4ProtoResponseCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parserResponse, a3);
    objc_storeStrong((id *)&v10->_nluResponse, a4);
  }

  return v10;
}

- (SIRINLUINTERNALNLV4_PARSERNLv4ParserResponse)parserResponse
{
  return self->_parserResponse;
}

- (SIRINLUEXTERNALCDMNluResponse)nluResponse
{
  return self->_nluResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nluResponse, 0);
  objc_storeStrong((id *)&self->_parserResponse, 0);
}

@end
