@implementation GEOPDSInferredValue

- (void)setAttribute:(uint64_t)a1
{
  id v4;

  v4 = a2;
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
  v8.super_class = (Class)GEOPDSInferredValue;
  -[GEOPDSInferredValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSInferredValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSInferredValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 1) != 0)
  {
    v6 = *(int *)(a1 + 24);
    if (v6 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C059A8[v6];
    }
    if (a2)
      v8 = CFSTR("priceRange");
    else
      v8 = CFSTR("price_range");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 36);
  }
  if ((v5 & 2) != 0)
  {
    v9 = *(int *)(a1 + 28);
    if (v9 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C059D0[v9];
    }
    if (a2)
      v11 = CFSTR("tradingHours");
    else
      v11 = CFSTR("trading_hours");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v12 = *(id *)(a1 + 16);
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v12, "jsonRepresentation");
    else
      objc_msgSend(v12, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("attribute"));

  }
  if ((*(_BYTE *)(a1 + 36) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("negateInferredValue");
    else
      v16 = CFSTR("negate_inferred_value");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(void **)(a1 + 8);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __49__GEOPDSInferredValue__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSInferredValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPDSInferredValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDSInferredValueReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_attribute)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

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
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_priceRange;
    *(_BYTE *)(v5 + 36) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_tradingHours;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v8 = -[GEOPDSRawAttribute copyWithZone:](self->_attribute, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v6 + 32) = self->_negateInferredValue;
    *(_BYTE *)(v6 + 36) |= 4u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOPDSRawAttribute *attribute;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 36);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_priceRange != *((_DWORD *)v4 + 6))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_tradingHours != *((_DWORD *)v4 + 7))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_17;
  }
  attribute = self->_attribute;
  if ((unint64_t)attribute | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDSRawAttribute isEqual:](attribute, "isEqual:"))
      goto LABEL_17;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 36);
  }
  v8 = (v6 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_negateInferredValue)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_17;
      }
      else if (*((_BYTE *)v4 + 32))
      {
        goto LABEL_17;
      }
      v8 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v8 = 0;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_priceRange;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_tradingHours;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[GEOPDSRawAttribute hash](self->_attribute, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v6 = 2654435761 * self->_negateInferredValue;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribute, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
