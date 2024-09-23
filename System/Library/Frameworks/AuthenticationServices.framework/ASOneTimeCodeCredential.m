@implementation ASOneTimeCodeCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)credentialWithCode:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCode:", v4);

  return v5;
}

- (ASOneTimeCodeCredential)initWithCode:(id)a3
{
  id v4;
  ASOneTimeCodeCredential *v5;
  uint64_t v6;
  NSString *code;
  ASOneTimeCodeCredential *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASOneTimeCodeCredential;
  v5 = -[ASOneTimeCodeCredential init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    code = v5->_code;
    v5->_code = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (ASOneTimeCodeCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASOneTimeCodeCredential *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ASOneTimeCodeCredential initWithCode:](self, "initWithCode:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_code, CFSTR("code"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCode:", self->_code);
}

- (BOOL)isEqual:(id)a3
{
  ASOneTimeCodeCredential *v4;
  NSString *code;
  void *v6;
  char v7;

  v4 = (ASOneTimeCodeCredential *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      code = self->_code;
      -[ASOneTimeCodeCredential code](v4, "code");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqualToString:](code, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_code, "hash");
}

- (NSString)code
{
  return self->_code;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_code, 0);
}

@end
