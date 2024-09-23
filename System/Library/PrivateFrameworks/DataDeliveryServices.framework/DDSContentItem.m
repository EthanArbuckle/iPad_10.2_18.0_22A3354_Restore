@implementation DDSContentItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_parentAsset, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[DDSContentItem isEqualToContentItem:](self, "isEqualToContentItem:", v4);

  return v5;
}

- (BOOL)isEqualToContentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[DDSContentItem parentAsset](self, "parentAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[DDSContentItem contents](self, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)locale
{
  void *v2;
  void *v3;

  -[DDSContentItem contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kLocale);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)fileName
{
  void *v2;
  void *v3;

  -[DDSContentItem contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kContentPath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)type
{
  void *v2;
  void *v3;

  -[DDSContentItem contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kContentType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)path
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[DDSContentItem contents](self, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", kContentPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DDSContentItem parentAsset](self, "parentAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (DDSAsset)parentAsset
{
  return self->_parentAsset;
}

- (DDSContentItem)initWithParentAsset:(id)a3 contents:(id)a4
{
  id v7;
  id v8;
  DDSContentItem *v9;
  DDSContentItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DDSContentItem;
  v9 = -[DDSContentItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentAsset, a3);
    objc_storeStrong((id *)&v10->_contents, a4);
  }

  return v10;
}

- (DDSContentItem)init
{

  return 0;
}

- (NSDictionary)region
{
  void *v2;
  void *v3;

  -[DDSContentItem contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kRegion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DDSContentItem contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", kContentType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSContentItem contents](self, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", kContentPath);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, type: %@, path: %@>"), v4, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setParentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_parentAsset, a3);
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

@end
