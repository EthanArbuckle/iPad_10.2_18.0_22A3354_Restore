@implementation GEOUUID

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOUUID;
  -[GEOUUID description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOUUID dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOUUID _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("high"));

    v5 = *(_BYTE *)(a1 + 32);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("low"));

  }
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __37__GEOUUID__dictionaryRepresentation___block_invoke;
      v15[3] = &unk_1E1C00600;
      v12 = v11;
      v16 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOUUID _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __37__GEOUUID__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(uint64_t)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("high"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = objc_msgSend(v4, "unsignedLongLongValue");
        *(_BYTE *)(a1 + 32) |= 1u;
        *(_QWORD *)(a1 + 16) = v5;
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("low"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "unsignedLongLongValue");
        *(_BYTE *)(a1 + 32) |= 2u;
        *(_QWORD *)(a1 + 24) = v7;
      }

    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOUUIDReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteUint64Field();
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
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v4 + 16) = self->_high;
    *(_BYTE *)(v4 + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v4 + 24) = self->_low;
    *(_BYTE *)(v4 + 32) |= 2u;
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
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_high != *((_QWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_low != *((_QWORD *)v4 + 3))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v2 = 2654435761u * self->_high;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761u * self->_low;
  return v3 ^ v2;
}

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  char v4;

  v3 = a2;
  if (a1)
  {
    v4 = v3[32];
    if ((v4 & 1) != 0)
    {
      *(_QWORD *)(a1 + 16) = *((_QWORD *)v3 + 2);
      *(_BYTE *)(a1 + 32) |= 1u;
      v4 = v3[32];
    }
    if ((v4 & 2) != 0)
    {
      *(_QWORD *)(a1 + 24) = *((_QWORD *)v3 + 3);
      *(_BYTE *)(a1 + 32) |= 2u;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
