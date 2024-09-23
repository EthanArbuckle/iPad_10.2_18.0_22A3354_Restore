@implementation GEOPDResultRefinementMetadataSort

- (int)sortType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_sortType;
  else
    return 0;
}

- (void)setSortType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_sortType = a3;
}

- (void)setHasSortType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSortType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)sortTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0DDA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSortType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_SORT_TYPE_DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_SORT_TYPE_RATINGS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_SORT_TYPE_DISTANCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_SORT_TYPE_CUSTOM")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCustomSortFunctionIdentifier
{
  return self->_customSortFunctionIdentifier != 0;
}

- (NSString)customSortFunctionIdentifier
{
  return self->_customSortFunctionIdentifier;
}

- (void)setCustomSortFunctionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_customSortFunctionIdentifier, a3);
}

- (unsigned)selectionFromQuerySequenceNumber
{
  return self->_selectionFromQuerySequenceNumber;
}

- (void)setSelectionFromQuerySequenceNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_selectionFromQuerySequenceNumber = a3;
}

- (void)setHasSelectionFromQuerySequenceNumber:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSelectionFromQuerySequenceNumber
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)selectionFromQuery
{
  return self->_selectionFromQuery;
}

- (void)setSelectionFromQuery:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_selectionFromQuery = a3;
}

- (void)setHasSelectionFromQuery:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasSelectionFromQuery
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)serverOverriddenPosition
{
  return self->_serverOverriddenPosition;
}

- (void)setServerOverriddenPosition:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_serverOverriddenPosition = a3;
}

- (void)setHasServerOverriddenPosition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasServerOverriddenPosition
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)enableServerOverriddenPositioning
{
  return self->_enableServerOverriddenPositioning;
}

- (void)setEnableServerOverriddenPositioning:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_enableServerOverriddenPositioning = a3;
}

- (void)setHasEnableServerOverriddenPositioning:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasEnableServerOverriddenPositioning
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOPDResultRefinementMetadataSort;
  -[GEOPDResultRefinementMetadataSort description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMetadataSort dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementMetadataSort _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  char v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 40) & 4) != 0)
  {
    v5 = *(int *)(a1 + 32);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0DDA0[v5];
    }
    if (a2)
      v7 = CFSTR("sortType");
    else
      v7 = CFSTR("sort_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "customSortFunctionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("customSortFunctionIdentifier");
    else
      v9 = CFSTR("custom_sort_function_identifier");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  v10 = *(_BYTE *)(a1 + 40);
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("selectionFromQuerySequenceNumber");
    else
      v21 = CFSTR("selection_from_query_sequence_number");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

    v10 = *(_BYTE *)(a1 + 40);
    if ((v10 & 0x10) == 0)
    {
LABEL_17:
      if ((v10 & 2) == 0)
        goto LABEL_18;
LABEL_37:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v25 = CFSTR("serverOverriddenPosition");
      else
        v25 = CFSTR("server_overridden_position");
      objc_msgSend(v4, "setObject:forKey:", v24, v25);

      if ((*(_BYTE *)(a1 + 40) & 8) == 0)
        goto LABEL_23;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)(a1 + 40) & 0x10) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 37));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("selectionFromQuery");
  else
    v23 = CFSTR("selection_from_query");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v10 = *(_BYTE *)(a1 + 40);
  if ((v10 & 2) != 0)
    goto LABEL_37;
LABEL_18:
  if ((v10 & 8) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 36));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("enableServerOverriddenPositioning");
    else
      v12 = CFSTR("enable_server_overridden_positioning");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
LABEL_23:
  v13 = *(void **)(a1 + 8);
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __63__GEOPDResultRefinementMetadataSort__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v17 = v16;
      v27 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v26);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementMetadataSort _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEOPDResultRefinementMetadataSort__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDResultRefinementMetadataSort)initWithDictionary:(id)a3
{
  return (GEOPDResultRefinementMetadataSort *)-[GEOPDResultRefinementMetadataSort _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;

  v5 = a2;
  if (!a1)
    goto LABEL_46;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_46;
  if (a3)
    v6 = CFSTR("sortType");
  else
    v6 = CFSTR("sort_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESULT_REFINEMENT_SORT_TYPE_DEFAULT")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESULT_REFINEMENT_SORT_TYPE_RATINGS")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESULT_REFINEMENT_SORT_TYPE_DISTANCE")) & 1) != 0)
    {
      v9 = 2;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("RESULT_REFINEMENT_SORT_TYPE_CUSTOM")))
    {
      v9 = 3;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_19:
    objc_msgSend(a1, "setSortType:", v9);
  }

  if (a3)
    v10 = CFSTR("customSortFunctionIdentifier");
  else
    v10 = CFSTR("custom_sort_function_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(a1, "setCustomSortFunctionIdentifier:", v12);

  }
  if (a3)
    v13 = CFSTR("selectionFromQuerySequenceNumber");
  else
    v13 = CFSTR("selection_from_query_sequence_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSelectionFromQuerySequenceNumber:", objc_msgSend(v14, "unsignedIntValue"));

  if (a3)
    v15 = CFSTR("selectionFromQuery");
  else
    v15 = CFSTR("selection_from_query");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSelectionFromQuery:", objc_msgSend(v16, "BOOLValue"));

  if (a3)
    v17 = CFSTR("serverOverriddenPosition");
  else
    v17 = CFSTR("server_overridden_position");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setServerOverriddenPosition:", objc_msgSend(v18, "unsignedIntValue"));

  if (a3)
    v19 = CFSTR("enableServerOverriddenPositioning");
  else
    v19 = CFSTR("enable_server_overridden_positioning");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEnableServerOverriddenPositioning:", objc_msgSend(v20, "BOOLValue"));

LABEL_46:
  return a1;
}

- (GEOPDResultRefinementMetadataSort)initWithJSON:(id)a3
{
  return (GEOPDResultRefinementMetadataSort *)-[GEOPDResultRefinementMetadataSort _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDResultRefinementMetadataSortIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementMetadataSortReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_customSortFunctionIdentifier)
    PBDataWriterWriteStringField();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 2) == 0)
        goto LABEL_8;
LABEL_13:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((flags & 8) != 0)
LABEL_9:
    PBDataWriterWriteBOOLField();
LABEL_10:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char flags;
  _DWORD *v6;

  v6 = a3;
  -[GEOPDResultRefinementMetadataSort readAll:](self, "readAll:", 0);
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v6[8] = self->_sortType;
    *((_BYTE *)v6 + 40) |= 4u;
  }
  if (self->_customSortFunctionIdentifier)
  {
    objc_msgSend(v6, "setCustomSortFunctionIdentifier:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v4[6] = self->_selectionFromQuerySequenceNumber;
    *((_BYTE *)v4 + 40) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 2) == 0)
        goto LABEL_8;
LABEL_13:
      v4[7] = self->_serverOverriddenPosition;
      *((_BYTE *)v4 + 40) |= 2u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v4 + 37) = self->_selectionFromQuery;
  *((_BYTE *)v4 + 40) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((flags & 8) != 0)
  {
LABEL_9:
    *((_BYTE *)v4 + 36) = self->_enableServerOverriddenPositioning;
    *((_BYTE *)v4 + 40) |= 8u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_sortType;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_customSortFunctionIdentifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_selectionFromQuerySequenceNumber;
    *(_BYTE *)(v6 + 40) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0)
        goto LABEL_6;
LABEL_11:
      *(_DWORD *)(v6 + 28) = self->_serverOverriddenPosition;
      *(_BYTE *)(v6 + 40) |= 2u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 37) = self->_selectionFromQuery;
  *(_BYTE *)(v6 + 40) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((flags & 8) != 0)
  {
LABEL_7:
    *(_BYTE *)(v6 + 36) = self->_enableServerOverriddenPositioning;
    *(_BYTE *)(v6 + 40) |= 8u;
  }
LABEL_8:
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *customSortFunctionIdentifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[GEOPDResultRefinementMetadataSort readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 40);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_sortType != *((_DWORD *)v4 + 8))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_30;
  }
  customSortFunctionIdentifier = self->_customSortFunctionIdentifier;
  if ((unint64_t)customSortFunctionIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](customSortFunctionIdentifier, "isEqual:"))
      goto LABEL_30;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 40);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_selectionFromQuerySequenceNumber != *((_DWORD *)v4 + 6))
      goto LABEL_30;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_30;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_30;
    if (self->_selectionFromQuery)
    {
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 37))
    {
      goto LABEL_30;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_30;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_serverOverriddenPosition != *((_DWORD *)v4 + 7))
      goto LABEL_30;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_30;
  }
  v8 = (v6 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) != 0)
    {
      if (self->_enableServerOverriddenPositioning)
      {
        if (!*((_BYTE *)v4 + 36))
          goto LABEL_30;
      }
      else if (*((_BYTE *)v4 + 36))
      {
        goto LABEL_30;
      }
      v8 = 1;
      goto LABEL_31;
    }
LABEL_30:
    v8 = 0;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOPDResultRefinementMetadataSort readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v3 = 2654435761 * self->_sortType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_customSortFunctionIdentifier, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761 * self->_selectionFromQuerySequenceNumber;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_selectionFromQuery;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_serverOverriddenPosition;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761 * self->_enableServerOverriddenPositioning;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  int *v6;

  v6 = (int *)a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  if ((v6[10] & 4) != 0)
  {
    self->_sortType = v6[8];
    *(_BYTE *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v6 + 2))
  {
    -[GEOPDResultRefinementMetadataSort setCustomSortFunctionIdentifier:](self, "setCustomSortFunctionIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_selectionFromQuerySequenceNumber = v4[6];
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 0x10) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0)
        goto LABEL_8;
LABEL_13:
      self->_serverOverriddenPosition = v4[7];
      *(_BYTE *)&self->_flags |= 2u;
      if ((v4[10] & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((v4[10] & 0x10) == 0)
  {
    goto LABEL_7;
  }
  self->_selectionFromQuery = *((_BYTE *)v4 + 37);
  *(_BYTE *)&self->_flags |= 0x10u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v5 & 8) != 0)
  {
LABEL_9:
    self->_enableServerOverriddenPositioning = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_10:

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
    -[GEOPDResultRefinementMetadataSort readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSortFunctionIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
