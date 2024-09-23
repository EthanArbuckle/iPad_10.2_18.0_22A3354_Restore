@implementation SUUIAdornedImageViewReuseView

- (SUUIAdornedImageViewReuseView)init
{
  SUUIAdornedImageViewReuseView *v2;
  uint64_t v3;
  NSMapTable *viewElementViews;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIAdornedImageViewReuseView;
  v2 = -[SUUIAdornedImageViewReuseView init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewElementViews = v2->_viewElementViews;
    v2->_viewElementViews = (NSMapTable *)v3;

  }
  return v2;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a3;
  v8 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__SUUIAdornedImageViewReuseView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_2511F4A28;
  v9 = v8;
  v13 = &v15;
  v14 = a4;
  v12 = v9;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v11);
  LOBYTE(a4) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __80__SUUIAdornedImageViewReuseView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", a2, *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = 1;
  else
    v5 = result;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  double v17;
  id v18;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "size");
  if (v10 <= a4)
    a4 = v10;
  objc_msgSend(v8, "labelLayoutCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__SUUIAdornedImageViewReuseView_requestLayoutForViewElement_width_context___block_invoke;
  v14[3] = &unk_2511F4A50;
  v17 = a4;
  v18 = a1;
  v15 = v11;
  v16 = v8;
  v12 = v8;
  v13 = v11;
  objc_msgSend(v9, "enumerateChildrenUsingBlock:", v14);

}

void __75__SUUIAdornedImageViewReuseView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  char v13;

  v3 = a2;
  v13 = 0;
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementMarginForStyle(v4, &v13);
  v6 = v5;
  v8 = v7;

  v9 = v6 + v8;
  if (!v13)
    v9 = 16.0;
  v10 = *(double *)(a1 + 48) - v9;
  v11 = objc_msgSend(v3, "elementType");
  if (v11 > 137)
  {
    if (v11 == 138)
    {
      objc_msgSend(*(id *)(a1 + 56), "_attributedStringForLabel:context:", v3, *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "requestLayoutForLabel:attributedString:width:", v3, v12, (uint64_t)v10);
      goto LABEL_12;
    }
    if (v11 == 141)
    {
LABEL_9:
      objc_msgSend(*(id *)(a1 + 56), "_attributedStringForButton:context:", v3, *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "requestLayoutForButton:attributedString:width:", v3, v12, (uint64_t)v10);
LABEL_12:

    }
  }
  else
  {
    if (v11 != 8)
    {
      if (v11 != 12)
        goto LABEL_13;
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "requestLayoutForBadge:width:", v3, (uint64_t)v10);
  }
LABEL_13:

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a5, "sizeForViewElement:width:", a4, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9;
  id v10;
  SUUIPlayButton *playButton;
  id v12;
  void *v13;
  SUUIPlayButton *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  SUUIPlayButton *v21;
  _BOOL8 v22;
  void *v23;
  unint64_t v24;
  SUUIPlayButton *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  SUUIAdornedImageViewReuseView *v32;
  double v33;

  v9 = a3;
  v10 = a5;
  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  objc_storeStrong((id *)&self->_imageViewElement, a3);
  playButton = self->_playButton;
  self->_playButton = 0;

  self->_playButtonPosition = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __69__SUUIAdornedImageViewReuseView_reloadWithViewElement_width_context___block_invoke;
  v29[3] = &unk_2511F4AC8;
  v28 = v9;
  v30 = v28;
  v33 = a4;
  v12 = v10;
  v31 = v12;
  v32 = self;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v29);
  +[SUUIMediaPlayerInterface sharedInstance](SUUIMediaPlayerInterface, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:", self);

  v14 = self->_playButton;
  if (v14)
  {
    -[SUUIPlayButton playItemIdentifier](v14, "playItemIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      +[SUUIMediaPlayerInterface sharedInstance](SUUIMediaPlayerInterface, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIPlayButton playItemIdentifier](self->_playButton, "playItemIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "playerForItemWithIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUUIPlayButton playItemIdentifier](self->_playButton, "playItemIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "identifierIsOnDeck:", v19))
      {
        v20 = -[SUUIPlayButtonControl isIndeterminate](self->_playButton, "isIndeterminate");

        if (!v20)
        {
          -[SUUIPlayButtonControl beginIndeterminateAnimation](self->_playButton, "beginIndeterminateAnimation");
          v21 = self->_playButton;
          v22 = 0;
          goto LABEL_16;
        }
      }
      else
      {

      }
      if (!v18)
      {
        -[SUUIPlayButtonControl hideProgressAnimated:](self->_playButton, "hideProgressAnimated:", 1);
        if (-[SUUIPlayButton showOnDemand](self->_playButton, "showOnDemand"))
          -[SUUIPlayButton setHidden:](self->_playButton, "setHidden:", 1);
        goto LABEL_17;
      }
      objc_msgSend(v18, "playerItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "playState");

      if (-[SUUIPlayButton showOnDemand](self->_playButton, "showOnDemand"))
        -[SUUIPlayButton setHidden:](self->_playButton, "setHidden:", 0);
      if (v24 <= 5 && ((1 << v24) & 0x31) != 0)
      {
        -[SUUIPlayButtonControl hideProgressAnimated:](self->_playButton, "hideProgressAnimated:", 1);
LABEL_17:
        +[SUUIMediaPlayerInterface sharedInstance](SUUIMediaPlayerInterface, "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObserver:", self);

        goto LABEL_18;
      }
      v25 = self->_playButton;
      objc_msgSend(v18, "playerItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIPlayButton reloadWithItemStatus:animated:](v25, "reloadWithItemStatus:animated:", v26, 0);

      v21 = self->_playButton;
      v22 = v24 == 3;
LABEL_16:
      -[SUUIPlayButtonControl showPlayIndicator:](v21, "showPlayIndicator:", v22);
      goto LABEL_17;
    }
  }
LABEL_18:

}

void __69__SUUIAdornedImageViewReuseView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__SUUIAdornedImageViewReuseView_reloadWithViewElement_width_context___block_invoke_2;
  v10[3] = &unk_2511F59F8;
  v15 = *(_QWORD *)(a1 + 56);
  v11 = v4;
  v12 = v3;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v13 = v6;
  v14 = v7;
  v8 = v3;
  v9 = v4;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v10);

}

void __69__SUUIAdornedImageViewReuseView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;

  v3 = a2;
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "elementPosition");
  if (v5)
    v6 = v5;
  else
    v6 = 9;
  while (objc_msgSend(*(id *)(a1 + 32), "count") <= v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) == 0)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v6, v12);

    v31 = 0;
    SUUIViewElementMarginForStyle(v4, &v31);
    v15 = v13 + v14;
    if (!v31)
      v15 = 16.0;
    v16 = *(double *)(a1 + 64) - v15;
    v17 = objc_msgSend(v3, "elementType");
    v18 = 0;
    if (v17 <= 48)
    {
      if (v17 == 8)
      {
        objc_msgSend(*(id *)(a1 + 40), "addBadgeViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 48), v16);
        v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
        v18 = v22;
        v19 = v22;
        if (!v22)
          goto LABEL_34;
        goto LABEL_29;
      }
      if (v17 == 12)
        goto LABEL_20;
      v19 = 0;
      if (v17 != 29)
        goto LABEL_36;
    }
    else
    {
      if (v17 > 137)
      {
        if (v17 == 138)
        {
          objc_msgSend(*(id *)(a1 + 40), "addLabelViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 48), v16);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = 0;
          if (!v18)
            goto LABEL_36;
          goto LABEL_35;
        }
        v19 = 0;
        if (v17 != 141)
        {
LABEL_36:

          goto LABEL_37;
        }
LABEL_20:
        objc_msgSend(*(id *)(a1 + 40), "addButtonWithElement:width:context:", v3, *(_QWORD *)(a1 + 48), v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 56) + 448), v23);
          objc_msgSend(v3, "style");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 456) = objc_msgSend(v24, "elementPosition");

        }
        objc_msgSend(v23, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 56), sel__buttonAction_, 64);
        LODWORD(v25) = -0.5;
        objc_msgSend(v23, "setCharge:", v25);
        v18 = v23;
        if (objc_msgSend(v3, "elementType") == 50)
          v19 = v18;
        else
          v19 = 0;

        if (!v19)
        {
LABEL_34:
          if (v18)
          {
LABEL_35:
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 464), "setObject:forKey:", v18, v3);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 464), "setObject:forKey:", v3, v18);
            goto LABEL_36;
          }
          goto LABEL_36;
        }
LABEL_29:
        objc_msgSend(*(id *)(a1 + 48), "imageResourceCacheKeyForViewElement:", v3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = *(void **)(*(_QWORD *)(a1 + 56) + 432);
          if (!v27)
          {
            v28 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
            v29 = *(_QWORD *)(a1 + 56);
            v30 = *(void **)(v29 + 432);
            *(_QWORD *)(v29 + 432) = v28;

            v27 = *(void **)(*(_QWORD *)(a1 + 56) + 432);
          }
          objc_msgSend(v27, "setObject:forKey:", v26, v19);
        }

        goto LABEL_34;
      }
      if (v17 != 49)
      {
        v19 = 0;
        if (v17 != 50)
          goto LABEL_36;
        goto LABEL_20;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "addImageViewWithElement:context:", v3, *(_QWORD *)(a1 + 48));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tapRecognizer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addTarget:action:", *(_QWORD *)(a1 + 56), sel__buttonAction_);

    v22 = v20;
    goto LABEL_28;
  }
LABEL_37:

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  id v22;
  NSMapTable *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a4, "requestIdentifier");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v22 = v8;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "requestIdentifierForResourceCacheKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "unsignedIntegerValue") == v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "imageView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v22;
            objc_msgSend(v20, "setImage:", v22);

          }
          else
          {
            v8 = v22;
            objc_msgSend(v15, "setImage:", v22);
          }

          v19 = 1;
          goto LABEL_16;
        }

      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
        continue;
      break;
    }
    v19 = 0;
    v8 = v22;
  }
  else
  {
    v19 = 0;
  }
LABEL_16:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  -[SUUIViewElement flattenedChildren](self->_imageViewElement, "flattenedChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__SUUIAdornedImageViewReuseView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_2511F5A20;
  v7 = v4;
  v12 = v7;
  v8 = v6;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __58__SUUIAdornedImageViewReuseView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "itmlID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "count");

    if (v7 > a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      *a4 = 1;
    }
  }
  else
  {

  }
}

- (CGRect)frameForView:(id)a3
{
  NSMapTable *viewElementViews;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat Height;
  CGFloat v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  unint64_t v24;
  double MidX;
  double Width;
  unint64_t v27;
  double MidY;
  double v29;
  CGFloat x;
  CGFloat y;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  char v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect result;

  viewElementViews = self->_viewElementViews;
  v5 = a3;
  -[NSMapTable objectForKey:](viewElementViews, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v8 = SUUIViewElementMarginForStyle(v7, &v38);
  if (v38)
    v12 = v11;
  else
    v12 = 8.0;
  if (v38)
    v13 = v10;
  else
    v13 = 8.0;
  if (v38)
    v14 = v9;
  else
    v14 = 8.0;
  if (v38)
    v15 = v8;
  else
    v15 = 8.0;
  -[SUUIAdornedImageViewReuseView frame](self, "frame");
  v16 = CGRectGetWidth(v39) - (v12 + v14);
  -[SUUIAdornedImageViewReuseView frame](self, "frame");
  Height = CGRectGetHeight(v40);
  v19 = *MEMORY[0x24BDBF090];
  v18 = *(double *)(MEMORY[0x24BDBF090] + 8);
  objc_msgSend(v5, "sizeThatFits:", v16, Height - (v13 + v15));
  v21 = v20;
  v23 = v22;

  v24 = objc_msgSend(v7, "elementPosition");
  if (v24 > 9)
  {
    v14 = v19;
  }
  else if (((1 << v24) & 0x2A1) != 0)
  {
    -[SUUIAdornedImageViewReuseView bounds](self, "bounds");
    Width = CGRectGetWidth(v43);
    v44.origin.x = v19;
    v44.origin.y = v18;
    v44.size.width = v21;
    v44.size.height = v23;
    v14 = Width - CGRectGetWidth(v44) - v12;
  }
  else if (((1 << v24) & 0xE) != 0)
  {
    -[SUUIAdornedImageViewReuseView bounds](self, "bounds");
    MidX = CGRectGetMidX(v41);
    v42.origin.x = v19;
    v42.origin.y = v18;
    v42.size.width = v21;
    v42.size.height = v23;
    v14 = MidX + CGRectGetWidth(v42) * -0.5;
  }
  v27 = objc_msgSend(v7, "elementPosition");
  if (v27 > 9)
  {
    v15 = v18;
  }
  else if (((1 << v27) & 0x309) != 0)
  {
    -[SUUIAdornedImageViewReuseView bounds](self, "bounds");
    v29 = CGRectGetHeight(v47);
    v48.origin.x = v14;
    v48.origin.y = v18;
    v48.size.width = v21;
    v48.size.height = v23;
    v15 = v29 - CGRectGetHeight(v48) - v13;
  }
  else if (((1 << v27) & 0x32) != 0)
  {
    -[SUUIAdornedImageViewReuseView bounds](self, "bounds");
    MidY = CGRectGetMidY(v45);
    v46.origin.x = v14;
    v46.origin.y = v18;
    v46.size.width = v21;
    v46.size.height = v23;
    v15 = MidY + CGRectGetHeight(v46) * -0.5;
  }
  v49.origin.x = v14;
  v49.origin.y = v15;
  v49.size.width = v21;
  v49.size.height = v23;
  v50 = CGRectIntegral(v49);
  x = v50.origin.x;
  y = v50.origin.y;
  v32 = v50.size.width;
  v33 = v50.size.height;

  v34 = x;
  v35 = y;
  v36 = v32;
  v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)SUUIAdornedImageViewReuseView;
  -[SUUIAdornedImageViewReuseView layoutSubviews](&v13, sel_layoutSubviews);
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        -[SUUIAdornedImageViewReuseView frameForView:](self, "frameForView:", v8);
        objc_msgSend(v8, "setFrame:");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

- (void)_buttonAction:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_playButton == a3)
  {
    +[SUUIMediaPlayerInterface sharedInstance](SUUIMediaPlayerInterface, "sharedInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUIPlayButton playItemIdentifier](self->_playButton, "playItemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isItemWithIdentifierActive:", v5);

    if (v6)
    {
      -[SUUIPlayButton playItemIdentifier](self->_playButton, "playItemIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "togglePlayStateForItemWithIdentifier:", v7);
    }
    else
    {
      -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", self->_playButton);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (-[SUUIPlayButtonControl isDisabledButSelectable](self->_playButton, "isDisabledButSelectable"))
        {
          objc_msgSend(v7, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", 0x251210D08, 0x251210D28, 1, 0, 0, 0);
        }
        else
        {
          -[SUUIPlayButton playItemIdentifier](self->_playButton, "playItemIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "notifyWillChangeToItemWithItemIdentifer:", v8);

          if (!-[SUUIPlayButtonControl isIndeterminate](self->_playButton, "isIndeterminate"))
            -[SUUIPlayButtonControl beginIndeterminateAnimation](self->_playButton, "beginIndeterminateAnimation");
          objc_msgSend(v7, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
        }
      }
    }

    goto LABEL_14;
  }
  -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
LABEL_14:
    v4 = v9;
  }

}

- (void)mediaPlayer:(id)a3 itemStateChanged:(id)a4
{
  id v6;
  id v7;
  SUUIPlayButton *playButton;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  SUUIAdornedImageViewReuseView *v15;
  _QWORD block[5];
  id v17;

  v6 = a3;
  v7 = a4;
  playButton = self->_playButton;
  if (playButton)
  {
    -[SUUIPlayButton playItemIdentifier](playButton, "playItemIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[SUUIMediaPlayerInterface identifierMatches:item:](SUUIMediaPlayerInterface, "identifierMatches:item:", v9, v7);

    if (v10)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke;
      block[3] = &unk_2511F46D0;
      block[4] = self;
      v17 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v11 = v17;
LABEL_7:

      goto LABEL_8;
    }
    if (-[SUUIPlayButtonControl isIndeterminate](self->_playButton, "isIndeterminate")
      || -[SUUIPlayButtonControl showingProgress](self->_playButton, "showingProgress"))
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke_2;
      v13[3] = &unk_2511F46D0;
      v14 = v7;
      v15 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], v13);
      v11 = v14;
      goto LABEL_7;
    }
    if (-[SUUIPlayButton showOnDemand](self->_playButton, "showOnDemand"))
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke_3;
      v12[3] = &unk_2511F47C0;
      v12[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], v12);
    }
  }
LABEL_8:

}

uint64_t __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "showOnDemand"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setHidden:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 40), "playState");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  if ((unint64_t)(v2 - 6) > 0xFFFFFFFFFFFFFFFDLL)
    return objc_msgSend(v3, "hideProgressAnimated:", 1);
  objc_msgSend(v3, "reloadWithItemStatus:animated:", *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "showPlayIndicator:", v2 == 3);
}

uint64_t __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "playState");
  if (result != 5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 448), "hideProgressAnimated:", 0);
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 448), "showOnDemand");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 448), "setHidden:", 1);
  }
  return result;
}

uint64_t __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setHidden:", 1);
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "buttonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "buttonViewType");
  objc_msgSend(v6, "buttonTitleStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "_attributedStringForButtonText:type:style:context:", v8, v9, v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_attributedStringForButtonText:type:style:context:", v8, v9, v12, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)_attributedStringForButtonText:(id)a3 type:(int64_t)a4 style:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  SUUIViewElementFontWithStyle(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (a4)
      v13 = 5;
    else
      v13 = 1;
    SUUIFontPreferredFontForTextStyle(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "attributedStringWithDefaultFont:foregroundColor:style:", v12, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    SUUIFontPreferredFontForTextStyle(5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = SUUIViewElementAlignmentForStyle(v7);
  if (v11)
    v12 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v11);
  else
    v12 = 0;
  objc_msgSend(v5, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v8, v10, v12, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_attributedStringForMenuItem:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "itemText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_attributedStringForButtonText:type:style:context:", v8, 0, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SUUIPlayButton)playButton
{
  return self->_playButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_imageViewElement, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
}

@end
