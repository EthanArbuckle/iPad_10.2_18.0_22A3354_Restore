@implementation GEORPTdmInfo

- (GEORPTdmInfo)init
{
  GEORPTdmInfo *v2;
  GEORPTdmInfo *v3;
  GEORPTdmInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPTdmInfo;
  v2 = -[GEORPTdmInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPTdmInfo)initWithData:(id)a3
{
  GEORPTdmInfo *v3;
  GEORPTdmInfo *v4;
  GEORPTdmInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPTdmInfo;
  v3 = -[GEORPTdmInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAnonymousUserId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnonymousUserId_tags_3039);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAnonymousUserId
{
  -[GEORPTdmInfo _readAnonymousUserId]((uint64_t)self);
  return self->_anonymousUserId != 0;
}

- (NSString)anonymousUserId
{
  -[GEORPTdmInfo _readAnonymousUserId]((uint64_t)self);
  return self->_anonymousUserId;
}

- (void)setAnonymousUserId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_anonymousUserId, a3);
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_isBlocked = a3;
}

- (void)setHasIsBlocked:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasIsBlocked
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readBaaCertificates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBaaCertificates_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)baaCertificates
{
  -[GEORPTdmInfo _readBaaCertificates]((uint64_t)self);
  return self->_baaCertificates;
}

- (void)setBaaCertificates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *baaCertificates;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  baaCertificates = self->_baaCertificates;
  self->_baaCertificates = v4;

}

- (void)clearBaaCertificates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_baaCertificates, "removeAllObjects");
}

- (void)addBaaCertificates:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPTdmInfo _readBaaCertificates]((uint64_t)self);
  -[GEORPTdmInfo _addNoFlagsBaaCertificates:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsBaaCertificates:(uint64_t)a1
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
  -[GEORPTdmInfo _readBaaCertificates]((uint64_t)self);
  return -[NSMutableArray count](self->_baaCertificates, "count");
}

- (id)baaCertificatesAtIndex:(unint64_t)a3
{
  -[GEORPTdmInfo _readBaaCertificates]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_baaCertificates, "objectAtIndex:", a3);
}

+ (Class)baaCertificatesType
{
  return (Class)objc_opt_class();
}

- (void)_readBaaSignature
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBaaSignature_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasBaaSignature
{
  -[GEORPTdmInfo _readBaaSignature]((uint64_t)self);
  return self->_baaSignature != 0;
}

- (NSData)baaSignature
{
  -[GEORPTdmInfo _readBaaSignature]((uint64_t)self);
  return self->_baaSignature;
}

- (void)setBaaSignature:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_baaSignature, a3);
}

- (BOOL)isTrusted
{
  return self->_isTrusted;
}

- (void)setIsTrusted:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_isTrusted = a3;
}

- (void)setHasIsTrusted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsTrusted
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEORPTdmInfo;
  -[GEORPTdmInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPTdmInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTdmInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  unint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  unint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  v4 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "anonymousUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (a2)
      v7 = CFSTR("anonymousUserId");
    else
      v7 = CFSTR("anonymous_user_id");
    objc_msgSend(v5, "setObject:forKey:", v6, v7);
  }

  v8 = 0x1E0CB3000uLL;
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 60));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("isBlocked");
    else
      v10 = CFSTR("is_blocked");
    objc_msgSend(v5, "setObject:forKey:", v9, v10);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    if (a2)
    {
      v11 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "baaCertificates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend((id)a1, "baaCertificates");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v36 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "base64EncodedStringWithOptions:", 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v16);
      }

      objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("baaCertificates"));
      v4 = 0x1E0C99000;
      v8 = 0x1E0CB3000;
    }
    else
    {
      objc_msgSend((id)a1, "baaCertificates");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("baa_certificates"));

    }
  }
  objc_msgSend((id)a1, "baaSignature");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("baaSignature"));

    }
    else
    {
      objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("baa_signature"));
    }
  }

  if ((*(_BYTE *)(a1 + 64) & 2) != 0)
  {
    objc_msgSend(*(id *)(v8 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 61));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("isTrusted");
    else
      v25 = CFSTR("is_trusted");
    objc_msgSend(v5, "setObject:forKey:", v24, v25);

  }
  v26 = *(void **)(a1 + 16);
  if (v26)
  {
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a2)
    {
      objc_msgSend(*(id *)(v4 + 3592), "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __42__GEORPTdmInfo__dictionaryRepresentation___block_invoke;
      v33[3] = &unk_1E1C00600;
      v30 = v29;
      v34 = v30;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v33);
      v31 = v30;

      v28 = v31;
    }
    objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("Unknown Fields"));

  }
  return v5;
}

- (id)jsonRepresentation
{
  return -[GEORPTdmInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEORPTdmInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPTdmInfo)initWithDictionary:(id)a3
{
  return (GEORPTdmInfo *)-[GEORPTdmInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("anonymousUserId");
      else
        v6 = CFSTR("anonymous_user_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setAnonymousUserId:", v8);

      }
      if (a3)
        v9 = CFSTR("isBlocked");
      else
        v9 = CFSTR("is_blocked");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsBlocked:", objc_msgSend(v10, "BOOLValue"));

      if (a3)
        v11 = CFSTR("baaCertificates");
      else
        v11 = CFSTR("baa_certificates");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = a3;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v28;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v28 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v18, 0);
                objc_msgSend(a1, "addBaaCertificates:", v19);

              }
              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v15);
        }

        a3 = v26;
      }

      if (a3)
        v20 = CFSTR("baaSignature");
      else
        v20 = CFSTR("baa_signature");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v21, 0);
        objc_msgSend(a1, "setBaaSignature:", v22);

      }
      if (a3)
        v23 = CFSTR("isTrusted");
      else
        v23 = CFSTR("is_trusted");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsTrusted:", objc_msgSend(v24, "BOOLValue"));

    }
  }

  return a1;
}

- (GEORPTdmInfo)initWithJSON:(id)a3
{
  return (GEORPTdmInfo *)-[GEORPTdmInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3056;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3057;
    GEORPTdmInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTdmInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTdmInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x78) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPTdmInfo readAll:](self, "readAll:", 0);
    if (self->_anonymousUserId)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_baaCertificates;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteDataField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_baaSignature)
      PBDataWriterWriteDataField();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEORPTdmInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_anonymousUserId)
    objc_msgSend(v8, "setAnonymousUserId:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v8 + 60) = self->_isBlocked;
    *((_BYTE *)v8 + 64) |= 1u;
  }
  if (-[GEORPTdmInfo baaCertificatesCount](self, "baaCertificatesCount"))
  {
    objc_msgSend(v8, "clearBaaCertificates");
    v4 = -[GEORPTdmInfo baaCertificatesCount](self, "baaCertificatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPTdmInfo baaCertificatesAtIndex:](self, "baaCertificatesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addBaaCertificates:", v7);

      }
    }
  }
  if (self->_baaSignature)
    objc_msgSend(v8, "setBaaSignature:");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v8 + 61) = self->_isTrusted;
    *((_BYTE *)v8 + 64) |= 2u;
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  PBUnknownFields *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPTdmInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPTdmInfo readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_anonymousUserId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 60) = self->_isBlocked;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_baaCertificates;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend((id)v5, "addBaaCertificates:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v16 = -[NSData copyWithZone:](self->_baaSignature, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 61) = self->_isTrusted;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v18 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *anonymousUserId;
  NSMutableArray *baaCertificates;
  NSData *baaSignature;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEORPTdmInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  anonymousUserId = self->_anonymousUserId;
  if ((unint64_t)anonymousUserId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](anonymousUserId, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0)
      goto LABEL_18;
    if (self->_isBlocked)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_18;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_18;
  }
  baaCertificates = self->_baaCertificates;
  if ((unint64_t)baaCertificates | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](baaCertificates, "isEqual:"))
  {
    goto LABEL_18;
  }
  baaSignature = self->_baaSignature;
  if ((unint64_t)baaSignature | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](baaSignature, "isEqual:"))
      goto LABEL_18;
  }
  v8 = (*((_BYTE *)v4 + 64) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) != 0)
    {
      if (self->_isTrusted)
      {
        if (!*((_BYTE *)v4 + 61))
          goto LABEL_18;
      }
      else if (*((_BYTE *)v4 + 61))
      {
        goto LABEL_18;
      }
      v8 = 1;
      goto LABEL_19;
    }
LABEL_18:
    v8 = 0;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEORPTdmInfo readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_anonymousUserId, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_isBlocked;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_baaCertificates, "hash");
  v6 = -[NSData hash](self->_baaSignature, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v7 = 2654435761 * self->_isTrusted;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 3))
    -[GEORPTdmInfo setAnonymousUserId:](self, "setAnonymousUserId:");
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_isBlocked = *((_BYTE *)v4 + 60);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GEORPTdmInfo addBaaCertificates:](self, "addBaaCertificates:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 5))
    -[GEORPTdmInfo setBaaSignature:](self, "setBaaSignature:");
  if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    self->_isTrusted = *((_BYTE *)v4 + 61);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPTdmInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3060);
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
  *(_BYTE *)&self->_flags |= 0x44u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEORPTdmInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baaSignature, 0);
  objc_storeStrong((id *)&self->_baaCertificates, 0);
  objc_storeStrong((id *)&self->_anonymousUserId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
