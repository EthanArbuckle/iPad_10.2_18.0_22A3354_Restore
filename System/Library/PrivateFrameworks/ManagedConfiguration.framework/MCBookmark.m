@implementation MCBookmark

- (MCBookmark)initWithSerializableDictionary:(id)a3
{
  id v4;
  MCBookmark *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *URL;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *path;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCBookmark;
  v5 = -[MCBookmark init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("address"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bookmarkPath"));
    v12 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v12;

  }
  return v5;
}

- (id)serializableDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCBookmark URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCBookmark URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("address"));

  }
  -[MCBookmark title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MCBookmark title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pageTitle"));

  }
  -[MCBookmark path](self, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MCBookmark path](self, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("bookmarkPath"));

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MCBookmark *v4;
  void *v5;
  MCBookmark *v6;

  v4 = [MCBookmark alloc];
  -[MCBookmark serializableDictionary](self, "serializableDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCBookmark initWithSerializableDictionary:](v4, "initWithSerializableDictionary:", v5);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCBookmark;
  -[MCBookmark description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCBookmark URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCBookmark URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", URL: %@"), v6);

  }
  -[MCBookmark title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MCBookmark title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", Title: %@"), v8);

  }
  -[MCBookmark path](self, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MCBookmark path](self, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", Path: %@"), v10);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[MCBookmark URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[MCBookmark URL](self, "URL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        v10 = 0;
        goto LABEL_17;
      }
    }
    -[MCBookmark title](self, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {
      v25 = v11;
    }
    else
    {
      -[MCBookmark title](self, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqualToString:"))
      {
        v10 = 0;
        goto LABEL_15;
      }
      v24 = v13;
      v25 = v11;
    }
    -[MCBookmark path](self, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

      v10 = 1;
    }
    else
    {
      v16 = (void *)v15;
      -[MCBookmark path](self, "path");
      v23 = v3;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v22 = v4;
      v18 = v9;
      v19 = v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v17, "isEqualToString:", v20);

      v8 = v19;
      v9 = v18;
      v4 = v22;

      v3 = v23;
    }
    v13 = v24;
    v11 = v25;
    if (v25 == v12)
    {
LABEL_16:

      if (v8 == v9)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:

      goto LABEL_18;
    }
LABEL_15:

    goto LABEL_16;
  }
  v27.receiver = self;
  v27.super_class = (Class)MCBookmark;
  v10 = -[MCBookmark isEqual:](&v27, sel_isEqual_, v6);
LABEL_19:

  return v10;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
