@implementation HUAddPeopleTableHeaderFooterView

- (HUAddPeopleTableHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  HUAddPeopleTableHeaderFooterView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUAddPeopleTableHeaderFooterView;
  v3 = -[HUAddPeopleTableHeaderFooterView initWithReuseIdentifier:](&v15, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUAddPeopleTableHeaderFooterView setBackgroundView:](v3, "setBackgroundView:", v5);

    -[HUAddPeopleTableHeaderFooterView backgroundView](v3, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleTableHeaderFooterView topBorder](v3, "topBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[HUAddPeopleTableHeaderFooterView backgroundView](v3, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleTableHeaderFooterView bottomBorder](v3, "bottomBorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[HUAddPeopleTableHeaderFooterView bottomBorder](v3, "bottomBorder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPeopleTableHeaderFooterView setBackgroundColor:](v3, "setBackgroundColor:", v11);

    -[HUAddPeopleTableHeaderFooterView textLabel](v3, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v13);

    -[HUAddPeopleTableHeaderFooterView setNeedsBottomBorder:](v3, "setNeedsBottomBorder:", 1);
  }
  return v3;
}

+ (id)identifier
{
  return CFSTR("HUAddPeopleTableHeaderFooterViewIdentifier");
}

+ (double)preferredHeight
{
  return 25.0;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HUAddPeopleTableHeaderFooterView;
  -[HUAddPeopleTableHeaderFooterView layoutSubviews](&v23, sel_layoutSubviews);
  if (self->_bottomBorder)
  {
    -[HUAddPeopleTableHeaderFooterView bounds](self, "bounds");
    if (v3 >= 1024.0)
      v4 = v3;
    else
      v4 = 1024.0;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = 1.0 / v6;

    -[UIView setFrame:](self->_bottomBorder, "setFrame:", 0.0, 0.0, v4, v7);
  }
  if (self->_topBorder)
  {
    -[HUAddPeopleTableHeaderFooterView bounds](self, "bounds");
    if (v8 >= 1024.0)
      v9 = v8;
    else
      v9 = 1024.0;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v12 = 1.0 / v11;

    -[UIView setFrame:](self->_topBorder, "setFrame:", 0.0, 0.0, v9, v12);
  }
  -[HUAddPeopleTableHeaderFooterView bottomBorder](self, "bottomBorder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[HUAddPeopleTableHeaderFooterView frame](self, "frame");
  v21 = v20 - v19;
  -[HUAddPeopleTableHeaderFooterView bottomBorder](self, "bottomBorder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v21, v17, v19);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAddPeopleTableHeaderFooterView;
  v4 = a3;
  -[HUAddPeopleTableHeaderFooterView setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[HUAddPeopleTableHeaderFooterView backgroundView](self, "backgroundView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setNeedsTopBorder:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  self->_needsTopBorder = a3;
  -[HUAddPeopleTableHeaderFooterView topBorder](self, "topBorder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", !v3);

}

- (void)setNeedsBottomBorder:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  self->_needsBottomBorder = a3;
  -[HUAddPeopleTableHeaderFooterView bottomBorder](self, "bottomBorder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", !v3);

}

- (UIView)topBorder
{
  UIView *topBorder;
  UIView *v4;
  void *v5;
  UIView *v6;

  topBorder = self->_topBorder;
  if (!topBorder)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.784313738, 0.78039217, 0.800000012, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = self->_topBorder;
    self->_topBorder = v4;

    topBorder = self->_topBorder;
  }
  return topBorder;
}

- (UIView)bottomBorder
{
  UIView *bottomBorder;
  UIView *v4;
  void *v5;
  UIView *v6;

  bottomBorder = self->_bottomBorder;
  if (!bottomBorder)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.784313738, 0.78039217, 0.800000012, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = self->_bottomBorder;
    self->_bottomBorder = v4;

    bottomBorder = self->_bottomBorder;
  }
  return bottomBorder;
}

- (BOOL)needsTopBorder
{
  return self->_needsTopBorder;
}

- (BOOL)needsBottomBorder
{
  return self->_needsBottomBorder;
}

- (void)setTopBorder:(id)a3
{
  objc_storeStrong((id *)&self->_topBorder, a3);
}

- (void)setBottomBorder:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBorder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
}

@end
