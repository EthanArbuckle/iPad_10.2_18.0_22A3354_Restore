@implementation CDPLocalSecret

- (CDPLocalSecret)initWithValidatedSecret:(id)a3 secretType:(unint64_t)a4
{
  id v7;
  CDPLocalSecret *v8;
  CDPLocalSecret *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPLocalSecret;
  v8 = -[CDPLocalSecret init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_validatedSecret, a3);
    v9->_secretType = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *validatedSecret;
  id v5;
  id v6;

  validatedSecret = self->_validatedSecret;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", validatedSecret, CFSTR("_validatedSecret"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_secretType);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_secretType"));

}

- (CDPLocalSecret)initWithCoder:(id)a3
{
  id v4;
  CDPLocalSecret *v5;
  uint64_t v6;
  NSString *validatedSecret;
  void *v8;

  v4 = a3;
  v5 = -[CDPLocalSecret init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_validatedSecret"));
    v6 = objc_claimAutoreleasedReturnValue();
    validatedSecret = v5->_validatedSecret;
    v5->_validatedSecret = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_secretType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_secretType = objc_msgSend(v8, "integerValue");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CDPLocalSecret initWithValidatedSecret:secretType:]([CDPLocalSecret alloc], "initWithValidatedSecret:secretType:", self->_validatedSecret, self->_secretType);
}

- (NSString)validatedSecret
{
  return self->_validatedSecret;
}

- (unint64_t)secretType
{
  return self->_secretType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedSecret, 0);
}

@end
