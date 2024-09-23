@implementation LPPriceMetadata

- (LPPriceMetadata)init
{
  LPPriceMetadata *v2;
  LPPriceMetadata *v3;
  LPPriceMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPPriceMetadata;
  v2 = -[LPPriceMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  LPPriceMetadata *v5;
  uint64_t v6;
  NSString *amount;
  uint64_t v8;
  NSString *currency;
  LPPriceMetadata *v10;

  v4 = a3;
  v5 = -[LPPriceMetadata init](self, "init");
  if (v5)
  {
    stringForKey(v4, CFSTR("LPMetadataPriceAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSString *)v6;

    stringForKey(v4, CFSTR("LPMetadataPriceCurrency"));
    v8 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPPriceMetadata)initWithCoder:(id)a3
{
  id v4;
  LPPriceMetadata *v5;
  uint64_t v6;
  NSString *amount;
  uint64_t v8;
  NSString *currency;
  LPPriceMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPPriceMetadata;
  v5 = -[LPPriceMetadata init](&v12, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("currency"));
    v8 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_currency, CFSTR("currency"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPPriceMetadata;
  if (-[LPPriceMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[1], self->_amount) & 1) != 0)
        v5 = objectsAreEqual_0(v6[2], self->_currency);
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_amount, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPPriceMetadata *v4;
  void *v5;
  void *v6;
  LPPriceMetadata *v7;

  v4 = +[LPPriceMetadata allocWithZone:](LPPriceMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPPriceMetadata amount](self, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPPriceMetadata setAmount:](v4, "setAmount:", v5);

    -[LPPriceMetadata currency](self, "currency");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPPriceMetadata setCurrency:](v4, "setCurrency:", v6);

    v7 = v4;
  }

  return v4;
}

- (NSString)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
