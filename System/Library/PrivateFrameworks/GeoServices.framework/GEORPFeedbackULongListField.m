@implementation GEORPFeedbackULongListField

- (GEORPFeedbackULongListField)init
{
  GEORPFeedbackULongListField *v2;
  GEORPFeedbackULongListField *v3;
  GEORPFeedbackULongListField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackULongListField;
  v2 = -[GEORPFeedbackULongListField init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackULongListField)initWithData:(id)a3
{
  GEORPFeedbackULongListField *v3;
  GEORPFeedbackULongListField *v4;
  GEORPFeedbackULongListField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackULongListField;
  v3 = -[GEORPFeedbackULongListField initWithData:](&v7, sel_initWithData_, a3);
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
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPFeedbackULongListField;
  -[GEORPFeedbackULongListField dealloc](&v3, sel_dealloc);
}

- (void)_readAddeds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackULongListFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddeds_tags_923);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)addedsCount
{
  -[GEORPFeedbackULongListField _readAddeds]((uint64_t)self);
  return self->_addeds.count;
}

- (unint64_t)addeds
{
  -[GEORPFeedbackULongListField _readAddeds]((uint64_t)self);
  return self->_addeds.list;
}

- (void)clearAddeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt64Clear();
}

- (void)addAdded:(unint64_t)a3
{
  -[GEORPFeedbackULongListField _readAddeds]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (unint64_t)addedAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_addeds;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPFeedbackULongListField _readAddeds]((uint64_t)self);
  p_addeds = &self->_addeds;
  count = self->_addeds.count;
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
  return p_addeds->list[a3];
}

- (void)setAddeds:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt64Set();
}

- (void)_readRemoveds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackULongListFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRemoveds_tags_926);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)removedsCount
{
  -[GEORPFeedbackULongListField _readRemoveds]((uint64_t)self);
  return self->_removeds.count;
}

- (unint64_t)removeds
{
  -[GEORPFeedbackULongListField _readRemoveds]((uint64_t)self);
  return self->_removeds.list;
}

- (void)clearRemoveds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt64Clear();
}

- (void)addRemoved:(unint64_t)a3
{
  -[GEORPFeedbackULongListField _readRemoveds]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (unint64_t)removedAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_removeds;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPFeedbackULongListField _readRemoveds]((uint64_t)self);
  p_removeds = &self->_removeds;
  count = self->_removeds.count;
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
  return p_removeds->list[a3];
}

- (void)setRemoveds:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt64Set();
}

- (void)_readOriginals
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackULongListFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginals_tags_927);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)originalsCount
{
  -[GEORPFeedbackULongListField _readOriginals]((uint64_t)self);
  return self->_originals.count;
}

- (unint64_t)originals
{
  -[GEORPFeedbackULongListField _readOriginals]((uint64_t)self);
  return self->_originals.list;
}

- (void)clearOriginals
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt64Clear();
}

- (void)addOriginal:(unint64_t)a3
{
  -[GEORPFeedbackULongListField _readOriginals]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (unint64_t)originalAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_originals;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPFeedbackULongListField _readOriginals]((uint64_t)self);
  p_originals = &self->_originals;
  count = self->_originals.count;
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
  return p_originals->list[a3];
}

- (void)setOriginals:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt64Set();
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
  v8.super_class = (Class)GEORPFeedbackULongListField;
  -[GEORPFeedbackULongListField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackULongListField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[3])
    {
      PBRepeatedUInt64NSArray();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("added"));

    }
    if (a1[9])
    {
      PBRepeatedUInt64NSArray();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("removed"));

    }
    if (a1[6])
    {
      PBRepeatedUInt64NSArray();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("original"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEORPFeedbackULongListField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackULongListField *)-[GEORPFeedbackULongListField _initWithDictionary:isJSON:](self, a3);
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
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("added"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v35;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v35 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addAdded:", objc_msgSend(v10, "unsignedLongLongValue"));
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
          }
          while (v7);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("removed"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v31;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v31 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addRemoved:", objc_msgSend(v17, "unsignedLongLongValue"));
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v14);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("original"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v27;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v27 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v23);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addOriginal:", objc_msgSend(v24, "unsignedLongLongValue", (_QWORD)v26));
              ++v23;
            }
            while (v21 != v23);
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          }
          while (v21);
        }

      }
    }
  }

  return a1;
}

- (GEORPFeedbackULongListField)initWithJSON:(id)a3
{
  return (GEORPFeedbackULongListField *)-[GEORPFeedbackULongListField _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_928;
    else
      v8 = (int *)&readAll__nonRecursiveTag_929;
    GEORPFeedbackULongListFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackULongListFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackULongListFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  $D9041E0417540B7714261C3B5E8BB314 *p_originals;
  unint64_t v9;
  PBDataReader *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xF) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
    v5 = v12;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackULongListField readAll:](self, "readAll:", 0);
    v5 = v12;
    if (self->_addeds.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v5 = v12;
        ++v6;
      }
      while (v6 < self->_addeds.count);
    }
    if (self->_removeds.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v5 = v12;
        ++v7;
      }
      while (v7 < self->_removeds.count);
    }
    p_originals = &self->_originals;
    if (p_originals->count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v5 = v12;
        ++v9;
      }
      while (v9 < p_originals->count);
    }
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
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  id *v13;

  v13 = (id *)a3;
  -[GEORPFeedbackULongListField readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 22) = self->_readerMarkPos;
  *((_DWORD *)v13 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPFeedbackULongListField addedsCount](self, "addedsCount"))
  {
    objc_msgSend(v13, "clearAddeds");
    v4 = -[GEORPFeedbackULongListField addedsCount](self, "addedsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v13, "addAdded:", -[GEORPFeedbackULongListField addedAtIndex:](self, "addedAtIndex:", i));
    }
  }
  if (-[GEORPFeedbackULongListField removedsCount](self, "removedsCount"))
  {
    objc_msgSend(v13, "clearRemoveds");
    v7 = -[GEORPFeedbackULongListField removedsCount](self, "removedsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v13, "addRemoved:", -[GEORPFeedbackULongListField removedAtIndex:](self, "removedAtIndex:", j));
    }
  }
  if (-[GEORPFeedbackULongListField originalsCount](self, "originalsCount"))
  {
    objc_msgSend(v13, "clearOriginals");
    v10 = -[GEORPFeedbackULongListField originalsCount](self, "originalsCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
        objc_msgSend(v13, "addOriginal:", -[GEORPFeedbackULongListField originalAtIndex:](self, "originalAtIndex:", k));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  PBDataReader *reader;
  PBDataReader *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    -[GEORPFeedbackULongListField readAll:](self, "readAll:", 0);
    PBRepeatedUInt64Copy();
    PBRepeatedUInt64Copy();
    PBRepeatedUInt64Copy();
    return v4;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackULongListFieldReadAllFrom((uint64_t)v4, self->_reader, 0);
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
    && (-[GEORPFeedbackULongListField readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedUInt64IsEqual())
    && PBRepeatedUInt64IsEqual())
  {
    IsEqual = PBRepeatedUInt64IsEqual();
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
  uint64_t v3;

  -[GEORPFeedbackULongListField readAll:](self, "readAll:", 1);
  v2 = PBRepeatedUInt64Hash();
  v3 = PBRepeatedUInt64Hash() ^ v2;
  return v3 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "readAll:", 0);
  v4 = objc_msgSend(v13, "addedsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEORPFeedbackULongListField addAdded:](self, "addAdded:", objc_msgSend(v13, "addedAtIndex:", i));
  }
  v7 = objc_msgSend(v13, "removedsCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[GEORPFeedbackULongListField addRemoved:](self, "addRemoved:", objc_msgSend(v13, "removedAtIndex:", j));
  }
  v10 = objc_msgSend(v13, "originalsCount");
  if (v10)
  {
    v11 = v10;
    for (k = 0; k != v11; ++k)
      -[GEORPFeedbackULongListField addOriginal:](self, "addOriginal:", objc_msgSend(v13, "originalAtIndex:", k));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
