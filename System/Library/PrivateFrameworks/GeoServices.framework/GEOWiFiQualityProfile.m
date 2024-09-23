@implementation GEOWiFiQualityProfile

- (GEOWiFiQualityProfile)init
{
  GEOWiFiQualityProfile *v2;
  GEOWiFiQualityProfile *v3;
  GEOWiFiQualityProfile *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiQualityProfile;
  v2 = -[GEOWiFiQualityProfile init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiQualityProfile)initWithData:(id)a3
{
  GEOWiFiQualityProfile *v3;
  GEOWiFiQualityProfile *v4;
  GEOWiFiQualityProfile *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiQualityProfile;
  v3 = -[GEOWiFiQualityProfile initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readHours
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
        GEOWiFiQualityProfileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHours_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasHours
{
  -[GEOWiFiQualityProfile _readHours]((uint64_t)self);
  return self->_hours != 0;
}

- (GEOWiFiQualityHours)hours
{
  -[GEOWiFiQualityProfile _readHours]((uint64_t)self);
  return self->_hours;
}

- (void)setHours:(id)a3
{
  *(_BYTE *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_hours, a3);
}

- (void)_readQualities
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
        GEOWiFiQualityProfileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQualities_tags_412);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)qualities
{
  -[GEOWiFiQualityProfile _readQualities]((uint64_t)self);
  return self->_qualities;
}

- (void)setQualities:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *qualities;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  qualities = self->_qualities;
  self->_qualities = v4;

}

- (void)clearQualities
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  -[NSMutableArray removeAllObjects](self->_qualities, "removeAllObjects");
}

- (void)addQualities:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWiFiQualityProfile _readQualities]((uint64_t)self);
  -[GEOWiFiQualityProfile _addNoFlagsQualities:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (void)_addNoFlagsQualities:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)qualitiesCount
{
  -[GEOWiFiQualityProfile _readQualities]((uint64_t)self);
  return -[NSMutableArray count](self->_qualities, "count");
}

- (id)qualitiesAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityProfile _readQualities]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_qualities, "objectAtIndex:", a3);
}

+ (Class)qualitiesType
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
  v8.super_class = (Class)GEOWiFiQualityProfile;
  -[GEOWiFiQualityProfile description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiQualityProfile dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiQualityProfile _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hours");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("hours"));

  }
  if (objc_msgSend(a1[3], "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = a1[3];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15, (_QWORD)v17);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("qualities"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiQualityProfile _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOWiFiQualityProfile)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityProfile *)-[GEOWiFiQualityProfile _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOWiFiQualityHours *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  GEOWiFiQualityIndex *v17;
  uint64_t v18;
  void *v19;
  id v21;
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
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hours"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOWiFiQualityHours alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOWiFiQualityHours initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOWiFiQualityHours initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setHours:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("qualities"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v5;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
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
                v17 = [GEOWiFiQualityIndex alloc];
                if ((a3 & 1) != 0)
                  v18 = -[GEOWiFiQualityIndex initWithJSON:](v17, "initWithJSON:", v16);
                else
                  v18 = -[GEOWiFiQualityIndex initWithDictionary:](v17, "initWithDictionary:", v16);
                v19 = (void *)v18;
                objc_msgSend(a1, "addQualities:", v18);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v13);
        }

        v5 = v21;
      }

    }
  }

  return a1;
}

- (GEOWiFiQualityProfile)initWithJSON:(id)a3
{
  return (GEOWiFiQualityProfile *)-[GEOWiFiQualityProfile _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_417_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_418_0;
    GEOWiFiQualityProfileReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOWiFiQualityProfileCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityProfileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityProfileReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOWiFiQualityProfileIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOWiFiQualityProfile readAll:](self, "readAll:", 0);
    if (self->_hours)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_qualities;
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
  -[GEOWiFiQualityProfile readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_hours)
    objc_msgSend(v8, "setHours:");
  if (-[GEOWiFiQualityProfile qualitiesCount](self, "qualitiesCount"))
  {
    objc_msgSend(v8, "clearQualities");
    v4 = -[GEOWiFiQualityProfile qualitiesCount](self, "qualitiesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOWiFiQualityProfile qualitiesAtIndex:](self, "qualitiesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addQualities:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
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
      GEOWiFiQualityProfileReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWiFiQualityProfile readAll:](self, "readAll:", 0);
  v8 = -[GEOWiFiQualityHours copyWithZone:](self->_hours, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_qualities;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend(v5, "addQualities:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOWiFiQualityHours *hours;
  NSMutableArray *qualities;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOWiFiQualityProfile readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         hours = self->_hours,
         !((unint64_t)hours | v4[2]))
     || -[GEOWiFiQualityHours isEqual:](hours, "isEqual:")))
  {
    qualities = self->_qualities;
    if ((unint64_t)qualities | v4[3])
      v7 = -[NSMutableArray isEqual:](qualities, "isEqual:");
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
  unint64_t v3;

  -[GEOWiFiQualityProfile readAll:](self, "readAll:", 1);
  v3 = -[GEOWiFiQualityHours hash](self->_hours, "hash");
  return -[NSMutableArray hash](self->_qualities, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEOWiFiQualityHours *hours;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  hours = self->_hours;
  v6 = v4[2];
  if (hours)
  {
    if (v6)
      -[GEOWiFiQualityHours mergeFrom:](hours, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOWiFiQualityProfile setHours:](self, "setHours:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4[3];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[GEOWiFiQualityProfile addQualities:](self, "addQualities:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualities, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
