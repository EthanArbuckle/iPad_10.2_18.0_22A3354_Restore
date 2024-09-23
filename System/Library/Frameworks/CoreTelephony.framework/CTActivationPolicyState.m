@implementation CTActivationPolicyState

- (id)description
{
  void *v3;
  int64_t v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTActivationPolicyState carrierLock](self, "carrierLock");
  v5 = "CTActivationPolicyCarrierLockUnknown";
  if (v4 == 1)
    v5 = "CTActivationPolicyCarrierUnlocked";
  if (v4 == 2)
    v5 = "CTActivationPolicyCarrierLocked";
  objc_msgSend(v3, "appendFormat:", CFSTR(", carrierLock=%s"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCarrierLock:", -[CTActivationPolicyState carrierLock](self, "carrierLock"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTActivationPolicyState carrierLock](self, "carrierLock"), CFSTR("carrier_lock"));

}

- (CTActivationPolicyState)initWithCoder:(id)a3
{
  id v4;
  CTActivationPolicyState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTActivationPolicyState;
  v5 = -[CTActivationPolicyState init](&v7, sel_init);
  if (v5)
    v5->_carrierLock = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("carrier_lock"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)carrierLock
{
  return self->_carrierLock;
}

- (void)setCarrierLock:(int64_t)a3
{
  self->_carrierLock = a3;
}

@end
