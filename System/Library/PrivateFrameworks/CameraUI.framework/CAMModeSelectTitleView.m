@implementation CAMModeSelectTitleView

- (CAMModeSelectTitleView)initWithFrame:(CGRect)a3
{
  CAMModeSelectTitleView *v3;
  uint64_t v4;
  UIColor *textColor;
  id v6;
  uint64_t v7;
  UILabel *titleLabel;
  void *v9;
  void *v10;
  CAMModeSelectTitleView *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMModeSelectTitleView;
  v3 = -[CAMModeSelectTitleView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v4;

    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v3->__titleLabel;
    v3->__titleLabel = (UILabel *)v7;

    -[UILabel setTextAlignment:](v3->__titleLabel, "setTextAlignment:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->__titleLabel, "setTextColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 72.0, *MEMORY[0x1E0DC1420]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->__titleLabel, "setFont:", v10);

    -[CAMModeSelectTitleView addSubview:](v3, "addSubview:", v3->__titleLabel);
    v11 = v3;
  }

  return v3;
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->__titleLabel, "setText:", a3);
}

- (NSString)text
{
  return -[UILabel text](self->__titleLabel, "text");
}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  UILabel *titleLabel;
  _QWORD v7[5];

  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    titleLabel = self->__titleLabel;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__CAMModeSelectTitleView_setTextColor___block_invoke;
    v7[3] = &unk_1EA328868;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", titleLabel, 5242880, v7, 0, 0.3);
  }

}

void __39__CAMModeSelectTitleView_setTextColor___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[52];
  objc_msgSend(v1, "_titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v2);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMModeSelectTitleView;
  -[CAMModeSelectTitleView layoutSubviews](&v12, sel_layoutSubviews);
  -[CAMModeSelectTitleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMModeSelectTitleView _titleLabel](self, "_titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
