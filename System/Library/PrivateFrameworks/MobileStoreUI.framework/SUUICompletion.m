@implementation SUUICompletion

- (SUUICompletion)initWithCompletionDictionary:(id)a3
{
  id v4;
  SUUICompletion *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *alternateTitle;
  void *v12;
  uint64_t v13;
  NSString *URLString;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUICompletion;
  v5 = -[SUUICompletion init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("term"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("search-field-term"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      alternateTitle = v5->_alternateTitle;
      v5->_alternateTitle = (NSString *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      URLString = v5->_URLString;
      v5->_URLString = (NSString *)v13;

    }
  }

  return v5;
}

- (SUUICompletion)initWithCacheRepresentation:(id)a3
{
  id v4;
  SUUICompletion *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *alternateTitle;
  void *v12;
  uint64_t v13;
  NSString *URLString;
  objc_super v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)SUUICompletion;
    v5 = -[SUUICompletion init](&v16, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("title"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "copy");
        title = v5->_title;
        v5->_title = (NSString *)v7;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("alttitle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "copy");
        alternateTitle = v5->_alternateTitle;
        v5->_alternateTitle = (NSString *)v10;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("url"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "copy");
        URLString = v5->_URLString;
        v5->_URLString = (NSString *)v13;

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
  void *v3;
  void *v4;
  NSString *title;
  NSString *alternateTitle;
  NSString *URLString;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  alternateTitle = self->_alternateTitle;
  if (alternateTitle)
    objc_msgSend(v4, "setObject:forKey:", alternateTitle, CFSTR("alttitle"));
  URLString = self->_URLString;
  if (URLString)
    objc_msgSend(v4, "setObject:forKey:", URLString, CFSTR("url"));
  return (NSMutableDictionary *)v4;
}

- (NSString)alternateTitle
{
  return self->_alternateTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alternateTitle, 0);
}

@end
