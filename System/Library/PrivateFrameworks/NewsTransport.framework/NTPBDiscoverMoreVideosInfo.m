@implementation NTPBDiscoverMoreVideosInfo

- (void)dealloc
{
  objc_super v3;

  -[NTPBDiscoverMoreVideosInfo setTitle:](self, "setTitle:", 0);
  -[NTPBDiscoverMoreVideosInfo setSubtitle:](self, "setSubtitle:", 0);
  -[NTPBDiscoverMoreVideosInfo setActionURLString:](self, "setActionURLString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBDiscoverMoreVideosInfo;
  -[NTPBDiscoverMoreVideosInfo dealloc](&v3, sel_dealloc);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setActionURLString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasActionURLString
{
  return self->_actionURLString != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBDiscoverMoreVideosInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBDiscoverMoreVideosInfo description](&v3, sel_description), -[NTPBDiscoverMoreVideosInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *subtitle;
  NSString *actionURLString;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v4, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  actionURLString = self->_actionURLString;
  if (actionURLString)
    objc_msgSend(v4, "setObject:forKey:", actionURLString, CFSTR("actionURLString"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBDiscoverMoreVideosInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_actionURLString)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[3] = (id)-[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v5[2] = (id)-[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);

  v5[1] = (id)-[NSString copyWithZone:](self->_actionURLString, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *title;
  NSString *subtitle;
  NSString *actionURLString;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    title = self->_title;
    if (!((unint64_t)title | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](title, "isEqual:")) != 0)
    {
      subtitle = self->_subtitle;
      if (!((unint64_t)subtitle | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](subtitle, "isEqual:")) != 0)
      {
        actionURLString = self->_actionURLString;
        if ((unint64_t)actionURLString | *((_QWORD *)a3 + 1))
          LOBYTE(v5) = -[NSString isEqual:](actionURLString, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_subtitle, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_actionURLString, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 3))
    -[NTPBDiscoverMoreVideosInfo setTitle:](self, "setTitle:");
  if (*((_QWORD *)a3 + 2))
    -[NTPBDiscoverMoreVideosInfo setSubtitle:](self, "setSubtitle:");
  if (*((_QWORD *)a3 + 1))
    -[NTPBDiscoverMoreVideosInfo setActionURLString:](self, "setActionURLString:");
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionURLString
{
  return self->_actionURLString;
}

@end
