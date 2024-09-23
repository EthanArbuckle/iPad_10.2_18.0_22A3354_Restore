@implementation BCSDomainShardItemMetadata

- (void)setIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_index = a3;
}

- (void)setHasIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTtl:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_ttl = a3;
}

- (void)setHasTtl:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTtl
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BCSDomainShardItemMetadata;
  -[BCSDomainShardItemMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSDomainShardItemMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("count"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_index);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("index"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_ttl);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ttl"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  BOOL v25;
  int *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6))
        return *((_BYTE *)a3 + *v6) == 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        if (v10++ >= 9)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        return *((_BYTE *)a3 + *v6) == 0;
      v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        v27 = 0;
        v28 = 0;
        v21 = 0;
        *(_BYTE *)&self->_has |= 4u;
        while (1)
        {
          v29 = *v4;
          v30 = *(_QWORD *)((char *)a3 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v31 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v30);
          *(_QWORD *)((char *)a3 + v29) = v30 + 1;
          v21 |= (unint64_t)(v31 & 0x7F) << v27;
          if ((v31 & 0x80) == 0)
          {
            v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__ttl;
            goto LABEL_48;
          }
          v27 += 7;
          v25 = v28++ > 8;
          if (v25)
          {
            v21 = 0;
            v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__ttl;
            goto LABEL_50;
          }
        }
        v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__ttl;
LABEL_47:
        *((_BYTE *)a3 + *v6) = 1;
        goto LABEL_48;
      }
      if ((_DWORD)v18 == 2)
        break;
      if ((_DWORD)v18 == 1)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)&self->_has |= 2u;
        while (1)
        {
          v22 = *v4;
          v23 = *(_QWORD *)((char *)a3 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)((char *)a3 + *v5))
          {
            v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__index;
            goto LABEL_47;
          }
          v24 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v23);
          *(_QWORD *)((char *)a3 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            break;
          v19 += 7;
          v25 = v20++ > 8;
          if (v25)
          {
            v21 = 0;
            v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__index;
            goto LABEL_50;
          }
        }
        v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__index;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_51:
      if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
        return *((_BYTE *)a3 + *v6) == 0;
    }
    v32 = 0;
    v33 = 0;
    v21 = 0;
    *(_BYTE *)&self->_has |= 1u;
    while (1)
    {
      v34 = *v4;
      v35 = *(_QWORD *)((char *)a3 + v34);
      if (v35 == -1 || v35 >= *(_QWORD *)((char *)a3 + *v5))
      {
        v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__count;
        goto LABEL_47;
      }
      v36 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v35);
      *(_QWORD *)((char *)a3 + v34) = v35 + 1;
      v21 |= (unint64_t)(v36 & 0x7F) << v32;
      if ((v36 & 0x80) == 0)
        break;
      v32 += 7;
      v25 = v33++ > 8;
      if (v25)
      {
        v21 = 0;
        v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__count;
        goto LABEL_50;
      }
    }
    v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__count;
LABEL_48:
    if (*((_BYTE *)a3 + *v6))
      v21 = 0;
LABEL_50:
    *(Class *)((char *)&self->super.super.isa + *v26) = (Class)v21;
    goto LABEL_51;
  }
  return *((_BYTE *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt64Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v4[1] = self->_count;
    *((_BYTE *)v4 + 32) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[2] = self->_index;
  *((_BYTE *)v4 + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_ttl;
    *((_BYTE *)v4 + 32) |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = self->_index;
    *((_BYTE *)result + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = self->_count;
  *((_BYTE *)result + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 3) = self->_ttl;
  *((_BYTE *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_index != *((_QWORD *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_count != *((_QWORD *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_ttl != *((_QWORD *)v4 + 3))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_index;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_count;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_ttl;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    self->_count = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_index = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    self->_ttl = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:

}

- (int64_t)index
{
  return self->_index;
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)ttl
{
  return self->_ttl;
}

@end
