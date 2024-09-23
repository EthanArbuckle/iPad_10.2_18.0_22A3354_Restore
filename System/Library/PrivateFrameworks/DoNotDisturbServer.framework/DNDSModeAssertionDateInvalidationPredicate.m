@implementation DNDSModeAssertionDateInvalidationPredicate

- (DNDSModeAssertionDateInvalidationPredicate)initWithDate:(id)a3
{
  id v4;
  DNDSModeAssertionDateInvalidationPredicate *v5;
  uint64_t v6;
  NSDate *date;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSModeAssertionDateInvalidationPredicate;
  v5 = -[DNDSModeAssertionInvalidationPredicate _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    date = v5->_date;
    v5->_date = (NSDate *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DNDSModeAssertionDateInvalidationPredicate date](self, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDSModeAssertionDateInvalidationPredicate *v4;
  DNDSModeAssertionDateInvalidationPredicate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDSModeAssertionDateInvalidationPredicate *)a3;
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
      -[DNDSModeAssertionDateInvalidationPredicate date](self, "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionDateInvalidationPredicate date](v5, "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDSModeAssertionDateInvalidationPredicate date](self, "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDSModeAssertionDateInvalidationPredicate date](v5, "date");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDSModeAssertionDateInvalidationPredicate date](self, "date");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSModeAssertionDateInvalidationPredicate date](v5, "date");
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
  -[DNDSModeAssertionDateInvalidationPredicate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; date: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDSModeAssertionDateInvalidationPredicate;
  if (-[DNDSModeAssertionInvalidationPredicate evaluateWithObject:substitutionVariables:](&v11, sel_evaluateWithObject_substitutionVariables_, v6, a4))
  {
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDateInvalidationPredicate date](self, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8) == -1;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)predicateType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSModeAssertionDateInvalidationPredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  DNDSModeAssertionDateInvalidationPredicate *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[DNDSModeAssertionDateInvalidationPredicate initWithDate:](self, "initWithDate:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DNDSModeAssertionDateInvalidationPredicate date](self, "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("date"));

}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
