@implementation NTPBTodaySectionConfigItem

- (void)dealloc
{
  objc_super v3;

  -[NTPBTodaySectionConfigItem setArticle:](self, "setArticle:", 0);
  -[NTPBTodaySectionConfigItem setWebEmbed:](self, "setWebEmbed:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigItem;
  -[NTPBTodaySectionConfigItem dealloc](&v3, sel_dealloc);
}

- (int)itemType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_itemType;
  else
    return 0;
}

- (void)setItemType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_itemType = a3;
}

- (void)setHasItemType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasItemType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasArticle
{
  return self->_article != 0;
}

- (BOOL)hasWebEmbed
{
  return self->_webEmbed != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigItem;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBTodaySectionConfigItem description](&v3, sel_description), -[NTPBTodaySectionConfigItem dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBTodaySectionConfigArticle *article;
  NTPBTodaySectionConfigWebEmbed *webEmbed;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_itemType), CFSTR("item_type"));
  article = self->_article;
  if (article)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBTodaySectionConfigArticle dictionaryRepresentation](article, "dictionaryRepresentation"), CFSTR("article"));
  webEmbed = self->_webEmbed;
  if (webEmbed)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBTodaySectionConfigWebEmbed dictionaryRepresentation](webEmbed, "dictionaryRepresentation"), CFSTR("web_embed"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionConfigItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_article)
    PBDataWriterWriteSubmessage();
  if (self->_webEmbed)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_itemType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  *(_QWORD *)(v6 + 8) = -[NTPBTodaySectionConfigArticle copyWithZone:](self->_article, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NTPBTodaySectionConfigWebEmbed copyWithZone:](self->_webEmbed, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBTodaySectionConfigArticle *article;
  NTPBTodaySectionConfigWebEmbed *webEmbed;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_itemType != *((_DWORD *)a3 + 4))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    article = self->_article;
    if (!((unint64_t)article | *((_QWORD *)a3 + 1))
      || (v5 = -[NTPBTodaySectionConfigArticle isEqual:](article, "isEqual:")) != 0)
    {
      webEmbed = self->_webEmbed;
      if ((unint64_t)webEmbed | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[NTPBTodaySectionConfigWebEmbed isEqual:](webEmbed, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_itemType;
  else
    v3 = 0;
  v4 = -[NTPBTodaySectionConfigArticle hash](self->_article, "hash") ^ v3;
  return v4 ^ -[NTPBTodaySectionConfigWebEmbed hash](self->_webEmbed, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBTodaySectionConfigArticle *article;
  uint64_t v6;
  NTPBTodaySectionConfigWebEmbed *webEmbed;
  uint64_t v8;

  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_itemType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  article = self->_article;
  v6 = *((_QWORD *)a3 + 1);
  if (article)
  {
    if (v6)
      -[NTPBTodaySectionConfigArticle mergeFrom:](article, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBTodaySectionConfigItem setArticle:](self, "setArticle:");
  }
  webEmbed = self->_webEmbed;
  v8 = *((_QWORD *)a3 + 3);
  if (webEmbed)
  {
    if (v8)
      -[NTPBTodaySectionConfigWebEmbed mergeFrom:](webEmbed, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBTodaySectionConfigItem setWebEmbed:](self, "setWebEmbed:");
  }
}

- (NTPBTodaySectionConfigArticle)article
{
  return self->_article;
}

- (void)setArticle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NTPBTodaySectionConfigWebEmbed)webEmbed
{
  return self->_webEmbed;
}

- (void)setWebEmbed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
