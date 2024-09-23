@implementation GEOPDDeparturePredicate

- (void)writeTo:(id)a3
{
  id v4;
  char flags;

  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterPlaceMark();
    GEOPDTimeRangeWriteTo((uint64_t)&self->_timeRange);
    PBDataWriterRecallMark();
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (unint64_t)hash
{
  char flags;
  uint64_t v4;
  uint64_t v5;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v4 = PBHashBytes();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v5 ^ v4;
  }
  v4 = 0;
  if ((flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_numAdditionalDepartures;
  return v5 ^ v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (GEOPDDeparturePredicate)initWithTraitsTransitModeFilter:(id)a3
{
  id v4;
  GEOPDDeparturePredicate *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  uint64_t v17;
  unsigned int v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOPDDeparturePredicate;
  v5 = -[GEOPDDeparturePredicate init](&v20, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "hasTimeRange"))
    {
      objc_msgSend(v4, "timeRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasStartTime");

      if (v7)
      {
        objc_msgSend(v4, "timeRange");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "startTime");
        v10 = v9;

        v11 = v10 << 32;
        v12 = 2;
      }
      else
      {
        v11 = 0;
        v12 = 0;
      }
      objc_msgSend(v4, "timeRange");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasDuration");

      if (v14)
      {
        objc_msgSend(v4, "timeRange");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "duration");
        v17 = v16;
        v12 |= 1u;

      }
      else
      {
        v17 = 0;
      }
      *(_BYTE *)&v5->_flags |= 1u;
      *(_QWORD *)&v5->_timeRange._duration = v17 | v11;
      v5->_timeRange._has = ($B85216D09A238EDB5177F50F3CAD2EB5)v12;
    }
    if (objc_msgSend(v4, "hasNumAdditionalDepartures"))
    {
      v18 = objc_msgSend(v4, "numAdditionalDepartures");
      *(_BYTE *)&v5->_flags |= 2u;
      v5->_numAdditionalDepartures = v18;
    }
  }

  return v5;
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
  v8.super_class = (Class)GEOPDDeparturePredicate;
  -[GEOPDDeparturePredicate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDeparturePredicate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDeparturePredicate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    if (a2)
      v6 = CFSTR("timeRange");
    else
      v6 = CFSTR("time_range");
    _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(a1 + 16), a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, v6);

    v5 = *(_BYTE *)(a1 + 32);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("numAdditionalDepartures");
    else
      v9 = CFSTR("num_additional_departures");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  v10 = *(void **)(a1 + 8);
  if (v10)
  {
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __53__GEOPDDeparturePredicate__dictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E1C00600;
      v14 = v13;
      v18 = v14;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
      v15 = v14;

      v12 = v15;
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDDeparturePredicate _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPDDeparturePredicate__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  void *v12;
  int v13;
  uint64_t v15;
  int v16;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("timeRange");
    else
      v7 = CFSTR("time_range");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 0;
      v15 = 0;
      _GEOPDTimeRangeFromDictionaryRepresentation(v8, (uint64_t)&v15, a3);
      v9 = v15;
      *(_BYTE *)(v6 + 32) |= 1u;
      v10 = v16;
      *(_QWORD *)(v6 + 16) = v9;
      *(_DWORD *)(v6 + 24) = v10;
    }

    if (a3)
      v11 = CFSTR("numAdditionalDepartures");
    else
      v11 = CFSTR("num_additional_departures");
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "unsignedIntValue");
      *(_BYTE *)(v6 + 32) |= 2u;
      *(_DWORD *)(v6 + 28) = v13;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDeparturePredicateReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;
  $B85216D09A238EDB5177F50F3CAD2EB5 has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    has = self->_timeRange._has;
    *(_QWORD *)(v4 + 16) = *(_QWORD *)&self->_timeRange._duration;
    *($B85216D09A238EDB5177F50F3CAD2EB5 *)(v4 + 24) = has;
    *(_BYTE *)(v4 + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 28) = self->_numAdditionalDepartures;
    *(_BYTE *)(v4 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int *v4;
  BOOL v6;

  v4 = (unsigned int *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[8] & 1) == 0)
      goto LABEL_15;
    if (*(_QWORD *)&self->_timeRange._duration != *((_QWORD *)v4 + 2)
      || *(_DWORD *)&self->_timeRange._has != (unint64_t)v4[6])
    {
      goto LABEL_15;
    }
  }
  else if ((v4[8] & 1) != 0)
  {
LABEL_15:
    v6 = 0;
    goto LABEL_16;
  }
  v6 = (v4[8] & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[8] & 2) == 0 || self->_numAdditionalDepartures != v4[7])
      goto LABEL_15;
    v6 = 1;
  }
LABEL_16:

  return v6;
}

@end
