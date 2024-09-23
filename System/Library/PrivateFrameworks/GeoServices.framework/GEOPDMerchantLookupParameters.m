@implementation GEOPDMerchantLookupParameters

- (GEOPDMerchantLookupParameters)init
{
  GEOPDMerchantLookupParameters *v2;
  GEOPDMerchantLookupParameters *v3;
  GEOPDMerchantLookupParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDMerchantLookupParameters;
  v2 = -[GEOPDMerchantLookupParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMerchantLookupParameters)initWithData:(id)a3
{
  GEOPDMerchantLookupParameters *v3;
  GEOPDMerchantLookupParameters *v4;
  GEOPDMerchantLookupParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDMerchantLookupParameters;
  v3 = -[GEOPDMerchantLookupParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPaymentNetwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 177) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaymentNetwork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasPaymentNetwork
{
  -[GEOPDMerchantLookupParameters _readPaymentNetwork]((uint64_t)self);
  return self->_paymentNetwork != 0;
}

- (NSString)paymentNetwork
{
  -[GEOPDMerchantLookupParameters _readPaymentNetwork]((uint64_t)self);
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x408000u;
  objc_storeStrong((id *)&self->_paymentNetwork, a3);
}

- (void)_readMerchantCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 177) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantCode_tags_3243);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasMerchantCode
{
  -[GEOPDMerchantLookupParameters _readMerchantCode]((uint64_t)self);
  return self->_merchantCode != 0;
}

- (NSString)merchantCode
{
  -[GEOPDMerchantLookupParameters _readMerchantCode]((uint64_t)self);
  return self->_merchantCode;
}

- (void)setMerchantCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x402000u;
  objc_storeStrong((id *)&self->_merchantCode, a3);
}

- (double)transactionTimestamp
{
  return self->_transactionTimestamp;
}

- (void)setTransactionTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x400004u;
  self->_transactionTimestamp = a3;
}

- (void)setHasTransactionTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194308;
  else
    v3 = 0x400000;
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasTransactionTimestamp
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readTransactionLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 178) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransactionLocation_tags_3244);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTransactionLocation
{
  -[GEOPDMerchantLookupParameters _readTransactionLocation]((uint64_t)self);
  return self->_transactionLocation != 0;
}

- (GEOLocation)transactionLocation
{
  -[GEOPDMerchantLookupParameters _readTransactionLocation]((uint64_t)self);
  return self->_transactionLocation;
}

- (void)setTransactionLocation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x500000u;
  objc_storeStrong((id *)&self->_transactionLocation, a3);
}

- (double)transactionLocationAge
{
  return self->_transactionLocationAge;
}

- (void)setTransactionLocationAge:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x400002u;
  self->_transactionLocationAge = a3;
}

- (void)setHasTransactionLocationAge:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194306;
  else
    v3 = 0x400000;
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasTransactionLocationAge
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readRawMerchantCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 178) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRawMerchantCode_tags_3245);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasRawMerchantCode
{
  -[GEOPDMerchantLookupParameters _readRawMerchantCode]((uint64_t)self);
  return self->_rawMerchantCode != 0;
}

- (NSString)rawMerchantCode
{
  -[GEOPDMerchantLookupParameters _readRawMerchantCode]((uint64_t)self);
  return self->_rawMerchantCode;
}

- (void)setRawMerchantCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x410000u;
  objc_storeStrong((id *)&self->_rawMerchantCode, a3);
}

- (void)_readIndustryCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 177) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIndustryCategory_tags_3246);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasIndustryCategory
{
  -[GEOPDMerchantLookupParameters _readIndustryCategory]((uint64_t)self);
  return self->_industryCategory != 0;
}

- (NSString)industryCategory
{
  -[GEOPDMerchantLookupParameters _readIndustryCategory]((uint64_t)self);
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x401000u;
  objc_storeStrong((id *)&self->_industryCategory, a3);
}

- (int64_t)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x400001u;
  self->_industryCode = a3;
}

- (void)setHasIndustryCode:(BOOL)a3
{
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x400000);
}

- (BOOL)hasIndustryCode
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)enableBrandMuidFallback
{
  return self->_enableBrandMuidFallback;
}

- (void)setEnableBrandMuidFallback:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400040u;
  self->_enableBrandMuidFallback = a3;
}

- (void)setHasEnableBrandMuidFallback:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194368;
  else
    v3 = 0x400000;
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFBFFFBF | v3);
}

- (BOOL)hasEnableBrandMuidFallback
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (void)_readTerminalId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 178) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTerminalId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTerminalId
{
  -[GEOPDMerchantLookupParameters _readTerminalId]((uint64_t)self);
  return self->_terminalId != 0;
}

- (NSString)terminalId
{
  -[GEOPDMerchantLookupParameters _readTerminalId]((uint64_t)self);
  return self->_terminalId;
}

- (void)setTerminalId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x420000u;
  objc_storeStrong((id *)&self->_terminalId, a3);
}

- (void)_readTransactionCurrencyCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 178) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransactionCurrencyCode_tags_3247);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTransactionCurrencyCode
{
  -[GEOPDMerchantLookupParameters _readTransactionCurrencyCode]((uint64_t)self);
  return self->_transactionCurrencyCode != 0;
}

- (NSString)transactionCurrencyCode
{
  -[GEOPDMerchantLookupParameters _readTransactionCurrencyCode]((uint64_t)self);
  return self->_transactionCurrencyCode;
}

- (void)setTransactionCurrencyCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x440000u;
  objc_storeStrong((id *)&self->_transactionCurrencyCode, a3);
}

- (int)transactionType
{
  os_unfair_lock_s *p_readerLock;
  $EE18152C7C1C54C7C47B391F7B08A504 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_transactionType;
  else
    return 0;
}

- (void)setTransactionType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400010u;
  self->_transactionType = a3;
}

- (void)setHasTransactionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194320;
  else
    v3 = 0x400000;
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasTransactionType
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)transactionTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C04BD0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransactionType:(id)a3
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIRTUAL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IDENTITY")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readWarsawMerchantIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 178) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWarsawMerchantIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasWarsawMerchantIdentifier
{
  -[GEOPDMerchantLookupParameters _readWarsawMerchantIdentifier]((uint64_t)self);
  return self->_warsawMerchantIdentifier != 0;
}

- (GEOPDWarsawMerchantIdentifier)warsawMerchantIdentifier
{
  -[GEOPDMerchantLookupParameters _readWarsawMerchantIdentifier]((uint64_t)self);
  return self->_warsawMerchantIdentifier;
}

- (void)setWarsawMerchantIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x600000u;
  objc_storeStrong((id *)&self->_warsawMerchantIdentifier, a3);
}

- (void)_readAppIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 177) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppIdentifier_tags_3248);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAppIdentifier
{
  -[GEOPDMerchantLookupParameters _readAppIdentifier]((uint64_t)self);
  return self->_appIdentifier != 0;
}

- (GEOPDAdamAppIdentifier)appIdentifier
{
  -[GEOPDMerchantLookupParameters _readAppIdentifier]((uint64_t)self);
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400200u;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void)_readMerchantInformation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 177) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantInformation_tags_3249);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasMerchantInformation
{
  -[GEOPDMerchantLookupParameters _readMerchantInformation]((uint64_t)self);
  return self->_merchantInformation != 0;
}

- (GEOPDMerchantInformation)merchantInformation
{
  -[GEOPDMerchantLookupParameters _readMerchantInformation]((uint64_t)self);
  return self->_merchantInformation;
}

- (void)setMerchantInformation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x404000u;
  objc_storeStrong((id *)&self->_merchantInformation, a3);
}

- (int)transactionStatus
{
  os_unfair_lock_s *p_readerLock;
  $EE18152C7C1C54C7C47B391F7B08A504 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_transactionStatus;
  else
    return 0;
}

- (void)setTransactionStatus:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400008u;
  self->_transactionStatus = a3;
}

- (void)setHasTransactionStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194312;
  else
    v3 = 0x400000;
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTransactionStatus
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)transactionStatusAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C04C08[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransactionStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSACTION_STATUS_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSACTION_STATUS_AUTHORIZATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSACTION_STATUS_SETTLEMENT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSACTION_STATUS_REFUND")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readTransactionId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 178) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransactionId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTransactionId
{
  -[GEOPDMerchantLookupParameters _readTransactionId]((uint64_t)self);
  return self->_transactionId != 0;
}

- (NSString)transactionId
{
  -[GEOPDMerchantLookupParameters _readTransactionId]((uint64_t)self);
  return self->_transactionId;
}

- (void)setTransactionId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x480000u;
  objc_storeStrong((id *)&self->_transactionId, a3);
}

- (BOOL)fuzzyMatched
{
  return self->_fuzzyMatched;
}

- (void)setFuzzyMatched:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400080u;
  self->_fuzzyMatched = a3;
}

- (void)setHasFuzzyMatched:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194432;
  else
    v3 = 0x400000;
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasFuzzyMatched
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (BOOL)coarseLocationUsed
{
  return self->_coarseLocationUsed;
}

- (void)setCoarseLocationUsed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400020u;
  self->_coarseLocationUsed = a3;
}

- (void)setHasCoarseLocationUsed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194336;
  else
    v3 = 0x400000;
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasCoarseLocationUsed
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readIdentityMerchantInformation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 177) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentityMerchantInformation_tags_3250);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasIdentityMerchantInformation
{
  -[GEOPDMerchantLookupParameters _readIdentityMerchantInformation]((uint64_t)self);
  return self->_identityMerchantInformation != 0;
}

- (GEOPDIdentityMerchantInformation)identityMerchantInformation
{
  -[GEOPDMerchantLookupParameters _readIdentityMerchantInformation]((uint64_t)self);
  return self->_identityMerchantInformation;
}

- (void)setIdentityMerchantInformation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400800u;
  objc_storeStrong((id *)&self->_identityMerchantInformation, a3);
}

- (void)_readBankTransactionInformation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 177) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBankTransactionInformation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasBankTransactionInformation
{
  -[GEOPDMerchantLookupParameters _readBankTransactionInformation]((uint64_t)self);
  return self->_bankTransactionInformation != 0;
}

- (GEOPDBankTransactionInformation)bankTransactionInformation
{
  -[GEOPDMerchantLookupParameters _readBankTransactionInformation]((uint64_t)self);
  return self->_bankTransactionInformation;
}

- (void)setBankTransactionInformation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400400u;
  objc_storeStrong((id *)&self->_bankTransactionInformation, a3);
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
  v8.super_class = (Class)GEOPDMerchantLookupParameters;
  -[GEOPDMerchantLookupParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMerchantLookupParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMerchantLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  int v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  __CFString *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  int v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  _QWORD v70[4];
  id v71;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "paymentNetwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("paymentNetwork");
    else
      v6 = CFSTR("payment_network");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend((id)a1, "merchantCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("merchantCode");
    else
      v8 = CFSTR("merchant_code");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  if ((*(_BYTE *)(a1 + 176) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 136));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("transactionTimestamp");
    else
      v10 = CFSTR("transaction_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  objc_msgSend((id)a1, "transactionLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("transactionLocation");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("transaction_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if ((*(_BYTE *)(a1 + 176) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 120));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("transactionLocationAge");
    else
      v16 = CFSTR("transaction_location_age");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "rawMerchantCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("rawMerchantCode");
    else
      v18 = CFSTR("raw_merchant_code");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  objc_msgSend((id)a1, "industryCategory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a2)
      v20 = CFSTR("industryCategory");
    else
      v20 = CFSTR("industry_category");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  v21 = *(_DWORD *)(a1 + 176);
  if ((v21 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("industryCode");
    else
      v23 = CFSTR("industry_code");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

    v21 = *(_DWORD *)(a1 + 176);
  }
  if ((v21 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 173));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("enableBrandMuidFallback");
    else
      v25 = CFSTR("enable_brand_muid_fallback");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  objc_msgSend((id)a1, "terminalId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    if (a2)
      v27 = CFSTR("terminalId");
    else
      v27 = CFSTR("terminal_id");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);
  }

  objc_msgSend((id)a1, "transactionCurrencyCode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (a2)
      v29 = CFSTR("transactionCurrencyCode");
    else
      v29 = CFSTR("transaction_currency_code");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);
  }

  if ((*(_BYTE *)(a1 + 176) & 0x10) != 0)
  {
    v30 = *(int *)(a1 + 168);
    if (v30 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 168));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E1C04BD0[v30];
    }
    if (a2)
      v32 = CFSTR("transactionType");
    else
      v32 = CFSTR("transaction_type");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  objc_msgSend((id)a1, "warsawMerchantIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("warsawMerchantIdentifier");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("warsaw_merchant_identifier");
    }
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  objc_msgSend((id)a1, "appIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v37, "jsonRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("appIdentifier");
    }
    else
    {
      objc_msgSend(v37, "dictionaryRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("app_identifier");
    }
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  objc_msgSend((id)a1, "merchantInformation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v41, "jsonRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("merchantInformation");
    }
    else
    {
      objc_msgSend(v41, "dictionaryRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("merchant_information");
    }
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

  }
  if ((*(_BYTE *)(a1 + 176) & 8) != 0)
  {
    v45 = *(int *)(a1 + 164);
    if (v45 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 164));
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = off_1E1C04C08[v45];
    }
    if (a2)
      v47 = CFSTR("transactionStatus");
    else
      v47 = CFSTR("transaction_status");
    objc_msgSend(v4, "setObject:forKey:", v46, v47);

  }
  objc_msgSend((id)a1, "transactionId");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    if (a2)
      v49 = CFSTR("transactionId");
    else
      v49 = CFSTR("transaction_id");
    objc_msgSend(v4, "setObject:forKey:", v48, v49);
  }

  v50 = *(_DWORD *)(a1 + 176);
  if ((v50 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 174));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v52 = CFSTR("fuzzyMatched");
    else
      v52 = CFSTR("fuzzy_matched");
    objc_msgSend(v4, "setObject:forKey:", v51, v52);

    v50 = *(_DWORD *)(a1 + 176);
  }
  if ((v50 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 172));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v54 = CFSTR("coarseLocationUsed");
    else
      v54 = CFSTR("coarse_location_used");
    objc_msgSend(v4, "setObject:forKey:", v53, v54);

  }
  objc_msgSend((id)a1, "identityMerchantInformation");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v55, "jsonRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("identityMerchantInformation");
    }
    else
    {
      objc_msgSend(v55, "dictionaryRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("identity_merchant_information");
    }
    objc_msgSend(v4, "setObject:forKey:", v57, v58);

  }
  objc_msgSend((id)a1, "bankTransactionInformation");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (v59)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v59, "jsonRepresentation");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = CFSTR("bankTransactionInformation");
    }
    else
    {
      objc_msgSend(v59, "dictionaryRepresentation");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = CFSTR("bank_transaction_information");
    }
    objc_msgSend(v4, "setObject:forKey:", v61, v62);

  }
  v63 = *(void **)(a1 + 16);
  if (v63)
  {
    objc_msgSend(v63, "dictionaryRepresentation");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v64, "count"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __59__GEOPDMerchantLookupParameters__dictionaryRepresentation___block_invoke;
      v70[3] = &unk_1E1C00600;
      v67 = v66;
      v71 = v67;
      objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v70);
      v68 = v67;

      v65 = v68;
    }
    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMerchantLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOPDMerchantLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOPDMerchantLookupParameters)initWithDictionary:(id)a3
{
  return (GEOPDMerchantLookupParameters *)-[GEOPDMerchantLookupParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOLocation *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  void *v42;
  GEOPDWarsawMerchantIdentifier *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  GEOPDAdamAppIdentifier *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  GEOPDMerchantInformation *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  id v56;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  GEOPDIdentityMerchantInformation *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  GEOPDBankTransactionInformation *v71;
  uint64_t v72;
  void *v73;

  v5 = a2;
  if (!a1)
    goto LABEL_154;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_154;
  if (a3)
    v6 = CFSTR("paymentNetwork");
  else
    v6 = CFSTR("payment_network");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setPaymentNetwork:", v8);

  }
  if (a3)
    v9 = CFSTR("merchantCode");
  else
    v9 = CFSTR("merchant_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(a1, "setMerchantCode:", v11);

  }
  if (a3)
    v12 = CFSTR("transactionTimestamp");
  else
    v12 = CFSTR("transaction_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(a1, "setTransactionTimestamp:");
  }

  if (a3)
    v14 = CFSTR("transactionLocation");
  else
    v14 = CFSTR("transaction_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v17 = -[GEOLocation initWithJSON:](v16, "initWithJSON:", v15);
    else
      v17 = -[GEOLocation initWithDictionary:](v16, "initWithDictionary:", v15);
    v18 = (void *)v17;
    objc_msgSend(a1, "setTransactionLocation:", v17);

  }
  if (a3)
    v19 = CFSTR("transactionLocationAge");
  else
    v19 = CFSTR("transaction_location_age");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v20, "doubleValue");
    objc_msgSend(a1, "setTransactionLocationAge:");
  }

  if (a3)
    v21 = CFSTR("rawMerchantCode");
  else
    v21 = CFSTR("raw_merchant_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(a1, "setRawMerchantCode:", v23);

  }
  if (a3)
    v24 = CFSTR("industryCategory");
  else
    v24 = CFSTR("industry_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(a1, "setIndustryCategory:", v26);

  }
  if (a3)
    v27 = CFSTR("industryCode");
  else
    v27 = CFSTR("industry_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIndustryCode:", objc_msgSend(v28, "longLongValue"));

  if (a3)
    v29 = CFSTR("enableBrandMuidFallback");
  else
    v29 = CFSTR("enable_brand_muid_fallback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEnableBrandMuidFallback:", objc_msgSend(v30, "BOOLValue"));

  if (a3)
    v31 = CFSTR("terminalId");
  else
    v31 = CFSTR("terminal_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(a1, "setTerminalId:", v33);

  }
  if (a3)
    v34 = CFSTR("transactionCurrencyCode");
  else
    v34 = CFSTR("transaction_currency_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = (void *)objc_msgSend(v35, "copy");
    objc_msgSend(a1, "setTransactionCurrencyCode:", v36);

  }
  if (a3)
    v37 = CFSTR("transactionType");
  else
    v37 = CFSTR("transaction_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v38;
    if ((objc_msgSend(v39, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v40 = 0;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("CONTACTLESS")) & 1) != 0)
    {
      v40 = 1;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("INAPP")) & 1) != 0)
    {
      v40 = 2;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("WEB")) & 1) != 0)
    {
      v40 = 3;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("PHYSICAL")) & 1) != 0)
    {
      v40 = 4;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("VIRTUAL")) & 1) != 0)
    {
      v40 = 5;
    }
    else if (objc_msgSend(v39, "isEqualToString:", CFSTR("IDENTITY")))
    {
      v40 = 6;
    }
    else
    {
      v40 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_84;
    v40 = objc_msgSend(v38, "intValue");
  }
  objc_msgSend(a1, "setTransactionType:", v40);
LABEL_84:

  if (a3)
    v41 = CFSTR("warsawMerchantIdentifier");
  else
    v41 = CFSTR("warsaw_merchant_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = [GEOPDWarsawMerchantIdentifier alloc];
    if (v43)
      v44 = (void *)-[GEOPDWarsawMerchantIdentifier _initWithDictionary:isJSON:](v43, v42, a3);
    else
      v44 = 0;
    objc_msgSend(a1, "setWarsawMerchantIdentifier:", v44);

  }
  if (a3)
    v45 = CFSTR("appIdentifier");
  else
    v45 = CFSTR("app_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = [GEOPDAdamAppIdentifier alloc];
    if (v47)
      v48 = (void *)-[GEOPDAdamAppIdentifier _initWithDictionary:isJSON:](v47, v46, a3);
    else
      v48 = 0;
    objc_msgSend(a1, "setAppIdentifier:", v48);

  }
  if (a3)
    v49 = CFSTR("merchantInformation");
  else
    v49 = CFSTR("merchant_information");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = [GEOPDMerchantInformation alloc];
    if ((a3 & 1) != 0)
      v52 = -[GEOPDMerchantInformation initWithJSON:](v51, "initWithJSON:", v50);
    else
      v52 = -[GEOPDMerchantInformation initWithDictionary:](v51, "initWithDictionary:", v50);
    v53 = (void *)v52;
    objc_msgSend(a1, "setMerchantInformation:", v52);

  }
  if (a3)
    v54 = CFSTR("transactionStatus");
  else
    v54 = CFSTR("transaction_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = v55;
    if ((objc_msgSend(v56, "isEqualToString:", CFSTR("TRANSACTION_STATUS_UNKNOWN")) & 1) != 0)
    {
      v57 = 0;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("TRANSACTION_STATUS_AUTHORIZATION")) & 1) != 0)
    {
      v57 = 1;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("TRANSACTION_STATUS_SETTLEMENT")) & 1) != 0)
    {
      v57 = 2;
    }
    else if (objc_msgSend(v56, "isEqualToString:", CFSTR("TRANSACTION_STATUS_REFUND")))
    {
      v57 = 3;
    }
    else
    {
      v57 = 0;
    }

    goto LABEL_122;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = objc_msgSend(v55, "intValue");
LABEL_122:
    objc_msgSend(a1, "setTransactionStatus:", v57);
  }

  if (a3)
    v58 = CFSTR("transactionId");
  else
    v58 = CFSTR("transaction_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v60 = (void *)objc_msgSend(v59, "copy");
    objc_msgSend(a1, "setTransactionId:", v60);

  }
  if (a3)
    v61 = CFSTR("fuzzyMatched");
  else
    v61 = CFSTR("fuzzy_matched");
  objc_msgSend(v5, "objectForKeyedSubscript:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFuzzyMatched:", objc_msgSend(v62, "BOOLValue"));

  if (a3)
    v63 = CFSTR("coarseLocationUsed");
  else
    v63 = CFSTR("coarse_location_used");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCoarseLocationUsed:", objc_msgSend(v64, "BOOLValue"));

  if (a3)
    v65 = CFSTR("identityMerchantInformation");
  else
    v65 = CFSTR("identity_merchant_information");
  objc_msgSend(v5, "objectForKeyedSubscript:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = [GEOPDIdentityMerchantInformation alloc];
    if (v67)
      v68 = (void *)-[GEOPDIdentityMerchantInformation _initWithDictionary:isJSON:](v67, v66, a3);
    else
      v68 = 0;
    objc_msgSend(a1, "setIdentityMerchantInformation:", v68);

  }
  if (a3)
    v69 = CFSTR("bankTransactionInformation");
  else
    v69 = CFSTR("bank_transaction_information");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v71 = [GEOPDBankTransactionInformation alloc];
    if ((a3 & 1) != 0)
      v72 = -[GEOPDBankTransactionInformation initWithJSON:](v71, "initWithJSON:", v70);
    else
      v72 = -[GEOPDBankTransactionInformation initWithDictionary:](v71, "initWithDictionary:", v70);
    v73 = (void *)v72;
    objc_msgSend(a1, "setBankTransactionInformation:", v72);

  }
LABEL_154:

  return a1;
}

- (GEOPDMerchantLookupParameters)initWithJSON:(id)a3
{
  return (GEOPDMerchantLookupParameters *)-[GEOPDMerchantLookupParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3288;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3289;
    GEOPDMerchantLookupParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDMerchantLookupParametersCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDMerchantLookupParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMerchantLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  $EE18152C7C1C54C7C47B391F7B08A504 flags;
  $EE18152C7C1C54C7C47B391F7B08A504 v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDMerchantLookupParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMerchantLookupParameters readAll:](self, "readAll:", 0);
    if (self->_paymentNetwork)
      PBDataWriterWriteStringField();
    v5 = v10;
    if (self->_merchantCode)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v10;
    }
    if (self->_transactionLocation)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v10;
    }
    if (self->_rawMerchantCode)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if (self->_industryCategory)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      PBDataWriterWriteSint64Field();
      v5 = v10;
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v10;
    }
    if (self->_terminalId)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if (self->_transactionCurrencyCode)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v10;
    }
    if (self->_warsawMerchantIdentifier)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_appIdentifier)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_merchantInformation)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v10;
    }
    if (self->_transactionId)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v10;
      v7 = self->_flags;
    }
    if ((*(_BYTE *)&v7 & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v10;
    }
    if (self->_identityMerchantInformation)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_bankTransactionInformation)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDMerchantLookupParametersClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDMerchantLookupParameters _readBankTransactionInformation]((uint64_t)self);
  if (-[GEOPDBankTransactionInformation hasGreenTeaWithValue:](self->_bankTransactionInformation, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOPDMerchantLookupParameters _readTransactionLocation]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_transactionLocation, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $EE18152C7C1C54C7C47B391F7B08A504 flags;
  $EE18152C7C1C54C7C47B391F7B08A504 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOPDMerchantLookupParameters readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 38) = self->_readerMarkPos;
  *((_DWORD *)v7 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_paymentNetwork)
    objc_msgSend(v7, "setPaymentNetwork:");
  if (self->_merchantCode)
    objc_msgSend(v7, "setMerchantCode:");
  v4 = v7;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v7[17] = *(id *)&self->_transactionTimestamp;
    *((_DWORD *)v7 + 44) |= 4u;
  }
  if (self->_transactionLocation)
  {
    objc_msgSend(v7, "setTransactionLocation:");
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4[15] = *(id *)&self->_transactionLocationAge;
    *((_DWORD *)v4 + 44) |= 2u;
  }
  if (self->_rawMerchantCode)
  {
    objc_msgSend(v7, "setRawMerchantCode:");
    v4 = v7;
  }
  if (self->_industryCategory)
  {
    objc_msgSend(v7, "setIndustryCategory:");
    v4 = v7;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v4[7] = (id)self->_industryCode;
    *((_DWORD *)v4 + 44) |= 1u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *((_BYTE *)v4 + 173) = self->_enableBrandMuidFallback;
    *((_DWORD *)v4 + 44) |= 0x40u;
  }
  if (self->_terminalId)
  {
    objc_msgSend(v7, "setTerminalId:");
    v4 = v7;
  }
  if (self->_transactionCurrencyCode)
  {
    objc_msgSend(v7, "setTransactionCurrencyCode:");
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_transactionType;
    *((_DWORD *)v4 + 44) |= 0x10u;
  }
  if (self->_warsawMerchantIdentifier)
  {
    objc_msgSend(v7, "setWarsawMerchantIdentifier:");
    v4 = v7;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v7, "setAppIdentifier:");
    v4 = v7;
  }
  if (self->_merchantInformation)
  {
    objc_msgSend(v7, "setMerchantInformation:");
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 41) = self->_transactionStatus;
    *((_DWORD *)v4 + 44) |= 8u;
  }
  if (self->_transactionId)
  {
    objc_msgSend(v7, "setTransactionId:");
    v4 = v7;
  }
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    *((_BYTE *)v4 + 174) = self->_fuzzyMatched;
    *((_DWORD *)v4 + 44) |= 0x80u;
    v6 = self->_flags;
  }
  if ((*(_BYTE *)&v6 & 0x20) != 0)
  {
    *((_BYTE *)v4 + 172) = self->_coarseLocationUsed;
    *((_DWORD *)v4 + 44) |= 0x20u;
  }
  if (self->_identityMerchantInformation)
  {
    objc_msgSend(v7, "setIdentityMerchantInformation:");
    v4 = v7;
  }
  if (self->_bankTransactionInformation)
  {
    objc_msgSend(v7, "setBankTransactionInformation:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  $EE18152C7C1C54C7C47B391F7B08A504 flags;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  $EE18152C7C1C54C7C47B391F7B08A504 v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  PBUnknownFields *v37;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDMerchantLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMerchantLookupParameters readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_paymentNetwork, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  v11 = -[NSString copyWithZone:](self->_merchantCode, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(double *)(v5 + 136) = self->_transactionTimestamp;
    *(_DWORD *)(v5 + 176) |= 4u;
  }
  v13 = -[GEOLocation copyWithZone:](self->_transactionLocation, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v13;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 120) = self->_transactionLocationAge;
    *(_DWORD *)(v5 + 176) |= 2u;
  }
  v15 = -[NSString copyWithZone:](self->_rawMerchantCode, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v15;

  v17 = -[NSString copyWithZone:](self->_industryCategory, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_industryCode;
    *(_DWORD *)(v5 + 176) |= 1u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 173) = self->_enableBrandMuidFallback;
    *(_DWORD *)(v5 + 176) |= 0x40u;
  }
  v20 = -[NSString copyWithZone:](self->_terminalId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v20;

  v22 = -[NSString copyWithZone:](self->_transactionCurrencyCode, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v22;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_transactionType;
    *(_DWORD *)(v5 + 176) |= 0x10u;
  }
  v24 = -[GEOPDWarsawMerchantIdentifier copyWithZone:](self->_warsawMerchantIdentifier, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v24;

  v26 = -[GEOPDAdamAppIdentifier copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v26;

  v28 = -[GEOPDMerchantInformation copyWithZone:](self->_merchantInformation, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v28;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 164) = self->_transactionStatus;
    *(_DWORD *)(v5 + 176) |= 8u;
  }
  v30 = -[NSString copyWithZone:](self->_transactionId, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v30;

  v32 = self->_flags;
  if ((*(_BYTE *)&v32 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 174) = self->_fuzzyMatched;
    *(_DWORD *)(v5 + 176) |= 0x80u;
    v32 = self->_flags;
  }
  if ((*(_BYTE *)&v32 & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 172) = self->_coarseLocationUsed;
    *(_DWORD *)(v5 + 176) |= 0x20u;
  }
  v33 = -[GEOPDIdentityMerchantInformation copyWithZone:](self->_identityMerchantInformation, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v33;

  v35 = -[GEOPDBankTransactionInformation copyWithZone:](self->_bankTransactionInformation, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v35;

  v37 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v37;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *paymentNetwork;
  NSString *merchantCode;
  $EE18152C7C1C54C7C47B391F7B08A504 flags;
  int v8;
  GEOLocation *transactionLocation;
  NSString *rawMerchantCode;
  NSString *industryCategory;
  $EE18152C7C1C54C7C47B391F7B08A504 v12;
  int v13;
  NSString *terminalId;
  NSString *transactionCurrencyCode;
  int v16;
  GEOPDWarsawMerchantIdentifier *warsawMerchantIdentifier;
  GEOPDAdamAppIdentifier *appIdentifier;
  GEOPDMerchantInformation *merchantInformation;
  $EE18152C7C1C54C7C47B391F7B08A504 v20;
  int v21;
  NSString *transactionId;
  GEOPDIdentityMerchantInformation *identityMerchantInformation;
  GEOPDBankTransactionInformation *bankTransactionInformation;
  char v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_79;
  -[GEOPDMerchantLookupParameters readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  paymentNetwork = self->_paymentNetwork;
  if ((unint64_t)paymentNetwork | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](paymentNetwork, "isEqual:"))
      goto LABEL_79;
  }
  merchantCode = self->_merchantCode;
  if ((unint64_t)merchantCode | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](merchantCode, "isEqual:"))
      goto LABEL_79;
  }
  flags = self->_flags;
  v8 = *((_DWORD *)v4 + 44);
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_transactionTimestamp != *((double *)v4 + 17))
      goto LABEL_79;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_79;
  }
  transactionLocation = self->_transactionLocation;
  if ((unint64_t)transactionLocation | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOLocation isEqual:](transactionLocation, "isEqual:"))
      goto LABEL_79;
    flags = self->_flags;
    v8 = *((_DWORD *)v4 + 44);
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_transactionLocationAge != *((double *)v4 + 15))
      goto LABEL_79;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_79;
  }
  rawMerchantCode = self->_rawMerchantCode;
  if ((unint64_t)rawMerchantCode | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](rawMerchantCode, "isEqual:"))
  {
    goto LABEL_79;
  }
  industryCategory = self->_industryCategory;
  if ((unint64_t)industryCategory | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](industryCategory, "isEqual:"))
      goto LABEL_79;
  }
  v12 = self->_flags;
  v13 = *((_DWORD *)v4 + 44);
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_industryCode != *((_QWORD *)v4 + 7))
      goto LABEL_79;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_BYTE *)&v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0)
      goto LABEL_79;
    if (self->_enableBrandMuidFallback)
    {
      if (!*((_BYTE *)v4 + 173))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 173))
    {
      goto LABEL_79;
    }
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  terminalId = self->_terminalId;
  if ((unint64_t)terminalId | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](terminalId, "isEqual:"))
  {
    goto LABEL_79;
  }
  transactionCurrencyCode = self->_transactionCurrencyCode;
  if ((unint64_t)transactionCurrencyCode | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](transactionCurrencyCode, "isEqual:"))
      goto LABEL_79;
  }
  v16 = *((_DWORD *)v4 + 44);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_transactionType != *((_DWORD *)v4 + 42))
      goto LABEL_79;
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  warsawMerchantIdentifier = self->_warsawMerchantIdentifier;
  if ((unint64_t)warsawMerchantIdentifier | *((_QWORD *)v4 + 18)
    && !-[GEOPDWarsawMerchantIdentifier isEqual:](warsawMerchantIdentifier, "isEqual:"))
  {
    goto LABEL_79;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDAdamAppIdentifier isEqual:](appIdentifier, "isEqual:"))
      goto LABEL_79;
  }
  merchantInformation = self->_merchantInformation;
  if ((unint64_t)merchantInformation | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDMerchantInformation isEqual:](merchantInformation, "isEqual:"))
      goto LABEL_79;
  }
  v20 = self->_flags;
  v21 = *((_DWORD *)v4 + 44);
  if ((*(_BYTE *)&v20 & 8) != 0)
  {
    if ((v21 & 8) == 0 || self->_transactionStatus != *((_DWORD *)v4 + 41))
      goto LABEL_79;
  }
  else if ((v21 & 8) != 0)
  {
    goto LABEL_79;
  }
  transactionId = self->_transactionId;
  if ((unint64_t)transactionId | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](transactionId, "isEqual:"))
      goto LABEL_79;
    v20 = self->_flags;
    v21 = *((_DWORD *)v4 + 44);
  }
  if ((*(_BYTE *)&v20 & 0x80) != 0)
  {
    if ((v21 & 0x80) == 0)
      goto LABEL_79;
    if (self->_fuzzyMatched)
    {
      if (!*((_BYTE *)v4 + 174))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 174))
    {
      goto LABEL_79;
    }
  }
  else if ((v21 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_BYTE *)&v20 & 0x20) != 0)
  {
    if ((v21 & 0x20) != 0)
    {
      if (self->_coarseLocationUsed)
      {
        if (!*((_BYTE *)v4 + 172))
          goto LABEL_79;
        goto LABEL_75;
      }
      if (!*((_BYTE *)v4 + 172))
        goto LABEL_75;
    }
LABEL_79:
    v25 = 0;
    goto LABEL_80;
  }
  if ((v21 & 0x20) != 0)
    goto LABEL_79;
LABEL_75:
  identityMerchantInformation = self->_identityMerchantInformation;
  if ((unint64_t)identityMerchantInformation | *((_QWORD *)v4 + 5)
    && !-[GEOPDIdentityMerchantInformation isEqual:](identityMerchantInformation, "isEqual:"))
  {
    goto LABEL_79;
  }
  bankTransactionInformation = self->_bankTransactionInformation;
  if ((unint64_t)bankTransactionInformation | *((_QWORD *)v4 + 4))
    v25 = -[GEOPDBankTransactionInformation isEqual:](bankTransactionInformation, "isEqual:");
  else
    v25 = 1;
LABEL_80:

  return v25;
}

- (unint64_t)hash
{
  double transactionTimestamp;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double transactionLocationAge;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  $EE18152C7C1C54C7C47B391F7B08A504 flags;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  $EE18152C7C1C54C7C47B391F7B08A504 v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  NSUInteger v38;
  NSUInteger v39;

  -[GEOPDMerchantLookupParameters readAll:](self, "readAll:", 1);
  v39 = -[NSString hash](self->_paymentNetwork, "hash");
  v38 = -[NSString hash](self->_merchantCode, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    transactionTimestamp = self->_transactionTimestamp;
    v4 = -transactionTimestamp;
    if (transactionTimestamp >= 0.0)
      v4 = self->_transactionTimestamp;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = fmod(v5, 1.84467441e19);
    v8 = 2654435761u * (unint64_t)v7;
    v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0)
      v9 = 2654435761u * (unint64_t)v7;
    v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0)
      v10 = v9;
    v37 = v10;
  }
  else
  {
    v37 = 0;
  }
  v36 = -[GEOLocation hash](self->_transactionLocation, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    transactionLocationAge = self->_transactionLocationAge;
    v12 = -transactionLocationAge;
    if (transactionLocationAge >= 0.0)
      v12 = self->_transactionLocationAge;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v15 += (unint64_t)v14;
    }
    else
    {
      v15 -= (unint64_t)fabs(v14);
    }
    v35 = v15;
  }
  else
  {
    v35 = 0;
  }
  v34 = -[NSString hash](self->_rawMerchantCode, "hash");
  v33 = -[NSString hash](self->_industryCategory, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v32 = 2654435761 * self->_industryCode;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_21;
  }
  else
  {
    v32 = 0;
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
LABEL_21:
      v31 = 2654435761 * self->_enableBrandMuidFallback;
      goto LABEL_24;
    }
  }
  v31 = 0;
LABEL_24:
  v17 = -[NSString hash](self->_terminalId, "hash");
  v18 = -[NSString hash](self->_transactionCurrencyCode, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v19 = 2654435761 * self->_transactionType;
  else
    v19 = 0;
  v20 = -[GEOPDWarsawMerchantIdentifier hash](self->_warsawMerchantIdentifier, "hash");
  v21 = -[GEOPDAdamAppIdentifier hash](self->_appIdentifier, "hash");
  v22 = -[GEOPDMerchantInformation hash](self->_merchantInformation, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v23 = 2654435761 * self->_transactionStatus;
  else
    v23 = 0;
  v24 = -[NSString hash](self->_transactionId, "hash");
  v25 = self->_flags;
  if ((*(_BYTE *)&v25 & 0x80) != 0)
  {
    v26 = 2654435761 * self->_fuzzyMatched;
    if ((*(_BYTE *)&v25 & 0x20) != 0)
      goto LABEL_32;
LABEL_34:
    v27 = 0;
    goto LABEL_35;
  }
  v26 = 0;
  if ((*(_BYTE *)&v25 & 0x20) == 0)
    goto LABEL_34;
LABEL_32:
  v27 = 2654435761 * self->_coarseLocationUsed;
LABEL_35:
  v28 = v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
  v29 = v26 ^ v27 ^ -[GEOPDIdentityMerchantInformation hash](self->_identityMerchantInformation, "hash");
  return v28 ^ v29 ^ -[GEOPDBankTransactionInformation hash](self->_bankTransactionInformation, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLocation *transactionLocation;
  uint64_t v6;
  int v7;
  GEOPDWarsawMerchantIdentifier *warsawMerchantIdentifier;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  GEOPDAdamAppIdentifier *appIdentifier;
  uint64_t v15;
  void *v16;
  GEOPDMerchantInformation *merchantInformation;
  uint64_t v18;
  int v19;
  GEOPDIdentityMerchantInformation *identityMerchantInformation;
  uint64_t v21;
  void *v22;
  GEOPDBankTransactionInformation *bankTransactionInformation;
  uint64_t v24;
  _QWORD *v25;

  v25 = a3;
  objc_msgSend(v25, "readAll:", 0);
  v4 = v25;
  if (v25[10])
  {
    -[GEOPDMerchantLookupParameters setPaymentNetwork:](self, "setPaymentNetwork:");
    v4 = v25;
  }
  if (v4[8])
  {
    -[GEOPDMerchantLookupParameters setMerchantCode:](self, "setMerchantCode:");
    v4 = v25;
  }
  if ((v4[22] & 4) != 0)
  {
    self->_transactionTimestamp = (double)v4[17];
    *(_DWORD *)&self->_flags |= 4u;
  }
  transactionLocation = self->_transactionLocation;
  v6 = v4[16];
  if (transactionLocation)
  {
    if (!v6)
      goto LABEL_13;
    -[GEOLocation mergeFrom:](transactionLocation, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_13;
    -[GEOPDMerchantLookupParameters setTransactionLocation:](self, "setTransactionLocation:");
  }
  v4 = v25;
LABEL_13:
  if ((v4[22] & 2) != 0)
  {
    self->_transactionLocationAge = (double)v4[15];
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (v4[11])
  {
    -[GEOPDMerchantLookupParameters setRawMerchantCode:](self, "setRawMerchantCode:");
    v4 = v25;
  }
  if (v4[6])
  {
    -[GEOPDMerchantLookupParameters setIndustryCategory:](self, "setIndustryCategory:");
    v4 = v25;
  }
  v7 = *((_DWORD *)v4 + 44);
  if ((v7 & 1) != 0)
  {
    self->_industryCode = v4[7];
    *(_DWORD *)&self->_flags |= 1u;
    v7 = *((_DWORD *)v4 + 44);
  }
  if ((v7 & 0x40) != 0)
  {
    self->_enableBrandMuidFallback = *((_BYTE *)v4 + 173);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
  if (v4[12])
  {
    -[GEOPDMerchantLookupParameters setTerminalId:](self, "setTerminalId:");
    v4 = v25;
  }
  if (v4[13])
  {
    -[GEOPDMerchantLookupParameters setTransactionCurrencyCode:](self, "setTransactionCurrencyCode:");
    v4 = v25;
  }
  if ((v4[22] & 0x10) != 0)
  {
    self->_transactionType = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  warsawMerchantIdentifier = self->_warsawMerchantIdentifier;
  v9 = (void *)v4[18];
  if (warsawMerchantIdentifier)
  {
    if (!v9)
      goto LABEL_41;
    v10 = v9;
    -[GEOPDWarsawMerchantIdentifier readAll:]((uint64_t)v10, 0);
    v11 = (void *)v10[3];
    if (v11)
      -[GEOPDWarsawMerchantIdentifier setMerchantDomain:]((uint64_t)warsawMerchantIdentifier, v11);
    v12 = (void *)v10[5];
    if (v12)
      -[GEOPDWarsawMerchantIdentifier setMerchantName:]((uint64_t)warsawMerchantIdentifier, v12);
    v13 = (void *)v10[4];
    if (v13)
      -[GEOPDWarsawMerchantIdentifier setMerchantId:]((uint64_t)warsawMerchantIdentifier, v13);

  }
  else
  {
    if (!v9)
      goto LABEL_41;
    -[GEOPDMerchantLookupParameters setWarsawMerchantIdentifier:](self, "setWarsawMerchantIdentifier:");
  }
  v4 = v25;
LABEL_41:
  appIdentifier = self->_appIdentifier;
  v15 = v4[3];
  if (!appIdentifier)
  {
    if (!v15)
      goto LABEL_48;
    -[GEOPDMerchantLookupParameters setAppIdentifier:](self, "setAppIdentifier:");
    goto LABEL_47;
  }
  if (v15)
  {
    v16 = *(void **)(v15 + 16);
    if (v16)
    {
      -[GEOPDAdamAppIdentifier setAdamId:]((uint64_t)appIdentifier, v16);
LABEL_47:
      v4 = v25;
    }
  }
LABEL_48:
  merchantInformation = self->_merchantInformation;
  v18 = v4[9];
  if (merchantInformation)
  {
    if (!v18)
      goto LABEL_54;
    -[GEOPDMerchantInformation mergeFrom:](merchantInformation, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_54;
    -[GEOPDMerchantLookupParameters setMerchantInformation:](self, "setMerchantInformation:");
  }
  v4 = v25;
LABEL_54:
  if ((v4[22] & 8) != 0)
  {
    self->_transactionStatus = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 8u;
  }
  if (v4[14])
  {
    -[GEOPDMerchantLookupParameters setTransactionId:](self, "setTransactionId:");
    v4 = v25;
  }
  v19 = *((_DWORD *)v4 + 44);
  if ((v19 & 0x80) != 0)
  {
    self->_fuzzyMatched = *((_BYTE *)v4 + 174);
    *(_DWORD *)&self->_flags |= 0x80u;
    v19 = *((_DWORD *)v4 + 44);
  }
  if ((v19 & 0x20) != 0)
  {
    self->_coarseLocationUsed = *((_BYTE *)v4 + 172);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  identityMerchantInformation = self->_identityMerchantInformation;
  v21 = v4[5];
  if (!identityMerchantInformation)
  {
    if (!v21)
      goto LABEL_69;
    -[GEOPDMerchantLookupParameters setIdentityMerchantInformation:](self, "setIdentityMerchantInformation:");
    goto LABEL_68;
  }
  if (v21)
  {
    v22 = *(void **)(v21 + 16);
    if (v22)
    {
      -[GEOPDIdentityMerchantInformation setRpIdentifier:]((uint64_t)identityMerchantInformation, v22);
LABEL_68:
      v4 = v25;
    }
  }
LABEL_69:
  bankTransactionInformation = self->_bankTransactionInformation;
  v24 = v4[4];
  if (bankTransactionInformation)
  {
    if (v24)
    {
      -[GEOPDBankTransactionInformation mergeFrom:](bankTransactionInformation, "mergeFrom:");
LABEL_74:
      v4 = v25;
    }
  }
  else if (v24)
  {
    -[GEOPDMerchantLookupParameters setBankTransactionInformation:](self, "setBankTransactionInformation:");
    goto LABEL_74;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDMerchantLookupParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3292);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  GEOPDAdamAppIdentifier *appIdentifier;
  PBUnknownFields *v8;
  GEOPDIdentityMerchantInformation *identityMerchantInformation;
  PBUnknownFields *v10;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400100u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDMerchantLookupParameters readAll:](self, "readAll:", 0);
    -[GEOLocation clearUnknownFields:](self->_transactionLocation, "clearUnknownFields:", 1);
    -[GEOPDWarsawMerchantIdentifier clearUnknownFields:]((uint64_t)self->_warsawMerchantIdentifier);
    appIdentifier = self->_appIdentifier;
    if (appIdentifier)
    {
      v8 = appIdentifier->_unknownFields;
      appIdentifier->_unknownFields = 0;

    }
    -[GEOPDMerchantInformation clearUnknownFields:](self->_merchantInformation, "clearUnknownFields:", 1);
    identityMerchantInformation = self->_identityMerchantInformation;
    if (identityMerchantInformation)
    {
      v10 = identityMerchantInformation->_unknownFields;
      identityMerchantInformation->_unknownFields = 0;

    }
    -[GEOPDBankTransactionInformation clearUnknownFields:](self->_bankTransactionInformation, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warsawMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionLocation, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_transactionCurrencyCode, 0);
  objc_storeStrong((id *)&self->_terminalId, 0);
  objc_storeStrong((id *)&self->_rawMerchantCode, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_merchantInformation, 0);
  objc_storeStrong((id *)&self->_merchantCode, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_identityMerchantInformation, 0);
  objc_storeStrong((id *)&self->_bankTransactionInformation, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
