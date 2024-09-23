@implementation CNSharedProfileBannerCell

- (CNSharedProfileBannerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNSharedProfileBannerCell *v4;
  CNSharedProfileBannerCell *v5;
  CNSharedProfileBannerCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNSharedProfileBannerCell;
  v4 = -[CNContactCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNSharedProfileBannerCell setUpView](v4, "setUpView");
    v6 = v5;
  }

  return v5;
}

- (void)setUpView
{
  void *v3;
  id v4;

  -[CNSharedProfileBannerCell contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerCell sharedProfileBannerContentView](self, "sharedProfileBannerContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

}

- (CNSharedProfileBannerView)sharedProfileBannerContentView
{
  CNSharedProfileBannerView *sharedProfileBannerContentView;
  CNSharedProfileBannerView *v4;
  CNSharedProfileBannerView *v5;
  void *v6;

  sharedProfileBannerContentView = self->_sharedProfileBannerContentView;
  if (!sharedProfileBannerContentView)
  {
    v4 = objc_alloc_init(CNSharedProfileBannerView);
    v5 = self->_sharedProfileBannerContentView;
    self->_sharedProfileBannerContentView = v4;

    -[CNSharedProfileBannerView setTranslatesAutoresizingMaskIntoConstraints:](self->_sharedProfileBannerContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNSharedProfileBannerCell delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView setDelegate:](self->_sharedProfileBannerContentView, "setDelegate:", v6);

    sharedProfileBannerContentView = self->_sharedProfileBannerContentView;
  }
  return sharedProfileBannerContentView;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CNSharedProfileBannerView setDelegate:](self->_sharedProfileBannerContentView, "setDelegate:", obj);
  }

}

- (void)setLabelTextAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerCell sharedProfileBannerContentView](self, "sharedProfileBannerContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTitleFont:", v7);
  objc_msgSend(v5, "setSubtitleFont:", v7);
  -[CNSharedProfileBannerCell sharedProfileBannerContentView](self, "sharedProfileBannerContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStyle:", v5);

}

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
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
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  -[CNSharedProfileBannerCell sharedProfileBannerContentView](self, "sharedProfileBannerContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return MEMORY[0x1E0C9AA60];
  -[CNSharedProfileBannerCell sharedProfileBannerContentView](self, "sharedProfileBannerContentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  -[CNSharedProfileBannerCell sharedProfileBannerContentView](self, "sharedProfileBannerContentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutMarginsGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v16;
  -[CNSharedProfileBannerCell sharedProfileBannerContentView](self, "sharedProfileBannerContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v7;
  -[CNSharedProfileBannerCell sharedProfileBannerContentView](self, "sharedProfileBannerContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNSharedProfileBannerCell;
  -[CNContactCell updateConstraints](&v4, sel_updateConstraints);
  -[CNSharedProfileBannerCell sharedProfileBannerContentView](self, "sharedProfileBannerContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateConstraints");

}

- (double)minCellHeight
{
  return 60.0;
}

- (void)setUpWithSharedProfileStateOracle:(id)a3 tappedAction:(unint64_t)a4 hasPerformedAnimation:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a3;
  -[CNSharedProfileBannerCell sharedProfileBannerContentView](self, "sharedProfileBannerContentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUpWithSharedProfileStateOracle:tappedAction:hasPerformedAnimation:", v8, a4, v5);

}

- (CNSharedProfileBannerViewDelegate)delegate
{
  return (CNSharedProfileBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSharedProfileBannerContentView:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileBannerContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileBannerContentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
