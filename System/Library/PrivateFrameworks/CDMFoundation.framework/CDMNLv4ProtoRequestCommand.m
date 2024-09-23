@implementation CDMNLv4ProtoRequestCommand

- (CDMNLv4ProtoRequestCommand)initWithParserRequest:(id)a3 requestId:(id)a4
{
  id v7;
  id v8;
  CDMNLv4ProtoRequestCommand *v9;
  CDMNLv4ProtoRequestCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMNLv4ProtoRequestCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parserRequest, a3);
    objc_storeStrong((id *)&v10->_requestId, a4);
  }

  return v10;
}

- (SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest)parserRequest
{
  return self->_parserRequest;
}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_parserRequest, 0);
}

@end
