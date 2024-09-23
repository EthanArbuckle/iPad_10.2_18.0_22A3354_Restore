@implementation GEOCollectionDetails

- (GEOCollectionDetails)init
{
  GEOCollectionDetails *v2;
  GEOCollectionDetails *v3;
  GEOCollectionDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCollectionDetails;
  v2 = -[GEOCollectionDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCollectionDetails)initWithData:(id)a3
{
  GEOCollectionDetails *v3;
  GEOCollectionDetails *v4;
  GEOCollectionDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCollectionDetails;
  v3 = -[GEOCollectionDetails initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCollectionDetails;
  -[GEOCollectionDetails dealloc](&v3, sel_dealloc);
}

- (void)_readCollectionIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCollectionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionIds_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)collectionIdsCount
{
  -[GEOCollectionDetails _readCollectionIds]((uint64_t)self);
  return self->_collectionIds.count;
}

- (unint64_t)collectionIds
{
  -[GEOCollectionDetails _readCollectionIds]((uint64_t)self);
  return self->_collectionIds.list;
}

- (void)clearCollectionIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt64Clear();
}

- (void)addCollectionId:(unint64_t)a3
{
  -[GEOCollectionDetails _readCollectionIds]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (unint64_t)collectionIdAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_collectionIds;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCollectionDetails _readCollectionIds]((uint64_t)self);
  p_collectionIds = &self->_collectionIds;
  count = self->_collectionIds.count;
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
  return p_collectionIds->list[a3];
}

- (void)setCollectionIds:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt64Set();
}

- (void)_readCollectionCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCollectionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionCategory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCollectionCategory
{
  -[GEOCollectionDetails _readCollectionCategory]((uint64_t)self);
  return self->_collectionCategory != 0;
}

- (NSString)collectionCategory
{
  -[GEOCollectionDetails _readCollectionCategory]((uint64_t)self);
  return self->_collectionCategory;
}

- (void)setCollectionCategory:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_collectionCategory, a3);
}

- (unint64_t)targetId
{
  return self->_targetId;
}

- (void)setTargetId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_targetId = a3;
}

- (void)setHasTargetId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasTargetId
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)currentlySaved
{
  return self->_currentlySaved;
}

- (void)setCurrentlySaved:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_currentlySaved = a3;
}

- (void)setHasCurrentlySaved:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCurrentlySaved
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
  v8.super_class = (Class)GEOCollectionDetails;
  -[GEOCollectionDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCollectionDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCollectionDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  char v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 24))
    {
      PBRepeatedUInt64NSArray();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("collectionId");
      else
        v6 = CFSTR("collection_id");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
    objc_msgSend((id)a1, "collectionCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("collectionCategory");
      else
        v8 = CFSTR("collection_category");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    v9 = *(_BYTE *)(a1 + 72);
    if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("targetId");
      else
        v11 = CFSTR("target_id");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

      v9 = *(_BYTE *)(a1 + 72);
    }
    if ((v9 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v13 = CFSTR("currentlySaved");
      else
        v13 = CFSTR("currently_saved");
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

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
  return -[GEOCollectionDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCollectionDetails)initWithDictionary:(id)a3
{
  return (GEOCollectionDetails *)-[GEOCollectionDetails _initWithDictionary:isJSON:](self, a3, 0);
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
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
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
      if (a3)
        v6 = CFSTR("collectionId");
      else
        v6 = CFSTR("collection_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addCollectionId:", objc_msgSend(v13, "unsignedLongLongValue", (_QWORD)v22));
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v14 = CFSTR("collectionCategory");
      else
        v14 = CFSTR("collection_category");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14, (_QWORD)v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setCollectionCategory:", v16);

      }
      if (a3)
        v17 = CFSTR("targetId");
      else
        v17 = CFSTR("target_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTargetId:", objc_msgSend(v18, "unsignedLongLongValue"));

      if (a3)
        v19 = CFSTR("currentlySaved");
      else
        v19 = CFSTR("currently_saved");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCurrentlySaved:", objc_msgSend(v20, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOCollectionDetails)initWithJSON:(id)a3
{
  return (GEOCollectionDetails *)-[GEOCollectionDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_404;
    else
      v8 = (int *)&readAll__nonRecursiveTag_405;
    GEOCollectionDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCollectionDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCollectionDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  unint64_t v6;
  char flags;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0x1C) == 0)
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
      goto LABEL_13;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCollectionDetails readAll:](self, "readAll:", 0);
  v5 = v10;
  if (self->_collectionIds.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v5 = v10;
      ++v6;
    }
    while (v6 < self->_collectionIds.count);
  }
  if (self->_collectionCategory)
  {
    PBDataWriterWriteStringField();
    v5 = v10;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = v10;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
LABEL_13:
    v5 = v10;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  char flags;
  id *v8;

  v8 = (id *)a3;
  -[GEOCollectionDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOCollectionDetails collectionIdsCount](self, "collectionIdsCount"))
  {
    objc_msgSend(v8, "clearCollectionIds");
    v4 = -[GEOCollectionDetails collectionIdsCount](self, "collectionIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addCollectionId:", -[GEOCollectionDetails collectionIdAtIndex:](self, "collectionIdAtIndex:", i));
    }
  }
  if (self->_collectionCategory)
    objc_msgSend(v8, "setCollectionCategory:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v8[6] = (id)self->_targetId;
    *((_BYTE *)v8 + 72) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v8 + 68) = self->_currentlySaved;
    *((_BYTE *)v8 + 72) |= 2u;
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
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOCollectionDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCollectionDetails readAll:](self, "readAll:", 0);
  PBRepeatedUInt64Copy();
  v9 = -[NSString copyWithZone:](self->_collectionCategory, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_targetId;
    *(_BYTE *)(v5 + 72) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 68) = self->_currentlySaved;
    *(_BYTE *)(v5 + 72) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *collectionCategory;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEOCollectionDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_12;
  collectionCategory = self->_collectionCategory;
  if ((unint64_t)collectionCategory | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](collectionCategory, "isEqual:"))
      goto LABEL_12;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_targetId != *((_QWORD *)v4 + 6))
      goto LABEL_12;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_12;
  }
  v6 = (*((_BYTE *)v4 + 72) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0)
    {
LABEL_12:
      v6 = 0;
      goto LABEL_13;
    }
    if (self->_currentlySaved)
    {
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_12;
    }
    else if (*((_BYTE *)v4 + 68))
    {
      goto LABEL_12;
    }
    v6 = 1;
  }
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  -[GEOCollectionDetails readAll:](self, "readAll:", 1);
  v3 = PBRepeatedUInt64Hash();
  v4 = -[NSString hash](self->_collectionCategory, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761u * self->_targetId;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_currentlySaved;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _QWORD *v7;
  char v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = objc_msgSend(v9, "collectionIdsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOCollectionDetails addCollectionId:](self, "addCollectionId:", objc_msgSend(v9, "collectionIdAtIndex:", i));
  }
  v7 = v9;
  if (v9[5])
  {
    -[GEOCollectionDetails setCollectionCategory:](self, "setCollectionCategory:");
    v7 = v9;
  }
  v8 = *((_BYTE *)v7 + 72);
  if ((v8 & 1) != 0)
  {
    self->_targetId = v7[6];
    *(_BYTE *)&self->_flags |= 1u;
    v8 = *((_BYTE *)v7 + 72);
  }
  if ((v8 & 2) != 0)
  {
    self->_currentlySaved = *((_BYTE *)v7 + 68);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionCategory, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
