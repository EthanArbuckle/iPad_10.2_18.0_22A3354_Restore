@implementation MWFeedItem

- (id)description
{
  void *v3;
  NSString *title;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("MWFeedItem: "));
  title = self->title;
  if (title)
  {
    if (-[NSString length](title, "length") <= 0x32)
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("“%@”"), self->title);
    }
    else
    {
      -[NSString substringToIndex:](self->title, "substringToIndex:", 49);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("…"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("“%@”"), v6);

    }
  }
  if (self->date)
    objc_msgSend(v3, "appendFormat:", CFSTR(" - %@"), self->date);
  return v3;
}

- (MWFeedItem)initWithCoder:(id)a3
{
  id v4;
  MWFeedItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *link;
  uint64_t v12;
  NSDate *date;
  uint64_t v14;
  NSDate *updated;
  uint64_t v16;
  NSString *summary;
  uint64_t v18;
  NSString *content;
  uint64_t v20;
  NSString *author;
  uint64_t v22;
  NSArray *enclosures;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MWFeedItem;
  v5 = -[MWFeedItem init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->identifier;
    v5->identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->title;
    v5->title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("link"));
    v10 = objc_claimAutoreleasedReturnValue();
    link = v5->link;
    v5->link = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("date"));
    v12 = objc_claimAutoreleasedReturnValue();
    date = v5->date;
    v5->date = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("updated"));
    v14 = objc_claimAutoreleasedReturnValue();
    updated = v5->updated;
    v5->updated = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("summary"));
    v16 = objc_claimAutoreleasedReturnValue();
    summary = v5->summary;
    v5->summary = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("content"));
    v18 = objc_claimAutoreleasedReturnValue();
    content = v5->content;
    v5->content = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("author"));
    v20 = objc_claimAutoreleasedReturnValue();
    author = v5->author;
    v5->author = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("enclosures"));
    v22 = objc_claimAutoreleasedReturnValue();
    enclosures = v5->enclosures;
    v5->enclosures = (NSArray *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *title;
  NSString *link;
  NSDate *date;
  NSDate *updated;
  NSString *summary;
  NSString *content;
  NSString *author;
  NSArray *enclosures;
  id v14;

  v4 = a3;
  identifier = self->identifier;
  v14 = v4;
  if (identifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", identifier, CFSTR("identifier"));
    v4 = v14;
  }
  title = self->title;
  if (title)
  {
    objc_msgSend(v14, "encodeObject:forKey:", title, CFSTR("title"));
    v4 = v14;
  }
  link = self->link;
  if (link)
  {
    objc_msgSend(v14, "encodeObject:forKey:", link, CFSTR("link"));
    v4 = v14;
  }
  date = self->date;
  if (date)
  {
    objc_msgSend(v14, "encodeObject:forKey:", date, CFSTR("date"));
    v4 = v14;
  }
  updated = self->updated;
  if (updated)
  {
    objc_msgSend(v14, "encodeObject:forKey:", updated, CFSTR("updated"));
    v4 = v14;
  }
  summary = self->summary;
  if (summary)
  {
    objc_msgSend(v14, "encodeObject:forKey:", summary, CFSTR("summary"));
    v4 = v14;
  }
  content = self->content;
  if (content)
  {
    objc_msgSend(v14, "encodeObject:forKey:", content, CFSTR("content"));
    v4 = v14;
  }
  author = self->author;
  if (author)
  {
    objc_msgSend(v14, "encodeObject:forKey:", author, CFSTR("author"));
    v4 = v14;
  }
  enclosures = self->enclosures;
  if (enclosures)
  {
    objc_msgSend(v14, "encodeObject:forKey:", enclosures, CFSTR("enclosures"));
    v4 = v14;
  }

}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)link
{
  return self->link;
}

- (void)setLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)date
{
  return self->date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)updated
{
  return self->updated;
}

- (void)setUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)summary
{
  return self->summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)content
{
  return self->content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)author
{
  return self->author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)enclosures
{
  return self->enclosures;
}

- (void)setEnclosures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->enclosures, 0);
  objc_storeStrong((id *)&self->author, 0);
  objc_storeStrong((id *)&self->content, 0);
  objc_storeStrong((id *)&self->summary, 0);
  objc_storeStrong((id *)&self->updated, 0);
  objc_storeStrong((id *)&self->date, 0);
  objc_storeStrong((id *)&self->link, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

- (id)mainImageURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MWFeedItem enclosures](self, "enclosures");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = *MEMORY[0x24BDF8410];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("url"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "conformsToUTType:", v5))
          v11 = v8 == 0;
        else
          v11 = 1;
        if (!v11)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          return v12;
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

  objc_msgSend(MEMORY[0x24BE193A8], "mainImageURLFromHTML:", self->content);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)asWFArticle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[MWFeedItem content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x24BE193A8], "numberOfWordsInString:", v3);
  v5 = (void *)MEMORY[0x24BDBCF48];
  -[MWFeedItem link](self, "link");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BE193A8];
  -[MWFeedItem title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MWFeedItem author](self, "author");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MWFeedItem date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MWFeedItem summary](self, "summary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MWFeedItem mainImageURL](self, "mainImageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "articleWithTitle:author:publishedDate:body:excerpt:numberOfWords:mainImageURL:URL:", v9, v10, v11, v3, v12, v4, v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
