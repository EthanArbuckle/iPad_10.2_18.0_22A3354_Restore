@implementation GEOAdvisoryItem

- (GEOAdvisoryItem)init
{
  GEOAdvisoryItem *v2;
  GEOAdvisoryItem *v3;
  GEOAdvisoryItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAdvisoryItem;
  v2 = -[GEOAdvisoryItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAdvisoryItem)initWithData:(id)a3
{
  GEOAdvisoryItem *v3;
  GEOAdvisoryItem *v4;
  GEOAdvisoryItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAdvisoryItem;
  v3 = -[GEOAdvisoryItem initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAdvisoryCard
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdvisoryCard_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAdvisoryCard
{
  -[GEOAdvisoryItem _readAdvisoryCard]((uint64_t)self);
  return self->_advisoryCard != 0;
}

- (GEOAdvisoryCard)advisoryCard
{
  -[GEOAdvisoryItem _readAdvisoryCard]((uint64_t)self);
  return self->_advisoryCard;
}

- (void)setAdvisoryCard:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_advisoryCard, a3);
}

- (unsigned)incidentIndex
{
  return self->_incidentIndex;
}

- (void)setIncidentIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_incidentIndex = a3;
}

- (void)setHasIncidentIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasIncidentIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)transitIncidentIndex
{
  return self->_transitIncidentIndex;
}

- (void)setTransitIncidentIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_transitIncidentIndex = a3;
}

- (void)setHasTransitIncidentIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTransitIncidentIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readAnalyticsMessageValues
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticsMessageValues_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)analyticsMessageValues
{
  -[GEOAdvisoryItem _readAnalyticsMessageValues]((uint64_t)self);
  return self->_analyticsMessageValues;
}

- (void)setAnalyticsMessageValues:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *analyticsMessageValues;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  analyticsMessageValues = self->_analyticsMessageValues;
  self->_analyticsMessageValues = v4;

}

- (void)clearAnalyticsMessageValues
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_analyticsMessageValues, "removeAllObjects");
}

- (void)addAnalyticsMessageValue:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAdvisoryItem _readAnalyticsMessageValues]((uint64_t)self);
  -[GEOAdvisoryItem _addNoFlagsAnalyticsMessageValue:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsAnalyticsMessageValue:(uint64_t)a1
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

- (unint64_t)analyticsMessageValuesCount
{
  -[GEOAdvisoryItem _readAnalyticsMessageValues]((uint64_t)self);
  return -[NSMutableArray count](self->_analyticsMessageValues, "count");
}

- (id)analyticsMessageValueAtIndex:(unint64_t)a3
{
  -[GEOAdvisoryItem _readAnalyticsMessageValues]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_analyticsMessageValues, "objectAtIndex:", a3);
}

+ (Class)analyticsMessageValueType
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
  v8.super_class = (Class)GEOAdvisoryItem;
  -[GEOAdvisoryItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAdvisoryItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAdvisoryItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  char v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "advisoryCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("advisoryCard");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("advisory_card");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = *(_BYTE *)(a1 + 60);
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("incidentIndex");
    else
      v11 = CFSTR("incident_index");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v9 = *(_BYTE *)(a1 + 60);
  }
  if ((v9 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("transitIncidentIndex");
    else
      v13 = CFSTR("transit_incident_index");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend((id)a1, "analyticsMessageValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("analyticsMessageValue");
    else
      v15 = CFSTR("analytics_message_value");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __45__GEOAdvisoryItem__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAdvisoryItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOAdvisoryItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAdvisoryItem)initWithDictionary:(id)a3
{
  return (GEOAdvisoryItem *)-[GEOAdvisoryItem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOAdvisoryCard *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("advisoryCard");
      else
        v6 = CFSTR("advisory_card");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOAdvisoryCard alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOAdvisoryCard initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOAdvisoryCard initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setAdvisoryCard:", v9);

      }
      if (a3)
        v11 = CFSTR("incidentIndex");
      else
        v11 = CFSTR("incident_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIncidentIndex:", objc_msgSend(v12, "unsignedIntValue"));

      if (a3)
        v13 = CFSTR("transitIncidentIndex");
      else
        v13 = CFSTR("transit_incident_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTransitIncidentIndex:", objc_msgSend(v14, "unsignedIntValue"));

      if (a3)
        v15 = CFSTR("analyticsMessageValue");
      else
        v15 = CFSTR("analytics_message_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v26 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = (void *)objc_msgSend(v22, "copy", (_QWORD)v25);
                objc_msgSend(a1, "addAnalyticsMessageValue:", v23);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v19);
        }

      }
    }
  }

  return a1;
}

- (GEOAdvisoryItem)initWithJSON:(id)a3
{
  return (GEOAdvisoryItem *)-[GEOAdvisoryItem _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_318;
    else
      v8 = (int *)&readAll__nonRecursiveTag_319;
    GEOAdvisoryItemReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOAdvisoryCard readAll:](self->_advisoryCard, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAdvisoryItemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAdvisoryItemReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOAdvisoryItemIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOAdvisoryItem readAll:](self, "readAll:", 0);
    if (self->_advisoryCard)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_analyticsMessageValues;
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
          PBDataWriterWriteStringField();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOAdvisoryItem _readAdvisoryCard]((uint64_t)self);
  return -[GEOAdvisoryCard hasGreenTeaWithValue:](self->_advisoryCard, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEOAdvisoryItem readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 10) = self->_readerMarkPos;
  *((_DWORD *)v9 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_advisoryCard)
    objc_msgSend(v9, "setAdvisoryCard:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v9 + 13) = self->_incidentIndex;
    *((_BYTE *)v9 + 60) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 14) = self->_transitIncidentIndex;
    *((_BYTE *)v9 + 60) |= 2u;
  }
  if (-[GEOAdvisoryItem analyticsMessageValuesCount](self, "analyticsMessageValuesCount"))
  {
    objc_msgSend(v9, "clearAnalyticsMessageValues");
    v5 = -[GEOAdvisoryItem analyticsMessageValuesCount](self, "analyticsMessageValuesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOAdvisoryItem analyticsMessageValueAtIndex:](self, "analyticsMessageValueAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAnalyticsMessageValue:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  char flags;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  PBUnknownFields *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOAdvisoryItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAdvisoryItem readAll:](self, "readAll:", 0);
  v9 = -[GEOAdvisoryCard copyWithZone:](self->_advisoryCard, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_incidentIndex;
    *(_BYTE *)(v5 + 60) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_transitIncidentIndex;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_analyticsMessageValues;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addAnalyticsMessageValue:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOAdvisoryCard *advisoryCard;
  NSMutableArray *analyticsMessageValues;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOAdvisoryItem readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  advisoryCard = self->_advisoryCard;
  if ((unint64_t)advisoryCard | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOAdvisoryCard isEqual:](advisoryCard, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_incidentIndex != *((_DWORD *)v4 + 13))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_transitIncidentIndex != *((_DWORD *)v4 + 14))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_16;
  }
  analyticsMessageValues = self->_analyticsMessageValues;
  if ((unint64_t)analyticsMessageValues | *((_QWORD *)v4 + 4))
    v7 = -[NSMutableArray isEqual:](analyticsMessageValues, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOAdvisoryItem readAll:](self, "readAll:", 1);
  v3 = -[GEOAdvisoryCard hash](self->_advisoryCard, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_incidentIndex;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_analyticsMessageValues, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_transitIncidentIndex;
  return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_analyticsMessageValues, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOAdvisoryCard *advisoryCard;
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
  advisoryCard = self->_advisoryCard;
  v6 = *((_QWORD *)v4 + 3);
  if (advisoryCard)
  {
    if (v6)
      -[GEOAdvisoryCard mergeFrom:](advisoryCard, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOAdvisoryItem setAdvisoryCard:](self, "setAdvisoryCard:");
  }
  v7 = *((_BYTE *)v4 + 60);
  if ((v7 & 1) != 0)
  {
    self->_incidentIndex = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
    v7 = *((_BYTE *)v4 + 60);
  }
  if ((v7 & 2) != 0)
  {
    self->_transitIncidentIndex = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_flags |= 2u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v4 + 4);
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
        -[GEOAdvisoryItem addAnalyticsMessageValue:](self, "addAnalyticsMessageValue:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOAdvisoryItemReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_322);
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
  *(_BYTE *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOAdvisoryItem readAll:](self, "readAll:", 0);
    -[GEOAdvisoryCard clearUnknownFields:](self->_advisoryCard, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsMessageValues, 0);
  objc_storeStrong((id *)&self->_advisoryCard, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
