@implementation _SFReaderExtractedData

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; author = %@; publishedDate = %@; title = %@; mainImageURL = %@; url = %@; body = %@;"),
               objc_opt_class(),
               self,
               self->_author,
               self->_publishedDate,
               self->_title,
               self->_mainImageURL,
               self->_url,
               self->_body);
}

- (_SFReaderExtractedData)initWithReaderContent:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _SFReaderExtractedData *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "safari_stringForKey:", CFSTR("imageURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_stringForKey:", CFSTR("body"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safari_stringForKey:", CFSTR("author"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_stringForKey:", CFSTR("publishedDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_stringForKey:", CFSTR("title"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_SFReaderExtractedData _initWithAuthor:body:publishedDate:title:mainImageURL:url:](self, "_initWithAuthor:body:publishedDate:title:mainImageURL:url:", v12, v11, v13, v14, v9, v6);
  return v15;
}

- (id)_initWithAuthor:(id)a3 body:(id)a4 publishedDate:(id)a5 title:(id)a6 mainImageURL:(id)a7 url:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _SFReaderExtractedData *v20;
  uint64_t v21;
  NSString *author;
  uint64_t v23;
  NSString *publishedDate;
  uint64_t v25;
  NSString *title;
  _SFReaderExtractedData *v27;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)_SFReaderExtractedData;
  v20 = -[_SFReaderExtractedData init](&v29, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    author = v20->_author;
    v20->_author = (NSString *)v21;

    objc_storeStrong((id *)&v20->_body, a4);
    v23 = objc_msgSend(v16, "copy");
    publishedDate = v20->_publishedDate;
    v20->_publishedDate = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    title = v20->_title;
    v20->_title = (NSString *)v25;

    objc_storeStrong((id *)&v20->_mainImageURL, a7);
    objc_storeStrong((id *)&v20->_url, a8);
    v27 = v20;
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithAuthor:body:publishedDate:title:mainImageURL:url:", self->_author, self->_body, self->_publishedDate, self->_title, self->_mainImageURL, self->_url);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *author;
  id v5;

  author = self->_author;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", author, CFSTR("author"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_body, CFSTR("body"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publishedDate, CFSTR("publishedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mainImageURL, CFSTR("imageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("url"));

}

- (_SFReaderExtractedData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFReaderExtractedData *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("author"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publishedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_SFReaderExtractedData _initWithAuthor:body:publishedDate:title:mainImageURL:url:](self, "_initWithAuthor:body:publishedDate:title:mainImageURL:url:", v5, v8, v6, v7, v9, v10);
  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)publishedDate
{
  return self->_publishedDate;
}

- (NSData)body
{
  return self->_body;
}

- (NSURL)mainImageURL
{
  return self->_mainImageURL;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_mainImageURL, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_publishedDate, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
