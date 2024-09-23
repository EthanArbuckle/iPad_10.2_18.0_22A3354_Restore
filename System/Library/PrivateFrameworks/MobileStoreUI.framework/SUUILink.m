@implementation SUUILink

- (SUUILink)initWithLinkDictionary:(id)a3
{
  id v4;
  SUUILink *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSURL *url;
  void *v12;
  uint64_t v13;
  NSString *target;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUILink;
  v5 = -[SUUILink init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      url = v5->_url;
      v5->_url = (NSURL *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("target"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      target = v5->_target;
      v5->_target = (NSString *)v13;

    }
  }

  return v5;
}

- (SUUILink)initWithComponentContext:(id)a3
{
  id v4;
  SUUILink *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *title;
  void *v10;
  uint64_t v11;
  NSURL *url;
  void *v13;
  SUUIItem *v14;
  void *item;
  void *v16;
  uint64_t v17;
  SUUIItem *v18;
  void *v19;
  uint64_t v20;
  NSString *target;
  uint64_t v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SUUILink;
  v5 = -[SUUILink init](&v24, sel_init);
  if (!v5)
    goto LABEL_15;
  objc_msgSend(v4, "componentDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v8;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v11;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("lockupData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = -[SUUIItem initWithLookupDictionary:]([SUUIItem alloc], "initWithLookupDictionary:", v13);
    item = v5->_item;
    v5->_item = v14;
    v16 = v13;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("adamId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    objc_msgSend(v4, "itemForItemIdentifier:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v5->_item;
    v5->_item = (SUUIItem *)v17;

    if (v5->_item || (objc_msgSend(v4, "isUnavailableItemIdentifier:", v16) & 1) != 0)
      goto LABEL_12;
    v23 = objc_msgSend(v16, "copy");
    item = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSNumber *)v23;
  }

LABEL_12:
  objc_msgSend(v6, "objectForKey:", CFSTR("target"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v19, "copy");
    target = v5->_target;
    v5->_target = (NSString *)v20;

  }
LABEL_15:

  return v5;
}

- (SUUILink)initWithURL:(id)a3
{
  return -[SUUILink initWithURL:title:targetString:](self, "initWithURL:title:targetString:", a3, 0, 0);
}

- (SUUILink)initWithURL:(id)a3 title:(id)a4 targetString:(id)a5
{
  id v8;
  id v9;
  id v10;
  SUUILink *v11;
  uint64_t v12;
  NSString *target;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSURL *url;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SUUILink;
  v11 = -[SUUILink init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    target = v11->_target;
    v11->_target = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v14;

    v16 = objc_msgSend(v8, "copy");
    url = v11->_url;
    v11->_url = (NSURL *)v16;

  }
  return v11;
}

- (BOOL)isActionable
{
  return self->_url || self->_item != 0;
}

- (NSDictionary)linkDictionary
{
  void *v3;
  void *v4;
  NSString *target;
  NSString *title;
  NSURL *url;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  target = self->_target;
  if (target)
    objc_msgSend(v3, "setObject:forKey:", target, CFSTR("target"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("label"));
  url = self->_url;
  if (url)
  {
    -[NSURL absoluteString](url, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("url"));

  }
  return (NSDictionary *)v4;
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  SUUIItem *item;
  NSNumber *v6;
  NSNumber *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2928]))
  {
    item = self->_item;
    if (item)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[SUUIItem itemIdentifier](item, "itemIdentifier"));
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = self->_itemIdentifier;
    }
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2938]) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2940]))
    {
      v7 = 0;
      goto LABEL_9;
    }
    -[SUUILink title](self, "title");
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_9:

  return v7;
}

- (void)_setItem:(id)a3
{
  SUUIItem *v5;
  SUUIItem **p_item;
  SUUIItem *item;
  SUUIItem *v8;

  v5 = (SUUIItem *)a3;
  item = self->_item;
  p_item = &self->_item;
  if (item != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_item, a3);
    v5 = v8;
  }

}

- (SUUIItem)item
{
  return self->_item;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)targetString
{
  return self->_target;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_countdown, 0);
}

@end
