@implementation CDMTokenizationProtoResponseCommand

- (CDMTokenizationProtoResponseCommand)initWithResponse:(id)a3
{
  id v5;
  CDMTokenizationProtoResponseCommand *v6;
  CDMTokenizationProtoResponseCommand *v7;
  uint64_t v8;
  NSArray *responses;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMTokenizationProtoResponseCommand;
  v6 = -[CDMBaseCommand init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_response, a3);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    responses = v7->_responses;
    v7->_responses = (NSArray *)v8;

  }
  return v7;
}

- (CDMTokenizationProtoResponseCommand)initWithResponses:(id)a3
{
  id v5;
  CDMTokenizationProtoResponseCommand *v6;
  uint64_t v7;
  SIRINLUINTERNALTOKENIZERTokenizerResponse *response;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDMTokenizationProtoResponseCommand;
  v6 = -[CDMBaseCommand init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    response = v6->_response;
    v6->_response = (SIRINLUINTERNALTOKENIZERTokenizerResponse *)v7;

    objc_storeStrong((id *)&v6->_responses, a3);
  }

  return v6;
}

- (CDMTokenizationProtoResponseCommand)initWithPreviousResponses:(id)a3 withPreviousSiriResponse:(id)a4
{
  id v7;
  id v8;
  CDMTokenizationProtoResponseCommand *v9;
  uint64_t v10;
  SIRINLUINTERNALTOKENIZERTokenizerResponse *response;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CDMTokenizationProtoResponseCommand;
  v9 = -[CDMBaseCommand init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    response = v9->_response;
    v9->_response = (SIRINLUINTERNALTOKENIZERTokenizerResponse *)v10;

    objc_storeStrong((id *)&v9->_responses, a3);
    objc_storeStrong((id *)&v9->_previousSiriResponseTokenResponses, a4);
  }

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;

  -[SIRINLUINTERNALTOKENIZERTokenizerResponse dictionaryRepresentation](self->_response, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SIRINLUINTERNALTOKENIZERTokenizerResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
  objc_storeStrong((id *)&self->_responses, a3);
}

- (NSArray)previousSiriResponseTokenResponses
{
  return self->_previousSiriResponseTokenResponses;
}

- (void)setPreviousSiriResponseTokenResponses:(id)a3
{
  objc_storeStrong((id *)&self->_previousSiriResponseTokenResponses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSiriResponseTokenResponses, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
