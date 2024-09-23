@implementation HUButtonCollectionViewCell

- (HUButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  HUButtonCollectionViewCell *v3;
  void *v4;
  HUButtonCell *v5;
  HUButtonCell *buttonView;
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
  v25.super_class = (Class)HUButtonCollectionViewCell;
  v3 = -[HUButtonCollectionViewCell initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUButtonCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = -[HUButtonCell initWithStyle:reuseIdentifier:]([HUButtonCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    buttonView = v3->_buttonView;
    v3->_buttonView = v5;

    -[HUButtonCell setUserInteractionEnabled:](v3->_buttonView, "setUserInteractionEnabled:", 0);
    -[HUButtonCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_buttonView);

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

          -[HUButtonCollectionViewCell contentView](v3, "contentView");
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
  -[HUButtonCollectionViewCell buttonView](self, "buttonView");
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
  double v16;
  double v17;
  void *v18;
  double Width;
  void *v20;
  void *v21;
  CGFloat v22;
  void *v23;
  double v24;
  void *v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26.receiver = self;
  v26.super_class = (Class)HUButtonCollectionViewCell;
  -[HUButtonCollectionViewCell layoutSubviews](&v26, sel_layoutSubviews);
  -[HUButtonCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HUButtonCollectionViewCell buttonView](self, "buttonView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = 1.0 / v14;

  -[HUButtonCollectionViewCell layoutMargins](self, "layoutMargins");
  v17 = v16;
  -[HUButtonCollectionViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  Width = CGRectGetWidth(v27);
  -[HUButtonCollectionViewCell topSeparatorView](self, "topSeparatorView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v17, 0.0, Width, v15);

  -[HUButtonCollectionViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v22 = CGRectGetMaxY(v28) - v15;
  -[HUButtonCollectionViewCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v24 = CGRectGetWidth(v29);
  -[HUButtonCollectionViewCell bottomSeparatorView](self, "bottomSeparatorView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", 0.0, v22, v24, v15);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUButtonCollectionViewCell;
  -[HUButtonCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUButtonCollectionViewCell setTopSeparatorVisible:](self, "setTopSeparatorVisible:", 0);
  -[HUButtonCollectionViewCell setBottomSeparatorVisible:](self, "setBottomSeparatorVisible:", 0);
}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUButtonCollectionViewCell;
  -[HUButtonCollectionViewCell setHighlighted:](&v6, sel_setHighlighted_);
  if (a3)
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.85, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUButtonCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (HFItem)item
{
  void *v2;
  void *v3;

  -[HUButtonCollectionViewCell buttonView](self, "buttonView");
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
  -[HUButtonCollectionViewCell buttonView](self, "buttonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItem:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUButtonCollectionViewCell buttonView](self, "buttonView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateUIWithAnimation:", v3);

}

- (BOOL)topSeparatorVisible
{
  void *v2;
  char v3;

  -[HUButtonCollectionViewCell topSeparatorView](self, "topSeparatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setTopSeparatorVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[HUButtonCollectionViewCell topSeparatorView](self, "topSeparatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)bottomSeparatorVisible
{
  void *v2;
  char v3;

  -[HUButtonCollectionViewCell bottomSeparatorView](self, "bottomSeparatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setBottomSeparatorVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[HUButtonCollectionViewCell bottomSeparatorView](self, "bottomSeparatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)isDisabled
{
  void *v2;
  char v3;

  -[HUButtonCollectionViewCell buttonView](self, "buttonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUButtonCollectionViewCell buttonView](self, "buttonView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabled:", v3);

}

- (HUButtonCell)buttonView
{
  return self->_buttonView;
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
  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end
