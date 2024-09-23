@implementation SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell

- (SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell *v3;
  uint64_t v4;
  NSMapTable *viewElementViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewElementViews = v3->_viewElementViews;
    v3->_viewElementViews = (NSMapTable *)v4;

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double top;
  double left;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double Height;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  double Width;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;

  v32 = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v30, sel_layoutSubviews);
  -[SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  v7 = v6 + left;
  v9 = v8 + top;
  v11 = v10 - (left + self->_contentInset.right);
  v13 = v12 - (top + self->_contentInset.bottom);

  v33.origin.x = v7;
  v33.origin.y = v9;
  v33.size.width = v11;
  v33.size.height = v13;
  Height = CGRectGetHeight(v33);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = self->_viewElements;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = Height + -16.0;
    v19 = *(_QWORD *)v27;
    v20 = 4.0;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v15);
        -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v21), (_QWORD)v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v34.origin.x = v7;
        v34.origin.y = v9;
        v34.size.width = v11;
        v34.size.height = v13;
        Width = CGRectGetWidth(v34);
        objc_msgSend(v22, "sizeThatFits:", Width, v18);
        v25 = v24;
        objc_msgSend(v22, "setFrame:", 17.0, v20, Width, v24);
        v20 = v20 + v25 + 3.5;

        ++v21;
      }
      while (v17 != v21);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v17);
  }

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
  v11[2] = __106__SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __106__SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a1;
  objc_msgSend(a1, "_leftPositionedChildrenOfViewElement:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  objc_msgSend(v9, "labelLayoutCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "elementType");
        if (v19 != 141)
        {
          if (v19 == 138)
          {
            v21 = v8;
            v22 = v18;
            objc_msgSend(v10, "_attributedStringForLabel:context:", v22, v23);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "requestLayoutForLabel:attributedString:width:", v22, v20, (uint64_t)a4);

            v8 = v21;
            goto LABEL_11;
          }
          if (v19 != 12)
            continue;
        }
        objc_msgSend(v10, "_attributedStringForButton:context:", v18, v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "requestLayoutForButton:attributedString:width:", v8, v20, (uint64_t)a4);
LABEL_11:

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  CGSize result;

  v5 = 63.0;
  result.height = v5;
  result.width = a3;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  double v15;

  v8 = a3;
  v9 = a5;
  -[NSHashTable removeAllObjects](self->_artworkRelatedChildViewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __95__SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_2511F4AC8;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v12);

}

void __95__SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_leftPositionedChildrenOfViewElement:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "elementType");
        v11 = v10;
        v12 = 0;
        if (v10 > 137)
        {
          if (v10 == 138)
          {
            objc_msgSend(v3, "addLabelViewWithElement:width:context:", v9, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
            v12 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = 0;
            if (v10 != 141)
              goto LABEL_24;
            objc_msgSend(v3, "addButtonWithElement:width:context:", v9, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
            v12 = (id)objc_claimAutoreleasedReturnValue();
            LODWORD(v15) = -1.0;
            objc_msgSend(v12, "setCharge:", v15);
          }
LABEL_16:
          v13 = 0;
          if (!v12)
            goto LABEL_18;
LABEL_17:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "setObject:forKey:", v12, v9);
          goto LABEL_18;
        }
        if (v10 != 12)
        {
          v13 = 0;
          if (v10 != 50)
            goto LABEL_24;
        }
        objc_msgSend(v3, "addButtonWithElement:width:context:", v9, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = -0.5;
        objc_msgSend(v12, "setCharge:", v14);
        if (v11 != 50)
          goto LABEL_16;
        v12 = v12;
        v13 = v12;
        if (v12)
          goto LABEL_17;
LABEL_18:
        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 48), "imageResourceCacheKeyForViewElement:", *(_QWORD *)(a1 + 40));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = *(void **)(*(_QWORD *)(a1 + 32) + 864);
            if (!v17)
            {
              v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
              v19 = *(_QWORD *)(a1 + 32);
              v20 = *(void **)(v19 + 864);
              *(_QWORD *)(v19 + 864) = v18;

              v17 = *(void **)(*(_QWORD *)(a1 + 32) + 864);
            }
            objc_msgSend(v17, "setObject:forKey:", v16, v13);
          }

        }
LABEL_24:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 880);
  *(_QWORD *)(v21 + 880) = v4;

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
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
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  id v27;
  NSMapTable *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v8 = a4;
  v9 = a5;
  v26 = v8;
  v10 = objc_msgSend(v8, "requestIdentifier");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15);
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
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v27;
            objc_msgSend(v24, "setImage:", v27);

          }
          else
          {
            v21 = v27;
            objc_msgSend(v15, "setImage:", v27);
          }
          v22 = v8;

          goto LABEL_23;
        }

      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v12)
        continue;
      break;
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_artworkRelatedChildViewElementViews;
  v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v30;
    v22 = v26;
    v21 = v27;
LABEL_12:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v20)
        objc_enumerationMutation(obj);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v23), "setImage:forArtworkRequest:context:", v27, v26, v9) & 1) != 0)
        break;
      if (v19 == ++v23)
      {
        v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v19)
          goto LABEL_12;
        goto LABEL_24;
      }
    }
LABEL_23:
    LOBYTE(v19) = 1;
  }
  else
  {
    v22 = v8;
    v21 = v27;
  }
LABEL_24:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
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
  v5 = self->_viewElementViews;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "itmlID", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    SUUIViewElementFontWithStyle(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementFontWithStyle(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 11.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "buttonTitleStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(v5, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "buttonText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedStringWithDefaultFont:foregroundColor:style:", v9, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 11.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SUUIViewElementPlainColorWithStyle(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_leftPositionedChildrenOfViewElement:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__65;
  v11 = __Block_byref_object_dispose__65;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __96__SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell__leftPositionedChildrenOfViewElement___block_invoke;
  v6[3] = &unk_2511F4B90;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateChildrenUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __96__SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell__leftPositionedChildrenOfViewElement___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForStyle:", CFSTR("itml-shelf-zooming-layout-element-placement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("fixed"));

  v6 = objc_msgSend(v3, "elementPosition");
  if (v5)
  {
    if (v6 == 4)
    {
      v7 = objc_msgSend(v12, "elementType");
      if (v7 == 12 || v7 == 141 || v7 == 138)
      {
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        if (!v8)
        {
          v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v11 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = v9;

          v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        }
        objc_msgSend(v8, "addObject:", v12);
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
}

@end
