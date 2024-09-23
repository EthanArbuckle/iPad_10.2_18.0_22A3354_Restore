@implementation SKPayment

- (SKPayment)init
{
  SKPayment *v2;
  SKPaymentInternal *v3;
  id internal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKPayment;
  v2 = -[SKPayment init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKPaymentInternal);
    internal = v2->_internal;
    v2->_internal = v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKPayment *v5;
  uint64_t v6;
  id internal;

  v5 = -[SKPayment init](+[SKPayment allocWithZone:](SKPayment, "allocWithZone:"), "init");
  v6 = objc_msgSend(self->_internal, "copyWithZone:", a3);
  internal = v5->_internal;
  v5->_internal = (id)v6;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SKMutablePayment *v5;
  uint64_t v6;
  id internal;

  v5 = -[SKPayment init](+[SKMutablePayment allocWithZone:](SKMutablePayment, "allocWithZone:"), "init");
  v6 = objc_msgSend(self->_internal, "copyWithZone:", a3);
  internal = v5->super._internal;
  v5->super._internal = (id)v6;

  return v5;
}

+ (SKPayment)paymentWithProduct:(SKProduct *)product
{
  SKProduct *v4;
  id *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;

  v4 = product;
  v5 = (id *)objc_alloc_init((Class)a1);
  v6 = v5[1];
  -[SKProduct productIdentifier](v4, "productIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)v6[4];
  v6[4] = v8;

  if (__currentPurchaseIntentProductIdentifier)
  {
    -[SKProduct productIdentifier](v4, "productIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", __currentPurchaseIntentProductIdentifier);

    if (v11)
      *((_BYTE *)v6 + 65) = 1;
  }

  return (SKPayment *)v5;
}

+ (id)paymentFromPurchaseIntentWithProduct:(id)a3
{
  id v4;
  id *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  v6 = v5[1];
  objc_msgSend(v4, "productIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)v6[4];
  v6[4] = v8;

  *((_BYTE *)v6 + 65) = 1;
  v10 = (void *)__currentPurchaseIntentProductIdentifier;
  if (__currentPurchaseIntentProductIdentifier)
  {
    __currentPurchaseIntentProductIdentifier = 0;

  }
  objc_msgSend(v4, "productIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)__currentPurchaseIntentProductIdentifier;
  __currentPurchaseIntentProductIdentifier = v12;

  return v5;
}

+ (id)paymentWithProductIdentifier:(NSString *)identifier
{
  NSString *v4;
  id *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v4 = identifier;
  v5 = (id *)objc_alloc_init((Class)a1);
  v6 = v5[1];
  v7 = -[NSString copy](v4, "copy");

  v8 = (void *)v6[4];
  v6[4] = v7;

  return v5;
}

- (NSString)applicationUsername
{
  return (NSString *)*((id *)self->_internal + 1);
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  v3 = *((id *)self->_internal + 4);
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "hash");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SKPayment;
    v5 = -[SKPayment hash](&v8, sel_hash);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  int v5;
  id v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && *((_QWORD *)self->_internal + 5) == *(_QWORD *)(v4[1] + 40);
  v6 = *((id *)self->_internal + 4);
  v7 = *(id *)(v4[1] + 32);
  v8 = v7;
  if (v5)
  {
    if (v6 == v7)
      LOBYTE(v5) = 1;
    else
      LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", v7);
  }

  return v5;
}

- (NSString)productIdentifier
{
  return (NSString *)*((id *)self->_internal + 4);
}

- (NSInteger)quantity
{
  return *((_QWORD *)self->_internal + 5);
}

- (NSData)requestData
{
  return (NSData *)*((id *)self->_internal + 6);
}

- (BOOL)simulatesAskToBuyInSandbox
{
  return *((_BYTE *)self->_internal + 64);
}

- (SKPaymentDiscount)paymentDiscount
{
  return (SKPaymentDiscount *)*((id *)self->_internal + 9);
}

- (BOOL)isStoreOriginated
{
  return *((_BYTE *)self->_internal + 65);
}

- (NSString)partnerIdentifier
{
  return (NSString *)*((id *)self->_internal + 2);
}

- (NSString)partnerTransactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 3);
}

- (NSDictionary)requestParameters
{
  return (NSDictionary *)*((id *)self->_internal + 7);
}

- (SKPaymentAppleIDAuthorizationRequest)appleIDAuthorizationClientInfo
{
  return (SKPaymentAppleIDAuthorizationRequest *)*((id *)self->_internal + 10);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

@end
