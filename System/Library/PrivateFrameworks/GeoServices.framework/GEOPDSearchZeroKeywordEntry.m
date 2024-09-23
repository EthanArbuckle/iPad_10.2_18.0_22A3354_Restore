@implementation GEOPDSearchZeroKeywordEntry

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchZeroKeywordEntry;
  -[GEOPDSearchZeroKeywordEntry dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)GEOPDSearchZeroKeywordEntry;
  -[GEOPDSearchZeroKeywordEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchZeroKeywordEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchZeroKeywordEntry _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("dayOfWeek");
    else
      v7 = CFSTR("day_of_week");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 48);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("hourOfDay");
    else
      v9 = CFSTR("hour_of_day");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt32NSArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("categoryIndex");
    else
      v11 = CFSTR("category_index");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v12 = *(void **)(a1 + 8);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __57__GEOPDSearchZeroKeywordEntry__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchZeroKeywordEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPDSearchZeroKeywordEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchZeroKeywordEntryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  unint64_t v6;
  id v7;

  v4 = a3;
  flags = (char)self->_flags;
  v7 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
  if (self->_categoryIndexs.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < self->_categoryIndexs.count);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 40) = self->_dayOfWeek;
    *(_BYTE *)(v4 + 48) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 44) = self->_hourOfDay;
    *(_BYTE *)(v4 + 48) |= 2u;
  }
  PBRepeatedUInt32Copy();
  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 10))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_13:
    IsEqual = 0;
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_hourOfDay != *((_DWORD *)v4 + 11))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_13;
  }
  IsEqual = PBRepeatedUInt32IsEqual();
LABEL_14:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v2 = 2654435761 * self->_dayOfWeek;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ PBRepeatedUInt32Hash();
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_hourOfDay;
  return v3 ^ v2 ^ PBRepeatedUInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
