@implementation CDMMentionResolverRequestCommand

- (CDMMentionResolverRequestCommand)initWithMRRequest:(id)a3
{
  id v5;
  CDMMentionResolverRequestCommand *v6;
  CDMMentionResolverRequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMMentionResolverRequestCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mrRequest, a3);

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest dictionaryRepresentation](self->_mrRequest, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("embedding_tensor"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("matching_spans"));
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest)mrRequest
{
  return self->_mrRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mrRequest, 0);
}

@end
