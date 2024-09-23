@implementation _DASActivityRateLimitConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASActivityRateLimitConfiguration)initWithName:(id)a3 andLimits:(id)a4
{
  id v7;
  id v8;
  _DASActivityRateLimitConfiguration *v9;
  _DASActivityRateLimitConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DASActivityRateLimitConfiguration;
  v9 = -[_DASActivityRateLimitConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_rateLimits, a4);
  }

  return v10;
}

+ (id)rateLimitConfigurationWithName:(id)a3 andLimits:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:andLimits:", v6, v5);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Configuration '%@': %@>"), self->_name, self->_rateLimits);
}

- (BOOL)isEqual:(id)a3
{
  _DASActivityRateLimitConfiguration *v4;
  _DASActivityRateLimitConfiguration *v5;
  NSString *name;
  void *v7;
  NSArray *rateLimits;
  void *v9;
  char v10;

  v4 = (_DASActivityRateLimitConfiguration *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      name = self->_name;
      -[_DASActivityRateLimitConfiguration name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](name, "isEqualToString:", v7))
      {
        rateLimits = self->_rateLimits;
        -[_DASActivityRateLimitConfiguration rateLimits](v5, "rateLimits");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSArray isEqualToArray:](rateLimits, "isEqualToArray:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[_DASActivityRateLimitConfiguration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASActivityRateLimitConfiguration rateLimits](self, "rateLimits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:andLimits:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rateLimits, CFSTR("rateLimits"));

}

- (_DASActivityRateLimitConfiguration)initWithCoder:(id)a3
{
  id v4;
  _DASActivityRateLimitConfiguration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _DASActivityRateLimitConfiguration *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DASActivityRateLimitConfiguration;
  v5 = -[_DASActivityRateLimitConfiguration init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("rateLimits"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = 0;
    if (v6 && v10)
    {
      objc_storeStrong((id *)&v5->_name, v6);
      objc_storeStrong((id *)&v5->_rateLimits, v11);
      v12 = v5;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)rateLimits
{
  return self->_rateLimits;
}

- (void)setRateLimits:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimits, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
