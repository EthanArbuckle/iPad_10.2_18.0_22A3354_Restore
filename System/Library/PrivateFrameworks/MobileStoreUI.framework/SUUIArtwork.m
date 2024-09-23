@implementation SUUIArtwork

- (SUUIArtwork)initWithArtworkDictionary:(id)a3
{
  id v4;
  SUUIArtwork *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIArtwork;
  v5 = -[SUUIArtwork init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_urlString, v6);
    objc_msgSend(v4, "objectForKey:", CFSTR("width"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_width = objc_msgSend(v7, "integerValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("height"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_height = objc_msgSend(v8, "integerValue");

  }
  return v5;
}

- (SUUIArtwork)initWithURL:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  SUUIArtwork *v8;
  SUUIArtwork *v9;
  uint64_t v10;
  NSURL *url;
  objc_super v13;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIArtwork;
  v8 = -[SUUIArtwork init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_height = (uint64_t)height;
    v10 = objc_msgSend(v7, "copy");
    url = v9->_url;
    v9->_url = (NSURL *)v10;

    v9->_width = (uint64_t)width;
  }

  return v9;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = (double)self->_width;
  height = (double)self->_height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSURL)URL
{
  NSURL *url;
  NSURL *v4;
  NSURL *v5;
  NSString *urlString;

  url = self->_url;
  if (!url)
  {
    if (self->_urlString)
    {
      v4 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", self->_urlString);
      v5 = self->_url;
      self->_url = v4;

      urlString = self->_urlString;
      self->_urlString = 0;

      url = self->_url;
    }
    else
    {
      url = 0;
    }
  }
  return url;
}

- (id)_lookupDictionary
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL absoluteString](self->_url, "absoluteString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v4 || (v4 = self->_urlString) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("url"));

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", self->_height);
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("height"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", self->_width);
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("width"));

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t width;
  int64_t height;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)SUUIArtwork;
  -[SUUIArtwork description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  width = self->_width;
  height = self->_height;
  -[SUUIArtwork URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%ld, %ld]; %@"), v4, width, height, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_url, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t width;
  int64_t height;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && (width = self->_width, width == objc_msgSend(v4, "width"))
    && (height = self->_height, height == objc_msgSend(v4, "height")))
  {
    -[SUUIArtwork URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 8) = self->_height;
  objc_storeStrong((id *)(v4 + 24), self->_urlString);
  v5 = -[NSURL copy](self->_url, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  *(_QWORD *)(v4 + 32) = self->_width;
  return (id)v4;
}

- (SUUIArtwork)initWithCacheRepresentation:(id)a3
{
  id v4;
  SUUIArtwork *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURL *url;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SUUIArtwork;
    v5 = -[SUUIArtwork init](&v12, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("height"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_height = (int)objc_msgSend(v6, "intValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("width"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_width = (int)objc_msgSend(v7, "intValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("url"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v8);
        url = v5->_url;
        v5->_url = (NSURL *)v9;

      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("height"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("width"));

  -[SUUIArtwork URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("url"));

  return (NSMutableDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUUIArtwork)initWithCoder:(id)a3
{
  id v4;
  SUUIArtwork *v5;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIArtwork;
  v5 = -[SUUIArtwork init](&v9, sel_init);
  if (v5)
  {
    v5->_height = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("height"));
    v5->_width = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("width"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t height;
  id v5;

  height = self->_height;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", height, CFSTR("height"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_width, CFSTR("width"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("URL"));

}

- (int64_t)height
{
  return self->_height;
}

- (int64_t)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
