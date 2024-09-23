@implementation SUUIVerticalInfoListCollectionViewCell

- (SUUIVerticalInfoListCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIVerticalInfoListCollectionViewCell *v3;
  uint64_t v4;
  NSHashTable *titleViews;
  uint64_t v6;
  NSMapTable *valueViews;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIVerticalInfoListCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 0);
    titleViews = v3->_titleViews;
    v3->_titleViews = (NSHashTable *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    valueViews = v3->_valueViews;
    v3->_valueViews = (NSMapTable *)v6;

  }
  return v3;
}

- (void)reloadWithViewElements:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SUUIVerticalInfoListCollectionViewCell *v15;
  double v16;

  v8 = a3;
  v9 = a5;
  -[NSHashTable removeAllObjects](self->_titleViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_valueViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__SUUIVerticalInfoListCollectionViewCell_reloadWithViewElements_width_context___block_invoke;
  v12[3] = &unk_2511F4AC8;
  v16 = a4;
  v13 = v8;
  v14 = v9;
  v15 = self;
  v10 = v9;
  v11 = v8;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v12);

}

void __79__SUUIVerticalInfoListCollectionViewCell_reloadWithViewElements_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = *(id *)(a1 + 32);
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v38;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(obj);
        v32 = v4;
        v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v4);
        objc_msgSend(v5, "titleElement");
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v3, "addLabelViewWithElement:width:context:", v6, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 832), "addObject:", v7);

        }
        v31 = (void *)v6;
        objc_msgSend(v5, "valueElements");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v34 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              v14 = objc_msgSend(v13, "elementType");
              v15 = 0;
              if (v14 > 61)
              {
                v16 = 0;
                switch(v14)
                {
                  case 135:
                    objc_msgSend(v3, "addStarRatingViewWithViewElement:width:context:", v13, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
                    v17 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_40;
                  case 136:
                  case 137:
                  case 139:
                  case 140:
                  case 142:
                  case 143:
                    goto LABEL_49;
                  case 138:
                    objc_msgSend(v3, "addLabelViewWithElement:width:context:", v13, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
                    v17 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_40;
                  case 141:
                    goto LABEL_23;
                  case 144:
                    objc_msgSend(v3, "addTomatoRatingViewWithViewElement:width:context:", v13, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
                    v17 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_40;
                  default:
                    if (v14 == 62)
                    {
                      objc_msgSend(v3, "addHorizontalListWithElement:width:context:", v13, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
                      v17 = objc_claimAutoreleasedReturnValue();
LABEL_40:
                      v15 = (id)v17;
                      goto LABEL_41;
                    }
                    v16 = 0;
                    if (v14 != 152)
                      goto LABEL_49;
                    objc_msgSend(v3, "addImageViewWithVideoElement:context:", v13, *(_QWORD *)(a1 + 40));
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    break;
                }
                goto LABEL_32;
              }
              if (v14 <= 31)
              {
                if (v14 == 8)
                {
                  objc_msgSend(v3, "addBadgeViewWithElement:width:context:", v13, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
                  v20 = v19;
                  goto LABEL_34;
                }
                v16 = 0;
                if (v14 != 12)
                  goto LABEL_49;
              }
              else
              {
                if (v14 == 32)
                {
                  objc_msgSend(v3, "addDividerWithElement:context:", v13, *(_QWORD *)(a1 + 40));
                  v15 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setDividerOrientation:", 0);
LABEL_41:
                  v16 = 0;
                  if (!v15)
                    goto LABEL_43;
LABEL_42:
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 840), "setObject:forKey:", v13, v15);
                  goto LABEL_43;
                }
                if (v14 == 49)
                {
                  objc_msgSend(v3, "addImageViewWithElement:context:", v13, *(_QWORD *)(a1 + 40));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "tapRecognizer");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "addTarget:action:", *(_QWORD *)(a1 + 48), sel__imageTapAction_);

                  v20 = v21;
LABEL_34:
                  v15 = v20;
                  v16 = v20;
                  if (v20)
                    goto LABEL_42;
                  goto LABEL_43;
                }
                v16 = 0;
                if (v14 != 50)
                  goto LABEL_49;
              }
LABEL_23:
              objc_msgSend(v3, "addButtonWithElement:width:context:", v13, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
              v15 = v18;
              if (objc_msgSend(v13, "elementType") == 50)
                v16 = v15;
              else
                v16 = 0;

              if (v15)
                goto LABEL_42;
LABEL_43:
              if (v16)
              {
                objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v13);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  v24 = *(void **)(*(_QWORD *)(a1 + 48) + 824);
                  if (!v24)
                  {
                    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
                    v26 = *(_QWORD *)(a1 + 48);
                    v27 = *(void **)(v26 + 824);
                    *(_QWORD *)(v26 + 824) = v25;

                    v24 = *(void **)(*(_QWORD *)(a1 + 48) + 824);
                  }
                  objc_msgSend(v24, "setObject:forKey:", v23, v16);
                }

              }
LABEL_49:

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v10);
        }

        v4 = v32 + 1;
      }
      while (v32 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v30);
  }

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(a3, "valueElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        v11 |= objc_msgSend(v7, "prefetchResourcesForViewElement:reason:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), a4);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11 & 1;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  __objc2_class *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleElement");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "_attributedStringForLabel:context:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestLayoutForLabel:attributedString:width:", v11, v12, (uint64_t)a4);

  }
  v24 = v8;
  objc_msgSend(v8, "valueElements", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    v17 = a1;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "elementType");
        if (v20 <= 134)
        {
          switch(v20)
          {
            case 8:
              objc_msgSend(v10, "requestLayoutForBadge:width:", v19, (uint64_t)a4);
              break;
            case 12:
LABEL_15:
              objc_msgSend(a1, "_attributedStringForButton:context:", v19, v9);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "requestLayoutForButton:attributedString:width:", v19, v22, (uint64_t)a4);
LABEL_17:

              a1 = v17;
              break;
            case 62:
              v21 = SUUIHorizontalListView;
LABEL_19:
              -[__objc2_class requestLayoutForViewElement:width:context:](v21, "requestLayoutForViewElement:width:context:", v19, v9, a4);
              break;
          }
        }
        else
        {
          switch(v20)
          {
            case 135:
              v21 = SUUIStarRatingViewElementView;
              goto LABEL_19;
            case 138:
              objc_msgSend(a1, "_attributedStringForLabel:context:", v19, v9);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "requestLayoutForLabel:attributedString:width:", v19, v22, (uint64_t)a4);
              goto LABEL_17;
            case 141:
              goto LABEL_15;
            case 144:
              v21 = SUUITomatoRatingView;
              goto LABEL_19;
            default:
              continue;
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGSize result;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "valueElements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  objc_msgSend(v7, "titleElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "sizeForViewElement:width:", v11, a3);
    v13 = v12 + 0.0;
    ++v10;
  }
  else
  {
    v13 = 0.0;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v8, "sizeForViewElement:width:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), a3, (_QWORD)v22);
        v13 = v13 + v19;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  if (v10 >= 2)
    v13 = v13 + (float)((float)(v10 - 1) * 0.0);

  v20 = a3;
  v21 = v13;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;

  v8 = (objc_class *)MEMORY[0x24BDBCE30];
  v9 = a5;
  v10 = a3;
  v11 = (id)objc_msgSend([v8 alloc], "initWithObjects:", v10, 0);

  -[SUUIVerticalInfoListCollectionViewCell reloadWithViewElements:width:context:](self, "reloadWithViewElements:width:context:", v11, v9, a4);
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
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double Width;
  void *v19;
  _QWORD v20[7];
  _QWORD v21[6];
  objc_super v22;
  CGRect v23;

  v22.receiver = self;
  v22.super_class = (Class)SUUIVerticalInfoListCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v22, sel_layoutSubviews);
  -[SUUIVerticalInfoListCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SUUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  Width = CGRectGetWidth(v23);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3010000000;
  v21[3] = "";
  *(double *)&v21[4] = v15;
  v21[5] = v13;
  -[SUUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __56__SUUIVerticalInfoListCollectionViewCell_layoutSubviews__block_invoke;
  v20[3] = &unk_2511FB080;
  v20[4] = self;
  v20[5] = v21;
  *(double *)&v20[6] = Width - v15 - v17;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v20);

  _Block_object_dispose(v21, 8);
}

void __56__SUUIVerticalInfoListCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  CGRect v16;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(double *)(v6 + 32);
  v8 = *(double *)(v6 + 40);
  v15 = v5;
  if (a3)
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "containsObject:", v5);
    v10 = v15;
    if (v9)
      v8 = v8 + 13.0;
  }
  else
  {
    v10 = v5;
  }
  objc_msgSend(v10, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
  v12 = v11;
  v14 = v13;
  objc_msgSend(v15, "setFrame:", v7, v8, v11, v13);
  v16.origin.x = v7;
  v16.origin.y = v8;
  v16.size.width = v12;
  v16.size.height = v14;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = CGRectGetMaxY(v16) + 0.0;

}

- (void)_buttonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSMapTable objectForKey:](self->_valueViews, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    SUUICollectionViewForView(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "indexPathForCell:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v5, v8, 0, v7);

    }
    else
    {
      objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
    }

    v4 = v8;
  }

}

- (void)_imageTapAction:(id)a3
{
  NSMapTable *valueViews;
  void *v4;
  id v5;

  valueViews = self->_valueViews;
  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](valueViews, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "style");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  SUUIViewElementFontWithStyle(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    SUUIFontPreferredFontForTextStyle(5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "buttonText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedStringWithDefaultFont:foregroundColor:style:", v11, v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;

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
    v11 = objc_msgSend(v5, "labelViewStyle") == 5;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, dbl_241EFBE70[v11]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v10, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueViews, 0);
  objc_storeStrong((id *)&self->_titleViews, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
}

@end
