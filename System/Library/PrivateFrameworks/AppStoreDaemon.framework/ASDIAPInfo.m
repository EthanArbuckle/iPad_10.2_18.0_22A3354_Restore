@implementation ASDIAPInfo

- (NSNumber)expirationTimestamp
{
  void *expirationDate;
  void *v3;

  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(expirationDate, "timeIntervalSince1970");
    objc_msgSend(v3, "numberWithDouble:");
    expirationDate = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)expirationDate;
}

- (NSNumber)lastModifiedTimestamp
{
  void *lastModifiedDate;
  void *v3;

  lastModifiedDate = self->_lastModifiedDate;
  if (lastModifiedDate)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(lastModifiedDate, "timeIntervalSince1970");
    objc_msgSend(v3, "numberWithDouble:");
    lastModifiedDate = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)lastModifiedDate;
}

- (NSNumber)purchaseTimestamp
{
  void *purchaseDate;
  void *v3;

  purchaseDate = self->_purchaseDate;
  if (purchaseDate)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(purchaseDate, "timeIntervalSince1970");
    objc_msgSend(v3, "numberWithDouble:");
    purchaseDate = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)purchaseDate;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = CFSTR("YES");
  if (self->_hasUsedFreeOffer)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (self->_hasUsedIntroPricingOffer)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (!self->_autoRenewStatus)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AdamID: %@, AppAdamID: %@, PurchaseDate: %@, LastModifiedDate: %@, ExpirationDate: %@, Type: %i, HasUsedFreeOffer: %@, HasUsedIntroPricingOffer: %@, Subscription Family ID: %@, AutoRenewStatus: %@"), *(_OWORD *)&self->_adamId, self->_purchaseDate, self->_lastModifiedDate, self->_expirationDate, self->_type, v3, v4, self->_subscriptionFamilyId, v2);
}

- (BOOL)isEqual:(id)a3
{
  ASDIAPInfo *v4;
  ASDIAPInfo *v5;
  NSNumber *adamId;
  NSNumber *v7;
  BOOL v8;
  NSNumber *appAdamId;
  NSNumber *v10;
  NSDate *expirationDate;
  NSDate *v12;
  NSDate *lastModifiedDate;
  NSDate *v14;
  NSDate *purchaseDate;
  NSDate *v16;
  NSString *subscriptionFamilyId;
  NSString *v18;

  v4 = (ASDIAPInfo *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (!self)
        goto LABEL_34;
      adamId = self->_adamId;
      v7 = v5->_adamId;
      if (adamId != v7)
      {
        v8 = 0;
        if (!adamId || !v7)
          goto LABEL_35;
        if (!-[NSNumber isEqual:](adamId, "isEqual:"))
          goto LABEL_34;
      }
      appAdamId = self->_appAdamId;
      v10 = v5->_appAdamId;
      if (appAdamId != v10)
      {
        v8 = 0;
        if (!appAdamId || !v10)
          goto LABEL_35;
        if (!-[NSNumber isEqual:](appAdamId, "isEqual:"))
          goto LABEL_34;
      }
      expirationDate = self->_expirationDate;
      v12 = v5->_expirationDate;
      if (expirationDate != v12)
      {
        v8 = 0;
        if (!expirationDate || !v12)
          goto LABEL_35;
        if (!-[NSDate isEqual:](expirationDate, "isEqual:"))
          goto LABEL_34;
      }
      if (self->_hasUsedFreeOffer != v5->_hasUsedFreeOffer
        || self->_hasUsedIntroPricingOffer != v5->_hasUsedIntroPricingOffer)
      {
        goto LABEL_34;
      }
      lastModifiedDate = self->_lastModifiedDate;
      v14 = v5->_lastModifiedDate;
      if (lastModifiedDate != v14)
      {
        v8 = 0;
        if (!lastModifiedDate || !v14)
          goto LABEL_35;
        if (!-[NSDate isEqual:](lastModifiedDate, "isEqual:"))
          goto LABEL_34;
      }
      purchaseDate = self->_purchaseDate;
      v16 = v5->_purchaseDate;
      if (purchaseDate != v16)
      {
        v8 = 0;
        if (!purchaseDate || !v16)
          goto LABEL_35;
        if (!-[NSDate isEqual:](purchaseDate, "isEqual:"))
          goto LABEL_34;
      }
      subscriptionFamilyId = self->_subscriptionFamilyId;
      v18 = v5->_subscriptionFamilyId;
      if (subscriptionFamilyId != v18)
      {
        v8 = 0;
        if (!subscriptionFamilyId || !v18)
          goto LABEL_35;
        if (!-[NSString isEqual:](subscriptionFamilyId, "isEqual:"))
          goto LABEL_34;
      }
      if (self->_type == v5->_type)
        v8 = self->_autoRenewStatus == v5->_autoRenewStatus;
      else
LABEL_34:
        v8 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v8 = 0;
  }
LABEL_36:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  if (-[ASDIAPInfo isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return self;
  v5 = (void *)objc_opt_class();
  return (id)-[ASDIAPInfo _newCopyWithClass:zone:]((uint64_t)self, v5, (uint64_t)a3);
}

- (uint64_t)_newCopyWithClass:(uint64_t)a3 zone:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  if (!a1)
    return 0;
  v5 = objc_msgSend((id)objc_msgSend(a2, "allocWithZone:"), "init");
  v6 = objc_msgSend(*(id *)(a1 + 16), "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = objc_msgSend(*(id *)(a1 + 24), "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = objc_msgSend(*(id *)(a1 + 48), "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = objc_msgSend(*(id *)(a1 + 40), "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = objc_msgSend(*(id *)(a1 + 32), "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  *(_BYTE *)(v5 + 11) = *(_BYTE *)(a1 + 11);
  *(_BYTE *)(v5 + 9) = *(_BYTE *)(a1 + 9);
  *(_BYTE *)(v5 + 10) = *(_BYTE *)(a1 + 10);
  v16 = objc_msgSend(*(id *)(a1 + 56), "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  *(_BYTE *)(v5 + 8) = *(_BYTE *)(a1 + 8);
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_opt_class();
  return (id)-[ASDIAPInfo _newCopyWithClass:zone:]((uint64_t)self, v5, (uint64_t)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *adamId;
  id v5;

  adamId = self->_adamId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", adamId, CFSTR("ASDIAPInfoAdamIdCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appAdamId, CFSTR("ASDIAPInfoAppAdamIdCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaseDate, CFSTR("ASDIAPInfoPurchaseDateCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastModifiedDate, CFSTR("ASDIAPInfoLastModifiedDateCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("ASDIAPInfoExpirationDateCodingKey"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_type, CFSTR("ASDIAPInfoTypeCodingKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasUsedFreeOffer, CFSTR("ASDIAPInfoHasUsedFreeOfferCodingKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasUsedIntroPricingOffer, CFSTR("ASDIAPInfoHasUsedIntroPricingOfferCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subscriptionFamilyId, CFSTR("ASDIAPInfoSubscriptionFamilyIdCodingKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_autoRenewStatus, CFSTR("ASDIAPInfoSubscriptionAutoRenewStatusCodingKey"));

}

- (ASDIAPInfo)initWithCoder:(id)a3
{
  id v4;
  ASDIAPInfo *v5;
  uint64_t v6;
  NSNumber *adamId;
  uint64_t v8;
  NSNumber *appAdamId;
  uint64_t v10;
  NSDate *purchaseDate;
  uint64_t v12;
  NSDate *lastModifiedDate;
  uint64_t v14;
  NSDate *expirationDate;
  uint64_t v16;
  NSString *subscriptionFamilyId;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASDIAPInfo;
  v5 = -[ASDIAPInfo init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ASDIAPInfoAdamIdCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    adamId = v5->_adamId;
    v5->_adamId = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ASDIAPInfoAppAdamIdCodingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    appAdamId = v5->_appAdamId;
    v5->_appAdamId = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ASDIAPInfoPurchaseDateCodingKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ASDIAPInfoLastModifiedDateCodingKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ASDIAPInfoExpirationDateCodingKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v14;

    v5->_type = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ASDIAPInfoTypeCodingKey"));
    v5->_hasUsedFreeOffer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ASDIAPInfoHasUsedFreeOfferCodingKey"));
    v5->_hasUsedIntroPricingOffer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ASDIAPInfoHasUsedIntroPricingOfferCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ASDIAPInfoSubscriptionFamilyIdCodingKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    subscriptionFamilyId = v5->_subscriptionFamilyId;
    v5->_subscriptionFamilyId = (NSString *)v16;

    v5->_autoRenewStatus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ASDIAPInfoSubscriptionAutoRenewStatusCodingKey"));
  }

  return v5;
}

- (NSNumber)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_adamId, a3);
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_appAdamId, a3);
}

- (BOOL)autoRenewStatus
{
  return self->_autoRenewStatus;
}

- (void)setAutoRenewStatus:(BOOL)a3
{
  self->_autoRenewStatus = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (BOOL)hasUsedFreeOffer
{
  return self->_hasUsedFreeOffer;
}

- (void)setHasUsedFreeOffer:(BOOL)a3
{
  self->_hasUsedFreeOffer = a3;
}

- (BOOL)hasUsedIntroPricingOffer
{
  return self->_hasUsedIntroPricingOffer;
}

- (void)setHasUsedIntroPricingOffer:(BOOL)a3
{
  self->_hasUsedIntroPricingOffer = a3;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedDate, a3);
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseDate, a3);
}

- (NSString)subscriptionFamilyId
{
  return self->_subscriptionFamilyId;
}

- (void)setSubscriptionFamilyId:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionFamilyId, a3);
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionFamilyId, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
}

@end
