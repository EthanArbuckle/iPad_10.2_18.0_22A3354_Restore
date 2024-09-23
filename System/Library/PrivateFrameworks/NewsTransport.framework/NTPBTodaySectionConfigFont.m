@implementation NTPBTodaySectionConfigFont

- (void)dealloc
{
  objc_super v3;

  -[NTPBTodaySectionConfigFont setName:](self, "setName:", 0);
  -[NTPBTodaySectionConfigFont setUrlString:](self, "setUrlString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigFont;
  -[NTPBTodaySectionConfigFont dealloc](&v3, sel_dealloc);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasUrlString
{
  return self->_urlString != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigFont;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBTodaySectionConfigFont description](&v3, sel_description), -[NTPBTodaySectionConfigFont dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *urlString;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  urlString = self->_urlString;
  if (urlString)
    objc_msgSend(v4, "setObject:forKey:", urlString, CFSTR("url_string"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionConfigFontReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_urlString)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)-[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v5[2] = (id)-[NSString copyWithZone:](self->_urlString, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *name;
  NSString *urlString;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    name = self->_name;
    if (!((unint64_t)name | *((_QWORD *)a3 + 1)) || (v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      urlString = self->_urlString;
      if ((unint64_t)urlString | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[NSString isEqual:](urlString, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[NSString hash](self->_urlString, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NTPBTodaySectionConfigFont setName:](self, "setName:");
  if (*((_QWORD *)a3 + 2))
    -[NTPBTodaySectionConfigFont setUrlString:](self, "setUrlString:");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
