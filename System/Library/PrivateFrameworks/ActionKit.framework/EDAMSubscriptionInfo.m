@implementation EDAMSubscriptionInfo

+ (id)structName
{
  return CFSTR("SubscriptionInfo");
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
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[11];

  v17[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_754;
  if (!structFields_structFields_754)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 0, CFSTR("currentTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 0, CFSTR("currentlySubscribed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 0, CFSTR("subscriptionRecurring"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 10, 1, CFSTR("subscriptionExpirationDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 0, CFSTR("subscriptionPending"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 0, CFSTR("subscriptionCancellationPending"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 7, 14, 0, CFSTR("serviceLevelsEligibleForPurchase"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 11, 1, CFSTR("currentSku"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 10, 1, CFSTR("validUntil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[8] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 2, 1, CFSTR("itunesReceiptRequested"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[9] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 10);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_754;
    structFields_structFields_754 = v12;

    v2 = (void *)structFields_structFields_754;
  }
  return v2;
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(id)a3
{
  objc_storeStrong((id *)&self->_currentTime, a3);
}

- (NSNumber)currentlySubscribed
{
  return self->_currentlySubscribed;
}

- (void)setCurrentlySubscribed:(id)a3
{
  objc_storeStrong((id *)&self->_currentlySubscribed, a3);
}

- (NSNumber)subscriptionRecurring
{
  return self->_subscriptionRecurring;
}

- (void)setSubscriptionRecurring:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionRecurring, a3);
}

- (NSNumber)subscriptionExpirationDate
{
  return self->_subscriptionExpirationDate;
}

- (void)setSubscriptionExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionExpirationDate, a3);
}

- (NSNumber)subscriptionPending
{
  return self->_subscriptionPending;
}

- (void)setSubscriptionPending:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionPending, a3);
}

- (NSNumber)subscriptionCancellationPending
{
  return self->_subscriptionCancellationPending;
}

- (void)setSubscriptionCancellationPending:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionCancellationPending, a3);
}

- (NSSet)serviceLevelsEligibleForPurchase
{
  return self->_serviceLevelsEligibleForPurchase;
}

- (void)setServiceLevelsEligibleForPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLevelsEligibleForPurchase, a3);
}

- (NSString)currentSku
{
  return self->_currentSku;
}

- (void)setCurrentSku:(id)a3
{
  objc_storeStrong((id *)&self->_currentSku, a3);
}

- (NSNumber)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(id)a3
{
  objc_storeStrong((id *)&self->_validUntil, a3);
}

- (NSNumber)itunesReceiptRequested
{
  return self->_itunesReceiptRequested;
}

- (void)setItunesReceiptRequested:(id)a3
{
  objc_storeStrong((id *)&self->_itunesReceiptRequested, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itunesReceiptRequested, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_currentSku, 0);
  objc_storeStrong((id *)&self->_serviceLevelsEligibleForPurchase, 0);
  objc_storeStrong((id *)&self->_subscriptionCancellationPending, 0);
  objc_storeStrong((id *)&self->_subscriptionPending, 0);
  objc_storeStrong((id *)&self->_subscriptionExpirationDate, 0);
  objc_storeStrong((id *)&self->_subscriptionRecurring, 0);
  objc_storeStrong((id *)&self->_currentlySubscribed, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

@end
