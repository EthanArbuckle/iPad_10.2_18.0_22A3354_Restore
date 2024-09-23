@implementation ULFingerprintError

- (ULFingerprintError)initWithFingerprintErrorEnum:(unint64_t)a3
{
  ULFingerprintError *v4;
  ULFingerprintError *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ULFingerprintError;
  v4 = -[ULFingerprintError init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ULFingerprintError setFingerprintErrorEnum:](v4, "setFingerprintErrorEnum:", a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFingerprintErrorEnum:", -[ULFingerprintError fingerprintErrorEnum](self, "fingerprintErrorEnum"));
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  unint64_t fingerprintErrorEnum;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  fingerprintErrorEnum = self->_fingerprintErrorEnum;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", fingerprintErrorEnum);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("fingerprintErrorEnum"));

}

- (ULFingerprintError)initWithCoder:(id)a3
{
  id v4;
  ULFingerprintError *v5;
  ULFingerprintError *v6;
  ULFingerprintError *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULFingerprintError;
  v5 = -[ULFingerprintError init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fingerprintErrorEnum"));
    v6 = (ULFingerprintError *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = -[ULFingerprintError unsignedIntegerValue](v6, "unsignedIntegerValue");

      v5->_fingerprintErrorEnum = v8;
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ULFingerprintError fingerprintErrorEnum](self, "fingerprintErrorEnum"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", fingerprintErrorEnum: %@"), v7);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ULFingerprintError fingerprintErrorEnum](self, "fingerprintErrorEnum");
    v7 = objc_msgSend(v5, "fingerprintErrorEnum");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_fingerprintErrorEnum;
}

- (ULFingerprintError)init
{
  __assert_rtn("-[ULFingerprintError init]", "ULConnectionDelegateTypes.m", 998, "NO");
}

+ (id)new
{
  __assert_rtn("+[ULFingerprintError new]", "ULConnectionDelegateTypes.m", 1003, "NO");
}

- (unint64_t)fingerprintErrorEnum
{
  return self->_fingerprintErrorEnum;
}

- (void)setFingerprintErrorEnum:(unint64_t)a3
{
  self->_fingerprintErrorEnum = a3;
}

@end
