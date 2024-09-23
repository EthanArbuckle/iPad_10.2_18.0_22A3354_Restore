@implementation CSProminentTextElementView

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (CSProminentTitleLabelDefining)textLabel
{
  return self->_textLabel;
}

- (CSProminentTextElementView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5
{
  id v9;
  id v10;
  id v11;
  double x;
  double y;
  double width;
  double height;
  CSProminentTextElementView *v16;
  CSProminentTextElementView *v17;
  NSString *overrideString;
  id v19;
  void *v20;
  CSProminentTitleLabelDefining *textLabel;
  id v22;
  void *v23;
  objc_super v25;
  CGRect v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[CSProminentLayoutController frameForElements:](CSProminentLayoutController, "frameForElements:", objc_msgSend((id)objc_opt_class(), "elementType"));
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  if (CGRectIsNull(v26))
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v25.receiver = self;
  v25.super_class = (Class)CSProminentTextElementView;
  v16 = -[CSProminentTextElementView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_date, a3);
    overrideString = v17->_overrideString;
    v17->_overrideString = 0;

    objc_storeStrong((id *)&v17->_primaryFont, a4);
    objc_storeStrong((id *)&v17->_primaryTextColor, a5);
    v19 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "textLabelClass"));
    -[CSProminentTextElementView bounds](v17, "bounds");
    v20 = (void *)objc_msgSend(v19, "initWithFrame:");
    objc_msgSend(v20, "setTextAlignment:", 1);
    objc_msgSend(v20, "setTextColor:", v11);
    objc_msgSend(v20, "setFont:", v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v20, "setClipsToBounds:", 0);
    textLabel = v17->_textLabel;
    v17->_textLabel = (CSProminentTitleLabelDefining *)v20;
    v22 = v20;

    -[CSProminentTitleLabelDefining view](v17->_textLabel, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSProminentTextElementView addSubview:](v17, "addSubview:", v23);
  }

  return v17;
}

+ (unint64_t)elementType
{
  return 0;
}

+ (Class)textLabelClass
{
  if (_os_feature_enabled_impl())
    objc_msgSend((id)objc_opt_class(), "elementType");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)displayString
{
  return self->_overrideString;
}

- (void)setPrimaryFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryFont, a3);
    -[CSProminentTitleLabelDefining setFont:](self->_textLabel, "setFont:", v5);
    -[CSProminentTextElementView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPrimaryTextColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_primaryTextColor, a3);
  v5 = a3;
  -[CSProminentTitleLabelDefining setTextColor:](self->_textLabel, "setTextColor:", v5);

}

- (void)setOverrideString:(id)a3
{
  NSString **p_overrideString;
  id v6;

  p_overrideString = &self->_overrideString;
  v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideString, a3);
    -[CSProminentTitleLabelDefining setText:](self->_textLabel, "setText:", *p_overrideString);
    -[CSProminentTextElementView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CSProminentTextElementView;
  -[CSProminentTextElementView layoutSubviews](&v20, sel_layoutSubviews);
  -[CSProminentTextElementView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CSProminentTitleLabelDefining view](self->_textLabel, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", v4, v6);
  v9 = v8;
  v11 = v10;

  -[CSProminentTextElementView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");

  v13 = -[CSProminentTitleLabelDefining textAlignment](self->_textLabel, "textAlignment");
  if (v9 <= v4)
    v14 = v9;
  else
    v14 = v4;
  if (v13 == 1)
    v4 = v14;
  BSPointRoundForScale();
  v16 = v15;
  v18 = v17;
  -[CSProminentTitleLabelDefining view](self->_textLabel, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v16, v18, v4, v11);

}

- (NSString)overrideString
{
  return self->_overrideString;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_overrideString, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
