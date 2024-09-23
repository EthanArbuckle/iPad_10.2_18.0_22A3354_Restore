@implementation SUUIKeyValueInfoListCollectionViewCell

- (SUUIKeyValueInfoListCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIKeyValueInfoListCollectionViewCell *v3;
  uint64_t v4;
  NSMapTable *valueViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIKeyValueInfoListCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    valueViews = v3->_valueViews;
    v3->_valueViews = (NSMapTable *)v4;

  }
  return v3;
}

+ (double)titleColumnWidthWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  double v13;
  double v14;

  v8 = a5;
  objc_msgSend(a3, "titleElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "_attributedStringForLabel:context:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a4 * 0.4;
    objc_msgSend(v8, "labelLayoutCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestLayoutForLabel:attributedString:width:", v9, v10, vcvtms_s32_f32(v11));
    objc_msgSend(v12, "sizeForLabel:width:", v9, floorf(v11));
    *(float *)&v13 = v13;
    v14 = ceilf(*(float *)&v13);

  }
  else
  {
    v14 = 0.0;
  }

  return v14;
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
  id v7;
  id v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  __objc2_class *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "labelLayoutCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aggregateValueForKey:", CFSTR("SUUIKVILTCWK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  v24 = v7;
  objc_msgSend(v7, "valueElements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = a4 - v12 + -14.0;
    v17 = (uint64_t)v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "elementType");
        if (v21 <= 134)
        {
          switch(v21)
          {
            case 8:
              objc_msgSend(v9, "requestLayoutForBadge:width:", v20, (uint64_t)a4);
              break;
            case 12:
LABEL_13:
              objc_msgSend(a1, "_attributedStringForButton:context:", v20, v8);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "requestLayoutForButton:attributedString:width:", v20, v23, v17);
LABEL_15:

              break;
            case 62:
              v22 = SUUIHorizontalListView;
LABEL_17:
              -[__objc2_class requestLayoutForViewElement:width:context:](v22, "requestLayoutForViewElement:width:context:", v20, v8, v16);
              break;
          }
        }
        else
        {
          switch(v21)
          {
            case 135:
              v22 = SUUIStarRatingViewElementView;
              goto LABEL_17;
            case 138:
              objc_msgSend(a1, "_attributedStringForLabel:context:", v20, v8);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "requestLayoutForLabel:attributedString:width:", v20, v23, v17);
              goto LABEL_15;
            case 141:
              goto LABEL_13;
            case 144:
              v22 = SUUITomatoRatingView;
              goto LABEL_17;
            default:
              continue;
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGSize result;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "titleElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0.0;
  v11 = 0.0;
  if (v9)
  {
    v12 = a3 * 0.4;
    objc_msgSend(v8, "sizeForViewElement:width:", v9, floorf(v12));
    v11 = v13;
  }
  objc_msgSend(v8, "aggregateValueForKey:", CFSTR("SUUIKVILTCWK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  objc_msgSend(v7, "valueElements");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = a3 - v16 + -14.0;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v17);
        objc_msgSend(v8, "sizeForViewElement:width:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22), v20);
        v10 = v10 + v23;
        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v19);
  }
  if (v11 < v10)
    v11 = v10;

  v24 = a3;
  v25 = v11;
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  float v11;
  SUUIAttributedStringView *titleView;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  SUUIKeyValueInfoListCollectionViewCell *v17;
  id v18;
  double v19;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "aggregateValueForKey:", CFSTR("SUUIKVILTCWK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  self->_titleColumnWidth = v11;

  titleView = self->_titleView;
  self->_titleView = 0;

  -[NSMapTable removeAllObjects](self->_valueViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__SUUIKeyValueInfoListCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v15[3] = &unk_2511F4AC8;
  v16 = v8;
  v17 = self;
  v19 = a4;
  v18 = v9;
  v13 = v9;
  v14 = v8;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v15);

}

void __78__SUUIKeyValueInfoListCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "titleElement");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(double *)(a1 + 56) * 0.4;
  v32 = (void *)v4;
  objc_msgSend(v3, "addLabelViewWithElement:width:context:", floorf(v5));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 832);
  *(_QWORD *)(v7 + 832) = v6;

  v9 = *(double *)(a1 + 56);
  v10 = *(double *)(*(_QWORD *)(a1 + 40) + 824);
  objc_msgSend(*(id *)(a1 + 32), "valueElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = v9 - v10 + -14.0;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "elementType");
        v19 = 0;
        if (v18 > 61)
        {
          switch(v18)
          {
            case 135:
              objc_msgSend(v3, "addStarRatingViewWithViewElement:width:context:", v17, *(_QWORD *)(a1 + 48), v14);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_31;
            case 136:
            case 137:
            case 139:
            case 140:
            case 142:
            case 143:
              goto LABEL_39;
            case 138:
              objc_msgSend(v3, "addLabelViewWithElement:width:context:", v17, *(_QWORD *)(a1 + 48), v14);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_31;
            case 141:
              goto LABEL_15;
            case 144:
              objc_msgSend(v3, "addTomatoRatingViewWithViewElement:width:context:", v17, *(_QWORD *)(a1 + 48), v14);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_31;
            default:
              if (v18 != 62)
              {
                if (v18 != 152)
                  goto LABEL_39;
                objc_msgSend(v3, "addImageViewWithVideoElement:context:", v17, *(_QWORD *)(a1 + 48));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_24;
              }
              objc_msgSend(v3, "addHorizontalListWithElement:width:context:", v17, *(_QWORD *)(a1 + 48), v14);
              v20 = objc_claimAutoreleasedReturnValue();
LABEL_31:
              v19 = (id)v20;
              v22 = 0;
              if (!v20)
                goto LABEL_33;
              break;
          }
LABEL_32:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 840), "setObject:forKey:", v17, v19);
          goto LABEL_33;
        }
        if (v18 > 48)
        {
          if (v18 == 49)
          {
            objc_msgSend(v3, "addImageViewWithElement:context:", v17, *(_QWORD *)(a1 + 48));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "tapRecognizer");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addTarget:action:", *(_QWORD *)(a1 + 40), sel__imageTapAction_);

            v24 = v25;
            goto LABEL_26;
          }
          if (v18 != 50)
            goto LABEL_39;
        }
        else
        {
          if (v18 == 8)
          {
            objc_msgSend(v3, "addBadgeViewWithElement:width:context:", v17, *(_QWORD *)(a1 + 48), v14);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
            v24 = v23;
LABEL_26:
            v22 = v24;
            v19 = v24;
            if (v24)
              goto LABEL_32;
            goto LABEL_33;
          }
          if (v18 != 12)
            goto LABEL_39;
        }
LABEL_15:
        objc_msgSend(v3, "addButtonWithElement:width:context:", v17, *(_QWORD *)(a1 + 48), v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel__buttonAction_, 64);
        v19 = v21;
        if (objc_msgSend(v17, "elementType") == 50)
          v22 = v19;
        else
          v22 = 0;

        if (v19)
          goto LABEL_32;
LABEL_33:
        if (v22)
        {
          objc_msgSend(*(id *)(a1 + 48), "imageResourceCacheKeyForViewElement:", v17);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = *(void **)(*(_QWORD *)(a1 + 40) + 848);
            if (!v28)
            {
              v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
              v30 = *(_QWORD *)(a1 + 40);
              v31 = *(void **)(v30 + 848);
              *(_QWORD *)(v30 + 848) = v29;

              v28 = *(void **)(*(_QWORD *)(a1 + 40) + 848);
            }
            objc_msgSend(v28, "setObject:forKey:", v27, v22);
          }

        }
LABEL_39:

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v13);
  }

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
  SUUIKeyValueInfoListCollectionViewCell *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double MaxY;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t ShouldReverseLayoutDirection;
  double y;
  SUUIAttributedStringView *titleView;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  SUUIAttributedStringView *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  SUUIAttributedStringView *v46;
  double v47;
  double v48;
  SUUIKeyValueInfoListCollectionViewCell *v49;
  int v50;
  int v51;
  BOOL v52;
  float v53;
  float v54;
  float v55;
  double v56;
  double v57;
  double height;
  uint64_t v59;
  uint64_t v60;
  CGFloat v61;
  id rect[5];
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  uint64_t v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v2 = self;
  v67 = *MEMORY[0x24BDAC8D0];
  v65.receiver = self;
  v65.super_class = (Class)SUUIKeyValueInfoListCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v65, sel_layoutSubviews);
  -[SUUIKeyValueInfoListCollectionViewCell contentView](v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  rect[0] = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[SUUIViewReuseCollectionViewCell contentInset](v2, "contentInset");
  MaxY = v11;
  v14 = v13;
  v16 = v15;
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  titleView = v2->_titleView;
  v61 = y;
  if (titleView)
  {
    -[SUUIAttributedStringView firstBaselineOffset](titleView, "firstBaselineOffset");
    v56 = v20;
    -[SUUIAttributedStringView sizeThatFits:](v2->_titleView, "sizeThatFits:", v2->_titleColumnWidth, 1.79769313e308);
    v22 = v21;
    v24 = v23;
    if ((ShouldReverseLayoutDirection & 1) != 0)
    {
      *(id *)&v68.origin.x = rect[0];
      v68.origin.y = v6;
      v68.size.width = v8;
      v68.size.height = v10;
      v25 = CGRectGetMaxX(v68) - v14 - v2->_titleColumnWidth;
    }
    else
    {
      v25 = v14 + v2->_titleColumnWidth - v21;
    }
    v28 = MaxY;
    v29 = v22;
    v30 = v24;
    v69 = CGRectIntegral(*(CGRect *)&v25);
    y = v69.origin.y;
    height = v69.size.height;
    -[SUUIAttributedStringView setFrame:](v2->_titleView, "setFrame:", v69.origin.x);
    if ((ShouldReverseLayoutDirection & 1) != 0)
      goto LABEL_8;
LABEL_5:
    v26 = v14 + v2->_titleColumnWidth;
    v27 = 14.0;
    goto LABEL_9;
  }
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v56 = 0.0;
  if ((ShouldReverseLayoutDirection & 1) == 0)
    goto LABEL_5;
LABEL_8:
  *(id *)&v70.origin.x = rect[0];
  v70.origin.y = v6;
  v70.size.width = v8;
  v70.size.height = v10;
  v26 = CGRectGetMaxX(v70) - v14 - v2->_titleColumnWidth;
  v27 = -14.0;
LABEL_9:
  v31 = v26 + v27;
  -[SUUIViewReuseCollectionViewCell allExistingViews](v2, "allExistingViews");
  memset(&rect[1], 0, 32);
  v63 = 0u;
  v64 = 0u;
  rect[0] = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(rect[0], "countByEnumeratingWithState:objects:count:", &rect[1], v66, 16);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    v35 = v8 - v16 - v31;
    v36 = floorf(v35);
    v37 = *(_QWORD *)rect[3];
    v57 = y + v56;
    v59 = *(_QWORD *)rect[3];
    do
    {
      v38 = 0;
      v60 = v33;
      do
      {
        if (*(_QWORD *)rect[3] != v37)
          objc_enumerationMutation(rect[0]);
        v39 = (SUUIAttributedStringView *)*((_QWORD *)rect[2] + v38);
        if (v39 != v2->_titleView)
        {
          objc_msgSend(*((id *)rect[2] + v38), "sizeThatFits:", v36, 1.79769313e308);
          v41 = v40;
          v43 = v42;
          v44 = v31;
          if ((_DWORD)ShouldReverseLayoutDirection)
          {
            v71.origin.x = v31;
            v71.origin.y = v61;
            v71.size.width = v41;
            v71.size.height = v43;
            v44 = v31 - CGRectGetWidth(v71);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v45 = ShouldReverseLayoutDirection;
            v46 = v39;
            -[SUUIAttributedStringView firstBaselineOffset](v46, "firstBaselineOffset");
            v48 = v47;
            v49 = v2;
            v50 = -[SUUIAttributedStringView usesTallCharacterSet](v2->_titleView, "usesTallCharacterSet");
            v51 = -[SUUIAttributedStringView usesTallCharacterSet](v46, "usesTallCharacterSet");

            if (v34)
            {
              ShouldReverseLayoutDirection = v45;
              v2 = v49;
              v37 = v59;
              v33 = v60;
LABEL_27:
              -[SUUIAttributedStringView setFrame:](v39, "setFrame:", v44, MaxY, v41, v43);
              v72.origin.x = v44;
              v72.origin.y = MaxY;
              v72.size.width = v41;
              v72.size.height = v43;
              MaxY = CGRectGetMaxY(v72);
              ++v34;
              goto LABEL_28;
            }
            v52 = v50 == v51;
            ShouldReverseLayoutDirection = v45;
            v2 = v49;
            v37 = v59;
            v33 = v60;
            if (!v52)
            {
              v53 = MaxY + v56 - v48;
              v54 = floorf(v53);
              goto LABEL_26;
            }
          }
          else if (v34)
          {
            goto LABEL_27;
          }
          MaxY = v61;
          if (v43 >= height)
            goto LABEL_27;
          v55 = v57 - v43;
          v54 = ceilf(v55);
LABEL_26:
          MaxY = v54;
          goto LABEL_27;
        }
LABEL_28:
        ++v38;
      }
      while (v33 != v38);
      v33 = objc_msgSend(rect[0], "countByEnumeratingWithState:objects:count:", &rect[1], v66, 16);
    }
    while (v33);
  }

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
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_valueViews, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
