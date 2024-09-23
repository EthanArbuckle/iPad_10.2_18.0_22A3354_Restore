@implementation SUUIQuicklinksPageComponent

- (SUUIQuicklinksPageComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SUUIQuicklinksPageComponent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *title;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIQuicklinksPageComponent;
  v5 = -[SUUIPageComponent initWithCustomPageContext:](&v12, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v8;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("children"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUUIQuicklinksPageComponent _setLinksWithLinksArray:context:](v5, "_setLinksWithLinksArray:context:", v10, v4);

  }
  return v5;
}

- (SUUIQuicklinksPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6;
  SUUIQuicklinksPageComponent *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSString *title;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIQuicklinksPageComponent;
  v7 = -[SUUIPageComponent initWithFeaturedContentContext:kind:](&v17, sel_initWithFeaturedContentContext_kind_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "componentDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("children"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;

        v8 = v11;
      }

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      title = v7->_title;
      v7->_title = (NSString *)v13;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("links"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUUIQuicklinksPageComponent _setLinksWithLinksArray:context:](v7, "_setLinksWithLinksArray:context:", v15, v6);

  }
  return v7;
}

- (int64_t)componentType
{
  return 12;
}

- (id)metricsElementName
{
  return CFSTR("quicklink");
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2938]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2940]) & 1) != 0)
  {
    -[SUUIQuicklinksPageComponent title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2930]) & 1) == 0)
    {
LABEL_7:
      v7.receiver = self;
      v7.super_class = (Class)SUUIQuicklinksPageComponent;
      -[SUUIPageComponent valueForMetricsField:](&v7, sel_valueForMetricsField_, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v5 = &unk_2512EED60;
  }
LABEL_8:

  return v5;
}

- (void)_setLinksWithLinksArray:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  SUUILink *v15;
  NSArray *v16;
  NSArray *links;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = (void *)objc_msgSend(v6, "copy");
          objc_msgSend(v14, "setComponentDictionary:", v13);
          v15 = -[SUUILink initWithComponentContext:]([SUUILink alloc], "initWithComponentContext:", v14);
          if (v15)
            objc_msgSend(v7, "addObject:", v15);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v16 = (NSArray *)objc_msgSend(v7, "copy");
  links = self->_links;
  self->_links = v16;

}

- (NSArray)links
{
  return self->_links;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_links, 0);
}

@end
