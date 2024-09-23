@implementation NTPBCacheHint

- (NSString)key
{
  return self->_key;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBCacheHint setKey:](self, "setKey:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBCacheHint;
  -[NTPBCacheHint dealloc](&v3, sel_dealloc);
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setAccessTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_accessTime = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_lifetime;
    *(_BYTE *)(v5 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_accessTime;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (void)setLifetime:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lifetime = a3;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)lifetime
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_lifetime;
  else
    return 0;
}

- (void)setHasLifetime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLifetime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAccessTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccessTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBCacheHint;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBCacheHint description](&v3, sel_description), -[NTPBCacheHint dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_lifetime), CFSTR("lifetime"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_accessTime), CFSTR("access_time"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCacheHintReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_key)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *key;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    key = self->_key;
    if (!((unint64_t)key | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](key, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_lifetime != *((_DWORD *)a3 + 6))
          goto LABEL_13;
      }
      else if ((*((_BYTE *)a3 + 28) & 2) != 0)
      {
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_accessTime != *((_QWORD *)a3 + 1))
          goto LABEL_13;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_lifetime;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761u * self->_accessTime;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 2))
    -[NTPBCacheHint setKey:](self, "setKey:");
  v5 = *((_BYTE *)a3 + 28);
  if ((v5 & 2) != 0)
  {
    self->_lifetime = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 28);
  }
  if ((v5 & 1) != 0)
  {
    self->_accessTime = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unint64_t)accessTime
{
  return self->_accessTime;
}

@end
