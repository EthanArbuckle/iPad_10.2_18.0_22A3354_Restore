@implementation GEOPDSearchRelatedCategory

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchRelatedCategory;
  -[GEOPDSearchRelatedCategory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchRelatedCategory dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchRelatedCategory _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_QWORD *)(a1 + 16))
      objc_msgSend(v4, "setObject:forKey:");
    v6 = *(_BYTE *)(a1 + 28);
    if ((v6 & 2) != 0)
    {
      v7 = *(int *)(a1 + 24);
      if (v7 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = off_1E1C0A960[v7];
      }
      objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("type"));

      v6 = *(_BYTE *)(a1 + 28);
    }
    if ((v6 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v10 = CFSTR("densityScore");
      else
        v10 = CFSTR("density_score");
      objc_msgSend(v5, "setObject:forKey:", v9, v10);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchRelatedCategory _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_25;
  if (a3)
    v7 = CFSTR("entityId");
  else
    v7 = CFSTR("entity_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    v10 = v9;
    objc_storeStrong((id *)(v6 + 16), v9);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("CATEGORY_RELATIONSHIP_TYPE_UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("CATEGORY_RELATIONSHIP_TYPE_SIMILAR")) & 1) != 0)
    {
      v13 = 1;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("CATEGORY_RELATIONSHIP_TYPE_HAS_BROADER")))
    {
      v13 = 2;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_18:
    *(_BYTE *)(v6 + 28) |= 2u;
    *(_DWORD *)(v6 + 24) = v13;
  }

  if (a3)
    v14 = CFSTR("densityScore");
  else
    v14 = CFSTR("density_score");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v15, "longLongValue");
    *(_BYTE *)(v6 + 28) |= 1u;
    *(_QWORD *)(v6 + 8) = v16;
  }

LABEL_25:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchRelatedCategoryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_entityId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_entityId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(_BYTE *)(v5 + 28) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_densityScore;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *entityId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  entityId = self->_entityId;
  if ((unint64_t)entityId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](entityId, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_type != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_densityScore != *((_QWORD *)v4 + 1))
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

  v3 = -[NSString hash](self->_entityId, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_densityScore;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityId, 0);
}

@end
