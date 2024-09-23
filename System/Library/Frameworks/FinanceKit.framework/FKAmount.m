@implementation FKAmount

- (FKAmount)initWithDecimalNumber:(id)a3 currency:(id)a4
{
  id v6;
  id v7;
  FKAmount *v8;
  uint64_t v9;
  NSDecimalNumber *decimal;
  uint64_t v11;
  NSString *currency;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FKAmount;
  v8 = -[FKAmount init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    decimal = v8->_decimal;
    v8->_decimal = (NSDecimalNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    currency = v8->_currency;
    v8->_currency = (NSString *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FKAmount *v4;
  uint64_t v5;
  NSDecimalNumber *decimal;
  uint64_t v7;
  NSString *currency;

  v4 = objc_alloc_init(FKAmount);
  v5 = -[NSDecimalNumber copy](self->_decimal, "copy");
  decimal = v4->_decimal;
  v4->_decimal = (NSDecimalNumber *)v5;

  v7 = -[NSString copy](self->_currency, "copy");
  currency = v4->_currency;
  v4->_currency = (NSString *)v7;

  return v4;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_decimal);
  objc_msgSend(v3, "safelyAddObject:", self->_currency);
  v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  FKAmount *v4;
  FKAmount *v5;
  void **v6;
  char v7;

  v4 = (FKAmount *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (-[NSDecimalNumber isEqualToNumber:](self->_decimal, "isEqualToNumber:", v6[1]))
      v7 = FKEqualObjects(self->_currency, v6[2]);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDecimalNumber)decimal
{
  return self->_decimal;
}

- (NSString)currency
{
  return self->_currency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_decimal, 0);
}

@end
