@implementation DNDSModeAssertionClientIdentifierInvalidationPredicate

- (DNDSModeAssertionClientIdentifierInvalidationPredicate)initWithClientIdentifiers:(id)a3
{
  id v4;
  DNDSModeAssertionClientIdentifierInvalidationPredicate *v5;
  uint64_t v6;
  NSArray *clientIdentifiers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSModeAssertionClientIdentifierInvalidationPredicate;
  v5 = -[DNDSModeAssertionInvalidationPredicate _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifiers = v5->_clientIdentifiers;
    v5->_clientIdentifiers = (NSArray *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DNDSModeAssertionClientIdentifierInvalidationPredicate clientIdentifiers](self, "clientIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDSModeAssertionClientIdentifierInvalidationPredicate *v4;
  DNDSModeAssertionClientIdentifierInvalidationPredicate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDSModeAssertionClientIdentifierInvalidationPredicate *)a3;
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
      -[DNDSModeAssertionClientIdentifierInvalidationPredicate clientIdentifiers](self, "clientIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionClientIdentifierInvalidationPredicate clientIdentifiers](v5, "clientIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDSModeAssertionClientIdentifierInvalidationPredicate clientIdentifiers](self, "clientIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDSModeAssertionClientIdentifierInvalidationPredicate clientIdentifiers](v5, "clientIdentifiers");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDSModeAssertionClientIdentifierInvalidationPredicate clientIdentifiers](self, "clientIdentifiers");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSModeAssertionClientIdentifierInvalidationPredicate clientIdentifiers](v5, "clientIdentifiers");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqual:", v11);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSModeAssertionClientIdentifierInvalidationPredicate clientIdentifiers](self, "clientIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; clientIdentifiers: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DNDSModeAssertionClientIdentifierInvalidationPredicate;
  if (-[DNDSModeAssertionInvalidationPredicate evaluateWithObject:substitutionVariables:](&v13, sel_evaluateWithObject_substitutionVariables_, v6, a4))
  {
    v7 = v6;
    -[DNDSModeAssertionClientIdentifierInvalidationPredicate clientIdentifiers](self, "clientIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "containsObject:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)predicateType
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSModeAssertionClientIdentifierInvalidationPredicate)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  DNDSModeAssertionClientIdentifierInvalidationPredicate *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("clientIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[DNDSModeAssertionClientIdentifierInvalidationPredicate initWithClientIdentifiers:](self, "initWithClientIdentifiers:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DNDSModeAssertionClientIdentifierInvalidationPredicate clientIdentifiers](self, "clientIdentifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clientIdentifiers"));

}

- (NSArray)clientIdentifiers
{
  return self->_clientIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifiers, 0);
}

@end
