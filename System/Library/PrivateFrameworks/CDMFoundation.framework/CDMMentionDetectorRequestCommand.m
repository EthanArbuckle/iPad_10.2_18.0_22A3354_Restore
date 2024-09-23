@implementation CDMMentionDetectorRequestCommand

- (CDMMentionDetectorRequestCommand)initWithMDRequest:(id)a3 withCurrTurn:(id)a4
{
  id v7;
  id v8;
  CDMMentionDetectorRequestCommand *v9;
  CDMMentionDetectorRequestCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMMentionDetectorRequestCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mdRequest, a3);
    objc_storeStrong((id *)&v10->_turnInput, a4);
  }

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest dictionaryRepresentation](self->_mdRequest, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("embedding_tensor"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("matching_spans"));
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest)mdRequest
{
  return self->_mdRequest;
}

- (SIRINLUEXTERNALTurnInput)turnInput
{
  return self->_turnInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnInput, 0);
  objc_storeStrong((id *)&self->_mdRequest, 0);
}

@end
