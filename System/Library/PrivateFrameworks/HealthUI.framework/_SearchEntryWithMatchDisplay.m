@implementation _SearchEntryWithMatchDisplay

- (id)_createMatchDisplayLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setOpaque:", 0);
  objc_msgSend(v4, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

  -[_SearchEntryWithMatchDisplay searchField](self, "searchField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v7);

  return v4;
}

- (_SearchEntryWithMatchDisplay)initWithFrame:(CGRect)a3
{
  _SearchEntryWithMatchDisplay *v3;
  _SearchEntryWithMatchDisplay *v4;
  uint64_t v5;
  UILabel *matchDisplayLabel;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SearchEntryWithMatchDisplay;
  v3 = -[_SearchEntryWithMatchDisplay initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_SearchEntryWithMatchDisplay _createMatchDisplayLabel](v3, "_createMatchDisplayLabel");
    v5 = objc_claimAutoreleasedReturnValue();
    matchDisplayLabel = v4->_matchDisplayLabel;
    v4->_matchDisplayLabel = (UILabel *)v5;

    -[_SearchEntryWithMatchDisplay addSubview:](v4, "addSubview:", v4->_matchDisplayLabel);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SearchEntryWithMatchDisplay setBackgroundColor:](v4, "setBackgroundColor:", v7);

  }
  return v4;
}

- (void)matchDisplayVisible:(BOOL)a3
{
  -[UILabel setHidden:](self->_matchDisplayLabel, "setHidden:", !a3);
}

- (void)setMatchDisplayString:(id)a3
{
  -[UILabel setText:](self->_matchDisplayLabel, "setText:", a3);
  -[_SearchEntryWithMatchDisplay setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *matchDisplayLabel;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SearchEntryWithMatchDisplay;
  -[_SearchEntryWithMatchDisplay layoutSubviews](&v10, sel_layoutSubviews);
  -[_SearchEntryWithMatchDisplay bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UILabel sizeThatFits:](self->_matchDisplayLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  matchDisplayLabel = self->_matchDisplayLabel;
  HKUIRectIntegralToScreenScale(v4 + -40.0 - v7, (v6 - v8) * 0.5, v7, v8);
  -[UILabel setFrame:](matchDisplayLabel, "setFrame:");
}

- (NSString)matchDisplayString
{
  return self->_matchDisplayString;
}

- (UILabel)matchDisplayLabel
{
  return (UILabel *)objc_getProperty(self, a2, 512, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchDisplayLabel, 0);
  objc_storeStrong((id *)&self->_matchDisplayString, 0);
}

@end
