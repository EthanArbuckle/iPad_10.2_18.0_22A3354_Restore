@implementation HMUserPresenceCompute

- (HMUserPresenceCompute)initWithNumber:(id)a3
{
  id v4;
  HMUserPresenceCompute *v5;
  HMUserPresenceCompute *v6;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMUserPresenceCompute;
    v5 = -[HMUserPresenceCompute init](&v8, sel_init);
    if (v5)
      v5->_value = objc_msgSend(v4, "unsignedIntegerValue");
    self = v5;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addToCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMUserPresenceCompute number](self, "number");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kUserPresenceComputeStatusKey"));

}

- (void)addToPayload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMUserPresenceCompute number](self, "number");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kUserPresenceComputeStatusKey"));

}

- (NSNumber)number
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMUserPresenceCompute value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  HMUserPresenceCompute *v4;
  HMUserPresenceCompute *v5;
  HMUserPresenceCompute *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (HMUserPresenceCompute *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      v7 = -[HMUserPresenceCompute value](self, "value");
      v8 = v7 == -[HMUserPresenceCompute value](v6, "value");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  HMUserPresenceComputeStatusAsString(-[HMUserPresenceCompute value](self, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)value
{
  return self->_value;
}

+ (HMUserPresenceCompute)computeWithValue:(unint64_t)a3
{
  HMUserPresenceCompute *v4;
  void *v5;
  HMUserPresenceCompute *v6;

  v4 = [HMUserPresenceCompute alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMUserPresenceCompute initWithNumber:](v4, "initWithNumber:", v5);

  return v6;
}

+ (HMUserPresenceCompute)computeWithNumber:(id)a3
{
  id v3;
  HMUserPresenceCompute *v4;

  v3 = a3;
  v4 = -[HMUserPresenceCompute initWithNumber:]([HMUserPresenceCompute alloc], "initWithNumber:", v3);

  return v4;
}

+ (HMUserPresenceCompute)computeWithMessage:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "numberForKey:", CFSTR("kUserPresenceComputeStatusKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMUserPresenceCompute computeWithNumber:](HMUserPresenceCompute, "computeWithNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMUserPresenceCompute *)v4;
}

+ (HMUserPresenceCompute)computeWithDict:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "hmf_numberForKey:", CFSTR("kUserPresenceComputeStatusKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMUserPresenceCompute computeWithNumber:](HMUserPresenceCompute, "computeWithNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMUserPresenceCompute *)v4;
}

+ (HMUserPresenceCompute)computeWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUserPresenceComputeStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMUserPresenceCompute computeWithNumber:](HMUserPresenceCompute, "computeWithNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMUserPresenceCompute *)v5;
}

@end
