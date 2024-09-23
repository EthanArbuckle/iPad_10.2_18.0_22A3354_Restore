@implementation NTPBAudioPlaylistItem

- (void)dealloc
{
  objc_super v3;

  -[NTPBAudioPlaylistItem setIdentifier:](self, "setIdentifier:", 0);
  -[NTPBAudioPlaylistItem setArticleID:](self, "setArticleID:", 0);
  -[NTPBAudioPlaylistItem setDateAdded:](self, "setDateAdded:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBAudioPlaylistItem;
  -[NTPBAudioPlaylistItem dealloc](&v3, sel_dealloc);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (BOOL)hasDateAdded
{
  return self->_dateAdded != 0;
}

- (void)setListOrder:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_listOrder = a3;
}

- (void)setHasListOrder:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasListOrder
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBAudioPlaylistItem;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBAudioPlaylistItem description](&v3, sel_description), -[NTPBAudioPlaylistItem dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *articleID;
  NTPBDate *dateAdded;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  articleID = self->_articleID;
  if (articleID)
    objc_msgSend(v4, "setObject:forKey:", articleID, CFSTR("article_ID"));
  dateAdded = self->_dateAdded;
  if (dateAdded)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](dateAdded, "dictionaryRepresentation"), CFSTR("date_added"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_listOrder), CFSTR("list_order"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAudioPlaylistItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_articleID)
    PBDataWriterWriteStringField();
  if (self->_dateAdded)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_articleID, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 24) = -[NTPBDate copyWithZone:](self->_dateAdded, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_listOrder;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *identifier;
  NSString *articleID;
  NTPBDate *dateAdded;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((_QWORD *)a3 + 4))
      || (v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      articleID = self->_articleID;
      if (!((unint64_t)articleID | *((_QWORD *)a3 + 2))
        || (v5 = -[NSString isEqual:](articleID, "isEqual:")) != 0)
      {
        dateAdded = self->_dateAdded;
        if (!((unint64_t)dateAdded | *((_QWORD *)a3 + 3))
          || (v5 = -[NTPBDate isEqual:](dateAdded, "isEqual:")) != 0)
        {
          LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 1) == 0;
          if ((*(_BYTE *)&self->_has & 1) != 0)
            LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 1) != 0 && self->_listOrder == *((_QWORD *)a3 + 1);
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_articleID, "hash");
  v5 = -[NTPBDate hash](self->_dateAdded, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_listOrder;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NTPBDate *dateAdded;
  uint64_t v6;

  if (*((_QWORD *)a3 + 4))
    -[NTPBAudioPlaylistItem setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)a3 + 2))
    -[NTPBAudioPlaylistItem setArticleID:](self, "setArticleID:");
  dateAdded = self->_dateAdded;
  v6 = *((_QWORD *)a3 + 3);
  if (dateAdded)
  {
    if (v6)
      -[NTPBDate mergeFrom:](dateAdded, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBAudioPlaylistItem setDateAdded:](self, "setDateAdded:");
  }
  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_listOrder = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NTPBDate)dateAdded
{
  return self->_dateAdded;
}

- (void)setDateAdded:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)listOrder
{
  return self->_listOrder;
}

@end
