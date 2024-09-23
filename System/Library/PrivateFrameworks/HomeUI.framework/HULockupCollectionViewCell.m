@implementation HULockupCollectionViewCell

- (HULockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  HULockupCollectionViewCell *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  HULockupView *lockupView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIView *v33;
  UIView *topSeparatorView;
  UIView *v35;
  UIView *bottomSeparatorView;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _QWORD v51[2];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)HULockupCollectionViewCell;
  v3 = -[HULockupCollectionViewCell initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(-[HULockupCollectionViewCell lockupViewClass](v3, "lockupViewClass"));
    -[HULockupCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = objc_msgSend(v5, "initWithFrame:");
    lockupView = v3->_lockupView;
    v3->_lockupView = (HULockupView *)v7;

    -[HULockupView setInternalViewResizingDelegate:](v3->_lockupView, "setInternalViewResizingDelegate:", v3);
    -[HULockupView setTranslatesAutoresizingMaskIntoConstraints:](v3->_lockupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HULockupCollectionViewCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_lockupView);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView leadingAnchor](v3->_lockupView, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupCollectionViewCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupCollectionViewCell contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "directionalLayoutMargins");
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v17);

    -[HULockupView trailingAnchor](v3->_lockupView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupCollectionViewCell contentView](v3, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutMarginsGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v22);

    -[HULockupView topAnchor](v3->_lockupView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupCollectionViewCell contentView](v3, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v27);

    -[HULockupView bottomAnchor](v3->_lockupView, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupCollectionViewCell contentView](v3, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v32);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);
    v33 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    topSeparatorView = v3->_topSeparatorView;
    v3->_topSeparatorView = v33;

    v35 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v35;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v51[0] = v3->_topSeparatorView;
    v51[1] = v3->_bottomSeparatorView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v47 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v42, "setHidden:", 1);
          objc_msgSend(MEMORY[0x1E0CEA478], "tableSeparatorDarkColor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setBackgroundColor:", v43);

          -[HULockupCollectionViewCell contentView](v3, "contentView");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addSubview:", v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v39);
    }

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double Width;
  void *v8;
  void *v9;
  CGFloat v10;
  void *v11;
  double v12;
  void *v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.receiver = self;
  v14.super_class = (Class)HULockupCollectionViewCell;
  -[HULockupCollectionViewCell layoutSubviews](&v14, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = 1.0 / v4;

  -[HULockupCollectionViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v15);
  -[HULockupCollectionViewCell topSeparatorView](self, "topSeparatorView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, Width, v5);

  -[HULockupCollectionViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = CGRectGetMaxY(v16) - v5;
  -[HULockupCollectionViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = CGRectGetWidth(v17);
  -[HULockupCollectionViewCell bottomSeparatorView](self, "bottomSeparatorView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", 0.0, v10, v12, v5);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HULockupCollectionViewCell;
  -[HULockupCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HULockupCollectionViewCell setTopSeparatorVisible:](self, "setTopSeparatorVisible:", 0);
  -[HULockupCollectionViewCell setBottomSeparatorVisible:](self, "setBottomSeparatorVisible:", 0);
}

- (HFItem)item
{
  void *v2;
  void *v3;

  -[HULockupCollectionViewCell lockupView](self, "lockupView");
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
  -[HULockupCollectionViewCell lockupView](self, "lockupView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItem:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HULockupCollectionViewCell lockupView](self, "lockupView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateUIWithAnimation:", v3);

}

- (BOOL)topSeparatorVisible
{
  void *v2;
  char v3;

  -[HULockupCollectionViewCell topSeparatorView](self, "topSeparatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setTopSeparatorVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[HULockupCollectionViewCell topSeparatorView](self, "topSeparatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)bottomSeparatorVisible
{
  void *v2;
  char v3;

  -[HULockupCollectionViewCell bottomSeparatorView](self, "bottomSeparatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setBottomSeparatorVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[HULockupCollectionViewCell bottomSeparatorView](self, "bottomSeparatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)didUpdateRequiredHeightForLockupView:(id)a3
{
  id v4;

  -[HULockupCollectionViewCell resizingDelegate](self, "resizingDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didUpdateRequiredHeightForCell:", self);

}

- (Class)lockupViewClass
{
  return (Class)objc_opt_class();
}

- (HULockupView)lockupView
{
  return self->_lockupView;
}

- (HUResizableCellDelegate)resizingDelegate
{
  return (HUResizableCellDelegate *)objc_loadWeakRetained((id *)&self->_resizingDelegate);
}

- (void)setResizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resizingDelegate, a3);
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
  objc_destroyWeak((id *)&self->_resizingDelegate);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end
