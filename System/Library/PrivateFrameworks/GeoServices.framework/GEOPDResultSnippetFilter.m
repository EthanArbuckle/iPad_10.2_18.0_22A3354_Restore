@implementation GEOPDResultSnippetFilter

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDResultSnippetFilter;
  -[GEOPDResultSnippetFilter dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ PBRepeatedInt32Hash();
  }
  v2 = 2654435761 * self->_maxChildPlaces;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_supportChildItems;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_maxChildItems;
  return v3 ^ v2 ^ v4 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
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
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
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
  PBDataWriterWriteBOOLField();
  v4 = v7;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_5:
  if (self->_supportedChildActions.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < self->_supportedChildActions.count);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

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
  v8.super_class = (Class)GEOPDResultSnippetFilter;
  -[GEOPDResultSnippetFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultSnippetFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultSnippetFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 52);
  if ((v5 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
      goto LABEL_4;
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("supportChildItems");
    else
      v24 = CFSTR("support_child_items");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
      goto LABEL_9;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 44));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("maxChildPlaces");
  else
    v22 = CFSTR("max_child_places");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v5 = *(_BYTE *)(a1 + 52);
  if ((v5 & 4) != 0)
    goto LABEL_30;
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("maxChildItems");
    else
      v7 = CFSTR("max_child_items");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v10 = 0;
      do
      {
        v11 = *(int *)(*v9 + 4 * v10);
        if (v11 >= 9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = off_1E1C0C0E8[v11];
        }
        objc_msgSend(v8, "addObject:", v12);

        ++v10;
        v9 = (_QWORD *)(a1 + 16);
      }
      while (v10 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v13 = CFSTR("supportedChildAction");
    else
      v13 = CFSTR("supported_child_action");
    objc_msgSend(v4, "setObject:forKey:", v8, v13);

  }
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
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __54__GEOPDResultSnippetFilter__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v18 = v17;
      v26 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v25);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultSnippetFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDResultSnippetFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDResultSnippetFilterReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v4 + 48) = self->_supportChildItems;
    *(_BYTE *)(v4 + 52) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 44) = self->_maxChildPlaces;
  *(_BYTE *)(v4 + 52) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 40) = self->_maxChildItems;
    *(_BYTE *)(v4 + 52) |= 1u;
  }
LABEL_5:
  PBRepeatedInt32Copy();
  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_maxChildPlaces != *((_DWORD *)v4 + 11))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) != 0)
    {
      if (self->_supportChildItems)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_21;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_15;
    }
LABEL_21:
    IsEqual = 0;
    goto LABEL_22;
  }
  if ((*((_BYTE *)v4 + 52) & 4) != 0)
    goto LABEL_21;
LABEL_15:
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_maxChildItems != *((_DWORD *)v4 + 10))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_21;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_22:

  return IsEqual;
}

@end
