@implementation _MRTransactionPacketProtobuf

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasPacketData
{
  return self->_packetData != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setTotalLength:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_totalLength = a3;
}

- (void)setHasTotalLength:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTotalLength
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTotalWritePosition:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_totalWritePosition = a3;
}

- (void)setHasTotalWritePosition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalWritePosition
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)_MRTransactionPacketProtobuf;
  -[_MRTransactionPacketProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRTransactionPacketProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRTransactionKeyProtobuf *key;
  void *v5;
  NSData *packetData;
  NSString *identifier;
  char has;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  key = self->_key;
  if (key)
  {
    -[_MRTransactionKeyProtobuf dictionaryRepresentation](key, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("key"));

  }
  packetData = self->_packetData;
  if (packetData)
    objc_msgSend(v3, "setObject:forKey:", packetData, CFSTR("packetData"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_totalLength);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("totalLength"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_totalWritePosition);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("totalWritePosition"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRTransactionPacketProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_packetData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  if (self->_packetData)
  {
    objc_msgSend(v6, "setPacketData:");
    v4 = v6;
  }
  if (self->_identifier)
  {
    objc_msgSend(v6, "setIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_totalLength;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_totalWritePosition;
    *((_BYTE *)v4 + 48) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRTransactionKeyProtobuf copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSData copyWithZone:](self->_packetData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_totalLength;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_totalWritePosition;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRTransactionKeyProtobuf *key;
  NSData *packetData;
  NSString *identifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 4))
  {
    if (!-[_MRTransactionKeyProtobuf isEqual:](key, "isEqual:"))
      goto LABEL_17;
  }
  packetData = self->_packetData;
  if ((unint64_t)packetData | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](packetData, "isEqual:"))
      goto LABEL_17;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_totalLength != *((_QWORD *)v4 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  v8 = (*((_BYTE *)v4 + 48) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_totalWritePosition != *((_QWORD *)v4 + 2))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[_MRTransactionKeyProtobuf hash](self->_key, "hash");
  v4 = -[NSData hash](self->_packetData, "hash");
  v5 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761u * self->_totalLength;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761u * self->_totalWritePosition;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRTransactionKeyProtobuf *key;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = a3;
  key = self->_key;
  v6 = v4[4];
  v8 = v4;
  if (key)
  {
    if (!v6)
      goto LABEL_7;
    -[_MRTransactionKeyProtobuf mergeFrom:](key, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[_MRTransactionPacketProtobuf setKey:](self, "setKey:");
  }
  v4 = v8;
LABEL_7:
  if (v4[5])
  {
    -[_MRTransactionPacketProtobuf setPacketData:](self, "setPacketData:");
    v4 = v8;
  }
  if (v4[3])
  {
    -[_MRTransactionPacketProtobuf setIdentifier:](self, "setIdentifier:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 1) != 0)
  {
    self->_totalLength = v4[1];
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((v7 & 2) != 0)
  {
    self->_totalWritePosition = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (_MRTransactionKeyProtobuf)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSData)packetData
{
  return self->_packetData;
}

- (void)setPacketData:(id)a3
{
  objc_storeStrong((id *)&self->_packetData, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (unint64_t)totalWritePosition
{
  return self->_totalWritePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetData, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)initialize
{
  objc_class *v2;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (objc_class *)objc_opt_class();
    MRClassSwizzleMethod(v2, sel_dictionaryRepresentation, sel_customDictionaryRepresentation);
  }
}

- (id)customDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *StringRepresentation;

  -[_MRTransactionPacketProtobuf customDictionaryRepresentation](self, "customDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_MRTransactionPacketProtobuf packetData](self, "packetData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_MRTransactionPacketProtobuf packetData](self, "packetData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    StringRepresentation = (void *)MRDataCreateStringRepresentation(v6);

    objc_msgSend(v4, "setObject:forKey:", StringRepresentation, CFSTR("packetData"));
  }
  return v4;
}

@end
