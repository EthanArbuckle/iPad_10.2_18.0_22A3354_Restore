@implementation SKProductDiscount

- (SKProductDiscount)init
{
  SKProductDiscount *v2;
  SKProductDiscountInternal *v3;
  id internal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKProductDiscount;
  v2 = -[SKProductDiscount init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKProductDiscountInternal);
    internal = v2->_internal;
    v2->_internal = v3;

  }
  return v2;
}

- (NSDecimalNumber)price
{
  return (NSDecimalNumber *)*((id *)self->_internal + 1);
}

- (NSLocale)priceLocale
{
  return (NSLocale *)*((id *)self->_internal + 2);
}

- (SKProductSubscriptionPeriod)subscriptionPeriod
{
  return (SKProductSubscriptionPeriod *)*((id *)self->_internal + 4);
}

- (NSUInteger)numberOfPeriods
{
  return *((_QWORD *)self->_internal + 5);
}

- (SKProductDiscountPaymentMode)paymentMode
{
  return *((_QWORD *)self->_internal + 3);
}

- (NSString)identifier
{
  return (NSString *)*((id *)self->_internal + 7);
}

- (SKProductDiscountType)type
{
  return *((_QWORD *)self->_internal + 6);
}

- (void)_setNumberOfPeriods:(unint64_t)a3
{
  *((_QWORD *)self->_internal + 5) = a3;
}

- (void)_setPaymentMode:(unint64_t)a3
{
  *((_QWORD *)self->_internal + 3) = a3;
}

- (void)_setPrice:(id)a3
{
  objc_storeStrong((id *)self->_internal + 1, a3);

}

- (void)_setPriceLocale:(id)a3
{
  objc_storeStrong((id *)self->_internal + 2, a3);

}

- (void)_setSubscriptionPeriod:(id)a3
{
  objc_storeStrong((id *)self->_internal + 4, a3);

}

- (void)_setIdentifier:(id)a3
{
  uint64_t v4;
  _QWORD *internal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  internal = self->_internal;
  v6 = (void *)internal[7];
  internal[7] = v4;

}

- (void)_setType:(unint64_t)a3
{
  *((_QWORD *)self->_internal + 6) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

@end
