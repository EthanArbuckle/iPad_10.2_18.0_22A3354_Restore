@implementation IDSSigningOptions

- (IDSSigningOptions)init
{
  double v2;

  return (IDSSigningOptions *)objc_msgSend_initWithKeyType_diversifier_(self, a2, 0, v2, 0);
}

- (IDSSigningOptions)initWithKeyType:(unsigned int)a3 diversifier:(id)a4
{
  id v7;
  IDSSigningOptions *v8;
  IDSSigningOptions *v9;
  IDSSigningOptions *v10;
  objc_super v12;

  v7 = a4;
  if (IDSIsValidSigningKeyType(a3))
  {
    v12.receiver = self;
    v12.super_class = (Class)IDSSigningOptions;
    v8 = -[IDSSigningOptions init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_keyType = a3;
      objc_storeStrong((id *)&v8->_keyDiversifier, a4);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (IDSSigningOptions)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  unsigned int v7;
  IDSSigningOptions *v8;
  IDSSigningOptions *v9;
  uint64_t v10;
  const char *v11;
  double v12;
  uint64_t v13;
  IDSSigningKeyDiversifier *keyDiversifier;
  IDSSigningOptions *v15;
  objc_super v17;

  v4 = a3;
  v7 = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("kT"), v6);
  if (IDSIsValidSigningKeyType(v7))
  {
    v17.receiver = self;
    v17.super_class = (Class)IDSSigningOptions;
    v8 = -[IDSSigningOptions init](&v17, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_keyType = v7;
      v10 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, v12, CFSTR("kD"));
      v13 = objc_claimAutoreleasedReturnValue();
      keyDiversifier = v9->_keyDiversifier;
      v9->_keyDiversifier = (IDSSigningKeyDiversifier *)v13;

    }
    self = v9;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  unsigned int v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  double v15;
  id v16;

  v4 = a3;
  v8 = objc_msgSend_keyType(self, v5, v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v9, v8, v10, CFSTR("kT"));
  objc_msgSend_keyDiversifier(self, v11, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, CFSTR("kD"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IDSSigningOptions *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;

  v3 = self;
  v7 = objc_msgSend_keyType(v3, v4, v5, v6);
  objc_msgSend_keyDiversifier(v3, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithKeyType_diversifier_(v3, v12, v7, v13, v11);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  IDSSigningOptions *v4;
  IDSSigningOptions *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  int v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  char isEqual;

  v4 = (IDSSigningOptions *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9 = objc_msgSend_keyType(v5, v6, v7, v8);
      if (v9 == objc_msgSend_keyType(self, v10, v11, v12))
      {
        objc_msgSend_keyDiversifier(v5, v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_keyDiversifier(self, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22);

      }
      else
      {
        isEqual = 0;
      }

    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  unint64_t v13;

  v5 = objc_msgSend_keyType(self, a2, v2, v3);
  objc_msgSend_keyDiversifier(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v9, v10, v11, v12) ^ v5;

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v8 = objc_msgSend_keyType(self, v5, v6, v7);
  objc_msgSend_keyDiversifier(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: %p keyType: %ld, diversifier: %@>"), v14, v4, self, v8, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unsigned)keyType
{
  return self->_keyType;
}

- (void)setKeyType:(unsigned int)a3
{
  self->_keyType = a3;
}

- (IDSSigningKeyDiversifier)keyDiversifier
{
  return self->_keyDiversifier;
}

- (void)setKeyDiversifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyDiversifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyDiversifier, 0);
}

@end
