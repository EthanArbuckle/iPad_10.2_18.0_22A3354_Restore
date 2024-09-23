@implementation GEOTraitsTransitScheduleFilter

- (void)setOperatingHoursRange:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_operatingHoursRange, a3);
}

- (GEOTraitsTransitScheduleTimeRange)operatingHoursRange
{
  -[GEOTraitsTransitScheduleFilter _readOperatingHoursRange]((uint64_t)self);
  return self->_operatingHoursRange;
}

- (void)_readOperatingHoursRange
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTraitsTransitScheduleFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOperatingHoursRange_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLowFrequencyFilter
{
  -[GEOTraitsTransitScheduleFilter _readLowFrequencyFilter]((uint64_t)self);
  return self->_lowFrequencyFilter != 0;
}

- (GEOTraitsTransitScheduleModeFilter)lowFrequencyFilter
{
  -[GEOTraitsTransitScheduleFilter _readLowFrequencyFilter]((uint64_t)self);
  return self->_lowFrequencyFilter;
}

- (void)_readLowFrequencyFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTraitsTransitScheduleFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLowFrequencyFilter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasHighFrequencyFilter
{
  -[GEOTraitsTransitScheduleFilter _readHighFrequencyFilter]((uint64_t)self);
  return self->_highFrequencyFilter != 0;
}

- (GEOTraitsTransitScheduleModeFilter)highFrequencyFilter
{
  -[GEOTraitsTransitScheduleFilter _readHighFrequencyFilter]((uint64_t)self);
  return self->_highFrequencyFilter;
}

- (void)_readHighFrequencyFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTraitsTransitScheduleFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHighFrequencyFilter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOperatingHoursRange
{
  -[GEOTraitsTransitScheduleFilter _readOperatingHoursRange]((uint64_t)self);
  return self->_operatingHoursRange != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTraitsTransitScheduleFilter readAll:](self, "readAll:", 0);
    v8 = -[GEOTraitsTransitScheduleModeFilter copyWithZone:](self->_highFrequencyFilter, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[GEOTraitsTransitScheduleModeFilter copyWithZone:](self->_lowFrequencyFilter, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[GEOTraitsTransitScheduleTimeRange copyWithZone:](self->_operatingHoursRange, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOTraitsTransitScheduleFilterReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (GEOTraitsTransitScheduleFilter)init
{
  GEOTraitsTransitScheduleFilter *v2;
  GEOTraitsTransitScheduleFilter *v3;
  GEOTraitsTransitScheduleFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTraitsTransitScheduleFilter;
  v2 = -[GEOTraitsTransitScheduleFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setLowFrequencyFilter:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_lowFrequencyFilter, a3);
}

- (void)setHighFrequencyFilter:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_highFrequencyFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatingHoursRange, 0);
  objc_storeStrong((id *)&self->_lowFrequencyFilter, 0);
  objc_storeStrong((id *)&self->_highFrequencyFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTraitsTransitScheduleFilter readAll:](self, "readAll:", 0);
    if (self->_highFrequencyFilter)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_lowFrequencyFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_operatingHoursRange)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

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
      v8 = (int *)&readAll__recursiveTag_3271;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3272;
    GEOTraitsTransitScheduleFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOTraitsTransitScheduleModeFilter readAll:](self->_highFrequencyFilter, "readAll:", 1);
    -[GEOTraitsTransitScheduleModeFilter readAll:](self->_lowFrequencyFilter, "readAll:", 1);
    -[GEOTraitsTransitScheduleTimeRange readAll:](self->_operatingHoursRange, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOTraitsTransitScheduleFilter)initWithData:(id)a3
{
  GEOTraitsTransitScheduleFilter *v3;
  GEOTraitsTransitScheduleFilter *v4;
  GEOTraitsTransitScheduleFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTraitsTransitScheduleFilter;
  v3 = -[GEOTraitsTransitScheduleFilter initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  v8.super_class = (Class)GEOTraitsTransitScheduleFilter;
  -[GEOTraitsTransitScheduleFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTraitsTransitScheduleFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTraitsTransitScheduleFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "highFrequencyFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("highFrequencyFilter");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("high_frequency_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "lowFrequencyFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("lowFrequencyFilter");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("low_frequency_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "operatingHoursRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("operatingHoursRange");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("operating_hours_range");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = (void *)a1[2];
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __60__GEOTraitsTransitScheduleFilter__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTraitsTransitScheduleFilter _dictionaryRepresentation:](self, 1);
}

void __60__GEOTraitsTransitScheduleFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTraitsTransitScheduleFilter)initWithDictionary:(id)a3
{
  return (GEOTraitsTransitScheduleFilter *)-[GEOTraitsTransitScheduleFilter _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOTraitsTransitScheduleModeFilter *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOTraitsTransitScheduleModeFilter *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOTraitsTransitScheduleTimeRange *v18;
  uint64_t v19;
  void *v20;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("highFrequencyFilter");
      else
        v6 = CFSTR("high_frequency_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOTraitsTransitScheduleModeFilter alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOTraitsTransitScheduleModeFilter initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOTraitsTransitScheduleModeFilter initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setHighFrequencyFilter:", v9);

      }
      if (a3)
        v11 = CFSTR("lowFrequencyFilter");
      else
        v11 = CFSTR("low_frequency_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOTraitsTransitScheduleModeFilter alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOTraitsTransitScheduleModeFilter initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOTraitsTransitScheduleModeFilter initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setLowFrequencyFilter:", v14);

      }
      if (a3)
        v16 = CFSTR("operatingHoursRange");
      else
        v16 = CFSTR("operating_hours_range");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOTraitsTransitScheduleTimeRange alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOTraitsTransitScheduleTimeRange initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOTraitsTransitScheduleTimeRange initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setOperatingHoursRange:", v19);

      }
    }
  }

  return a1;
}

- (GEOTraitsTransitScheduleFilter)initWithJSON:(id)a3
{
  return (GEOTraitsTransitScheduleFilter *)-[GEOTraitsTransitScheduleFilter _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTraitsTransitScheduleFilterIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTraitsTransitScheduleFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOTraitsTransitScheduleFilter readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_highFrequencyFilter)
    objc_msgSend(v5, "setHighFrequencyFilter:");
  if (self->_lowFrequencyFilter)
    objc_msgSend(v5, "setLowFrequencyFilter:");
  v4 = v5;
  if (self->_operatingHoursRange)
  {
    objc_msgSend(v5, "setOperatingHoursRange:");
    v4 = v5;
  }

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOTraitsTransitScheduleModeFilter *highFrequencyFilter;
  GEOTraitsTransitScheduleModeFilter *lowFrequencyFilter;
  GEOTraitsTransitScheduleTimeRange *operatingHoursRange;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOTraitsTransitScheduleFilter readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         highFrequencyFilter = self->_highFrequencyFilter,
         !((unint64_t)highFrequencyFilter | v4[3]))
     || -[GEOTraitsTransitScheduleModeFilter isEqual:](highFrequencyFilter, "isEqual:"))
    && ((lowFrequencyFilter = self->_lowFrequencyFilter, !((unint64_t)lowFrequencyFilter | v4[4]))
     || -[GEOTraitsTransitScheduleModeFilter isEqual:](lowFrequencyFilter, "isEqual:")))
  {
    operatingHoursRange = self->_operatingHoursRange;
    if ((unint64_t)operatingHoursRange | v4[5])
      v8 = -[GEOTraitsTransitScheduleTimeRange isEqual:](operatingHoursRange, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  -[GEOTraitsTransitScheduleFilter readAll:](self, "readAll:", 1);
  v3 = -[GEOTraitsTransitScheduleModeFilter hash](self->_highFrequencyFilter, "hash");
  v4 = -[GEOTraitsTransitScheduleModeFilter hash](self->_lowFrequencyFilter, "hash") ^ v3;
  return v4 ^ -[GEOTraitsTransitScheduleTimeRange hash](self->_operatingHoursRange, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOTraitsTransitScheduleModeFilter *highFrequencyFilter;
  uint64_t v5;
  GEOTraitsTransitScheduleModeFilter *lowFrequencyFilter;
  uint64_t v7;
  GEOTraitsTransitScheduleTimeRange *operatingHoursRange;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  highFrequencyFilter = self->_highFrequencyFilter;
  v5 = v10[3];
  if (highFrequencyFilter)
  {
    if (v5)
      -[GEOTraitsTransitScheduleModeFilter mergeFrom:](highFrequencyFilter, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOTraitsTransitScheduleFilter setHighFrequencyFilter:](self, "setHighFrequencyFilter:");
  }
  lowFrequencyFilter = self->_lowFrequencyFilter;
  v7 = v10[4];
  if (lowFrequencyFilter)
  {
    if (v7)
      -[GEOTraitsTransitScheduleModeFilter mergeFrom:](lowFrequencyFilter, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOTraitsTransitScheduleFilter setLowFrequencyFilter:](self, "setLowFrequencyFilter:");
  }
  operatingHoursRange = self->_operatingHoursRange;
  v9 = v10[5];
  if (operatingHoursRange)
  {
    if (v9)
      -[GEOTraitsTransitScheduleTimeRange mergeFrom:](operatingHoursRange, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOTraitsTransitScheduleFilter setOperatingHoursRange:](self, "setOperatingHoursRange:");
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
      GEOTraitsTransitScheduleFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3275);
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
  {
    -[GEOTraitsTransitScheduleFilter readAll:](self, "readAll:", 0);
    -[GEOTraitsTransitScheduleModeFilter clearUnknownFields:](self->_highFrequencyFilter, "clearUnknownFields:", 1);
    -[GEOTraitsTransitScheduleModeFilter clearUnknownFields:](self->_lowFrequencyFilter, "clearUnknownFields:", 1);
    -[GEOTraitsTransitScheduleTimeRange clearUnknownFields:](self->_operatingHoursRange, "clearUnknownFields:", 1);
  }
}

@end
