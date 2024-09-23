@implementation GEOLPRLPRPickupRule

- (GEOLPRLPRPickupRule)init
{
  GEOLPRLPRPickupRule *v2;
  GEOLPRLPRPickupRule *v3;
  GEOLPRLPRPickupRule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLPRPickupRule;
  v2 = -[GEOLPRLPRPickupRule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLPRPickupRule)initWithData:(id)a3
{
  GEOLPRLPRPickupRule *v3;
  GEOLPRLPRPickupRule *v4;
  GEOLPRLPRPickupRule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLPRPickupRule;
  v3 = -[GEOLPRLPRPickupRule initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOLPRLPRPickupRule;
  -[GEOLPRLPRPickupRule dealloc](&v3, sel_dealloc);
}

- (void)_readPlateTypeIndexes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRPickupRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlateTypeIndexes_tags_329);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)plateTypeIndexesCount
{
  -[GEOLPRLPRPickupRule _readPlateTypeIndexes]((uint64_t)self);
  return self->_plateTypeIndexes.count;
}

- (unsigned)plateTypeIndexes
{
  -[GEOLPRLPRPickupRule _readPlateTypeIndexes]((uint64_t)self);
  return self->_plateTypeIndexes.list;
}

- (void)clearPlateTypeIndexes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt32Clear();
}

- (void)addPlateTypeIndexes:(unsigned int)a3
{
  -[GEOLPRLPRPickupRule _readPlateTypeIndexes]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (unsigned)plateTypeIndexesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_plateTypeIndexes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOLPRLPRPickupRule _readPlateTypeIndexes]((uint64_t)self);
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
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt32Set();
}

- (void)_readPickupChars
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRPickupRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPickupChars_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)pickupChars
{
  -[GEOLPRLPRPickupRule _readPickupChars]((uint64_t)self);
  return self->_pickupChars;
}

- (void)setPickupChars:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *pickupChars;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  pickupChars = self->_pickupChars;
  self->_pickupChars = v4;

}

- (void)clearPickupChars
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_pickupChars, "removeAllObjects");
}

- (void)addPickupChar:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLPRPickupRule _readPickupChars]((uint64_t)self);
  -[GEOLPRLPRPickupRule _addNoFlagsPickupChar:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsPickupChar:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)pickupCharsCount
{
  -[GEOLPRLPRPickupRule _readPickupChars]((uint64_t)self);
  return -[NSMutableArray count](self->_pickupChars, "count");
}

- (id)pickupCharAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRPickupRule _readPickupChars]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_pickupChars, "objectAtIndex:", a3);
}

+ (Class)pickupCharType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOLPRLPRPickupRule;
  -[GEOLPRLPRPickupRule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRLPRPickupRule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLPRPickupRule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
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
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation", (_QWORD)v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14, (_QWORD)v21);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("pickupChar");
    else
      v15 = CFSTR("pickup_char");
    objc_msgSend(v4, "setObject:forKey:", v7, v15, (_QWORD)v21);

  }
  objc_msgSend((id)a1, "prLicensePlateStructure");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("prLicensePlateStructure");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("pr_license_plate_structure");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRLPRPickupRule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLPRPickupRule)initWithDictionary:(id)a3
{
  return (GEOLPRLPRPickupRule *)-[GEOLPRLPRPickupRule _initWithDictionary:isJSON:](self, a3, 0);
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  GEOLPRTargetChar *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOLPRLicensePlateStructure *v27;
  uint64_t v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("plateTypeIndexes");
      else
        v6 = CFSTR("plate_type_indexes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v31 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v37 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addPlateTypeIndexes:", objc_msgSend(v13, "unsignedIntValue"));
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          }
          while (v10);
        }

        v5 = v31;
      }

      if (a3)
        v14 = CFSTR("pickupChar");
      else
        v14 = CFSTR("pickup_char");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v33 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = [GEOLPRTargetChar alloc];
                if ((a3 & 1) != 0)
                  v23 = -[GEOLPRTargetChar initWithJSON:](v22, "initWithJSON:", v21);
                else
                  v23 = -[GEOLPRTargetChar initWithDictionary:](v22, "initWithDictionary:", v21);
                v24 = (void *)v23;
                objc_msgSend(a1, "addPickupChar:", v23);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v18);
        }

        v5 = v31;
      }

      if (a3)
        v25 = CFSTR("prLicensePlateStructure");
      else
        v25 = CFSTR("pr_license_plate_structure");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = [GEOLPRLicensePlateStructure alloc];
        if ((a3 & 1) != 0)
          v28 = -[GEOLPRLicensePlateStructure initWithJSON:](v27, "initWithJSON:", v26);
        else
          v28 = -[GEOLPRLicensePlateStructure initWithDictionary:](v27, "initWithDictionary:", v26);
        v29 = (void *)v28;
        objc_msgSend(a1, "setPrLicensePlateStructure:", v28);

      }
    }
  }

  return a1;
}

- (GEOLPRLPRPickupRule)initWithJSON:(id)a3
{
  return (GEOLPRLPRPickupRule *)-[GEOLPRLPRPickupRule _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_338;
    else
      v8 = (int *)&readAll__nonRecursiveTag_339;
    GEOLPRLPRPickupRuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRLPRPickupRuleCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLPRPickupRuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLPRPickupRuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOLPRLPRPickupRuleIsDirty((uint64_t)self))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRLPRPickupRule readAll:](self, "readAll:", 0);
    if (self->_plateTypeIndexes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_plateTypeIndexes.count);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_pickupChars;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    if (self->_prLicensePlateStructure)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  void *v10;
  id *v11;

  v11 = (id *)a3;
  -[GEOLPRLPRPickupRule readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 14) = self->_readerMarkPos;
  *((_DWORD *)v11 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRLPRPickupRule plateTypeIndexesCount](self, "plateTypeIndexesCount"))
  {
    objc_msgSend(v11, "clearPlateTypeIndexes");
    v4 = -[GEOLPRLPRPickupRule plateTypeIndexesCount](self, "plateTypeIndexesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v11, "addPlateTypeIndexes:", -[GEOLPRLPRPickupRule plateTypeIndexesAtIndex:](self, "plateTypeIndexesAtIndex:", i));
    }
  }
  if (-[GEOLPRLPRPickupRule pickupCharsCount](self, "pickupCharsCount"))
  {
    objc_msgSend(v11, "clearPickupChars");
    v7 = -[GEOLPRLPRPickupRule pickupCharsCount](self, "pickupCharsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEOLPRLPRPickupRule pickupCharAtIndex:](self, "pickupCharAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addPickupChar:", v10);

      }
    }
  }
  if (self->_prLicensePlateStructure)
    objc_msgSend(v11, "setPrLicensePlateStructure:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLPRLPRPickupRuleReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRLPRPickupRule readAll:](self, "readAll:", 0);
  PBRepeatedUInt32Copy();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_pickupChars;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend(v5, "addPickupChar:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = -[GEOLPRLicensePlateStructure copyWithZone:](self->_prLicensePlateStructure, "copyWithZone:", a3);
  v14 = (void *)v5[6];
  v5[6] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *pickupChars;
  GEOLPRLicensePlateStructure *prLicensePlateStructure;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOLPRLPRPickupRule readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedUInt32IsEqual())
    && ((pickupChars = self->_pickupChars, !((unint64_t)pickupChars | v4[5]))
     || -[NSMutableArray isEqual:](pickupChars, "isEqual:")))
  {
    prLicensePlateStructure = self->_prLicensePlateStructure;
    if ((unint64_t)prLicensePlateStructure | v4[6])
      v7 = -[GEOLPRLicensePlateStructure isEqual:](prLicensePlateStructure, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOLPRLPRPickupRule readAll:](self, "readAll:", 1);
  v3 = PBRepeatedUInt32Hash();
  v4 = -[NSMutableArray hash](self->_pickupChars, "hash") ^ v3;
  return v4 ^ -[GEOLPRLicensePlateStructure hash](self->_prLicensePlateStructure, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  GEOLPRLicensePlateStructure *prLicensePlateStructure;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "plateTypeIndexesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEOLPRLPRPickupRule addPlateTypeIndexes:](self, "addPlateTypeIndexes:", objc_msgSend(v4, "plateTypeIndexesAtIndex:", i));
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v4[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[GEOLPRLPRPickupRule addPickupChar:](self, "addPickupChar:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  prLicensePlateStructure = self->_prLicensePlateStructure;
  v14 = v4[6];
  if (prLicensePlateStructure)
  {
    if (v14)
      -[GEOLPRLicensePlateStructure mergeFrom:](prLicensePlateStructure, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEOLPRLPRPickupRule setPrLicensePlateStructure:](self, "setPrLicensePlateStructure:");
  }

}

- (void)_readPrLicensePlateStructure
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRPickupRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrLicensePlateStructure_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPrLicensePlateStructure
{
  -[GEOLPRLPRPickupRule _readPrLicensePlateStructure]((uint64_t)self);
  return self->_prLicensePlateStructure != 0;
}

- (GEOLPRLicensePlateStructure)prLicensePlateStructure
{
  -[GEOLPRLPRPickupRule _readPrLicensePlateStructure]((uint64_t)self);
  return self->_prLicensePlateStructure;
}

- (void)setPrLicensePlateStructure:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_prLicensePlateStructure, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prLicensePlateStructure, 0);
  objc_storeStrong((id *)&self->_pickupChars, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
