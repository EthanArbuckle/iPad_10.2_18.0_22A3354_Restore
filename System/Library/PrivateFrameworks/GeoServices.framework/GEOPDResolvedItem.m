@implementation GEOPDResolvedItem

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  char v5;
  _QWORD *v6;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)v3[2];
    if (v4)
    {
      v6 = v3;
      -[GEOPDResolvedItem setExtractedTerm:](a1, v4);
      v3 = v6;
    }
    v5 = *((_BYTE *)v3 + 32);
    if ((v5 & 1) != 0)
    {
      *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
      *(_BYTE *)(a1 + 32) |= 1u;
      v5 = *((_BYTE *)v3 + 32);
    }
    if ((v5 & 2) != 0)
    {
      *(_DWORD *)(a1 + 28) = *((_DWORD *)v3 + 7);
      *(_BYTE *)(a1 + 32) |= 2u;
    }
  }

}

- (id)extractedTerm
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (void)setExtractedTerm:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);

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
  v8.super_class = (Class)GEOPDResolvedItem;
  -[GEOPDResolvedItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResolvedItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResolvedItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  __CFString *v8;
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
  v5 = v4;
  if (*(_QWORD *)(a1 + 16))
    objc_msgSend(v4, "setObject:forKey:");
  v6 = *(_BYTE *)(a1 + 32);
  if ((v6 & 1) != 0)
  {
    v7 = *(int *)(a1 + 24);
    if (v7 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C0C0B0[v7];
    }
    if (a2)
      v9 = CFSTR("resolvedItemType");
    else
      v9 = CFSTR("resolved_item_type");
    objc_msgSend(v5, "setObject:forKey:", v8, v9);

    v6 = *(_BYTE *)(a1 + 32);
  }
  if ((v6 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("resultIndex");
    else
      v11 = CFSTR("result_index");
    objc_msgSend(v5, "setObject:forKey:", v10, v11);

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
      v19[2] = __47__GEOPDResolvedItem__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDResolvedItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDResolvedItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  int v12;
  const __CFString *v13;
  void *v14;
  int v15;

  v5 = a2;
  if (!a1)
    goto LABEL_37;
  a1 = objc_msgSend((id)a1, "init");
  if (!a1)
    goto LABEL_37;
  if (a3)
    v6 = CFSTR("extractedTerm");
  else
    v6 = CFSTR("extracted_term");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    -[GEOPDResolvedItem setExtractedTerm:](a1, v8);

  }
  if (a3)
    v9 = CFSTR("resolvedItemType");
  else
    v9 = CFSTR("resolved_item_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
    {
      v12 = 3;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
    {
      v12 = 4;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
    {
      v12 = 5;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
    {
      v12 = 6;
    }
    else
    {
      v12 = 0;
    }

    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v10, "intValue");
LABEL_30:
    *(_BYTE *)(a1 + 32) |= 1u;
    *(_DWORD *)(a1 + 24) = v12;
  }

  if (a3)
    v13 = CFSTR("resultIndex");
  else
    v13 = CFSTR("result_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_msgSend(v14, "unsignedIntValue");
    *(_BYTE *)(a1 + 32) |= 2u;
    *(_DWORD *)(a1 + 28) = v15;
  }

LABEL_37:
  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResolvedItemReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_extractedTerm)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_extractedTerm, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_resolvedItemType;
    *(_BYTE *)(v5 + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_resultIndex;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *extractedTerm;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  extractedTerm = self->_extractedTerm;
  if ((unint64_t)extractedTerm | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](extractedTerm, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_resolvedItemType != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_resultIndex != *((_DWORD *)v4 + 7))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_extractedTerm, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_resolvedItemType;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_resultIndex;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedTerm, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
