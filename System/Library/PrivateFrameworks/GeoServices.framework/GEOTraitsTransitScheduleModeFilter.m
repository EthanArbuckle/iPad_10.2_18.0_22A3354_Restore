@implementation GEOTraitsTransitScheduleModeFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)setNumAdditionalDepartures:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_numAdditionalDepartures = a3;
}

- (void)configureWithDefaultStartTime:(double)a3 duration:(double)a4 numAdditionalDepartures:(unsigned int)a5
{
  uint64_t v5;
  GEOTraitsTransitScheduleTimeRange *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;

  v5 = *(_QWORD *)&a5;
  if (!-[GEOTraitsTransitScheduleModeFilter hasTimeRange](self, "hasTimeRange"))
  {
    v9 = objc_alloc_init(GEOTraitsTransitScheduleTimeRange);
    -[GEOTraitsTransitScheduleModeFilter setTimeRange:](self, "setTimeRange:", v9);

  }
  -[GEOTraitsTransitScheduleModeFilter timeRange](self, "timeRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasStartTime");

  if ((v11 & 1) == 0)
  {
    -[GEOTraitsTransitScheduleModeFilter timeRange](self, "timeRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStartTime:", a3);

  }
  -[GEOTraitsTransitScheduleModeFilter timeRange](self, "timeRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasDuration");

  if ((v14 & 1) == 0)
  {
    -[GEOTraitsTransitScheduleModeFilter timeRange](self, "timeRange");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDuration:", a4);

  }
  if (!-[GEOTraitsTransitScheduleModeFilter hasNumAdditionalDepartures](self, "hasNumAdditionalDepartures"))
    -[GEOTraitsTransitScheduleModeFilter setNumAdditionalDepartures:](self, "setNumAdditionalDepartures:", v5);
}

- (GEOTraitsTransitScheduleTimeRange)timeRange
{
  return self->_timeRange;
}

- (BOOL)hasTimeRange
{
  return self->_timeRange != 0;
}

- (BOOL)hasNumAdditionalDepartures
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (unsigned)numAdditionalDepartures
{
  return self->_numAdditionalDepartures;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_timeRange)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOTraitsTransitScheduleTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_numAdditionalDepartures;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (void)setHasNumAdditionalDepartures:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
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
  v8.super_class = (Class)GEOTraitsTransitScheduleModeFilter;
  -[GEOTraitsTransitScheduleModeFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTraitsTransitScheduleModeFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTraitsTransitScheduleModeFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
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
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "timeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("timeRange");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("time_range");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("numAdditionalDepartures");
    else
      v10 = CFSTR("num_additional_departures");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  v11 = *(void **)(a1 + 8);
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
      v18[2] = __64__GEOTraitsTransitScheduleModeFilter__dictionaryRepresentation___block_invoke;
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
  return -[GEOTraitsTransitScheduleModeFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __64__GEOTraitsTransitScheduleModeFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTraitsTransitScheduleModeFilter)initWithDictionary:(id)a3
{
  return (GEOTraitsTransitScheduleModeFilter *)-[GEOTraitsTransitScheduleModeFilter _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOTraitsTransitScheduleTimeRange *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("timeRange");
      else
        v6 = CFSTR("time_range");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOTraitsTransitScheduleTimeRange alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOTraitsTransitScheduleTimeRange initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOTraitsTransitScheduleTimeRange initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setTimeRange:", v9);

      }
      if (a3)
        v11 = CFSTR("numAdditionalDepartures");
      else
        v11 = CFSTR("num_additional_departures");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNumAdditionalDepartures:", objc_msgSend(v12, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOTraitsTransitScheduleModeFilter)initWithJSON:(id)a3
{
  return (GEOTraitsTransitScheduleModeFilter *)-[GEOTraitsTransitScheduleModeFilter _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTraitsTransitScheduleModeFilterIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTraitsTransitScheduleModeFilterReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTraitsTransitScheduleModeFilter readAll:](self, "readAll:", 0);
  if (self->_timeRange)
    objc_msgSend(v4, "setTimeRange:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_numAdditionalDepartures;
    *((_BYTE *)v4 + 28) |= 1u;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOTraitsTransitScheduleTimeRange *timeRange;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOTraitsTransitScheduleModeFilter readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  timeRange = self->_timeRange;
  if ((unint64_t)timeRange | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOTraitsTransitScheduleTimeRange isEqual:](timeRange, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_numAdditionalDepartures == *((_DWORD *)v4 + 6))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  -[GEOTraitsTransitScheduleModeFilter readAll:](self, "readAll:", 1);
  v3 = -[GEOTraitsTransitScheduleTimeRange hash](self->_timeRange, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_numAdditionalDepartures;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOTraitsTransitScheduleTimeRange *timeRange;
  uint64_t v5;
  unsigned int *v6;

  v6 = (unsigned int *)a3;
  objc_msgSend(v6, "readAll:", 0);
  timeRange = self->_timeRange;
  v5 = *((_QWORD *)v6 + 2);
  if (timeRange)
  {
    if (v5)
      -[GEOTraitsTransitScheduleTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOTraitsTransitScheduleModeFilter setTimeRange:](self, "setTimeRange:");
  }
  if ((v6[7] & 1) != 0)
  {
    self->_numAdditionalDepartures = v6[6];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTraitsTransitScheduleModeFilter readAll:](self, "readAll:", 0);
    -[GEOTraitsTransitScheduleTimeRange clearUnknownFields:](self->_timeRange, "clearUnknownFields:", 1);
  }
}

@end
