@implementation HUSwitchControlView

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HUSwitchControlView)initWithFrame:(CGRect)a3
{
  HUSwitchControlView *v3;
  UISwitch *v4;
  UISwitch *switchView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUSwitchControlView;
  v3 = -[HUSwitchControlView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0CEAA38]);
    switchView = v3->_switchView;
    v3->_switchView = v4;

    -[UISwitch sizeToFit](v3->_switchView, "sizeToFit");
    -[UISwitch addTarget:action:forControlEvents:](v3->_switchView, "addTarget:action:forControlEvents:", v3, sel__switchValueChanged_, 4096);
    -[HUSwitchControlView addSubview:](v3, "addSubview:", v3->_switchView);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUSwitchControlView switchView](self, "switchView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUSwitchControlView switchView](self, "switchView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)value
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[HUSwitchControlView switchView](self, "switchView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isOn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setValue:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[HUSwitchControlView switchView](self, "switchView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v6, "setOn:animated:", v5, objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"));
}

- (BOOL)isDisabled
{
  void *v2;
  char v3;

  -[HUSwitchControlView switchView](self, "switchView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled") ^ 1;

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[HUSwitchControlView switchView](self, "switchView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_switchValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUSwitchControlView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlViewDidBeginUserInteraction:", self);

  -[HUSwitchControlView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSwitchControlView value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlView:valueDidChange:", self, v6);

  -[HUSwitchControlView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlViewDidEndUserInteraction:", self);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (HUControlViewDelegate)delegate
{
  return (HUControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISwitch)switchView
{
  return self->_switchView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
