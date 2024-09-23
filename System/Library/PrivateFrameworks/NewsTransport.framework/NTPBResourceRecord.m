@implementation NTPBResourceRecord

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBResourceRecord setBase:](self, "setBase:", 0);
  -[NTPBResourceRecord setMimeType:](self, "setMimeType:", 0);
  -[NTPBResourceRecord setEncoding:](self, "setEncoding:", 0);
  -[NTPBResourceRecord setUrl:](self, "setUrl:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBResourceRecord;
  -[NTPBResourceRecord dealloc](&v3, sel_dealloc);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setEncoding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (BOOL)readFrom:(id)a3
{
  return NTPBResourceRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (NSString)url
{
  return self->_url;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v5[3] = (id)-[NSString copyWithZone:](self->_mimeType, "copyWithZone:", a3);

  v5[2] = (id)-[NSString copyWithZone:](self->_encoding, "copyWithZone:", a3);
  v5[4] = (id)-[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  return v5;
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasMimeType
{
  return self->_mimeType != 0;
}

- (BOOL)hasEncoding
{
  return self->_encoding != 0;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBResourceRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBResourceRecord description](&v3, sel_description), -[NTPBResourceRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *mimeType;
  NSString *encoding;
  NSString *url;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  mimeType = self->_mimeType;
  if (mimeType)
    objc_msgSend(v3, "setObject:forKey:", mimeType, CFSTR("mime_type"));
  encoding = self->_encoding;
  if (encoding)
    objc_msgSend(v3, "setObject:forKey:", encoding, CFSTR("encoding"));
  url = self->_url;
  if (url)
    objc_msgSend(v3, "setObject:forKey:", url, CFSTR("url"));
  return v3;
}

- (void)writeTo:(id)a3
{
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_mimeType)
    PBDataWriterWriteStringField();
  if (self->_encoding)
    PBDataWriterWriteStringField();
  if (self->_url)
    PBDataWriterWriteStringField();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSString *mimeType;
  NSString *encoding;
  NSString *url;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 1)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      mimeType = self->_mimeType;
      if (!((unint64_t)mimeType | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](mimeType, "isEqual:")) != 0)
      {
        encoding = self->_encoding;
        if (!((unint64_t)encoding | *((_QWORD *)a3 + 2))
          || (v5 = -[NSString isEqual:](encoding, "isEqual:")) != 0)
        {
          url = self->_url;
          if ((unint64_t)url | *((_QWORD *)a3 + 4))
            LOBYTE(v5) = -[NSString isEqual:](url, "isEqual:");
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
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  v4 = -[NSString hash](self->_mimeType, "hash") ^ v3;
  v5 = -[NSString hash](self->_encoding, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_url, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBRecordBase *base;
  uint64_t v6;

  base = self->_base;
  v6 = *((_QWORD *)a3 + 1);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBResourceRecord setBase:](self, "setBase:");
  }
  if (*((_QWORD *)a3 + 3))
    -[NTPBResourceRecord setMimeType:](self, "setMimeType:");
  if (*((_QWORD *)a3 + 2))
    -[NTPBResourceRecord setEncoding:](self, "setEncoding:");
  if (*((_QWORD *)a3 + 4))
    -[NTPBResourceRecord setUrl:](self, "setUrl:");
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSString)encoding
{
  return self->_encoding;
}

@end
