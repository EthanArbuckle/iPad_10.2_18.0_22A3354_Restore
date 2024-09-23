@implementation SUUIImageDeckView

- (SUUIImageDeckView)init
{
  SUUIImageDeckView *v2;
  uint64_t v3;
  NSMapTable *viewElementViews;
  uint64_t v5;
  UIDynamicAnimator *animator;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIImageDeckView;
  v2 = -[SUUIImageDeckView init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewElementViews = v2->_viewElementViews;
    v2->_viewElementViews = (NSMapTable *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD5A0]), "initWithReferenceView:", v2);
    animator = v2->_animator;
    v2->_animator = (UIDynamicAnimator *)v5;

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
  v11[2] = __68__SUUIImageDeckView_prefetchResourcesForViewElement_reason_context___block_invoke;
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

void __68__SUUIImageDeckView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "elementType") == 49)
  {
    v3 = (void *)MEMORY[0x24BEBD4B8];
    v4 = v9;
    objc_msgSend(v3, "colorWithWhite:alpha:", 0.0, 0.15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShadowColor:", v5);

    objc_msgSend(v4, "setShadowOffset:", 5.0, 0.0);
    objc_msgSend(v4, "setShadowRadius:", 7.0);

  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", v9, *(_QWORD *)(a1 + 48));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = 1;
  else
    v8 = v6;
  *(_BYTE *)(v7 + 24) = v8;

}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  const char *v18;
  __int128 v19;
  CGSize result;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x3010000000;
  v18 = "";
  v19 = *MEMORY[0x24BDBF148];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__SUUIImageDeckView_preferredSizeForViewElement_context___block_invoke;
  v12[3] = &unk_2511F80D8;
  v7 = v6;
  v13 = v7;
  v14 = &v15;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v12);
  v8 = v16[4];
  v9 = v16[5];

  _Block_object_dispose(&v15, 8);
  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

void __57__SUUIImageDeckView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  float v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "elementType");
  v4 = v11;
  if (v3 == 49)
  {
    objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v11);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(double *)(v7 + 40) >= v6)
      v6 = *(double *)(v7 + 40);
    *(double *)(v7 + 40) = v6;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(double *)(v8 + 32);
    if (v9 >= 0.00000011920929)
    {
      v10 = v5 / 3.0;
      v5 = v9 + floorf(v10);
    }
    *(double *)(v8 + 32) = v5;
    v4 = v11;
  }

}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__SUUIImageDeckView_requestLayoutForViewElement_width_context___block_invoke;
  v9[3] = &unk_2511F9898;
  v11 = a4;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a3, "enumerateChildrenUsingBlock:", v9);

}

void __63__SUUIImageDeckView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 49)
    +[SUUIAdornedImageView requestLayoutForViewElement:width:context:](SUUIAdornedImageView, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  const char *v20;
  double v21;
  uint64_t v22;
  CGSize result;

  v7 = a4;
  v8 = a5;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x3010000000;
  v20 = "";
  v22 = *(_QWORD *)(MEMORY[0x24BDBF148] + 8);
  v21 = a3;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__SUUIImageDeckView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v14[3] = &unk_2511F80D8;
  v9 = v8;
  v15 = v9;
  v16 = &v17;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v14);
  v10 = v18[4];
  v11 = v18[5];

  _Block_object_dispose(&v17, 8);
  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

void __59__SUUIImageDeckView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  double v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 49)
  {
    objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v6);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(double *)(v4 + 40);
    if (v5 < v3)
      v5 = v3;
    *(double *)(v4 + 40) = v5;
  }

}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SUUIImageDeckView *v18;
  id v19;

  v9 = a3;
  v10 = a5;
  objc_storeStrong((id *)&self->_imageDeckViewElement, a3);
  self->_fitWidth = a4;
  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__SUUIImageDeckView_reloadWithViewElement_width_context___block_invoke;
  v15[3] = &unk_2511FA750;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v15);
  -[SUUIImageDeckView setImageViews:](self, "setImageViews:", v12);

}

void __57__SUUIImageDeckView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SUUIImageDeckView_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_2511F9F60;
  v10 = v3;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v3;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v9);

}

void __57__SUUIImageDeckView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "elementType");
  v4 = v11;
  if (v3 == 49)
  {
    objc_msgSend(*(id *)(a1 + 32), "addImageViewWithElement:context:", v11, *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v5, "setUserInteractionEnabled:", 0);
    v4 = v11;
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 456), "setObject:forKey:", v11, v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 456), "setObject:forKey:", v5, v11);
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
      objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = *(void **)(*(_QWORD *)(a1 + 48) + 472);
        if (!v7)
        {
          v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
          v9 = *(_QWORD *)(a1 + 48);
          v10 = *(void **)(v9 + 472);
          *(_QWORD *)(v9 + 472) = v8;

          v7 = *(void **)(*(_QWORD *)(a1 + 48) + 472);
        }
        objc_msgSend(v7, "setObject:forKey:", v6, v5);
      }

      v4 = v11;
    }
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIImageDeckView _layoutImages](self, "_layoutImages");
    -[SUUIImageDeckView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImageViews:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_imageViews, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_imageViews, a3);
    -[SUUIImageDeckView _layoutImages](self, "_layoutImages");
    -[SUUIImageDeckView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v20;
  id v21;
  NSMapTable *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v8 = a5;
  v9 = objc_msgSend(a4, "requestIdentifier");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v20 = 0;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "requestIdentifierForResourceCacheKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && objc_msgSend(v16, "unsignedIntegerValue") == v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "imageView");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setImage:", v21);

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v14, "setImage:cacheKey:context:", v21, v15, v8);
            else
              objc_msgSend(v14, "setImage:", v21);
          }
          v20 = 1;
        }

      }
      v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }
  else
  {
    v20 = 0;
  }

  return v20 & 1;
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
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__101;
  v19 = __Block_byref_object_dispose__101;
  v20 = 0;
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElement flattenedChildren](self->_imageDeckViewElement, "flattenedChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__SUUIImageDeckView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_2511F5A20;
  v7 = v4;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __46__SUUIImageDeckView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a2, "itmlID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count") > a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    *a4 = 1;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double *v3;
  double fitWidth;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGSize result;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (double *)MEMORY[0x24BDBF148];
  fitWidth = self->_fitWidth;
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SUUIImageDeckView imageViews](self, "imageViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = *v3;
    v11 = v5;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "sizeThatFits:", v10, v5);
        if (v11 < v13)
          v11 = v13;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v11 = v5;
  }

  v14 = fitWidth;
  v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)SUUIImageDeckView;
  -[SUUIImageDeckView layoutSubviews](&v12, sel_layoutSubviews);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[SUUIImageDeckView imageViews](self, "imageViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
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
        -[SUUIImageDeckView sendSubviewToBack:](self, "sendSubviewToBack:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)_layoutImages
{
  void *v3;
  uint64_t v4;
  double *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  double v12;
  double fitWidth;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t j;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t k;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  float v50;
  double v51;
  double v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;
  CGRect v69;
  CGRect v70;

  v68 = *MEMORY[0x24BDAC8D0];
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[SUUIImageDeckView imageViews](self, "imageViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  v52 = 0.0;
  v5 = (double *)MEMORY[0x24BDBF148];
  v6 = 0.0;
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v62;
    v9 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v62 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "sizeThatFits:", v9, v10);
        v6 = v6 + v12;
      }
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v7);
  }

  fitWidth = self->_fitWidth;
  -[SUUIImageDeckView contentInset](self, "contentInset");
  v15 = v14;
  -[SUUIImageDeckView contentInset](self, "contentInset");
  v17 = v16;
  -[SUUIImageDeckView imageViews](self, "imageViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 >= 2)
  {
    -[SUUIImageDeckView imageViews](self, "imageViews");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (v6 - (fitWidth - (v15 + v17))) / (double)(unint64_t)(objc_msgSend(v20, "count") - 1);

  }
  -[SUUIImageDeckView contentInset](self, "contentInset");
  v22 = v21;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[SUUIImageDeckView imageViews](self, "imageViews");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v58;
    v28 = *v5;
    v27 = v5[1];
    v29 = 0.0;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v58 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "sizeThatFits:", v28, v27);
        if (v29 < v31)
          v29 = v31;
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v25);
  }
  else
  {
    v29 = 0.0;
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[SUUIImageDeckView imageViews](self, "imageViews");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v54;
    v36 = v5[1];
    v51 = *v5;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v54 != v35)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
        objc_msgSend(v38, "frame", *(_QWORD *)&v51);
        v40 = v39;
        v42 = v41;
        objc_msgSend(v38, "sizeThatFits:", v51, v36);
        v44 = v43;
        v46 = v45;
        -[SUUIImageDeckView contentInset](self, "contentInset");
        v48 = v47;
        v69.origin.x = v40;
        v69.origin.y = v42;
        v69.size.width = v44;
        v69.size.height = v46;
        v49 = v48 + v29 - CGRectGetHeight(v69);
        objc_msgSend(v38, "setFrame:", v22, v49, v44, v46);
        -[SUUIImageDeckView sendSubviewToBack:](self, "sendSubviewToBack:", v38);
        v70.origin.x = v22;
        v70.origin.y = v49;
        v70.size.width = v44;
        v70.size.height = v46;
        v50 = v22 + CGRectGetWidth(v70) - v52;
        v22 = floorf(v50);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v34);
  }

}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImageView, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_imageDeckViewElement, 0);
  objc_storeStrong((id *)&self->_animator, 0);
}

@end
