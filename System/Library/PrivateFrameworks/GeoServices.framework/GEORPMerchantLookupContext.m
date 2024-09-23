@implementation GEORPMerchantLookupContext

- (GEORPMerchantLookupContext)init
{
  GEORPMerchantLookupContext *v2;
  GEORPMerchantLookupContext *v3;
  GEORPMerchantLookupContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPMerchantLookupContext;
  v2 = -[GEORPMerchantLookupContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPMerchantLookupContext)initWithData:(id)a3
{
  GEORPMerchantLookupContext *v3;
  GEORPMerchantLookupContext *v4;
  GEORPMerchantLookupContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPMerchantLookupContext;
  v3 = -[GEORPMerchantLookupContext initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int64_t)merchantIndustryCode
{
  return self->_merchantIndustryCode;
}

- (void)setMerchantIndustryCode:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x8001u;
  self->_merchantIndustryCode = a3;
}

- (void)setHasMerchantIndustryCode:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0x7FFE | a3 | 0x8000;
}

- (BOOL)hasMerchantIndustryCode
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readMerchantId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantId
{
  -[GEORPMerchantLookupContext _readMerchantId]((uint64_t)self);
  return self->_merchantId != 0;
}

- (GEOPDMapsIdentifier)merchantId
{
  -[GEORPMerchantLookupContext _readMerchantId]((uint64_t)self);
  return self->_merchantId;
}

- (void)setMerchantId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8100u;
  objc_storeStrong((id *)&self->_merchantId, a3);
}

- (void)_readMerchantName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantName
{
  -[GEORPMerchantLookupContext _readMerchantName]((uint64_t)self);
  return self->_merchantName != 0;
}

- (NSString)merchantName
{
  -[GEORPMerchantLookupContext _readMerchantName]((uint64_t)self);
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8400u;
  objc_storeStrong((id *)&self->_merchantName, a3);
}

- (void)_readMerchantRawName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantRawName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantRawName
{
  -[GEORPMerchantLookupContext _readMerchantRawName]((uint64_t)self);
  return self->_merchantRawName != 0;
}

- (NSString)merchantRawName
{
  -[GEORPMerchantLookupContext _readMerchantRawName]((uint64_t)self);
  return self->_merchantRawName;
}

- (void)setMerchantRawName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8800u;
  objc_storeStrong((id *)&self->_merchantRawName, a3);
}

- (void)_readMerchantIndustryCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantIndustryCategory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantIndustryCategory
{
  -[GEORPMerchantLookupContext _readMerchantIndustryCategory]((uint64_t)self);
  return self->_merchantIndustryCategory != 0;
}

- (NSString)merchantIndustryCategory
{
  -[GEORPMerchantLookupContext _readMerchantIndustryCategory]((uint64_t)self);
  return self->_merchantIndustryCategory;
}

- (void)setMerchantIndustryCategory:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8200u;
  objc_storeStrong((id *)&self->_merchantIndustryCategory, a3);
}

- (void)_readMerchantUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantUrl_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantUrl
{
  -[GEORPMerchantLookupContext _readMerchantUrl]((uint64_t)self);
  return self->_merchantUrl != 0;
}

- (NSString)merchantUrl
{
  -[GEORPMerchantLookupContext _readMerchantUrl]((uint64_t)self);
  return self->_merchantUrl;
}

- (void)setMerchantUrl:(id)a3
{
  *(_WORD *)&self->_flags |= 0x9000u;
  objc_storeStrong((id *)&self->_merchantUrl, a3);
}

- (void)_readMerchantFormattedAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantFormattedAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantFormattedAddress
{
  -[GEORPMerchantLookupContext _readMerchantFormattedAddress]((uint64_t)self);
  return self->_merchantFormattedAddress != 0;
}

- (NSString)merchantFormattedAddress
{
  -[GEORPMerchantLookupContext _readMerchantFormattedAddress]((uint64_t)self);
  return self->_merchantFormattedAddress;
}

- (void)setMerchantFormattedAddress:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8080u;
  objc_storeStrong((id *)&self->_merchantFormattedAddress, a3);
}

- (void)_readMerchantAdamId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantAdamId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantAdamId
{
  -[GEORPMerchantLookupContext _readMerchantAdamId]((uint64_t)self);
  return self->_merchantAdamId != 0;
}

- (NSString)merchantAdamId
{
  -[GEORPMerchantLookupContext _readMerchantAdamId]((uint64_t)self);
  return self->_merchantAdamId;
}

- (void)setMerchantAdamId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8020u;
  objc_storeStrong((id *)&self->_merchantAdamId, a3);
}

- (double)transactionTime
{
  return self->_transactionTime;
}

- (void)setTransactionTime:(double)a3
{
  *(_WORD *)&self->_flags |= 0x8002u;
  self->_transactionTime = a3;
}

- (void)setHasTransactionTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32766;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasTransactionTime
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readTransactionType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransactionType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasTransactionType
{
  -[GEORPMerchantLookupContext _readTransactionType]((uint64_t)self);
  return self->_transactionType != 0;
}

- (NSString)transactionType
{
  -[GEORPMerchantLookupContext _readTransactionType]((uint64_t)self);
  return self->_transactionType;
}

- (void)setTransactionType:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC000u;
  objc_storeStrong((id *)&self->_transactionType, a3);
}

- (void)_readTransactionLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransactionLocation_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasTransactionLocation
{
  -[GEORPMerchantLookupContext _readTransactionLocation]((uint64_t)self);
  return self->_transactionLocation != 0;
}

- (GEOLocation)transactionLocation
{
  -[GEORPMerchantLookupContext _readTransactionLocation]((uint64_t)self);
  return self->_transactionLocation;
}

- (void)setTransactionLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA000u;
  objc_storeStrong((id *)&self->_transactionLocation, a3);
}

- (void)_readCorrelationId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrelationId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasCorrelationId
{
  -[GEORPMerchantLookupContext _readCorrelationId]((uint64_t)self);
  return self->_correlationId != 0;
}

- (NSString)correlationId
{
  -[GEORPMerchantLookupContext _readCorrelationId]((uint64_t)self);
  return self->_correlationId;
}

- (void)setCorrelationId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8010u;
  objc_storeStrong((id *)&self->_correlationId, a3);
}

- (BOOL)isAppleCard
{
  return self->_isAppleCard;
}

- (void)setIsAppleCard:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x8008u;
  self->_isAppleCard = a3;
}

- (void)setHasIsAppleCard:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32760;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasIsAppleCard
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)requestTransactionType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_requestTransactionType;
  else
    return 0;
}

- (void)setRequestTransactionType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8004u;
  self->_requestTransactionType = a3;
}

- (void)setHasRequestTransactionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32764;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasRequestTransactionType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)requestTransactionTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0EBF8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestTransactionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACTLESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INAPP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEB")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHYSICAL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VIRTUAL")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readMerchantBankTransactionInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantBankTransactionInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantBankTransactionInfo
{
  -[GEORPMerchantLookupContext _readMerchantBankTransactionInfo]((uint64_t)self);
  return self->_merchantBankTransactionInfo != 0;
}

- (GEOPDBankTransactionInformation)merchantBankTransactionInfo
{
  -[GEORPMerchantLookupContext _readMerchantBankTransactionInfo]((uint64_t)self);
  return self->_merchantBankTransactionInfo;
}

- (void)setMerchantBankTransactionInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8040u;
  objc_storeStrong((id *)&self->_merchantBankTransactionInfo, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEORPMerchantLookupContext;
  -[GEORPMerchantLookupContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPMerchantLookupContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPMerchantLookupContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  __int16 v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  __CFString *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_WORD *)(a1 + 140) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 64));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("merchantIndustryCode");
      else
        v6 = CFSTR("merchant_industry_code");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
    objc_msgSend((id)a1, "merchantId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "jsonRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("merchantId");
      }
      else
      {
        objc_msgSend(v7, "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("merchant_id");
      }
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
    objc_msgSend((id)a1, "merchantName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a2)
        v12 = CFSTR("merchantName");
      else
        v12 = CFSTR("merchant_name");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);
    }

    objc_msgSend((id)a1, "merchantRawName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (a2)
        v14 = CFSTR("merchantRawName");
      else
        v14 = CFSTR("merchant_raw_name");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);
    }

    objc_msgSend((id)a1, "merchantIndustryCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a2)
        v16 = CFSTR("merchantIndustryCategory");
      else
        v16 = CFSTR("merchant_industry_category");
      objc_msgSend(v4, "setObject:forKey:", v15, v16);
    }

    objc_msgSend((id)a1, "merchantUrl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (a2)
        v18 = CFSTR("merchantUrl");
      else
        v18 = CFSTR("merchant_url");
      objc_msgSend(v4, "setObject:forKey:", v17, v18);
    }

    objc_msgSend((id)a1, "merchantFormattedAddress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if (a2)
        v20 = CFSTR("merchantFormattedAddress");
      else
        v20 = CFSTR("merchant_formatted_address");
      objc_msgSend(v4, "setObject:forKey:", v19, v20);
    }

    objc_msgSend((id)a1, "merchantAdamId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if (a2)
        v22 = CFSTR("merchantAdamId");
      else
        v22 = CFSTR("merchant_adam_id");
      objc_msgSend(v4, "setObject:forKey:", v21, v22);
    }

    if ((*(_WORD *)(a1 + 140) & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v24 = CFSTR("transactionTime");
      else
        v24 = CFSTR("transaction_time");
      objc_msgSend(v4, "setObject:forKey:", v23, v24);

    }
    objc_msgSend((id)a1, "transactionType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      if (a2)
        v26 = CFSTR("transactionType");
      else
        v26 = CFSTR("transaction_type");
      objc_msgSend(v4, "setObject:forKey:", v25, v26);
    }

    objc_msgSend((id)a1, "transactionLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v27, "jsonRepresentation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = CFSTR("transactionLocation");
      }
      else
      {
        objc_msgSend(v27, "dictionaryRepresentation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = CFSTR("transaction_location");
      }
      objc_msgSend(v4, "setObject:forKey:", v29, v30);

    }
    objc_msgSend((id)a1, "correlationId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      if (a2)
        v32 = CFSTR("correlationId");
      else
        v32 = CFSTR("correlation_id");
      objc_msgSend(v4, "setObject:forKey:", v31, v32);
    }

    v33 = *(_WORD *)(a1 + 140);
    if ((v33 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 136));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v35 = CFSTR("isAppleCard");
      else
        v35 = CFSTR("is_apple_card");
      objc_msgSend(v4, "setObject:forKey:", v34, v35);

      v33 = *(_WORD *)(a1 + 140);
    }
    if ((v33 & 4) != 0)
    {
      v36 = *(int *)(a1 + 132);
      if (v36 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 132));
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v37 = off_1E1C0EBF8[v36];
      }
      if (a2)
        v38 = CFSTR("requestTransactionType");
      else
        v38 = CFSTR("request_transaction_type");
      objc_msgSend(v4, "setObject:forKey:", v37, v38);

    }
    objc_msgSend((id)a1, "merchantBankTransactionInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v39, "jsonRepresentation");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = CFSTR("merchantBankTransactionInfo");
      }
      else
      {
        objc_msgSend(v39, "dictionaryRepresentation");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = CFSTR("merchant_bank_transaction_info");
      }
      objc_msgSend(v4, "setObject:forKey:", v41, v42);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPMerchantLookupContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPMerchantLookupContext)initWithDictionary:(id)a3
{
  return (GEORPMerchantLookupContext *)-[GEORPMerchantLookupContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEOPDMapsIdentifier *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEOLocation *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  id v48;
  uint64_t v49;
  const __CFString *v50;
  void *v51;
  GEOPDBankTransactionInformation *v52;
  uint64_t v53;
  void *v54;

  v5 = a2;
  if (!a1)
    goto LABEL_104;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_104;
  if (a3)
    v6 = CFSTR("merchantIndustryCode");
  else
    v6 = CFSTR("merchant_industry_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMerchantIndustryCode:", objc_msgSend(v7, "longLongValue"));

  if (a3)
    v8 = CFSTR("merchantId");
  else
    v8 = CFSTR("merchant_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEOPDMapsIdentifier initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEOPDMapsIdentifier initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setMerchantId:", v11);

  }
  if (a3)
    v13 = CFSTR("merchantName");
  else
    v13 = CFSTR("merchant_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(a1, "setMerchantName:", v15);

  }
  if (a3)
    v16 = CFSTR("merchantRawName");
  else
    v16 = CFSTR("merchant_raw_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(a1, "setMerchantRawName:", v18);

  }
  if (a3)
    v19 = CFSTR("merchantIndustryCategory");
  else
    v19 = CFSTR("merchant_industry_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(a1, "setMerchantIndustryCategory:", v21);

  }
  if (a3)
    v22 = CFSTR("merchantUrl");
  else
    v22 = CFSTR("merchant_url");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(a1, "setMerchantUrl:", v24);

  }
  if (a3)
    v25 = CFSTR("merchantFormattedAddress");
  else
    v25 = CFSTR("merchant_formatted_address");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(a1, "setMerchantFormattedAddress:", v27);

  }
  if (a3)
    v28 = CFSTR("merchantAdamId");
  else
    v28 = CFSTR("merchant_adam_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(a1, "setMerchantAdamId:", v30);

  }
  if (a3)
    v31 = CFSTR("transactionTime");
  else
    v31 = CFSTR("transaction_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v32, "doubleValue");
    objc_msgSend(a1, "setTransactionTime:");
  }

  if (a3)
    v33 = CFSTR("transactionType");
  else
    v33 = CFSTR("transaction_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(a1, "setTransactionType:", v35);

  }
  if (a3)
    v36 = CFSTR("transactionLocation");
  else
    v36 = CFSTR("transaction_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v39 = -[GEOLocation initWithJSON:](v38, "initWithJSON:", v37);
    else
      v39 = -[GEOLocation initWithDictionary:](v38, "initWithDictionary:", v37);
    v40 = (void *)v39;
    objc_msgSend(a1, "setTransactionLocation:", v39);

  }
  if (a3)
    v41 = CFSTR("correlationId");
  else
    v41 = CFSTR("correlation_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(a1, "setCorrelationId:", v43);

  }
  if (a3)
    v44 = CFSTR("isAppleCard");
  else
    v44 = CFSTR("is_apple_card");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsAppleCard:", objc_msgSend(v45, "BOOLValue"));

  if (a3)
    v46 = CFSTR("requestTransactionType");
  else
    v46 = CFSTR("request_transaction_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = v47;
    if ((objc_msgSend(v48, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v49 = 0;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("CONTACTLESS")) & 1) != 0)
    {
      v49 = 1;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("INAPP")) & 1) != 0)
    {
      v49 = 2;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("WEB")) & 1) != 0)
    {
      v49 = 3;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PHYSICAL")) & 1) != 0)
    {
      v49 = 4;
    }
    else if (objc_msgSend(v48, "isEqualToString:", CFSTR("VIRTUAL")))
    {
      v49 = 5;
    }
    else
    {
      v49 = 0;
    }

    goto LABEL_94;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = objc_msgSend(v47, "intValue");
LABEL_94:
    objc_msgSend(a1, "setRequestTransactionType:", v49);
  }

  if (a3)
    v50 = CFSTR("merchantBankTransactionInfo");
  else
    v50 = CFSTR("merchant_bank_transaction_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = [GEOPDBankTransactionInformation alloc];
    if ((a3 & 1) != 0)
      v53 = -[GEOPDBankTransactionInformation initWithJSON:](v52, "initWithJSON:", v51);
    else
      v53 = -[GEOPDBankTransactionInformation initWithDictionary:](v52, "initWithDictionary:", v51);
    v54 = (void *)v53;
    objc_msgSend(a1, "setMerchantBankTransactionInfo:", v53);

  }
LABEL_104:

  return a1;
}

- (GEORPMerchantLookupContext)initWithJSON:(id)a3
{
  return (GEORPMerchantLookupContext *)-[GEORPMerchantLookupContext _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_1222;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1223;
    GEORPMerchantLookupContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPDMapsIdentifier readAll:](self->_merchantId, "readAll:", 1);
    -[GEOLocation readAll:](self->_transactionLocation, "readAll:", 1);
    -[GEOPDBankTransactionInformation readAll:](self->_merchantBankTransactionInfo, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPMerchantLookupContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPMerchantLookupContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPMerchantLookupContextIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPMerchantLookupContext readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt64Field();
    if (self->_merchantId)
      PBDataWriterWriteSubmessage();
    if (self->_merchantName)
      PBDataWriterWriteStringField();
    if (self->_merchantRawName)
      PBDataWriterWriteStringField();
    if (self->_merchantIndustryCategory)
      PBDataWriterWriteStringField();
    if (self->_merchantUrl)
      PBDataWriterWriteStringField();
    if (self->_merchantFormattedAddress)
      PBDataWriterWriteStringField();
    if (self->_merchantAdamId)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_transactionType)
      PBDataWriterWriteStringField();
    if (self->_transactionLocation)
      PBDataWriterWriteSubmessage();
    if (self->_correlationId)
      PBDataWriterWriteStringField();
    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_merchantBankTransactionInfo)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPMerchantLookupContextClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPMerchantLookupContext _readMerchantBankTransactionInfo]((uint64_t)self);
  if (-[GEOPDBankTransactionInformation hasGreenTeaWithValue:](self->_merchantBankTransactionInfo, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEORPMerchantLookupContext _readMerchantId]((uint64_t)self);
  if (-[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_merchantId, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPMerchantLookupContext _readTransactionLocation]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_transactionLocation, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  id *v6;

  v6 = (id *)a3;
  -[GEORPMerchantLookupContext readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 30) = self->_readerMarkPos;
  *((_DWORD *)v6 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v6[8] = (id)self->_merchantIndustryCode;
    *((_WORD *)v6 + 70) |= 1u;
  }
  if (self->_merchantId)
  {
    objc_msgSend(v6, "setMerchantId:");
    v4 = v6;
  }
  if (self->_merchantName)
  {
    objc_msgSend(v6, "setMerchantName:");
    v4 = v6;
  }
  if (self->_merchantRawName)
  {
    objc_msgSend(v6, "setMerchantRawName:");
    v4 = v6;
  }
  if (self->_merchantIndustryCategory)
  {
    objc_msgSend(v6, "setMerchantIndustryCategory:");
    v4 = v6;
  }
  if (self->_merchantUrl)
  {
    objc_msgSend(v6, "setMerchantUrl:");
    v4 = v6;
  }
  if (self->_merchantFormattedAddress)
  {
    objc_msgSend(v6, "setMerchantFormattedAddress:");
    v4 = v6;
  }
  if (self->_merchantAdamId)
  {
    objc_msgSend(v6, "setMerchantAdamId:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v4[13] = *(id *)&self->_transactionTime;
    *((_WORD *)v4 + 70) |= 2u;
  }
  if (self->_transactionType)
  {
    objc_msgSend(v6, "setTransactionType:");
    v4 = v6;
  }
  if (self->_transactionLocation)
  {
    objc_msgSend(v6, "setTransactionLocation:");
    v4 = v6;
  }
  if (self->_correlationId)
  {
    objc_msgSend(v6, "setCorrelationId:");
    v4 = v6;
  }
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_BYTE *)v4 + 136) = self->_isAppleCard;
    *((_WORD *)v4 + 70) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_requestTransactionType;
    *((_WORD *)v4 + 70) |= 4u;
  }
  if (self->_merchantBankTransactionInfo)
  {
    objc_msgSend(v6, "setMerchantBankTransactionInfo:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int16 flags;
  id v30;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPMerchantLookupContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPMerchantLookupContext readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_merchantIndustryCode;
    *(_WORD *)(v5 + 140) |= 1u;
  }
  v9 = -[GEOPDMapsIdentifier copyWithZone:](self->_merchantId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[NSString copyWithZone:](self->_merchantName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  v13 = -[NSString copyWithZone:](self->_merchantRawName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v13;

  v15 = -[NSString copyWithZone:](self->_merchantIndustryCategory, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  v17 = -[NSString copyWithZone:](self->_merchantUrl, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v17;

  v19 = -[NSString copyWithZone:](self->_merchantFormattedAddress, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  v21 = -[NSString copyWithZone:](self->_merchantAdamId, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v21;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 104) = self->_transactionTime;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  v23 = -[NSString copyWithZone:](self->_transactionType, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v23;

  v25 = -[GEOLocation copyWithZone:](self->_transactionLocation, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v25;

  v27 = -[NSString copyWithZone:](self->_correlationId, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v27;

  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 136) = self->_isAppleCard;
    *(_WORD *)(v5 + 140) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_requestTransactionType;
    *(_WORD *)(v5 + 140) |= 4u;
  }
  v30 = -[GEOPDBankTransactionInformation copyWithZone:](self->_merchantBankTransactionInfo, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v30;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOPDMapsIdentifier *merchantId;
  NSString *merchantName;
  NSString *merchantRawName;
  NSString *merchantIndustryCategory;
  NSString *merchantUrl;
  NSString *merchantFormattedAddress;
  NSString *merchantAdamId;
  __int16 v13;
  NSString *transactionType;
  GEOLocation *transactionLocation;
  NSString *correlationId;
  __int16 flags;
  __int16 v18;
  GEOPDBankTransactionInformation *merchantBankTransactionInfo;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[GEORPMerchantLookupContext readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 70);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_merchantIndustryCode != *((_QWORD *)v4 + 8))
      goto LABEL_47;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_47;
  }
  merchantId = self->_merchantId;
  if ((unint64_t)merchantId | *((_QWORD *)v4 + 6) && !-[GEOPDMapsIdentifier isEqual:](merchantId, "isEqual:"))
    goto LABEL_47;
  merchantName = self->_merchantName;
  if ((unint64_t)merchantName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](merchantName, "isEqual:"))
      goto LABEL_47;
  }
  merchantRawName = self->_merchantRawName;
  if ((unint64_t)merchantRawName | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](merchantRawName, "isEqual:"))
      goto LABEL_47;
  }
  merchantIndustryCategory = self->_merchantIndustryCategory;
  if ((unint64_t)merchantIndustryCategory | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](merchantIndustryCategory, "isEqual:"))
      goto LABEL_47;
  }
  merchantUrl = self->_merchantUrl;
  if ((unint64_t)merchantUrl | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](merchantUrl, "isEqual:"))
      goto LABEL_47;
  }
  merchantFormattedAddress = self->_merchantFormattedAddress;
  if ((unint64_t)merchantFormattedAddress | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](merchantFormattedAddress, "isEqual:"))
      goto LABEL_47;
  }
  merchantAdamId = self->_merchantAdamId;
  if ((unint64_t)merchantAdamId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](merchantAdamId, "isEqual:"))
      goto LABEL_47;
  }
  v13 = *((_WORD *)v4 + 70);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_transactionTime != *((double *)v4 + 13))
      goto LABEL_47;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_47;
  }
  transactionType = self->_transactionType;
  if ((unint64_t)transactionType | *((_QWORD *)v4 + 14)
    && !-[NSString isEqual:](transactionType, "isEqual:"))
  {
    goto LABEL_47;
  }
  transactionLocation = self->_transactionLocation;
  if ((unint64_t)transactionLocation | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOLocation isEqual:](transactionLocation, "isEqual:"))
      goto LABEL_47;
  }
  correlationId = self->_correlationId;
  if ((unint64_t)correlationId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](correlationId, "isEqual:"))
      goto LABEL_47;
  }
  flags = (__int16)self->_flags;
  v18 = *((_WORD *)v4 + 70);
  if ((flags & 8) != 0)
  {
    if ((v18 & 8) != 0)
    {
      if (self->_isAppleCard)
      {
        if (!*((_BYTE *)v4 + 136))
          goto LABEL_47;
        goto LABEL_40;
      }
      if (!*((_BYTE *)v4 + 136))
        goto LABEL_40;
    }
LABEL_47:
    v20 = 0;
    goto LABEL_48;
  }
  if ((v18 & 8) != 0)
    goto LABEL_47;
LABEL_40:
  if ((flags & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_requestTransactionType != *((_DWORD *)v4 + 33))
      goto LABEL_47;
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_47;
  }
  merchantBankTransactionInfo = self->_merchantBankTransactionInfo;
  if ((unint64_t)merchantBankTransactionInfo | *((_QWORD *)v4 + 4))
    v20 = -[GEOPDBankTransactionInformation isEqual:](merchantBankTransactionInfo, "isEqual:");
  else
    v20 = 1;
LABEL_48:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  double transactionTime;
  double v9;
  long double v10;
  double v11;
  NSUInteger v12;
  unint64_t v13;
  NSUInteger v14;
  __int16 flags;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v19;
  NSUInteger v20;
  unint64_t v21;
  uint64_t v22;

  -[GEORPMerchantLookupContext readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v22 = 2654435761 * self->_merchantIndustryCode;
  else
    v22 = 0;
  v21 = -[GEOPDMapsIdentifier hash](self->_merchantId, "hash");
  v20 = -[NSString hash](self->_merchantName, "hash");
  v19 = -[NSString hash](self->_merchantRawName, "hash");
  v3 = -[NSString hash](self->_merchantIndustryCategory, "hash");
  v4 = -[NSString hash](self->_merchantUrl, "hash");
  v5 = -[NSString hash](self->_merchantFormattedAddress, "hash");
  v6 = -[NSString hash](self->_merchantAdamId, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    transactionTime = self->_transactionTime;
    v9 = -transactionTime;
    if (transactionTime >= 0.0)
      v9 = self->_transactionTime;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  v12 = -[NSString hash](self->_transactionType, "hash");
  v13 = -[GEOLocation hash](self->_transactionLocation, "hash");
  v14 = -[NSString hash](self->_correlationId, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v16 = 2654435761 * self->_isAppleCard;
    if ((flags & 4) != 0)
      goto LABEL_14;
LABEL_16:
    v17 = 0;
    return v21 ^ v22 ^ v20 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ -[GEOPDBankTransactionInformation hash](self->_merchantBankTransactionInfo, "hash");
  }
  v16 = 0;
  if ((flags & 4) == 0)
    goto LABEL_16;
LABEL_14:
  v17 = 2654435761 * self->_requestTransactionType;
  return v21 ^ v22 ^ v20 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ -[GEOPDBankTransactionInformation hash](self->_merchantBankTransactionInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  GEOPDMapsIdentifier *merchantId;
  int64_t v6;
  GEOLocation *transactionLocation;
  int64_t v8;
  __int16 v9;
  GEOPDBankTransactionInformation *merchantBankTransactionInfo;
  int64_t v11;
  int64_t *v12;

  v12 = (int64_t *)a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = v12;
  if ((*((_WORD *)v12 + 70) & 1) != 0)
  {
    self->_merchantIndustryCode = v12[8];
    *(_WORD *)&self->_flags |= 1u;
  }
  merchantId = self->_merchantId;
  v6 = v12[6];
  if (merchantId)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDMapsIdentifier mergeFrom:](merchantId, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPMerchantLookupContext setMerchantId:](self, "setMerchantId:");
  }
  v4 = v12;
LABEL_9:
  if (v4[9])
  {
    -[GEORPMerchantLookupContext setMerchantName:](self, "setMerchantName:");
    v4 = v12;
  }
  if (v4[10])
  {
    -[GEORPMerchantLookupContext setMerchantRawName:](self, "setMerchantRawName:");
    v4 = v12;
  }
  if (v4[7])
  {
    -[GEORPMerchantLookupContext setMerchantIndustryCategory:](self, "setMerchantIndustryCategory:");
    v4 = v12;
  }
  if (v4[11])
  {
    -[GEORPMerchantLookupContext setMerchantUrl:](self, "setMerchantUrl:");
    v4 = v12;
  }
  if (v4[5])
  {
    -[GEORPMerchantLookupContext setMerchantFormattedAddress:](self, "setMerchantFormattedAddress:");
    v4 = v12;
  }
  if (v4[3])
  {
    -[GEORPMerchantLookupContext setMerchantAdamId:](self, "setMerchantAdamId:");
    v4 = v12;
  }
  if ((*((_WORD *)v4 + 70) & 2) != 0)
  {
    *(_QWORD *)&self->_transactionTime = v4[13];
    *(_WORD *)&self->_flags |= 2u;
  }
  if (v4[14])
  {
    -[GEORPMerchantLookupContext setTransactionType:](self, "setTransactionType:");
    v4 = v12;
  }
  transactionLocation = self->_transactionLocation;
  v8 = v4[12];
  if (transactionLocation)
  {
    if (!v8)
      goto LABEL_31;
    -[GEOLocation mergeFrom:](transactionLocation, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_31;
    -[GEORPMerchantLookupContext setTransactionLocation:](self, "setTransactionLocation:");
  }
  v4 = v12;
LABEL_31:
  if (v4[2])
  {
    -[GEORPMerchantLookupContext setCorrelationId:](self, "setCorrelationId:");
    v4 = v12;
  }
  v9 = *((_WORD *)v4 + 70);
  if ((v9 & 8) != 0)
  {
    self->_isAppleCard = *((_BYTE *)v4 + 136);
    *(_WORD *)&self->_flags |= 8u;
    v9 = *((_WORD *)v4 + 70);
  }
  if ((v9 & 4) != 0)
  {
    self->_requestTransactionType = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 4u;
  }
  merchantBankTransactionInfo = self->_merchantBankTransactionInfo;
  v11 = v4[4];
  if (merchantBankTransactionInfo)
  {
    if (v11)
    {
      -[GEOPDBankTransactionInformation mergeFrom:](merchantBankTransactionInfo, "mergeFrom:");
LABEL_42:
      v4 = v12;
    }
  }
  else if (v11)
  {
    -[GEORPMerchantLookupContext setMerchantBankTransactionInfo:](self, "setMerchantBankTransactionInfo:");
    goto LABEL_42;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionType, 0);
  objc_storeStrong((id *)&self->_transactionLocation, 0);
  objc_storeStrong((id *)&self->_merchantUrl, 0);
  objc_storeStrong((id *)&self->_merchantRawName, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_merchantIndustryCategory, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_merchantFormattedAddress, 0);
  objc_storeStrong((id *)&self->_merchantBankTransactionInfo, 0);
  objc_storeStrong((id *)&self->_merchantAdamId, 0);
  objc_storeStrong((id *)&self->_correlationId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
