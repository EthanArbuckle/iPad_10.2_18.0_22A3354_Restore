@implementation GEOPDPlaceSummaryFormat

- (GEOMapItemIdentifier)tappableEntryIdentifier
{
  void *v3;
  GEOMapItemIdentifier *v4;
  void *v5;
  GEOMapItemIdentifier *v6;

  -[GEOPDPlaceSummaryFormat tapPlaceId](self, "tapPlaceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [GEOMapItemIdentifier alloc];
    -[GEOPDPlaceSummaryFormat tapPlaceId](self, "tapPlaceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v4, "initWithMapsIdentifier:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int)formatType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_formatType;
  else
    return 0;
}

- (void)setFormatType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_formatType = a3;
}

- (void)setHasFormatType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasFormatType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)formatTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0E2E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFormatType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_BOLD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_ITALICS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_startIndex = a3;
}

- (void)setHasStartIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasStartIndex
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_endIndex = a3;
}

- (void)setHasEndIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEndIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasTapPlaceId
{
  return self->_tapPlaceId != 0;
}

- (GEOPDMapsIdentifier)tapPlaceId
{
  return self->_tapPlaceId;
}

- (void)setTapPlaceId:(id)a3
{
  objc_storeStrong((id *)&self->_tapPlaceId, a3);
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
  v8.super_class = (Class)GEOPDPlaceSummaryFormat;
  -[GEOPDPlaceSummaryFormat description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceSummaryFormat dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryFormat _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 28);
    if ((v5 & 2) != 0)
    {
      v6 = *(int *)(a1 + 20);
      if (v6 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C0E2E0[v6];
      }
      if (a2)
        v8 = CFSTR("formatType");
      else
        v8 = CFSTR("format_type");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

      v5 = *(_BYTE *)(a1 + 28);
    }
    if ((v5 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v10 = CFSTR("startIndex");
      else
        v10 = CFSTR("start_index");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

      v5 = *(_BYTE *)(a1 + 28);
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v12 = CFSTR("endIndex");
      else
        v12 = CFSTR("end_index");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend((id)a1, "tapPlaceId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v13, "jsonRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("tapPlaceId");
      }
      else
      {
        objc_msgSend(v13, "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("tap_place_id");
      }
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceSummaryFormat _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryFormat)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryFormat *)-[GEOPDPlaceSummaryFormat _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOPDMapsIdentifier *v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  if (!a1)
    goto LABEL_41;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_41;
  if (a3)
    v6 = CFSTR("formatType");
  else
    v6 = CFSTR("format_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_BOLD")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_ITALICS")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH")) & 1) != 0)
    {
      v9 = 3;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY")))
    {
      v9 = 4;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_21:
    objc_msgSend(a1, "setFormatType:", v9);
  }

  if (a3)
    v10 = CFSTR("startIndex");
  else
    v10 = CFSTR("start_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStartIndex:", objc_msgSend(v11, "unsignedIntValue"));

  if (a3)
    v12 = CFSTR("endIndex");
  else
    v12 = CFSTR("end_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEndIndex:", objc_msgSend(v13, "unsignedIntValue"));

  if (a3)
    v14 = CFSTR("tapPlaceId");
  else
    v14 = CFSTR("tap_place_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v17 = -[GEOPDMapsIdentifier initWithJSON:](v16, "initWithJSON:", v15);
    else
      v17 = -[GEOPDMapsIdentifier initWithDictionary:](v16, "initWithDictionary:", v15);
    v18 = (void *)v17;
    objc_msgSend(a1, "setTapPlaceId:", v17);

  }
LABEL_41:

  return a1;
}

- (GEOPDPlaceSummaryFormat)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryFormat *)-[GEOPDPlaceSummaryFormat _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryFormatIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryFormatReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_tapPlaceId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_tapPlaceId, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOPDPlaceSummaryFormat readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_formatType;
    *((_BYTE *)v6 + 28) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 6) = self->_startIndex;
  *((_BYTE *)v6 + 28) |= 4u;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 4) = self->_endIndex;
    *((_BYTE *)v6 + 28) |= 1u;
  }
LABEL_5:
  if (self->_tapPlaceId)
  {
    objc_msgSend(v6, "setTapPlaceId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 24) = self->_startIndex;
    *(_BYTE *)(v5 + 28) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 20) = self->_formatType;
  *(_BYTE *)(v5 + 28) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_endIndex;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
LABEL_5:
  v8 = -[GEOPDMapsIdentifier copyWithZone:](self->_tapPlaceId, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDMapsIdentifier *tapPlaceId;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOPDPlaceSummaryFormat readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_formatType != *((_DWORD *)v4 + 5))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_startIndex != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_endIndex != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_19;
  }
  tapPlaceId = self->_tapPlaceId;
  if ((unint64_t)tapPlaceId | *((_QWORD *)v4 + 1))
    v6 = -[GEOPDMapsIdentifier isEqual:](tapPlaceId, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOPDPlaceSummaryFormat readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[GEOPDMapsIdentifier hash](self->_tapPlaceId, "hash");
  }
  v3 = 2654435761 * self->_formatType;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_startIndex;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_endIndex;
  return v4 ^ v3 ^ v5 ^ -[GEOPDMapsIdentifier hash](self->_tapPlaceId, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  char v5;
  GEOPDMapsIdentifier *tapPlaceId;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 28);
  if ((v5 & 2) != 0)
  {
    self->_formatType = *((_DWORD *)v8 + 5);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v8 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v8 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_startIndex = *((_DWORD *)v8 + 6);
  *(_BYTE *)&self->_flags |= 4u;
  if ((*((_BYTE *)v8 + 28) & 1) != 0)
  {
LABEL_4:
    self->_endIndex = *((_DWORD *)v8 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:
  tapPlaceId = self->_tapPlaceId;
  v7 = *((_QWORD *)v8 + 1);
  if (tapPlaceId)
  {
    if (v7)
    {
      -[GEOPDMapsIdentifier mergeFrom:](tapPlaceId, "mergeFrom:");
LABEL_13:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEOPDPlaceSummaryFormat setTapPlaceId:](self, "setTapPlaceId:");
    goto LABEL_13;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapPlaceId, 0);
}

@end
