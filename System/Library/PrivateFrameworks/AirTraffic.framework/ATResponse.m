@implementation ATResponse

- (id)additionalDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ATResponse error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATResponse)initWithCoder:(id)a3
{
  id v4;
  ATResponse *v5;
  uint64_t v6;
  NSError *error;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATResponse;
  v5 = -[ATMessage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v5->_partial = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPartial"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATResponse;
  v4 = a3;
  -[ATMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[NSError msv_errorByRemovingUnsafeUserInfo](self->_error, "msv_errorByRemovingUnsafeUserInfo", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("error"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_partial, CFSTR("isPartial"));
}

- (BOOL)isPartial
{
  return self->_partial;
}

- (void)setPartial:(BOOL)a3
{
  self->_partial = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
