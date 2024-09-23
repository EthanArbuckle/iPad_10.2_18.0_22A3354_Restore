@implementation SUUITracklistHeaderCollectionViewCell

- (SUUITracklistHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUITracklistHeaderCollectionViewCell *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *columnViews;
  UIView *v6;
  UIView *bottomSeparatorView;
  UIView *v8;
  void *v9;
  void *v10;
  UIView *v11;
  UIView *topSeparatorView;
  UIView *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SUUITracklistHeaderCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    columnViews = v3->_columnViews;
    v3->_columnViews = v4;

    v6 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v6;

    v8 = v3->_bottomSeparatorView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[SUUITracklistHeaderCollectionViewCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_bottomSeparatorView);

    v11 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    topSeparatorView = v3->_topSeparatorView;
    v3->_topSeparatorView = v11;

    v13 = v3->_topSeparatorView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[SUUITracklistHeaderCollectionViewCell contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v3->_topSeparatorView);

  }
  return v3;
}

+ (CGSize)sizeForHeaderTitleLabel:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(a1, "_attributedStringForLabel:context:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
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
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "aggregateValueForKey:", 0x251203C28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__SUUITracklistHeaderCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v13[3] = &unk_2511F65B8;
  v15 = v10;
  v16 = a1;
  v14 = v7;
  v11 = v10;
  v12 = v7;
  objc_msgSend(v9, "enumerateColumnsForHeader:usingBlock:", v8, v13);

}

void __83__SUUITracklistHeaderCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v5 = (void *)a1[6];
  v6 = a1[4];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "_attributedStringForLabel:context:", v7, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)a1[5];
  objc_msgSend(v8, "width");
  v11 = v10;

  objc_msgSend(v9, "requestLayoutForLabel:attributedString:width:", v7, v12, (uint64_t)v11);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  const char *v22;
  double v23;
  uint64_t v24;
  CGSize result;

  v7 = a4;
  v8 = a5;
  v19 = 0;
  v20 = (double *)&v19;
  v22 = "";
  v21 = 0x3010000000;
  v24 = *(_QWORD *)(MEMORY[0x24BDBF148] + 8);
  v23 = a3;
  objc_msgSend(v8, "aggregateValueForKey:", 0x251203C28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __79__SUUITracklistHeaderCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v16[3] = &unk_2511F65E0;
  v11 = v10;
  v17 = v11;
  v18 = &v19;
  objc_msgSend(v9, "enumerateColumnsForHeader:usingBlock:", v7, v16);
  v12 = v20[4];
  v13 = v20[5] + 6.0;
  v20[5] = v13;

  _Block_object_dispose(&v19, 8);
  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

void __79__SUUITracklistHeaderCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "width");
  objc_msgSend(v5, "estimatedSizeForLabel:width:", v6);
  v8 = v7;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(double *)(v9 + 40);
  if (v10 < v8)
    v10 = v8;
  *(double *)(v9 + 40) = v10;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  SUUITracklistColumnData *v9;
  SUUITracklistColumnData *columnData;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "aggregateValueForKey:", 0x251203C28);
  v9 = (SUUITracklistColumnData *)objc_claimAutoreleasedReturnValue();
  columnData = self->_columnData;
  self->_columnData = v9;

  -[NSMutableDictionary removeAllObjects](self->_columnViews, "removeAllObjects");
  objc_msgSend(v7, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ikBorderColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  -[UIView setBackgroundColor:](self->_bottomSeparatorView, "setBackgroundColor:", v14);
  -[UIView setBackgroundColor:](self->_topSeparatorView, "setBackgroundColor:", v15);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __77__SUUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v18[3] = &unk_2511F6630;
  v18[4] = self;
  v19 = v7;
  v20 = v8;
  v16 = v8;
  v17 = v7;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v18);

}

void __77__SUUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 832);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__SUUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_2511F6608;
  v10 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v5, "enumerateColumnsForHeader:usingBlock:", v4, v9);

}

void __77__SUUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(_QWORD *a1, void *a2, void *a3, uint64_t a4)
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v7 = (objc_class *)MEMORY[0x24BDD16E0];
  v8 = a3;
  v9 = a2;
  v14 = (id)objc_msgSend([v7 alloc], "initWithUnsignedInteger:", a4);
  v10 = (void *)a1[4];
  objc_msgSend(v9, "width");
  v12 = v11;

  objc_msgSend(v10, "addLabelViewWithElement:width:context:", v8, a1[5], v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1[6] + 840), "setObject:forKey:", v13, v14);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  _QWORD v21[11];
  BOOL v22;
  _QWORD v23[3];
  uint64_t v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SUUITracklistHeaderCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v25, sel_layoutSubviews);
  -[SUUITracklistHeaderCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SUUITracklistColumnData interColumnSpacing](self->_columnData, "interColumnSpacing");
  v13 = v12;
  -[SUUITracklistHeaderCollectionViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "effectiveUserInterfaceLayoutDirection");

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  -[SUUITracklistColumnData leftEdgeInset](self->_columnData, "leftEdgeInset");
  v24 = v16;
  -[SUUITracklistColumnData columns](self->_columnData, "columns");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __55__SUUITracklistHeaderCollectionViewCell_layoutSubviews__block_invoke;
  v21[3] = &unk_2511F6658;
  v21[6] = v5;
  v21[7] = v7;
  *(double *)&v21[8] = v9;
  *(double *)&v21[9] = v11;
  v21[4] = self;
  v21[5] = v23;
  v22 = v15 == 1;
  v21[10] = v13;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v21);

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = 1.0 / v19;

  -[UIView setFrame:](self->_bottomSeparatorView, "setFrame:", 0.0, v11 - v20, v9, v20);
  -[UIView setFrame:](self->_topSeparatorView, "setFrame:", 0.0, 0.0, v9, v20);
  _Block_object_dispose(v23, 8);
}

void __55__SUUITracklistHeaderCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v20 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", a3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "width");
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "sizeThatFits:", v7, *(double *)(a1 + 72));
    v10 = v9;
    v12 = v11;
    *(float *)&v9 = (*(double *)(a1 + 72) - v11) * 0.5;
    v13 = floorf(*(float *)&v9);
    switch(objc_msgSend(v20, "headerAlignment"))
    {
      case 0:
      case 3:
      case 4:
        v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        break;
      case 1:
        v15 = (v8 - v10) * 0.5 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        goto LABEL_7;
      case 2:
        v15 = v8 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) - v10;
LABEL_7:
        v16 = v15;
        v14 = floorf(v16);
        break;
      default:
        v14 = *MEMORY[0x24BDBF090];
        break;
    }
    v17 = v13;
    if (*(_BYTE *)(a1 + 88))
    {
      v14 = CGRectWithFlippedOriginRelativeToBoundingRect(v14, v17, v10, v12, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
      v10 = v18;
      v12 = v19;
    }
    objc_msgSend(v6, "setFrame:", v14, v17, v10, v12);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8
                                                              + *(double *)(a1 + 80)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v6, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SUUIUserInterfaceIdiom(v9);

    v11 = 10.0;
    if (v10 == 1)
      v11 = 11.0;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v13, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_columnViews, 0);
  objc_storeStrong((id *)&self->_columnData, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
}

@end
