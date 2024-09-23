@implementation HMDUserPresenceRegion

- (HMDUserPresenceRegion)initWithNumber:(id)a3
{
  id v4;
  HMDUserPresenceRegion *v5;
  HMDUserPresenceRegion *v6;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMDUserPresenceRegion;
    v5 = -[HMDUserPresenceRegion init](&v8, sel_init);
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
  -[HMDUserPresenceRegion number](self, "number");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kUserPresenceRegionStatusKey"));

}

- (void)addToPayload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDUserPresenceRegion number](self, "number");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kUserPresenceRegionStatusKey"));

}

- (NSNumber)number
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUserPresenceRegion value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  HMDUserPresenceRegion *v4;
  HMDUserPresenceRegion *v5;
  HMDUserPresenceRegion *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (HMDUserPresenceRegion *)a3;
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
      v7 = -[HMDUserPresenceRegion value](self, "value");
      v8 = v7 == -[HMDUserPresenceRegion value](v6, "value");
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
  HMDUserPresenceRegionStatusAsString(-[HMDUserPresenceRegion value](self, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)value
{
  return self->_value;
}

+ (HMDUserPresenceRegion)regionWithValue:(unint64_t)a3
{
  HMDUserPresenceRegion *v4;
  void *v5;
  HMDUserPresenceRegion *v6;

  v4 = [HMDUserPresenceRegion alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDUserPresenceRegion initWithNumber:](v4, "initWithNumber:", v5);

  return v6;
}

+ (HMDUserPresenceRegion)regionWithNumber:(id)a3
{
  id v3;
  HMDUserPresenceRegion *v4;

  v3 = a3;
  v4 = -[HMDUserPresenceRegion initWithNumber:]([HMDUserPresenceRegion alloc], "initWithNumber:", v3);

  return v4;
}

+ (HMDUserPresenceRegion)regionWithMessage:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "numberForKey:", CFSTR("kUserPresenceRegionStatusKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserPresenceRegion regionWithNumber:](HMDUserPresenceRegion, "regionWithNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDUserPresenceRegion *)v4;
}

+ (HMDUserPresenceRegion)regionWithDict:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "hmf_numberForKey:", CFSTR("kUserPresenceRegionStatusKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserPresenceRegion regionWithNumber:](HMDUserPresenceRegion, "regionWithNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDUserPresenceRegion *)v4;
}

+ (HMDUserPresenceRegion)regionWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUserPresenceRegionStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDUserPresenceRegion regionWithNumber:](HMDUserPresenceRegion, "regionWithNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDUserPresenceRegion *)v5;
}

@end
