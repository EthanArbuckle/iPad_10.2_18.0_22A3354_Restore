@implementation GEOMapQueryCollectionResponse

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOMapQueryCollectionResponse;
  -[GEOMapQueryCollectionResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapQueryCollectionResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOMapQueryCollectionResponse)initWithDictionary:(id)a3
{
  return (GEOMapQueryCollectionResponse *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

- (GEOMapQueryCollectionResponse)initWithJSON:(id)a3
{
  return (GEOMapQueryCollectionResponse *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  int v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v16;
  BOOL v17;

  objc_msgSend(a3, "length", objc_msgSend(a3, "position"));
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v8 = *((unsigned __int8 *)a3 + *v6);
    if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
      break;
    if (*((_BYTE *)a3 + *v6))
    {
      v8 = 1;
      break;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = *v4;
      v13 = *(_QWORD *)((char *)a3 + v12);
      if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v13);
      *(_QWORD *)((char *)a3 + v12) = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v9 += 7;
      if (v10++ >= 9)
      {
        LOBYTE(v11) = 0;
        v8 = *((unsigned __int8 *)a3 + *v6);
        goto LABEL_14;
      }
    }
    *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
    v8 = *((unsigned __int8 *)a3 + *v6);
    if (*((_BYTE *)a3 + *v6))
      LOBYTE(v11) = 0;
LABEL_14:
    if (v8)
      v16 = 1;
    else
      v16 = (v11 & 7) == 4;
    if (v16)
      break;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
    {
      v17 = 0;
      goto LABEL_22;
    }
  }
  v17 = v8 == 0;
LABEL_22:
  PBReaderRecallMark();
  return v17;
}

- (BOOL)readFrom:(id)a3
{
  unsigned __int8 *v3;
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  int v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v16;
  BOOL v17;

  v3 = (unsigned __int8 *)a3;
  objc_sync_enter(v3);
  if (v3)
  {
    v4 = (int *)MEMORY[0x1E0D82BF0];
    v5 = (int *)MEMORY[0x1E0D82BD8];
    v6 = (int *)MEMORY[0x1E0D82BC8];
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      v8 = v3[*v6];
      if (*(_QWORD *)&v3[*v4] >= *(_QWORD *)&v3[*v5])
        break;
      if (v3[*v6])
      {
        v8 = 1;
        break;
      }
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)&v3[v12];
        if (v13 == -1 || v13 >= *(_QWORD *)&v3[*v5])
          break;
        v14 = *(_BYTE *)(*(_QWORD *)&v3[*v7] + v13);
        *(_QWORD *)&v3[v12] = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_13;
        v9 += 7;
        if (v10++ >= 9)
        {
          LOBYTE(v11) = 0;
          v8 = v3[*v6];
          goto LABEL_15;
        }
      }
      v3[*v6] = 1;
LABEL_13:
      v8 = v3[*v6];
      if (v3[*v6])
        LOBYTE(v11) = 0;
LABEL_15:
      if (v8)
        v16 = 1;
      else
        v16 = (v11 & 7) == 4;
      if (v16)
        break;
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        goto LABEL_20;
    }
    v17 = v8 == 0;
  }
  else
  {
LABEL_20:
    v17 = 0;
  }
  objc_sync_exit(v3);

  return v17;
}

- (void)copyTo:(id)a3
{
  -[GEOMapQueryCollectionResponse readAll:](self, "readAll:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    -[GEOMapQueryCollectionResponse readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOMapQueryCollectionResponse readAll:](self, "readAll:", 1);
  return 0;
}

- (void)mergeFrom:(id)a3
{
  objc_msgSend(a3, "readAll:", 0);
}

@end
