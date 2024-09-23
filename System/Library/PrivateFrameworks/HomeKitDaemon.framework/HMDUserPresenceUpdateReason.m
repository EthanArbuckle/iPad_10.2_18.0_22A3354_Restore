@implementation HMDUserPresenceUpdateReason

- (HMDUserPresenceUpdateReason)initWithNumber:(id)a3
{
  id v4;
  HMDUserPresenceUpdateReason *v5;
  HMDUserPresenceUpdateReason *v6;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMDUserPresenceUpdateReason;
    v5 = -[HMDUserPresenceUpdateReason init](&v8, sel_init);
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
  -[HMDUserPresenceUpdateReason number](self, "number");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kUserPresenceStatusUpdateReasonKey"));

}

- (void)addToPayload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDUserPresenceUpdateReason number](self, "number");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kUserPresenceStatusUpdateReasonKey"));

}

- (NSNumber)number
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserPresenceUpdateReason value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  HMDUserPresenceUpdateReason *v4;
  HMDUserPresenceUpdateReason *v5;
  HMDUserPresenceUpdateReason *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (HMDUserPresenceUpdateReason *)a3;
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
      v7 = -[HMDUserPresenceUpdateReason value](self, "value");
      v8 = v7 == -[HMDUserPresenceUpdateReason value](v6, "value");
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
  unint64_t v3;
  __CFString *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = -[HMDUserPresenceUpdateReason value](self, "value");
  if (v3 - 2 >= 0xB)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown HMDUserPresenceUpdateReasonStatus %tu"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_24E79BB70[v3 - 2];
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)value
{
  return self->_value;
}

+ (HMDUserPresenceUpdateReason)reasonWithValue:(unint64_t)a3
{
  HMDUserPresenceUpdateReason *v4;
  void *v5;
  HMDUserPresenceUpdateReason *v6;

  v4 = [HMDUserPresenceUpdateReason alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDUserPresenceUpdateReason initWithNumber:](v4, "initWithNumber:", v5);

  return v6;
}

+ (HMDUserPresenceUpdateReason)reasonWithNumber:(id)a3
{
  id v3;
  HMDUserPresenceUpdateReason *v4;

  v3 = a3;
  v4 = -[HMDUserPresenceUpdateReason initWithNumber:]([HMDUserPresenceUpdateReason alloc], "initWithNumber:", v3);

  return v4;
}

+ (HMDUserPresenceUpdateReason)reasonWithMessage:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "numberForKey:", CFSTR("kUserPresenceStatusUpdateReasonKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserPresenceUpdateReason reasonWithNumber:](HMDUserPresenceUpdateReason, "reasonWithNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDUserPresenceUpdateReason *)v4;
}

+ (HMDUserPresenceUpdateReason)reasonWithDict:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "hmf_numberForKey:", CFSTR("kUserPresenceStatusUpdateReasonKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserPresenceUpdateReason reasonWithNumber:](HMDUserPresenceUpdateReason, "reasonWithNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDUserPresenceUpdateReason *)v4;
}

+ (HMDUserPresenceUpdateReason)reasonWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUserPresenceStatusUpdateReasonKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDUserPresenceUpdateReason reasonWithNumber:](HMDUserPresenceUpdateReason, "reasonWithNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDUserPresenceUpdateReason *)v5;
}

@end
