@implementation CNFRegNavigationBarTitleView

- (CNFRegNavigationBarTitleView)initWithNavigationItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CNFRegNavigationBarTitleView *v9;
  CNFRegNavigationBarTitleView *v10;
  uint64_t v11;
  UILabel *titleLabel;
  void *v13;

  v4 = a3;
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = -[CNFRegNavigationBarTitleView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[CNFRegNavigationBarTitleView setItem:](v9, "setItem:", v4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = (UILabel *)v11;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v10->_titleLabel, "setBackgroundColor:", v13);

    -[UILabel setOpaque:](v10->_titleLabel, "setOpaque:", 0);
    -[CNFRegNavigationBarTitleView _updateTitleLabel](v10, "_updateTitleLabel");
    -[CNFRegNavigationBarTitleView addSubview:](v10, "addSubview:", v10->_titleLabel);
  }

  return v10;
}

- (CNFRegNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  CNFRegNavigationBarTitleView *v3;
  CNFRegNavigationBarTitleView *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  UIActivityIndicatorView *activityIndicator;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNFRegNavigationBarTitleView;
  v3 = -[CNFRegNavigationBarTitleView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CNFRegNavigationBarTitleView setOpaque:](v3, "setOpaque:", 0);
    -[CNFRegNavigationBarTitleView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "navigationBarActivityIndicatorStyle");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", v6);
    activityIndicator = v4->_activityIndicator;
    v4->_activityIndicator = (UIActivityIndicatorView *)v7;

    -[UIActivityIndicatorView startAnimating](v4->_activityIndicator, "startAnimating");
    -[CNFRegNavigationBarTitleView addSubview:](v4, "addSubview:", v4->_activityIndicator);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView removeFromSuperview](self->_activityIndicator, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)CNFRegNavigationBarTitleView;
  -[CNFRegNavigationBarTitleView dealloc](&v3, sel_dealloc);
}

- (id)_titleTextColorForBarStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_defaultFont
{
  void *v2;
  void *v3;
  void *v4;

  -[CNFRegNavigationBarTitleView item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_defaultTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_useSilverLookForBarStyle:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  -[CNFRegNavigationBarTitleView item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "barTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 == 1 && v9 == 0 && a3 == 0;
}

- (id)_currentTextColorForBarStyle:(int64_t)a3
{
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = -[CNFRegNavigationBarTitleView _useSilverLookForBarStyle:](self, "_useSilverLookForBarStyle:");
  if (v5 && !_currentTextColorForBarStyle____silverLookTextColor)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD4B8]), "initWithRed:green:blue:alpha:", 0.443137258, 0.470588237, 0.501960814, 1.0);
    v7 = (void *)_currentTextColorForBarStyle____silverLookTextColor;
    _currentTextColorForBarStyle____silverLookTextColor = v6;

  }
  if (v5)
  {
    v8 = (id)_currentTextColorForBarStyle____silverLookTextColor;
  }
  else
  {
    -[CNFRegNavigationBarTitleView _titleTextColorForBarStyle:](self, "_titleTextColorForBarStyle:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)_currentTextShadowColorForBarStyle:(int64_t)a3
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v4 = -[CNFRegNavigationBarTitleView _useSilverLookForBarStyle:](self, "_useSilverLookForBarStyle:", a3);
  if (v4 && !_currentTextShadowColorForBarStyle____silverLookShadowColor)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD4B8]), "initWithWhite:alpha:", 1.0, 0.5);
    v6 = (void *)_currentTextShadowColorForBarStyle____silverLookShadowColor;
    _currentTextShadowColorForBarStyle____silverLookShadowColor = v5;

  }
  if (v4)
  {
    v7 = (id)_currentTextShadowColorForBarStyle____silverLookShadowColor;
  }
  else
  {
    -[UINavigationItem navigationBar](self->_item, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buttonItemShadowColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (CGSize)_currentTextShadowOffsetForBarStyle:(int64_t)a3
{
  _BOOL4 v3;
  double v4;
  double v5;
  CGSize result;

  v3 = -[CNFRegNavigationBarTitleView _useSilverLookForBarStyle:](self, "_useSilverLookForBarStyle:", a3);
  v4 = 1.0;
  if (!v3)
    v4 = -1.0;
  v5 = 0.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNFRegNavigationBarTitleView frame](self, "frame");
  if (v9 != width || v8 != height)
    -[CNFRegNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
  v11.receiver = self;
  v11.super_class = (Class)CNFRegNavigationBarTitleView;
  -[CNFRegNavigationBarTitleView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)_updateTitleLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  -[CNFRegNavigationBarTitleView item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "barStyle");

  -[CNFRegNavigationBarTitleView _defaultFont](self, "_defaultFont");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setBaselineAdjustment:](self->_titleLabel, "setBaselineAdjustment:", 1);
  -[CNFRegNavigationBarTitleView item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v7);

  -[UILabel setFont:](self->_titleLabel, "setFont:", v12);
  -[CNFRegNavigationBarTitleView _currentTextColorForBarStyle:](self, "_currentTextColorForBarStyle:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v8);

  -[CNFRegNavigationBarTitleView _currentTextShadowOffsetForBarStyle:](self, "_currentTextShadowOffsetForBarStyle:", v5);
  -[UILabel setShadowOffset:](self->_titleLabel, "setShadowOffset:");
  -[CNFRegNavigationBarTitleView _currentTextShadowColorForBarStyle:](self, "_currentTextShadowColorForBarStyle:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setShadowColor:](self->_titleLabel, "setShadowColor:", v9);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  objc_msgSend(v12, "pointSize");
  if (v10 != 0.0)
  {
    objc_msgSend(v12, "pointSize");
    -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", 12.0 / v11);
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MidY;
  CGFloat v18;
  CGFloat v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[CNFRegNavigationBarTitleView _updateTitleLabel](self, "_updateTitleLabel");
  -[CNFRegNavigationBarTitleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIActivityIndicatorView bounds](self->_activityIndicator, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  MidY = CGRectGetMidY(v20);
  v21.origin.x = 0.0;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  v18 = floor(MidY + CGRectGetHeight(v21) * -0.5);
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", 0.0, v18, v14, v16);
  v22.origin.x = 0.0;
  v22.origin.y = v18;
  v22.size.width = v14;
  v22.size.height = v16;
  v19 = CGRectGetMaxX(v22) + 7.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v19, v6, v8 - v19, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[2];
  _QWORD v26[3];
  CGSize result;

  v26[2] = *MEMORY[0x24BDAC8D0];
  -[CNFRegNavigationBarTitleView _updateTitleLabel](self, "_updateTitleLabel", a3.width, a3.height);
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel font](self->_titleLabel, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setLineBreakMode:", 4);
  v8 = *MEMORY[0x24BEBB3A8];
  v25[0] = *MEMORY[0x24BEBB360];
  v25[1] = v8;
  v26[0] = v5;
  v26[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BEBB4A8]);
  -[UILabel minimumScaleFactor](self->_titleLabel, "minimumScaleFactor");
  objc_msgSend(v10, "setMinimumScaleFactor:");
  if (objc_msgSend(v4, "length"))
  {
    -[CNFRegNavigationBarTitleView item](self, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v9, v10, v13, v14);
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v16 = *MEMORY[0x24BDBF148];
    v18 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  -[UIActivityIndicatorView bounds](self->_activityIndicator, "bounds");
  v20 = v19;
  -[UIActivityIndicatorView bounds](self->_activityIndicator, "bounds");
  v22 = v21;

  v23 = v16 + 7.0 + v20;
  v24 = fmax(v18 + 1.0 + 2.0, v22);
  result.height = v24;
  result.width = v23;
  return result;
}

- (UINavigationItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  self->_item = (UINavigationItem *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
