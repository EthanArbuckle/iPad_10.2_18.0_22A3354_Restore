@implementation SFUnreadIndicator

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 10.0;
  v3 = 10.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFUnreadIndicator;
  -[SFUnreadIndicator tintColorDidChange](&v4, sel_tintColorDidChange);
  -[SFUnreadIndicator tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_indicator, "setBackgroundColor:", v3);

}

- (SFUnreadIndicator)initWithFrame:(CGRect)a3
{
  SFUnreadIndicator *v3;
  SFUnreadIndicator *v4;
  UIView *v5;
  UIView *indicator;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SFUnreadIndicator *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)SFUnreadIndicator;
  v3 = -[SFUnreadIndicator initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFUnreadIndicator setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    indicator = v4->_indicator;
    v4->_indicator = v5;

    -[UIView _setCornerRadius:](v4->_indicator, "_setCornerRadius:", 5.0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_indicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFUnreadIndicator addSubview:](v4, "addSubview:", v4->_indicator);
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[UIView centerXAnchor](v4->_indicator, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnreadIndicator centerXAnchor](v4, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v7;
    -[UIView centerYAnchor](v4->_indicator, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnreadIndicator centerYAnchor](v4, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    -[UIView widthAnchor](v4->_indicator, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", 10.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v12;
    -[UIView heightAnchor](v4->_indicator, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 10.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v15);

    v16 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicator, 0);
}

@end
