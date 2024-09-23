@implementation SUUISearchItem

- (SUUISearchItem)initWithLookupDictionary:(id)a3
{
  id v4;
  SUUISearchItem *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  NSArray *screenshots;
  void *v15;
  uint64_t v16;
  NSArray *childItemIdentifiers;
  uint64_t v18;
  NSMutableDictionary *loadedChildItems;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  SUUIItem *v28;
  void *v30;
  id v31;
  NSArray *obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SUUISearchItem;
  v5 = -[SUUIItem initWithLookupDictionary:](&v41, sel_initWithLookupDictionary_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    SUUIItemScreenshotsForDictionary(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (!v5->_primaryScreenshot)
            objc_storeStrong((id *)&v5->_primaryScreenshot, *(id *)(*((_QWORD *)&v37 + 1) + 8 * i));
          objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v9);
    }
    v13 = objc_msgSend(v6, "copy");
    screenshots = v5->_screenshots;
    v5->_screenshots = (NSArray *)v13;

    objc_msgSend(v4, "objectForKey:", CFSTR("childrenIds"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      childItemIdentifiers = v5->_childItemIdentifiers;
      v5->_childItemIdentifiers = (NSArray *)v16;

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v18 = objc_claimAutoreleasedReturnValue();
      loadedChildItems = v5->_loadedChildItems;
      v5->_loadedChildItems = (NSMutableDictionary *)v18;

      objc_msgSend(v4, "objectForKey:", CFSTR("children"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = v15;
        v31 = v4;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        obj = v5->_childItemIdentifiers;
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v34 != v23)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
              objc_msgSend(v25, "stringValue", v30, v31);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKey:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = -[SUUIItem initWithLookupDictionary:]([SUUIItem alloc], "initWithLookupDictionary:", v27);
                if (v28)
                  -[NSMutableDictionary setObject:forKey:](v5->_loadedChildItems, "setObject:forKey:", v28, v25);

              }
            }
            v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v22);
        }

        v15 = v30;
        v4 = v31;
      }

    }
  }

  return v5;
}

- (void)setChildItem:(id)a3 forIdentifier:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_loadedChildItems, "setObject:forKey:", a3, a4);
}

- (id)loadedChildItems
{
  return (id)-[NSMutableDictionary allValues](self->_loadedChildItems, "allValues");
}

- (id)childItemForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_loadedChildItems, "objectForKey:", a3);
}

- (id)childItemIdentifiers
{
  return self->_childItemIdentifiers;
}

- (SUUIScreenshot)primaryScreenshot
{
  return self->_primaryScreenshot;
}

- (NSArray)screenshots
{
  return self->_screenshots;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedChildItems, 0);
  objc_storeStrong((id *)&self->_childItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_primaryScreenshot, 0);
}

@end
