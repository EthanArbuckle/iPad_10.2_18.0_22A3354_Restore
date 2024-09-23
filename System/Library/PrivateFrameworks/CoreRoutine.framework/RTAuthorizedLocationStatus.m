@implementation RTAuthorizedLocationStatus

- (RTAuthorizedLocationStatus)initWithStatus:(int64_t)a3
{
  RTAuthorizedLocationStatus *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTAuthorizedLocationStatus;
  result = -[RTAuthorizedLocationStatus init](&v5, sel_init);
  if (result)
    result->_eStatus = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTAuthorizedLocationStatus)initWithCoder:(id)a3
{
  return -[RTAuthorizedLocationStatus initWithStatus:](self, "initWithStatus:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("RTAuthorizedLocationStatus")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_eStatus, CFSTR("RTAuthorizedLocationStatus"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithStatus:", self->_eStatus);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t eStatus;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    eStatus = self->_eStatus;
    v7 = eStatus == objc_msgSend(v4, "eStatus");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  unint64_t eStatus;
  const __CFString *v3;

  eStatus = self->_eStatus;
  if (eStatus > 2)
    v3 = CFSTR("Invalid.");
  else
    v3 = off_1E4FB16A0[eStatus];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("status,%ld,statusString,%@"), eStatus, v3);
}

- (int64_t)eStatus
{
  return self->_eStatus;
}

@end
