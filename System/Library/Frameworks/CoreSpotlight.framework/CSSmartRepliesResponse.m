@implementation CSSmartRepliesResponse

- (CSSmartRepliesResponse)initWithResponses:(id)a3
{
  id v4;
  CSSmartRepliesResponse *v5;
  CSSmartRepliesResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSSmartRepliesResponse;
  v5 = -[CSSmartRepliesResponse init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CSSmartRepliesResponse setResponses:](v5, "setResponses:", v4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSmartRepliesResponse responses](self, "responses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("responses"));

}

- (CSSmartRepliesResponse)initWithCoder:(id)a3
{
  id v4;
  CSSmartRepliesResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSmartRepliesResponse;
  v5 = -[CSSmartRepliesResponse init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("responses"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSmartRepliesResponse setResponses:](v5, "setResponses:", v9);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSSmartRepliesResponse *v4;
  void *v5;
  CSSmartRepliesResponse *v6;

  v4 = [CSSmartRepliesResponse alloc];
  -[CSSmartRepliesResponse responses](self, "responses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CSSmartRepliesResponse initWithResponses:](v4, "initWithResponses:", v5);

  return v6;
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responses, 0);
}

@end
