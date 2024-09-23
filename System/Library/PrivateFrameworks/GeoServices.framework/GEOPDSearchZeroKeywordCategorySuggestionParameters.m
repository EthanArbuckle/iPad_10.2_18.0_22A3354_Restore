@implementation GEOPDSearchZeroKeywordCategorySuggestionParameters

- (void)setSignificantLocation:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);

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
  v8.super_class = (Class)GEOPDSearchZeroKeywordCategorySuggestionParameters;
  -[GEOPDSearchZeroKeywordCategorySuggestionParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchZeroKeywordCategorySuggestionParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchZeroKeywordCategorySuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  char v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  __CFString *v24;
  const __CFString *v25;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("requestLocalTimestamp");
    else
      v6 = CFSTR("request_local_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  v7 = *(id *)(a1 + 24);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("significantLocation");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("significant_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  v11 = *(_BYTE *)(a1 + 44);
  if ((v11 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 44) & 4) == 0)
      goto LABEL_14;
LABEL_29:
    v23 = *(int *)(a1 + 36);
    if (v23 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 36));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E1C05158[v23];
    }
    if (a2)
      v25 = CFSTR("userPreferredTransportType");
    else
      v25 = CFSTR("user_preferred_transport_type");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    if ((*(_BYTE *)(a1 + 44) & 8) == 0)
      goto LABEL_19;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("maxNumCategoriesPerEntry");
  else
    v22 = CFSTR("max_num_categories_per_entry");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v11 = *(_BYTE *)(a1 + 44);
  if ((v11 & 4) != 0)
    goto LABEL_29;
LABEL_14:
  if ((v11 & 8) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("shouldMatchNoQueryStateSuggestions");
    else
      v13 = CFSTR("should_match_no_query_state_suggestions");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
LABEL_19:
  v14 = *(void **)(a1 + 8);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __80__GEOPDSearchZeroKeywordCategorySuggestionParameters__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v18 = v17;
      v27 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v26);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchZeroKeywordCategorySuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __80__GEOPDSearchZeroKeywordCategorySuggestionParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDSearchZeroKeywordCategorySuggestionParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_significantLocation)
    PBDataWriterWriteSubmessage();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((flags & 8) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_requestLocalTimestamp;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v7 = -[GEOLatLng copyWithZone:](self->_significantLocation, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v6 + 36) = self->_userPreferredTransportType;
    *(_BYTE *)(v6 + 44) |= 4u;
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 32) = self->_maxNumCategoriesPerEntry;
  *(_BYTE *)(v6 + 44) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 8) != 0)
  {
LABEL_6:
    *(_BYTE *)(v6 + 40) = self->_shouldMatchNoQueryStateSuggestions;
    *(_BYTE *)(v6 + 44) |= 8u;
  }
LABEL_7:
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOLatLng *significantLocation;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 44);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_requestLocalTimestamp != *((double *)v4 + 2))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_22;
  }
  significantLocation = self->_significantLocation;
  if ((unint64_t)significantLocation | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](significantLocation, "isEqual:"))
      goto LABEL_22;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_maxNumCategoriesPerEntry != *((_DWORD *)v4 + 8))
      goto LABEL_22;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_userPreferredTransportType != *((_DWORD *)v4 + 9))
      goto LABEL_22;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_22;
  }
  v8 = (v6 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) != 0)
    {
      if (self->_shouldMatchNoQueryStateSuggestions)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_22;
      }
      else if (*((_BYTE *)v4 + 40))
      {
        goto LABEL_22;
      }
      v8 = 1;
      goto LABEL_23;
    }
LABEL_22:
    v8 = 0;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  double requestLocalTimestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    requestLocalTimestamp = self->_requestLocalTimestamp;
    v5 = -requestLocalTimestamp;
    if (requestLocalTimestamp >= 0.0)
      v5 = self->_requestLocalTimestamp;
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
  v8 = -[GEOLatLng hash](self->_significantLocation, "hash");
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_12;
LABEL_15:
    v11 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ v11;
  }
  v9 = 2654435761 * self->_maxNumCategoriesPerEntry;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761 * self->_userPreferredTransportType;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_15;
LABEL_12:
  v11 = 2654435761 * self->_shouldMatchNoQueryStateSuggestions;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantLocation, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
