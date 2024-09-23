@implementation DNDModeAssertionExplicitRegionLifetime

- (DNDModeAssertionExplicitRegionLifetime)initWithRegion:(id)a3
{
  id v5;
  id *v6;
  DNDModeAssertionExplicitRegionLifetime *v7;

  v5 = a3;
  v6 = -[DNDModeAssertionLifetime _init](self, "_init");
  v7 = (DNDModeAssertionExplicitRegionLifetime *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DNDModeAssertionExplicitRegionLifetime region](self, "region");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDModeAssertionExplicitRegionLifetime *v4;
  DNDModeAssertionExplicitRegionLifetime *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDModeAssertionExplicitRegionLifetime *)a3;
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
      -[DNDModeAssertionExplicitRegionLifetime region](self, "region");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionExplicitRegionLifetime region](v5, "region");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDModeAssertionExplicitRegionLifetime region](self, "region");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDModeAssertionExplicitRegionLifetime region](v5, "region");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDModeAssertionExplicitRegionLifetime region](self, "region");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDModeAssertionExplicitRegionLifetime region](v5, "region");
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
  -[DNDModeAssertionExplicitRegionLifetime region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; region: '%@'>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)lifetimeType
{
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionExplicitRegionLifetime)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  DNDModeAssertionExplicitRegionLifetime *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[DNDModeAssertionExplicitRegionLifetime initWithRegion:](self, "initWithRegion:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DNDModeAssertionExplicitRegionLifetime region](self, "region");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("region"));

}

- (CLCircularRegion)region
{
  return self->_region;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

@end
