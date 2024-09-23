@implementation NTPBTodaySectionConfigWebEmbed

- (void)dealloc
{
  objc_super v3;

  -[NTPBTodaySectionConfigWebEmbed setUrlString:](self, "setUrlString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigWebEmbed;
  -[NTPBTodaySectionConfigWebEmbed dealloc](&v3, sel_dealloc);
}

- (BOOL)hasUrlString
{
  return self->_urlString != 0;
}

- (void)setPreferredSlotAllocation:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_preferredSlotAllocation = a3;
}

- (void)setHasPreferredSlotAllocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPreferredSlotAllocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigWebEmbed;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBTodaySectionConfigWebEmbed description](&v3, sel_description), -[NTPBTodaySectionConfigWebEmbed dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *urlString;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  urlString = self->_urlString;
  if (urlString)
    objc_msgSend(v3, "setObject:forKey:", urlString, CFSTR("url_string"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_preferredSlotAllocation), CFSTR("preferred_slot_allocation"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionConfigWebEmbedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_urlString)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_urlString, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_preferredSlotAllocation;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *urlString;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    urlString = self->_urlString;
    if (!((unint64_t)urlString | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](urlString, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) != 0 && self->_preferredSlotAllocation == *((_QWORD *)a3 + 1);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_urlString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_preferredSlotAllocation;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 2))
    -[NTPBTodaySectionConfigWebEmbed setUrlString:](self, "setUrlString:");
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_preferredSlotAllocation = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)preferredSlotAllocation
{
  return self->_preferredSlotAllocation;
}

@end
