@implementation NTPBABConfigBucket

- (void)setBucketFloor:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bucketFloor = a3;
}

- (void)setHasBucketFloor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBucketFloor
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBucketCeiling:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bucketCeiling = a3;
}

- (void)setHasBucketCeiling:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBucketCeiling
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasConfig
{
  return self->_config != 0;
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
  v8.super_class = (Class)NTPBABConfigBucket;
  -[NTPBABConfigBucket description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBABConfigBucket dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NTPBConfig *config;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bucketFloor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bucket_floor"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bucketCeiling);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("bucket_ceiling"));

  }
  config = self->_config;
  if (config)
  {
    -[NTPBConfig dictionaryRepresentation](config, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("config"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBABConfigBucketReadFrom((uint64_t)self, (uint64_t)a3);
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
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_config)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_bucketFloor;
    *(_BYTE *)(v5 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_bucketCeiling;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[NTPBConfig copyWithZone:](self->_config, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NTPBConfig *config;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_bucketFloor != *((_QWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_bucketCeiling != *((_QWORD *)v4 + 1))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_14;
  }
  config = self->_config;
  if ((unint64_t)config | *((_QWORD *)v4 + 3))
    v6 = -[NTPBConfig isEqual:](config, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_bucketFloor;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NTPBConfig hash](self->_config, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_bucketCeiling;
  return v3 ^ v2 ^ -[NTPBConfig hash](self->_config, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  char v6;
  NTPBConfig *config;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 32);
  if ((v6 & 2) != 0)
  {
    self->_bucketFloor = v4[2];
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 32);
  }
  if ((v6 & 1) != 0)
  {
    self->_bucketCeiling = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  config = self->_config;
  v8 = v5[3];
  if (config)
  {
    if (v8)
    {
      v9 = v5;
      -[NTPBConfig mergeFrom:](config, "mergeFrom:");
LABEL_10:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[NTPBABConfigBucket setConfig:](self, "setConfig:");
    goto LABEL_10;
  }

}

- (int64_t)bucketFloor
{
  return self->_bucketFloor;
}

- (int64_t)bucketCeiling
{
  return self->_bucketCeiling;
}

- (NTPBConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
