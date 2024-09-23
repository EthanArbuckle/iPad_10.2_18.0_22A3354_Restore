@implementation GEOPDSSearchStructureIntentRequestType

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSearchStructureIntentRequestType;
  -[GEOPDSSearchStructureIntentRequestType description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSSearchStructureIntentRequestType dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchStructureIntentRequestType _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  int v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
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
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 2) != 0)
  {
    v6 = *(_DWORD *)(a1 + 20);
    if (v6)
    {
      if (v6 == 1)
      {
        v7 = CFSTR("SEARCH_STRUCTURE_TYPE_UNSTRUCTURED");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 20));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("SEARCH_STRUCTURE_TYPE_UNKNOWN");
    }
    if (a2)
      v8 = CFSTR("structureType");
    else
      v8 = CFSTR("structure_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 1) != 0)
  {
    v9 = *(int *)(a1 + 16);
    if (v9 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C05A50[v9];
    }
    if (a2)
      v11 = CFSTR("intentType");
    else
      v11 = CFSTR("intent_type");
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
      v19[2] = __68__GEOPDSSearchStructureIntentRequestType__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDSSearchStructureIntentRequestType _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __68__GEOPDSSearchStructureIntentRequestType__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v8;
  int v9;
  const __CFString *v10;
  void *v11;
  id v12;
  int v13;

  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("structureType");
      else
        v6 = CFSTR("structure_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_STRUCTURE_TYPE_UNKNOWN")) & 1) != 0)
          v9 = 0;
        else
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_STRUCTURE_TYPE_UNSTRUCTURED"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_14;
        v9 = objc_msgSend(v7, "intValue");
      }
      *(_BYTE *)(a1 + 24) |= 2u;
      *(_DWORD *)(a1 + 20) = v9;
LABEL_14:

      if (a3)
        v10 = CFSTR("intentType");
      else
        v10 = CFSTR("intent_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("SEARCH_INTENT_TYPE_UNKNOWN")) & 1) != 0)
        {
          v13 = 0;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("SEARCH_INTENT_TYPE_POI_ONLY")) & 1) != 0)
        {
          v13 = 1;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("SEARCH_INTENT_TYPE_GEO_CODING_ONLY")) & 1) != 0)
        {
          v13 = 2;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("SEARCH_INTENT_TYPE_ANY")))
        {
          v13 = 3;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        v13 = objc_msgSend(v11, "intValue");
      }
      *(_BYTE *)(a1 + 24) |= 1u;
      *(_DWORD *)(a1 + 16) = v13;
      goto LABEL_31;
    }
  }
LABEL_32:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchStructureIntentRequestTypeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_structureType;
    *(_BYTE *)(v4 + 24) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_intentType;
    *(_BYTE *)(v4 + 24) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_structureType != *((_DWORD *)v4 + 5))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_intentType != *((_DWORD *)v4 + 4))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v2 = 2654435761 * self->_structureType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_intentType;
  return v3 ^ v2;
}

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  char v4;

  v3 = a2;
  if (a1)
  {
    v4 = v3[24];
    if ((v4 & 2) != 0)
    {
      *(_DWORD *)(a1 + 20) = *((_DWORD *)v3 + 5);
      *(_BYTE *)(a1 + 24) |= 2u;
      v4 = v3[24];
    }
    if ((v4 & 1) != 0)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(_BYTE *)(a1 + 24) |= 1u;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
