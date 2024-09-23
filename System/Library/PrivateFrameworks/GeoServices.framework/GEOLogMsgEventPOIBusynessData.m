@implementation GEOLogMsgEventPOIBusynessData

- (GEOLogMsgEventPOIBusynessData)init
{
  GEOLogMsgEventPOIBusynessData *v2;
  GEOLogMsgEventPOIBusynessData *v3;
  GEOLogMsgEventPOIBusynessData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventPOIBusynessData;
  v2 = -[GEOLogMsgEventPOIBusynessData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventPOIBusynessData)initWithData:(id)a3
{
  GEOLogMsgEventPOIBusynessData *v3;
  GEOLogMsgEventPOIBusynessData *v4;
  GEOLogMsgEventPOIBusynessData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventPOIBusynessData;
  v3 = -[GEOLogMsgEventPOIBusynessData initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPOIBusynessDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_10);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLocation
{
  -[GEOLogMsgEventPOIBusynessData _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOLogMsgEventPOIBusynessData _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 72;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasAltitude
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readPoiPredictions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPOIBusynessDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiPredictions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)poiPredictions
{
  -[GEOLogMsgEventPOIBusynessData _readPoiPredictions]((uint64_t)self);
  return self->_poiPredictions;
}

- (void)setPoiPredictions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *poiPredictions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  poiPredictions = self->_poiPredictions;
  self->_poiPredictions = v4;

}

- (void)clearPoiPredictions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_poiPredictions, "removeAllObjects");
}

- (void)addPoiPredictions:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventPOIBusynessData _readPoiPredictions]((uint64_t)self);
  -[GEOLogMsgEventPOIBusynessData _addNoFlagsPoiPredictions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsPoiPredictions:(uint64_t)a1
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

- (unint64_t)poiPredictionsCount
{
  -[GEOLogMsgEventPOIBusynessData _readPoiPredictions]((uint64_t)self);
  return -[NSMutableArray count](self->_poiPredictions, "count");
}

- (id)poiPredictionsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventPOIBusynessData _readPoiPredictions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_poiPredictions, "objectAtIndex:", a3);
}

+ (Class)poiPredictionsType
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
  v8.super_class = (Class)GEOLogMsgEventPOIBusynessData;
  -[GEOLogMsgEventPOIBusynessData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventPOIBusynessData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPOIBusynessData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("timestamp"));

  }
  objc_msgSend((id)a1, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v6, "jsonRepresentation");
    else
      objc_msgSend(v6, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("location"));

  }
  v9 = *(_BYTE *)(a1 + 76);
  if ((v9 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
      goto LABEL_11;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("verticalAccuracy"));

    if ((*(_BYTE *)(a1 + 76) & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("horizontalAccuracy"));

  v9 = *(_BYTE *)(a1 + 76);
  if ((v9 & 8) != 0)
    goto LABEL_27;
LABEL_11:
  if ((v9 & 1) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("altitude"));

  }
LABEL_13:
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = *(id *)(a1 + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation", (_QWORD)v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18, (_QWORD)v22);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("poiPredictions"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventPOIBusynessData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventPOIBusynessData)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPOIBusynessData *)-[GEOLogMsgEventPOIBusynessData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOLatLng *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEOLogMsgEventPOIPredictionData *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(a1, "setTimestamp:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLatLng initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLatLng initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setLocation:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("horizontalAccuracy"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(a1, "setHorizontalAccuracy:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("verticalAccuracy"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(a1, "setVerticalAccuracy:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("altitude"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(a1, "setAltitude:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("poiPredictions"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v25 = v14;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = [GEOLogMsgEventPOIPredictionData alloc];
                if ((a3 & 1) != 0)
                  v22 = -[GEOLogMsgEventPOIPredictionData initWithJSON:](v21, "initWithJSON:", v20);
                else
                  v22 = -[GEOLogMsgEventPOIPredictionData initWithDictionary:](v21, "initWithDictionary:", v20);
                v23 = (void *)v22;
                objc_msgSend(a1, "addPoiPredictions:", v22);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v17);
        }

        v14 = v25;
      }

    }
  }

  return a1;
}

- (GEOLogMsgEventPOIBusynessData)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPOIBusynessData *)-[GEOLogMsgEventPOIBusynessData _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3283;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3284;
    GEOLogMsgEventPOIBusynessDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventPOIBusynessDataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPOIBusynessDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPOIBusynessDataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0x70) == 0)
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
      goto LABEL_23;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventPOIBusynessData readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_location)
    PBDataWriterWriteSubmessage();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_9;
LABEL_20:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_20;
LABEL_9:
  if ((flags & 1) != 0)
LABEL_10:
    PBDataWriterWriteDoubleField();
LABEL_11:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_poiPredictions;
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

LABEL_23:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOLogMsgEventPOIBusynessData _readLocation]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOLogMsgEventPOIBusynessData readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 16) = self->_readerMarkPos;
  *((_DWORD *)v10 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v10;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v10[6] = *(id *)&self->_timestamp;
    *((_BYTE *)v10 + 76) |= 4u;
  }
  if (self->_location)
  {
    objc_msgSend(v10, "setLocation:");
    v4 = v10;
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_7;
LABEL_15:
    v4[7] = *(id *)&self->_verticalAccuracy;
    *((_BYTE *)v4 + 76) |= 8u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v4[3] = *(id *)&self->_horizontalAccuracy;
  *((_BYTE *)v4 + 76) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    v4[2] = *(id *)&self->_altitude;
    *((_BYTE *)v4 + 76) |= 1u;
  }
LABEL_9:
  if (-[GEOLogMsgEventPOIBusynessData poiPredictionsCount](self, "poiPredictionsCount"))
  {
    objc_msgSend(v10, "clearPoiPredictions");
    v6 = -[GEOLogMsgEventPOIBusynessData poiPredictionsCount](self, "poiPredictionsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEOLogMsgEventPOIBusynessData poiPredictionsAtIndex:](self, "poiPredictionsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addPoiPredictions:", v9);

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
  id v9;
  void *v10;
  char flags;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventPOIBusynessDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_18;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventPOIBusynessData readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(double *)(v5 + 48) = self->_timestamp;
    *(_BYTE *)(v5 + 76) |= 4u;
  }
  v9 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 24) = self->_horizontalAccuracy;
    *(_BYTE *)(v5 + 76) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_9:
      if ((flags & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v5 + 56) = self->_verticalAccuracy;
  *(_BYTE *)(v5 + 76) |= 8u;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_10:
    *(double *)(v5 + 16) = self->_altitude;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
LABEL_11:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_poiPredictions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v8);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addPoiPredictions:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
LABEL_18:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOLatLng *location;
  NSMutableArray *poiPredictions;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOLogMsgEventPOIBusynessData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 76);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_timestamp != *((double *)v4 + 6))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_27;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
    {
LABEL_27:
      v9 = 0;
      goto LABEL_28;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 76);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_horizontalAccuracy != *((double *)v4 + 3))
      goto LABEL_27;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_verticalAccuracy != *((double *)v4 + 7))
      goto LABEL_27;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_altitude != *((double *)v4 + 2))
      goto LABEL_27;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_27;
  }
  poiPredictions = self->_poiPredictions;
  if ((unint64_t)poiPredictions | *((_QWORD *)v4 + 5))
    v9 = -[NSMutableArray isEqual:](poiPredictions, "isEqual:");
  else
    v9 = 1;
LABEL_28:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  double timestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  char flags;
  unint64_t v10;
  double horizontalAccuracy;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double verticalAccuracy;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  double altitude;
  double v22;
  long double v23;
  double v24;

  -[GEOLogMsgEventPOIBusynessData readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    timestamp = self->_timestamp;
    v5 = -timestamp;
    if (timestamp >= 0.0)
      v5 = self->_timestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[GEOLatLng hash](self->_location, "hash");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    horizontalAccuracy = self->_horizontalAccuracy;
    v12 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0)
      v12 = self->_horizontalAccuracy;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((flags & 8) != 0)
  {
    verticalAccuracy = self->_verticalAccuracy;
    v17 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0)
      v17 = self->_verticalAccuracy;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((flags & 1) != 0)
  {
    altitude = self->_altitude;
    v22 = -altitude;
    if (altitude >= 0.0)
      v22 = self->_altitude;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  return v8 ^ v3 ^ v10 ^ v15 ^ v20 ^ -[NSMutableArray hash](self->_poiPredictions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOLatLng *location;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    self->_timestamp = *((double *)v4 + 6);
    *(_BYTE *)&self->_flags |= 4u;
  }
  location = self->_location;
  v6 = *((_QWORD *)v4 + 4);
  if (location)
  {
    if (v6)
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOLogMsgEventPOIBusynessData setLocation:](self, "setLocation:");
  }
  v7 = *((_BYTE *)v4 + 76);
  if ((v7 & 2) != 0)
  {
    self->_horizontalAccuracy = *((double *)v4 + 3);
    *(_BYTE *)&self->_flags |= 2u;
    v7 = *((_BYTE *)v4 + 76);
    if ((v7 & 8) == 0)
    {
LABEL_10:
      if ((v7 & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 8) == 0)
  {
    goto LABEL_10;
  }
  self->_verticalAccuracy = *((double *)v4 + 7);
  *(_BYTE *)&self->_flags |= 8u;
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_11:
    self->_altitude = *((double *)v4 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_12:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v4 + 5);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[GEOLogMsgEventPOIBusynessData addPoiPredictions:](self, "addPoiPredictions:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiPredictions, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
