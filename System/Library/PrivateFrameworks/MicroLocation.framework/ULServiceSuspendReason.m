@implementation ULServiceSuspendReason

- (ULServiceSuspendReason)initWithSuspendReasonEnum:(unint64_t)a3
{
  ULServiceSuspendReason *v4;
  ULServiceSuspendReason *v5;
  ULServiceSuspendReason *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ULServiceSuspendReason;
  v4 = -[ULServiceSuspendReason init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[ULServiceSuspendReason setSuspendReasonEnum:](v4, "setSuspendReasonEnum:", a3);
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSuspendReasonEnum:", -[ULServiceSuspendReason suspendReasonEnum](self, "suspendReasonEnum"));
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  unint64_t suspendReasonEnum;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  suspendReasonEnum = self->_suspendReasonEnum;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", suspendReasonEnum);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("suspendReasonEnum"));

}

- (ULServiceSuspendReason)initWithCoder:(id)a3
{
  id v4;
  ULServiceSuspendReason *v5;
  ULServiceSuspendReason *v6;
  ULServiceSuspendReason *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULServiceSuspendReason;
  v5 = -[ULServiceSuspendReason init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suspendReasonEnum"));
    v6 = (ULServiceSuspendReason *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = -[ULServiceSuspendReason unsignedIntegerValue](v6, "unsignedIntegerValue");

      v5->_suspendReasonEnum = v8;
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
  unint64_t suspendReasonEnum;
  const __CFString *v8;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  suspendReasonEnum = self->_suspendReasonEnum;
  if (suspendReasonEnum > 7)
    v8 = CFSTR("Unknown");
  else
    v8 = *(&off_2511CCF60 + suspendReasonEnum);
  objc_msgSend(v6, "appendFormat:", CFSTR(", suspendReasonEnum: %@"), v8);
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
    v6 = -[ULServiceSuspendReason suspendReasonEnum](self, "suspendReasonEnum");
    v7 = objc_msgSend(v5, "suspendReasonEnum");

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
  return self->_suspendReasonEnum;
}

- (ULServiceSuspendReason)init
{
  __assert_rtn("-[ULServiceSuspendReason init]", "ULConnectionDelegateTypes.m", 230, "NO");
}

+ (id)new
{
  __assert_rtn("+[ULServiceSuspendReason new]", "ULConnectionDelegateTypes.m", 235, "NO");
}

- (unint64_t)suspendReasonEnum
{
  return self->_suspendReasonEnum;
}

- (void)setSuspendReasonEnum:(unint64_t)a3
{
  self->_suspendReasonEnum = a3;
}

@end
