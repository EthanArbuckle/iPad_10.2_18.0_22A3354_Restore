@implementation SKPaymentDiscount

- (SKPaymentDiscount)initWithIdentifier:(NSString *)identifier keyIdentifier:(NSString *)keyIdentifier nonce:(NSUUID *)nonce signature:(NSString *)signature timestamp:(NSNumber *)timestamp
{
  NSString *v12;
  NSString *v13;
  NSUUID *v14;
  NSString *v15;
  NSNumber *v16;
  NSNumber *v17;
  SKPaymentDiscount *v18;
  SKPaymentDiscountInternal *v19;
  id internal;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  SKPaymentDiscount *v36;
  objc_super v38;

  v12 = identifier;
  v13 = keyIdentifier;
  v14 = nonce;
  v15 = signature;
  v16 = timestamp;
  v17 = v16;
  if (v12 && v13 && v14 && v15 && v16)
  {
    v38.receiver = self;
    v38.super_class = (Class)SKPaymentDiscount;
    v18 = -[SKPaymentDiscount init](&v38, sel_init);
    if (v18)
    {
      v19 = objc_alloc_init(SKPaymentDiscountInternal);
      internal = v18->_internal;
      v18->_internal = v19;

      v21 = -[NSString copy](v12, "copy");
      v22 = v18->_internal;
      v23 = (void *)v22[1];
      v22[1] = v21;

      v24 = -[NSString copy](v13, "copy");
      v25 = v18->_internal;
      v26 = (void *)v25[2];
      v25[2] = v24;

      v27 = -[NSUUID copy](v14, "copy");
      v28 = v18->_internal;
      v29 = (void *)v28[3];
      v28[3] = v27;

      v30 = -[NSString copy](v15, "copy");
      v31 = v18->_internal;
      v32 = (void *)v31[4];
      v31[4] = v30;

      v33 = -[NSNumber copy](v17, "copy");
      v34 = v18->_internal;
      v35 = (void *)v34[5];
      v34[5] = v33;

    }
    self = v18;
    v36 = self;
  }
  else
  {
    NSLog(CFSTR("Found nil parameter when creating SKPaymentDiscount"));
    v36 = 0;
  }

  return v36;
}

- (NSString)identifier
{
  return (NSString *)*((id *)self->_internal + 1);
}

- (NSString)keyIdentifier
{
  return (NSString *)*((id *)self->_internal + 2);
}

- (NSUUID)nonce
{
  return (NSUUID *)*((id *)self->_internal + 3);
}

- (NSString)signature
{
  return (NSString *)*((id *)self->_internal + 4);
}

- (NSNumber)timestamp
{
  return (NSNumber *)*((id *)self->_internal + 5);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

@end
