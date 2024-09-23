@implementation IAMImage

- (IAMImage)initWithIdentifier:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  IAMImage *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSURL *url;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMImage;
  v8 = -[IAMImage init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v11;

  }
  return v8;
}

- (IAMImage)initWithIdentifier:(id)a3 url:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  id v10;
  id v11;
  IAMImage *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSURL *url;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IAMImage;
  v12 = -[IAMImage init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    url = v12->_url;
    v12->_url = (NSURL *)v15;

    v12->_width = a5;
    v12->_height = a6;
  }

  return v12;
}

- (IAMImage)initWithICImage:(id)a3
{
  id v4;
  IAMImage *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  void *v10;
  uint64_t v11;
  NSURL *url;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IAMImage;
  v5 = -[IAMImage init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "uRL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v11;

    v5->_width = objc_msgSend(v4, "width");
    v5->_height = objc_msgSend(v4, "height");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:url:width:height:", self->_identifier, self->_url, self->_width, self->_height);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)url
{
  return self->_url;
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
