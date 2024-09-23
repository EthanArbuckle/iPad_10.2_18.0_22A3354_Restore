@implementation CDMGenericSendCommand

- (CDMGenericSendCommand)initWithCDMNluResponse:(id)a3 clientId:(id)a4
{
  id v7;
  id v8;
  CDMGenericSendCommand *v9;
  CDMGenericSendCommand *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SIRINLUResponse *nluResponse;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CDMGenericSendCommand;
  v9 = -[CDMBaseCommand init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cdmNluResponse, a3);
    objc_storeStrong((id *)&v10->_clientId, a4);
    v11 = (void *)MEMORY[0x24BE9E348];
    objc_msgSend(v7, "objcProto");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertResponse:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    nluResponse = v10->_nluResponse;
    v10->_nluResponse = (SIRINLUResponse *)v13;

  }
  return v10;
}

- (CDMGenericSendCommand)initWithEmbeddingGraphResponse:(id)a3
{
  id v5;
  CDMGenericSendCommand *v6;
  CDMGenericSendCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMGenericSendCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_embeddingResponse, a3);

  return v7;
}

- (CDMGenericSendCommand)initWithSubwordEmbeddingResponse:(id)a3 clientId:(id)a4
{
  id v7;
  id v8;
  CDMGenericSendCommand *v9;
  CDMGenericSendCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMGenericSendCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subwordEmbeddingResponse, a3);
    objc_storeStrong((id *)&v10->_clientId, a4);
  }

  return v10;
}

- (CDMGenericSendCommand)initWithSsuInferenceGraphResponse:(id)a3
{
  id v5;
  CDMGenericSendCommand *v6;
  CDMGenericSendCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMGenericSendCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ssuInferenceResponse, a3);

  return v7;
}

- (CDMGenericSendCommand)initWithPlannerGraphResponse:(id)a3
{
  id v5;
  CDMGenericSendCommand *v6;
  CDMGenericSendCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMGenericSendCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_plannerResponse, a3);

  return v7;
}

- (CDMGenericSendCommand)initWithError:(id)a3 clientId:(id)a4
{
  id v6;
  id v7;
  CDMGenericSendCommand *v8;
  CDMGenericSendCommand *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CDMGenericSendCommand;
  v8 = -[CDMBaseCommand init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CDMBaseCommand setCmdError:](v8, "setCmdError:", v6);
    objc_storeStrong((id *)&v9->_clientId, a4);
  }

  return v9;
}

- (CDMGenericSendCommand)initWithPreprocessingWrapper:(id)a3 clientId:(id)a4
{
  id v7;
  id v8;
  CDMGenericSendCommand *v9;
  CDMGenericSendCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMGenericSendCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preprocessingWrapper, a3);
    objc_storeStrong((id *)&v10->_clientId, a4);
  }

  return v10;
}

- (CDMGenericSendCommand)initWithCoder:(id)a3
{
  id v4;
  CDMGenericSendCommand *v5;
  uint64_t v6;
  NSString *clientId;
  uint64_t v8;
  SIRINLUResponse *nluResponse;
  uint64_t v10;
  CDMNluResponse *cdmNluResponse;
  uint64_t v12;
  SIRINLUINTERNALPreprocessingWrapper *preprocessingWrapper;
  uint64_t v14;
  CDMEmbeddingGraphResponseCommand *embeddingResponse;
  uint64_t v16;
  SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse *subwordEmbeddingResponse;
  uint64_t v18;
  CDMSsuInferenceGraphResponseCommand *ssuInferenceResponse;
  uint64_t v20;
  CDMPlannerGraphResponseCommand *plannerResponse;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CDMGenericSendCommand;
  v5 = -[CDMBaseCommand init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientId"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientId = v5->_clientId;
    v5->_clientId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nluResponse"));
    v8 = objc_claimAutoreleasedReturnValue();
    nluResponse = v5->_nluResponse;
    v5->_nluResponse = (SIRINLUResponse *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cdmNluResponse"));
    v10 = objc_claimAutoreleasedReturnValue();
    cdmNluResponse = v5->_cdmNluResponse;
    v5->_cdmNluResponse = (CDMNluResponse *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preprocessingWrapper"));
    v12 = objc_claimAutoreleasedReturnValue();
    preprocessingWrapper = v5->_preprocessingWrapper;
    v5->_preprocessingWrapper = (SIRINLUINTERNALPreprocessingWrapper *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embeddingResponse"));
    v14 = objc_claimAutoreleasedReturnValue();
    embeddingResponse = v5->_embeddingResponse;
    v5->_embeddingResponse = (CDMEmbeddingGraphResponseCommand *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subwordEmbeddingResponse"));
    v16 = objc_claimAutoreleasedReturnValue();
    subwordEmbeddingResponse = v5->_subwordEmbeddingResponse;
    v5->_subwordEmbeddingResponse = (SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ssuInferenceResponse"));
    v18 = objc_claimAutoreleasedReturnValue();
    ssuInferenceResponse = v5->_ssuInferenceResponse;
    v5->_ssuInferenceResponse = (CDMSsuInferenceGraphResponseCommand *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plannerResponse"));
    v20 = objc_claimAutoreleasedReturnValue();
    plannerResponse = v5->_plannerResponse;
    v5->_plannerResponse = (CDMPlannerGraphResponseCommand *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientId;
  id v5;

  clientId = self->_clientId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientId, CFSTR("clientId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nluResponse, CFSTR("nluResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cdmNluResponse, CFSTR("cdmNluResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preprocessingWrapper, CFSTR("preprocessingWrapper"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_embeddingResponse, CFSTR("embeddingResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subwordEmbeddingResponse, CFSTR("subwordEmbeddingResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ssuInferenceResponse, CFSTR("ssuInferenceResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_plannerResponse, CFSTR("plannerResponse"));

}

- (NSString)clientId
{
  return self->_clientId;
}

- (SIRINLUResponse)nluResponse
{
  return self->_nluResponse;
}

- (CDMNluResponse)cdmNluResponse
{
  return self->_cdmNluResponse;
}

- (SIRINLUINTERNALPreprocessingWrapper)preprocessingWrapper
{
  return self->_preprocessingWrapper;
}

- (CDMEmbeddingGraphResponseCommand)embeddingResponse
{
  return self->_embeddingResponse;
}

- (SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse)subwordEmbeddingResponse
{
  return self->_subwordEmbeddingResponse;
}

- (CDMSsuInferenceGraphResponseCommand)ssuInferenceResponse
{
  return self->_ssuInferenceResponse;
}

- (CDMPlannerGraphResponseCommand)plannerResponse
{
  return self->_plannerResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plannerResponse, 0);
  objc_storeStrong((id *)&self->_ssuInferenceResponse, 0);
  objc_storeStrong((id *)&self->_subwordEmbeddingResponse, 0);
  objc_storeStrong((id *)&self->_embeddingResponse, 0);
  objc_storeStrong((id *)&self->_preprocessingWrapper, 0);
  objc_storeStrong((id *)&self->_cdmNluResponse, 0);
  objc_storeStrong((id *)&self->_nluResponse, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
