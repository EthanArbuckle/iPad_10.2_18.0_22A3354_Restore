@implementation GEOPlaceDataCacheLogMessage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceDataCacheLogMessage;
  -[GEOPlaceDataCacheLogMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceDataCacheLogMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v17;
  BOOL v18;

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
        v14 = v13 + 1;
        if (v13 == -1 || v14 > *(_QWORD *)&v3[*v5])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v3[*v7] + v13);
        *(_QWORD *)&v3[v12] = v14;
        v11 |= (unint64_t)(v15 & 0x7F) << v9;
        if ((v15 & 0x80) == 0)
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
        v17 = 1;
      else
        v17 = (v11 & 7) == 4;
      if (v17)
        break;
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        goto LABEL_20;
    }
    v18 = v8 == 0;
  }
  else
  {
LABEL_20:
    v18 = 0;
  }
  objc_sync_exit(v3);

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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

@end
