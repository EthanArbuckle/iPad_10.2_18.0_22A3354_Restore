@implementation HUFilterCategoryCellLayoutOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUFilterCategoryCellLayoutOptions;
  v4 = -[HUGridCellLayoutOptions copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[HUFilterCategoryCellLayoutOptions iconToTextPadding](self, "iconToTextPadding");
  objc_msgSend(v4, "setIconToTextPadding:");
  -[HUFilterCategoryCellLayoutOptions innerTopMargin](self, "innerTopMargin");
  objc_msgSend(v4, "setInnerTopMargin:");
  -[HUFilterCategoryCellLayoutOptions innerBottomMargin](self, "innerBottomMargin");
  objc_msgSend(v4, "setInnerBottomMargin:");
  -[HUFilterCategoryCellLayoutOptions innerLeadingMargin](self, "innerLeadingMargin");
  objc_msgSend(v4, "setInnerLeadingMargin:");
  -[HUFilterCategoryCellLayoutOptions innerTrailingMargin](self, "innerTrailingMargin");
  objc_msgSend(v4, "setInnerTrailingMargin:");
  -[HUFilterCategoryCellLayoutOptions primaryTextFont](self, "primaryTextFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrimaryTextFont:", v5);

  -[HUFilterCategoryCellLayoutOptions secondaryTextFont](self, "secondaryTextFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryTextFont:", v6);

  return v4;
}

- (double)innerTrailingMargin
{
  return self->_innerTrailingMargin;
}

- (double)innerLeadingMargin
{
  return self->_innerLeadingMargin;
}

- (double)iconToTextPadding
{
  return self->_iconToTextPadding;
}

- (double)cellHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[HUFilterCategoryCellLayoutOptions innerTopMargin](self, "innerTopMargin");
  v4 = v3;
  -[HUGridCellLayoutOptions iconSize](self, "iconSize");
  v6 = v5;
  -[HUFilterCategoryCellLayoutOptions primaryTextFont](self, "primaryTextFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  v9 = v8 + 2.0;
  -[HUFilterCategoryCellLayoutOptions secondaryTextFont](self, "secondaryTextFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineHeight");
  v12 = v9 + v11;

  if (v6 >= v12)
    v13 = v6;
  else
    v13 = v12;
  v14 = v4 + v13;
  -[HUFilterCategoryCellLayoutOptions innerBottomMargin](self, "innerBottomMargin");
  return v15 + v14;
}

- (UIFont)secondaryTextFont
{
  return self->_secondaryTextFont;
}

- (UIFont)primaryTextFont
{
  return self->_primaryTextFont;
}

- (double)innerTopMargin
{
  return self->_innerTopMargin;
}

- (double)innerBottomMargin
{
  return self->_innerBottomMargin;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HUFilterCategoryCellLayoutOptions;
  objc_msgSendSuper2(&v8, sel_defaultOptionsForCellSizeSubclass_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIconSize:", 24.0);
  objc_msgSend(v3, "setIconToTextPadding:", 6.0);
  objc_msgSend(v3, "setInnerTopMargin:", 5.0);
  objc_msgSend(v3, "setInnerBottomMargin:", 5.0);
  objc_msgSend(v3, "setInnerLeadingMargin:", 10.0);
  objc_msgSend(v3, "setInnerTrailingMargin:", 20.0);
  v4 = *MEMORY[0x1E0CEB558];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0CEB558], *MEMORY[0x1E0CEB5F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryTextFont:", v5);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryTextFont:", v6);

  return v3;
}

- (void)setSecondaryTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextFont, a3);
}

- (void)setPrimaryTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextFont, a3);
}

- (void)setInnerTrailingMargin:(double)a3
{
  self->_innerTrailingMargin = a3;
}

- (void)setInnerTopMargin:(double)a3
{
  self->_innerTopMargin = a3;
}

- (void)setInnerLeadingMargin:(double)a3
{
  self->_innerLeadingMargin = a3;
}

- (void)setInnerBottomMargin:(double)a3
{
  self->_innerBottomMargin = a3;
}

- (void)setIconToTextPadding:(double)a3
{
  self->_iconToTextPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextFont, 0);
  objc_storeStrong((id *)&self->_primaryTextFont, 0);
}

@end
