@implementation FKPaymentApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FKPaymentApplication)initWithCoder:(id)a3
{
  id v4;
  FKPaymentApplication *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FKPaymentApplication;
  v5 = -[FKPaymentApplication init](&v7, sel_init);
  if (v5)
    v5->_paymentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentType"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_paymentType, CFSTR("paymentType"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(FKPaymentApplication);
  *((_QWORD *)result + 1) = self->_paymentType;
  return result;
}

- (unint64_t)hash
{
  return FKIntegerHash(17, self->_paymentType);
}

- (BOOL)isEqual:(id)a3
{
  FKPaymentApplication *v4;
  FKPaymentApplication *v5;
  BOOL v6;

  v4 = (FKPaymentApplication *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_paymentType == v5->_paymentType;

  return v6;
}

- (unint64_t)paymentType
{
  return self->_paymentType;
}

- (void)setPaymentType:(unint64_t)a3
{
  self->_paymentType = a3;
}

@end
