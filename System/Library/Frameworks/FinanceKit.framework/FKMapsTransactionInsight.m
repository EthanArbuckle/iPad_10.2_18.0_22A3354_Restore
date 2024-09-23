@implementation FKMapsTransactionInsight

- (FKMapsTransactionInsight)initWithUpdatedAt:(id)a3 fallbackCategory:(unint64_t)a4 merchant:(id)a5 brand:(id)a6
{
  id v10;
  id v11;
  id v12;
  FKMapsTransactionInsight *v13;
  uint64_t v14;
  NSDate *updatedAt;
  uint64_t v16;
  FKMapsMerchant *merchant;
  uint64_t v18;
  FKMapsBrand *brand;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)FKMapsTransactionInsight;
  v13 = -[FKMapsTransactionInsight init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    updatedAt = v13->_updatedAt;
    v13->_updatedAt = (NSDate *)v14;

    v13->_fallbackCategory = a4;
    v16 = objc_msgSend(v11, "copy");
    merchant = v13->_merchant;
    v13->_merchant = (FKMapsMerchant *)v16;

    v18 = objc_msgSend(v12, "copy");
    brand = v13->_brand;
    v13->_brand = (FKMapsBrand *)v18;

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSDate copyWithZone:](self->_updatedAt, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_fallbackCategory;
  v8 = -[FKMapsMerchant copyWithZone:](self->_merchant, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[FKMapsBrand copyWithZone:](self->_brand, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_updatedAt);
  objc_msgSend(v3, "safelyAddObject:", self->_merchant);
  objc_msgSend(v3, "safelyAddObject:", self->_brand);
  v4 = FKCombinedHash(17, v3);
  v5 = FKIntegerHash(v4, self->_fallbackCategory);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FKMapsTransactionInsight *v4;
  FKMapsTransactionInsight *v5;
  void **v6;
  char v7;

  v4 = (FKMapsTransactionInsight *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_updatedAt, v6[1])
      && (void *)self->_fallbackCategory == v6[2]
      && FKEqualObjects(self->_merchant, v6[3]))
    {
      v7 = FKEqualObjects(self->_brand, v6[4]);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (void)setUpdatedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)fallbackCategory
{
  return self->_fallbackCategory;
}

- (void)setFallbackCategory:(unint64_t)a3
{
  self->_fallbackCategory = a3;
}

- (FKMapsMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FKMapsBrand)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
}

@end
