@implementation SUUITracklistSectionHeaderCollectionViewCell

- (SUUITracklistSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUITracklistSectionHeaderCollectionViewCell *v3;
  UIView *v4;
  UIView *separatorView;
  UIView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUITracklistSectionHeaderCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v4;

    v6 = v3->_separatorView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SUUITracklistSectionHeaderCollectionViewCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_separatorView);

  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = objc_msgSend(v8, "prefetchResourcesForViewElement:reason:", v9, a4);
  else
    v10 = 0;
  objc_msgSend(v7, "titleLabels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v10 |= objc_msgSend(v8, "prefetchResourcesForViewElement:reason:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), a4);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  return v10 & 1;
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
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "aggregateValueForKey:", 0x251203C28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_titlesWidthForWidth:columnData:", v10, a4);
  v12 = v11;
  v27 = v8;
  objc_msgSend(v8, "titleLabels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labelLayoutCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        SUUITracklistAttributedStringForLabel(0, v20, v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "requestLayoutForLabel:attributedString:width:", v20, v21, (uint64_t)v12);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v17);
  }

  objc_msgSend(v27, "button");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "elementType");
  if (v23 == 141 || v23 == 12)
  {
    SUUITracklistAttributedStringForButton(0, v22, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "columnForIdentifier:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "width");
    objc_msgSend(v14, "requestLayoutForButton:attributedString:width:", v22, v24, (uint64_t)v26);

  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGSize result;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(a4, "titleLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aggregateValueForKey:", 0x251203C28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_titlesWidthForWidth:columnData:", v10, a3);
  v12 = v11;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    v17 = 0.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v8, "sizeForViewElement:width:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v12, (_QWORD)v23);
        v17 = v17 + v19;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }
  else
  {
    v17 = 0.0;
  }

  if (v17 <= 32.0)
    v20 = 44.0;
  else
    v20 = v17 + 20.0;

  v21 = a3;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  UIControl *button;
  SUUIButtonViewElement *buttonViewElement;
  SUUIBuyButtonDescriptor *buyButtonDescriptor;
  SUUITracklistColumnData *v13;
  SUUITracklistColumnData *columnData;
  NSMutableArray *v15;
  NSMutableArray *labels;
  void *v17;
  void *v18;
  void *v19;
  UIView *separatorView;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  double v27;

  v8 = a3;
  v9 = a5;
  button = self->_button;
  self->_button = 0;

  buttonViewElement = self->_buttonViewElement;
  self->_buttonViewElement = 0;

  buyButtonDescriptor = self->_buyButtonDescriptor;
  self->_buyButtonDescriptor = 0;

  objc_msgSend(v9, "aggregateValueForKey:", 0x251203C28);
  v13 = (SUUITracklistColumnData *)objc_claimAutoreleasedReturnValue();
  columnData = self->_columnData;
  self->_columnData = v13;

  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  labels = self->_labels;
  self->_labels = v15;

  objc_msgSend(v8, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ikBorderColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "color");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  separatorView = self->_separatorView;
  if (v19)
  {
    -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v21);

  }
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __84__SUUITracklistSectionHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v24[3] = &unk_2511F4AC8;
  v27 = a4;
  v24[4] = self;
  v25 = v8;
  v26 = v9;
  v22 = v9;
  v23 = v8;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v24);

}

void __84__SUUITracklistSectionHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_titlesWidthForWidth:columnData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 848), *(double *)(a1 + 56));
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "elementType") & 0xFFFFFFFFFFFFFF7FLL) == 0xD)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 848), "columnForIdentifier:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "width");
    objc_msgSend(v3, "addButtonWithElement:width:context:", v6, *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__cancelConfirmationAction_, 0x10000);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__buttonAction_, 0x20000);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__showConfirmationAction_, 0x40000);
    objc_msgSend(v8, "setItemOfferDelegate:", *(_QWORD *)(a1 + 32));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 824);
    *(_QWORD *)(v9 + 824) = v8;
    v11 = v8;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 832), v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "buyButtonDescriptor");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 840);
    *(_QWORD *)(v13 + 840) = v12;

  }
  objc_msgSend(*(id *)(a1 + 40), "titleLabels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v3, "addLabelViewWithElement:width:context:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19), *(_QWORD *)(a1 + 48), v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _BOOL4 v10;
  UIControl *button;
  SUUIBuyButtonDescriptor *buyButtonDescriptor;
  void *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[SUUIBuyButtonDescriptor canPersonalizeUsingItemState:](self->_buyButtonDescriptor, "canPersonalizeUsingItemState:", v8);
  if (v10)
  {
    button = self->_button;
    buyButtonDescriptor = self->_buyButtonDescriptor;
    objc_msgSend(v9, "clientContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:](button, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", buyButtonDescriptor, v8, v13, v5);

  }
  return v10;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  uint64_t i;
  void *v22;
  CGFloat v23;
  double height;
  double v25;
  double v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  double MaxY;
  uint64_t v32;
  uint64_t j;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  UIControl *button;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v61 = *MEMORY[0x24BDAC8D0];
  v58.receiver = self;
  v58.super_class = (Class)SUUITracklistSectionHeaderCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v58, sel_layoutSubviews);
  -[SUUITracklistSectionHeaderCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_opt_class();
  -[SUUITracklistColumnData leftEdgeInset](self->_columnData, "leftEdgeInset");
  v10 = v5 - v9;
  -[SUUITracklistColumnData rightEdgeInset](self->_columnData, "rightEdgeInset");
  objc_msgSend(v8, "_titlesWidthForWidth:columnData:", self->_columnData, v10 - v11);
  v13 = v12;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v14 = self->_labels;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v55;
    v18 = *MEMORY[0x24BDBF090];
    v19 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v20 = 0.0;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v55 != v17)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v22, "sizeThatFits:", v13, 1.79769313e308);
        v62.size.height = v23;
        v62.origin.x = v18;
        v62.origin.y = v19;
        v62.size.width = v13;
        v63 = CGRectIntegral(v62);
        height = v63.size.height;
        objc_msgSend(v22, "setFrame:", v63.origin.x, v63.origin.y, v63.size.width);
        v20 = v20 + height;
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v16);
  }
  else
  {
    v20 = 0.0;
  }

  -[SUUITracklistColumnData leftEdgeInset](self->_columnData, "leftEdgeInset");
  v26 = v25;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v27 = self->_labels;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v28)
  {
    v29 = v28;
    v30 = (v7 - v20) * 0.5;
    MaxY = floorf(v30);
    v32 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v51 != v32)
          objc_enumerationMutation(v27);
        v34 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v34, "frame", (_QWORD)v50);
        v36 = v35;
        v38 = v37;
        objc_msgSend(v34, "setFrame:", v26, MaxY);
        v64.origin.x = v26;
        v64.origin.y = MaxY;
        v64.size.width = v36;
        v64.size.height = v38;
        MaxY = CGRectGetMaxY(v64);
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v29);
  }

  button = self->_button;
  if (button)
  {
    -[UIControl sizeThatFits:](button, "sizeThatFits:", *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
    v41 = v40;
    v43 = v42;
    -[SUUITracklistColumnData rightEdgeInset](self->_columnData, "rightEdgeInset");
    v45 = (v7 - v43) * 0.5;
    -[UIControl setFrame:](self->_button, "setFrame:", v5 - v44 - v41, floorf(v45), v41, v43);
  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", (_QWORD)v50);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "scale");
  v48 = 1.0 / v47;

  -[SUUITracklistColumnData leftEdgeInset](self->_columnData, "leftEdgeInset");
  -[UIView setFrame:](self->_separatorView, "setFrame:", v49, v7 - v48, v5 - v49, v48);
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGRect v16;

  v15 = a3;
  objc_msgSend(v15, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v15, "sizeThatFits:", *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  v12 = v11;
  v14 = v13;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  objc_msgSend(v15, "setFrame:", CGRectGetMaxX(v16) - v12, v6, v12, v14);

}

- (void)_buttonAction:(id)a3
{
  void *v4;
  char v5;
  SUUIButtonViewElement *buttonViewElement;
  void *v7;
  id v8;

  SUUICollectionViewForView(self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  buttonViewElement = self->_buttonViewElement;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v8, "indexPathForCell:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v8, buttonViewElement, 0, v7);

  }
  else
  {
    -[SUUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_buttonViewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
  }

}

- (void)_cancelConfirmationAction:(id)a3
{
  objc_msgSend(a3, "setShowingConfirmation:animated:", 0, 1);
}

- (void)_showConfirmationAction:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bringSubviewToFront:", v4);

  objc_msgSend(v4, "setShowingConfirmation:animated:", 1, 1);
}

+ (double)_titlesWidthForWidth:(double)a3 columnData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v5 = a4;
  objc_msgSend(v5, "columnForIdentifier:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "width");
    v9 = a3 - v8;
    objc_msgSend(v5, "interColumnSpacing");
    a3 = v9 - v10;
  }

  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_columnData, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptor, 0);
  objc_storeStrong((id *)&self->_buttonViewElement, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
