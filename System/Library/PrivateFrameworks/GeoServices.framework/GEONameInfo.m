@implementation GEONameInfo

- (GEONameInfo)init
{
  GEONameInfo *v2;
  GEONameInfo *v3;
  GEONameInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEONameInfo;
  v2 = -[GEONameInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONameInfo)initWithData:(id)a3
{
  GEONameInfo *v3;
  GEONameInfo *v4;
  GEONameInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEONameInfo;
  v3 = -[GEONameInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONameInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_17);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasName
{
  -[GEONameInfo _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEONameInfo _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPhoneticName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONameInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneticName_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPhoneticName
{
  -[GEONameInfo _readPhoneticName]((uint64_t)self);
  return self->_phoneticName != 0;
}

- (NSString)phoneticName
{
  -[GEONameInfo _readPhoneticName]((uint64_t)self);
  return self->_phoneticName;
}

- (void)setPhoneticName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_phoneticName, a3);
}

- (void)_readShield
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONameInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShield_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasShield
{
  -[GEONameInfo _readShield]((uint64_t)self);
  return self->_shield != 0;
}

- (NSString)shield
{
  -[GEONameInfo _readShield]((uint64_t)self);
  return self->_shield;
}

- (void)setShield:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_shield, a3);
}

- (int)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_shieldType = a3;
}

- (void)setHasShieldType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasShieldType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)phoneticType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_phoneticType;
  else
    return 0;
}

- (void)setPhoneticType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_phoneticType = a3;
}

- (void)setHasPhoneticType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasPhoneticType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)phoneticTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C13C28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPhoneticType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NUANCE_LHPLUS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNABBREVIATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("XSAMPA")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)signType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_signType;
  else
    return 0;
}

- (void)setSignType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_signType = a3;
}

- (void)setHasSignType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 260;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasSignType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)signTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C13C40[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSignType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNDEFINED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BRANCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOWARDS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INTERSECTION")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readLocale
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONameInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocale_tags_940);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocale
{
  -[GEONameInfo _readLocale]((uint64_t)self);
  return self->_locale != 0;
}

- (NSString)locale
{
  -[GEONameInfo _readLocale]((uint64_t)self);
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_locale, a3);
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
  v8.super_class = (Class)GEONameInfo;
  -[GEONameInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONameInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONameInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("name"));

  objc_msgSend((id)a1, "phoneticName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("phoneticName"));

  objc_msgSend((id)a1, "shield");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("shield"));

  v8 = *(_WORD *)(a1 + 80);
  if ((v8 & 2) == 0)
  {
    if ((v8 & 1) == 0)
      goto LABEL_10;
LABEL_13:
    v10 = *(int *)(a1 + 68);
    if (v10 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E1C13C28[v10];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("phoneticType"));

    if ((*(_WORD *)(a1 + 80) & 4) == 0)
      goto LABEL_21;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("shieldType"));

  v8 = *(_WORD *)(a1 + 80);
  if ((v8 & 1) != 0)
    goto LABEL_13;
LABEL_10:
  if ((v8 & 4) != 0)
  {
LABEL_17:
    v12 = *(int *)(a1 + 76);
    if (v12 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C13C40[v12];
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("signType"));

  }
LABEL_21:
  objc_msgSend((id)a1, "locale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("locale"));

  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __41__GEONameInfo__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONameInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEONameInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEONameInfo)initWithDictionary:(id)a3
{
  return (GEONameInfo *)-[GEONameInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v3 = a2;
  if (!a1)
    goto LABEL_40;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_40;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(a1, "setName:", v5);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("phoneticName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setPhoneticName:", v7);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shield"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(a1, "setShield:", v9);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shieldType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShieldType:", objc_msgSend(v10, "intValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("phoneticType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NUANCE_LHPLUS")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("UNABBREVIATED")) & 1) != 0)
    {
      v13 = 1;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("XSAMPA")))
    {
      v13 = 2;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_23;
    v13 = objc_msgSend(v11, "intValue");
  }
  objc_msgSend(a1, "setPhoneticType:", v13);
LABEL_23:

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("signType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNDEFINED")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BRANCH")) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TOWARDS")) & 1) != 0)
    {
      v16 = 2;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("INTERSECTION")))
    {
      v16 = 3;
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v14, "intValue");
LABEL_36:
    objc_msgSend(a1, "setSignType:", v16);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locale"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(a1, "setLocale:", v18);

  }
LABEL_40:

  return a1;
}

- (GEONameInfo)initWithJSON:(id)a3
{
  return (GEONameInfo *)-[GEONameInfo _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_953;
    else
      v8 = (int *)&readAll__nonRecursiveTag_954;
    GEONameInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONameInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONameInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1F0) == 0)
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
      goto LABEL_20;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONameInfo readAll:](self, "readAll:", 0);
  if (self->_name)
    PBDataWriterWriteStringField();
  v5 = v9;
  if (self->_phoneticName)
  {
    PBDataWriterWriteStringField();
    v5 = v9;
  }
  if (self->_shield)
  {
    PBDataWriterWriteStringField();
    v5 = v9;
  }
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0)
      goto LABEL_11;
LABEL_17:
    PBDataWriterWriteInt32Field();
    v5 = v9;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  PBDataWriterWriteSint32Field();
  v5 = v9;
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_17;
LABEL_11:
  if ((flags & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    v5 = v9;
  }
LABEL_13:
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    v5 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
LABEL_20:

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  id *v6;

  v6 = (id *)a3;
  -[GEONameInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_name)
    objc_msgSend(v6, "setName:");
  if (self->_phoneticName)
    objc_msgSend(v6, "setPhoneticName:");
  v4 = v6;
  if (self->_shield)
  {
    objc_msgSend(v6, "setShield:");
    v4 = v6;
  }
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_shieldType;
    *((_WORD *)v4 + 40) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_9:
      if ((flags & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 17) = self->_phoneticType;
  *((_WORD *)v4 + 40) |= 1u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 19) = self->_signType;
    *((_WORD *)v4 + 40) |= 4u;
  }
LABEL_11:
  if (self->_locale)
  {
    objc_msgSend(v6, "setLocale:");
    v4 = v6;
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
  __int16 flags;
  uint64_t v16;
  void *v17;
  PBUnknownFields *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEONameInfo readAll:](self, "readAll:", 0);
    v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v9;

    v11 = -[NSString copyWithZone:](self->_phoneticName, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v11;

    v13 = -[NSString copyWithZone:](self->_shield, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v13;

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_shieldType;
      *(_WORD *)(v5 + 80) |= 2u;
      flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_7:
        if ((flags & 4) == 0)
        {
LABEL_9:
          v16 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
          v17 = *(void **)(v5 + 24);
          *(_QWORD *)(v5 + 24) = v16;

          v18 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v18;
          goto LABEL_10;
        }
LABEL_8:
        *(_DWORD *)(v5 + 76) = self->_signType;
        *(_WORD *)(v5 + 80) |= 4u;
        goto LABEL_9;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 68) = self->_phoneticType;
    *(_WORD *)(v5 + 80) |= 1u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEONameInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *phoneticName;
  NSString *shield;
  __int16 flags;
  __int16 v9;
  NSString *locale;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEONameInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_25;
  }
  phoneticName = self->_phoneticName;
  if ((unint64_t)phoneticName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](phoneticName, "isEqual:"))
      goto LABEL_25;
  }
  shield = self->_shield;
  if ((unint64_t)shield | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](shield, "isEqual:"))
      goto LABEL_25;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 40);
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_shieldType != *((_DWORD *)v4 + 18))
      goto LABEL_25;
  }
  else if ((v9 & 2) != 0)
  {
LABEL_25:
    v11 = 0;
    goto LABEL_26;
  }
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_phoneticType != *((_DWORD *)v4 + 17))
      goto LABEL_25;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_25;
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_signType != *((_DWORD *)v4 + 19))
      goto LABEL_25;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_25;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 3))
    v11 = -[NSString isEqual:](locale, "isEqual:");
  else
    v11 = 1;
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  __int16 flags;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[GEONameInfo readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_phoneticName, "hash");
  v5 = -[NSString hash](self->_shield, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    v7 = 0;
    if ((flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v8 = 0;
    if ((flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_locale, "hash");
  }
  v7 = 2654435761 * self->_shieldType;
  if ((flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v8 = 2654435761 * self->_phoneticType;
  if ((flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v9 = 2654435761 * self->_signType;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_locale, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  __int16 v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  if (v6[4])
  {
    -[GEONameInfo setName:](self, "setName:");
    v4 = v6;
  }
  if (v4[5])
  {
    -[GEONameInfo setPhoneticName:](self, "setPhoneticName:");
    v4 = v6;
  }
  if (v4[6])
  {
    -[GEONameInfo setShield:](self, "setShield:");
    v4 = v6;
  }
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_shieldType = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_flags |= 2u;
    v5 = *((_WORD *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_phoneticType = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_flags |= 1u;
  if ((v4[10] & 4) != 0)
  {
LABEL_10:
    self->_signType = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_11:
  if (v4[3])
  {
    -[GEONameInfo setLocale:](self, "setLocale:");
    v4 = v6;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEONameInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_957);
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
  *(_WORD *)&self->_flags |= 0x108u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEONameInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
