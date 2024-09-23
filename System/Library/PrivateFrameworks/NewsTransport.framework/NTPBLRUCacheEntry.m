@implementation NTPBLRUCacheEntry

- (void)dealloc
{
  objc_super v3;

  -[NTPBLRUCacheEntry setKey:](self, "setKey:", 0);
  -[NTPBLRUCacheEntry setValue:](self, "setValue:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBLRUCacheEntry;
  -[NTPBLRUCacheEntry dealloc](&v3, sel_dealloc);
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setLastAccessed:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lastAccessed = a3;
}

- (void)setHasLastAccessed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastAccessed
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBLRUCacheEntry;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBLRUCacheEntry description](&v3, sel_description), -[NTPBLRUCacheEntry dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *key;
  NSData *value;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  value = self->_value;
  if (value)
    objc_msgSend(v4, "setObject:forKey:", value, CFSTR("value"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lastAccessed), CFSTR("last_accessed"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLRUCacheEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_key)
    PBDataWriterWriteDataField();
  if (self->_value)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NSData copyWithZone:](self->_key, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 24) = -[NSData copyWithZone:](self->_value, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_lastAccessed;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *key;
  NSData *value;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    key = self->_key;
    if (!((unint64_t)key | *((_QWORD *)a3 + 2)) || (v5 = -[NSData isEqual:](key, "isEqual:")) != 0)
    {
      value = self->_value;
      if (!((unint64_t)value | *((_QWORD *)a3 + 3)) || (v5 = -[NSData isEqual:](value, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 1) == 0;
        if ((*(_BYTE *)&self->_has & 1) != 0)
          LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 1) != 0 && self->_lastAccessed == *((_QWORD *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSData hash](self->_key, "hash");
  v4 = -[NSData hash](self->_value, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_lastAccessed;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 2))
    -[NTPBLRUCacheEntry setKey:](self, "setKey:");
  if (*((_QWORD *)a3 + 3))
    -[NTPBLRUCacheEntry setValue:](self, "setValue:");
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_lastAccessed = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)lastAccessed
{
  return self->_lastAccessed;
}

@end
