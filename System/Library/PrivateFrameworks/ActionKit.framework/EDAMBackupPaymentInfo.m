@implementation EDAMBackupPaymentInfo

+ (id)structName
{
  return CFSTR("BackupPaymentInfo");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_344;
  if (!structFields_structFields_344)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("premiumCommerceService"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("premiumServiceSKU"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("currency"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 0, CFSTR("unitPrice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 0, CFSTR("paymentMethodId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_344;
    structFields_structFields_344 = v8;

    v2 = (void *)structFields_structFields_344;
  }
  return v2;
}

- (NSString)premiumCommerceService
{
  return self->_premiumCommerceService;
}

- (void)setPremiumCommerceService:(id)a3
{
  objc_storeStrong((id *)&self->_premiumCommerceService, a3);
}

- (NSString)premiumServiceSKU
{
  return self->_premiumServiceSKU;
}

- (void)setPremiumServiceSKU:(id)a3
{
  objc_storeStrong((id *)&self->_premiumServiceSKU, a3);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_currency, a3);
}

- (NSNumber)unitPrice
{
  return self->_unitPrice;
}

- (void)setUnitPrice:(id)a3
{
  objc_storeStrong((id *)&self->_unitPrice, a3);
}

- (NSNumber)paymentMethodId
{
  return self->_paymentMethodId;
}

- (void)setPaymentMethodId:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethodId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethodId, 0);
  objc_storeStrong((id *)&self->_unitPrice, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_premiumServiceSKU, 0);
  objc_storeStrong((id *)&self->_premiumCommerceService, 0);
}

@end
