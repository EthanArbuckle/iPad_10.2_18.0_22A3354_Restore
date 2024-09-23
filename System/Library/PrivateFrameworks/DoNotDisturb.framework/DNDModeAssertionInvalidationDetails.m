@implementation DNDModeAssertionInvalidationDetails

- (DNDModeAssertionInvalidationDetails)init
{
  return (DNDModeAssertionInvalidationDetails *)-[DNDModeAssertionInvalidationDetails _initWithDetails:](self, "_initWithDetails:", 0);
}

- (id)_initWithDetails:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DNDModeAssertionInvalidationDetails _initWithIdentifier:](self, "_initWithIdentifier:", v4);

  return v5;
}

- (id)_initWithIdentifier:(id)a3
{
  id v4;
  DNDModeAssertionInvalidationDetails *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DNDModeAssertionInvalidationDetails;
  v5 = -[DNDModeAssertionInvalidationDetails init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E39B74A8;
    objc_storeStrong((id *)&v5->_identifier, v8);

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DNDModeAssertionInvalidationDetails identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDModeAssertionInvalidationDetails *v4;
  DNDModeAssertionInvalidationDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDModeAssertionInvalidationDetails *)a3;
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
      -[DNDModeAssertionInvalidationDetails identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionInvalidationDetails identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDModeAssertionInvalidationDetails identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDModeAssertionInvalidationDetails identifier](v5, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDModeAssertionInvalidationDetails identifier](self, "identifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDModeAssertionInvalidationDetails identifier](v5, "identifier");
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
  -[DNDModeAssertionInvalidationDetails identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: '%@'>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDModeAssertionInvalidationDetails _initWithDetails:]([DNDMutableModeAssertionInvalidationDetails alloc], "_initWithDetails:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionInvalidationDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  DNDModeAssertionInvalidationDetails *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[DNDModeAssertionInvalidationDetails _initWithIdentifier:](self, "_initWithIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DNDModeAssertionInvalidationDetails identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
