@implementation SUUIArtworkTemplate

- (SUUIArtworkTemplate)initWithTemplateDictionary:(id)a3
{
  id v4;
  SUUIArtworkTemplate *v5;
  NSMutableSet *v6;
  NSMutableSet *servedArtworks;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIArtworkTemplate;
  v5 = -[SUUIArtworkTemplate init](&v12, sel_init);
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    servedArtworks = v5->_servedArtworks;
    v5->_servedArtworks = v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_urlTemplateString, v8);
    objc_msgSend(v4, "objectForKey:", CFSTR("width"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_width = objc_msgSend(v9, "integerValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("height"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_height = objc_msgSend(v10, "integerValue");

  }
  return v5;
}

- (id)artworkForSize:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SUUIArtworkTemplate artworkWithWidth:](self, "artworkWithWidth:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  return v4;
}

- (id)artworkURLForSize:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SUUIArtworkTemplate artworkForSize:](self, "artworkForSize:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)artworkWithWidth:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SUUIArtworkTemplate _artworkWithWidth:](self, "_artworkWithWidth:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  return v4;
}

- (id)bestArtworkForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  SUUIArtwork *v7;
  void *v8;
  SUUIArtwork *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  -[SUUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [SUUIArtwork alloc];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
  v9 = -[SUUIArtwork initWithURL:size:](v7, "initWithURL:size:", v8, width, height);

  -[SUUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

  return v9;
}

- (id)bestArtworkForScaledSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  -[SUUIArtworkTemplate bestArtworkForSize:](self, "bestArtworkForSize:", ceil(width * v8), ceil(height * v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

  return v9;
}

- (id)preferredExactArtworkForSize:(CGSize)a3
{
  void *v4;
  void *v5;

  -[SUUIArtworkTemplate bestArtworkForSize:](self, "bestArtworkForSize:", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  return v4;
}

- (BOOL)hasArtwork
{
  return self->_urlTemplateString != 0;
}

+ (BOOL)canHandleArtworkFormat:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (SUUIArtwork)largestArtwork
{
  double width;
  double height;
  void *v5;
  SUUIArtwork *v6;
  void *v7;
  SUUIArtwork *v8;
  void *v9;

  width = (double)self->_width;
  height = (double)self->_height;
  -[SUUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:", width, height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [SUUIArtwork alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUUIArtwork initWithURL:size:](v6, "initWithURL:size:", v7, width, height);

  -[SUUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  return v8;
}

- (SUUIArtwork)smallestArtwork
{
  void *v3;
  SUUIArtwork *v4;
  void *v5;
  SUUIArtwork *v6;
  void *v7;

  -[SUUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:", 65.0, 65.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SUUIArtwork alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUUIArtwork initWithURL:size:](v4, "initWithURL:size:", v5, 65.0, 65.0);

  -[SUUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  return v6;
}

- (id)_artworkWithWidth:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  SUUIArtwork *v10;

  -[SUUIArtworkTemplate _sizeForWidth:](self, "_sizeForWidth:");
  v6 = v5;
  v8 = v7;
  -[SUUIArtworkTemplate _artworkURLWithWidth:](self, "_artworkURLWithWidth:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUUIArtwork initWithURL:size:]([SUUIArtwork alloc], "initWithURL:size:", v9, v6, v8);

  return v10;
}

- (id)_artworkURLWithWidth:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SUUIArtworkTemplate _sizeForWidth:](self, "_sizeForWidth:", a3);
  -[SUUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGSize)_sizeForWidth:(int64_t)a3
{
  double v3;
  double v4;
  int64_t height;
  int64_t width;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  height = self->_height;
  if (height >= 1)
  {
    width = self->_width;
    if (width >= 1)
    {
      v3 = (double)a3;
      v4 = ceil((double)height / (double)width * (double)a3);
    }
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_urlStringWithTargetSize:(CGSize)a3
{
  void *v3;
  double height;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = 0;
  if (self->_urlTemplateString)
  {
    if (a3.width > 0.0)
    {
      height = a3.height;
      if (a3.height > 0.0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), (uint64_t)a3.width);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), (uint64_t)height);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByReplacingOccurrencesOfString:withString:](self->_urlTemplateString, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{h}"), v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{f}"), CFSTR("jpg"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{c}"), CFSTR("bb"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  return v3;
}

- (id)_lookupDictionary
{
  void *v2;
  void *v3;

  -[SUUIArtworkTemplate largestArtwork](self, "largestArtwork");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_lookupDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *urlTemplateString;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    urlTemplateString = self->_urlTemplateString;
    objc_msgSend(v4, "urlTemplateString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](urlTemplateString, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_urlTemplateString, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_urlTemplateString, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v5[2] = self->_width;
  v5[1] = self->_height;
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SUUIArtworkTemplate;
  -[SUUIArtworkTemplate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIArtworkTemplate largestArtwork](self, "largestArtwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Artwork: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUUIArtworkTemplate)initWithCoder:(id)a3
{
  id v4;
  SUUIArtworkTemplate *v5;
  uint64_t v6;
  NSString *urlTemplateString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIArtworkTemplate;
  v5 = -[SUUIArtworkTemplate init](&v9, sel_init);
  if (v5)
  {
    v5->_height = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("height"));
    v5->_width = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("width"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("urlTemplateString"));
    v6 = objc_claimAutoreleasedReturnValue();
    urlTemplateString = v5->_urlTemplateString;
    v5->_urlTemplateString = (NSString *)v6;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlTemplateString, CFSTR("urlTemplateString"));

}

- (SUUIArtworkTemplate)initWithCacheRepresentation:(id)a3
{
  id v4;
  SUUIArtworkTemplate *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)SUUIArtworkTemplate;
    v5 = -[SUUIArtworkTemplate init](&v10, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("urlTemplateString"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v5->_urlTemplateString, v6);
      objc_msgSend(v4, "objectForKey:", CFSTR("width"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_width = objc_msgSend(v7, "integerValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("height"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_height = objc_msgSend(v8, "integerValue");

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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKey:", self->_urlTemplateString, CFSTR("urlTemplateString"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("width"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("height"));

  return (NSMutableDictionary *)v3;
}

- (int64_t)height
{
  return self->_height;
}

- (int64_t)width
{
  return self->_width;
}

- (NSString)urlTemplateString
{
  return self->_urlTemplateString;
}

- (NSMutableSet)servedArtworks
{
  return self->_servedArtworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servedArtworks, 0);
  objc_storeStrong((id *)&self->_urlTemplateString, 0);
}

@end
