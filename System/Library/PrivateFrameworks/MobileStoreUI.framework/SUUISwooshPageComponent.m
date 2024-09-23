@implementation SUUISwooshPageComponent

- (SUUISwooshPageComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SUUISwooshPageComponent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  NSString *title;
  void *v16;
  void *v17;
  void *v18;
  int64_t swooshType;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  unint64_t v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUUISwooshPageComponent;
  v5 = -[SUUIPageComponent initWithCustomPageContext:](&v26, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("childType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("brick")) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("media")))
        goto LABEL_8;
      v8 = 2;
    }
    v5->_swooshType = v8;
LABEL_8:
    objc_msgSend(v6, "objectForKey:", CFSTR("showBrickTitles"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("showItemTitles"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v10;
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_12;
    }
    v5->_showsItemTitles = objc_msgSend(v9, "BOOLValue");
LABEL_12:
    objc_msgSend(v6, "objectForKey:", CFSTR("lockupStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      SUUILockupStyleForDictionary(v11, v4, (uint64_t)&v24);
    else
      SUUILockupStyleDefault((uint64_t)&v24);
    v12 = v24;
    v5->_lockupStyle.visibleFields = v25;
    *(_OWORD *)&v5->_lockupStyle.artworkSize = v12;
    objc_msgSend(v6, "objectForKey:", CFSTR("title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v13, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v14;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("titleIsLink"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v16, "BOOLValue"))
      v5->_seeAllStyle = 1;
    objc_msgSend(v6, "objectForKey:", CFSTR("link"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUUISwooshPageComponent _setSeeAllValuesWithLinkInfo:](v5, "_setSeeAllValuesWithLinkInfo:", v17);
    objc_msgSend(v6, "objectForKey:", CFSTR("children"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_30;
    swooshType = v5->_swooshType;
    if (swooshType)
    {
      if (swooshType == 2)
      {
        -[SUUISwooshPageComponent _mediaComponentsWithChildren:context:](v5, "_mediaComponentsWithChildren:context:", v18, v4);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 72;
      }
      else
      {
        if (swooshType != 1)
        {
LABEL_30:
          -[SUUISwooshPageComponent _reloadMissingDataCount](v5, "_reloadMissingDataCount");

          goto LABEL_31;
        }
        -[SUUISwooshPageComponent _brickItemsWithChildren:customPageContext:](v5, "_brickItemsWithChildren:customPageContext:", v18, v4);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 24;
      }
    }
    else
    {
      -[SUUISwooshPageComponent _lockupsWithChildren:context:](v5, "_lockupsWithChildren:context:", v18, v4);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = 40;
    }
    v22 = *(Class *)((char *)&v5->super.super.isa + v21);
    *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

    goto LABEL_30;
  }
LABEL_31:

  return v5;
}

- (SUUISwooshPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6;
  SUUISwooshPageComponent *v7;
  void *v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *platformKeyProfile;
  void *v15;
  uint64_t v16;
  NSString *title;
  void *v18;
  void *v19;
  uint64_t v20;
  NSURL *seeAllURL;
  void *v22;
  void *v23;
  int64_t swooshType;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  unint64_t v30;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SUUISwooshPageComponent;
  v7 = -[SUUIPageComponent initWithFeaturedContentContext:kind:](&v31, sel_initWithFeaturedContentContext_kind_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "componentDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 261)
      v7->_swooshType = 1;
    v7->_fcKind = a4;
    SUUILockupStyleDefault((uint64_t)&v29);
    v9 = v29;
    v7->_lockupStyle.visibleFields = v30;
    *(_OWORD *)&v7->_lockupStyle.artworkSize = v9;
    objc_msgSend(v6, "platformKeyProfileOverrides");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v7->_fcKind);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      platformKeyProfile = v7->_platformKeyProfile;
      v7->_platformKeyProfile = (NSString *)v13;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("title"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      title = v7->_title;
      v7->_title = (NSString *)v16;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("titleIsLink"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v18, "BOOLValue"))
      v7->_seeAllStyle = 1;
    objc_msgSend(v8, "objectForKey:", CFSTR("seeAllUrl"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v19);
      seeAllURL = v7->_seeAllURL;
      v7->_seeAllURL = (NSURL *)v20;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("showBrickTitles"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7->_showsItemTitles = objc_msgSend(v22, "BOOLValue");
    objc_msgSend(v8, "objectForKey:", CFSTR("children"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("adamIds"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("content"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
    swooshType = v7->_swooshType;
    if (swooshType)
    {
      if (swooshType != 1)
      {
LABEL_26:
        -[SUUISwooshPageComponent _reloadMissingDataCount](v7, "_reloadMissingDataCount");

        goto LABEL_27;
      }
      -[SUUISwooshPageComponent _brickItemsWithChildren:featuredPageContext:](v7, "_brickItemsWithChildren:featuredPageContext:", v23, v6);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = 24;
    }
    else
    {
      -[SUUISwooshPageComponent _lockupsWithChildren:featuredPageContext:](v7, "_lockupsWithChildren:featuredPageContext:", v23, v6);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = 40;
    }
    v27 = *(Class *)((char *)&v7->super.super.isa + v26);
    *(Class *)((char *)&v7->super.super.isa + v26) = (Class)v25;

    goto LABEL_26;
  }
LABEL_27:

  return v7;
}

- (SUUISwooshPageComponent)initWithItemList:(id)a3
{
  id v4;
  SUUISwooshPageComponent *v5;
  SUUISwooshPageComponent *v6;
  SUUILockupStyle *p_lockupStyle;
  __int128 v8;
  uint64_t v9;
  NSString *seeAllTitle;
  uint64_t v11;
  NSString *title;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  id v21;
  uint64_t v22;
  NSArray *lockups;
  void *v24;
  uint64_t v25;
  NSURL *seeAllURL;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t visibleFields;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SUUISwooshPageComponent;
  v5 = -[SUUISwooshPageComponent init](&v34, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_swooshType = 0;
    p_lockupStyle = &v5->_lockupStyle;
    SUUILockupStyleDefault((uint64_t)&v32);
    v8 = v32;
    v6->_lockupStyle.visibleFields = visibleFields;
    *(_OWORD *)&p_lockupStyle->artworkSize = v8;
    objc_msgSend(v4, "seeAllTitle");
    v9 = objc_claimAutoreleasedReturnValue();
    seeAllTitle = v6->_seeAllTitle;
    v6->_seeAllTitle = (NSString *)v9;

    objc_msgSend(v4, "title");
    v11 = objc_claimAutoreleasedReturnValue();
    title = v6->_title;
    v6->_title = (NSString *)v11;

    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18);
          v20 = *(_OWORD *)&p_lockupStyle->artworkSize;
          visibleFields = v6->_lockupStyle.visibleFields;
          v32 = v20;
          v21 = -[SUUISwooshPageComponent _newLockupComponentWithItem:defaultStyle:](v6, "_newLockupComponentWithItem:defaultStyle:", v19, &v32);
          objc_msgSend(v13, "addObject:", v21);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v16);
    }
    v22 = objc_msgSend(v13, "copy");
    lockups = v6->_lockups;
    v6->_lockups = (NSArray *)v22;

    objc_msgSend(v4, "seeAllURLString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v24);
      seeAllURL = v6->_seeAllURL;
      v6->_seeAllURL = (NSURL *)v25;

    }
    -[SUUISwooshPageComponent _reloadMissingDataCount](v6, "_reloadMissingDataCount");

  }
  return v6;
}

- (SUUISwooshPageComponent)initWithLockups:(id)a3 swooshType:(int64_t)a4 title:(id)a5
{
  id v8;
  id v9;
  SUUISwooshPageComponent *v10;
  uint64_t v11;
  NSArray *lockups;
  uint64_t v13;
  NSString *title;
  __int128 v16;
  unint64_t v17;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SUUISwooshPageComponent;
  v10 = -[SUUISwooshPageComponent init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    lockups = v10->_lockups;
    v10->_lockups = (NSArray *)v11;

    v10->_swooshType = a4;
    -[SUUISwooshPageComponent _lockupStyleWithLockups:](v10, "_lockupStyleWithLockups:", v10->_lockups);
    v10->_lockupStyle.visibleFields = v17;
    *(_OWORD *)&v10->_lockupStyle.artworkSize = v16;
    v13 = objc_msgSend(v9, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v13;

    -[SUUISwooshPageComponent _reloadMissingDataCount](v10, "_reloadMissingDataCount");
  }

  return v10;
}

- (SUUISwooshPageComponent)initWithRelatedContentContext:(id)a3
{
  id v4;
  SUUISwooshPageComponent *v5;
  void *v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  NSString *title;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *lockups;
  __int128 v17;
  unint64_t v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUISwooshPageComponent;
  v5 = -[SUUISwooshPageComponent init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_swooshType = 0;
    SUUILockupStyleDefault((uint64_t)&v17);
    v7 = v17;
    v5->_lockupStyle.visibleFields = v18;
    *(_OWORD *)&v5->_lockupStyle.artworkSize = v7;
    objc_msgSend(v6, "objectForKey:", CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v9;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("titleIsLink"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v11, "BOOLValue"))
      v5->_seeAllStyle = 1;
    objc_msgSend(v6, "objectForKey:", CFSTR("link"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUUISwooshPageComponent _setSeeAllValuesWithLinkInfo:](v5, "_setSeeAllValuesWithLinkInfo:", v12);
    objc_msgSend(v6, "objectForKey:", CFSTR("childrenIds"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "count"))
    {
      -[SUUISwooshPageComponent _lockupsWithChildren:context:](v5, "_lockupsWithChildren:context:", v13, v4);
      v14 = objc_claimAutoreleasedReturnValue();
      lockups = v5->_lockups;
      v5->_lockups = (NSArray *)v14;

    }
    -[SUUISwooshPageComponent _reloadMissingDataCount](v5, "_reloadMissingDataCount");

  }
  return v5;
}

- (SUUISwooshPageComponent)initWithRoomContext:(id)a3
{
  id v4;
  SUUISwooshPageComponent *v5;
  void *v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  NSString *title;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *lockups;
  __int128 v17;
  unint64_t v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUISwooshPageComponent;
  v5 = -[SUUIPageComponent initWithFeaturedContentContext:kind:](&v19, sel_initWithFeaturedContentContext_kind_, v4, 260);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_swooshType = 0;
    SUUILockupStyleDefault((uint64_t)&v17);
    v7 = v17;
    v5->_lockupStyle.visibleFields = v18;
    *(_OWORD *)&v5->_lockupStyle.artworkSize = v7;
    objc_msgSend(v6, "objectForKey:", CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v9;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("titleIsLink"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v11, "BOOLValue"))
      v5->_seeAllStyle = 1;
    objc_msgSend(v6, "objectForKey:", CFSTR("seeAllUrl"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUUISwooshPageComponent _setSeeAllValuesWithLinkInfo:](v5, "_setSeeAllValuesWithLinkInfo:", v12);
    objc_msgSend(v6, "objectForKey:", CFSTR("adamIds"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "count"))
    {
      -[SUUISwooshPageComponent _lockupsWithChildren:context:](v5, "_lockupsWithChildren:context:", v13, v4);
      v14 = objc_claimAutoreleasedReturnValue();
      lockups = v5->_lockups;
      v5->_lockups = (NSArray *)v14;

    }
    -[SUUISwooshPageComponent _reloadMissingDataCount](v5, "_reloadMissingDataCount");

  }
  return v5;
}

- (BOOL)isMissingItemData
{
  return self->_missingDataCount > 0;
}

- (BOOL)showsBrickTitles
{
  return self->_showsItemTitles;
}

- (BOOL)showsMediaTitles
{
  return self->_showsItemTitles;
}

- (int64_t)componentType
{
  return 15;
}

- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  NSArray *lockups;
  NSArray *bricks;
  id v9;

  v6 = a4;
  lockups = self->_lockups;
  if (lockups)
  {
    v9 = v6;
    -[SUUIPageComponent _enumerateMissingItemIdentifiersFromLockups:startIndex:usingBlock:](self, "_enumerateMissingItemIdentifiersFromLockups:startIndex:usingBlock:", lockups, a3, v6);
LABEL_5:
    v6 = v9;
    goto LABEL_6;
  }
  bricks = self->_bricks;
  if (bricks)
  {
    v9 = v6;
    -[SUUIPageComponent _enumerateMissingItemIdentifiersFromBricks:startIndex:usingBlock:](self, "_enumerateMissingItemIdentifiersFromBricks:startIndex:usingBlock:", bricks, a3, v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)metricsElementName
{
  return CFSTR("swoosh");
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2938]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2940]))
  {
    -[SUUISwooshPageComponent title](self, "title");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2930]))
    {
LABEL_8:
      v8.receiver = self;
      v8.super_class = (Class)SUUISwooshPageComponent;
      -[SUUIPageComponent valueForMetricsField:](&v8, sel_valueForMetricsField_, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_fcKind);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  if (!v5)
    goto LABEL_8;
LABEL_9:

  return v6;
}

- (void)_updateBricksWithItems:(id)a3
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
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_bricks;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "link", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isActionable") & 1) == 0)
        {
          objc_msgSend(v11, "itemIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v4, "objectForKey:", v12);
            v13 = objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v14 = (void *)v13;
              objc_msgSend(v10, "_setLinkItem:", v13);
              --self->_missingDataCount;

            }
          }

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (id)_updateLockupItemsWithItems:(id)a3
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
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_lockups;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "_needsItemData"))
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v10, "itemIdentifier"));
          objc_msgSend(v4, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[SUUISwooshPageComponent _updateLockup:withItem:](self, "_updateLockup:withItem:", v10, v12);
            objc_msgSend(v14, "addObject:", v10);
            --self->_missingDataCount;
          }

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v14;
}

- (void)_updateLockupItemsWithLookupResponse:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  SUUIItem *v12;
  void *v13;
  SUUIItem *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_lockups;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v9, "_needsItemData"))
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%lld"), objc_msgSend(v9, "itemIdentifier"));
          objc_msgSend(v15, "itemForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = [SUUIItem alloc];
            objc_msgSend(v11, "lookupDictionary");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[SUUIItem initWithLookupDictionary:](v12, "initWithLookupDictionary:", v13);

            -[SUUISwooshPageComponent _updateLockup:withItem:](self, "_updateLockup:withItem:", v9, v14);
            --self->_missingDataCount;

          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (id)_brickItemsWithChildren:(id)a3 customPageContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SUUIBrickItem *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "setComponentDictionary:", v14);
          v15 = -[SUUIBrickItem initWithCustomPageContext:]([SUUIBrickItem alloc], "initWithCustomPageContext:", v8);
          if (v15
            && -[SUUISwooshPageComponent _isBrickAvailable:withPageContext:](self, "_isBrickAvailable:withPageContext:", v15, v7))
          {
            objc_msgSend(v17, "addObject:", v15);
          }

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v17;
}

- (id)_brickItemsWithChildren:(id)a3 featuredPageContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SUUIBrickItem *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "setComponentDictionary:", v14);
          v15 = -[SUUIBrickItem initWithComponentContext:]([SUUIBrickItem alloc], "initWithComponentContext:", v8);
          if (v15
            && -[SUUISwooshPageComponent _isBrickAvailable:withPageContext:](self, "_isBrickAvailable:withPageContext:", v15, v7))
          {
            objc_msgSend(v17, "addObject:", v15);
          }

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v17;
}

- (unint64_t)_defaultVisibleFieldsForItemKind:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  _BYTE v6[16];
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  switch(a3)
  {
    case 0:
    case 4:
    case 5:
    case 10:
    case 12:
    case 13:
    case 17:
    case 18:
      v8 = v3;
      v9 = v4;
      SUUILockupStyleDefault((uint64_t)v6);
      result = v7;
      break;
    case 1:
    case 2:
    case 3:
    case 7:
    case 8:
    case 9:
    case 11:
    case 16:
      result = 19;
      break;
    case 6:
      result = 18;
      break;
    case 14:
    case 15:
      result = 530;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)_isBrickAvailable:(id)a3 withPageContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "link");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((objc_msgSend(v6, "isActionable") & 1) != 0)
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      objc_msgSend(v7, "itemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v8 = objc_msgSend(v5, "isUnavailableItemIdentifier:", v9) ^ 1;
      else
        LOBYTE(v8) = 0;

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (SUUILockupStyle)_lockupStyleWithLockups:(SEL)a3
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SUUILockupStyle *result;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  retstr->layoutStyle = 0;
  retstr->visibleFields = 0;
  retstr->artworkSize = 0;
  SUUILockupStyleDefault((uint64_t)retstr);
  v7 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "item", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
          objc_msgSend(v7, "addIndex:", -[SUUISwooshPageComponent _defaultVisibleFieldsForItemKind:](self, "_defaultVisibleFieldsForItemKind:", objc_msgSend(v13, "itemKind")));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count") == 1)
    retstr->visibleFields = objc_msgSend(v7, "firstIndex");

  return result;
}

- (id)_lockupsWithChildren:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[SUUISwooshPageComponent _lockupWithItemIdentifier:context:](self, "_lockupWithItemIdentifier:context:", v14, v7, (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v8, "addObject:", v15);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)_lockupsWithChildren:(id)a3 featuredPageContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "objectForKey:", CFSTR("adamId"));
          v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
          v14 = v13;
          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          goto LABEL_10;
        }
        v14 = 0;
LABEL_12:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[SUUISwooshPageComponent _lockupWithItemIdentifier:context:](self, "_lockupWithItemIdentifier:context:", v14, v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v17, "addObject:", v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  return v17;
}

- (id)_lockupWithItemIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SUUILockupComponent *v9;
  SUUILockupComponent *v10;
  SUUILockupComponent *v11;
  uint64_t v12;
  __int128 v14;
  unint64_t visibleFields;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "itemForItemIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14 = *(_OWORD *)&self->_lockupStyle.artworkSize;
    visibleFields = self->_lockupStyle.visibleFields;
    v9 = -[SUUISwooshPageComponent _newLockupComponentWithItem:defaultStyle:](self, "_newLockupComponentWithItem:defaultStyle:", v8, &v14);
LABEL_6:
    v10 = v9;
    goto LABEL_7;
  }
  if ((objc_msgSend(v7, "isUnavailableItemIdentifier:", v6) & 1) == 0)
  {
    v11 = [SUUILockupComponent alloc];
    v12 = objc_msgSend(v6, "longLongValue");
    v14 = *(_OWORD *)&self->_lockupStyle.artworkSize;
    visibleFields = self->_lockupStyle.visibleFields;
    v9 = -[SUUILockupComponent initWithItemIdentifier:style:](v11, "initWithItemIdentifier:style:", v12, &v14);
    goto LABEL_6;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (id)_mediaComponentsWithChildren:(id)a3 context:(id)a4
{
  id v4;
  SUUIGalleryPageComponent *v5;
  void *v6;

  v4 = a4;
  v5 = -[SUUIGalleryPageComponent initWithCustomPageContext:]([SUUIGalleryPageComponent alloc], "initWithCustomPageContext:", v4);

  -[SUUIGalleryPageComponent childComponents](v5, "childComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
    a4->visibleFields = 150;
  v6 = [SUUILockupComponent alloc];
  v9 = *(_OWORD *)&a4->artworkSize;
  visibleFields = a4->visibleFields;
  v7 = -[SUUILockupComponent initWithItem:style:](v6, "initWithItem:style:", v5, &v9);

  return v7;
}

- (void)_reloadMissingDataCount
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  self->_missingDataCount = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_bricks;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v7), "link");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isActionable") & 1) == 0)
        {
          objc_msgSend(v8, "itemIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
            ++self->_missingDataCount;
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_lockups;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14), "_needsItemData", (_QWORD)v15))
          ++self->_missingDataCount;
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)_setSeeAllValuesWithLinkInfo:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *seeAllTitle;
  void *v7;
  NSURL *v8;
  NSURL *seeAllURL;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKey:", CFSTR("label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    seeAllTitle = self->_seeAllTitle;
    self->_seeAllTitle = v5;

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);
    seeAllURL = self->_seeAllURL;
    self->_seeAllURL = v8;

  }
}

- (void)_updateLockup:(id)a3 withItem:(id)a4
{
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  _QWORD v9[3];
  __int128 v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  v10 = 0uLL;
  v11 = 0;
  if (v5)
    objc_msgSend(v5, "lockupStyle");
  if (objc_msgSend(v6, "itemKind") == 17)
  {
    SUUILockupStyleDefault((uint64_t)v9);
    v7 = v10;
    v8 = v11;
    if (SUUILockupStyleEqualToLockupStyle(v9, &v7))
    {
      v11 = 150;
      v7 = v10;
      v8 = 150;
      objc_msgSend(v5, "_setLockupStyle:", &v7);
    }
  }
  objc_msgSend(v5, "_setItem:", v6);

}

- (NSArray)bricks
{
  return self->_bricks;
}

- (NSArray)lockups
{
  return self->_lockups;
}

- (SUUILockupStyle)lockupStyle
{
  *retstr = self[2];
  return self;
}

- (NSArray)mediaComponents
{
  return self->_mediaComponents;
}

- (NSString)platformKeyProfile
{
  return self->_platformKeyProfile;
}

- (int64_t)seeAllStyle
{
  return self->_seeAllStyle;
}

- (NSString)seeAllTitle
{
  return self->_seeAllTitle;
}

- (NSURL)seeAllURL
{
  return self->_seeAllURL;
}

- (BOOL)showsIndexNumbers
{
  return self->_showsIndexNumbers;
}

- (int64_t)swooshType
{
  return self->_swooshType;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_seeAllURL, 0);
  objc_storeStrong((id *)&self->_seeAllTitle, 0);
  objc_storeStrong((id *)&self->_platformKeyProfile, 0);
  objc_storeStrong((id *)&self->_mediaComponents, 0);
  objc_storeStrong((id *)&self->_lockups, 0);
  objc_storeStrong((id *)&self->_bricks, 0);
}

@end
