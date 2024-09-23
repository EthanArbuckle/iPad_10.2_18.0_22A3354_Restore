@implementation GEORPScorecard

- (GEORPScorecard)init
{
  GEORPScorecard *v2;
  GEORPScorecard *v3;
  GEORPScorecard *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPScorecard;
  v2 = -[GEORPScorecard init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPScorecard)initWithData:(id)a3
{
  GEORPScorecard *v3;
  GEORPScorecard *v4;
  GEORPScorecard *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPScorecard;
  v3 = -[GEORPScorecard initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPScorecardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVersion_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasVersion
{
  -[GEORPScorecard _readVersion]((uint64_t)self);
  return self->_version != 0;
}

- (NSString)version
{
  -[GEORPScorecard _readVersion]((uint64_t)self);
  return self->_version;
}

- (void)setVersion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_version, a3);
}

- (BOOL)recommended
{
  return self->_recommended;
}

- (void)setRecommended:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  self->_recommended = a3;
}

- (void)setHasRecommended:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasRecommended
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readCategoryRatings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPScorecardReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryRatings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)categoryRatings
{
  -[GEORPScorecard _readCategoryRatings]((uint64_t)self);
  return self->_categoryRatings;
}

- (void)setCategoryRatings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *categoryRatings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  categoryRatings = self->_categoryRatings;
  self->_categoryRatings = v4;

}

- (void)clearCategoryRatings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_categoryRatings, "removeAllObjects");
}

- (void)addCategoryRatings:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPScorecard _readCategoryRatings]((uint64_t)self);
  -[GEORPScorecard _addNoFlagsCategoryRatings:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsCategoryRatings:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)categoryRatingsCount
{
  -[GEORPScorecard _readCategoryRatings]((uint64_t)self);
  return -[NSMutableArray count](self->_categoryRatings, "count");
}

- (id)categoryRatingsAtIndex:(unint64_t)a3
{
  -[GEORPScorecard _readCategoryRatings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_categoryRatings, "objectAtIndex:", a3);
}

+ (Class)categoryRatingsType
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
  v8.super_class = (Class)GEORPScorecard;
  -[GEORPScorecard description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPScorecard dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPScorecard _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("version"));

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("recommended"));

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = *(id *)(a1 + 16);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14, (_QWORD)v17);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("categoryRatings");
    else
      v15 = CFSTR("category_ratings");
    objc_msgSend(v4, "setObject:forKey:", v7, v15, (_QWORD)v17);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPScorecard _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPScorecard)initWithDictionary:(id)a3
{
  return (GEORPScorecard *)-[GEORPScorecard _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  GEORPCategoryRating *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setVersion:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recommended"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRecommended:", objc_msgSend(v8, "BOOLValue"));

      if (a3)
        v9 = CFSTR("categoryRatings");
      else
        v9 = CFSTR("category_ratings");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v21 = v10;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = [GEORPCategoryRating alloc];
                if ((a3 & 1) != 0)
                  v18 = -[GEORPCategoryRating initWithJSON:](v17, "initWithJSON:", v16);
                else
                  v18 = -[GEORPCategoryRating initWithDictionary:](v17, "initWithDictionary:", v16);
                v19 = (void *)v18;
                objc_msgSend(a1, "addCategoryRatings:", v18);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v13);
        }

        v10 = v21;
      }

    }
  }

  return a1;
}

- (GEORPScorecard)initWithJSON:(id)a3
{
  return (GEORPScorecard *)-[GEORPScorecard _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_371;
    else
      v8 = (int *)&readAll__nonRecursiveTag_372;
    GEORPScorecardReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPScorecardCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPScorecardIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPScorecardReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  if (self->_reader && (_GEORPScorecardIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPScorecard readAll:](self, "readAll:", 0);
    if (self->_version)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_categoryRatings;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

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
  -[GEORPScorecard readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_version)
    objc_msgSend(v8, "setVersion:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v8 + 44) = self->_recommended;
    *((_BYTE *)v8 + 48) |= 1u;
  }
  if (-[GEORPScorecard categoryRatingsCount](self, "categoryRatingsCount"))
  {
    objc_msgSend(v8, "clearCategoryRatings");
    v4 = -[GEORPScorecard categoryRatingsCount](self, "categoryRatingsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPScorecard categoryRatingsAtIndex:](self, "categoryRatingsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addCategoryRatings:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEORPScorecardReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPScorecard readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 44) = self->_recommended;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_categoryRatings;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v8);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend((id)v5, "addCategoryRatings:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *version;
  char v6;
  NSMutableArray *categoryRatings;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEORPScorecard readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  version = self->_version;
  if ((unint64_t)version | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](version, "isEqual:"))
      goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0)
    {
      if (self->_recommended)
      {
        if (*((_BYTE *)v4 + 44))
          goto LABEL_14;
      }
      else if (!*((_BYTE *)v4 + 44))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
    goto LABEL_8;
LABEL_14:
  categoryRatings = self->_categoryRatings;
  if ((unint64_t)categoryRatings | *((_QWORD *)v4 + 2))
    v6 = -[NSMutableArray isEqual:](categoryRatings, "isEqual:");
  else
    v6 = 1;
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  -[GEORPScorecard readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_version, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_recommended;
  else
    v4 = 0;
  return v4 ^ -[NSMutableArray hash](self->_categoryRatings, "hash") ^ v3;
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
    -[GEORPScorecard setVersion:](self, "setVersion:");
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_recommended = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 2);
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
        -[GEORPScorecard addCategoryRatings:](self, "addCategoryRatings:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_categoryRatings, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
