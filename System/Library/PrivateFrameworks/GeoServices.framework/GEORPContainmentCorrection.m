@implementation GEORPContainmentCorrection

- (GEORPContainmentCorrection)init
{
  GEORPContainmentCorrection *v2;
  GEORPContainmentCorrection *v3;
  GEORPContainmentCorrection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPContainmentCorrection;
  v2 = -[GEORPContainmentCorrection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPContainmentCorrection)initWithData:(id)a3
{
  GEORPContainmentCorrection *v3;
  GEORPContainmentCorrection *v4;
  GEORPContainmentCorrection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPContainmentCorrection;
  v3 = -[GEORPContainmentCorrection initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEORPContainmentCorrection;
  -[GEORPContainmentCorrection dealloc](&v3, sel_dealloc);
}

- (void)_readAddedMuids
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPContainmentCorrectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddedMuids_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)addedMuidsCount
{
  -[GEORPContainmentCorrection _readAddedMuids]((uint64_t)self);
  return self->_addedMuids.count;
}

- (unint64_t)addedMuids
{
  -[GEORPContainmentCorrection _readAddedMuids]((uint64_t)self);
  return self->_addedMuids.list;
}

- (void)clearAddedMuids
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt64Clear();
}

- (void)addAddedMuid:(unint64_t)a3
{
  -[GEORPContainmentCorrection _readAddedMuids]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (unint64_t)addedMuidAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_addedMuids;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPContainmentCorrection _readAddedMuids]((uint64_t)self);
  p_addedMuids = &self->_addedMuids;
  count = self->_addedMuids.count;
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
  return p_addedMuids->list[a3];
}

- (void)setAddedMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt64Set();
}

- (void)_readRemovedMuids
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPContainmentCorrectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRemovedMuids_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)removedMuidsCount
{
  -[GEORPContainmentCorrection _readRemovedMuids]((uint64_t)self);
  return self->_removedMuids.count;
}

- (unint64_t)removedMuids
{
  -[GEORPContainmentCorrection _readRemovedMuids]((uint64_t)self);
  return self->_removedMuids.list;
}

- (void)clearRemovedMuids
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt64Clear();
}

- (void)addRemovedMuid:(unint64_t)a3
{
  -[GEORPContainmentCorrection _readRemovedMuids]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (unint64_t)removedMuidAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_removedMuids;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPContainmentCorrection _readRemovedMuids]((uint64_t)self);
  p_removedMuids = &self->_removedMuids;
  count = self->_removedMuids.count;
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
  return p_removedMuids->list[a3];
}

- (void)setRemovedMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt64Set();
}

- (void)_readOriginalMuids
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPContainmentCorrectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalMuids_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)originalMuidsCount
{
  -[GEORPContainmentCorrection _readOriginalMuids]((uint64_t)self);
  return self->_originalMuids.count;
}

- (unint64_t)originalMuids
{
  -[GEORPContainmentCorrection _readOriginalMuids]((uint64_t)self);
  return self->_originalMuids.list;
}

- (void)clearOriginalMuids
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt64Clear();
}

- (void)addOriginalMuid:(unint64_t)a3
{
  -[GEORPContainmentCorrection _readOriginalMuids]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (unint64_t)originalMuidAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_originalMuids;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPContainmentCorrection _readOriginalMuids]((uint64_t)self);
  p_originalMuids = &self->_originalMuids;
  count = self->_originalMuids.count;
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
  return p_originalMuids->list[a3];
}

- (void)setOriginalMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
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
  v8.super_class = (Class)GEORPContainmentCorrection;
  -[GEORPContainmentCorrection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPContainmentCorrection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPContainmentCorrection _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[4])
  {
    PBRepeatedUInt64NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("addedMuid");
    else
      v6 = CFSTR("added_muid");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (a1[10])
  {
    PBRepeatedUInt64NSArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("removedMuid");
    else
      v8 = CFSTR("removed_muid");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (a1[7])
  {
    PBRepeatedUInt64NSArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("originalMuid");
    else
      v10 = CFSTR("original_muid");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  v11 = (void *)a1[2];
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __56__GEORPContainmentCorrection__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPContainmentCorrection _dictionaryRepresentation:](self, 1);
}

void __56__GEORPContainmentCorrection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPContainmentCorrection)initWithDictionary:(id)a3
{
  return (GEORPContainmentCorrection *)-[GEORPContainmentCorrection _initWithDictionary:isJSON:](self, a3, 0);
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("addedMuid");
      else
        v6 = CFSTR("added_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v40;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v40 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addAddedMuid:", objc_msgSend(v13, "unsignedLongLongValue"));
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v14 = CFSTR("removedMuid");
      else
        v14 = CFSTR("removed_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v36;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v36 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v20);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addRemovedMuid:", objc_msgSend(v21, "unsignedLongLongValue"));
              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          }
          while (v18);
        }

      }
      if (a3)
        v22 = CFSTR("originalMuid");
      else
        v22 = CFSTR("original_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v32;
          do
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v32 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v28);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addOriginalMuid:", objc_msgSend(v29, "unsignedLongLongValue", (_QWORD)v31));
              ++v28;
            }
            while (v26 != v28);
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
          }
          while (v26);
        }

      }
    }
  }

  return a1;
}

- (GEORPContainmentCorrection)initWithJSON:(id)a3
{
  return (GEORPContainmentCorrection *)-[GEORPContainmentCorrection _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_336;
    else
      v8 = (int *)&readAll__nonRecursiveTag_337;
    GEORPContainmentCorrectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPContainmentCorrectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPContainmentCorrectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPContainmentCorrection readAll:](self, "readAll:", 0);
    v5 = v11;
    if (self->_addedMuids.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v5 = v11;
        ++v6;
      }
      while (v6 < self->_addedMuids.count);
    }
    if (self->_removedMuids.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v5 = v11;
        ++v7;
      }
      while (v7 < self->_removedMuids.count);
    }
    if (self->_originalMuids.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v5 = v11;
        ++v8;
      }
      while (v8 < self->_originalMuids.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
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
  -[GEORPContainmentCorrection readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 24) = self->_readerMarkPos;
  *((_DWORD *)v13 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPContainmentCorrection addedMuidsCount](self, "addedMuidsCount"))
  {
    objc_msgSend(v13, "clearAddedMuids");
    v4 = -[GEORPContainmentCorrection addedMuidsCount](self, "addedMuidsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v13, "addAddedMuid:", -[GEORPContainmentCorrection addedMuidAtIndex:](self, "addedMuidAtIndex:", i));
    }
  }
  if (-[GEORPContainmentCorrection removedMuidsCount](self, "removedMuidsCount"))
  {
    objc_msgSend(v13, "clearRemovedMuids");
    v7 = -[GEORPContainmentCorrection removedMuidsCount](self, "removedMuidsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v13, "addRemovedMuid:", -[GEORPContainmentCorrection removedMuidAtIndex:](self, "removedMuidAtIndex:", j));
    }
  }
  if (-[GEORPContainmentCorrection originalMuidsCount](self, "originalMuidsCount"))
  {
    objc_msgSend(v13, "clearOriginalMuids");
    v10 = -[GEORPContainmentCorrection originalMuidsCount](self, "originalMuidsCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
        objc_msgSend(v13, "addOriginalMuid:", -[GEORPContainmentCorrection originalMuidAtIndex:](self, "originalMuidAtIndex:", k));
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
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPContainmentCorrection readAll:](self, "readAll:", 0);
    PBRepeatedUInt64Copy();
    PBRepeatedUInt64Copy();
    PBRepeatedUInt64Copy();
    objc_storeStrong(v4 + 2, self->_unknownFields);
    return v4;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPContainmentCorrectionReadAllFrom((uint64_t)v4, self->_reader, 0);
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
    && (-[GEORPContainmentCorrection readAll:](self, "readAll:", 1),
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

  -[GEORPContainmentCorrection readAll:](self, "readAll:", 1);
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
  v4 = objc_msgSend(v13, "addedMuidsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEORPContainmentCorrection addAddedMuid:](self, "addAddedMuid:", objc_msgSend(v13, "addedMuidAtIndex:", i));
  }
  v7 = objc_msgSend(v13, "removedMuidsCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[GEORPContainmentCorrection addRemovedMuid:](self, "addRemovedMuid:", objc_msgSend(v13, "removedMuidAtIndex:", j));
  }
  v10 = objc_msgSend(v13, "originalMuidsCount");
  if (v10)
  {
    v11 = v10;
    for (k = 0; k != v11; ++k)
      -[GEORPContainmentCorrection addOriginalMuid:](self, "addOriginalMuid:", objc_msgSend(v13, "originalMuidAtIndex:", k));
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
      GEORPContainmentCorrectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_340);
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
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEORPContainmentCorrection readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
