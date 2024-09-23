@implementation NDTodayFeedConfig

- (NDTodayFeedConfig)initWithPublishDate:(id)a3 topStoriesArticleIDs:(id)a4 topStoriesPackageURLs:(id)a5
{
  id v8;
  id v9;
  id v10;
  NDTodayFeedConfig *v11;
  uint64_t v12;
  NSDate *publishDate;
  uint64_t v14;
  NSArray *topStoriesArticleIDs;
  uint64_t v16;
  NSArray *topStoriesPackageURLs;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NDTodayFeedConfig;
  v11 = -[NDTodayFeedConfig init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    publishDate = v11->_publishDate;
    v11->_publishDate = (NSDate *)v12;

    v14 = objc_msgSend(v9, "copy");
    topStoriesArticleIDs = v11->_topStoriesArticleIDs;
    v11->_topStoriesArticleIDs = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    topStoriesPackageURLs = v11->_topStoriesPackageURLs;
    v11->_topStoriesPackageURLs = (NSArray *)v16;

  }
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D58AB0]), "initWithObject:", self);
  -[NDTodayFeedConfig publishDate](self, "publishDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("publishDate"), v4);

  -[NDTodayFeedConfig topStoriesArticleIDs](self, "topStoriesArticleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("topStoriesArticleIDs"), v5);

  -[NDTodayFeedConfig topStoriesPackageURLs](self, "topStoriesPackageURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("topStoriesPackageURLs"), v6);

  objc_msgSend(v3, "descriptionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NDTodayFeedConfig)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NDTodayFeedConfig *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publishDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("topStoriesArticleIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("topStoriesPackageURLs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v6)
    v9 = v6;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v10 = v7;
  else
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = -[NDTodayFeedConfig initWithPublishDate:topStoriesArticleIDs:topStoriesPackageURLs:](self, "initWithPublishDate:topStoriesArticleIDs:topStoriesPackageURLs:", v8, v9, v10);
  if (!v5)

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NDTodayFeedConfig publishDate](self, "publishDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("publishDate"));

  -[NDTodayFeedConfig topStoriesArticleIDs](self, "topStoriesArticleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("topStoriesArticleIDs"));

  -[NDTodayFeedConfig topStoriesPackageURLs](self, "topStoriesPackageURLs");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("topStoriesPackageURLs"));

}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (NSArray)topStoriesArticleIDs
{
  return self->_topStoriesArticleIDs;
}

- (NSArray)topStoriesPackageURLs
{
  return self->_topStoriesPackageURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topStoriesPackageURLs, 0);
  objc_storeStrong((id *)&self->_topStoriesArticleIDs, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
}

@end
