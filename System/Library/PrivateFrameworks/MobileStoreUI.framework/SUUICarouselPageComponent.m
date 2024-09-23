@implementation SUUICarouselPageComponent

- (SUUICarouselPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  SUUICarouselItem *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *carouselItems;
  void *v24;
  void *v25;
  void *v26;
  SUUICarouselPageComponent *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SUUICarouselPageComponent;
  v27 = -[SUUIPageComponent initWithFeaturedContentContext:kind:](&v32, sel_initWithFeaturedContentContext_kind_, v6, a4);
  if (v27)
  {
    objc_msgSend(v6, "componentDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("children"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v7;
      v9 = (void *)objc_msgSend(v6, "copy");
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v24 = v8;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v9, "setComponentDictionary:", v16);
              v17 = -[SUUICarouselItem initWithComponentContext:]([SUUICarouselItem alloc], "initWithComponentContext:", v9);
              -[SUUICarouselItem link](v17, "link");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v18, "isActionable"))
              {
                objc_msgSend(v10, "addObject:", v17);
              }
              else
              {
                objc_msgSend(v18, "itemIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19 && (objc_msgSend(v6, "isUnavailableItemIdentifier:", v19) & 1) == 0)
                {
                  ++v27->_missingItemCount;
                  objc_msgSend(v10, "addObject:", v17);
                }

              }
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v13);
      }

      if (objc_msgSend(v6, "layoutStyle") == 1 && (unint64_t)objc_msgSend(v10, "count") >= 3)
      {
        objc_msgSend(v10, "objectAtIndex:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObjectAtIndex:", 1);
        objc_msgSend(v10, "addObject:", v20);

      }
      v21 = objc_msgSend(v10, "copy", v24);
      carouselItems = v27->_carouselItems;
      v27->_carouselItems = (NSArray *)v21;

      v8 = v25;
      v7 = v26;
    }
    v27->_cycleInterval = 5.0;

  }
  return v27;
}

- (SUUICarouselPageComponent)initWithViewElement:(id)a3
{
  id v4;
  SUUICarouselPageComponent *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUICarouselPageComponent;
  v5 = -[SUUIPageComponent initWithViewElement:](&v8, sel_initWithViewElement_, v4);
  if (v5)
  {
    objc_msgSend(v4, "displayInterval");
    if (v6 < 0.0)
      v6 = 5.0;
    v5->_cycleInterval = v6;
  }

  return v5;
}

- (void)updateWithMissingItems:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_carouselItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "link", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (objc_msgSend(v11, "isActionable") & 1) == 0)
        {
          objc_msgSend(v4, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v10, "_setLinkItem:", v13);
            --self->_missingItemCount;
          }

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (int64_t)componentType
{
  return 18;
}

- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_carouselItems;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "link", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[SUUIPageComponent _enumerateMissingItemIdentifiersFromLinks:startIndex:usingBlock:](self, "_enumerateMissingItemIdentifiersFromLinks:startIndex:usingBlock:", v7, a3, v6);
}

- (BOOL)isMissingItemData
{
  return self->_missingItemCount > 0;
}

- (id)metricsElementName
{
  return CFSTR("carousel");
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2930]) & 1) != 0)
  {
    v5 = &unk_2512EEAD8;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUICarouselPageComponent;
    -[SUUIPageComponent valueForMetricsField:](&v7, sel_valueForMetricsField_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSArray)carouselItems
{
  return self->_carouselItems;
}

- (double)cycleInterval
{
  return self->_cycleInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselItems, 0);
}

@end
