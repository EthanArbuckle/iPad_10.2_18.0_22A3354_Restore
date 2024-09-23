@implementation NTPBAVAssetKey

- (void)dealloc
{
  objc_super v3;

  -[NTPBAVAssetKey setIdentifier:](self, "setIdentifier:", 0);
  -[NTPBAVAssetKey setKeyData:](self, "setKeyData:", 0);
  -[NTPBAVAssetKey setCreatedAt:](self, "setCreatedAt:", 0);
  -[NTPBAVAssetKey setExpiresAt:](self, "setExpiresAt:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBAVAssetKey;
  -[NTPBAVAssetKey dealloc](&v3, sel_dealloc);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasKeyData
{
  return self->_keyData != 0;
}

- (BOOL)hasCreatedAt
{
  return self->_createdAt != 0;
}

- (BOOL)hasExpiresAt
{
  return self->_expiresAt != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBAVAssetKey;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBAVAssetKey description](&v3, sel_description), -[NTPBAVAssetKey dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSData *keyData;
  NTPBDate *createdAt;
  NTPBDate *expiresAt;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  keyData = self->_keyData;
  if (keyData)
    objc_msgSend(v4, "setObject:forKey:", keyData, CFSTR("key_data"));
  createdAt = self->_createdAt;
  if (createdAt)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](createdAt, "dictionaryRepresentation"), CFSTR("created_at"));
  expiresAt = self->_expiresAt;
  if (expiresAt)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](expiresAt, "dictionaryRepresentation"), CFSTR("expires_at"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAVAssetKeyReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_keyData)
    PBDataWriterWriteDataField();
  if (self->_createdAt)
    PBDataWriterWriteSubmessage();
  if (self->_expiresAt)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[3] = (id)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v5[4] = (id)-[NSData copyWithZone:](self->_keyData, "copyWithZone:", a3);

  v5[1] = -[NTPBDate copyWithZone:](self->_createdAt, "copyWithZone:", a3);
  v5[2] = -[NTPBDate copyWithZone:](self->_expiresAt, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *identifier;
  NSData *keyData;
  NTPBDate *createdAt;
  NTPBDate *expiresAt;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      keyData = self->_keyData;
      if (!((unint64_t)keyData | *((_QWORD *)a3 + 4)) || (v5 = -[NSData isEqual:](keyData, "isEqual:")) != 0)
      {
        createdAt = self->_createdAt;
        if (!((unint64_t)createdAt | *((_QWORD *)a3 + 1))
          || (v5 = -[NTPBDate isEqual:](createdAt, "isEqual:")) != 0)
        {
          expiresAt = self->_expiresAt;
          if ((unint64_t)expiresAt | *((_QWORD *)a3 + 2))
            LOBYTE(v5) = -[NTPBDate isEqual:](expiresAt, "isEqual:");
          else
            LOBYTE(v5) = 1;
        }
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

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSData hash](self->_keyData, "hash") ^ v3;
  v5 = -[NTPBDate hash](self->_createdAt, "hash");
  return v4 ^ v5 ^ -[NTPBDate hash](self->_expiresAt, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBDate *createdAt;
  uint64_t v6;
  NTPBDate *expiresAt;
  uint64_t v8;

  if (*((_QWORD *)a3 + 3))
    -[NTPBAVAssetKey setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)a3 + 4))
    -[NTPBAVAssetKey setKeyData:](self, "setKeyData:");
  createdAt = self->_createdAt;
  v6 = *((_QWORD *)a3 + 1);
  if (createdAt)
  {
    if (v6)
      -[NTPBDate mergeFrom:](createdAt, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBAVAssetKey setCreatedAt:](self, "setCreatedAt:");
  }
  expiresAt = self->_expiresAt;
  v8 = *((_QWORD *)a3 + 2);
  if (expiresAt)
  {
    if (v8)
      -[NTPBDate mergeFrom:](expiresAt, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBAVAssetKey setExpiresAt:](self, "setExpiresAt:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NTPBDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NTPBDate)expiresAt
{
  return self->_expiresAt;
}

- (void)setExpiresAt:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
