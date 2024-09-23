@implementation DNDSModeAssertionUUIDInvalidationPredicate

- (DNDSModeAssertionUUIDInvalidationPredicate)initWithUUIDs:(id)a3
{
  id v4;
  DNDSModeAssertionUUIDInvalidationPredicate *v5;
  uint64_t v6;
  NSArray *UUIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSModeAssertionUUIDInvalidationPredicate;
  v5 = -[DNDSModeAssertionInvalidationPredicate _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    UUIDs = v5->_UUIDs;
    v5->_UUIDs = (NSArray *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DNDSModeAssertionUUIDInvalidationPredicate UUIDs](self, "UUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDSModeAssertionUUIDInvalidationPredicate *v4;
  DNDSModeAssertionUUIDInvalidationPredicate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDSModeAssertionUUIDInvalidationPredicate *)a3;
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
      -[DNDSModeAssertionUUIDInvalidationPredicate UUIDs](self, "UUIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionUUIDInvalidationPredicate UUIDs](v5, "UUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDSModeAssertionUUIDInvalidationPredicate UUIDs](self, "UUIDs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDSModeAssertionUUIDInvalidationPredicate UUIDs](v5, "UUIDs");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDSModeAssertionUUIDInvalidationPredicate UUIDs](self, "UUIDs");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSModeAssertionUUIDInvalidationPredicate UUIDs](v5, "UUIDs");
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
  -[DNDSModeAssertionUUIDInvalidationPredicate UUIDs](self, "UUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; UUIDs: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DNDSModeAssertionUUIDInvalidationPredicate;
  if (-[DNDSModeAssertionInvalidationPredicate evaluateWithObject:substitutionVariables:](&v12, sel_evaluateWithObject_substitutionVariables_, v6, a4))
  {
    v7 = v6;
    -[DNDSModeAssertionUUIDInvalidationPredicate UUIDs](self, "UUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v8, "containsObject:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)predicateType
{
  return 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSModeAssertionUUIDInvalidationPredicate)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  DNDSModeAssertionUUIDInvalidationPredicate *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("UUIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[DNDSModeAssertionUUIDInvalidationPredicate initWithUUIDs:](self, "initWithUUIDs:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DNDSModeAssertionUUIDInvalidationPredicate UUIDs](self, "UUIDs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UUIDs"));

}

- (NSArray)UUIDs
{
  return self->_UUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDs, 0);
}

@end
