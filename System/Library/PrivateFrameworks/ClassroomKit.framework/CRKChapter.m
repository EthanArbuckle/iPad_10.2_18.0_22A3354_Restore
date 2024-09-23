@implementation CRKChapter

- (CRKChapter)init
{
  CRKChapter *v2;
  CRKChapter *v3;
  NSArray *subchapters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKChapter;
  v2 = -[CRKChapter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    subchapters = v2->_subchapters;
    v2->_subchapters = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v3;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKChapter title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKChapter subchapters](self, "subchapters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKChapter webURL](self, "webURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { title = %@, subchapters = %@, webURL = %@ }>"), v4, self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)JSONRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[CRKChapter title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Title"));

  -[CRKChapter webURL](self, "webURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Web URL"));

  -[CRKChapter subchapters](self, "subchapters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[CRKChapter subchapters](self, "subchapters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("JSONRepresentation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("Subchapters"));

  }
  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKChapter)initWithCoder:(id)a3
{
  id v4;
  CRKChapter *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *subchapters;
  void *v14;
  uint64_t v15;
  NSURL *webURL;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRKChapter;
  v5 = -[CRKChapter init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("title"));
    v7 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("subchapters"));
    v12 = objc_claimAutoreleasedReturnValue();
    subchapters = v5->_subchapters;
    v5->_subchapters = (NSArray *)v12;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("webURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    webURL = v5->_webURL;
    v5->_webURL = (NSURL *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CRKChapter title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[CRKChapter subchapters](self, "subchapters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subchapters"));

  -[CRKChapter webURL](self, "webURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("webURL"));

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)subchapters
{
  return self->_subchapters;
}

- (void)setSubchapters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
  objc_storeStrong((id *)&self->_webURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_subchapters, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
