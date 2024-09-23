@implementation HULinkedApplicationCollectionViewCell

- (HULinkedApplicationCollectionViewCell)initWithFrame:(CGRect)a3
{
  HULinkedApplicationCollectionViewCell *v3;
  void *v4;
  HULinkedApplicationView *v5;
  HULinkedApplicationView *linkedApplicationView;
  void *v7;
  UIView *v8;
  UIView *topSeparatorView;
  UIView *v10;
  UIView *bottomSeparatorView;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)HULinkedApplicationCollectionViewCell;
  v3 = -[HULinkedApplicationCollectionViewCell initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc_init(HULinkedApplicationView);
    linkedApplicationView = v3->_linkedApplicationView;
    v3->_linkedApplicationView = v5;

    -[HULinkedApplicationCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_linkedApplicationView);

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    topSeparatorView = v3->_topSeparatorView;
    v3->_topSeparatorView = v8;

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v10;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v26[0] = v3->_topSeparatorView;
    v26[1] = v3->_bottomSeparatorView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v17, "setHidden:", 1);
          objc_msgSend(MEMORY[0x1E0CEA478], "tableSeparatorDarkColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBackgroundColor:", v18);

          -[HULinkedApplicationCollectionViewCell contentView](v3, "contentView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addSubview:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v14);
    }

  }
  return v3;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HULinkedApplicationCollectionViewCell linkedApplicationView](self, "linkedApplicationView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double Width;
  void *v18;
  void *v19;
  CGFloat v20;
  void *v21;
  double v22;
  void *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24.receiver = self;
  v24.super_class = (Class)HULinkedApplicationCollectionViewCell;
  -[HULinkedApplicationCollectionViewCell layoutSubviews](&v24, sel_layoutSubviews);
  -[HULinkedApplicationCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HULinkedApplicationCollectionViewCell linkedApplicationView](self, "linkedApplicationView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = 1.0 / v14;

  -[HULinkedApplicationCollectionViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  Width = CGRectGetWidth(v25);
  -[HULinkedApplicationCollectionViewCell topSeparatorView](self, "topSeparatorView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", 0.0, 0.0, Width, v15);

  -[HULinkedApplicationCollectionViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v20 = CGRectGetMaxY(v26) - v15;
  -[HULinkedApplicationCollectionViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v22 = CGRectGetWidth(v27);
  -[HULinkedApplicationCollectionViewCell bottomSeparatorView](self, "bottomSeparatorView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", 0.0, v20, v22, v15);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HULinkedApplicationCollectionViewCell;
  -[HULinkedApplicationCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HULinkedApplicationCollectionViewCell setTopSeparatorVisible:](self, "setTopSeparatorVisible:", 0);
  -[HULinkedApplicationCollectionViewCell setBottomSeparatorVisible:](self, "setBottomSeparatorVisible:", 0);
}

- (HFItem)item
{
  void *v2;
  void *v3;

  -[HULinkedApplicationCollectionViewCell linkedApplicationView](self, "linkedApplicationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HULinkedApplicationCollectionViewCell linkedApplicationView](self, "linkedApplicationView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItem:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HULinkedApplicationCollectionViewCell linkedApplicationView](self, "linkedApplicationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateUIWithAnimation:", v3);

}

- (BOOL)topSeparatorVisible
{
  void *v2;
  char v3;

  -[HULinkedApplicationCollectionViewCell topSeparatorView](self, "topSeparatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setTopSeparatorVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[HULinkedApplicationCollectionViewCell topSeparatorView](self, "topSeparatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)bottomSeparatorVisible
{
  void *v2;
  char v3;

  -[HULinkedApplicationCollectionViewCell bottomSeparatorView](self, "bottomSeparatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setBottomSeparatorVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[HULinkedApplicationCollectionViewCell bottomSeparatorView](self, "bottomSeparatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (HULinkedApplicationView)linkedApplicationView
{
  return self->_linkedApplicationView;
}

- (UIView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (UIView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_linkedApplicationView, 0);
}

@end
