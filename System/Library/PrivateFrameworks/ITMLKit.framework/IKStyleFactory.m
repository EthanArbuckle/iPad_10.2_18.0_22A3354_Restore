@implementation IKStyleFactory

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[IKStyleFactory stylesGroup](self, "stylesGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStylesGroup:", v5);

  return v6;
}

+ (id)styleFactoryWithMarkup:(id)a3 filterBlockedStyles:(BOOL)a4
{
  void *v5;
  void *v6;

  +[IKStylesGroup stylesGroupWithMarkup:filterBlockedStyles:](IKStylesGroup, "stylesGroupWithMarkup:filterBlockedStyles:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStylesGroup:", v5);
  else
    v6 = 0;

  return v6;
}

- (IKStyleFactory)initWithStylesGroup:(id)a3
{
  id v5;
  IKStyleFactory *v6;
  IKStyleFactory *v7;
  uint64_t v8;
  NSMutableDictionary *styleListsByClassSelector;
  void *v10;
  void *v11;
  IKStyleList *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IKStyleFactory;
  v6 = -[IKStyleFactory init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stylesGroup, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    styleListsByClassSelector = v7->_styleListsByClassSelector;
    v7->_styleListsByClassSelector = (NSMutableDictionary *)v8;

    v15[0] = CFSTR("*");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKStyleFactory _collapsedStyleListForSelectors:targetSelector:stylesGroup:](v7, "_collapsedStyleListForSelectors:targetSelector:stylesGroup:", v10, CFSTR("*"), v7->_stylesGroup);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v12 = -[IKStyleList initWithClassSelector:styles:baseStyleList:]([IKStyleList alloc], "initWithClassSelector:styles:baseStyleList:", CFSTR("*"), v11, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_styleListsByClassSelector, "setObject:forKeyedSubscript:", v12, CFSTR("*"));

    }
  }

  return v7;
}

- (id)styleListForClassSelector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  IKStyleList *v7;
  void *v8;
  void *v9;
  void *v10;
  IKStyleList *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[IKStyleFactory styleListsByClassSelector](self, "styleListsByClassSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("*"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  +[IKViewElementStyle normalizeClassSelectorString:](IKViewElementStyle, "normalizeClassSelectorString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v7;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKStyleFactory styleListsByClassSelector](self, "styleListsByClassSelector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v11 = (IKStyleList *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[IKStyleFactory stylesGroup](self, "stylesGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKStyleFactory _collapsedStyleListForSelectors:targetSelector:stylesGroup:](self, "_collapsedStyleListForSelectors:targetSelector:stylesGroup:", v10, v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "count"))
      {
        v11 = -[IKStyleList initWithClassSelector:styles:baseStyleList:]([IKStyleList alloc], "initWithClassSelector:styles:baseStyleList:", v12, v15, v7);
        if (v11)
        {
          -[IKStyleFactory styleListsByClassSelector](self, "styleListsByClassSelector");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, v12);

        }
      }
      else
      {
        v11 = 0;
      }

    }
  }

  return v11;
}

- (void)setViewElementStylesDirty
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[IKStyleFactory styleListsByClassSelector](self, "styleListsByClassSelector", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setNeedsReresolution");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_collapsedStyleListForSelectors:(id)a3 targetSelector:(id)a4 stylesGroup:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void (**v26)(_QWORD);
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v33;
  void *v34;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  IKStyleFactory *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __77__IKStyleFactory__collapsedStyleListForSelectors_targetSelector_stylesGroup___block_invoke;
  v49[3] = &unk_1E9F4C148;
  v12 = v11;
  v50 = v12;
  v13 = v8;
  v51 = v13;
  v14 = v10;
  v52 = v14;
  v33 = (void *)MEMORY[0x1DF092410](v49);
  objc_msgSend(v9, "orderedStylesOrGroups");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v9;
  objc_msgSend(v9, "indexedSelectors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v46 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
          objc_msgSend(v16, "addIndexes:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v19);
  }

  objc_msgSend(v36, "groupIndexes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v36, "groupIndexes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addIndexes:", v24);

  }
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __77__IKStyleFactory__collapsedStyleListForSelectors_targetSelector_stylesGroup___block_invoke_2;
  v37[3] = &unk_1E9F4CA90;
  v38 = v34;
  v39 = v12;
  v40 = self;
  v41 = v17;
  v43 = v14;
  v44 = v33;
  v42 = v13;
  v25 = v14;
  v26 = v33;
  v27 = v13;
  v28 = v17;
  v29 = v12;
  v30 = v34;
  objc_msgSend(v16, "enumerateIndexesUsingBlock:", v37);
  v26[2](v26);
  v31 = (void *)objc_msgSend(v25, "copy");

  return v31;
}

void __77__IKStyleFactory__collapsedStyleListForSelectors_targetSelector_stylesGroup___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    +[IKViewElementStyle elementStyleWithSelector:aggregatingStyles:](IKViewElementStyle, "elementStyleWithSelector:aggregatingStyles:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v2);
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");

  }
}

void __77__IKStyleFactory__collapsedStyleListForSelectors_targetSelector_stylesGroup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  else
  {
    v3 = v7;
    objc_msgSend(*(id *)(a1 + 48), "_collapsedStyleListForSelectors:targetSelector:stylesGroup:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      objc_msgSend(v3, "mediaQueryList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMediaQueryList:", v6);

      objc_msgSend(*(id *)(a1 + 72), "addObject:", v5);
    }

  }
}

- (IKStylesGroup)stylesGroup
{
  return self->_stylesGroup;
}

- (NSMutableDictionary)styleListsByClassSelector
{
  return self->_styleListsByClassSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleListsByClassSelector, 0);
  objc_storeStrong((id *)&self->_stylesGroup, 0);
}

@end
