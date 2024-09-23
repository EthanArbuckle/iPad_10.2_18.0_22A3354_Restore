@implementation GEOLPRDefinedPlateType

- (GEOLPRDefinedPlateType)init
{
  GEOLPRDefinedPlateType *v2;
  GEOLPRDefinedPlateType *v3;
  GEOLPRDefinedPlateType *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRDefinedPlateType;
  v2 = -[GEOLPRDefinedPlateType init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRDefinedPlateType)initWithData:(id)a3
{
  GEOLPRDefinedPlateType *v3;
  GEOLPRDefinedPlateType *v4;
  GEOLPRDefinedPlateType *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRDefinedPlateType;
  v3 = -[GEOLPRDefinedPlateType initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readConditions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRDefinedPlateTypeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readConditions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)conditions
{
  -[GEOLPRDefinedPlateType _readConditions]((uint64_t)self);
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *conditions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  conditions = self->_conditions;
  self->_conditions = v4;

}

- (void)clearConditions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  -[NSMutableArray removeAllObjects](self->_conditions, "removeAllObjects");
}

- (void)addConditions:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRDefinedPlateType _readConditions]((uint64_t)self);
  -[GEOLPRDefinedPlateType _addNoFlagsConditions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (void)_addNoFlagsConditions:(uint64_t)a1
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

- (unint64_t)conditionsCount
{
  -[GEOLPRDefinedPlateType _readConditions]((uint64_t)self);
  return -[NSMutableArray count](self->_conditions, "count");
}

- (id)conditionsAtIndex:(unint64_t)a3
{
  -[GEOLPRDefinedPlateType _readConditions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_conditions, "objectAtIndex:", a3);
}

+ (Class)conditionsType
{
  return (Class)objc_opt_class();
}

- (void)_readDesc
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRDefinedPlateTypeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDesc_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDesc
{
  -[GEOLPRDefinedPlateType _readDesc]((uint64_t)self);
  return self->_desc != 0;
}

- (NSString)desc
{
  -[GEOLPRDefinedPlateType _readDesc]((uint64_t)self);
  return self->_desc;
}

- (void)setDesc:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_desc, a3);
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
  v8.super_class = (Class)GEOLPRDefinedPlateType;
  -[GEOLPRDefinedPlateType description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRDefinedPlateType dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRDefinedPlateType _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[2], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = a1[2];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("conditions"));
  }
  objc_msgSend(a1, "desc", (_QWORD)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("desc"));

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRDefinedPlateType _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLPRDefinedPlateType)initWithDictionary:(id)a3
{
  return (GEOLPRDefinedPlateType *)-[GEOLPRDefinedPlateType _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEOLPRDefinedPlateCondition *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("conditions"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v19 = v6;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = [GEOLPRDefinedPlateCondition alloc];
                if ((a3 & 1) != 0)
                  v14 = -[GEOLPRDefinedPlateCondition initWithJSON:](v13, "initWithJSON:", v12);
                else
                  v14 = -[GEOLPRDefinedPlateCondition initWithDictionary:](v13, "initWithDictionary:", v12);
                v15 = (void *)v14;
                objc_msgSend(a1, "addConditions:", v14);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v9);
        }

        v6 = v19;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("desc"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setDesc:", v17);

      }
    }
  }

  return a1;
}

- (GEOLPRDefinedPlateType)initWithJSON:(id)a3
{
  return (GEOLPRDefinedPlateType *)-[GEOLPRDefinedPlateType _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_93;
    else
      v8 = (int *)&readAll__nonRecursiveTag_94;
    GEOLPRDefinedPlateTypeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRDefinedPlateTypeCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRDefinedPlateTypeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRDefinedPlateTypeReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 7) == 0))
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
    -[GEOLPRDefinedPlateType readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_conditions;
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
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_desc)
      PBDataWriterWriteStringField();
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
  -[GEOLPRDefinedPlateType readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRDefinedPlateType conditionsCount](self, "conditionsCount"))
  {
    objc_msgSend(v8, "clearConditions");
    v4 = -[GEOLPRDefinedPlateType conditionsCount](self, "conditionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLPRDefinedPlateType conditionsAtIndex:](self, "conditionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addConditions:", v7);

      }
    }
  }
  if (self->_desc)
    objc_msgSend(v8, "setDesc:");

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
  uint64_t v13;
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
    if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLPRDefinedPlateTypeReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRDefinedPlateType readAll:](self, "readAll:", 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_conditions;
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
        objc_msgSend(v5, "addConditions:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_desc, "copyWithZone:", a3);
  v14 = (void *)v5[3];
  v5[3] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *conditions;
  NSString *desc;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRDefinedPlateType readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         conditions = self->_conditions,
         !((unint64_t)conditions | v4[2]))
     || -[NSMutableArray isEqual:](conditions, "isEqual:")))
  {
    desc = self->_desc;
    if ((unint64_t)desc | v4[3])
      v7 = -[NSString isEqual:](desc, "isEqual:");
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

  -[GEOLPRDefinedPlateType readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_conditions, "hash");
  return -[NSString hash](self->_desc, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
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
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4[2];
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
        -[GEOLPRDefinedPlateType addConditions:](self, "addConditions:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (v4[3])
    -[GEOLPRDefinedPlateType setDesc:](self, "setDesc:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
