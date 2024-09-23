@implementation CRKBook

- (CRKBook)init
{
  CRKBook *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRKBook;
  result = -[CRKBook init](&v3, sel_init);
  if (result)
    result->_type = 3;
  return result;
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
  void *v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKBook title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKBook author](self, "author");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKBook path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKBook imageDescription](self, "imageDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKBook webURL](self, "webURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCRKBookType(-[CRKBook type](self, "type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CRKBook hasChapters](self, "hasChapters");
  v13 = CFSTR("NO");
  if (v12)
    v13 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { title = %@, author = %@, path = %@, image = %@, webURL = %@, type = %@, hasChapters = %@ }>"), v4, self, v5, v6, v7, v8, v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)imageDescription
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[CRKBook image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[CRKBook image](self, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<Data with length %lu>"), objc_msgSend(v5, "length"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("nil");
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKBook)initWithCoder:(id)a3
{
  id v4;
  CRKBook *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *author;
  void *v12;
  uint64_t v13;
  NSString *path;
  void *v15;
  uint64_t v16;
  NSData *image;
  void *v18;
  uint64_t v19;
  NSURL *webURL;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRKBook;
  v5 = -[CRKBook init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("title"));
    v7 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("author"));
    v10 = objc_claimAutoreleasedReturnValue();
    author = v5->_author;
    v5->_author = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("path"));
    v13 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("image"));
    v16 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (NSData *)v16;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("webURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    webURL = v5->_webURL;
    v5->_webURL = (NSURL *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasChapters"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasChapters = objc_msgSend(v21, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CRKBook title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[CRKBook author](self, "author");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("author"));

  -[CRKBook path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("path"));

  -[CRKBook image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("image"));

  -[CRKBook webURL](self, "webURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("webURL"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKBook hasChapters](self, "hasChapters"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("hasChapters"));

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)hasChapters
{
  return self->_hasChapters;
}

- (void)setHasChapters:(BOOL)a3
{
  self->_hasChapters = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
