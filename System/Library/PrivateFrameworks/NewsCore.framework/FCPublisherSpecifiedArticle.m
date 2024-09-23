@implementation FCPublisherSpecifiedArticle

- (NSString)articleID
{
  return self->_articleID;
}

- (FCPublisherSpecifiedArticle)initWithDictionary:(id)a3
{
  id v4;
  FCPublisherSpecifiedArticle *v5;
  uint64_t v6;
  NSString *articleID;
  uint64_t v8;
  NSString *title;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCPublisherSpecifiedArticle;
  v5 = -[FCPublisherSpecifiedArticle init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("articleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    articleID = v5->_articleID;
    v5->_articleID = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

- (NSDate)displayDate
{
  return 0;
}

- (NSString)storyType
{
  return 0;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
