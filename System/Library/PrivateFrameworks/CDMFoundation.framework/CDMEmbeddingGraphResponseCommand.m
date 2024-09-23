@implementation CDMEmbeddingGraphResponseCommand

- (CDMEmbeddingGraphResponseCommand)initWithEmbeddingProtoResponseCommand:(id)a3
{
  id v5;
  CDMEmbeddingGraphResponseCommand *v6;
  CDMEmbeddingGraphResponseCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMEmbeddingGraphResponseCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_embeddingProtoResponseCommand, a3);

  return v7;
}

- (CDMEmbeddingGraphResponseCommand)initWithCoder:(id)a3
{
  id v4;
  CDMEmbeddingGraphResponseCommand *v5;
  uint64_t v6;
  CDMEmbeddingProtoResponseCommand *embeddingProtoResponseCommand;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMEmbeddingGraphResponseCommand;
  v5 = -[CDMServiceGraphCommand initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embeddingProtoResponseCommand"));
    v6 = objc_claimAutoreleasedReturnValue();
    embeddingProtoResponseCommand = v5->_embeddingProtoResponseCommand;
    v5->_embeddingProtoResponseCommand = (CDMEmbeddingProtoResponseCommand *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CDMEmbeddingGraphResponseCommand;
  -[CDMServiceGraphCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_embeddingProtoResponseCommand, CFSTR("embeddingProtoResponseCommand"));

}

- (id)convertResponseToSubwordResponse
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE9E338];
  -[CDMEmbeddingGraphResponseCommand embeddingProtoResponseCommand](self, "embeddingProtoResponseCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertToSubwordEmbeddingResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CDMEmbeddingProtoResponseCommand)embeddingProtoResponseCommand
{
  return self->_embeddingProtoResponseCommand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingProtoResponseCommand, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)serviceGraphName
{
  return CFSTR("CDMEmbeddingServiceGraph");
}

@end
