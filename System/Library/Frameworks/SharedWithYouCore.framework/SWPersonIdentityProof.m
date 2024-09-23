@implementation SWPersonIdentityProof

+ (SWPersonIdentityProof)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (SWPersonIdentityProof *)+[SWPersonIdentityProof allocWithZone:](_SWPersonIdentityProof, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SWPersonIdentityProof;
  return (SWPersonIdentityProof *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (SWPersonIdentityProof)initWithInclusionHashes:(id)a3
{
  id v5;
  SWPersonIdentityProof *v6;
  SWPersonIdentityProof *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWPersonIdentityProof;
  v6 = -[SWPersonIdentityProof init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inclusionHashes, a3);

  return v7;
}

- (SWPersonIdentityProof)initWithInclusionHashes:(id)a3 publicKey:(id)a4 localKeyIndex:(unint64_t)a5
{
  id v9;
  SWPersonIdentityProof *v10;
  SWPersonIdentityProof *v11;

  v9 = a4;
  v10 = -[SWPersonIdentityProof initWithInclusionHashes:](self, "initWithInclusionHashes:", a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_publicKey, a4);
    v11->_localKeyIndex = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;

  v4 = a3;
  -[SWPersonIdentityProof inclusionHashes](self, "inclusionHashes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_inclusionHashes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SWPersonIdentityProof publicKey](self, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_publicKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[SWPersonIdentityProof localKeyIndex](self, "localKeyIndex");
  NSStringFromSelector(sel_localKeyIndex);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

}

- (SWPersonIdentityProof)initWithCoder:(id)a3
{
  id v4;
  SWPersonIdentityProof *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *inclusionHashes;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSData *publicKey;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SWPersonIdentityProof;
  v5 = -[SWPersonIdentityProof init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_inclusionHashes);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    inclusionHashes = v5->_inclusionHashes;
    v5->_inclusionHashes = (NSArray *)v10;

    v12 = objc_opt_class();
    NSStringFromSelector(sel_publicKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v14;

    NSStringFromSelector(sel_localKeyIndex);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localKeyIndex = objc_msgSend(v4, "decodeIntegerForKey:", v16);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SWPersonIdentityProof inclusionHashes](self, "inclusionHashes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithInclusionHashes:", v5);

  -[SWPersonIdentityProof publicKey](self, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPublicKey:", v7);

  objc_msgSend(v6, "setLocalKeyIndex:", -[SWPersonIdentityProof localKeyIndex](self, "localKeyIndex"));
  return v6;
}

- (NSArray)inclusionHashes
{
  return self->_inclusionHashes;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)localKeyIndex
{
  return self->_localKeyIndex;
}

- (void)setLocalKeyIndex:(unint64_t)a3
{
  self->_localKeyIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_inclusionHashes, 0);
}

@end
