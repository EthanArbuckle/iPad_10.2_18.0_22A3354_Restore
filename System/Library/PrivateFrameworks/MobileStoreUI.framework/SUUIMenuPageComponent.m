@implementation SUUIMenuPageComponent

- (SUUIMenuPageComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *titleForMoreItem;
  void *v10;
  uint64_t v11;
  NSString *menuTitle;
  void *v13;
  float v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *childrenComponents;
  NSMutableArray *v18;
  NSMutableArray *titles;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  SUUIMenuPageComponent *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)SUUIMenuPageComponent;
  v55 = -[SUUIPageComponent initWithCustomPageContext:](&v64, sel_initWithCustomPageContext_, v4);
  if (v55)
  {
    objc_msgSend(v4, "componentDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isEqualToString:", CFSTR("popup")))
      v55->_menuStyle = 1;
    objc_msgSend(v5, "objectForKey:", CFSTR("moreTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "copy");
      titleForMoreItem = v55->_titleForMoreItem;
      v55->_titleForMoreItem = (NSString *)v8;

    }
    objc_msgSend(v5, "objectForKey:", CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "copy");
      menuTitle = v55->_menuTitle;
      v55->_menuTitle = (NSString *)v11;

      objc_msgSend(v5, "objectForKey:", CFSTR("titleSize"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v13, "floatValue");
        v55->_menuTitleFontSize = v14;
      }
      objc_msgSend(v5, "objectForKey:", CFSTR("titleWeight"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v55->_menuTitleFontWeight = SUUIPageComponentFontWeightForString(v10);
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("children"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = v5;
      v53 = objc_alloc_init(MEMORY[0x24BDD14E0]);
      v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      childrenComponents = v55->_childrenComponents;
      v55->_childrenComponents = v16;

      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      titles = v55->_titles;
      v55->_titles = v18;

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v45 = v15;
      v20 = v15;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v61;
        v49 = v4;
        v47 = *(_QWORD *)v61;
        v48 = v20;
        do
        {
          v24 = 0;
          v50 = v22;
          do
          {
            if (*(_QWORD *)v61 != v23)
              objc_enumerationMutation(v20);
            v52 = v24;
            v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v24);
            objc_msgSend(v25, "objectForKey:", CFSTR("content"));
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = v25;
            v28 = (void *)v26;
            objc_msgSend(v27, "objectForKey:", CFSTR("title"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v30 = (void *)objc_msgSend(v4, "copy");
                v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                v32 = v28;
                v33 = v31;
                v56 = 0u;
                v57 = 0u;
                v58 = 0u;
                v59 = 0u;
                v51 = v32;
                v34 = v32;
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
                if (v35)
                {
                  v36 = v35;
                  v37 = *(_QWORD *)v57;
                  do
                  {
                    v38 = 0;
                    v54 = v36;
                    do
                    {
                      if (*(_QWORD *)v57 != v37)
                        objc_enumerationMutation(v34);
                      v39 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v38);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v30, "setComponentDictionary:", v39);
                        -[SUUIMenuPageComponent _componentWithContext:](v55, "_componentWithContext:", v30);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        v41 = v40;
                        if (v40)
                        {
                          v42 = v29;
                          objc_msgSend(v40, "metricsElementName");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v43)
                          {
                            objc_msgSend(v41, "_setMetricsLocationPosition:", objc_msgSend(v53, "countForObject:", v43));
                            v36 = v54;
                            objc_msgSend(v53, "addObject:", v43);
                          }
                          objc_msgSend(v33, "addObject:", v41);

                          v29 = v42;
                        }

                      }
                      ++v38;
                    }
                    while (v36 != v38);
                    v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
                  }
                  while (v36);
                }

                if (objc_msgSend(v33, "count"))
                {
                  -[NSMutableArray addObject:](v55->_childrenComponents, "addObject:", v33);
                  -[NSMutableArray addObject:](v55->_titles, "addObject:", v29);
                }

                v4 = v49;
                v23 = v47;
                v20 = v48;
                v22 = v50;
                v28 = v51;
              }
            }

            v24 = v52 + 1;
          }
          while (v52 + 1 != v22);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        }
        while (v22);
      }

      v5 = v46;
      v15 = v45;
    }

  }
  return v55;
}

- (SUUIMenuPageComponent)initWithRoomSortData:(id)a3
{
  id v4;
  SUUIMenuPageComponent *v5;
  NSMutableArray *v6;
  NSMutableArray *childrenComponents;
  NSMutableArray *v8;
  NSMutableArray *sortURLStrings;
  NSMutableArray *v10;
  NSMutableArray *titles;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  SUUIMenuPageComponent *v21;
  id v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SUUIMenuPageComponent;
  v5 = -[SUUIMenuPageComponent init](&v23, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    childrenComponents = v5->_childrenComponents;
    v5->_childrenComponents = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sortURLStrings = v5->_sortURLStrings;
    v5->_sortURLStrings = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    titles = v5->_titles;
    v5->_titles = v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("defaultSort"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("id"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("sorts"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __46__SUUIMenuPageComponent_initWithRoomSortData___block_invoke;
      v20 = &unk_2511FAC10;
      v21 = v5;
      v22 = v13;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v17);

    }
    v15 = -[NSMutableArray count](v5->_sortURLStrings, "count", v17, v18, v19, v20);
    if (v15 != -[NSMutableArray count](v5->_titles, "count")
      || !-[NSMutableArray count](v5->_sortURLStrings, "count")
      || !-[NSMutableArray count](v5->_titles, "count"))
    {

      v5 = 0;
    }

  }
  return v5;
}

void __46__SUUIMenuPageComponent_initWithRoomSortData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", v7);
    objc_msgSend(v12, "objectForKey:", CFSTR("url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v8);
    objc_msgSend(v12, "objectForKey:", CFSTR("id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40)))
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = a3;
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    v6 = v12;
  }

}

- (SUUIMenuPageComponent)initWithViewElement:(id)a3
{
  id v4;
  SUUIMenuPageComponent *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *titles;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIMenuPageComponent;
  v5 = -[SUUIPageComponent initWithViewElement:](&v10, sel_initWithViewElement_, v4);
  if (v5)
  {
    v5->_defaultSelectedIndex = objc_msgSend(v4, "initialSelectedItemIndex");
    objc_msgSend(v4, "segmentItemTitles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    titles = v5->_titles;
    v5->_titles = (NSMutableArray *)v7;

  }
  return v5;
}

- (NSArray)allTitles
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_titles, "copy");
}

- (id)childComponentsForIndex:(int64_t)a3
{
  void *v3;

  -[NSMutableArray objectAtIndex:](self->_childrenComponents, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

- (int64_t)numberOfItems
{
  return -[NSMutableArray count](self->_titles, "count");
}

- (id)sortURLForIndex:(int64_t)a3
{
  NSMutableArray *sortURLStrings;
  void *v4;
  void *v5;

  sortURLStrings = self->_sortURLStrings;
  if (sortURLStrings)
  {
    -[NSMutableArray objectAtIndex:](sortURLStrings, "objectAtIndex:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)titleForIndex:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_titles, "objectAtIndex:", a3);
}

- (int64_t)componentType
{
  return 11;
}

- (void)_setChildComponents:(id)a3 forIndex:(int64_t)a4
{
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_childrenComponents, "replaceObjectAtIndex:withObject:", a4, a3);
}

- (id)_componentWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "componentDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v6 = SUUIPageComponentTypeForBlockType(v5),
        (v7 = (objc_class *)SUUIPageComponentClassForComponentType(v6)) != 0))
  {
    v8 = (void *)objc_msgSend([v7 alloc], "initWithCustomPageContext:", v3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)defaultSelectedIndex
{
  return self->_defaultSelectedIndex;
}

- (int64_t)menuStyle
{
  return self->_menuStyle;
}

- (NSString)menuTitle
{
  return self->_menuTitle;
}

- (float)menuTitleFontSize
{
  return self->_menuTitleFontSize;
}

- (int64_t)menuTitleFontWeight
{
  return self->_menuTitleFontWeight;
}

- (NSString)titleForMoreItem
{
  return self->_titleForMoreItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_titleForMoreItem, 0);
  objc_storeStrong((id *)&self->_sortURLStrings, 0);
  objc_storeStrong((id *)&self->_menuTitle, 0);
  objc_storeStrong((id *)&self->_childrenComponents, 0);
}

@end
