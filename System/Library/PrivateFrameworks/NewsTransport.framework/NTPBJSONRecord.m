@implementation NTPBJSONRecord

- (NTPBRecordBase)base
{
  return self->_base;
}

- (NSData)json
{
  return self->_json;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBJSONRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBJSONRecord setBase:](self, "setBase:", 0);
  -[NTPBJSONRecord setJson:](self, "setJson:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBJSONRecord;
  -[NTPBJSONRecord dealloc](&v3, sel_dealloc);
}

- (void)setJson:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v5[2] = (id)-[NSData copyWithZone:](self->_json, "copyWithZone:", a3);
  return v5;
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasJson
{
  return self->_json != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBJSONRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBJSONRecord description](&v3, sel_description), -[NTPBJSONRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSData *json;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  json = self->_json;
  if (json)
    objc_msgSend(v3, "setObject:forKey:", json, CFSTR("json"));
  return v3;
}

- (void)writeTo:(id)a3
{
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_json)
    PBDataWriterWriteDataField();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSData *json;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 1)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      json = self->_json;
      if ((unint64_t)json | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[NSData isEqual:](json, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  return -[NSData hash](self->_json, "hash") ^ v3;
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
    -[NTPBJSONRecord setBase:](self, "setBase:");
  }
  if (*((_QWORD *)a3 + 2))
    -[NTPBJSONRecord setJson:](self, "setJson:");
}

@end
