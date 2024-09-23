@implementation SUUIGridComponent

- (SUUIGridComponent)initWithBrickItems:(id)a3
{
  id v4;
  SUUIGridComponent *v5;
  uint64_t v6;
  NSMutableArray *children;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIGridComponent;
  v5 = -[SUUIGridComponent init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    children = v5->_children;
    v5->_children = (NSMutableArray *)v6;

    SUUIEditorialStyleDefault((uint64_t)&v12);
    v8 = v12;
    v9 = v13;
    *(_QWORD *)&v5->_editorialStyle.titleFontSize = v14;
    *(_OWORD *)&v5->_editorialStyle.alignment = v8;
    *(_OWORD *)&v5->_editorialStyle.bodyFontSize = v9;
    v5->_gridType = 2;
    SUUILockupStyleDefault((uint64_t)&v12);
    v10 = v12;
    v5->_lockupStyle.visibleFields = v13;
    *(_OWORD *)&v5->_lockupStyle.artworkSize = v10;
    -[SUUIGridComponent _reloadMissingItemCount](v5, "_reloadMissingItemCount");
  }

  return v5;
}

- (SUUIGridComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SUUIGridComponent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *children;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  SUUILockupComponent *v25;
  __int128 v26;
  SUUIBrickItem *v27;
  SUUILockupComponent *v28;
  id v29;
  void *v30;
  __objc2_class *v31;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SUUIGridComponent;
  v5 = -[SUUIPageComponent initWithCustomPageContext:](&v43, sel_initWithCustomPageContext_, v4);
  if (!v5)
    goto LABEL_50;
  objc_msgSend(v4, "componentDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("childType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("lockup")) & 1) != 0)
    {
      v8 = 0;
LABEL_11:
      v5->_gridType = v8;
      goto LABEL_12;
    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("brick")) & 1) != 0)
    {
      v8 = 2;
      goto LABEL_11;
    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("editorial")) & 1) != 0)
    {
      v8 = 3;
      goto LABEL_11;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("media")))
    {
      v8 = 4;
      goto LABEL_11;
    }
  }
LABEL_12:
  objc_msgSend(v6, "objectForKey:", CFSTR("ranked"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5->_showsIndexNumbers = objc_msgSend(v9, "BOOLValue");
  objc_msgSend(v6, "objectForKey:", CFSTR("editorialStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    SUUIEditorialStyleForDictionary(v10, (uint64_t)&v40);
  else
    SUUIEditorialStyleDefault((uint64_t)&v40);
  v11 = v40;
  v12 = v41;
  *(_QWORD *)&v5->_editorialStyle.titleFontSize = v42;
  *(_OWORD *)&v5->_editorialStyle.alignment = v11;
  *(_OWORD *)&v5->_editorialStyle.bodyFontSize = v12;
  objc_msgSend(v6, "objectForKey:", CFSTR("lockupStyle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    SUUILockupStyleForDictionary(v13, v4, (uint64_t)&v40);
  else
    SUUILockupStyleDefault((uint64_t)&v40);
  v14 = v40;
  v5->_lockupStyle.visibleFields = v41;
  *(_OWORD *)&v5->_lockupStyle.artworkSize = v14;
  objc_msgSend(v6, "objectForKey:", CFSTR("children"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = v6;
    v34 = v13;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    children = v5->_children;
    v5->_children = v16;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v33 = v15;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          switch(v5->_gridType)
          {
            case 0:
            case 1:
            case 5:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v4, "itemForItemIdentifier:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v24)
                  goto LABEL_45;
                v25 = [SUUILockupComponent alloc];
                v26 = *(_OWORD *)&v5->_lockupStyle.artworkSize;
                *(_QWORD *)&v41 = v5->_lockupStyle.visibleFields;
                v40 = v26;
                v27 = -[SUUILockupComponent initWithItem:style:](v25, "initWithItem:style:", v24, &v40);
                goto LABEL_37;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = (void *)objc_msgSend(v4, "copy");
                objc_msgSend(v24, "setComponentDictionary:", v23);
                v28 = -[SUUILockupComponent initWithCustomPageContext:]([SUUILockupComponent alloc], "initWithCustomPageContext:", v24);
                if (v28)
                {
                  v29 = v4;
                  -[NSMutableArray addObject:](v5->_children, "addObject:", v28);
                  -[SUUILockupComponent editorial](v28, "editorial");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v30)
                    v5->_gridType = 1;
                  v4 = v29;
                }
                goto LABEL_44;
              }
              break;
            case 2:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = (void *)objc_msgSend(v4, "copy");
                objc_msgSend(v24, "setComponentDictionary:", v23);
                v27 = -[SUUIBrickItem initWithCustomPageContext:]([SUUIBrickItem alloc], "initWithCustomPageContext:", v24);
LABEL_37:
                v28 = (SUUILockupComponent *)v27;
                goto LABEL_43;
              }
              break;
            case 3:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = (void *)objc_msgSend(v4, "copy");
                objc_msgSend(v24, "setComponentDictionary:", v23);
                v31 = SUUIEditorialComponent;
                goto LABEL_42;
              }
              break;
            case 4:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = (void *)objc_msgSend(v4, "copy");
                objc_msgSend(v24, "setComponentDictionary:", v23);
                v31 = SUUIMediaComponent;
LABEL_42:
                v28 = (SUUILockupComponent *)objc_msgSend([v31 alloc], "initWithCustomPageContext:", v24);
                if (v28)
LABEL_43:
                  -[NSMutableArray addObject:](v5->_children, "addObject:", v28);
LABEL_44:

LABEL_45:
              }
              break;
            default:
              continue;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v20);
    }

    -[SUUIGridComponent _reloadMissingItemCount](v5, "_reloadMissingItemCount");
    v13 = v34;
    v6 = v35;
    v15 = v33;
  }

LABEL_50:
  return v5;
}

- (SUUIGridComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6;
  SUUIGridComponent *v7;
  SUUIGridComponent *v8;
  SUUIEditorialStyle *p_editorialStyle;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIGridComponent;
  v7 = -[SUUIPageComponent initWithFeaturedContentContext:kind:](&v17, sel_initWithFeaturedContentContext_kind_, v6, a4);
  v8 = v7;
  if (v7)
  {
    p_editorialStyle = &v7->_editorialStyle;
    SUUIEditorialStyleDefault((uint64_t)&v14);
    v10 = v14;
    v11 = v15;
    *(_QWORD *)&v8->_editorialStyle.titleFontSize = v16;
    *(_OWORD *)&p_editorialStyle->alignment = v10;
    *(_OWORD *)&v8->_editorialStyle.bodyFontSize = v11;
    SUUILockupStyleDefault((uint64_t)&v14);
    v12 = v14;
    v8->_lockupStyle.visibleFields = v15;
    *(_OWORD *)&v8->_lockupStyle.artworkSize = v12;
    -[SUUIGridComponent _setChildrenWithFeaturedContextContext:](v8, "_setChildrenWithFeaturedContextContext:", v6);
  }

  return v8;
}

- (SUUIGridComponent)initWithGridItems:(id)a3
{
  id v4;
  SUUIGridComponent *v5;
  SUUIGridComponent *v6;
  SUUIEditorialStyle *p_editorialStyle;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __int128 v18;
  id v19;
  uint64_t v20;
  NSMutableArray *children;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SUUIGridComponent;
  v5 = -[SUUIGridComponent init](&v30, sel_init);
  v6 = v5;
  if (v5)
  {
    p_editorialStyle = &v5->_editorialStyle;
    SUUIEditorialStyleDefault((uint64_t)&v27);
    v8 = v27;
    v9 = v28;
    *(_QWORD *)&v6->_editorialStyle.titleFontSize = v29;
    *(_OWORD *)&p_editorialStyle->alignment = v8;
    *(_OWORD *)&v6->_editorialStyle.bodyFontSize = v9;
    v6->_gridType = 0;
    SUUILockupStyleDefault((uint64_t)&v27);
    v10 = v27;
    v6->_lockupStyle.visibleFields = v28;
    *(_OWORD *)&v6->_lockupStyle.artworkSize = v10;
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v18 = *(_OWORD *)&v6->_lockupStyle.artworkSize;
          *(_QWORD *)&v28 = v6->_lockupStyle.visibleFields;
          v27 = v18;
          v19 = -[SUUIGridComponent _newLockupComponentWithItem:defaultStyle:](v6, "_newLockupComponentWithItem:defaultStyle:", v17, &v27, (_QWORD)v23);
          objc_msgSend(v11, "addObject:", v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v14);
    }

    v20 = objc_msgSend(v11, "mutableCopy");
    children = v6->_children;
    v6->_children = (NSMutableArray *)v20;

    -[SUUIGridComponent _reloadMissingItemCount](v6, "_reloadMissingItemCount");
  }

  return v6;
}

- (SUUIGridComponent)initWithLockups:(id)a3
{
  id v4;
  SUUIGridComponent *v5;
  SUUIGridComponent *v6;
  SUUIEditorialStyle *p_editorialStyle;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  NSMutableArray *children;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUUIGridComponent;
  v5 = -[SUUIGridComponent init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    p_editorialStyle = &v5->_editorialStyle;
    SUUIEditorialStyleDefault((uint64_t)&v24);
    v8 = v24;
    v9 = v25;
    *(_QWORD *)&v6->_editorialStyle.titleFontSize = v26;
    *(_OWORD *)&p_editorialStyle->alignment = v8;
    *(_OWORD *)&v6->_editorialStyle.bodyFontSize = v9;
    v6->_gridType = 0;
    SUUILockupStyleDefault((uint64_t)&v24);
    v10 = v24;
    v6->_lockupStyle.visibleFields = v25;
    *(_OWORD *)&v6->_lockupStyle.artworkSize = v10;
    v11 = objc_msgSend(v4, "mutableCopy");
    children = v6->_children;
    v6->_children = (NSMutableArray *)v11;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v6->_children;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "editorial", (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v6->_gridType = 1;
            goto LABEL_12;
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_12:

    -[SUUIGridComponent _reloadMissingItemCount](v6, "_reloadMissingItemCount");
  }

  return v6;
}

- (SUUIGridComponent)initWithRoomContext:(id)a3 gridType:(int64_t)a4
{
  id v6;
  SUUIGridComponent *v7;
  SUUIGridComponent *v8;
  SUUIEditorialStyle *p_editorialStyle;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIGridComponent;
  v7 = -[SUUIGridComponent init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    p_editorialStyle = &v7->_editorialStyle;
    SUUIEditorialStyleDefault((uint64_t)&v14);
    v10 = v14;
    v11 = v15;
    *(_QWORD *)&v8->_editorialStyle.titleFontSize = v16;
    *(_OWORD *)&p_editorialStyle->alignment = v10;
    *(_OWORD *)&v8->_editorialStyle.bodyFontSize = v11;
    v8->_gridType = a4;
    SUUILockupStyleDefault((uint64_t)&v14);
    v12 = v14;
    v8->_lockupStyle.visibleFields = v15;
    *(_OWORD *)&v8->_lockupStyle.artworkSize = v12;
    if (v8->_gridType == 5)
    {
      v8->_lockupStyle.artworkSize = 1;
      v8->_lockupStyle.visibleFields = 1054;
    }
    -[SUUIGridComponent _setChildrenWithFeaturedContextContext:](v8, "_setChildrenWithFeaturedContextContext:", v6);
  }

  return v8;
}

- (SUUIGridComponent)initWithViewElement:(id)a3
{
  SUUIGridComponent *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIGridComponent;
  result = -[SUUIPageComponent initWithViewElement:](&v4, sel_initWithViewElement_, a3);
  if (result)
    result->_gridType = 6;
  return result;
}

- (int64_t)componentType
{
  return 8;
}

- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  unint64_t gridType;
  id v8;

  v6 = a4;
  gridType = self->_gridType;
  if (gridType < 2)
  {
    v8 = v6;
    -[SUUIPageComponent _enumerateMissingItemIdentifiersFromLockups:startIndex:usingBlock:](self, "_enumerateMissingItemIdentifiersFromLockups:startIndex:usingBlock:", self->_children, a3, v6);
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  if (gridType == 2)
  {
    v8 = v6;
    -[SUUIPageComponent _enumerateMissingItemIdentifiersFromBricks:startIndex:usingBlock:](self, "_enumerateMissingItemIdentifiersFromBricks:startIndex:usingBlock:", self->_children, a3, v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)isMissingItemData
{
  return self->_missingItemCount > 0;
}

- (id)metricsElementName
{
  return CFSTR("grid");
}

- (id)_updateWithInvalidItemIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __55__SUUIGridComponent__updateWithInvalidItemIdentifiers___block_invoke;
  v14 = &unk_2511FB618;
  v6 = v4;
  v15 = v6;
  v7 = v5;
  v16 = v7;
  -[SUUIGridComponent enumerateMissingItemIdentifiersFromIndex:usingBlock:](self, "enumerateMissingItemIdentifiersFromIndex:usingBlock:", 0, &v11);
  if (objc_msgSend(v7, "count", v11, v12, v13, v14))
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_children, "removeObjectsAtIndexes:", v7);
    self->_missingItemCount -= objc_msgSend(v7, "count");
  }
  v8 = v16;
  v9 = v7;

  return v9;
}

uint64_t __55__SUUIGridComponent__updateWithInvalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  return result;
}

- (id)_updateWithMissingItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  SUUIGridComponent *v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v17 = 0uLL;
  v18 = 0;
  SUUILockupStyleDefault((uint64_t)&v17);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__SUUIGridComponent__updateWithMissingItems___block_invoke;
  v11[3] = &unk_2511FE1B0;
  v12 = v4;
  v13 = self;
  v6 = v5;
  v14 = v6;
  v15 = v17;
  v16 = v18;
  v7 = v4;
  -[SUUIGridComponent enumerateMissingItemIdentifiersFromIndex:usingBlock:](self, "enumerateMissingItemIdentifiersFromIndex:usingBlock:", 0, v11);
  v8 = v14;
  v9 = v6;

  return v9;
}

void __45__SUUIGridComponent__updateWithMissingItems___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(v6 + 72);
    if (v7 < 2)
    {
      objc_msgSend(*(id *)(v6 + 24), "objectAtIndex:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setItem:", v5);
      v13 = 0uLL;
      v14 = 0;
      if (v8)
        objc_msgSend(v8, "lockupStyle");
      if (objc_msgSend(v5, "itemKind") == 17)
      {
        v11 = *(_OWORD *)(a1 + 56);
        v12 = *(_QWORD *)(a1 + 72);
        v9 = v13;
        v10 = v14;
        if (SUUILockupStyleEqualToLockupStyle(&v11, &v9))
        {
          v14 = 214;
          v11 = v13;
          v12 = 214;
          objc_msgSend(v8, "_setLockupStyle:", &v11);
        }
      }
      goto LABEL_10;
    }
    if (v7 == 2)
    {
      objc_msgSend(*(id *)(v6 + 24), "objectAtIndex:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setLinkItem:", v5);
LABEL_10:
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", a3);
      --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104);

    }
  }

}

- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SUUILockupStyle *)a4
{
  id v5;
  SUUILockupComponent *v6;
  SUUILockupComponent *v7;
  __int128 v9;
  unint64_t visibleFields;

  v5 = a3;
  if (objc_msgSend(v5, "itemKind") == 17)
    a4->visibleFields = 214;
  v6 = [SUUILockupComponent alloc];
  v9 = *(_OWORD *)&a4->artworkSize;
  visibleFields = a4->visibleFields;
  v7 = -[SUUILockupComponent initWithItem:style:](v6, "initWithItem:style:", v5, &v9);

  return v7;
}

- (void)_reloadMissingItemCount
{
  unint64_t gridType;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  self->_missingItemCount = 0;
  gridType = self->_gridType;
  if (gridType >= 2)
  {
    if (gridType != 2)
      return;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = self->_children;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "link");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isActionable") & 1) == 0)
          {
            objc_msgSend(v15, "itemIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              ++self->_missingItemCount;
          }

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = self->_children;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v6; ++j)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
          objc_msgSend(v9, "item", (_QWORD)v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {

          }
          else if (objc_msgSend(v9, "itemIdentifier"))
          {
            ++self->_missingItemCount;
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v6);
    }
  }

}

- (void)_setChildrenWithFeaturedContextContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  NSMutableArray *children;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  SUUILockupComponent *v17;
  id v18;
  id v19;
  uint64_t v20;
  SUUILockupComponent *v21;
  uint64_t v22;
  SUUILockupComponent *v23;
  SUUILockupComponent *v24;
  void *v25;
  void *v26;
  __int128 v27;
  unint64_t visibleFields;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "componentDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("adamIds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v5;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = 24;
    children = self->_children;
    self->_children = v7;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v11)
      goto LABEL_16;
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "itemForItemIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v27 = *(_OWORD *)&self->_lockupStyle.artworkSize;
            visibleFields = self->_lockupStyle.visibleFields;
            v17 = -[SUUIGridComponent _newLockupComponentWithItem:defaultStyle:](self, "_newLockupComponentWithItem:defaultStyle:", v16, &v27);
            goto LABEL_12;
          }
          if ((objc_msgSend(v4, "isUnavailableItemIdentifier:", v15) & 1) == 0)
          {
            v18 = v10;
            v19 = v4;
            v20 = v8;
            v21 = [SUUILockupComponent alloc];
            v22 = objc_msgSend(v15, "longLongValue");
            v27 = *(_OWORD *)&self->_lockupStyle.artworkSize;
            visibleFields = self->_lockupStyle.visibleFields;
            v23 = v21;
            v8 = v20;
            v4 = v19;
            v10 = v18;
            v17 = -[SUUILockupComponent initWithItemIdentifier:style:](v23, "initWithItemIdentifier:style:", v22, &v27);
LABEL_12:
            v24 = v17;
            objc_msgSend(*(id *)((char *)&self->super.super.isa + v8), "addObject:", v17, v25);

          }
          continue;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (!v12)
      {
LABEL_16:

        -[SUUIGridComponent _reloadMissingItemCount](self, "_reloadMissingItemCount");
        v6 = v25;
        v5 = v26;
        break;
      }
    }
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %lu children"), objc_opt_class(), -[NSMutableArray count](self->_children, "count"));
}

- (NSArray)children
{
  return &self->_children->super;
}

- (int64_t)gridType
{
  return self->_gridType;
}

- (SUUILockupStyle)lockupStyle
{
  *retstr = *(SUUILockupStyle *)((char *)self + 80);
  return self;
}

- (BOOL)showsIndexNumbers
{
  return self->_showsIndexNumbers;
}

- (SUUIEditorialStyle)editorialStyle
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].bodyFontWeight;
  *(_OWORD *)&retstr->alignment = *(_OWORD *)&self->titleFontSize;
  *(_OWORD *)&retstr->bodyFontSize = v3;
  *(_QWORD *)&retstr->titleFontSize = self[1].titleFontWeight;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
