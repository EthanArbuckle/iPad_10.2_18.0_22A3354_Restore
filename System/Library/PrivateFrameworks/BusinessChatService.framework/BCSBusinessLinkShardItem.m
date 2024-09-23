@implementation BCSBusinessLinkShardItem

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

- (BOOL)hasFilter
{
  return self->_filter != 0;
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
  v8.super_class = (Class)BCSBusinessLinkShardItem;
  -[BCSBusinessLinkShardItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessLinkShardItem dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *filter;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_index);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("index"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_count);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("count"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_ttl);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ttl"));

  }
LABEL_5:
  filter = self->_filter;
  if (filter)
    objc_msgSend(v3, "setObject:forKey:", filter, CFSTR("filter"));
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
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  NSData *v35;
  NSData *filter;
  uint64_t v37;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
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
        v15 = v10++ >= 9;
        if (v15)
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
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_44;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_46;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_44:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_46:
          v37 = 16;
          goto LABEL_55;
        case 2u:
          v25 = 0;
          v26 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v27 = *v4;
            v28 = *(_QWORD *)((char *)a3 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v28);
              *(_QWORD *)((char *)a3 + v27) = v28 + 1;
              v20 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_50:
          v37 = 8;
          goto LABEL_55;
        case 3u:
          v30 = 0;
          v31 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 4u;
          break;
        case 4u:
          PBReaderReadData();
          v35 = (NSData *)objc_claimAutoreleasedReturnValue();
          filter = self->_filter;
          self->_filter = v35;

          continue;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v32 = *v4;
        v33 = *(_QWORD *)((char *)a3 + v32);
        if (v33 == -1 || v33 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v34 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v33);
        *(_QWORD *)((char *)a3 + v32) = v33 + 1;
        v20 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0)
          goto LABEL_52;
        v30 += 7;
        v15 = v31++ >= 9;
        if (v15)
        {
          v20 = 0;
          goto LABEL_54;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_52:
      if (*((_BYTE *)a3 + *v6))
        v20 = 0;
LABEL_54:
      v37 = 24;
LABEL_55:
      *(Class *)((char *)&self->super.super.isa + v37) = (Class)v20;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_filter)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_index;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = self->_count;
  *((_BYTE *)v4 + 40) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_ttl;
    *((_BYTE *)v4 + 40) |= 4u;
  }
LABEL_5:
  if (self->_filter)
  {
    v6 = v4;
    objc_msgSend(v4, "setFilter:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 8) = self->_count;
    *(_BYTE *)(v5 + 40) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 16) = self->_index;
  *(_BYTE *)(v5 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_ttl;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_filter, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *filter;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_index != *((_QWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_count != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_ttl != *((_QWORD *)v4 + 3))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_19;
  }
  filter = self->_filter;
  if ((unint64_t)filter | *((_QWORD *)v4 + 4))
    v6 = -[NSData isEqual:](filter, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
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
    return v3 ^ v2 ^ v4 ^ -[NSData hash](self->_filter, "hash");
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
  return v3 ^ v2 ^ v4 ^ -[NSData hash](self->_filter, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_index = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_count = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_4:
    self->_ttl = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[BCSBusinessLinkShardItem setFilter:](self, "setFilter:");
    v4 = v6;
  }

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

- (NSData)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
