@implementation AKPersistRecoveryKeyContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKPersistRecoveryKeyContext)initWithCoder:(id)a3
{
  id v4;
  AKPersistRecoveryKeyContext *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKPersistRecoveryKeyContext;
  v5 = -[AKPersistRecoveryKeyContext init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_verifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKPersistRecoveryKeyContext setVerifier:](v5, "setVerifier:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_keyType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKPersistRecoveryKeyContext setKeyType:](v5, "setKeyType:", objc_msgSend(v12, "unsignedIntegerValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AKPersistRecoveryKeyContext verifier](self, "verifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_verifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AKPersistRecoveryKeyContext keyType](self, "keyType"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_keyType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  AKPersistRecoveryKeyContext *v4;
  uint64_t v5;
  NSDictionary *verifier;

  v4 = -[AKPersistRecoveryKeyContext init](+[AKPersistRecoveryKeyContext allocWithZone:](AKPersistRecoveryKeyContext, "allocWithZone:", a3), "init");
  -[AKPersistRecoveryKeyContext verifier](self, "verifier");
  v5 = objc_claimAutoreleasedReturnValue();
  verifier = v4->_verifier;
  v4->_verifier = (NSDictionary *)v5;

  v4->_keyType = -[AKPersistRecoveryKeyContext keyType](self, "keyType");
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AKPersistRecoveryKeyContext verifier](self, "verifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AKPersistRecoveryKeyContext:\nVerifier: %@\nKeyType: %lu"), v4, -[AKPersistRecoveryKeyContext keyType](self, "keyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)verifier
{
  return self->_verifier;
}

- (void)setVerifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)keyType
{
  return self->_keyType;
}

- (void)setKeyType:(unint64_t)a3
{
  self->_keyType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifier, 0);
}

@end
