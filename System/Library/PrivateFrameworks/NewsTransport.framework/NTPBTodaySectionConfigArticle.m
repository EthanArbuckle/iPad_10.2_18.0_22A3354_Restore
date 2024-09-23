@implementation NTPBTodaySectionConfigArticle

- (void)dealloc
{
  objc_super v3;

  -[NTPBTodaySectionConfigArticle setArticleID:](self, "setArticleID:", 0);
  -[NTPBTodaySectionConfigArticle setDisplayDateString:](self, "setDisplayDateString:", 0);
  -[NTPBTodaySectionConfigArticle setStoryType:](self, "setStoryType:", 0);
  -[NTPBTodaySectionConfigArticle setTitle:](self, "setTitle:", 0);
  -[NTPBTodaySectionConfigArticle setPaidArticle:](self, "setPaidArticle:", 0);
  -[NTPBTodaySectionConfigArticle setActionURLString:](self, "setActionURLString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigArticle;
  -[NTPBTodaySectionConfigArticle dealloc](&v3, sel_dealloc);
}

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (BOOL)hasDisplayDateString
{
  return self->_displayDateString != 0;
}

- (BOOL)hasStoryType
{
  return self->_storyType != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasPaidArticle
{
  return self->_paidArticle != 0;
}

- (BOOL)hasActionURLString
{
  return self->_actionURLString != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigArticle;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBTodaySectionConfigArticle description](&v3, sel_description), -[NTPBTodaySectionConfigArticle dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleID;
  NSString *displayDateString;
  NSString *storyType;
  NSString *title;
  NTPBTodaySectionConfigArticle *paidArticle;
  NSString *actionURLString;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  articleID = self->_articleID;
  if (articleID)
    objc_msgSend(v3, "setObject:forKey:", articleID, CFSTR("article_ID"));
  displayDateString = self->_displayDateString;
  if (displayDateString)
    objc_msgSend(v4, "setObject:forKey:", displayDateString, CFSTR("display_date_string"));
  storyType = self->_storyType;
  if (storyType)
    objc_msgSend(v4, "setObject:forKey:", storyType, CFSTR("story_type"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  paidArticle = self->_paidArticle;
  if (paidArticle)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBTodaySectionConfigArticle dictionaryRepresentation](paidArticle, "dictionaryRepresentation"), CFSTR("paid_article"));
  actionURLString = self->_actionURLString;
  if (actionURLString)
    objc_msgSend(v4, "setObject:forKey:", actionURLString, CFSTR("action_URL_string"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionConfigArticleReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_articleID)
    PBDataWriterWriteStringField();
  if (self->_displayDateString)
    PBDataWriterWriteStringField();
  if (self->_storyType)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_paidArticle)
    PBDataWriterWriteSubmessage();
  if (self->_actionURLString)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[2] = (id)-[NSString copyWithZone:](self->_articleID, "copyWithZone:", a3);
  v5[3] = (id)-[NSString copyWithZone:](self->_displayDateString, "copyWithZone:", a3);

  v5[5] = (id)-[NSString copyWithZone:](self->_storyType, "copyWithZone:", a3);
  v5[6] = (id)-[NSString copyWithZone:](self->_title, "copyWithZone:", a3);

  v5[4] = -[NTPBTodaySectionConfigArticle copyWithZone:](self->_paidArticle, "copyWithZone:", a3);
  v5[1] = (id)-[NSString copyWithZone:](self->_actionURLString, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *articleID;
  NSString *displayDateString;
  NSString *storyType;
  NSString *title;
  NTPBTodaySectionConfigArticle *paidArticle;
  NSString *actionURLString;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    articleID = self->_articleID;
    if (!((unint64_t)articleID | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](articleID, "isEqual:")) != 0)
    {
      displayDateString = self->_displayDateString;
      if (!((unint64_t)displayDateString | *((_QWORD *)a3 + 3))
        || (v5 = -[NSString isEqual:](displayDateString, "isEqual:")) != 0)
      {
        storyType = self->_storyType;
        if (!((unint64_t)storyType | *((_QWORD *)a3 + 5))
          || (v5 = -[NSString isEqual:](storyType, "isEqual:")) != 0)
        {
          title = self->_title;
          if (!((unint64_t)title | *((_QWORD *)a3 + 6)) || (v5 = -[NSString isEqual:](title, "isEqual:")) != 0)
          {
            paidArticle = self->_paidArticle;
            if (!((unint64_t)paidArticle | *((_QWORD *)a3 + 4))
              || (v5 = -[NTPBTodaySectionConfigArticle isEqual:](paidArticle, "isEqual:")) != 0)
            {
              actionURLString = self->_actionURLString;
              if ((unint64_t)actionURLString | *((_QWORD *)a3 + 1))
                LOBYTE(v5) = -[NSString isEqual:](actionURLString, "isEqual:");
              else
                LOBYTE(v5) = 1;
            }
          }
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
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_articleID, "hash");
  v4 = -[NSString hash](self->_displayDateString, "hash") ^ v3;
  v5 = -[NSString hash](self->_storyType, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_title, "hash");
  v7 = -[NTPBTodaySectionConfigArticle hash](self->_paidArticle, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_actionURLString, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBTodaySectionConfigArticle *paidArticle;
  uint64_t v6;

  if (*((_QWORD *)a3 + 2))
    -[NTPBTodaySectionConfigArticle setArticleID:](self, "setArticleID:");
  if (*((_QWORD *)a3 + 3))
    -[NTPBTodaySectionConfigArticle setDisplayDateString:](self, "setDisplayDateString:");
  if (*((_QWORD *)a3 + 5))
    -[NTPBTodaySectionConfigArticle setStoryType:](self, "setStoryType:");
  if (*((_QWORD *)a3 + 6))
    -[NTPBTodaySectionConfigArticle setTitle:](self, "setTitle:");
  paidArticle = self->_paidArticle;
  v6 = *((_QWORD *)a3 + 4);
  if (paidArticle)
  {
    if (v6)
      -[NTPBTodaySectionConfigArticle mergeFrom:](paidArticle, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBTodaySectionConfigArticle setPaidArticle:](self, "setPaidArticle:");
  }
  if (*((_QWORD *)a3 + 1))
    -[NTPBTodaySectionConfigArticle setActionURLString:](self, "setActionURLString:");
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)displayDateString
{
  return self->_displayDateString;
}

- (void)setDisplayDateString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)storyType
{
  return self->_storyType;
}

- (void)setStoryType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NTPBTodaySectionConfigArticle)paidArticle
{
  return self->_paidArticle;
}

- (void)setPaidArticle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)actionURLString
{
  return self->_actionURLString;
}

- (void)setActionURLString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
