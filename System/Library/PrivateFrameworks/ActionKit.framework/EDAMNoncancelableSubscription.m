@implementation EDAMNoncancelableSubscription

+ (id)structName
{
  return CFSTR("NoncancelableSubscription");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[14];

  v19[13] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2413;
  if (!structFields_structFields_2413)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 0, CFSTR("subscriptionId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v18;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 1, CFSTR("user"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("premiumServiceStatus"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("premiumCommerceService"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("itunesReceiptData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("amazonUserId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[5] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 11, 1, CFSTR("amazonPurchaseToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[6] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 11, 1, CFSTR("premiumServiceSku"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[7] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 10, 1, CFSTR("nextPaymentDue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[8] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 10, 1, CFSTR("premiumLockUntil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[9] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 11, 1, CFSTR("currency"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[10] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 8, 1, CFSTR("unitPrice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[11] = v11;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 11, 1, CFSTR("itunesOriginalTransactionId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[12] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 13);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_2413;
    structFields_structFields_2413 = v13;

    v2 = (void *)structFields_structFields_2413;
  }
  return v2;
}

- (NSNumber)subscriptionId
{
  return self->_subscriptionId;
}

- (void)setSubscriptionId:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionId, a3);
}

- (EDAMUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_storeStrong((id *)&self->_user, a3);
}

- (NSNumber)premiumServiceStatus
{
  return self->_premiumServiceStatus;
}

- (void)setPremiumServiceStatus:(id)a3
{
  objc_storeStrong((id *)&self->_premiumServiceStatus, a3);
}

- (NSString)premiumCommerceService
{
  return self->_premiumCommerceService;
}

- (void)setPremiumCommerceService:(id)a3
{
  objc_storeStrong((id *)&self->_premiumCommerceService, a3);
}

- (NSString)itunesReceiptData
{
  return self->_itunesReceiptData;
}

- (void)setItunesReceiptData:(id)a3
{
  objc_storeStrong((id *)&self->_itunesReceiptData, a3);
}

- (NSString)amazonUserId
{
  return self->_amazonUserId;
}

- (void)setAmazonUserId:(id)a3
{
  objc_storeStrong((id *)&self->_amazonUserId, a3);
}

- (NSString)amazonPurchaseToken
{
  return self->_amazonPurchaseToken;
}

- (void)setAmazonPurchaseToken:(id)a3
{
  objc_storeStrong((id *)&self->_amazonPurchaseToken, a3);
}

- (NSString)premiumServiceSku
{
  return self->_premiumServiceSku;
}

- (void)setPremiumServiceSku:(id)a3
{
  objc_storeStrong((id *)&self->_premiumServiceSku, a3);
}

- (NSNumber)nextPaymentDue
{
  return self->_nextPaymentDue;
}

- (void)setNextPaymentDue:(id)a3
{
  objc_storeStrong((id *)&self->_nextPaymentDue, a3);
}

- (NSNumber)premiumLockUntil
{
  return self->_premiumLockUntil;
}

- (void)setPremiumLockUntil:(id)a3
{
  objc_storeStrong((id *)&self->_premiumLockUntil, a3);
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

- (NSString)itunesOriginalTransactionId
{
  return self->_itunesOriginalTransactionId;
}

- (void)setItunesOriginalTransactionId:(id)a3
{
  objc_storeStrong((id *)&self->_itunesOriginalTransactionId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itunesOriginalTransactionId, 0);
  objc_storeStrong((id *)&self->_unitPrice, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_premiumLockUntil, 0);
  objc_storeStrong((id *)&self->_nextPaymentDue, 0);
  objc_storeStrong((id *)&self->_premiumServiceSku, 0);
  objc_storeStrong((id *)&self->_amazonPurchaseToken, 0);
  objc_storeStrong((id *)&self->_amazonUserId, 0);
  objc_storeStrong((id *)&self->_itunesReceiptData, 0);
  objc_storeStrong((id *)&self->_premiumCommerceService, 0);
  objc_storeStrong((id *)&self->_premiumServiceStatus, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_subscriptionId, 0);
}

@end
