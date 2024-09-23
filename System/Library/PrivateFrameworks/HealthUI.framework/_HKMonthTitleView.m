@implementation _HKMonthTitleView

- (_HKMonthTitleView)initWithFrame:(CGRect)a3
{
  _HKMonthTitleView *v3;
  UILabel *v4;
  UILabel *monthTitle;
  UIView *v6;
  UIView *dividerLine;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_HKMonthTitleView;
  v3 = -[_HKMonthTitleView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    monthTitle = v3->_monthTitle;
    v3->_monthTitle = v4;

    -[UILabel setTextAlignment:](v3->_monthTitle, "setTextAlignment:", 1);
    -[_HKMonthTitleView addSubview:](v3, "addSubview:", v3->_monthTitle);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    dividerLine = v3->_dividerLine;
    v3->_dividerLine = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_dividerLine, "setBackgroundColor:", v8);

    -[_HKMonthTitleView addSubview:](v3, "addSubview:", v3->_dividerLine);
    -[_HKMonthTitleView _updateFont](v3, "_updateFont");
    -[_HKMonthTitleView setTopPadding:](v3, "setTopPadding:", 10.0);
    -[_HKMonthTitleView setBottomPadding:](v3, "setBottomPadding:", 7.0);
  }
  return v3;
}

- (void)_updateFont
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *MEMORY[0x1E0DC48D8];
  if (HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E0DC48D8]))
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4B60], v3, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B60], 32770, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 20.0);
  }
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](self->_monthTitle, "setFont:", v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[UILabel frame](self->_monthTitle, "frame", a3.width, a3.height);
  v5 = v4;
  -[UILabel frame](self->_monthTitle, "frame");
  v7 = v6;
  -[_HKMonthTitleView bottomPadding](self, "bottomPadding");
  v9 = v8 + v7;
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  double MaxY;
  void *v4;
  double v5;
  double v6;
  UIView *dividerLine;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)_HKMonthTitleView;
  -[_HKMonthTitleView layoutSubviews](&v11, sel_layoutSubviews);
  -[UILabel frame](self->_monthTitle, "frame");
  MaxY = CGRectGetMaxY(v12);
  -[UILabel font](self->_monthTitle, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descender");
  v6 = MaxY + v5 + 12.0;

  dividerLine = self->_dividerLine;
  -[_HKMonthTitleView dividerOriginX](self, "dividerOriginX");
  v9 = v8;
  -[_HKMonthTitleView dividerWidth](self, "dividerWidth");
  -[UIView setFrame:](dividerLine, "setFrame:", v9, v6, v10, HKUIOnePixel());
}

- (id)_monthStringFromDate:(id)a3
{
  return HKLocalizedStringForDateAndTemplate(a3, 2);
}

- (void)setDate:(id)a3
{
  UILabel *monthTitle;
  void *v5;
  double Height;
  double v7;
  void *v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;

  monthTitle = self->_monthTitle;
  -[_HKMonthTitleView _monthStringFromDate:](self, "_monthStringFromDate:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](monthTitle, "setText:", v5);

  -[UILabel sizeToFit](self->_monthTitle, "sizeToFit");
  -[UILabel frame](self->_monthTitle, "frame");
  Height = CGRectGetHeight(v11);
  -[UILabel frame](self->_monthTitle, "frame");
  v7 = Height - CGRectGetMaxY(v12);
  -[UILabel font](self->_monthTitle, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descender");
  v10 = v7 + v9 + 12.0;

  -[UILabel setDirectionalLayoutMargins:](self->_monthTitle, "setDirectionalLayoutMargins:", 0.0, 0.0, v10, 0.0);
}

- (void)setHighlighted:(BOOL)a3
{
  void *v4;
  id v5;

  self->_highlighted = a3;
  if (a3)
    HKHealthKeyColor();
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKMonthTitleView monthTitle](self, "monthTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKMonthTitleView;
  -[_HKMonthTitleView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[_HKMonthTitleView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[_HKMonthTitleView _updateFont](self, "_updateFont");
      -[_HKMonthTitleView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (UILabel)monthTitle
{
  return self->_monthTitle;
}

- (void)setMonthTitle:(id)a3
{
  objc_storeStrong((id *)&self->_monthTitle, a3);
}

- (double)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (double)dividerOriginX
{
  return self->_dividerOriginX;
}

- (void)setDividerOriginX:(double)a3
{
  self->_dividerOriginX = a3;
}

- (double)dividerWidth
{
  return self->_dividerWidth;
}

- (void)setDividerWidth:(double)a3
{
  self->_dividerWidth = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthTitle, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
}

@end
