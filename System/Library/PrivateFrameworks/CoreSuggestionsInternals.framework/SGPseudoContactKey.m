@implementation SGPseudoContactKey

- (SGPseudoContactKey)initWithEmail:(id)a3
{
  void *v4;
  SGPseudoContactKey *v5;

  SGNormalizeEmailAddress();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SGPseudoContactKey initWithNormalizedEmail:](self, "initWithNormalizedEmail:", v4);

  return v5;
}

- (SGPseudoContactKey)initWithNormalizedEmail:(id)a3
{
  void *v4;
  SGPseudoContactKey *v5;

  +[SGIdentityKey keyForNormalizedEmail:](SGIdentityKey, "keyForNormalizedEmail:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SGPseudoContactKey initWithIdentityKey:](self, "initWithIdentityKey:", v4);

  return v5;
}

- (SGPseudoContactKey)initWithIdentityKey:(id)a3
{
  id v5;
  SGPseudoContactKey *v6;
  SGPseudoContactKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGPseudoContactKey;
  v6 = -[SGPseudoContactKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identityKey, a3);

  return v7;
}

- (SGPseudoContactKey)initWithSerialized:(id)a3
{
  id v5;
  SGIdentityKey *v6;
  SGPseudoContactKey *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPseudoContactKey.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serialized"));

  }
  v6 = -[SGIdentityKey initWithSerialized:]([SGIdentityKey alloc], "initWithSerialized:", v5);
  v7 = -[SGPseudoContactKey initWithIdentityKey:](self, "initWithIdentityKey:", v6);

  return v7;
}

- (id)serialize
{
  return -[SGIdentityKey serialize](self->_identityKey, "serialize");
}

- (unint64_t)hash
{
  return -[SGIdentityKey hash](self->_identityKey, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SGPseudoContactKey *v4;
  SGPseudoContactKey *v5;
  BOOL v6;

  v4 = (SGPseudoContactKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGPseudoContactKey isEqualToPseudoContactKey:](self, "isEqualToPseudoContactKey:", v5);

  return v6;
}

- (BOOL)isEqualToPseudoContactKey:(id)a3
{
  SGIdentityKey *v4;
  SGIdentityKey *v5;
  char v6;

  v4 = self->_identityKey;
  v5 = v4;
  if (v4 == *((SGIdentityKey **)a3 + 1))
    v6 = 1;
  else
    v6 = -[SGIdentityKey isEqual:](v4, "isEqual:");

  return v6;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[SGPseudoContactKey identityKey:%@]"), self->_identityKey);
}

- (SGIdentityKey)identityKey
{
  return self->_identityKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityKey, 0);
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  void *v7;

  if ((unint64_t)a3 < 0x1C)
    return (a3 & 0xFFFFFFF) == 4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGPseudoContactKey.m"), 100, CFSTR("Unknown entity type: %lu"), a3);

  return 0;
}

@end
