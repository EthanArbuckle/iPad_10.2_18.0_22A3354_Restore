@implementation SGXPCResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_error, CFSTR("error"));
}

- (SGXPCResponse)initWithCoder:(id)a3
{
  id v4;
  SGXPCResponse *v5;
  void *v6;
  uint64_t v7;
  NSError *error;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SGXPCResponse;
  v5 = -[SGXPCResponse init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("error"));
    v7 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v7;

  }
  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (SGXPCResponse)initWithError:(id)a3
{
  id v5;
  SGXPCResponse *v6;
  SGXPCResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGXPCResponse;
  v6 = -[SGXPCResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)response
{
  return (id)objc_opt_new();
}

+ (id)responseWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithError:", v4);

  return v5;
}

@end
