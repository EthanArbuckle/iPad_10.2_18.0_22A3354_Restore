@implementation GEOPDDateTimeRange

- (void)dealloc
{
  objc_super v3;

  if (self)
  {
    self->_timeRangesSpace = 0;
    self->_timeRangesCount = 0;
    free(self->_timeRanges);
    self->_timeRanges = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPDDateTimeRange;
  -[GEOPDDateTimeRange dealloc](&v3, sel_dealloc);
}

- (uint64_t)_reserveTimeRanges:(uint64_t)result
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (result)
  {
    v2 = (_QWORD *)result;
    v3 = *(_QWORD *)(result + 24);
    v4 = v3 + a2;
    if (v3 + a2 <= v3)
      return 0;
    v5 = *(_QWORD *)(result + 32);
    if (v5 >= v4)
      return 1;
    v6 = v5 + a2;
    if (v5 + a2)
    {
      v7 = 1;
      while (1)
      {
        v8 = v7;
        if (v7 >= v6)
          break;
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    if (v8 < a2)
      return 0;
LABEL_11:
    if (12 * v8 < v8)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 16), 12 * v8, 0x33AC38B2uLL);
    if (result)
    {
      v2[4] = v8;
      v2[2] = result;
      bzero((void *)(result + 12 * v2[3]), 12 * (v8 - v2[3]));
      return 1;
    }
  }
  return result;
}

- (uint64_t)timeRangeAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 24);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(_QWORD *)(*(_QWORD *)(v3 + 16) + 12 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOPDDateTimeRange;
  -[GEOPDDateTimeRange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDateTimeRange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDateTimeRange _dictionaryRepresentation:]((uint64_t)self, 0);
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
  uint64_t v11;
  unint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("startDate");
    else
      v7 = CFSTR("start_date");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 56);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("endDate");
    else
      v9 = CFSTR("end_date");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 24));
    if (*(_QWORD *)(a1 + 24))
    {
      v11 = 0;
      v12 = 0;
      do
      {
        _GEOWiFiQualityTimeRangeDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 16) + v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v13);

        ++v12;
        v11 += 12;
      }
      while (v12 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v14 = CFSTR("timeRange");
    else
      v14 = CFSTR("time_range");
    objc_msgSend(v4, "setObject:forKey:", v10, v14);

  }
  v15 = *(void **)(a1 + 8);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __48__GEOPDDateTimeRange__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDDateTimeRange _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDDateTimeRange__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  void *v25;
  id v26;
  uint64_t v27;
  int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("startDate");
    else
      v7 = CFSTR("start_date");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "unsignedLongLongValue");
      *(_BYTE *)(v6 + 56) |= 2u;
      *(_QWORD *)(v6 + 48) = v9;
    }

    if (a3)
      v10 = CFSTR("endDate");
    else
      v10 = CFSTR("end_date");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "unsignedLongLongValue");
      *(_BYTE *)(v6 + 56) |= 1u;
      *(_QWORD *)(v6 + 40) = v12;
    }

    if (a3)
      v13 = CFSTR("timeRange");
    else
      v13 = CFSTR("time_range");
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v14;
      v26 = v5;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = 0;
              v27 = 0;
              _GEOWiFiQualityTimeRangeFromDictionaryRepresentation(v20, (uint64_t)&v27);
              v21 = v27;
              v22 = v28;
              if (-[GEOPDDateTimeRange _reserveTimeRanges:](v6, 1uLL))
              {
                v23 = *(_QWORD *)(v6 + 16) + 12 * *(_QWORD *)(v6 + 24);
                *(_QWORD *)v23 = v21;
                *(_DWORD *)(v23 + 8) = v22;
                ++*(_QWORD *)(v6 + 24);
              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v17);
      }

      v14 = v25;
      v5 = v26;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDateTimeRangeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_timeRangesCount)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOPDLocalTimeRangeWriteTo((uint64_t)&self->_timeRanges[v6]);
      PBDataWriterRecallMark();
      ++v7;
      ++v6;
    }
    while (v7 < self->_timeRangesCount);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  char flags;
  unint64_t timeRangesCount;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v4 + 48) = self->_startDate;
    *(_BYTE *)(v4 + 56) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v4 + 40) = self->_endDate;
    *(_BYTE *)(v4 + 56) |= 1u;
  }
  timeRangesCount = self->_timeRangesCount;
  if (timeRangesCount)
  {
    -[GEOPDDateTimeRange _reserveTimeRanges:](v4, timeRangesCount);
    memcpy(*(void **)(v5 + 16), self->_timeRanges, 12 * self->_timeRangesCount);
    *(_QWORD *)(v5 + 24) = self->_timeRangesCount;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t timeRangesCount;
  BOOL v6;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if (((_BYTE)v4[7] & 2) == 0 || (const void *)self->_startDate != v4[6])
      goto LABEL_14;
  }
  else if (((_BYTE)v4[7] & 2) != 0)
  {
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if (((_BYTE)v4[7] & 1) == 0 || (const void *)self->_endDate != v4[5])
      goto LABEL_14;
  }
  else if (((_BYTE)v4[7] & 1) != 0)
  {
    goto LABEL_14;
  }
  timeRangesCount = self->_timeRangesCount;
  if ((const void *)timeRangesCount != v4[3])
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  v6 = memcmp(self->_timeRanges, v4[2], 12 * timeRangesCount) == 0;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v2 = 2654435761u * self->_startDate;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ PBHashBytes();
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761u * self->_endDate;
  return v3 ^ v2 ^ PBHashBytes();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (BOOL)hasValidStartAndEndDates
{
  if (self)
    LOBYTE(self) = (~*(_BYTE *)&self->_flags & 3) == 0 && self->_startDate <= self->_endDate;
  return (char)self;
}

@end
