@implementation AKMarkupButtonContainerView

- (AKMarkupButtonContainerView)initWithFrame:(CGRect)a3
{
  AKMarkupButtonContainerView *v3;
  uint64_t v4;
  UIButton *button;
  UIButton *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKMarkupButtonContainerView;
  v3 = -[AKMarkupButtonContainerView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[UIButton setClipsToBounds:](v3->_button, "setClipsToBounds:", 1);
    v6 = v3->_button;
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("pencil.tip.crop.circle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v6, "setImage:forState:", v7, 0);

    -[AKMarkupButtonContainerView addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  CGFloat v12;
  void *v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v15.receiver = self;
  v15.super_class = (Class)AKMarkupButtonContainerView;
  -[AKMarkupButtonContainerView layoutSubviews](&v15, sel_layoutSubviews);
  -[AKMarkupButtonContainerView intrinsicContentSize](self, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[AKMarkupButtonContainerView button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  -[AKMarkupButtonContainerView bounds](self, "bounds");
  v8 = CGRectGetWidth(v16) * 0.5;
  -[AKMarkupButtonContainerView bounds](self, "bounds");
  v9 = CGRectGetHeight(v17) * 0.5;
  -[AKMarkupButtonContainerView button](self, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCenter:", v8, v9);

  -[AKMarkupButtonContainerView button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = CGRectGetWidth(v18) * 0.5;
  -[AKMarkupButtonContainerView button](self, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v12);

}

- (void)updateForMiniBarState:(BOOL)a3
{
  -[AKMarkupButtonContainerView setNeedsLayout](self, "setNeedsLayout", a3);
  -[AKMarkupButtonContainerView layoutIfNeeded](self, "layoutIfNeeded");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  MEMORY[0x24BEDD108](self, sel__buttonSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  MEMORY[0x24BEDD108](self, sel__buttonSize);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  self->_selected = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[AKMarkupButtonContainerView button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v3);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (CGSize)_buttonSize
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  -[AKMarkupButtonContainerView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass");

  v4 = 28.0;
  if (v3 == 1)
    v4 = 27.0;
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (BOOL)selected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
