@implementation IKStylesGroup

+ (id)stylesGroupWithMarkup:(id)a3 filterBlockedStyles:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("/\\*(.|[\r\n])*?\\*/"), 1, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(v7, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), CFSTR(" "));
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v8;
    }
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMarkup:parseSubGroups:mediaQueryList:filterBlockedStyles:", v6, 1, 0, v4);
    objc_msgSend(v9, "orderedStylesOrGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (IKStylesGroup)initWithCSSRule:(id)a3 mediaQueryList:(id)a4 filterBlockedStyles:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  IKStylesGroup *v10;
  IKStylesGroup *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  NSArray *orderedStylesOrGroups;
  objc_super v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)IKStylesGroup;
  v10 = -[IKStylesGroup init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaQueryList, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectorList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = 0;
      do
      {
        objc_msgSend(v8, "selectorList");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "selectorAtIndex:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 && (!objc_msgSend(v17, "type") || objc_msgSend(v17, "type") == 3))
        {
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[IKViewElementStyle elementStyleWithSelector:cssRule:filterBlockedStyles:](IKViewElementStyle, "elementStyleWithSelector:cssRule:filterBlockedStyles:", v18, v8, v5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v12, "addObject:", v19);

        }
        ++v15;
        objc_msgSend(v8, "selectorList");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

      }
      while (v15 < v21);
    }
    v22 = objc_msgSend(v12, "copy");
    orderedStylesOrGroups = v11->_orderedStylesOrGroups;
    v11->_orderedStylesOrGroups = (NSArray *)v22;

    -[IKStylesGroup _computeIndexedSelectorsFromStylesOrGroups:](v11, "_computeIndexedSelectorsFromStylesOrGroups:", v11->_orderedStylesOrGroups);
  }

  return v11;
}

- (IKStylesGroup)initWithMarkup:(id)a3 parseSubGroups:(BOOL)a4 mediaQueryList:(id)a5 filterBlockedStyles:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  IKStylesGroup *v11;
  IKStylesGroup *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  IKStylesGroup *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  NSArray *orderedStylesOrGroups;
  id v39;
  IKStylesGroup *v40;
  id v41;
  objc_super v42;

  v6 = a6;
  v9 = a3;
  v10 = a5;
  v42.receiver = self;
  v42.super_class = (Class)IKStylesGroup;
  v11 = -[IKStylesGroup init](&v42, sel_init);
  v12 = v11;
  if (v11)
  {
    v39 = a5;
    v40 = v11;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v9;
    +[IKCSSParser parse:](IKCSSParser, "parse:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "ruleList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        v18 = 0;
        do
        {
          objc_msgSend(v15, "ruleList");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "ruleAtIndex:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "mediaQuery");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v20, "mediaQuery");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[IKStyleMediaQuery mediaQueryListWithCSSMediaQuery:](IKStyleMediaQuery, "mediaQueryListWithCSSMediaQuery:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = -[IKStylesGroup initWithCSSRule:mediaQueryList:filterBlockedStyles:]([IKStylesGroup alloc], "initWithCSSRule:mediaQueryList:filterBlockedStyles:", v20, v23, v6);
            if (v24)
              objc_msgSend(v13, "addObject:", v24);

          }
          else
          {
            objc_msgSend(v20, "selectorList");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count");

            if (v26)
            {
              v27 = 0;
              do
              {
                objc_msgSend(v20, "selectorList");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "selectorAtIndex:", v27);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29 && (!objc_msgSend(v29, "type") || objc_msgSend(v29, "type") == 3))
                {
                  objc_msgSend(v29, "name");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  +[IKViewElementStyle elementStyleWithSelector:cssRule:filterBlockedStyles:](IKViewElementStyle, "elementStyleWithSelector:cssRule:filterBlockedStyles:", v30, v20, v6);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v31)
                    objc_msgSend(v13, "addObject:", v31);

                }
                ++v27;
                objc_msgSend(v20, "selectorList");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "count");

              }
              while (v27 < v33);
            }
          }

          ++v18;
          objc_msgSend(v15, "ruleList");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "count");

        }
        while (v18 < v35);
      }
    }
    v12 = v40;
    objc_storeStrong((id *)&v40->_mediaQueryList, v39);
    v36 = objc_msgSend(v13, "copy");
    orderedStylesOrGroups = v40->_orderedStylesOrGroups;
    v40->_orderedStylesOrGroups = (NSArray *)v36;

    -[IKStylesGroup _computeIndexedSelectorsFromStylesOrGroups:](v12, "_computeIndexedSelectorsFromStylesOrGroups:", v12->_orderedStylesOrGroups);
    v9 = v41;
  }

  return v12;
}

- (void)_computeIndexedSelectorsFromStylesOrGroups:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *indexedSelectors;
  NSIndexSet *v19;
  NSIndexSet *groupIndexes;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __60__IKStylesGroup__computeIndexedSelectorsFromStylesOrGroups___block_invoke;
  v26[3] = &unk_1E9F4CA68;
  v7 = v6;
  v27 = v7;
  v8 = v5;
  v28 = v8;
  v21 = v4;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v26);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(v7, "setObject:forKey:", v16, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v7, "count"))
  {
    v17 = (NSDictionary *)objc_msgSend(v7, "copy");
    indexedSelectors = self->_indexedSelectors;
    self->_indexedSelectors = v17;
  }
  else
  {
    indexedSelectors = self->_indexedSelectors;
    self->_indexedSelectors = 0;
  }

  if (objc_msgSend(v8, "count"))
  {
    v19 = (NSIndexSet *)objc_msgSend(v8, "copy");
    groupIndexes = self->_groupIndexes;
    self->_groupIndexes = v19;
  }
  else
  {
    groupIndexes = self->_groupIndexes;
    self->_groupIndexes = 0;
  }

}

void __60__IKStylesGroup__computeIndexedSelectorsFromStylesOrGroups___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "classDescriptorString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
    }
    objc_msgSend(v6, "addIndex:", a3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }

}

- (NSArray)mediaQueryList
{
  return self->_mediaQueryList;
}

- (NSArray)orderedStylesOrGroups
{
  return self->_orderedStylesOrGroups;
}

- (NSDictionary)indexedSelectors
{
  return self->_indexedSelectors;
}

- (NSIndexSet)groupIndexes
{
  return self->_groupIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIndexes, 0);
  objc_storeStrong((id *)&self->_indexedSelectors, 0);
  objc_storeStrong((id *)&self->_orderedStylesOrGroups, 0);
  objc_storeStrong((id *)&self->_mediaQueryList, 0);
}

@end
