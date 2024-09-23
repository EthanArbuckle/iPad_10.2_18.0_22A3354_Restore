@implementation GEOPDMerchantLookupBrandParameters

- (GEOPDMerchantLookupBrandParameters)init
{
  GEOPDMerchantLookupBrandParameters *v2;
  GEOPDMerchantLookupBrandParameters *v3;
  GEOPDMerchantLookupBrandParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDMerchantLookupBrandParameters;
  v2 = -[GEOPDMerchantLookupBrandParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMerchantLookupBrandParameters)initWithData:(id)a3
{
  GEOPDMerchantLookupBrandParameters *v3;
  GEOPDMerchantLookupBrandParameters *v4;
  GEOPDMerchantLookupBrandParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDMerchantLookupBrandParameters;
  v3 = -[GEOPDMerchantLookupBrandParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDMerchantLookupBrandParameters;
  -[GEOPDMerchantLookupBrandParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMerchantLookupBrandParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMerchantLookupBrandParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  id v27;
  const __CFString *v28;
  void *v29;
  id v30;
  id v31;
  const __CFString *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v46[4];
  id v47;

  if (!a1)
    return 0;
  -[GEOPDMerchantLookupBrandParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantCode_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v7 = *(id *)(a1 + 48);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("merchantCode");
    else
      v8 = CFSTR("merchant_code");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRawMerchantCode_tags_3196);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v11 = *(id *)(a1 + 64);
  if (v11)
  {
    if (a2)
      v12 = CFSTR("rawMerchantCode");
    else
      v12 = CFSTR("raw_merchant_code");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
  {
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = v13;
      objc_sync_enter(v14);
      GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWarsawIdentifier_tags);
      objc_sync_exit(v14);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v15 = *(id *)(a1 + 72);
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("warsawIdentifier");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("warsaw_identifier");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 92) & 2) == 0)
  {
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      v20 = v19;
      objc_sync_enter(v20);
      GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppIdentifier_tags);
      objc_sync_exit(v20);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v21 = *(id *)(a1 + 24);
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("appIdentifier");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("app_identifier");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
  {
    v25 = *(void **)(a1 + 8);
    if (v25)
    {
      v26 = v25;
      objc_sync_enter(v26);
      GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantId_tags_3197);
      objc_sync_exit(v26);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v27 = *(id *)(a1 + 56);
  if (v27)
  {
    if (a2)
      v28 = CFSTR("merchantId");
    else
      v28 = CFSTR("merchant_id");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 92) & 8) == 0)
  {
    v29 = *(void **)(a1 + 8);
    if (v29)
    {
      v30 = v29;
      objc_sync_enter(v30);
      GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantCanl_tags_3198);
      objc_sync_exit(v30);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v31 = *(id *)(a1 + 40);
  if (v31)
  {
    if (a2)
      v32 = CFSTR("merchantCanl");
    else
      v32 = CFSTR("merchant_canl");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 92) & 4) == 0)
  {
    v33 = *(void **)(a1 + 8);
    if (v33)
    {
      v34 = v33;
      objc_sync_enter(v34);
      GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentityMerchantInformation_tags);
      objc_sync_exit(v34);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v35 = *(id *)(a1 + 32);
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("identityMerchantInformation");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("identity_merchant_information");
    }
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  v39 = *(void **)(a1 + 16);
  if (v39)
  {
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v40, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __64__GEOPDMerchantLookupBrandParameters__dictionaryRepresentation___block_invoke;
      v46[3] = &unk_1E1C00600;
      v43 = v42;
      v47 = v43;
      objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v46);
      v44 = v43;

      v41 = v44;
    }
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMerchantLookupBrandParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_3218;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3219;
      GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDWarsawMerchantIdentifier readAll:](*(_QWORD *)(a1 + 72), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __64__GEOPDMerchantLookupBrandParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDMerchantLookupBrandParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_7;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0x150) != 0)
    goto LABEL_7;
  if ((flags & 0x80) != 0)
  {
    if (GEOPDWarsawMerchantIdentifierIsDirty((uint64_t)self->_warsawIdentifier))
      goto LABEL_7;
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x2E) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_22;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMerchantLookupBrandParameters readAll:]((uint64_t)self, 0);
  if (self->_merchantCode)
    PBDataWriterWriteStringField();
  v6 = v9;
  if (self->_rawMerchantCode)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_warsawIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  if (self->_appIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  if (self->_merchantId)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_merchantCanl)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_identityMerchantInformation)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_22:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMerchantLookupBrandParameters readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_merchantCode, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v8;

    v10 = -[NSString copyWithZone:](self->_rawMerchantCode, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v10;

    v12 = -[GEOPDWarsawMerchantIdentifier copyWithZone:](self->_warsawIdentifier, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v12;

    v14 = -[GEOPDAdamAppIdentifier copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v14;

    v16 = -[NSString copyWithZone:](self->_merchantId, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v16;

    v18 = -[NSString copyWithZone:](self->_merchantCanl, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v18;

    v20 = -[GEOPDIdentityMerchantInformation copyWithZone:](self->_identityMerchantInformation, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v20;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDMerchantLookupBrandParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *merchantCode;
  NSString *rawMerchantCode;
  GEOPDWarsawMerchantIdentifier *warsawIdentifier;
  GEOPDAdamAppIdentifier *appIdentifier;
  NSString *merchantId;
  NSString *merchantCanl;
  GEOPDIdentityMerchantInformation *identityMerchantInformation;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPDMerchantLookupBrandParameters readAll:]((uint64_t)self, 1);
  -[GEOPDMerchantLookupBrandParameters readAll:]((uint64_t)v4, 1);
  merchantCode = self->_merchantCode;
  if ((unint64_t)merchantCode | v4[6])
  {
    if (!-[NSString isEqual:](merchantCode, "isEqual:"))
      goto LABEL_16;
  }
  if (((rawMerchantCode = self->_rawMerchantCode, !((unint64_t)rawMerchantCode | v4[8]))
     || -[NSString isEqual:](rawMerchantCode, "isEqual:"))
    && ((warsawIdentifier = self->_warsawIdentifier, !((unint64_t)warsawIdentifier | v4[9]))
     || -[GEOPDWarsawMerchantIdentifier isEqual:](warsawIdentifier, "isEqual:"))
    && ((appIdentifier = self->_appIdentifier, !((unint64_t)appIdentifier | v4[3]))
     || -[GEOPDAdamAppIdentifier isEqual:](appIdentifier, "isEqual:"))
    && ((merchantId = self->_merchantId, !((unint64_t)merchantId | v4[7]))
     || -[NSString isEqual:](merchantId, "isEqual:"))
    && ((merchantCanl = self->_merchantCanl, !((unint64_t)merchantCanl | v4[5]))
     || -[NSString isEqual:](merchantCanl, "isEqual:")))
  {
    identityMerchantInformation = self->_identityMerchantInformation;
    if ((unint64_t)identityMerchantInformation | v4[4])
      v12 = -[GEOPDIdentityMerchantInformation isEqual:](identityMerchantInformation, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
LABEL_16:
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;

  -[GEOPDMerchantLookupBrandParameters readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_merchantCode, "hash");
  v4 = -[NSString hash](self->_rawMerchantCode, "hash") ^ v3;
  v5 = -[GEOPDWarsawMerchantIdentifier hash](self->_warsawIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[GEOPDAdamAppIdentifier hash](self->_appIdentifier, "hash");
  v7 = -[NSString hash](self->_merchantId, "hash");
  v8 = v7 ^ -[NSString hash](self->_merchantCanl, "hash");
  return v6 ^ v8 ^ -[GEOPDIdentityMerchantInformation hash](self->_identityMerchantInformation, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warsawIdentifier, 0);
  objc_storeStrong((id *)&self->_rawMerchantCode, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_merchantCode, 0);
  objc_storeStrong((id *)&self->_merchantCanl, 0);
  objc_storeStrong((id *)&self->_identityMerchantInformation, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
