@implementation GEOPDBusinessAssetsFilter

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDBusinessAssetsFilter;
  -[GEOPDBusinessAssetsFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBusinessAssetsFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBusinessAssetsFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 8);
  if (v5)
  {
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __55__GEOPDBusinessAssetsFilter__dictionaryRepresentation___block_invoke;
      v12[3] = &unk_1E1C00600;
      v9 = v8;
      v13 = v9;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);
      v10 = v9;

      v7 = v10;
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDBusinessAssetsFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPDBusinessAssetsFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  unsigned __int8 *v4;
  int *v5;
  int *v6;
  int *v7;
  int *v8;
  int v9;
  char v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  char v18;
  BOOL v19;
  PBUnknownFields *v20;
  PBUnknownFields *unknownFields;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    v5 = (int *)MEMORY[0x1E0D82BF0];
    v6 = (int *)MEMORY[0x1E0D82BD8];
    v7 = (int *)MEMORY[0x1E0D82BC8];
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      v9 = v4[*v7];
      if (*(_QWORD *)&v4[*v5] >= *(_QWORD *)&v4[*v6])
        break;
      if (v4[*v7])
      {
        v9 = 1;
        break;
      }
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v5;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v6])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v18 = 0;
          v9 = v4[*v7];
          goto LABEL_16;
        }
      }
      v4[*v7] = 1;
LABEL_13:
      v9 = v4[*v7];
      if (v4[*v7])
        v18 = 0;
      else
        v18 = v12;
LABEL_16:
      if (v9)
        v19 = 1;
      else
        v19 = (v18 & 7) == 4;
      if (v19)
        break;
      if (!self->_unknownFields)
      {
        v20 = (PBUnknownFields *)objc_alloc_init(MEMORY[0x1E0D82BB0]);
        unknownFields = self->_unknownFields;
        self->_unknownFields = v20;

      }
      if ((PBUnknownFieldAdd() & 1) == 0)
        goto LABEL_23;
    }
    v22 = v9 == 0;
  }
  else
  {
LABEL_23:
    v22 = 0;
  }
  objc_sync_exit(v4);

  return v22;
}

- (void)writeTo:(id)a3
{
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_unknownFields);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
