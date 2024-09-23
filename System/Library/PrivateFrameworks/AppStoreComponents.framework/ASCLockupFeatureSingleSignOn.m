@implementation ASCLockupFeatureSingleSignOn

- (ASCLockupFeatureSingleSignOn)initWithRequiresSSOEntitlement:(BOOL)a3
{
  ASCLockupFeatureSingleSignOn *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCLockupFeatureSingleSignOn;
  result = -[ASCLockupFeatureSingleSignOn init](&v5, sel_init);
  if (result)
    result->_requiresSSOEntitlement = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureSingleSignOn)initWithCoder:(id)a3
{
  return -[ASCLockupFeatureSingleSignOn initWithRequiresSSOEntitlement:](self, "initWithRequiresSSOEntitlement:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requiresSSOEntitlement")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[ASCLockupFeatureSingleSignOn requiresSSOEntitlement](self, "requiresSSOEntitlement"), CFSTR("requiresSSOEntitlement"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  unint64_t v4;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCLockupFeatureSingleSignOn requiresSSOEntitlement](self, "requiresSSOEntitlement"));
  v4 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupFeatureSingleSignOn *v4;
  ASCLockupFeatureSingleSignOn *v5;
  ASCLockupFeatureSingleSignOn *v6;
  _BOOL4 v7;
  ASCLockupFeatureSingleSignOn *v8;
  _BOOL4 v9;

  v4 = (ASCLockupFeatureSingleSignOn *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      v9 = -[ASCLockupFeatureSingleSignOn requiresSSOEntitlement](self, "requiresSSOEntitlement");
      v7 = v9 ^ -[ASCLockupFeatureSingleSignOn requiresSSOEntitlement](v8, "requiresSSOEntitlement") ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  return v7;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCLockupFeatureSingleSignOn requiresSSOEntitlement](self, "requiresSSOEntitlement"), CFSTR("requiresSSOEntitlement"));
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)requiresSSOEntitlement
{
  return self->_requiresSSOEntitlement;
}

@end
