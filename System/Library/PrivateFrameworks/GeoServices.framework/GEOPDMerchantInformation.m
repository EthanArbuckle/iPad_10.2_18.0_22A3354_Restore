@implementation GEOPDMerchantInformation

- (GEOPDMerchantInformation)init
{
  GEOPDMerchantInformation *v2;
  GEOPDMerchantInformation *v3;
  GEOPDMerchantInformation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDMerchantInformation;
  v2 = -[GEOPDMerchantInformation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMerchantInformation)initWithData:(id)a3
{
  GEOPDMerchantInformation *v3;
  GEOPDMerchantInformation *v4;
  GEOPDMerchantInformation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDMerchantInformation;
  v3 = -[GEOPDMerchantInformation initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMerchantId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 153) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantId
{
  -[GEOPDMerchantInformation _readMerchantId]((uint64_t)self);
  return self->_merchantId != 0;
}

- (NSString)merchantId
{
  -[GEOPDMerchantInformation _readMerchantId]((uint64_t)self);
  return self->_merchantId;
}

- (void)setMerchantId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  objc_storeStrong((id *)&self->_merchantId, a3);
}

- (void)_readMerchantDoingBusinessAsName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 152) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantDoingBusinessAsName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantDoingBusinessAsName
{
  -[GEOPDMerchantInformation _readMerchantDoingBusinessAsName]((uint64_t)self);
  return self->_merchantDoingBusinessAsName != 0;
}

- (NSString)merchantDoingBusinessAsName
{
  -[GEOPDMerchantInformation _readMerchantDoingBusinessAsName]((uint64_t)self);
  return self->_merchantDoingBusinessAsName;
}

- (void)setMerchantDoingBusinessAsName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  objc_storeStrong((id *)&self->_merchantDoingBusinessAsName, a3);
}

- (void)_readMerchantEnhancedName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 153) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantEnhancedName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantEnhancedName
{
  -[GEOPDMerchantInformation _readMerchantEnhancedName]((uint64_t)self);
  return self->_merchantEnhancedName != 0;
}

- (NSString)merchantEnhancedName
{
  -[GEOPDMerchantInformation _readMerchantEnhancedName]((uint64_t)self);
  return self->_merchantEnhancedName;
}

- (void)setMerchantEnhancedName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  objc_storeStrong((id *)&self->_merchantEnhancedName, a3);
}

- (void)_readMerchantCity
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 152) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantCity_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantCity
{
  -[GEOPDMerchantInformation _readMerchantCity]((uint64_t)self);
  return self->_merchantCity != 0;
}

- (NSString)merchantCity
{
  -[GEOPDMerchantInformation _readMerchantCity]((uint64_t)self);
  return self->_merchantCity;
}

- (void)setMerchantCity:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  objc_storeStrong((id *)&self->_merchantCity, a3);
}

- (void)_readMerchantRawCity
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 153) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantRawCity_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantRawCity
{
  -[GEOPDMerchantInformation _readMerchantRawCity]((uint64_t)self);
  return self->_merchantRawCity != 0;
}

- (NSString)merchantRawCity
{
  -[GEOPDMerchantInformation _readMerchantRawCity]((uint64_t)self);
  return self->_merchantRawCity;
}

- (void)setMerchantRawCity:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  objc_storeStrong((id *)&self->_merchantRawCity, a3);
}

- (void)_readMerchantState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 153) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantState
{
  -[GEOPDMerchantInformation _readMerchantState]((uint64_t)self);
  return self->_merchantState != 0;
}

- (NSString)merchantState
{
  -[GEOPDMerchantInformation _readMerchantState]((uint64_t)self);
  return self->_merchantState;
}

- (void)setMerchantState:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_merchantState, a3);
}

- (void)_readMerchantRawState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 153) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantRawState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantRawState
{
  -[GEOPDMerchantInformation _readMerchantRawState]((uint64_t)self);
  return self->_merchantRawState != 0;
}

- (NSString)merchantRawState
{
  -[GEOPDMerchantInformation _readMerchantRawState]((uint64_t)self);
  return self->_merchantRawState;
}

- (void)setMerchantRawState:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_merchantRawState, a3);
}

- (void)_readMerchantZip
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 153) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantZip_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantZip
{
  -[GEOPDMerchantInformation _readMerchantZip]((uint64_t)self);
  return self->_merchantZip != 0;
}

- (NSString)merchantZip
{
  -[GEOPDMerchantInformation _readMerchantZip]((uint64_t)self);
  return self->_merchantZip;
}

- (void)setMerchantZip:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x18000u;
  objc_storeStrong((id *)&self->_merchantZip, a3);
}

- (void)_readMerchantAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 152) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantAddress
{
  -[GEOPDMerchantInformation _readMerchantAddress]((uint64_t)self);
  return self->_merchantAddress != 0;
}

- (NSString)merchantAddress
{
  -[GEOPDMerchantInformation _readMerchantAddress]((uint64_t)self);
  return self->_merchantAddress;
}

- (void)setMerchantAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  objc_storeStrong((id *)&self->_merchantAddress, a3);
}

- (void)_readMerchantRawAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 153) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantRawAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantRawAddress
{
  -[GEOPDMerchantInformation _readMerchantRawAddress]((uint64_t)self);
  return self->_merchantRawAddress != 0;
}

- (NSString)merchantRawAddress
{
  -[GEOPDMerchantInformation _readMerchantRawAddress]((uint64_t)self);
  return self->_merchantRawAddress;
}

- (void)setMerchantRawAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  objc_storeStrong((id *)&self->_merchantRawAddress, a3);
}

- (void)_readMerchantCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 152) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantCountryCode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantCountryCode
{
  -[GEOPDMerchantInformation _readMerchantCountryCode]((uint64_t)self);
  return self->_merchantCountryCode != 0;
}

- (NSString)merchantCountryCode
{
  -[GEOPDMerchantInformation _readMerchantCountryCode]((uint64_t)self);
  return self->_merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  objc_storeStrong((id *)&self->_merchantCountryCode, a3);
}

- (void)_readMerchantType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 153) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantType
{
  -[GEOPDMerchantInformation _readMerchantType]((uint64_t)self);
  return self->_merchantType != 0;
}

- (NSString)merchantType
{
  -[GEOPDMerchantInformation _readMerchantType]((uint64_t)self);
  return self->_merchantType;
}

- (void)setMerchantType:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_merchantType, a3);
}

- (int)merchantCleanConfidenceLevel
{
  return self->_merchantCleanConfidenceLevel;
}

- (void)setMerchantCleanConfidenceLevel:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_merchantCleanConfidenceLevel = a3;
}

- (void)setHasMerchantCleanConfidenceLevel:(BOOL)a3
{
  self->_flags = ($E8DA446A015AA6BFFC5AC7F180BF14D6)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasMerchantCleanConfidenceLevel
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readMerchantAdditionalData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 152) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantAdditionalData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantAdditionalData
{
  -[GEOPDMerchantInformation _readMerchantAdditionalData]((uint64_t)self);
  return self->_merchantAdditionalData != 0;
}

- (NSString)merchantAdditionalData
{
  -[GEOPDMerchantInformation _readMerchantAdditionalData]((uint64_t)self);
  return self->_merchantAdditionalData;
}

- (void)setMerchantAdditionalData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  objc_storeStrong((id *)&self->_merchantAdditionalData, a3);
}

- (void)_readMerchantCanl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 152) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantCanl_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantCanl
{
  -[GEOPDMerchantInformation _readMerchantCanl]((uint64_t)self);
  return self->_merchantCanl != 0;
}

- (NSString)merchantCanl
{
  -[GEOPDMerchantInformation _readMerchantCanl]((uint64_t)self);
  return self->_merchantCanl;
}

- (void)setMerchantCanl:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  objc_storeStrong((id *)&self->_merchantCanl, a3);
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
  v8.super_class = (Class)GEOPDMerchantInformation;
  -[GEOPDMerchantInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMerchantInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMerchantInformation _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v42[4];
  id v43;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "merchantId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("merchantId");
    else
      v6 = CFSTR("merchant_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend((id)a1, "merchantDoingBusinessAsName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("merchantDoingBusinessAsName");
    else
      v8 = CFSTR("merchant_doing_business_as_name");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend((id)a1, "merchantEnhancedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("merchantEnhancedName");
    else
      v10 = CFSTR("merchant_enhanced_name");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend((id)a1, "merchantCity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("merchantCity");
    else
      v12 = CFSTR("merchant_city");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  objc_msgSend((id)a1, "merchantRawCity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("merchantRawCity");
    else
      v14 = CFSTR("merchant_raw_city");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  objc_msgSend((id)a1, "merchantState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (a2)
      v16 = CFSTR("merchantState");
    else
      v16 = CFSTR("merchant_state");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  objc_msgSend((id)a1, "merchantRawState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("merchantRawState");
    else
      v18 = CFSTR("merchant_raw_state");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  objc_msgSend((id)a1, "merchantZip");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a2)
      v20 = CFSTR("merchantZip");
    else
      v20 = CFSTR("merchant_zip");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  objc_msgSend((id)a1, "merchantAddress");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (a2)
      v22 = CFSTR("merchantAddress");
    else
      v22 = CFSTR("merchant_address");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);
  }

  objc_msgSend((id)a1, "merchantRawAddress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (a2)
      v24 = CFSTR("merchantRawAddress");
    else
      v24 = CFSTR("merchant_raw_address");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);
  }

  objc_msgSend((id)a1, "merchantCountryCode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    if (a2)
      v26 = CFSTR("merchantCountryCode");
    else
      v26 = CFSTR("merchant_country_code");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);
  }

  objc_msgSend((id)a1, "merchantType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    if (a2)
      v28 = CFSTR("merchantType");
    else
      v28 = CFSTR("merchant_type");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);
  }

  if ((*(_BYTE *)(a1 + 152) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 148));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("merchantCleanConfidenceLevel");
    else
      v30 = CFSTR("merchant_clean_confidence_level");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  objc_msgSend((id)a1, "merchantAdditionalData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    if (a2)
      v32 = CFSTR("merchantAdditionalData");
    else
      v32 = CFSTR("merchant_additional_data");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);
  }

  objc_msgSend((id)a1, "merchantCanl");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    if (a2)
      v34 = CFSTR("merchantCanl");
    else
      v34 = CFSTR("merchant_canl");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);
  }

  v35 = *(void **)(a1 + 16);
  if (v35)
  {
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __54__GEOPDMerchantInformation__dictionaryRepresentation___block_invoke;
      v42[3] = &unk_1E1C00600;
      v39 = v38;
      v43 = v39;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v42);
      v40 = v39;

      v37 = v40;
    }
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMerchantInformation _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDMerchantInformation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDMerchantInformation)initWithDictionary:(id)a3
{
  return (GEOPDMerchantInformation *)-[GEOPDMerchantInformation _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("merchantId");
      else
        v6 = CFSTR("merchant_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setMerchantId:", v8);

      }
      if (a3)
        v9 = CFSTR("merchantDoingBusinessAsName");
      else
        v9 = CFSTR("merchant_doing_business_as_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setMerchantDoingBusinessAsName:", v11);

      }
      if (a3)
        v12 = CFSTR("merchantEnhancedName");
      else
        v12 = CFSTR("merchant_enhanced_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setMerchantEnhancedName:", v14);

      }
      if (a3)
        v15 = CFSTR("merchantCity");
      else
        v15 = CFSTR("merchant_city");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setMerchantCity:", v17);

      }
      if (a3)
        v18 = CFSTR("merchantRawCity");
      else
        v18 = CFSTR("merchant_raw_city");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(a1, "setMerchantRawCity:", v20);

      }
      if (a3)
        v21 = CFSTR("merchantState");
      else
        v21 = CFSTR("merchant_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = (void *)objc_msgSend(v22, "copy");
        objc_msgSend(a1, "setMerchantState:", v23);

      }
      if (a3)
        v24 = CFSTR("merchantRawState");
      else
        v24 = CFSTR("merchant_raw_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = (void *)objc_msgSend(v25, "copy");
        objc_msgSend(a1, "setMerchantRawState:", v26);

      }
      if (a3)
        v27 = CFSTR("merchantZip");
      else
        v27 = CFSTR("merchant_zip");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = (void *)objc_msgSend(v28, "copy");
        objc_msgSend(a1, "setMerchantZip:", v29);

      }
      if (a3)
        v30 = CFSTR("merchantAddress");
      else
        v30 = CFSTR("merchant_address");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = (void *)objc_msgSend(v31, "copy");
        objc_msgSend(a1, "setMerchantAddress:", v32);

      }
      if (a3)
        v33 = CFSTR("merchantRawAddress");
      else
        v33 = CFSTR("merchant_raw_address");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = (void *)objc_msgSend(v34, "copy");
        objc_msgSend(a1, "setMerchantRawAddress:", v35);

      }
      if (a3)
        v36 = CFSTR("merchantCountryCode");
      else
        v36 = CFSTR("merchant_country_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = (void *)objc_msgSend(v37, "copy");
        objc_msgSend(a1, "setMerchantCountryCode:", v38);

      }
      if (a3)
        v39 = CFSTR("merchantType");
      else
        v39 = CFSTR("merchant_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = (void *)objc_msgSend(v40, "copy");
        objc_msgSend(a1, "setMerchantType:", v41);

      }
      if (a3)
        v42 = CFSTR("merchantCleanConfidenceLevel");
      else
        v42 = CFSTR("merchant_clean_confidence_level");
      objc_msgSend(v5, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMerchantCleanConfidenceLevel:", objc_msgSend(v43, "intValue"));

      if (a3)
        v44 = CFSTR("merchantAdditionalData");
      else
        v44 = CFSTR("merchant_additional_data");
      objc_msgSend(v5, "objectForKeyedSubscript:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = (void *)objc_msgSend(v45, "copy");
        objc_msgSend(a1, "setMerchantAdditionalData:", v46);

      }
      if (a3)
        v47 = CFSTR("merchantCanl");
      else
        v47 = CFSTR("merchant_canl");
      objc_msgSend(v5, "objectForKeyedSubscript:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = (void *)objc_msgSend(v48, "copy");
        objc_msgSend(a1, "setMerchantCanl:", v49);

      }
    }
  }

  return a1;
}

- (GEOPDMerchantInformation)initWithJSON:(id)a3
{
  return (GEOPDMerchantInformation *)-[GEOPDMerchantInformation _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3096;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3097;
    GEOPDMerchantInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDMerchantInformationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMerchantInformationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_DWORD *)&self->_flags & 0x1FFFC) == 0))
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
    -[GEOPDMerchantInformation readAll:](self, "readAll:", 0);
    if (self->_merchantId)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_merchantDoingBusinessAsName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantEnhancedName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantCity)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantRawCity)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantState)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantRawState)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantZip)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantAddress)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantRawAddress)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantCountryCode)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantType)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_merchantAdditionalData)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_merchantCanl)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOPDMerchantInformation readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 34) = self->_readerMarkPos;
  *((_DWORD *)v5 + 35) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_merchantId)
    objc_msgSend(v5, "setMerchantId:");
  if (self->_merchantDoingBusinessAsName)
    objc_msgSend(v5, "setMerchantDoingBusinessAsName:");
  v4 = v5;
  if (self->_merchantEnhancedName)
  {
    objc_msgSend(v5, "setMerchantEnhancedName:");
    v4 = v5;
  }
  if (self->_merchantCity)
  {
    objc_msgSend(v5, "setMerchantCity:");
    v4 = v5;
  }
  if (self->_merchantRawCity)
  {
    objc_msgSend(v5, "setMerchantRawCity:");
    v4 = v5;
  }
  if (self->_merchantState)
  {
    objc_msgSend(v5, "setMerchantState:");
    v4 = v5;
  }
  if (self->_merchantRawState)
  {
    objc_msgSend(v5, "setMerchantRawState:");
    v4 = v5;
  }
  if (self->_merchantZip)
  {
    objc_msgSend(v5, "setMerchantZip:");
    v4 = v5;
  }
  if (self->_merchantAddress)
  {
    objc_msgSend(v5, "setMerchantAddress:");
    v4 = v5;
  }
  if (self->_merchantRawAddress)
  {
    objc_msgSend(v5, "setMerchantRawAddress:");
    v4 = v5;
  }
  if (self->_merchantCountryCode)
  {
    objc_msgSend(v5, "setMerchantCountryCode:");
    v4 = v5;
  }
  if (self->_merchantType)
  {
    objc_msgSend(v5, "setMerchantType:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 37) = self->_merchantCleanConfidenceLevel;
    *((_DWORD *)v4 + 38) |= 1u;
  }
  if (self->_merchantAdditionalData)
  {
    objc_msgSend(v5, "setMerchantAdditionalData:");
    v4 = v5;
  }
  if (self->_merchantCanl)
  {
    objc_msgSend(v5, "setMerchantCanl:");
    v4 = v5;
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
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  PBUnknownFields *v37;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDMerchantInformationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMerchantInformation readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_merchantId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  v11 = -[NSString copyWithZone:](self->_merchantDoingBusinessAsName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  v13 = -[NSString copyWithZone:](self->_merchantEnhancedName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[NSString copyWithZone:](self->_merchantCity, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = -[NSString copyWithZone:](self->_merchantRawCity, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v17;

  v19 = -[NSString copyWithZone:](self->_merchantState, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v19;

  v21 = -[NSString copyWithZone:](self->_merchantRawState, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v21;

  v23 = -[NSString copyWithZone:](self->_merchantZip, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v23;

  v25 = -[NSString copyWithZone:](self->_merchantAddress, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v25;

  v27 = -[NSString copyWithZone:](self->_merchantRawAddress, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v27;

  v29 = -[NSString copyWithZone:](self->_merchantCountryCode, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v29;

  v31 = -[NSString copyWithZone:](self->_merchantType, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v31;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_merchantCleanConfidenceLevel;
    *(_DWORD *)(v5 + 152) |= 1u;
  }
  v33 = -[NSString copyWithZone:](self->_merchantAdditionalData, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v33;

  v35 = -[NSString copyWithZone:](self->_merchantCanl, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v35;

  v37 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v37;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *merchantId;
  NSString *merchantDoingBusinessAsName;
  NSString *merchantEnhancedName;
  NSString *merchantCity;
  NSString *merchantRawCity;
  NSString *merchantState;
  NSString *merchantRawState;
  NSString *merchantZip;
  NSString *merchantAddress;
  NSString *merchantRawAddress;
  NSString *merchantCountryCode;
  NSString *merchantType;
  int v17;
  NSString *merchantAdditionalData;
  NSString *merchantCanl;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  -[GEOPDMerchantInformation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  merchantId = self->_merchantId;
  if ((unint64_t)merchantId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](merchantId, "isEqual:"))
      goto LABEL_35;
  }
  merchantDoingBusinessAsName = self->_merchantDoingBusinessAsName;
  if ((unint64_t)merchantDoingBusinessAsName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](merchantDoingBusinessAsName, "isEqual:"))
      goto LABEL_35;
  }
  merchantEnhancedName = self->_merchantEnhancedName;
  if ((unint64_t)merchantEnhancedName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](merchantEnhancedName, "isEqual:"))
      goto LABEL_35;
  }
  merchantCity = self->_merchantCity;
  if ((unint64_t)merchantCity | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](merchantCity, "isEqual:"))
      goto LABEL_35;
  }
  merchantRawCity = self->_merchantRawCity;
  if ((unint64_t)merchantRawCity | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](merchantRawCity, "isEqual:"))
      goto LABEL_35;
  }
  merchantState = self->_merchantState;
  if ((unint64_t)merchantState | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](merchantState, "isEqual:"))
      goto LABEL_35;
  }
  merchantRawState = self->_merchantRawState;
  if ((unint64_t)merchantRawState | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](merchantRawState, "isEqual:"))
      goto LABEL_35;
  }
  merchantZip = self->_merchantZip;
  if ((unint64_t)merchantZip | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](merchantZip, "isEqual:"))
      goto LABEL_35;
  }
  merchantAddress = self->_merchantAddress;
  if ((unint64_t)merchantAddress | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](merchantAddress, "isEqual:"))
      goto LABEL_35;
  }
  merchantRawAddress = self->_merchantRawAddress;
  if ((unint64_t)merchantRawAddress | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](merchantRawAddress, "isEqual:"))
      goto LABEL_35;
  }
  merchantCountryCode = self->_merchantCountryCode;
  if ((unint64_t)merchantCountryCode | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](merchantCountryCode, "isEqual:"))
      goto LABEL_35;
  }
  merchantType = self->_merchantType;
  if ((unint64_t)merchantType | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](merchantType, "isEqual:"))
      goto LABEL_35;
  }
  v17 = *((_DWORD *)v4 + 38);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v17 & 1) == 0 || self->_merchantCleanConfidenceLevel != *((_DWORD *)v4 + 37))
      goto LABEL_35;
  }
  else if ((v17 & 1) != 0)
  {
LABEL_35:
    v20 = 0;
    goto LABEL_36;
  }
  merchantAdditionalData = self->_merchantAdditionalData;
  if ((unint64_t)merchantAdditionalData | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](merchantAdditionalData, "isEqual:"))
  {
    goto LABEL_35;
  }
  merchantCanl = self->_merchantCanl;
  if ((unint64_t)merchantCanl | *((_QWORD *)v4 + 5))
    v20 = -[NSString isEqual:](merchantCanl, "isEqual:");
  else
    v20 = 1;
LABEL_36:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;

  -[GEOPDMerchantInformation readAll:](self, "readAll:", 1);
  v18 = -[NSString hash](self->_merchantId, "hash");
  v17 = -[NSString hash](self->_merchantDoingBusinessAsName, "hash");
  v16 = -[NSString hash](self->_merchantEnhancedName, "hash");
  v3 = -[NSString hash](self->_merchantCity, "hash");
  v4 = -[NSString hash](self->_merchantRawCity, "hash");
  v5 = -[NSString hash](self->_merchantState, "hash");
  v6 = -[NSString hash](self->_merchantRawState, "hash");
  v7 = -[NSString hash](self->_merchantZip, "hash");
  v8 = -[NSString hash](self->_merchantAddress, "hash");
  v9 = -[NSString hash](self->_merchantRawAddress, "hash");
  v10 = -[NSString hash](self->_merchantCountryCode, "hash");
  v11 = -[NSString hash](self->_merchantType, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v12 = 2654435761 * self->_merchantCleanConfidenceLevel;
  else
    v12 = 0;
  v13 = v17 ^ v18 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v14 = v11 ^ v12 ^ -[NSString hash](self->_merchantAdditionalData, "hash");
  return v13 ^ v14 ^ -[NSString hash](self->_merchantCanl, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if (v5[10])
  {
    -[GEOPDMerchantInformation setMerchantId:](self, "setMerchantId:");
    v4 = v5;
  }
  if (v4[8])
  {
    -[GEOPDMerchantInformation setMerchantDoingBusinessAsName:](self, "setMerchantDoingBusinessAsName:");
    v4 = v5;
  }
  if (v4[9])
  {
    -[GEOPDMerchantInformation setMerchantEnhancedName:](self, "setMerchantEnhancedName:");
    v4 = v5;
  }
  if (v4[6])
  {
    -[GEOPDMerchantInformation setMerchantCity:](self, "setMerchantCity:");
    v4 = v5;
  }
  if (v4[12])
  {
    -[GEOPDMerchantInformation setMerchantRawCity:](self, "setMerchantRawCity:");
    v4 = v5;
  }
  if (v4[14])
  {
    -[GEOPDMerchantInformation setMerchantState:](self, "setMerchantState:");
    v4 = v5;
  }
  if (v4[13])
  {
    -[GEOPDMerchantInformation setMerchantRawState:](self, "setMerchantRawState:");
    v4 = v5;
  }
  if (v4[16])
  {
    -[GEOPDMerchantInformation setMerchantZip:](self, "setMerchantZip:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[GEOPDMerchantInformation setMerchantAddress:](self, "setMerchantAddress:");
    v4 = v5;
  }
  if (v4[11])
  {
    -[GEOPDMerchantInformation setMerchantRawAddress:](self, "setMerchantRawAddress:");
    v4 = v5;
  }
  if (v4[7])
  {
    -[GEOPDMerchantInformation setMerchantCountryCode:](self, "setMerchantCountryCode:");
    v4 = v5;
  }
  if (v4[15])
  {
    -[GEOPDMerchantInformation setMerchantType:](self, "setMerchantType:");
    v4 = v5;
  }
  if ((v4[19] & 1) != 0)
  {
    self->_merchantCleanConfidenceLevel = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 1u;
  }
  if (v4[3])
  {
    -[GEOPDMerchantInformation setMerchantAdditionalData:](self, "setMerchantAdditionalData:");
    v4 = v5;
  }
  if (v4[5])
  {
    -[GEOPDMerchantInformation setMerchantCanl:](self, "setMerchantCanl:");
    v4 = v5;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDMerchantInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3100);
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

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10002u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOPDMerchantInformation readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantZip, 0);
  objc_storeStrong((id *)&self->_merchantType, 0);
  objc_storeStrong((id *)&self->_merchantState, 0);
  objc_storeStrong((id *)&self->_merchantRawState, 0);
  objc_storeStrong((id *)&self->_merchantRawCity, 0);
  objc_storeStrong((id *)&self->_merchantRawAddress, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_merchantEnhancedName, 0);
  objc_storeStrong((id *)&self->_merchantDoingBusinessAsName, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_merchantCity, 0);
  objc_storeStrong((id *)&self->_merchantCanl, 0);
  objc_storeStrong((id *)&self->_merchantAddress, 0);
  objc_storeStrong((id *)&self->_merchantAdditionalData, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
