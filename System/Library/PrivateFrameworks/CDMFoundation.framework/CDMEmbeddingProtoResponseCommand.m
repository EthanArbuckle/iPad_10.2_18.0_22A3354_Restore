@implementation CDMEmbeddingProtoResponseCommand

- (CDMEmbeddingProtoResponseCommand)initWithResponse:(id)a3 embeddingConfigs:(id)a4
{
  id v7;
  id v8;
  CDMEmbeddingProtoResponseCommand *v9;
  CDMEmbeddingProtoResponseCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMEmbeddingProtoResponseCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_response, a3);
    objc_storeStrong((id *)&v10->_embeddingConfigs, a4);
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  CDMEmbeddingProtoResponseCommand *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CDMEmbeddingProtoResponseCommand *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _BYTE v31[128];
  uint64_t v32;

  v2 = self;
  v32 = *MEMORY[0x24BDAC8D0];
  v3 = 24;
  -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse embeddingTensorOutputs](self->_response, "embeddingTensorOutputs");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse embeddingTensorOutputs](v2->_response, "embeddingTensorOutputs"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        v7))
  {
    v8 = objc_alloc(MEMORY[0x24BDBCED8]);
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse embeddingTensorOutputs](v2->_response, "embeddingTensorOutputs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse embeddingTensorOutputs](v2->_response, "embeddingTensorOutputs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v24)
    {
      v22 = *(_QWORD *)v26;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
          v29[0] = CFSTR("numTokens");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)((char *)&v2->super.super.isa + v3), "numToken"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = v12;
          v29[1] = CFSTR("embeddingDim");
          v13 = v3;
          v14 = v2;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "embeddingDim"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v30[1] = v15;
          v29[2] = CFSTR("isStableModel");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "isStableEmbeddingsVersion"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v30[2] = v16;
          v29[3] = CFSTR("embeddingVersion");
          objc_msgSend(v11, "embeddingVersion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v30[3] = v17;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "embeddingVersion");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, v19);

          v2 = v14;
          v3 = v13;

          ++v10;
        }
        while (v24 != v10);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v24);
    }

  }
  else
  {
    v23 = 0;
  }
  return v23;
}

- (id)description
{
  void *v2;
  void *v3;

  -[CDMEmbeddingProtoResponseCommand dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CDMEmbeddingProtoResponseCommand)initWithCoder:(id)a3
{
  id v4;
  CDMEmbeddingProtoResponseCommand *v5;
  uint64_t v6;
  SIRINLUINTERNALEMBEDDINGEmbeddingResponse *response;
  uint64_t v8;
  CDMEmbeddingConfigs *embeddingConfigs;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMEmbeddingProtoResponseCommand;
  v5 = -[CDMBaseCommand initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("response"));
    v6 = objc_claimAutoreleasedReturnValue();
    response = v5->_response;
    v5->_response = (SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embeddingConfigs"));
    v8 = objc_claimAutoreleasedReturnValue();
    embeddingConfigs = v5->_embeddingConfigs;
    v5->_embeddingConfigs = (CDMEmbeddingConfigs *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDMEmbeddingProtoResponseCommand;
  v4 = a3;
  -[CDMBaseCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_response, CFSTR("response"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_embeddingConfigs, CFSTR("embeddingConfigs"));

}

- (SIRINLUINTERNALEMBEDDINGEmbeddingResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (CDMEmbeddingConfigs)embeddingConfigs
{
  return self->_embeddingConfigs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingConfigs, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
