@implementation GEOComponentAction

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOComponentAction;
  -[GEOComponentAction dealloc](&v3, sel_dealloc);
}

- (uint64_t)actionsAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 24);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 16) + 4 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOComponentAction;
  -[GEOComponentAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComponentAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOComponentAction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v5 = *(int *)(a1 + 40);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 40));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C10190[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("component"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v9 = 0;
      do
      {
        v10 = *(int *)(*v8 + 4 * v9);
        if (v10 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = off_1E1C10138[v10];
        }
        objc_msgSend(v7, "addObject:", v11);

        ++v9;
        v8 = (_QWORD *)(a1 + 16);
      }
      while (v9 < *(_QWORD *)(a1 + 24));
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("actions"));

  }
  if ((*(_BYTE *)(a1 + 48) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("handleLocally"));

  }
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
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __48__GEOComponentAction__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOComponentAction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOComponentAction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOComponentActionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_actions.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_actions.count);
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 40) = self->_component;
    *(_BYTE *)(v4 + 48) |= 1u;
  }
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 44) = self->_handleLocally;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_component != *((_DWORD *)v4 + 10))
      goto LABEL_10;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_10;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_10;
  v5 = (*((_BYTE *)v4 + 48) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) != 0)
    {
      if (self->_handleLocally)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_10;
      }
      else if (*((_BYTE *)v4 + 44))
      {
        goto LABEL_10;
      }
      v5 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v5 = 0;
  }
LABEL_11:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_component;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_handleLocally;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
