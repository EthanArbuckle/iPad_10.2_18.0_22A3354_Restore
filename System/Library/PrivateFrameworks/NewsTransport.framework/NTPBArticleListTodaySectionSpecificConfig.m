@implementation NTPBArticleListTodaySectionSpecificConfig

- (void)dealloc
{
  objc_super v3;

  -[NTPBArticleListTodaySectionSpecificConfig setArticleListID:](self, "setArticleListID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleListTodaySectionSpecificConfig;
  -[NTPBArticleListTodaySectionSpecificConfig dealloc](&v3, sel_dealloc);
}

- (BOOL)hasArticleListID
{
  return self->_articleListID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleListTodaySectionSpecificConfig;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBArticleListTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBArticleListTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleListID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  articleListID = self->_articleListID;
  if (articleListID)
    objc_msgSend(v3, "setObject:forKey:", articleListID, CFSTR("article_list_ID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleListTodaySectionSpecificConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_articleListID)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)-[NSString copyWithZone:](self->_articleListID, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *articleListID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    articleListID = self->_articleListID;
    if ((unint64_t)articleListID | *((_QWORD *)a3 + 1))
      LOBYTE(v5) = -[NSString isEqual:](articleListID, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_articleListID, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NTPBArticleListTodaySectionSpecificConfig setArticleListID:](self, "setArticleListID:");
}

- (NSString)articleListID
{
  return self->_articleListID;
}

- (void)setArticleListID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
