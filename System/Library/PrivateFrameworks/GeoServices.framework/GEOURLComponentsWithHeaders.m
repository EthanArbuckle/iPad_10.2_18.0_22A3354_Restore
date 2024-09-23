@implementation GEOURLComponentsWithHeaders

- (NSURLComponents)URLComponents
{
  return self->_URLComponents;
}

- (void)updateQueryItemsWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEOURLComponentsWithHeaders URLComponents](self, "URLComponents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "geo_updateQueryItemsWithBlock:", v4);

}

- (GEOURLComponentsWithHeaders)initWithString:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  GEOURLComponentsWithHeaders *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  v7 = -[GEOURLComponentsWithHeaders initWithURLComponents:](self, "initWithURLComponents:", v6);
  return v7;
}

- (GEOURLComponentsWithHeaders)initWithURLComponents:(id)a3
{
  id v5;
  GEOURLComponentsWithHeaders *v6;
  GEOURLComponentsWithHeaders *v7;
  uint64_t v8;
  NSMutableDictionary *headerFields;
  GEOURLComponentsWithHeaders *v10;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOURLComponentsWithHeaders;
    v6 = -[GEOURLComponentsWithHeaders init](&v12, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_URLComponents, a3);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
      v8 = objc_claimAutoreleasedReturnValue();
      headerFields = v7->_headerFields;
      v7->_headerFields = (NSMutableDictionary *)v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSMutableDictionary)headerFields
{
  return self->_headerFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong((id *)&self->_URLComponents, 0);
}

- (GEOURLComponentsWithHeaders)init
{
  id v3;
  GEOURLComponentsWithHeaders *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  v4 = -[GEOURLComponentsWithHeaders initWithURLComponents:](self, "initWithURLComponents:", v3);

  return v4;
}

- (GEOURLComponentsWithHeaders)initWithURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  GEOURLComponentsWithHeaders *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:resolvingAgainstBaseURL:", v5, 1);

  v7 = -[GEOURLComponentsWithHeaders initWithURLComponents:](self, "initWithURLComponents:", v6);
  return v7;
}

- (void)appendPathComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[GEOURLComponentsWithHeaders URLComponents](self, "URLComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOURLComponentsWithHeaders URLComponents](self, "URLComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v6)
  {
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOURLComponentsWithHeaders URLComponents](self, "URLComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPath:", v9);

    v4 = v8;
  }
  else
  {
    objc_msgSend(v7, "setPath:", v4);
  }

}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[GEOURLComponentsWithHeaders URLComponents](self, "URLComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (GEOURLWithHeaders)URLWithHeaders
{
  GEOURLWithHeaders *v3;
  void *v4;
  void *v5;
  GEOURLWithHeaders *v6;

  v3 = [GEOURLWithHeaders alloc];
  -[GEOURLComponentsWithHeaders URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOURLComponentsWithHeaders headerFields](self, "headerFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOURLWithHeaders initWithURL:headerFields:](v3, "initWithURL:headerFields:", v4, v5);

  return v6;
}

@end
