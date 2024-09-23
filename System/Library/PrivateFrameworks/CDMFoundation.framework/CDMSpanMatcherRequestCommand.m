@implementation CDMSpanMatcherRequestCommand

- (CDMSpanMatcherRequestCommand)initWithRequest:(id)a3
{
  void *v4;
  CDMSpanMatcherRequestCommand *v5;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CDMSpanMatcherRequestCommand initWithRequests:](self, "initWithRequests:", v4);

  return v5;
}

- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CDMSpanMatcherRequestCommand *v7;

  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDMSpanMatcherRequestCommand initWithRequests:asrHypothesis:selfMetadata:](self, "initWithRequests:asrHypothesis:selfMetadata:", v5, v6, 0);

  return v7;
}

- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3 asrHypothesis:(id)a4
{
  return -[CDMSpanMatcherRequestCommand initWithRequests:asrHypothesis:selfMetadata:](self, "initWithRequests:asrHypothesis:selfMetadata:", a3, a4, 0);
}

- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3 selfMetadata:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CDMSpanMatcherRequestCommand *v10;

  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CDMSpanMatcherRequestCommand initWithRequests:asrHypothesis:selfMetadata:](self, "initWithRequests:asrHypothesis:selfMetadata:", v8, v9, v7);

  return v10;
}

- (CDMSpanMatcherRequestCommand)initWithRequests:(id)a3 asrHypothesis:(id)a4 selfMetadata:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDMSpanMatcherRequestCommand *v12;
  CDMSpanMatcherRequestCommand *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CDMSpanMatcherRequestCommand;
  v12 = -[CDMBaseCommand init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_spanMatchRequests, a3);
    objc_storeStrong((id *)&v13->_asrHypothesis, a4);
    objc_storeStrong((id *)&v13->_selfMetadata, a5);
  }

  return v13;
}

- (NSArray)spanMatchRequests
{
  return self->_spanMatchRequests;
}

- (void)setSpanMatchRequests:(id)a3
{
  objc_storeStrong((id *)&self->_spanMatchRequests, a3);
}

- (NSArray)asrHypothesis
{
  return self->_asrHypothesis;
}

- (void)setAsrHypothesis:(id)a3
{
  objc_storeStrong((id *)&self->_asrHypothesis, a3);
}

- (NLXSchemaNLXClientEventMetadata)selfMetadata
{
  return self->_selfMetadata;
}

- (void)setSelfMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_selfMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfMetadata, 0);
  objc_storeStrong((id *)&self->_asrHypothesis, 0);
  objc_storeStrong((id *)&self->_spanMatchRequests, 0);
}

@end
