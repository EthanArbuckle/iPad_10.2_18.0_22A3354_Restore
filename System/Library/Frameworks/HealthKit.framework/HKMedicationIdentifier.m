@implementation HKMedicationIdentifier

- (HKMedicationIdentifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKMedicationIdentifier)initWithRawIdentifier:(id)a3
{
  id v5;
  HKMedicationIdentifier *v6;
  uint64_t v7;
  NSString *underlyingIdentifier;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationIdentifier.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rawIdentifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationIdentifier;
  v6 = -[HKMedicationIdentifier init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    underlyingIdentifier = v6->_underlyingIdentifier;
    v6->_underlyingIdentifier = (NSString *)v7;

  }
  return v6;
}

- (HKMedicationIdentifier)initWithSemanticIdentifierString:(id)a3
{
  id v5;
  void *v6;
  HKMedicationIdentifier *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationIdentifier.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("semanticIdentifierString"));

  }
  objc_msgSend(v5, "hk_SHA256Hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKMedicationIdentifier initWithRawIdentifier:](self, "initWithRawIdentifier:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationIdentifier *v4;
  HKMedicationIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;

  v4 = (HKMedicationIdentifier *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKMedicationIdentifier underlyingIdentifier](v5, "underlyingIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationIdentifier underlyingIdentifier](self, "underlyingIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        LOBYTE(v11) = 0;
      }
      else
      {
        -[HKMedicationIdentifier underlyingIdentifier](self, "underlyingIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[HKMedicationIdentifier underlyingIdentifier](v5, "underlyingIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMedicationIdentifier underlyingIdentifier](self, "underlyingIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqualToString:", v10) ^ 1;

        }
        else
        {
          LOBYTE(v11) = 1;
        }

      }
      v12 = v11 ^ 1;

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_underlyingIdentifier, "hash");
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "underlyingIdentifier"), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    -[HKMedicationIdentifier underlyingIdentifier](self, "underlyingIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "compare:", v9);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationIdentifier)initWithCoder:(id)a3
{
  id v4;
  HKMedicationIdentifier *v5;
  uint64_t v6;
  NSString *underlyingIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationIdentifier;
  v5 = -[HKMedicationIdentifier init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnderlyingIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    underlyingIdentifier = v5->_underlyingIdentifier;
    v5->_underlyingIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_underlyingIdentifier, CFSTR("UnderlyingIdentifier"));
}

- (NSString)underlyingIdentifier
{
  return self->_underlyingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingIdentifier, 0);
}

@end
