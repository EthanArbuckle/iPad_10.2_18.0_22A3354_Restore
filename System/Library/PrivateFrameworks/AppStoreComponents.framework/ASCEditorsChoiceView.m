@implementation ASCEditorsChoiceView

+ (id)leftLaurel
{
  return +[ASCImageRenderer bundleImageNamed:compatibleWithTraitCollection:](ASCImageRenderer, "bundleImageNamed:compatibleWithTraitCollection:", CFSTR("LaurelLeftSmall"), 0);
}

+ (id)rightLaurel
{
  return +[ASCImageRenderer bundleImageNamed:compatibleWithTraitCollection:](ASCImageRenderer, "bundleImageNamed:compatibleWithTraitCollection:", CFSTR("LaurelRightSmall"), 0);
}

+ (id)editorsChoiceText
{
  return (id)ASCLocalizedString(CFSTR("EDITORS_CHOICE_TEXT"), a2);
}

+ (double)laurelPadding
{
  return 4.0;
}

+ (id)editorsChoiceFont
{
  if (editorsChoiceFont_onceToken != -1)
    dispatch_once(&editorsChoiceFont_onceToken, &__block_literal_global_7);
  return (id)editorsChoiceFont_editorsChoiceFont;
}

void __41__ASCEditorsChoiceView_editorsChoiceFont__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC4B90]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)editorsChoiceFont_editorsChoiceFont;
  editorsChoiceFont_editorsChoiceFont = v0;

}

- (ASCEditorsChoiceView)initWithFrame:(CGRect)a3
{
  ASCEditorsChoiceView *v3;
  ASCEditorsChoiceView *v4;
  void *v5;
  UILabel *v6;
  UILabel *titleLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ASCEditorsChoiceView;
  v3 = -[ASCEditorsChoiceView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ASCEditorsChoiceView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCEditorsChoiceView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[ASCEditorsChoiceView setContentMode:](v4, "setContentMode:", 3);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    v8 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    v10 = v4->_titleLabel;
    +[ASCEditorsChoiceView editorsChoiceText](ASCEditorsChoiceView, "editorsChoiceText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10, "setText:", v11);

    v12 = v4->_titleLabel;
    +[ASCEditorsChoiceView editorsChoiceFont](ASCEditorsChoiceView, "editorsChoiceFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[ASCEditorsChoiceView addSubview:](v4, "addSubview:", v4->_titleLabel);
  }
  return v4;
}

- (ASCEditorsChoiceView)initWithCoder:(id)a3
{
  -[ASCEditorsChoiceView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCEditorsChoiceView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  +[ASCEditorsChoiceView leftLaurel](ASCEditorsChoiceView, "leftLaurel", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCEditorsChoiceView rightLaurel](ASCEditorsChoiceView, "rightLaurel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCEditorsChoiceView laurelPadding](ASCEditorsChoiceView, "laurelPadding");
  v7 = v6;
  objc_msgSend(v4, "size");
  v9 = v8;
  objc_msgSend(v5, "size");
  v11 = v9 + v7 * 2.0 + v10;
  -[UILabel intrinsicContentSize](self->_titleLabel, "intrinsicContentSize");
  v13 = v11 + v12;
  objc_msgSend(v4, "size");
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
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UILabel *titleLabel;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ASCEditorsChoiceView;
  -[ASCEditorsChoiceView layoutSubviews](&v20, sel_layoutSubviews);
  +[ASCEditorsChoiceView leftLaurel](ASCEditorsChoiceView, "leftLaurel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCEditorsChoiceView rightLaurel](ASCEditorsChoiceView, "rightLaurel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCEditorsChoiceView laurelPadding](ASCEditorsChoiceView, "laurelPadding");
  v6 = v5;
  -[ASCEditorsChoiceView bounds](self, "bounds");
  v8 = v7;
  objc_msgSend(v3, "size");
  v10 = v9 + v6 * 2.0;
  objc_msgSend(v4, "size");
  v12 = v8 - (v10 + v11);
  titleLabel = self->_titleLabel;
  -[ASCEditorsChoiceView bounds](self, "bounds");
  -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v12, v14);
  v16 = v15;
  objc_msgSend(v3, "size");
  v18 = v6 + v17;
  -[ASCEditorsChoiceView bounds](self, "bounds");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v18, v19 * 0.5 - v16 * 0.5, v12, v16);

}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MinX;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[ASCEditorsChoiceView leftLaurel](ASCEditorsChoiceView, "leftLaurel");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "size");
  v8 = v7;
  objc_msgSend(v22, "size");
  v10 = v8 * v9;
  objc_msgSend(v22, "size");
  v12 = v10 / v11;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MinX = CGRectGetMinX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  objc_msgSend(v22, "drawInRect:", MinX, CGRectGetMidY(v24) - v8 * 0.5, v12, v8);
  +[ASCEditorsChoiceView rightLaurel](ASCEditorsChoiceView, "rightLaurel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v16 = v15;
  objc_msgSend(v14, "size");
  v18 = v16 * v17;
  objc_msgSend(v14, "size");
  v20 = v18 / v19;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v21 = CGRectGetMaxX(v25) - v20;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  objc_msgSend(v14, "drawInRect:", v21, CGRectGetMidY(v26) - v16 * 0.5, v20, v16);

}

- (id)accessibilityLabel
{
  return (id)ASCLocalizedString(CFSTR("AX_EDITORS_CHOICE_TEXT"), a2);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
