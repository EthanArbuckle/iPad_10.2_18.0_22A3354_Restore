@implementation MWFeedInfo

- (id)description
{
  void *v3;
  NSString *title;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("MWFeedInfo: "));
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
  return v3;
}

- (MWFeedInfo)initWithCoder:(id)a3
{
  id v4;
  MWFeedInfo *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *link;
  uint64_t v10;
  NSString *summary;
  uint64_t v12;
  NSURL *url;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MWFeedInfo;
  v5 = -[MWFeedInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->title;
    v5->title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("link"));
    v8 = objc_claimAutoreleasedReturnValue();
    link = v5->link;
    v5->link = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("summary"));
    v10 = objc_claimAutoreleasedReturnValue();
    summary = v5->summary;
    v5->summary = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("url"));
    v12 = objc_claimAutoreleasedReturnValue();
    url = v5->url;
    v5->url = (NSURL *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *title;
  NSString *link;
  NSString *summary;
  NSURL *url;
  id v9;

  v4 = a3;
  title = self->title;
  v9 = v4;
  if (title)
  {
    objc_msgSend(v4, "encodeObject:forKey:", title, CFSTR("title"));
    v4 = v9;
  }
  link = self->link;
  if (link)
  {
    objc_msgSend(v9, "encodeObject:forKey:", link, CFSTR("link"));
    v4 = v9;
  }
  summary = self->summary;
  if (summary)
  {
    objc_msgSend(v9, "encodeObject:forKey:", summary, CFSTR("summary"));
    v4 = v9;
  }
  url = self->url;
  if (url)
  {
    objc_msgSend(v9, "encodeObject:forKey:", url, CFSTR("url"));
    v4 = v9;
  }

}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)link
{
  return self->link;
}

- (void)setLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)summary
{
  return self->summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)url
{
  return self->url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->url, 0);
  objc_storeStrong((id *)&self->summary, 0);
  objc_storeStrong((id *)&self->link, 0);
  objc_storeStrong((id *)&self->title, 0);
}

@end
