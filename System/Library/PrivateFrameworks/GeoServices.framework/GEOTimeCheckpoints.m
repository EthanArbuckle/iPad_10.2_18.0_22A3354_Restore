@implementation GEOTimeCheckpoints

- (GEOTimeCheckpoints)init
{
  GEOTimeCheckpoints *v2;
  GEOTimeCheckpoints *v3;
  GEOTimeCheckpoints *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTimeCheckpoints;
  v2 = -[GEOTimeCheckpoints init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTimeCheckpoints)initWithData:(id)a3
{
  GEOTimeCheckpoints *v3;
  GEOTimeCheckpoints *v4;
  GEOTimeCheckpoints *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTimeCheckpoints;
  v3 = -[GEOTimeCheckpoints initWithData:](&v7, sel_initWithData_, a3);
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTimeCheckpoints;
  -[GEOTimeCheckpoints dealloc](&v3, sel_dealloc);
}

- (void)_readDistToNextCheckpoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTimeCheckpointsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDistToNextCheckpoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)distToNextCheckpointsCount
{
  -[GEOTimeCheckpoints _readDistToNextCheckpoints]((uint64_t)self);
  return self->_distToNextCheckpoints.count;
}

- (unsigned)distToNextCheckpoints
{
  -[GEOTimeCheckpoints _readDistToNextCheckpoints]((uint64_t)self);
  return self->_distToNextCheckpoints.list;
}

- (void)clearDistToNextCheckpoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt32Clear();
}

- (void)addDistToNextCheckpoint:(unsigned int)a3
{
  -[GEOTimeCheckpoints _readDistToNextCheckpoints]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (unsigned)distToNextCheckpointAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_distToNextCheckpoints;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTimeCheckpoints _readDistToNextCheckpoints]((uint64_t)self);
  p_distToNextCheckpoints = &self->_distToNextCheckpoints;
  count = self->_distToNextCheckpoints.count;
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
  return p_distToNextCheckpoints->list[a3];
}

- (void)setDistToNextCheckpoints:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt32Set();
}

- (void)_readTimeToNextCheckpoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTimeCheckpointsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeToNextCheckpoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)timeToNextCheckpointsCount
{
  -[GEOTimeCheckpoints _readTimeToNextCheckpoints]((uint64_t)self);
  return self->_timeToNextCheckpoints.count;
}

- (unsigned)timeToNextCheckpoints
{
  -[GEOTimeCheckpoints _readTimeToNextCheckpoints]((uint64_t)self);
  return self->_timeToNextCheckpoints.list;
}

- (void)clearTimeToNextCheckpoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt32Clear();
}

- (void)addTimeToNextCheckpoint:(unsigned int)a3
{
  -[GEOTimeCheckpoints _readTimeToNextCheckpoints]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (unsigned)timeToNextCheckpointAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_timeToNextCheckpoints;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTimeCheckpoints _readTimeToNextCheckpoints]((uint64_t)self);
  p_timeToNextCheckpoints = &self->_timeToNextCheckpoints;
  count = self->_timeToNextCheckpoints.count;
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
  return p_timeToNextCheckpoints->list[a3];
}

- (void)setTimeToNextCheckpoints:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt32Set();
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
  v8.super_class = (Class)GEOTimeCheckpoints;
  -[GEOTimeCheckpoints description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTimeCheckpoints dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTimeCheckpoints _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[4])
  {
    PBRepeatedUInt32NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("distToNextCheckpoint"));

  }
  if (a1[7])
  {
    PBRepeatedUInt32NSArray();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("timeToNextCheckpoint"));

  }
  v7 = (void *)a1[2];
  if (v7)
  {
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __48__GEOTimeCheckpoints__dictionaryRepresentation___block_invoke;
      v14[3] = &unk_1E1C00600;
      v11 = v10;
      v15 = v11;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);
      v12 = v11;

      v9 = v12;
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTimeCheckpoints _dictionaryRepresentation:](self, 1);
}

void __48__GEOTimeCheckpoints__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTimeCheckpoints)initWithDictionary:(id)a3
{
  return (GEOTimeCheckpoints *)-[GEOTimeCheckpoints _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("distToNextCheckpoint"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v24;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v24 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addDistToNextCheckpoint:", objc_msgSend(v10, "unsignedIntValue"));
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          }
          while (v7);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeToNextCheckpoint"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addTimeToNextCheckpoint:", objc_msgSend(v17, "unsignedIntValue", (_QWORD)v19));
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v14);
        }

      }
    }
  }

  return a1;
}

- (GEOTimeCheckpoints)initWithJSON:(id)a3
{
  return (GEOTimeCheckpoints *)-[GEOTimeCheckpoints _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_6237;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6238;
    GEOTimeCheckpointsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTimeCheckpointsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTimeCheckpointsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTimeCheckpoints readAll:](self, "readAll:", 0);
    if (self->_distToNextCheckpoints.count)
    {
      PBDataWriterPlaceMark();
      if (self->_distToNextCheckpoints.count)
      {
        v6 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v6;
        }
        while (v6 < self->_distToNextCheckpoints.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_timeToNextCheckpoints.count)
    {
      PBDataWriterPlaceMark();
      if (self->_timeToNextCheckpoints.count)
      {
        v7 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v7;
        }
        while (v7 < self->_timeToNextCheckpoints.count);
      }
      PBDataWriterRecallMark();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
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
  id *v10;

  v10 = (id *)a3;
  -[GEOTimeCheckpoints readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 18) = self->_readerMarkPos;
  *((_DWORD *)v10 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTimeCheckpoints distToNextCheckpointsCount](self, "distToNextCheckpointsCount"))
  {
    objc_msgSend(v10, "clearDistToNextCheckpoints");
    v4 = -[GEOTimeCheckpoints distToNextCheckpointsCount](self, "distToNextCheckpointsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v10, "addDistToNextCheckpoint:", -[GEOTimeCheckpoints distToNextCheckpointAtIndex:](self, "distToNextCheckpointAtIndex:", i));
    }
  }
  if (-[GEOTimeCheckpoints timeToNextCheckpointsCount](self, "timeToNextCheckpointsCount"))
  {
    objc_msgSend(v10, "clearTimeToNextCheckpoints");
    v7 = -[GEOTimeCheckpoints timeToNextCheckpointsCount](self, "timeToNextCheckpointsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v10, "addTimeToNextCheckpoint:", -[GEOTimeCheckpoints timeToNextCheckpointAtIndex:](self, "timeToNextCheckpointAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  PBDataReader *reader;
  PBDataReader *v6;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v6 = reader;
  objc_sync_enter(v6);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTimeCheckpoints readAll:](self, "readAll:", 0);
    PBRepeatedUInt32Copy();
    PBRepeatedUInt32Copy();
    objc_storeStrong(v4 + 2, self->_unknownFields);
    return v4;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOTimeCheckpointsReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOTimeCheckpoints readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedUInt32IsEqual()))
  {
    IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  -[GEOTimeCheckpoints readAll:](self, "readAll:", 1);
  v2 = PBRepeatedUInt32Hash();
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = objc_msgSend(v10, "distToNextCheckpointsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOTimeCheckpoints addDistToNextCheckpoint:](self, "addDistToNextCheckpoint:", objc_msgSend(v10, "distToNextCheckpointAtIndex:", i));
  }
  v7 = objc_msgSend(v10, "timeToNextCheckpointsCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[GEOTimeCheckpoints addTimeToNextCheckpoint:](self, "addTimeToNextCheckpoint:", objc_msgSend(v10, "timeToNextCheckpointAtIndex:", j));
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTimeCheckpointsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6241);
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
  *(_BYTE *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOTimeCheckpoints readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
