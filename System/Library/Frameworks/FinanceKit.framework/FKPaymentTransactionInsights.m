@implementation FKPaymentTransactionInsights

- (FKPaymentTransactionInsights)initWithApplePayInsight:(id)a3 bankMerchantInformationInsight:(id)a4 mapsInsight:(id)a5
{
  return -[FKPaymentTransactionInsights initWithApplePayInsight:bankMerchantInformationInsight:mapsInsight:contactInsight:](self, "initWithApplePayInsight:bankMerchantInformationInsight:mapsInsight:contactInsight:", a3, a4, a5, 0);
}

- (FKPaymentTransactionInsights)initWithApplePayInsight:(id)a3 bankMerchantInformationInsight:(id)a4 mapsInsight:(id)a5 contactInsight:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FKPaymentTransactionInsights *v14;
  uint64_t v15;
  FKApplePayTransactionInsight *applePayInsight;
  uint64_t v17;
  FKBankMerchantInformationInsight *bankMerchantInformationInsight;
  uint64_t v19;
  FKMapsTransactionInsight *mapsInsight;
  uint64_t v21;
  FKContactTransactionInsight *contactInsight;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FKPaymentTransactionInsights;
  v14 = -[FKPaymentTransactionInsights init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    applePayInsight = v14->_applePayInsight;
    v14->_applePayInsight = (FKApplePayTransactionInsight *)v15;

    v17 = objc_msgSend(v11, "copy");
    bankMerchantInformationInsight = v14->_bankMerchantInformationInsight;
    v14->_bankMerchantInformationInsight = (FKBankMerchantInformationInsight *)v17;

    v19 = objc_msgSend(v12, "copy");
    mapsInsight = v14->_mapsInsight;
    v14->_mapsInsight = (FKMapsTransactionInsight *)v19;

    v21 = objc_msgSend(v13, "copy");
    contactInsight = v14->_contactInsight;
    v14->_contactInsight = (FKContactTransactionInsight *)v21;

  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[FKApplePayTransactionInsight copyWithZone:](self->_applePayInsight, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[FKBankMerchantInformationInsight copyWithZone:](self->_bankMerchantInformationInsight, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[FKMapsTransactionInsight copyWithZone:](self->_mapsInsight, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[FKContactTransactionInsight copyWithZone:](self->_contactInsight, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_applePayInsight);
  objc_msgSend(v3, "safelyAddObject:", self->_bankMerchantInformationInsight);
  objc_msgSend(v3, "safelyAddObject:", self->_mapsInsight);
  objc_msgSend(v3, "safelyAddObject:", self->_contactInsight);
  v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  FKPaymentTransactionInsights *v4;
  FKPaymentTransactionInsights *v5;
  void **v6;
  char v7;

  v4 = (FKPaymentTransactionInsights *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_applePayInsight, v6[1])
      && FKEqualObjects(self->_bankMerchantInformationInsight, v6[2])
      && FKEqualObjects(self->_mapsInsight, v6[3]))
    {
      v7 = FKEqualObjects(self->_contactInsight, v6[4]);
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

- (FKApplePayTransactionInsight)applePayInsight
{
  return self->_applePayInsight;
}

- (void)setApplePayInsight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FKBankMerchantInformationInsight)bankMerchantInformationInsight
{
  return self->_bankMerchantInformationInsight;
}

- (void)setBankMerchantInformationInsight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FKMapsTransactionInsight)mapsInsight
{
  return self->_mapsInsight;
}

- (void)setMapsInsight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FKContactTransactionInsight)contactInsight
{
  return self->_contactInsight;
}

- (void)setContactInsight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactInsight, 0);
  objc_storeStrong((id *)&self->_mapsInsight, 0);
  objc_storeStrong((id *)&self->_bankMerchantInformationInsight, 0);
  objc_storeStrong((id *)&self->_applePayInsight, 0);
}

@end
