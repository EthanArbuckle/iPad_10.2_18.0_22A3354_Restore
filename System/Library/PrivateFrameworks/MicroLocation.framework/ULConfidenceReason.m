@implementation ULConfidenceReason

- (ULConfidenceReason)initWithConfidenceReasonEnum:(unint64_t)a3
{
  ULConfidenceReason *v4;
  ULConfidenceReason *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ULConfidenceReason;
  v4 = -[ULConfidenceReason init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ULConfidenceReason setConfidenceReasonEnum:](v4, "setConfidenceReasonEnum:", a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConfidenceReasonEnum:", self->_confidenceReasonEnum);
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  unint64_t confidenceReasonEnum;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  confidenceReasonEnum = self->_confidenceReasonEnum;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", confidenceReasonEnum);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("confidenceReasonEnum"));

}

- (ULConfidenceReason)initWithCoder:(id)a3
{
  id v4;
  ULConfidenceReason *v5;
  ULConfidenceReason *v6;
  ULConfidenceReason *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULConfidenceReason;
  v5 = -[ULConfidenceReason init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confidenceReasonEnum"));
    v6 = (ULConfidenceReason *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = -[ULConfidenceReason unsignedIntegerValue](v6, "unsignedIntegerValue");

      v5->_confidenceReasonEnum = v8;
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
  unint64_t confidenceReasonEnum;
  const __CFString *v8;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  confidenceReasonEnum = self->_confidenceReasonEnum;
  if (confidenceReasonEnum > 7)
    v8 = CFSTR("Unknown");
  else
    v8 = *(&off_2511CCF20 + confidenceReasonEnum);
  objc_msgSend(v6, "appendFormat:", CFSTR(", confidenceReasonEnum: %@"), v8);
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
    v6 = -[ULConfidenceReason confidenceReasonEnum](self, "confidenceReasonEnum");
    v7 = objc_msgSend(v5, "confidenceReasonEnum");

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
  return self->_confidenceReasonEnum;
}

- (ULConfidenceReason)init
{
  __assert_rtn("-[ULConfidenceReason init]", "ULConnectionDelegateTypes.m", 152, "NO");
}

+ (id)new
{
  __assert_rtn("+[ULConfidenceReason new]", "ULConnectionDelegateTypes.m", 157, "NO");
}

- (unint64_t)confidenceReasonEnum
{
  return self->_confidenceReasonEnum;
}

- (void)setConfidenceReasonEnum:(unint64_t)a3
{
  self->_confidenceReasonEnum = a3;
}

@end
