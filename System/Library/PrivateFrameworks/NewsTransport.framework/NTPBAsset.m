@implementation NTPBAsset

- (BOOL)hasSize
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (NSData)wrappingKeyID
{
  return self->_wrappingKeyID;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBAsset setWrappingKeyID:](self, "setWrappingKeyID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBAsset;
  -[NTPBAsset dealloc](&v3, sel_dealloc);
}

- (BOOL)hasWrappingKeyID
{
  return self->_wrappingKeyID != 0;
}

- (int)error
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_error;
  else
    return 0;
}

- (void)setError:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasError
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSize:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBAsset;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBAsset description](&v3, sel_description), -[NTPBAsset dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *wrappingKeyID;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  wrappingKeyID = self->_wrappingKeyID;
  if (wrappingKeyID)
    objc_msgSend(v3, "setObject:forKey:", wrappingKeyID, CFSTR("wrapping_key_ID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_error), CFSTR("error"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_size), CFSTR("size"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_wrappingKeyID)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NSData copyWithZone:](self->_wrappingKeyID, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_error;
    *(_BYTE *)(v5 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_size;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *wrappingKeyID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    wrappingKeyID = self->_wrappingKeyID;
    if (!((unint64_t)wrappingKeyID | *((_QWORD *)a3 + 2))
      || (v5 = -[NSData isEqual:](wrappingKeyID, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_error != *((_DWORD *)a3 + 2))
          goto LABEL_13;
      }
      else if ((*((_BYTE *)a3 + 24) & 1) != 0)
      {
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 2) == 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_size != *((_DWORD *)a3 + 3))
          goto LABEL_13;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_wrappingKeyID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_error;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_size;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 2))
    -[NTPBAsset setWrappingKeyID:](self, "setWrappingKeyID:");
  v5 = *((_BYTE *)a3 + 24);
  if ((v5 & 1) != 0)
  {
    self->_error = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_size = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (void)setWrappingKeyID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)size
{
  return self->_size;
}

@end
