@implementation NTPBTagExpiration

- (BOOL)hasTagId
{
  return self->_tagId != 0;
}

- (void)setExpireUtcTime:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_expireUtcTime = a3;
}

- (void)setHasExpireUtcTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpireUtcTime
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NTPBTagExpiration;
  -[NTPBTagExpiration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTagExpiration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *tagId;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  tagId = self->_tagId;
  if (tagId)
    objc_msgSend(v3, "setObject:forKey:", tagId, CFSTR("tag_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_expireUtcTime);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("expire_utc_time"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTagExpirationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_tagId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_tagId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_expireUtcTime;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *tagId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  tagId = self->_tagId;
  if ((unint64_t)tagId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](tagId, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_expireUtcTime == *((_QWORD *)v4 + 1))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_tagId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_expireUtcTime;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[NTPBTagExpiration setTagId:](self, "setTagId:");
    v4 = v5;
  }
  if ((v4[3] & 1) != 0)
  {
    self->_expireUtcTime = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
  objc_storeStrong((id *)&self->_tagId, a3);
}

- (int64_t)expireUtcTime
{
  return self->_expireUtcTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagId, 0);
}

@end
