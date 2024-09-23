@implementation HKIdentifierConceptSelection

- (HKIdentifierConceptSelection)init
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

- (HKIdentifierConceptSelection)initWithIdentifier:(id)a3
{
  id v4;
  HKIdentifierConceptSelection *v5;
  uint64_t v6;
  HKConceptIdentifier *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKIdentifierConceptSelection;
  v5 = -[HKConceptSelection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (HKConceptIdentifier *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@>"), objc_opt_class(), self->_identifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKIdentifierConceptSelection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKIdentifierConceptSelection *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[HKIdentifierConceptSelection initWithIdentifier:](self, "initWithIdentifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("Identifier"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKIdentifierConceptSelection;
  if (-[HKConceptSelection isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = v4;
    -[HKIdentifierConceptSelection identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[HKIdentifierConceptSelection identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10) ^ 1;

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

  return v12;
}

- (HKConceptIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
