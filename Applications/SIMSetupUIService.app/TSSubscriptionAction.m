@implementation TSSubscriptionAction

+ (id)subscriptionActionForSubscriptionSIMStatus:(id)a3
{
  id v3;
  __objc2_class **v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", kCTSIMSupportSIMStatusReady) & 1) != 0)
  {
    v4 = off_10001C120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kCTSIMSupportSIMStatusPINLocked) & 1) != 0)
  {
    v4 = off_10001C128;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", kCTSIMSupportSIMStatusPUKLocked) & 1) == 0
      && !objc_msgSend(v3, "isEqualToString:", kCTSIMSupportSIMStatusPermanentlyLocked))
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = &off_10001C130;
  }
  v5 = objc_alloc_init(*v4);
LABEL_9:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_carrierName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (int64_t)actionType
{
  return 0;
}

- (int64_t)actionSubtype
{
  return 0;
}

- (id)description
{
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;

  v3 = objc_opt_class(self);
  v4 = -[TSSubscriptionAction actionType](self, "actionType");
  if (v4 > 4)
    v5 = CFSTR("???");
  else
    v5 = *(&off_10001C840 + v4);
  v6 = -[TSSubscriptionAction actionSubtype](self, "actionSubtype");
  if (v6 > 3)
    v7 = CFSTR("???");
  else
    v7 = *(&off_10001C868 + v6);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p type:%@, sub.type:%@, mdn:%@, carrier:%@>"), v3, self, v5, v7, self->_phoneNumber, self->_carrierName);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
