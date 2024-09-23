@implementation GEOLogMsgStateDetailLookAroundLog

- (GEOLogMsgStateDetailLookAroundLog)init
{
  GEOLogMsgStateDetailLookAroundLog *v2;
  GEOLogMsgStateDetailLookAroundLog *v3;
  GEOLogMsgStateDetailLookAroundLog *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateDetailLookAroundLog;
  v2 = -[GEOLogMsgStateDetailLookAroundLog init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateDetailLookAroundLog)initWithData:(id)a3
{
  GEOLogMsgStateDetailLookAroundLog *v3;
  GEOLogMsgStateDetailLookAroundLog *v4;
  GEOLogMsgStateDetailLookAroundLog *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateDetailLookAroundLog;
  v3 = -[GEOLogMsgStateDetailLookAroundLog initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (double)durationSec
{
  return self->_durationSec;
}

- (void)setDurationSec:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_durationSec = a3;
}

- (void)setHasDurationSec:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasDurationSec
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)poisShown
{
  return self->_poisShown;
}

- (void)setPoisShown:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_poisShown = a3;
}

- (void)setHasPoisShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPoisShown
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readLookAroundPipRecords
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDetailLookAroundLogReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLookAroundPipRecords_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)lookAroundPipRecords
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundPipRecords]((uint64_t)self);
  return self->_lookAroundPipRecords;
}

- (void)setLookAroundPipRecords:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *lookAroundPipRecords;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  lookAroundPipRecords = self->_lookAroundPipRecords;
  self->_lookAroundPipRecords = v4;

}

- (void)clearLookAroundPipRecords
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_lookAroundPipRecords, "removeAllObjects");
}

- (void)addLookAroundPipRecords:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundPipRecords]((uint64_t)self);
  -[GEOLogMsgStateDetailLookAroundLog _addNoFlagsLookAroundPipRecords:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLookAroundPipRecords:(uint64_t)a1
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

- (unint64_t)lookAroundPipRecordsCount
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundPipRecords]((uint64_t)self);
  return -[NSMutableArray count](self->_lookAroundPipRecords, "count");
}

- (id)lookAroundPipRecordsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundPipRecords]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_lookAroundPipRecords, "objectAtIndex:", a3);
}

+ (Class)lookAroundPipRecordsType
{
  return (Class)objc_opt_class();
}

- (void)_readLookAroundViewRecords
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDetailLookAroundLogReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLookAroundViewRecords_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)lookAroundViewRecords
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundViewRecords]((uint64_t)self);
  return self->_lookAroundViewRecords;
}

- (void)setLookAroundViewRecords:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *lookAroundViewRecords;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  lookAroundViewRecords = self->_lookAroundViewRecords;
  self->_lookAroundViewRecords = v4;

}

- (void)clearLookAroundViewRecords
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_lookAroundViewRecords, "removeAllObjects");
}

- (void)addLookAroundViewRecords:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundViewRecords]((uint64_t)self);
  -[GEOLogMsgStateDetailLookAroundLog _addNoFlagsLookAroundViewRecords:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLookAroundViewRecords:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)lookAroundViewRecordsCount
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundViewRecords]((uint64_t)self);
  return -[NSMutableArray count](self->_lookAroundViewRecords, "count");
}

- (id)lookAroundViewRecordsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundViewRecords]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_lookAroundViewRecords, "objectAtIndex:", a3);
}

+ (Class)lookAroundViewRecordsType
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
  v8.super_class = (Class)GEOLogMsgStateDetailLookAroundLog;
  -[GEOLogMsgStateDetailLookAroundLog description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateDetailLookAroundLog dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateDetailLookAroundLog _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  const __CFString *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("durationSec");
    else
      v7 = CFSTR("duration_sec");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 56);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("poisShown");
    else
      v9 = CFSTR("pois_shown");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = *(id *)(a1 + 24);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v13);
    }

    if (a2)
      v18 = CFSTR("lookAroundPipRecords");
    else
      v18 = CFSTR("look_around_pip_records");
    objc_msgSend(v4, "setObject:forKey:", v10, v18);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = *(id *)(a1 + 32);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v25, "jsonRepresentation");
          else
            objc_msgSend(v25, "dictionaryRepresentation", (_QWORD)v29);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v26, (_QWORD)v29);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v22);
    }

    if (a2)
      v27 = CFSTR("lookAroundViewRecords");
    else
      v27 = CFSTR("look_around_view_records");
    objc_msgSend(v4, "setObject:forKey:", v19, v27, (_QWORD)v29);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateDetailLookAroundLog _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateDetailLookAroundLog)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateDetailLookAroundLog *)-[GEOLogMsgStateDetailLookAroundLog _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOLogMsgStateDetailLookAroundLogRecord *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  GEOLogMsgStateDetailLookAroundLogRecord *v29;
  uint64_t v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("durationSec");
      else
        v6 = CFSTR("duration_sec");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setDurationSec:");
      }

      if (a3)
        v8 = CFSTR("poisShown");
      else
        v8 = CFSTR("pois_shown");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPoisShown:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("lookAroundPipRecords");
      else
        v10 = CFSTR("look_around_pip_records");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v33 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v39 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = [GEOLogMsgStateDetailLookAroundLogRecord alloc];
                if ((a3 & 1) != 0)
                  v19 = -[GEOLogMsgStateDetailLookAroundLogRecord initWithJSON:](v18, "initWithJSON:", v17);
                else
                  v19 = -[GEOLogMsgStateDetailLookAroundLogRecord initWithDictionary:](v18, "initWithDictionary:", v17);
                v20 = (void *)v19;
                objc_msgSend(a1, "addLookAroundPipRecords:", v19);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          }
          while (v14);
        }

        v5 = v33;
      }

      if (a3)
        v21 = CFSTR("lookAroundViewRecords");
      else
        v21 = CFSTR("look_around_view_records");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v35 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v29 = [GEOLogMsgStateDetailLookAroundLogRecord alloc];
                if ((a3 & 1) != 0)
                  v30 = -[GEOLogMsgStateDetailLookAroundLogRecord initWithJSON:](v29, "initWithJSON:", v28);
                else
                  v30 = -[GEOLogMsgStateDetailLookAroundLogRecord initWithDictionary:](v29, "initWithDictionary:", v28);
                v31 = (void *)v30;
                objc_msgSend(a1, "addLookAroundViewRecords:", v30);

              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v25);
        }

        v5 = v33;
      }

    }
  }

  return a1;
}

- (GEOLogMsgStateDetailLookAroundLog)initWithJSON:(id)a3
{
  return (GEOLogMsgStateDetailLookAroundLog *)-[GEOLogMsgStateDetailLookAroundLog _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5732;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5733;
    GEOLogMsgStateDetailLookAroundLogReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgStateDetailLookAroundLogCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateDetailLookAroundLogIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateDetailLookAroundLogReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgStateDetailLookAroundLog readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_lookAroundPipRecords;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_lookAroundViewRecords;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

  }
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id *v13;

  v13 = (id *)a3;
  -[GEOLogMsgStateDetailLookAroundLog readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 10) = self->_readerMarkPos;
  *((_DWORD *)v13 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v13[2] = *(id *)&self->_durationSec;
    *((_BYTE *)v13 + 56) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v13 + 13) = self->_poisShown;
    *((_BYTE *)v13 + 56) |= 2u;
  }
  if (-[GEOLogMsgStateDetailLookAroundLog lookAroundPipRecordsCount](self, "lookAroundPipRecordsCount"))
  {
    objc_msgSend(v13, "clearLookAroundPipRecords");
    v5 = -[GEOLogMsgStateDetailLookAroundLog lookAroundPipRecordsCount](self, "lookAroundPipRecordsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOLogMsgStateDetailLookAroundLog lookAroundPipRecordsAtIndex:](self, "lookAroundPipRecordsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addLookAroundPipRecords:", v8);

      }
    }
  }
  if (-[GEOLogMsgStateDetailLookAroundLog lookAroundViewRecordsCount](self, "lookAroundViewRecordsCount"))
  {
    objc_msgSend(v13, "clearLookAroundViewRecords");
    v9 = -[GEOLogMsgStateDetailLookAroundLog lookAroundViewRecordsCount](self, "lookAroundViewRecordsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOLogMsgStateDetailLookAroundLog lookAroundViewRecordsAtIndex:](self, "lookAroundViewRecordsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addLookAroundViewRecords:", v12);

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
  char flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
      GEOLogMsgStateDetailLookAroundLogReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgStateDetailLookAroundLog readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_durationSec;
    *(_BYTE *)(v5 + 56) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_poisShown;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_lookAroundPipRecords;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLookAroundPipRecords:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v11);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_lookAroundViewRecords;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v8);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend((id)v5, "addLookAroundViewRecords:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *lookAroundPipRecords;
  NSMutableArray *lookAroundViewRecords;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOLogMsgStateDetailLookAroundLog readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_durationSec != *((double *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_poisShown != *((_DWORD *)v4 + 13))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_16;
  }
  lookAroundPipRecords = self->_lookAroundPipRecords;
  if ((unint64_t)lookAroundPipRecords | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](lookAroundPipRecords, "isEqual:"))
  {
    goto LABEL_16;
  }
  lookAroundViewRecords = self->_lookAroundViewRecords;
  if ((unint64_t)lookAroundViewRecords | *((_QWORD *)v4 + 4))
    v7 = -[NSMutableArray isEqual:](lookAroundViewRecords, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double durationSec;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  -[GEOLogMsgStateDetailLookAroundLog readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    durationSec = self->_durationSec;
    v6 = -durationSec;
    if (durationSec >= 0.0)
      v6 = self->_durationSec;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((flags & 2) != 0)
    v9 = 2654435761 * self->_poisShown;
  else
    v9 = 0;
  v10 = v9 ^ v4 ^ -[NSMutableArray hash](self->_lookAroundPipRecords, "hash");
  return v10 ^ -[NSMutableArray hash](self->_lookAroundViewRecords, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 1) != 0)
  {
    self->_durationSec = *((double *)v4 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_poisShown = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 2u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *((id *)v4 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[GEOLogMsgStateDetailLookAroundLog addLookAroundPipRecords:](self, "addLookAroundPipRecords:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v4 + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[GEOLogMsgStateDetailLookAroundLog addLookAroundViewRecords:](self, "addLookAroundViewRecords:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundViewRecords, 0);
  objc_storeStrong((id *)&self->_lookAroundPipRecords, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
