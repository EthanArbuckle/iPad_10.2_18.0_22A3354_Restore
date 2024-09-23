@implementation GEOPDBankTransactionInformation

- (GEOPDBankTransactionInformation)init
{
  GEOPDBankTransactionInformation *v2;
  GEOPDBankTransactionInformation *v3;
  GEOPDBankTransactionInformation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDBankTransactionInformation;
  v2 = -[GEOPDBankTransactionInformation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDBankTransactionInformation)initWithData:(id)a3
{
  GEOPDBankTransactionInformation *v3;
  GEOPDBankTransactionInformation *v4;
  GEOPDBankTransactionInformation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDBankTransactionInformation;
  v3 = -[GEOPDBankTransactionInformation initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAnonymisedUserId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 157) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnonymisedUserId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasAnonymisedUserId
{
  -[GEOPDBankTransactionInformation _readAnonymisedUserId]((uint64_t)self);
  return self->_anonymisedUserId != 0;
}

- (NSString)anonymisedUserId
{
  -[GEOPDBankTransactionInformation _readAnonymisedUserId]((uint64_t)self);
  return self->_anonymisedUserId;
}

- (void)setAnonymisedUserId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80100u;
  objc_storeStrong((id *)&self->_anonymisedUserId, a3);
}

- (int)bankTransactionType
{
  os_unfair_lock_s *p_readerLock;
  $B11C17402F3C51AE16215E686C0D2ADC flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 4) != 0)
    return self->_bankTransactionType;
  else
    return 0;
}

- (void)setBankTransactionType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80004u;
  self->_bankTransactionType = a3;
}

- (void)setHasBankTransactionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524292;
  else
    v3 = 0x80000;
  self->_flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasBankTransactionType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)bankTransactionTypeAsString:(int)a3
{
  if (a3 < 0x11)
    return off_1E1C049A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBankTransactionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_ADJUSTMENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_ATM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_BILL_PAYMENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_CHECK")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_DEPOSIT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_DIRECT_DEBIT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_DIRECT_DEPOSIT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_DIVIDEND")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_FEE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_INTEREST")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_POS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_STANDING_ORDER")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_TRANSFER")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_WITHDRAWAL")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_LOAN")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_REFUND")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readBankTransactionDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 157) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBankTransactionDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasBankTransactionDescription
{
  -[GEOPDBankTransactionInformation _readBankTransactionDescription]((uint64_t)self);
  return self->_bankTransactionDescription != 0;
}

- (NSString)bankTransactionDescription
{
  -[GEOPDBankTransactionInformation _readBankTransactionDescription]((uint64_t)self);
  return self->_bankTransactionDescription;
}

- (void)setBankTransactionDescription:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x82000u;
  objc_storeStrong((id *)&self->_bankTransactionDescription, a3);
}

- (void)_readOtherTransactionLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOtherTransactionLocations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)otherTransactionLocations
{
  -[GEOPDBankTransactionInformation _readOtherTransactionLocations]((uint64_t)self);
  return self->_otherTransactionLocations;
}

- (void)setOtherTransactionLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *otherTransactionLocations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  otherTransactionLocations = self->_otherTransactionLocations;
  self->_otherTransactionLocations = v4;

}

- (void)clearOtherTransactionLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_otherTransactionLocations, "removeAllObjects");
}

- (void)addOtherTransactionLocations:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDBankTransactionInformation _readOtherTransactionLocations]((uint64_t)self);
  -[GEOPDBankTransactionInformation _addNoFlagsOtherTransactionLocations:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsOtherTransactionLocations:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)otherTransactionLocationsCount
{
  -[GEOPDBankTransactionInformation _readOtherTransactionLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_otherTransactionLocations, "count");
}

- (id)otherTransactionLocationsAtIndex:(unint64_t)a3
{
  -[GEOPDBankTransactionInformation _readOtherTransactionLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_otherTransactionLocations, "objectAtIndex:", a3);
}

+ (Class)otherTransactionLocationsType
{
  return (Class)objc_opt_class();
}

- (double)transactionTimestamp
{
  return self->_transactionTimestamp;
}

- (void)setTransactionTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x80002u;
  self->_transactionTimestamp = a3;
}

- (void)setHasTransactionTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524290;
  else
    v3 = 0x80000;
  self->_flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasTransactionTimestamp
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readRawMerchantCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 158) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRawMerchantCode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasRawMerchantCode
{
  -[GEOPDBankTransactionInformation _readRawMerchantCode]((uint64_t)self);
  return self->_rawMerchantCode != 0;
}

- (NSString)rawMerchantCode
{
  -[GEOPDBankTransactionInformation _readRawMerchantCode]((uint64_t)self);
  return self->_rawMerchantCode;
}

- (void)setRawMerchantCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA0000u;
  objc_storeStrong((id *)&self->_rawMerchantCode, a3);
}

- (void)_readIndustryCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIndustryCategory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasIndustryCategory
{
  -[GEOPDBankTransactionInformation _readIndustryCategory]((uint64_t)self);
  return self->_industryCategory != 0;
}

- (NSString)industryCategory
{
  -[GEOPDBankTransactionInformation _readIndustryCategory]((uint64_t)self);
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x84000u;
  objc_storeStrong((id *)&self->_industryCategory, a3);
}

- (int64_t)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x80001u;
  self->_industryCode = a3;
}

- (void)setHasIndustryCode:(BOOL)a3
{
  self->_flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x80000);
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
  *(_DWORD *)&self->_flags |= 0x80020u;
  self->_enableBrandMuidFallback = a3;
}

- (void)setHasEnableBrandMuidFallback:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524320;
  else
    v3 = 0x80000;
  self->_flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasEnableBrandMuidFallback
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readTransactionCurrencyCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 158) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransactionCurrencyCode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasTransactionCurrencyCode
{
  -[GEOPDBankTransactionInformation _readTransactionCurrencyCode]((uint64_t)self);
  return self->_transactionCurrencyCode != 0;
}

- (NSString)transactionCurrencyCode
{
  -[GEOPDBankTransactionInformation _readTransactionCurrencyCode]((uint64_t)self);
  return self->_transactionCurrencyCode;
}

- (void)setTransactionCurrencyCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC0000u;
  objc_storeStrong((id *)&self->_transactionCurrencyCode, a3);
}

- (int)transactionStatus
{
  os_unfair_lock_s *p_readerLock;
  $B11C17402F3C51AE16215E686C0D2ADC flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_transactionStatus;
  else
    return 0;
}

- (void)setTransactionStatus:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80010u;
  self->_transactionStatus = a3;
}

- (void)setHasTransactionStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524304;
  else
    v3 = 0x80000;
  self->_flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasTransactionStatus
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
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

- (void)_readMerchantInformation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantInformation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasMerchantInformation
{
  -[GEOPDBankTransactionInformation _readMerchantInformation]((uint64_t)self);
  return self->_merchantInformation != 0;
}

- (GEOPDMerchantInformation)merchantInformation
{
  -[GEOPDBankTransactionInformation _readMerchantInformation]((uint64_t)self);
  return self->_merchantInformation;
}

- (void)setMerchantInformation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x88000u;
  objc_storeStrong((id *)&self->_merchantInformation, a3);
}

- (void)_readBaaCertificates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 157) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBaaCertificates_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)baaCertificates
{
  -[GEOPDBankTransactionInformation _readBaaCertificates]((uint64_t)self);
  return self->_baaCertificates;
}

- (void)setBaaCertificates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *baaCertificates;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  baaCertificates = self->_baaCertificates;
  self->_baaCertificates = v4;

}

- (void)clearBaaCertificates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_baaCertificates, "removeAllObjects");
}

- (void)addBaaCertificate:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDBankTransactionInformation _readBaaCertificates]((uint64_t)self);
  -[GEOPDBankTransactionInformation _addNoFlagsBaaCertificate:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsBaaCertificate:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)baaCertificatesCount
{
  -[GEOPDBankTransactionInformation _readBaaCertificates]((uint64_t)self);
  return -[NSMutableArray count](self->_baaCertificates, "count");
}

- (id)baaCertificateAtIndex:(unint64_t)a3
{
  -[GEOPDBankTransactionInformation _readBaaCertificates]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_baaCertificates, "objectAtIndex:", a3);
}

+ (Class)baaCertificateType
{
  return (Class)objc_opt_class();
}

- (void)_readBaaSignature
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 157) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBaaSignature_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasBaaSignature
{
  -[GEOPDBankTransactionInformation _readBaaSignature]((uint64_t)self);
  return self->_baaSignature != 0;
}

- (NSData)baaSignature
{
  -[GEOPDBankTransactionInformation _readBaaSignature]((uint64_t)self);
  return self->_baaSignature;
}

- (void)setBaaSignature:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80400u;
  objc_storeStrong((id *)&self->_baaSignature, a3);
}

- (void)_readBankTransactionDescriptionClean
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 157) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBankTransactionDescriptionClean_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasBankTransactionDescriptionClean
{
  -[GEOPDBankTransactionInformation _readBankTransactionDescriptionClean]((uint64_t)self);
  return self->_bankTransactionDescriptionClean != 0;
}

- (NSString)bankTransactionDescriptionClean
{
  -[GEOPDBankTransactionInformation _readBankTransactionDescriptionClean]((uint64_t)self);
  return self->_bankTransactionDescriptionClean;
}

- (void)setBankTransactionDescriptionClean:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x81000u;
  objc_storeStrong((id *)&self->_bankTransactionDescriptionClean, a3);
}

- (void)_readBankIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 157) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBankIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasBankIdentifier
{
  -[GEOPDBankTransactionInformation _readBankIdentifier]((uint64_t)self);
  return self->_bankIdentifier != 0;
}

- (NSString)bankIdentifier
{
  -[GEOPDBankTransactionInformation _readBankIdentifier]((uint64_t)self);
  return self->_bankIdentifier;
}

- (void)setBankIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80800u;
  objc_storeStrong((id *)&self->_bankIdentifier, a3);
}

- (BOOL)piiRedactionApplied
{
  return self->_piiRedactionApplied;
}

- (void)setPiiRedactionApplied:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80040u;
  self->_piiRedactionApplied = a3;
}

- (void)setHasPiiRedactionApplied:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524352;
  else
    v3 = 0x80000;
  self->_flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasPiiRedactionApplied
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (int)rotationPeriodsSinceEpoch
{
  return self->_rotationPeriodsSinceEpoch;
}

- (void)setRotationPeriodsSinceEpoch:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80008u;
  self->_rotationPeriodsSinceEpoch = a3;
}

- (void)setHasRotationPeriodsSinceEpoch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524296;
  else
    v3 = 0x80000;
  self->_flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFF7FFF7 | v3);
}

- (BOOL)hasRotationPeriodsSinceEpoch
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOPDBankTransactionInformation;
  -[GEOPDBankTransactionInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBankTransactionInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBankTransactionInformation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  unint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  int v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  __CFString *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  int v58;
  void *v59;
  const __CFString *v60;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "anonymisedUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("anonymisedUserId");
    else
      v6 = CFSTR("anonymised_user_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if ((*(_BYTE *)(a1 + 156) & 4) != 0)
  {
    v7 = *(int *)(a1 + 140);
    if (v7 >= 0x11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 140));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C049A0[v7];
    }
    if (a2)
      v9 = CFSTR("bankTransactionType");
    else
      v9 = CFSTR("bank_transaction_type");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "bankTransactionDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("bankTransactionDescription");
    else
      v11 = CFSTR("bank_transaction_description");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v13 = *(id *)(a1 + 96);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v77 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("otherTransactionLocations");
    else
      v20 = CFSTR("other_transaction_locations");
    objc_msgSend(v4, "setObject:forKey:", v12, v20);

  }
  v21 = 0x1E0CB3000uLL;
  if ((*(_BYTE *)(a1 + 156) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 120));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("transactionTimestamp");
    else
      v23 = CFSTR("transaction_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend((id)a1, "rawMerchantCode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (a2)
      v25 = CFSTR("rawMerchantCode");
    else
      v25 = CFSTR("raw_merchant_code");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);
  }

  objc_msgSend((id)a1, "industryCategory");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    if (a2)
      v27 = CFSTR("industryCategory");
    else
      v27 = CFSTR("industry_category");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);
  }

  v28 = *(_DWORD *)(a1 + 156);
  if ((v28 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 80));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("industryCode");
    else
      v30 = CFSTR("industry_code");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

    v28 = *(_DWORD *)(a1 + 156);
  }
  if ((v28 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 152));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("enableBrandMuidFallback");
    else
      v32 = CFSTR("enable_brand_muid_fallback");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  objc_msgSend((id)a1, "transactionCurrencyCode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    if (a2)
      v34 = CFSTR("transactionCurrencyCode");
    else
      v34 = CFSTR("transaction_currency_code");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);
  }

  if ((*(_BYTE *)(a1 + 156) & 0x10) != 0)
  {
    v35 = *(int *)(a1 + 148);
    if (v35 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 148));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E1C04C08[v35];
    }
    if (a2)
      v37 = CFSTR("transactionStatus");
    else
      v37 = CFSTR("transaction_status");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  objc_msgSend((id)a1, "merchantInformation");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v38, "jsonRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("merchantInformation");
    }
    else
    {
      objc_msgSend(v38, "dictionaryRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("merchant_information");
    }
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    if (a2)
    {
      v42 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "baaCertificates");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "arrayWithCapacity:", objc_msgSend(v43, "count"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      objc_msgSend((id)a1, "baaCertificates");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v73;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v73 != v48)
              objc_enumerationMutation(v45);
            objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j), "base64EncodedStringWithOptions:", 0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v50);

          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        }
        while (v47);
      }

      objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("baaCertificate"));
      v21 = 0x1E0CB3000;
    }
    else
    {
      objc_msgSend((id)a1, "baaCertificates");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("baa_certificate"));
    }

  }
  objc_msgSend((id)a1, "baaSignature");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v51, "base64EncodedStringWithOptions:", 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("baaSignature"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("baa_signature"));
    }
  }

  objc_msgSend((id)a1, "bankTransactionDescriptionClean");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    if (a2)
      v55 = CFSTR("bankTransactionDescriptionClean");
    else
      v55 = CFSTR("bank_transaction_description_clean");
    objc_msgSend(v4, "setObject:forKey:", v54, v55);
  }

  objc_msgSend((id)a1, "bankIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    if (a2)
      v57 = CFSTR("bankIdentifier");
    else
      v57 = CFSTR("bank_identifier");
    objc_msgSend(v4, "setObject:forKey:", v56, v57);
  }

  v58 = *(_DWORD *)(a1 + 156);
  if ((v58 & 0x40) != 0)
  {
    objc_msgSend(*(id *)(v21 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 153));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v60 = CFSTR("piiRedactionApplied");
    else
      v60 = CFSTR("pii_redaction_applied");
    objc_msgSend(v4, "setObject:forKey:", v59, v60);

    v58 = *(_DWORD *)(a1 + 156);
  }
  if ((v58 & 8) != 0)
  {
    objc_msgSend(*(id *)(v21 + 2024), "numberWithInt:", *(unsigned int *)(a1 + 144));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v62 = CFSTR("rotationPeriodsSinceEpoch");
    else
      v62 = CFSTR("rotation_periods_since_epoch");
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
      v70[2] = __61__GEOPDBankTransactionInformation__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDBankTransactionInformation _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOPDBankTransactionInformation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDBankTransactionInformation)initWithDictionary:(id)a3
{
  return (GEOPDBankTransactionInformation *)-[GEOPDBankTransactionInformation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  GEOLocation *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  GEOPDMerchantInformation *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  uint64_t v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  void *v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_168;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_168;
  if (a3)
    v6 = CFSTR("anonymisedUserId");
  else
    v6 = CFSTR("anonymised_user_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setAnonymisedUserId:", v8);

  }
  if (a3)
    v9 = CFSTR("bankTransactionType");
  else
    v9 = CFSTR("bank_transaction_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_UNSPECIFIED")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_ADJUSTMENT")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_ATM")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_BILL_PAYMENT")) & 1) != 0)
    {
      v12 = 3;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_CHECK")) & 1) != 0)
    {
      v12 = 4;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_DEPOSIT")) & 1) != 0)
    {
      v12 = 5;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_DIRECT_DEBIT")) & 1) != 0)
    {
      v12 = 6;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_DIRECT_DEPOSIT")) & 1) != 0)
    {
      v12 = 7;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_DIVIDEND")) & 1) != 0)
    {
      v12 = 8;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_FEE")) & 1) != 0)
    {
      v12 = 9;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_INTEREST")) & 1) != 0)
    {
      v12 = 10;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_POS")) & 1) != 0)
    {
      v12 = 11;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_STANDING_ORDER")) & 1) != 0)
    {
      v12 = 12;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_TRANSFER")) & 1) != 0)
    {
      v12 = 13;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_WITHDRAWAL")) & 1) != 0)
    {
      v12 = 14;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_LOAN")) & 1) != 0)
    {
      v12 = 15;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("BANK_TRANSACTION_TYPE_REFUND")))
    {
      v12 = 16;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_51;
    v12 = objc_msgSend(v10, "intValue");
  }
  objc_msgSend(a1, "setBankTransactionType:", v12);
LABEL_51:

  if (a3)
    v13 = CFSTR("bankTransactionDescription");
  else
    v13 = CFSTR("bank_transaction_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(a1, "setBankTransactionDescription:", v15);

  }
  if (a3)
    v16 = CFSTR("otherTransactionLocations");
  else
    v16 = CFSTR("other_transaction_locations");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v75 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v74 = v17;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v81 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = [GEOLocation alloc];
            if ((a3 & 1) != 0)
              v25 = -[GEOLocation initWithJSON:](v24, "initWithJSON:", v23);
            else
              v25 = -[GEOLocation initWithDictionary:](v24, "initWithDictionary:", v23);
            v26 = (void *)v25;
            objc_msgSend(a1, "addOtherTransactionLocations:", v25, v74);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      }
      while (v20);
    }

    v17 = v74;
  }

  if (a3)
    v27 = CFSTR("transactionTimestamp");
  else
    v27 = CFSTR("transaction_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27, v74);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v28, "doubleValue");
    objc_msgSend(a1, "setTransactionTimestamp:");
  }

  if (a3)
    v29 = CFSTR("rawMerchantCode");
  else
    v29 = CFSTR("raw_merchant_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(a1, "setRawMerchantCode:", v31);

  }
  if (a3)
    v32 = CFSTR("industryCategory");
  else
    v32 = CFSTR("industry_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(a1, "setIndustryCategory:", v34);

  }
  if (a3)
    v35 = CFSTR("industryCode");
  else
    v35 = CFSTR("industry_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIndustryCode:", objc_msgSend(v36, "longLongValue"));

  if (a3)
    v37 = CFSTR("enableBrandMuidFallback");
  else
    v37 = CFSTR("enable_brand_muid_fallback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEnableBrandMuidFallback:", objc_msgSend(v38, "BOOLValue"));

  if (a3)
    v39 = CFSTR("transactionCurrencyCode");
  else
    v39 = CFSTR("transaction_currency_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = (void *)objc_msgSend(v40, "copy");
    objc_msgSend(a1, "setTransactionCurrencyCode:", v41);

  }
  if (a3)
    v42 = CFSTR("transactionStatus");
  else
    v42 = CFSTR("transaction_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = v43;
    if ((objc_msgSend(v44, "isEqualToString:", CFSTR("TRANSACTION_STATUS_UNKNOWN")) & 1) != 0)
    {
      v45 = 0;
    }
    else if ((objc_msgSend(v44, "isEqualToString:", CFSTR("TRANSACTION_STATUS_AUTHORIZATION")) & 1) != 0)
    {
      v45 = 1;
    }
    else if ((objc_msgSend(v44, "isEqualToString:", CFSTR("TRANSACTION_STATUS_SETTLEMENT")) & 1) != 0)
    {
      v45 = 2;
    }
    else if (objc_msgSend(v44, "isEqualToString:", CFSTR("TRANSACTION_STATUS_REFUND")))
    {
      v45 = 3;
    }
    else
    {
      v45 = 0;
    }

    goto LABEL_119;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = objc_msgSend(v43, "intValue");
LABEL_119:
    objc_msgSend(a1, "setTransactionStatus:", v45);
  }

  if (a3)
    v46 = CFSTR("merchantInformation");
  else
    v46 = CFSTR("merchant_information");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = [GEOPDMerchantInformation alloc];
    if ((a3 & 1) != 0)
      v49 = -[GEOPDMerchantInformation initWithJSON:](v48, "initWithJSON:", v47);
    else
      v49 = -[GEOPDMerchantInformation initWithDictionary:](v48, "initWithDictionary:", v47);
    v50 = (void *)v49;
    objc_msgSend(a1, "setMerchantInformation:", v49);

  }
  if (a3)
    v51 = CFSTR("baaCertificate");
  else
    v51 = CFSTR("baa_certificate");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v53 = v52;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v55; ++j)
        {
          if (*(_QWORD *)v77 != v56)
            objc_enumerationMutation(v53);
          v58 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v58, 0);
            objc_msgSend(a1, "addBaaCertificate:", v59);

          }
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
      }
      while (v55);
    }

    v5 = v75;
  }

  if (a3)
    v60 = CFSTR("baaSignature");
  else
    v60 = CFSTR("baa_signature");
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v61, 0);
    objc_msgSend(a1, "setBaaSignature:", v62);

  }
  if (a3)
    v63 = CFSTR("bankTransactionDescriptionClean");
  else
    v63 = CFSTR("bank_transaction_description_clean");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = (void *)objc_msgSend(v64, "copy");
    objc_msgSend(a1, "setBankTransactionDescriptionClean:", v65);

  }
  if (a3)
    v66 = CFSTR("bankIdentifier");
  else
    v66 = CFSTR("bank_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = (void *)objc_msgSend(v67, "copy");
    objc_msgSend(a1, "setBankIdentifier:", v68);

  }
  if (a3)
    v69 = CFSTR("piiRedactionApplied");
  else
    v69 = CFSTR("pii_redaction_applied");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPiiRedactionApplied:", objc_msgSend(v70, "BOOLValue"));

  if (a3)
    v71 = CFSTR("rotationPeriodsSinceEpoch");
  else
    v71 = CFSTR("rotation_periods_since_epoch");
  objc_msgSend(v5, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRotationPeriodsSinceEpoch:", objc_msgSend(v72, "intValue"));

LABEL_168:
  return a1;
}

- (GEOPDBankTransactionInformation)initWithJSON:(id)a3
{
  return (GEOPDBankTransactionInformation *)-[GEOPDBankTransactionInformation _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1498;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1499;
    GEOPDBankTransactionInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDBankTransactionInformationCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDBankTransactionInformationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDBankTransactionInformationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $B11C17402F3C51AE16215E686C0D2ADC flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  $B11C17402F3C51AE16215E686C0D2ADC v15;
  PBDataReader *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDBankTransactionInformationIsDirty((uint64_t)self) & 1) == 0)
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v17);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBankTransactionInformation readAll:](self, "readAll:", 0);
    if (self->_anonymisedUserId)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_bankTransactionDescription)
      PBDataWriterWriteStringField();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = self->_otherTransactionLocations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_rawMerchantCode)
      PBDataWriterWriteStringField();
    if (self->_industryCategory)
      PBDataWriterWriteStringField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      PBDataWriterWriteSint64Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_transactionCurrencyCode)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_merchantInformation)
      PBDataWriterWriteSubmessage();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = self->_baaCertificates;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteDataField();
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v12);
    }

    if (self->_baaSignature)
      PBDataWriterWriteDataField();
    if (self->_bankTransactionDescriptionClean)
      PBDataWriterWriteStringField();
    if (self->_bankIdentifier)
      PBDataWriterWriteStringField();
    v15 = self->_flags;
    if ((*(_BYTE *)&v15 & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = self->_flags;
    }
    if ((*(_BYTE *)&v15 & 8) != 0)
      PBDataWriterWriteInt32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v18);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDBankTransactionInformationClearSensitiveFields((uint64_t)self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOPDBankTransactionInformation _readOtherTransactionLocations]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_otherTransactionLocations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  $B11C17402F3C51AE16215E686C0D2ADC flags;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  id *v14;
  $B11C17402F3C51AE16215E686C0D2ADC v15;
  id *v16;

  v16 = (id *)a3;
  -[GEOPDBankTransactionInformation readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 32) = self->_readerMarkPos;
  *((_DWORD *)v16 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_anonymisedUserId)
    objc_msgSend(v16, "setAnonymisedUserId:");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v16 + 35) = self->_bankTransactionType;
    *((_DWORD *)v16 + 39) |= 4u;
  }
  if (self->_bankTransactionDescription)
    objc_msgSend(v16, "setBankTransactionDescription:");
  if (-[GEOPDBankTransactionInformation otherTransactionLocationsCount](self, "otherTransactionLocationsCount"))
  {
    objc_msgSend(v16, "clearOtherTransactionLocations");
    v4 = -[GEOPDBankTransactionInformation otherTransactionLocationsCount](self, "otherTransactionLocationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDBankTransactionInformation otherTransactionLocationsAtIndex:](self, "otherTransactionLocationsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addOtherTransactionLocations:", v7);

      }
    }
  }
  v8 = v16;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v16[15] = *(id *)&self->_transactionTimestamp;
    *((_DWORD *)v16 + 39) |= 2u;
  }
  if (self->_rawMerchantCode)
  {
    objc_msgSend(v16, "setRawMerchantCode:");
    v8 = v16;
  }
  if (self->_industryCategory)
  {
    objc_msgSend(v16, "setIndustryCategory:");
    v8 = v16;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v8[10] = (id)self->_industryCode;
    *((_DWORD *)v8 + 39) |= 1u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *((_BYTE *)v8 + 152) = self->_enableBrandMuidFallback;
    *((_DWORD *)v8 + 39) |= 0x20u;
  }
  if (self->_transactionCurrencyCode)
  {
    objc_msgSend(v16, "setTransactionCurrencyCode:");
    v8 = v16;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v8 + 37) = self->_transactionStatus;
    *((_DWORD *)v8 + 39) |= 0x10u;
  }
  if (self->_merchantInformation)
    objc_msgSend(v16, "setMerchantInformation:");
  if (-[GEOPDBankTransactionInformation baaCertificatesCount](self, "baaCertificatesCount"))
  {
    objc_msgSend(v16, "clearBaaCertificates");
    v10 = -[GEOPDBankTransactionInformation baaCertificatesCount](self, "baaCertificatesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[GEOPDBankTransactionInformation baaCertificateAtIndex:](self, "baaCertificateAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addBaaCertificate:", v13);

      }
    }
  }
  if (self->_baaSignature)
    objc_msgSend(v16, "setBaaSignature:");
  v14 = v16;
  if (self->_bankTransactionDescriptionClean)
  {
    objc_msgSend(v16, "setBankTransactionDescriptionClean:");
    v14 = v16;
  }
  if (self->_bankIdentifier)
  {
    objc_msgSend(v16, "setBankIdentifier:");
    v14 = v16;
  }
  v15 = self->_flags;
  if ((*(_BYTE *)&v15 & 0x40) != 0)
  {
    *((_BYTE *)v14 + 153) = self->_piiRedactionApplied;
    *((_DWORD *)v14 + 39) |= 0x40u;
    v15 = self->_flags;
  }
  if ((*(_BYTE *)&v15 & 8) != 0)
  {
    *((_DWORD *)v14 + 36) = self->_rotationPeriodsSinceEpoch;
    *((_DWORD *)v14 + 39) |= 8u;
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
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  $B11C17402F3C51AE16215E686C0D2ADC flags;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  $B11C17402F3C51AE16215E686C0D2ADC v38;
  PBUnknownFields *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDBankTransactionInformationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_34;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDBankTransactionInformation readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_anonymisedUserId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_bankTransactionType;
    *(_DWORD *)(v5 + 156) |= 4u;
  }
  v11 = -[NSString copyWithZone:](self->_bankTransactionDescription, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = self->_otherTransactionLocations;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addOtherTransactionLocations:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v14);
  }

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 120) = self->_transactionTimestamp;
    *(_DWORD *)(v5 + 156) |= 2u;
  }
  v18 = -[NSString copyWithZone:](self->_rawMerchantCode, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v18;

  v20 = -[NSString copyWithZone:](self->_industryCategory, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_industryCode;
    *(_DWORD *)(v5 + 156) |= 1u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 152) = self->_enableBrandMuidFallback;
    *(_DWORD *)(v5 + 156) |= 0x20u;
  }
  v23 = -[NSString copyWithZone:](self->_transactionCurrencyCode, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v23;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_transactionStatus;
    *(_DWORD *)(v5 + 156) |= 0x10u;
  }
  v25 = -[GEOPDMerchantInformation copyWithZone:](self->_merchantInformation, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v25;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = self->_baaCertificates;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(v27);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v41);
        objc_msgSend((id)v5, "addBaaCertificate:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v28);
  }

  v32 = -[NSData copyWithZone:](self->_baaSignature, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v32;

  v34 = -[NSString copyWithZone:](self->_bankTransactionDescriptionClean, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v34;

  v36 = -[NSString copyWithZone:](self->_bankIdentifier, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v36;

  v38 = self->_flags;
  if ((*(_BYTE *)&v38 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 153) = self->_piiRedactionApplied;
    *(_DWORD *)(v5 + 156) |= 0x40u;
    v38 = self->_flags;
  }
  if ((*(_BYTE *)&v38 & 8) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_rotationPeriodsSinceEpoch;
    *(_DWORD *)(v5 + 156) |= 8u;
  }
  v39 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v39;
LABEL_34:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *anonymisedUserId;
  int v6;
  NSString *bankTransactionDescription;
  NSMutableArray *otherTransactionLocations;
  int v9;
  NSString *rawMerchantCode;
  NSString *industryCategory;
  $B11C17402F3C51AE16215E686C0D2ADC flags;
  int v13;
  NSString *transactionCurrencyCode;
  GEOPDMerchantInformation *merchantInformation;
  NSMutableArray *baaCertificates;
  NSData *baaSignature;
  NSString *bankTransactionDescriptionClean;
  NSString *bankIdentifier;
  $B11C17402F3C51AE16215E686C0D2ADC v20;
  int v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_66;
  -[GEOPDBankTransactionInformation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  anonymisedUserId = self->_anonymisedUserId;
  if ((unint64_t)anonymisedUserId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](anonymisedUserId, "isEqual:"))
      goto LABEL_66;
  }
  v6 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bankTransactionType != *((_DWORD *)v4 + 35))
      goto LABEL_66;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_66;
  }
  bankTransactionDescription = self->_bankTransactionDescription;
  if ((unint64_t)bankTransactionDescription | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](bankTransactionDescription, "isEqual:"))
  {
    goto LABEL_66;
  }
  otherTransactionLocations = self->_otherTransactionLocations;
  if ((unint64_t)otherTransactionLocations | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](otherTransactionLocations, "isEqual:"))
      goto LABEL_66;
  }
  v9 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_transactionTimestamp != *((double *)v4 + 15))
      goto LABEL_66;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_66;
  }
  rawMerchantCode = self->_rawMerchantCode;
  if ((unint64_t)rawMerchantCode | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](rawMerchantCode, "isEqual:"))
  {
    goto LABEL_66;
  }
  industryCategory = self->_industryCategory;
  if ((unint64_t)industryCategory | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](industryCategory, "isEqual:"))
      goto LABEL_66;
  }
  flags = self->_flags;
  v13 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_industryCode != *((_QWORD *)v4 + 10))
      goto LABEL_66;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0)
      goto LABEL_66;
    if (self->_enableBrandMuidFallback)
    {
      if (!*((_BYTE *)v4 + 152))
        goto LABEL_66;
    }
    else if (*((_BYTE *)v4 + 152))
    {
      goto LABEL_66;
    }
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_66;
  }
  transactionCurrencyCode = self->_transactionCurrencyCode;
  if ((unint64_t)transactionCurrencyCode | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](transactionCurrencyCode, "isEqual:"))
      goto LABEL_66;
    flags = self->_flags;
    v13 = *((_DWORD *)v4 + 39);
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_transactionStatus != *((_DWORD *)v4 + 37))
      goto LABEL_66;
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_66;
  }
  merchantInformation = self->_merchantInformation;
  if ((unint64_t)merchantInformation | *((_QWORD *)v4 + 11)
    && !-[GEOPDMerchantInformation isEqual:](merchantInformation, "isEqual:"))
  {
    goto LABEL_66;
  }
  baaCertificates = self->_baaCertificates;
  if ((unint64_t)baaCertificates | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](baaCertificates, "isEqual:"))
      goto LABEL_66;
  }
  baaSignature = self->_baaSignature;
  if ((unint64_t)baaSignature | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](baaSignature, "isEqual:"))
      goto LABEL_66;
  }
  bankTransactionDescriptionClean = self->_bankTransactionDescriptionClean;
  if ((unint64_t)bankTransactionDescriptionClean | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](bankTransactionDescriptionClean, "isEqual:"))
      goto LABEL_66;
  }
  bankIdentifier = self->_bankIdentifier;
  if ((unint64_t)bankIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](bankIdentifier, "isEqual:"))
      goto LABEL_66;
  }
  v20 = self->_flags;
  v21 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&v20 & 0x40) != 0)
  {
    if ((v21 & 0x40) != 0)
    {
      if (self->_piiRedactionApplied)
      {
        if (!*((_BYTE *)v4 + 153))
          goto LABEL_66;
        goto LABEL_61;
      }
      if (!*((_BYTE *)v4 + 153))
        goto LABEL_61;
    }
LABEL_66:
    v22 = 0;
    goto LABEL_67;
  }
  if ((v21 & 0x40) != 0)
    goto LABEL_66;
LABEL_61:
  if ((*(_BYTE *)&v20 & 8) != 0)
  {
    if ((v21 & 8) == 0 || self->_rotationPeriodsSinceEpoch != *((_DWORD *)v4 + 36))
      goto LABEL_66;
    v22 = 1;
  }
  else
  {
    v22 = (*((_DWORD *)v4 + 39) & 8) == 0;
  }
LABEL_67:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  double transactionTimestamp;
  double v5;
  long double v6;
  double v7;
  $B11C17402F3C51AE16215E686C0D2ADC flags;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  $B11C17402F3C51AE16215E686C0D2ADC v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  unint64_t v25;
  uint64_t v26;
  NSUInteger v27;
  uint64_t v28;
  NSUInteger v29;

  -[GEOPDBankTransactionInformation readAll:](self, "readAll:", 1);
  v29 = -[NSString hash](self->_anonymisedUserId, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v28 = 2654435761 * self->_bankTransactionType;
  else
    v28 = 0;
  v27 = -[NSString hash](self->_bankTransactionDescription, "hash");
  v26 = -[NSMutableArray hash](self->_otherTransactionLocations, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    transactionTimestamp = self->_transactionTimestamp;
    v5 = -transactionTimestamp;
    if (transactionTimestamp >= 0.0)
      v5 = self->_transactionTimestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v25 = v3;
  v24 = -[NSString hash](self->_rawMerchantCode, "hash");
  v23 = -[NSString hash](self->_industryCategory, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v21 = 2654435761 * self->_industryCode;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_14;
  }
  else
  {
    v21 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
    {
LABEL_14:
      v9 = 2654435761 * self->_enableBrandMuidFallback;
      goto LABEL_17;
    }
  }
  v9 = 0;
LABEL_17:
  v10 = -[NSString hash](self->_transactionCurrencyCode, "hash", v21);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v11 = 2654435761 * self->_transactionStatus;
  else
    v11 = 0;
  v12 = -[GEOPDMerchantInformation hash](self->_merchantInformation, "hash");
  v13 = -[NSMutableArray hash](self->_baaCertificates, "hash");
  v14 = -[NSData hash](self->_baaSignature, "hash");
  v15 = -[NSString hash](self->_bankTransactionDescriptionClean, "hash");
  v16 = -[NSString hash](self->_bankIdentifier, "hash");
  v17 = self->_flags;
  if ((*(_BYTE *)&v17 & 0x40) != 0)
  {
    v18 = 2654435761 * self->_piiRedactionApplied;
    if ((*(_BYTE *)&v17 & 8) != 0)
      goto LABEL_22;
LABEL_24:
    v19 = 0;
    return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19;
  }
  v18 = 0;
  if ((*(_BYTE *)&v17 & 8) == 0)
    goto LABEL_24;
LABEL_22:
  v19 = 2654435761 * self->_rotationPeriodsSinceEpoch;
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  GEOPDMerchantInformation *merchantInformation;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 3))
    -[GEOPDBankTransactionInformation setAnonymisedUserId:](self, "setAnonymisedUserId:");
  if ((*((_BYTE *)v4 + 156) & 4) != 0)
  {
    self->_bankTransactionType = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v4 + 8))
    -[GEOPDBankTransactionInformation setBankTransactionDescription:](self, "setBankTransactionDescription:");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = *((id *)v4 + 12);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDBankTransactionInformation addOtherTransactionLocations:](self, "addOtherTransactionLocations:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 156) & 2) != 0)
  {
    self->_transactionTimestamp = *((double *)v4 + 15);
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 13))
    -[GEOPDBankTransactionInformation setRawMerchantCode:](self, "setRawMerchantCode:");
  if (*((_QWORD *)v4 + 9))
    -[GEOPDBankTransactionInformation setIndustryCategory:](self, "setIndustryCategory:");
  v10 = *((_DWORD *)v4 + 39);
  if ((v10 & 1) != 0)
  {
    self->_industryCode = *((_QWORD *)v4 + 10);
    *(_DWORD *)&self->_flags |= 1u;
    v10 = *((_DWORD *)v4 + 39);
  }
  if ((v10 & 0x20) != 0)
  {
    self->_enableBrandMuidFallback = *((_BYTE *)v4 + 152);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  if (*((_QWORD *)v4 + 14))
    -[GEOPDBankTransactionInformation setTransactionCurrencyCode:](self, "setTransactionCurrencyCode:");
  if ((*((_BYTE *)v4 + 156) & 0x10) != 0)
  {
    self->_transactionStatus = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  merchantInformation = self->_merchantInformation;
  v12 = *((_QWORD *)v4 + 11);
  if (merchantInformation)
  {
    if (v12)
      -[GEOPDMerchantInformation mergeFrom:](merchantInformation, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOPDBankTransactionInformation setMerchantInformation:](self, "setMerchantInformation:");
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = *((id *)v4 + 4);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        -[GEOPDBankTransactionInformation addBaaCertificate:](self, "addBaaCertificate:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  if (*((_QWORD *)v4 + 5))
    -[GEOPDBankTransactionInformation setBaaSignature:](self, "setBaaSignature:");
  if (*((_QWORD *)v4 + 7))
    -[GEOPDBankTransactionInformation setBankTransactionDescriptionClean:](self, "setBankTransactionDescriptionClean:");
  if (*((_QWORD *)v4 + 6))
    -[GEOPDBankTransactionInformation setBankIdentifier:](self, "setBankIdentifier:");
  v18 = *((_DWORD *)v4 + 39);
  if ((v18 & 0x40) != 0)
  {
    self->_piiRedactionApplied = *((_BYTE *)v4 + 153);
    *(_DWORD *)&self->_flags |= 0x40u;
    v18 = *((_DWORD *)v4 + 39);
  }
  if ((v18 & 8) != 0)
  {
    self->_rotationPeriodsSinceEpoch = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 8u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDBankTransactionInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1502);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80080u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDBankTransactionInformation readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_otherTransactionLocations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[GEOPDMerchantInformation clearUnknownFields:](self->_merchantInformation, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionCurrencyCode, 0);
  objc_storeStrong((id *)&self->_rawMerchantCode, 0);
  objc_storeStrong((id *)&self->_otherTransactionLocations, 0);
  objc_storeStrong((id *)&self->_merchantInformation, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_bankTransactionDescription, 0);
  objc_storeStrong((id *)&self->_bankTransactionDescriptionClean, 0);
  objc_storeStrong((id *)&self->_bankIdentifier, 0);
  objc_storeStrong((id *)&self->_baaSignature, 0);
  objc_storeStrong((id *)&self->_baaCertificates, 0);
  objc_storeStrong((id *)&self->_anonymisedUserId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
