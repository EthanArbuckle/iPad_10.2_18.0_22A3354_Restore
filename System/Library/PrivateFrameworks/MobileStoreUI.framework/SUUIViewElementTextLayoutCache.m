@implementation SUUIViewElementTextLayoutCache

- (SUUIViewElementTextLayoutCache)initWithLayoutCache:(id)a3
{
  id v5;
  SUUIViewElementTextLayoutCache *v6;
  SUUIViewElementTextLayoutCache *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *layoutMapTables;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIViewElementTextLayoutCache;
  v6 = -[SUUIViewElementTextLayoutCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layoutCache, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    layoutMapTables = v7->_layoutMapTables;
    v7->_layoutMapTables = v8;

  }
  return v7;
}

- (CGSize)estimatedSizeForButton:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v6 = a3;
  -[SUUIViewElementTextLayoutCache _existingLayoutForViewElement:width:](self, "_existingLayoutForViewElement:width:", v6, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "boundingSize");
  else
    -[SUUIViewElementTextLayoutCache _bestGuessSizeForButton:width:](self, "_bestGuessSizeForButton:width:", v6, a4);
  v11 = v9;
  v12 = v10;

  v13 = v11;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)estimatedSizeForLabel:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SUUIAttributedStringView *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v6 = a3;
  -[SUUIViewElementTextLayoutCache _existingLayoutForViewElement:width:](self, "_existingLayoutForViewElement:width:", v6, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "trailingBadges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)estimatedSizeForLabel_width__sSizingView;
      if (!estimatedSizeForLabel_width__sSizingView)
      {
        v10 = objc_alloc_init(SUUIAttributedStringView);
        v11 = (void *)estimatedSizeForLabel_width__sSizingView;
        estimatedSizeForLabel_width__sSizingView = (uint64_t)v10;

        v9 = (void *)estimatedSizeForLabel_width__sSizingView;
      }
      objc_msgSend(v9, "setLayout:", v7);
      v12 = (void *)estimatedSizeForLabel_width__sSizingView;
      objc_msgSend(v6, "trailingBadges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRequiredBadges:", v13);

      v14 = objc_msgSend(v6, "badgePlacement") == 1;
      objc_msgSend((id)estimatedSizeForLabel_width__sSizingView, "setBadgePlacement:", v14);
      objc_msgSend((id)estimatedSizeForLabel_width__sSizingView, "sizeThatFits:", a4, 1.79769313e308);
      v17 = v16;
      if (v15 < a4)
        a4 = v15;
    }
    else
    {
      objc_msgSend(v7, "boundingSize");
      a4 = v20;
      v17 = v21;
    }

  }
  else
  {
    -[SUUIViewElementTextLayoutCache _bestGuessSizeForLabel:width:](self, "_bestGuessSizeForLabel:width:", v6, a4);
    a4 = v18;
    v17 = v19;
  }

  v22 = a4;
  v23 = v17;
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)estimatedSizeForOrdinal:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v6 = a3;
  -[SUUIViewElementTextLayoutCache _existingLayoutForViewElement:width:](self, "_existingLayoutForViewElement:width:", v6, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "boundingSize");
  else
    -[SUUIViewElementTextLayoutCache _bestGuessSizeForOrdinal:width:](self, "_bestGuessSizeForOrdinal:width:", v6, a4);
  v11 = v9;
  v12 = v10;

  v13 = v11;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)invalidateLayoutsForUpdatedElements
{
  id v3;
  NSMutableDictionary *layoutMapTables;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  _QWORD v8[4];
  NSMutableDictionary *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  layoutMapTables = self->_layoutMapTables;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__SUUIViewElementTextLayoutCache_invalidateLayoutsForUpdatedElements__block_invoke;
  v8[3] = &unk_2511FCE90;
  v5 = (NSMutableDictionary *)v3;
  v9 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](layoutMapTables, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = self->_layoutMapTables;
  self->_layoutMapTables = v5;
  v7 = v5;

}

void __69__SUUIViewElementTextLayoutCache_invalidateLayoutsForUpdatedElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (!objc_msgSend(v13, "updateType", (_QWORD)v15))
        {
          objc_msgSend(v8, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v14, v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v5);
}

- (id)layoutForWidth:(int64_t)a3 viewElement:(id)a4
{
  return -[SUUIViewElementTextLayoutCache _existingLayoutForViewElement:width:](self, "_existingLayoutForViewElement:width:", a4, a3);
}

- (void)requestLayoutForBadge:(id)a3 width:(int64_t)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[SUUIViewElementTextLayoutCache _createLayoutRequestForBadge:width:](self, "_createLayoutRequestForBadge:width:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[SUUIViewElementTextLayoutCache _addRequest:forViewElement:](self, "_addRequest:forViewElement:", v5, v6);

}

- (void)requestLayoutForButton:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  void *v6;
  id v7;

  v7 = a3;
  -[SUUIViewElementTextLayoutCache _createLayoutRequestForButton:attributedString:width:](self, "_createLayoutRequestForButton:attributedString:width:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SUUIViewElementTextLayoutCache _addRequest:forViewElement:](self, "_addRequest:forViewElement:", v6, v7);

}

- (void)requestLayoutForLabel:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  void *v6;
  id v7;

  v7 = a3;
  -[SUUIViewElementTextLayoutCache _createLayoutRequestForLabel:attributedString:width:](self, "_createLayoutRequestForLabel:attributedString:width:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SUUIViewElementTextLayoutCache _addRequest:forViewElement:](self, "_addRequest:forViewElement:", v6, v7);

}

- (void)requestLayoutForOrdinal:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  void *v6;
  id v7;

  v7 = a3;
  -[SUUIViewElementTextLayoutCache _createLayoutRequestForOrdinal:attributedString:width:](self, "_createLayoutRequestForOrdinal:attributedString:width:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SUUIViewElementTextLayoutCache _addRequest:forViewElement:](self, "_addRequest:forViewElement:", v6, v7);

}

- (void)requestLayoutForViewElement:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  void *v6;
  id v7;

  v7 = a3;
  -[SUUIViewElementTextLayoutCache _createLayoutRequestForViewElement:attributedString:width:](self, "_createLayoutRequestForViewElement:attributedString:width:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SUUIViewElementTextLayoutCache _addRequest:forViewElement:](self, "_addRequest:forViewElement:", v6, v7);

}

- (CGSize)sizeForButton:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v6 = a3;
  -[SUUIViewElementTextLayoutCache _layoutIndexForViewElement:width:](self, "_layoutIndexForViewElement:width:", v6, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (-[SUUILayoutCache layoutForIndex:forced:](self->_layoutCache, "layoutForIndex:forced:", objc_msgSend(v7, "integerValue"), 1), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    objc_msgSend(v9, "boundingSize");
    v12 = v11;
    v14 = v13;

  }
  else
  {
    -[SUUIViewElementTextLayoutCache _bestGuessSizeForButton:width:](self, "_bestGuessSizeForButton:width:", v6, a4);
    v12 = v15;
    v14 = v16;
  }

  v17 = v12;
  v18 = v14;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)sizeForLabel:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v6 = a3;
  -[SUUIViewElementTextLayoutCache _layoutIndexForViewElement:width:](self, "_layoutIndexForViewElement:width:", v6, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (-[SUUILayoutCache layoutForIndex:forced:](self->_layoutCache, "layoutForIndex:forced:", objc_msgSend(v7, "integerValue"), 1), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    objc_msgSend(v9, "boundingSize");
    v12 = v11;
    v14 = v13;

  }
  else
  {
    -[SUUIViewElementTextLayoutCache _bestGuessSizeForLabel:width:](self, "_bestGuessSizeForLabel:width:", v6, a4);
    v12 = v15;
    v14 = v16;
  }

  v17 = v12;
  v18 = v14;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)sizeForViewElement:(id)a3 width:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[SUUIViewElementTextLayoutCache _layoutIndexForViewElement:width:](self, "_layoutIndexForViewElement:width:", a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5
    && (-[SUUILayoutCache layoutForIndex:forced:](self->_layoutCache, "layoutForIndex:forced:", objc_msgSend(v5, "integerValue"), 1), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    objc_msgSend(v7, "boundingSize");
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v10 = *MEMORY[0x24BDBF148];
    v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_addRequest:(id)a3 forViewElement:(id)a4
{
  id v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  objc_msgSend(v25, "width");
  v8 = (uint64_t)v7;
  -[SUUIViewElementTextLayoutCache _existingLayoutForViewElement:width:](self, "_existingLayoutForViewElement:width:", v6, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v25, 0);
    v11 = -[SUUILayoutCache addLayoutRequests:](self->_layoutCache, "addLayoutRequests:", v10);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", v11);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", v8);
    -[NSMutableDictionary objectForKey:](self->_layoutMapTables, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      -[NSMutableDictionary setObject:forKey:](self->_layoutMapTables, "setObject:forKey:", v14, v13);
    }
    objc_msgSend(v6, "uniquingMapKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;
    if (v18)
      v19 = 1;
    else
      v19 = v15 == 0;
    if (v19)
    {
      v21 = v18;
      if (!v15)
      {
        if (v18)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v12, v20);

        }
        else
        {
          objc_msgSend(v14, "setObject:forKey:", v12, v6);
        }
        goto LABEL_19;
      }
    }
    else
    {
      v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v22 = v16;
      v23 = v22;
      if (v22)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v23, v24);

      }
      objc_msgSend(v14, "setObject:forKey:", v21, v6);

    }
    objc_msgSend(v21, "setObject:forKey:", v12, v15);

LABEL_19:
  }

}

- (id)_bestGuessCache
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_bestGuessCache_bestGuessCache;
  if (!_bestGuessCache_bestGuessCache)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    v4 = (void *)_bestGuessCache_bestGuessCache;
    _bestGuessCache_bestGuessCache = (uint64_t)v3;

    objc_msgSend((id)_bestGuessCache_bestGuessCache, "setCountLimit:", 1000);
    v2 = (void *)_bestGuessCache_bestGuessCache;
  }
  return v2;
}

- (CGSize)_bestGuessSizeForButton:(id)a3 width:(double)a4
{
  id v6;
  uint64_t v7;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _SUUIViewElementTextLayoutCacheBestGuessCacheKey *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  SUUIAttributedStringLayout *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  CGSize result;

  v6 = a3;
  v7 = objc_msgSend(v6, "elementType");
  if (v7 == 141 || v7 == 12)
  {
    objc_msgSend(v6, "buttonTitleStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v6, "style");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v11;

    SUUIViewElementFontWithStyle(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_alloc_init(_SUUIViewElementTextLayoutCacheBestGuessCacheKey);
    objc_msgSend(v6, "buttonText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUUIViewElementTextLayoutCacheBestGuessCacheKey setText:](v16, "setText:", v18);

    -[_SUUIViewElementTextLayoutCacheBestGuessCacheKey setFont:](v16, "setFont:", v15);
    -[_SUUIViewElementTextLayoutCacheBestGuessCacheKey setWidth:](v16, "setWidth:", (uint64_t)a4);
    -[SUUIViewElementTextLayoutCache _bestGuessCache](self, "_bestGuessCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "CGSizeValue");
      v12 = v21;
      v13 = v22;
    }
    else
    {
      v23 = SUUIViewElementAlignmentForStyle(v14);
      if (v23)
        v24 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v23);
      else
        v24 = 0;
      objc_msgSend(v6, "buttonText");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v15, 0, v24, v14);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUUIViewElementTextLayoutCache _createLayoutRequestForButton:attributedString:width:](self, "_createLayoutRequestForButton:attributedString:width:", v6, v26, (uint64_t)a4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[SUUIAttributedStringLayout initWithLayoutRequest:]([SUUIAttributedStringLayout alloc], "initWithLayoutRequest:", v27);
      -[SUUIAttributedStringLayout boundingSize](v28, "boundingSize");
      v12 = v29;
      v13 = v30;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewElementTextLayoutCache _bestGuessCache](self, "_bestGuessCache");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKey:", v20, v16);

    }
  }
  else
  {
    v12 = *MEMORY[0x24BDBF148];
    v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v32 = v12;
  v33 = v13;
  result.height = v33;
  result.width = v32;
  return result;
}

- (CGSize)_bestGuessSizeForLabel:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  _SUUIViewElementTextLayoutCacheBestGuessCacheKey *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SUUIAttributedStringLayout *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  CGSize result;

  v6 = a3;
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(_SUUIViewElementTextLayoutCacheBestGuessCacheKey);
  objc_msgSend(v6, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUUIViewElementTextLayoutCacheBestGuessCacheKey setText:](v9, "setText:", v11);

  -[_SUUIViewElementTextLayoutCacheBestGuessCacheKey setFont:](v9, "setFont:", v8);
  -[_SUUIViewElementTextLayoutCacheBestGuessCacheKey setWidth:](v9, "setWidth:", (uint64_t)a4);
  -[SUUIViewElementTextLayoutCache _bestGuessCache](self, "_bestGuessCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "CGSizeValue");
    v15 = v14;
    v17 = v16;
  }
  else
  {
    objc_msgSend(v6, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attributedStringWithDefaultFont:foregroundColor:style:", v8, 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIViewElementTextLayoutCache _createLayoutRequestForLabel:attributedString:width:](self, "_createLayoutRequestForLabel:attributedString:width:", v6, v20, (uint64_t)a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SUUIAttributedStringLayout initWithLayoutRequest:]([SUUIAttributedStringLayout alloc], "initWithLayoutRequest:", v21);
    -[SUUIAttributedStringLayout boundingSize](v22, "boundingSize");
    v15 = v23;
    v17 = v24;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementTextLayoutCache _bestGuessCache](self, "_bestGuessCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v13, v9);

  }
  v26 = v15;
  v27 = v17;
  result.height = v27;
  result.width = v26;
  return result;
}

- (CGSize)_bestGuessSizeForOrdinal:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SUUIViewElementTextLayoutCacheBestGuessCacheKey *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  SUUIAttributedStringLayout *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  CGSize result;

  v6 = a3;
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    SUUIFontForTextStyle(25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v9, "pointSize");
    objc_msgSend(v10, "_lightSystemFontOfSize:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_alloc_init(_SUUIViewElementTextLayoutCacheBestGuessCacheKey);
  objc_msgSend(v6, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUUIViewElementTextLayoutCacheBestGuessCacheKey setText:](v11, "setText:", v13);

  -[_SUUIViewElementTextLayoutCacheBestGuessCacheKey setFont:](v11, "setFont:", v8);
  -[_SUUIViewElementTextLayoutCacheBestGuessCacheKey setWidth:](v11, "setWidth:", (uint64_t)a4);
  -[SUUIViewElementTextLayoutCache _bestGuessCache](self, "_bestGuessCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "CGSizeValue");
    v17 = v16;
    v19 = v18;
  }
  else
  {
    objc_msgSend(v6, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attributedStringWithDefaultFont:foregroundColor:", v8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIViewElementTextLayoutCache _createLayoutRequestForOrdinal:attributedString:width:](self, "_createLayoutRequestForOrdinal:attributedString:width:", v6, v21, (uint64_t)a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[SUUIAttributedStringLayout initWithLayoutRequest:]([SUUIAttributedStringLayout alloc], "initWithLayoutRequest:", v22);
    -[SUUIAttributedStringLayout boundingSize](v23, "boundingSize");
    v17 = v24;
    v19 = v25;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementTextLayoutCache _bestGuessCache](self, "_bestGuessCache");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v15, v11);

  }
  v27 = v17;
  v28 = v19;
  result.height = v28;
  result.width = v27;
  return result;
}

- (id)_createLayoutRequestForBadge:(id)a3 width:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  SUUIAttributedStringLayoutRequest *v8;

  v5 = a3;
  if (objc_msgSend(v5, "badgeType") == 1
    && (objc_msgSend(v5, "attributedString"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = -[SUUIAttributedStringLayoutRequest initWithAttributedString:]([SUUIAttributedStringLayoutRequest alloc], "initWithAttributedString:", v6);
    -[SUUIAttributedStringLayoutRequest setNumberOfLines:](v8, "setNumberOfLines:", 1);
    -[SUUIAttributedStringLayoutRequest setWantsBaselineOffset:](v8, "setWantsBaselineOffset:", 1);
    -[SUUIAttributedStringLayoutRequest setWidth:](v8, "setWidth:", (double)a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_createLayoutRequestForButton:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  id v7;
  id v8;
  SUUIAttributedStringLayoutRequest *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  v9 = -[SUUIAttributedStringLayoutRequest initWithAttributedString:]([SUUIAttributedStringLayoutRequest alloc], "initWithAttributedString:", v8);

  -[SUUIAttributedStringLayoutRequest setWidth:](v9, "setWidth:", (double)a5);
  if (objc_msgSend(v7, "buttonViewType") == 9)
  {
    -[SUUIAttributedStringLayoutRequest setNumberOfLines:](v9, "setNumberOfLines:", 2);
  }
  else
  {
    objc_msgSend(v7, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForStyle:", *MEMORY[0x24BE51900]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(v11, "integerValue");
    else
      v12 = 1;
    -[SUUIAttributedStringLayoutRequest setNumberOfLines:](v9, "setNumberOfLines:", v12);
    -[SUUIAttributedStringLayoutRequest setWantsBaselineOffset:](v9, "setWantsBaselineOffset:", 1);

  }
  return v9;
}

- (id)_createLayoutRequestForLabel:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  id v7;
  id v8;
  SUUIAttributedStringLayoutRequest *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  v9 = -[SUUIAttributedStringLayoutRequest initWithAttributedString:]([SUUIAttributedStringLayoutRequest alloc], "initWithAttributedString:", v8);

  objc_msgSend(v7, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "maxTextLines");
  if (!v10 || (v12 = v11, v11 == -1))
    v12 = objc_msgSend(v7, "numberOfLines");
  -[SUUIAttributedStringLayoutRequest setNumberOfLines:](v9, "setNumberOfLines:", v12);
  -[SUUIAttributedStringLayoutRequest setWantsBaselineOffset:](v9, "setWantsBaselineOffset:", 1);
  -[SUUIAttributedStringLayoutRequest setWidth:](v9, "setWidth:", (double)a5);

  return v9;
}

- (id)_createLayoutRequestForViewElement:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  id v6;
  SUUIAttributedStringLayoutRequest *v7;

  v6 = a4;
  v7 = -[SUUIAttributedStringLayoutRequest initWithAttributedString:]([SUUIAttributedStringLayoutRequest alloc], "initWithAttributedString:", v6);

  -[SUUIAttributedStringLayoutRequest setNumberOfLines:](v7, "setNumberOfLines:", 1);
  -[SUUIAttributedStringLayoutRequest setWantsBaselineOffset:](v7, "setWantsBaselineOffset:", 1);
  -[SUUIAttributedStringLayoutRequest setWidth:](v7, "setWidth:", (double)a5);
  return v7;
}

- (id)_existingLayoutForViewElement:(id)a3 width:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[SUUIViewElementTextLayoutCache _layoutIndexForViewElement:width:](self, "_layoutIndexForViewElement:width:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[SUUILayoutCache layoutForIndex:](self->_layoutCache, "layoutForIndex:", objc_msgSend(v5, "integerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_layoutIndexForViewElement:(id)a3 width:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_layoutMapTables, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniquingMapKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;
  v14 = v13;
  if (v10)
  {
    objc_msgSend(v13, "objectForKey:", v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v15 = v11;
  }
  v16 = v15;
LABEL_9:
  v18 = v16;

  return v18;
}

- (SUUILayoutCache)layoutCache
{
  return self->_layoutCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutMapTables, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
}

@end
