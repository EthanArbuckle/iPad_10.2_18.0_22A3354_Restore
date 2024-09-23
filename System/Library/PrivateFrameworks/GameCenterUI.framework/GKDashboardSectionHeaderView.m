@implementation GKDashboardSectionHeaderView

+ (double)defaultHeight
{
  return 31.0;
}

+ (double)widthForTitle:(id)a3 withFont:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  double result;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GKDashboardSectionHeaderView_widthForTitle_withFont___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v5 = widthForTitle_withFont__onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&widthForTitle_withFont__onceToken, block);
  objc_msgSend((id)widthForTitle_withFont__sSectionHeaderView, "setTitle:", v7);

  if (v6)
    v8 = (uint64_t)v6;
  else
    v8 = widthForTitle_withFont__sOriginalFont;
  objc_msgSend((id)widthForTitle_withFont__sSectionHeaderView, "setFont:", v8);

  objc_msgSend((id)widthForTitle_withFont__sSectionHeaderView, "intrinsicContentSize");
  return result;
}

void __55__GKDashboardSectionHeaderView_widthForTitle_withFont___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_gkViewFromNib");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)widthForTitle_withFont__sSectionHeaderView;
  widthForTitle_withFont__sSectionHeaderView = v1;

  objc_msgSend((id)widthForTitle_withFont__sSectionHeaderView, "font");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)widthForTitle_withFont__sOriginalFont;
  widthForTitle_withFont__sOriginalFont = v3;

}

+ (CGSize)platformSizeForTitle:(id)a3 withFont:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  objc_msgSend(a1, "defaultHeight", a3, a4);
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardSectionHeaderView;
  -[GKDashboardSectionHeaderView awakeFromNib](&v4, sel_awakeFromNib);
  -[UILabel textColor](self->_titleLabel, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardSectionHeaderView setTitleColor:](self, "setTitleColor:", v3);

}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setFont:(id)a3
{
  -[UILabel setFont:](self->_titleLabel, "setFont:", a3);
}

- (UIFont)font
{
  return -[UILabel font](self->_titleLabel, "font");
}

- (void)setOnDarkBackground:(BOOL)a3
{
  if (self->_onDarkBackground != a3)
    self->_onDarkBackground = a3;
}

- (CGSize)intrinsicContentSize
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
  double v12;
  CGSize result;

  -[GKDashboardSectionHeaderView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  -[NSLayoutConstraint constant](self->_leftMarginConstraint, "constant");
  v9 = v8;
  -[NSLayoutConstraint constant](self->_rightMarginConstraint, "constant");
  v11 = v5 + v9 + v10;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  self->_titleLabel = (UILabel *)a3;
}

- (NSLayoutConstraint)leftMarginConstraint
{
  return self->_leftMarginConstraint;
}

- (void)setLeftMarginConstraint:(id)a3
{
  self->_leftMarginConstraint = (NSLayoutConstraint *)a3;
}

- (BOOL)onDarkBackground
{
  return self->_onDarkBackground;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (NSLayoutConstraint)rightMarginConstraint
{
  return self->_rightMarginConstraint;
}

- (void)setRightMarginConstraint:(id)a3
{
  self->_rightMarginConstraint = (NSLayoutConstraint *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleColor, 0);
}

@end
