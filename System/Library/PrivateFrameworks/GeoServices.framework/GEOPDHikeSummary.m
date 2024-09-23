@implementation GEOPDHikeSummary

+ (GEOPDHikeSummary)hikeSummaryWithPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__GEOPDHikeSummary_PlaceDataExtras__hikeSummaryWithPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 105, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDHikeSummary *)v4;
}

void __62__GEOPDHikeSummary_PlaceDataExtras__hikeSummaryWithPlaceData___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  -[GEOPDComponentValue hikeSummary](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);
    v5 = v6;
    *a3 = 1;
  }

}

- (unsigned)lengthMeters
{
  return self->_lengthMeters;
}

- (void)setLengthMeters:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_lengthMeters = a3;
}

- (void)setHasLengthMeters:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLengthMeters
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)expectedDurationSeconds
{
  return self->_expectedDurationSeconds;
}

- (void)setExpectedDurationSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_expectedDurationSeconds = a3;
}

- (void)setHasExpectedDurationSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasExpectedDurationSeconds
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)sumElevationGainCm
{
  return self->_sumElevationGainCm;
}

- (void)setSumElevationGainCm:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_sumElevationGainCm = a3;
}

- (void)setHasSumElevationGainCm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSumElevationGainCm
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)sumElevationLossCm
{
  return self->_sumElevationLossCm;
}

- (void)setSumElevationLossCm:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_sumElevationLossCm = a3;
}

- (void)setHasSumElevationLossCm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasSumElevationLossCm
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)hasHikeTypeName
{
  return self->_hikeTypeName != 0;
}

- (GEOFormattedString)hikeTypeName
{
  return self->_hikeTypeName;
}

- (void)setHikeTypeName:(id)a3
{
  objc_storeStrong((id *)&self->_hikeTypeName, a3);
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
  v8.super_class = (Class)GEOPDHikeSummary;
  -[GEOPDHikeSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDHikeSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDHikeSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 40);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("lengthMeters");
    else
      v13 = CFSTR("length_meters");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

    v5 = *(_BYTE *)(a1 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0)
        goto LABEL_5;
LABEL_21:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v17 = CFSTR("sumElevationGainCm");
      else
        v17 = CFSTR("sum_elevation_gain_cm");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

      if ((*(_BYTE *)(a1 + 40) & 8) == 0)
        goto LABEL_10;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)(a1 + 40) & 1) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("expectedDurationSeconds");
  else
    v15 = CFSTR("expected_duration_seconds");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  v5 = *(_BYTE *)(a1 + 40);
  if ((v5 & 4) != 0)
    goto LABEL_21;
LABEL_5:
  if ((v5 & 8) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 36));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("sumElevationLossCm");
    else
      v7 = CFSTR("sum_elevation_loss_cm");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_10:
  objc_msgSend((id)a1, "hikeTypeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("hikeTypeName");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("hike_type_name");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v18 = *(void **)(a1 + 8);
  if (v18)
  {
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __46__GEOPDHikeSummary__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v22 = v21;
      v26 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
      v23 = v22;

      v20 = v23;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDHikeSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPDHikeSummary__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDHikeSummary)initWithDictionary:(id)a3
{
  return (GEOPDHikeSummary *)-[GEOPDHikeSummary _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOFormattedString *v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("lengthMeters");
      else
        v6 = CFSTR("length_meters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLengthMeters:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("expectedDurationSeconds");
      else
        v8 = CFSTR("expected_duration_seconds");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setExpectedDurationSeconds:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("sumElevationGainCm");
      else
        v10 = CFSTR("sum_elevation_gain_cm");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSumElevationGainCm:", objc_msgSend(v11, "unsignedIntValue"));

      if (a3)
        v12 = CFSTR("sumElevationLossCm");
      else
        v12 = CFSTR("sum_elevation_loss_cm");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSumElevationLossCm:", objc_msgSend(v13, "unsignedIntValue"));

      if (a3)
        v14 = CFSTR("hikeTypeName");
      else
        v14 = CFSTR("hike_type_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOFormattedString initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOFormattedString initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setHikeTypeName:", v17);

      }
    }
  }

  return a1;
}

- (GEOPDHikeSummary)initWithJSON:(id)a3
{
  return (GEOPDHikeSummary *)-[GEOPDHikeSummary _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDHikeSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDHikeSummaryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_5:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_6:
  if (self->_hikeTypeName)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOPDHikeSummary readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_lengthMeters;
    *((_BYTE *)v6 + 40) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 6) = self->_expectedDurationSeconds;
  *((_BYTE *)v6 + 40) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  *((_DWORD *)v6 + 8) = self->_sumElevationGainCm;
  *((_BYTE *)v6 + 40) |= 4u;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v6 + 9) = self->_sumElevationLossCm;
    *((_BYTE *)v6 + 40) |= 8u;
  }
LABEL_6:
  if (self->_hikeTypeName)
  {
    objc_msgSend(v6, "setHikeTypeName:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_lengthMeters;
    *(_BYTE *)(v5 + 40) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 32) = self->_sumElevationGainCm;
      *(_BYTE *)(v5 + 40) |= 4u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_expectedDurationSeconds;
  *(_BYTE *)(v5 + 40) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 36) = self->_sumElevationLossCm;
    *(_BYTE *)(v5 + 40) |= 8u;
  }
LABEL_6:
  v8 = -[GEOFormattedString copyWithZone:](self->_hikeTypeName, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOFormattedString *hikeTypeName;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOPDHikeSummary readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_lengthMeters != *((_DWORD *)v4 + 7))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_24:
    v6 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_expectedDurationSeconds != *((_DWORD *)v4 + 6))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_sumElevationGainCm != *((_DWORD *)v4 + 8))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_sumElevationLossCm != *((_DWORD *)v4 + 9))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_24;
  }
  hikeTypeName = self->_hikeTypeName;
  if ((unint64_t)hikeTypeName | *((_QWORD *)v4 + 2))
    v6 = -[GEOFormattedString isEqual:](hikeTypeName, "isEqual:");
  else
    v6 = 1;
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPDHikeSummary readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_lengthMeters;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_expectedDurationSeconds;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ -[GEOFormattedString hash](self->_hikeTypeName, "hash");
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_sumElevationGainCm;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_sumElevationLossCm;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[GEOFormattedString hash](self->_hikeTypeName, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  char v5;
  GEOFormattedString *hikeTypeName;
  uint64_t v7;
  unsigned int *v8;

  v8 = (unsigned int *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 40);
  if ((v5 & 2) != 0)
  {
    self->_lengthMeters = v8[7];
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v8 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((v8[10] & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_expectedDurationSeconds = v8[6];
  *(_BYTE *)&self->_flags |= 1u;
  v5 = *((_BYTE *)v8 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_sumElevationGainCm = v8[8];
  *(_BYTE *)&self->_flags |= 4u;
  if ((v8[10] & 8) != 0)
  {
LABEL_5:
    self->_sumElevationLossCm = v8[9];
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_6:
  hikeTypeName = self->_hikeTypeName;
  v7 = *((_QWORD *)v8 + 2);
  if (hikeTypeName)
  {
    if (v7)
    {
      -[GEOFormattedString mergeFrom:](hikeTypeName, "mergeFrom:");
LABEL_15:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEOPDHikeSummary setHikeTypeName:](self, "setHikeTypeName:");
    goto LABEL_15;
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
    -[GEOPDHikeSummary readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_hikeTypeName, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hikeTypeName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
