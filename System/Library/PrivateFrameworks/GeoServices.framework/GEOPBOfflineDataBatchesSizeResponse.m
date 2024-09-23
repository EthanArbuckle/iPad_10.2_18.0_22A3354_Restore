@implementation GEOPBOfflineDataBatchesSizeResponse

- (unsigned)batchCount
{
  return self->_batchCount;
}

- (void)setBatchCount:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_batchCount = a3;
}

- (void)setHasBatchCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasBatchCount
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unint64_t)sizeBytes
{
  return self->_sizeBytes;
}

- (void)setSizeBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_sizeBytes = a3;
}

- (void)setHasSizeBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSizeBytes
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unint64_t)compressedSizeBytes
{
  return self->_compressedSizeBytes;
}

- (void)setCompressedSizeBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_compressedSizeBytes = a3;
}

- (void)setHasCompressedSizeBytes:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCompressedSizeBytes
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOPBOfflineDataBatchesSizeResponse;
  -[GEOPBOfflineDataBatchesSizeResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflineDataBatchesSizeResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataBatchesSizeResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("batchCount");
    else
      v7 = CFSTR("batch_count");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        return v4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)(a1 + 28) & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v9 = CFSTR("sizeBytes");
  else
    v9 = CFSTR("size_bytes");
  objc_msgSend(v4, "setObject:forKey:", v8, v9);

  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("compressedSizeBytes");
    else
      v11 = CFSTR("compressed_size_bytes");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBOfflineDataBatchesSizeResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPBOfflineDataBatchesSizeResponse)initWithDictionary:(id)a3
{
  return (GEOPBOfflineDataBatchesSizeResponse *)-[GEOPBOfflineDataBatchesSizeResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("batchCount");
      else
        v6 = CFSTR("batch_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBatchCount:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("sizeBytes");
      else
        v8 = CFSTR("size_bytes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSizeBytes:", objc_msgSend(v9, "unsignedLongLongValue"));

      if (a3)
        v10 = CFSTR("compressedSizeBytes");
      else
        v10 = CFSTR("compressed_size_bytes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCompressedSizeBytes:", objc_msgSend(v11, "unsignedLongLongValue"));

    }
  }

  return a1;
}

- (GEOPBOfflineDataBatchesSizeResponse)initWithJSON:(id)a3
{
  return (GEOPBOfflineDataBatchesSizeResponse *)-[GEOPBOfflineDataBatchesSizeResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  BOOL v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  BOOL v34;

  objc_msgSend(a3, "length", objc_msgSend(a3, "position"));
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6))
        goto LABEL_48;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        goto LABEL_48;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        if ((v10 & 7) != 0)
          goto LABEL_50;
        v29 = 0;
        while (1)
        {
          v30 = *v4;
          v31 = *(_QWORD *)((char *)a3 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_45;
          v32 = v31 + 1;
          v33 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v31);
          *(_QWORD *)((char *)a3 + v30) = v32;
          if (v33 < 0)
          {
            v23 = v29++ > 8;
            if (!v23)
              continue;
          }
          goto LABEL_47;
        }
      }
      if ((_DWORD)v17 == 1)
      {
        if ((v10 & 7) != 0)
          goto LABEL_50;
        v18 = 0;
        while (1)
        {
          v19 = *v4;
          v20 = *(_QWORD *)((char *)a3 + v19);
          if (v20 == -1 || v20 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v21 = v20 + 1;
          v22 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v20);
          *(_QWORD *)((char *)a3 + v19) = v21;
          if (v22 < 0)
          {
            v23 = v18++ > 8;
            if (!v23)
              continue;
          }
          goto LABEL_47;
        }
LABEL_45:
        *((_BYTE *)a3 + *v6) = 1;
        goto LABEL_47;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_50:
        v34 = 0;
        goto LABEL_49;
      }
LABEL_47:
      if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
        goto LABEL_48;
    }
    if ((v10 & 7) != 0)
      goto LABEL_50;
    v24 = 0;
    while (1)
    {
      v25 = *v4;
      v26 = *(_QWORD *)((char *)a3 + v25);
      if (v26 == -1 || v26 >= *(_QWORD *)((char *)a3 + *v5))
        goto LABEL_45;
      v27 = v26 + 1;
      v28 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v26);
      *(_QWORD *)((char *)a3 + v25) = v27;
      if (v28 < 0)
      {
        v23 = v24++ > 8;
        if (!v23)
          continue;
      }
      goto LABEL_47;
    }
  }
LABEL_48:
  v34 = *((_BYTE *)a3 + *v6) == 0;
LABEL_49:
  PBReaderRecallMark();
  return v34;
}

- (BOOL)readFrom:(id)a3
{
  char *v4;
  int *v5;
  int *v6;
  int *v7;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  BOOL v37;

  v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    v5 = (int *)MEMORY[0x1E0D82BF0];
    v6 = (int *)MEMORY[0x1E0D82BD8];
    v7 = (int *)MEMORY[0x1E0D82BC8];
    if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
    {
      v8 = (int *)MEMORY[0x1E0D82BB8];
      do
      {
        if (v4[*v7])
          break;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = *v5;
          v13 = *(_QWORD *)&v4[v12];
          if (v13 == -1 || v13 >= *(_QWORD *)&v4[*v6])
            break;
          v14 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v13);
          *(_QWORD *)&v4[v12] = v13 + 1;
          v11 |= (unint64_t)(v14 & 0x7F) << v9;
          if ((v14 & 0x80) == 0)
            goto LABEL_13;
          v9 += 7;
          v15 = v10++ >= 9;
          if (v15)
          {
            v11 = 0;
            v16 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        v16 = v4[*v7];
        if (v4[*v7])
          v11 = 0;
LABEL_15:
        if (v16 || (v11 & 7) == 4)
          break;
        v18 = v11 >> 3;
        if ((v11 >> 3) == 3)
        {
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)&self->_flags |= 1u;
          while (1)
          {
            v28 = *v5;
            v29 = *(_QWORD *)&v4[v28];
            if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v6])
              break;
            v30 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v29);
            *(_QWORD *)&v4[v28] = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if ((v30 & 0x80) == 0)
              goto LABEL_50;
            v25 += 7;
            v15 = v26++ >= 9;
            if (v15)
            {
              v27 = 0;
              goto LABEL_52;
            }
          }
          v4[*v7] = 1;
LABEL_50:
          if (v4[*v7])
            v27 = 0;
LABEL_52:
          v36 = 8;
        }
        else
        {
          if ((_DWORD)v18 != 2)
          {
            if ((_DWORD)v18 == 1)
            {
              v19 = 0;
              v20 = 0;
              v21 = 0;
              *(_BYTE *)&self->_flags |= 4u;
              while (1)
              {
                v22 = *v5;
                v23 = *(_QWORD *)&v4[v22];
                if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v6])
                  break;
                v24 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v23);
                *(_QWORD *)&v4[v22] = v23 + 1;
                v21 |= (unint64_t)(v24 & 0x7F) << v19;
                if ((v24 & 0x80) == 0)
                  goto LABEL_46;
                v19 += 7;
                v15 = v20++ >= 9;
                if (v15)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_48;
                }
              }
              v4[*v7] = 1;
LABEL_46:
              if (v4[*v7])
                LODWORD(v21) = 0;
LABEL_48:
              self->_batchCount = v21;
            }
            else if (!PBReaderSkipValueWithTag())
            {
              goto LABEL_60;
            }
            continue;
          }
          v31 = 0;
          v32 = 0;
          v27 = 0;
          *(_BYTE *)&self->_flags |= 2u;
          while (1)
          {
            v33 = *v5;
            v34 = *(_QWORD *)&v4[v33];
            if (v34 == -1 || v34 >= *(_QWORD *)&v4[*v6])
              break;
            v35 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v34);
            *(_QWORD *)&v4[v33] = v34 + 1;
            v27 |= (unint64_t)(v35 & 0x7F) << v31;
            if ((v35 & 0x80) == 0)
              goto LABEL_54;
            v31 += 7;
            v15 = v32++ >= 9;
            if (v15)
            {
              v27 = 0;
              goto LABEL_56;
            }
          }
          v4[*v7] = 1;
LABEL_54:
          if (v4[*v7])
            v27 = 0;
LABEL_56:
          v36 = 16;
        }
        *(Class *)((char *)&self->super.super.isa + v36) = (Class)v27;
      }
      while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
    }
    v37 = v4[*v7] == 0;
  }
  else
  {
LABEL_60:
    v37 = 0;
  }
  objc_sync_exit(v4);

  return v37;
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteUint64Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOPBOfflineDataBatchesSizeResponse readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v5[2] = self->_sizeBytes;
    *((_BYTE *)v5 + 28) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 6) = self->_batchCount;
  *((_BYTE *)v5 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    v5[1] = self->_compressedSizeBytes;
    *((_BYTE *)v5 + 28) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_batchCount;
    *((_BYTE *)result + 28) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = self->_sizeBytes;
  *((_BYTE *)result + 28) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 1) = self->_compressedSizeBytes;
  *((_BYTE *)result + 28) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPBOfflineDataBatchesSizeResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_batchCount != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_sizeBytes != *((_QWORD *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_compressedSizeBytes != *((_QWORD *)v4 + 1))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOPBOfflineDataBatchesSizeResponse readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_batchCount;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_sizeBytes;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761u * self->_compressedSizeBytes;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 4) == 0)
  {
    if ((*((_BYTE *)v5 + 28) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_sizeBytes = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v5 + 28) & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_batchCount = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 1) != 0)
  {
LABEL_4:
    self->_compressedSizeBytes = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:

}

@end
