@implementation GEOLPRLPRFillRule

- (GEOLPRLPRFillRule)init
{
  GEOLPRLPRFillRule *v2;
  GEOLPRLPRFillRule *v3;
  GEOLPRLPRFillRule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLPRFillRule;
  v2 = -[GEOLPRLPRFillRule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLPRFillRule)initWithData:(id)a3
{
  GEOLPRLPRFillRule *v3;
  GEOLPRLPRFillRule *v4;
  GEOLPRLPRFillRule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLPRFillRule;
  v3 = -[GEOLPRLPRFillRule initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLPRLPRFillRule;
  -[GEOLPRLPRFillRule dealloc](&v3, sel_dealloc);
}

- (void)_readPlateTypeIndexes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRFillRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlateTypeIndexes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)plateTypeIndexesCount
{
  -[GEOLPRLPRFillRule _readPlateTypeIndexes]((uint64_t)self);
  return self->_plateTypeIndexes.count;
}

- (unsigned)plateTypeIndexes
{
  -[GEOLPRLPRFillRule _readPlateTypeIndexes]((uint64_t)self);
  return self->_plateTypeIndexes.list;
}

- (void)clearPlateTypeIndexes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedUInt32Clear();
}

- (void)addPlateTypeIndexes:(unsigned int)a3
{
  -[GEOLPRLPRFillRule _readPlateTypeIndexes]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (unsigned)plateTypeIndexesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_plateTypeIndexes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOLPRLPRFillRule _readPlateTypeIndexes]((uint64_t)self);
  p_plateTypeIndexes = &self->_plateTypeIndexes;
  count = self->_plateTypeIndexes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_plateTypeIndexes->list[a3];
}

- (void)setPlateTypeIndexes:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedUInt32Set();
}

- (void)_readFromChar
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRFillRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFromChar_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFromChar
{
  -[GEOLPRLPRFillRule _readFromChar]((uint64_t)self);
  return self->_fromChar != 0;
}

- (GEOLPRTargetChar)fromChar
{
  -[GEOLPRLPRFillRule _readFromChar]((uint64_t)self);
  return self->_fromChar;
}

- (void)setFromChar:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_fromChar, a3);
}

- (void)_readToChar
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRFillRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readToChar_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasToChar
{
  -[GEOLPRLPRFillRule _readToChar]((uint64_t)self);
  return self->_toChar != 0;
}

- (GEOLPRTargetChar)toChar
{
  -[GEOLPRLPRFillRule _readToChar]((uint64_t)self);
  return self->_toChar;
}

- (void)setToChar:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_toChar, a3);
}

- (int)fillType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_fillType;
  else
    return 1;
}

- (void)setFillType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_fillType = a3;
}

- (void)setHasFillType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasFillType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)fillTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C05AD8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFillType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALPHABET_OR_NUMERIC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALPHABET")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NUMERIC")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
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
  v8.super_class = (Class)GEOLPRLPRFillRule;
  -[GEOLPRLPRFillRule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRLPRFillRule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLPRFillRule _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v12;
  void *v13;
  const __CFString *v14;
  unsigned int v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 24))
    {
      PBRepeatedUInt32NSArray();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("plateTypeIndexes");
      else
        v6 = CFSTR("plate_type_indexes");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
    objc_msgSend((id)a1, "fromChar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "jsonRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("fromChar");
      }
      else
      {
        objc_msgSend(v7, "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("from_char");
      }
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
    objc_msgSend((id)a1, "toChar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v11, "jsonRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("toChar");
      }
      else
      {
        objc_msgSend(v11, "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("to_char");
      }
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

    }
    if ((*(_BYTE *)(a1 + 80) & 1) != 0)
    {
      v15 = *(_DWORD *)(a1 + 76) - 1;
      if (v15 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 76));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E1C05AD8[v15];
      }
      if (a2)
        v17 = CFSTR("fillType");
      else
        v17 = CFSTR("fill_type");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

    }
    objc_msgSend((id)a1, "frLicensePlateStructure");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v18, "jsonRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("frLicensePlateStructure");
      }
      else
      {
        objc_msgSend(v18, "dictionaryRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("fr_license_plate_structure");
      }
      objc_msgSend(v4, "setObject:forKey:", v20, v21);

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
  return -[GEOLPRLPRFillRule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLPRFillRule)initWithDictionary:(id)a3
{
  return (GEOLPRLPRFillRule *)-[GEOLPRLPRFillRule _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOLPRTargetChar *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEOLPRTargetChar *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  GEOLPRLicensePlateStructure *v30;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_57;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_57;
  if (a3)
    v6 = CFSTR("plateTypeIndexes");
  else
    v6 = CFSTR("plate_type_indexes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addPlateTypeIndexes:", objc_msgSend(v13, "unsignedIntValue", (_QWORD)v34));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v10);
    }

  }
  if (a3)
    v14 = CFSTR("fromChar");
  else
    v14 = CFSTR("from_char");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14, (_QWORD)v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEOLPRTargetChar alloc];
    if ((a3 & 1) != 0)
      v17 = -[GEOLPRTargetChar initWithJSON:](v16, "initWithJSON:", v15);
    else
      v17 = -[GEOLPRTargetChar initWithDictionary:](v16, "initWithDictionary:", v15);
    v18 = (void *)v17;
    objc_msgSend(a1, "setFromChar:", v17);

  }
  if (a3)
    v19 = CFSTR("toChar");
  else
    v19 = CFSTR("to_char");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = [GEOLPRTargetChar alloc];
    if ((a3 & 1) != 0)
      v22 = -[GEOLPRTargetChar initWithJSON:](v21, "initWithJSON:", v20);
    else
      v22 = -[GEOLPRTargetChar initWithDictionary:](v21, "initWithDictionary:", v20);
    v23 = (void *)v22;
    objc_msgSend(a1, "setToChar:", v22);

  }
  if (a3)
    v24 = CFSTR("fillType");
  else
    v24 = CFSTR("fill_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v25;
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("ALPHABET_OR_NUMERIC")) & 1) != 0)
    {
      v27 = 1;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("ALPHABET")) & 1) != 0)
    {
      v27 = 2;
    }
    else if (objc_msgSend(v26, "isEqualToString:", CFSTR("NUMERIC")))
    {
      v27 = 3;
    }
    else
    {
      v27 = 1;
    }

    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = objc_msgSend(v25, "intValue");
LABEL_47:
    objc_msgSend(a1, "setFillType:", v27);
  }

  if (a3)
    v28 = CFSTR("frLicensePlateStructure");
  else
    v28 = CFSTR("fr_license_plate_structure");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOLPRLicensePlateStructure alloc];
    if ((a3 & 1) != 0)
      v31 = -[GEOLPRLicensePlateStructure initWithJSON:](v30, "initWithJSON:", v29);
    else
      v31 = -[GEOLPRLicensePlateStructure initWithDictionary:](v30, "initWithDictionary:", v29);
    v32 = (void *)v31;
    objc_msgSend(a1, "setFrLicensePlateStructure:", v31);

  }
LABEL_57:

  return a1;
}

- (GEOLPRLPRFillRule)initWithJSON:(id)a3
{
  return (GEOLPRLPRFillRule *)-[GEOLPRLPRFillRule _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_223;
    else
      v8 = (int *)&readAll__nonRecursiveTag_224;
    GEOLPRLPRFillRuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLPRTargetChar readAll:](self->_fromChar, "readAll:", 1);
    -[GEOLPRTargetChar readAll:](self->_toChar, "readAll:", 1);
    -[GEOLPRLicensePlateStructure readAll:](self->_frLicensePlateStructure, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLPRFillRuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLPRFillRuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  unint64_t v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOLPRLPRFillRuleIsDirty((uint64_t)self))
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
    goto LABEL_15;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRLPRFillRule readAll:](self, "readAll:", 0);
  v5 = v9;
  if (self->_plateTypeIndexes.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
      ++v6;
    }
    while (v6 < self->_plateTypeIndexes.count);
  }
  if (self->_fromChar)
  {
    PBDataWriterWriteSubmessage();
    v5 = v9;
  }
  if (self->_toChar)
  {
    PBDataWriterWriteSubmessage();
    v5 = v9;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v9;
  }
  if (self->_frLicensePlateStructure)
  {
    PBDataWriterWriteSubmessage();
LABEL_15:
    v5 = v9;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOLPRLPRFillRule readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRLPRFillRule plateTypeIndexesCount](self, "plateTypeIndexesCount"))
  {
    objc_msgSend(v8, "clearPlateTypeIndexes");
    v4 = -[GEOLPRLPRFillRule plateTypeIndexesCount](self, "plateTypeIndexesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addPlateTypeIndexes:", -[GEOLPRLPRFillRule plateTypeIndexesAtIndex:](self, "plateTypeIndexesAtIndex:", i));
    }
  }
  if (self->_fromChar)
    objc_msgSend(v8, "setFromChar:");
  v7 = v8;
  if (self->_toChar)
  {
    objc_msgSend(v8, "setToChar:");
    v7 = v8;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v7 + 19) = self->_fillType;
    *((_BYTE *)v7 + 80) |= 1u;
  }
  if (self->_frLicensePlateStructure)
  {
    objc_msgSend(v8, "setFrLicensePlateStructure:");
    v7 = v8;
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
  id v11;
  void *v12;
  id v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLPRLPRFillRuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRLPRFillRule readAll:](self, "readAll:", 0);
  PBRepeatedUInt32Copy();
  v9 = -[GEOLPRTargetChar copyWithZone:](self->_fromChar, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEOLPRTargetChar copyWithZone:](self->_toChar, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_fillType;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v13 = -[GEOLPRLicensePlateStructure copyWithZone:](self->_frLicensePlateStructure, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLPRTargetChar *fromChar;
  GEOLPRTargetChar *toChar;
  GEOLPRLicensePlateStructure *frLicensePlateStructure;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOLPRLPRFillRule readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_14;
  fromChar = self->_fromChar;
  if ((unint64_t)fromChar | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLPRTargetChar isEqual:](fromChar, "isEqual:"))
      goto LABEL_14;
  }
  toChar = self->_toChar;
  if ((unint64_t)toChar | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLPRTargetChar isEqual:](toChar, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_fillType != *((_DWORD *)v4 + 19))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  frLicensePlateStructure = self->_frLicensePlateStructure;
  if ((unint64_t)frLicensePlateStructure | *((_QWORD *)v4 + 5))
    v8 = -[GEOLPRLicensePlateStructure isEqual:](frLicensePlateStructure, "isEqual:");
  else
    v8 = 1;
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  -[GEOLPRLPRFillRule readAll:](self, "readAll:", 1);
  v3 = PBRepeatedUInt32Hash();
  v4 = -[GEOLPRTargetChar hash](self->_fromChar, "hash");
  v5 = -[GEOLPRTargetChar hash](self->_toChar, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_fillType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[GEOLPRLicensePlateStructure hash](self->_frLicensePlateStructure, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  GEOLPRTargetChar *fromChar;
  _QWORD *v8;
  uint64_t v9;
  GEOLPRTargetChar *toChar;
  uint64_t v11;
  GEOLPRLicensePlateStructure *frLicensePlateStructure;
  uint64_t v13;
  _QWORD *v14;

  v14 = a3;
  objc_msgSend(v14, "readAll:", 0);
  v4 = objc_msgSend(v14, "plateTypeIndexesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOLPRLPRFillRule addPlateTypeIndexes:](self, "addPlateTypeIndexes:", objc_msgSend(v14, "plateTypeIndexesAtIndex:", i));
  }
  fromChar = self->_fromChar;
  v8 = v14;
  v9 = v14[6];
  if (fromChar)
  {
    if (!v9)
      goto LABEL_10;
    -[GEOLPRTargetChar mergeFrom:](fromChar, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_10;
    -[GEOLPRLPRFillRule setFromChar:](self, "setFromChar:");
  }
  v8 = v14;
LABEL_10:
  toChar = self->_toChar;
  v11 = v8[7];
  if (toChar)
  {
    if (!v11)
      goto LABEL_16;
    -[GEOLPRTargetChar mergeFrom:](toChar, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_16;
    -[GEOLPRLPRFillRule setToChar:](self, "setToChar:");
  }
  v8 = v14;
LABEL_16:
  if ((v8[10] & 1) != 0)
  {
    self->_fillType = *((_DWORD *)v8 + 19);
    *(_BYTE *)&self->_flags |= 1u;
  }
  frLicensePlateStructure = self->_frLicensePlateStructure;
  v13 = v8[5];
  if (frLicensePlateStructure)
  {
    if (v13)
    {
      -[GEOLPRLicensePlateStructure mergeFrom:](frLicensePlateStructure, "mergeFrom:");
LABEL_23:
      v8 = v14;
    }
  }
  else if (v13)
  {
    -[GEOLPRLPRFillRule setFrLicensePlateStructure:](self, "setFrLicensePlateStructure:");
    goto LABEL_23;
  }

}

- (void)_readFrLicensePlateStructure
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRFillRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFrLicensePlateStructure_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFrLicensePlateStructure
{
  -[GEOLPRLPRFillRule _readFrLicensePlateStructure]((uint64_t)self);
  return self->_frLicensePlateStructure != 0;
}

- (GEOLPRLicensePlateStructure)frLicensePlateStructure
{
  -[GEOLPRLPRFillRule _readFrLicensePlateStructure]((uint64_t)self);
  return self->_frLicensePlateStructure;
}

- (void)setFrLicensePlateStructure:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_frLicensePlateStructure, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toChar, 0);
  objc_storeStrong((id *)&self->_fromChar, 0);
  objc_storeStrong((id *)&self->_frLicensePlateStructure, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
