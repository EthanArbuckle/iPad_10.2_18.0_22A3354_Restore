@implementation SGMicrodataDocument

- (id)jsonLdForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SGMicrodataDocument *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = self;
  objc_msgSend(v4, "resolveItemRefsWithDocument:", self);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "itemType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "itemType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    objc_msgSend(v4, "itemType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 == 1)
      objc_msgSend(v9, "anyObject");
    else
      objc_msgSend(v9, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("@type"));

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v4, "itemProps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v17, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v17, "stringValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
            goto LABEL_21;
        }
        else
        {
          objc_msgSend(v17, "itemValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGMicrodataDocument jsonLdForItem:](v27, "jsonLdForItem:", v20);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
            goto LABEL_21;
        }
        objc_msgSend(v17, "propertyName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v22, "addObject:", v19);
          }
          else
          {
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v22, v19, 0);
            objc_msgSend(v17, "propertyName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, v25);

          }
        }
        else
        {
          objc_msgSend(v17, "propertyName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v23);

        }
LABEL_21:

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

  return v5;
}

- (id)asJsonLd
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_items;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[SGMicrodataDocument jsonLdForItem:](self, "jsonLdForItem:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)setHtmlIdItemScope:(id)a3 forHtmlId:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_htmlIds, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)addItem:(id)a3
{
  -[NSMutableArray addObject:](self->_items, "addObject:", a3);
}

- (SGMicrodataDocument)init
{
  SGMicrodataDocument *v2;
  uint64_t v3;
  NSMutableDictionary *htmlIds;
  uint64_t v5;
  NSMutableArray *items;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGMicrodataDocument;
  v2 = -[SGMicrodataDocument init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    htmlIds = v2->_htmlIds;
    v2->_htmlIds = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    items = v2->_items;
    v2->_items = (NSMutableArray *)v5;

  }
  return v2;
}

- (NSDictionary)htmlIds
{
  return &self->_htmlIds->super;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_htmlIds, 0);
}

@end
