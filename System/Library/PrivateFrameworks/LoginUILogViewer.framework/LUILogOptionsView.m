@implementation LUILogOptionsView

- (LUILogOptionsView)initWithFrame:(CGRect)a3
{
  LUILogOptionsView *v3;
  LUILogOptionsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUILogOptionsView;
  v3 = -[LUILogOptionsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUILogOptionsView _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  UIStackView *v3;
  UIStackView *buttonStackView;

  -[LUILogOptionsView _createButtonStackView](self, "_createButtonStackView");
  v3 = (UIStackView *)objc_claimAutoreleasedReturnValue();
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v3;

  -[LUILogOptionsView addSubview:](self, "addSubview:", self->_buttonStackView);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)LUILogOptionsView;
  -[LUILogOptionsView layoutSubviews](&v14, sel_layoutSubviews);
  -[LUILogOptionsView buttonStackView](self, "buttonStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", 200.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  -[LUILogOptionsView buttonStackView](self, "buttonStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogOptionsView frame](self, "frame");
  objc_msgSend(v7, "constraintEqualToConstant:", CGRectGetHeight(v15) + -100.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[LUILogOptionsView center](self, "center");
  v10 = v9;
  v12 = v11;
  -[LUILogOptionsView buttonStackView](self, "buttonStackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCenter:", v10, v12);

}

- (id)_createButtonStackView
{
  UIButton *v3;
  UIButton *tenMinutesLogButton;
  UIButton *v5;
  UIButton *halfHourButton;
  UIButton *v7;
  UIButton *hourButton;
  UIButton *v9;
  UIButton *lastDayButton;
  UIButton *v11;
  UIButton *streamButton;
  id v13;
  UIButton *v14;
  UIButton *v15;
  void *v16;
  void *v17;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x24BDAC8D0];
  -[LUILogOptionsView _createButtonWithTitle:](self, "_createButtonWithTitle:", CFSTR("Last 10 minutes' log"));
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  tenMinutesLogButton = self->_tenMinutesLogButton;
  self->_tenMinutesLogButton = v3;

  -[LUILogOptionsView _createButtonWithTitle:](self, "_createButtonWithTitle:", CFSTR("Last 30 minutes' log"));
  v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
  halfHourButton = self->_halfHourButton;
  self->_halfHourButton = v5;

  -[LUILogOptionsView _createButtonWithTitle:](self, "_createButtonWithTitle:", CFSTR("Last 60 minutes' log"));
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
  hourButton = self->_hourButton;
  self->_hourButton = v7;

  -[LUILogOptionsView _createButtonWithTitle:](self, "_createButtonWithTitle:", CFSTR("Last days' log"));
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  lastDayButton = self->_lastDayButton;
  self->_lastDayButton = v9;

  -[LUILogOptionsView _createButtonWithTitle:](self, "_createButtonWithTitle:", CFSTR("Stream log"));
  v11 = (UIButton *)objc_claimAutoreleasedReturnValue();
  streamButton = self->_streamButton;
  self->_streamButton = v11;

  v13 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v14 = self->_halfHourButton;
  v19[0] = self->_tenMinutesLogButton;
  v19[1] = v14;
  v15 = self->_lastDayButton;
  v19[2] = self->_hourButton;
  v19[3] = v15;
  v19[4] = self->_streamButton;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithArrangedSubviews:", v16);

  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "setAxis:", 1);
  objc_msgSend(v17, "setDistribution:", 3);
  objc_msgSend(v17, "setAlignment:", 3);
  return v17;
}

- (id)_createButtonWithTitle:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (objc_class *)MEMORY[0x24BDF6880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFrame:", 0.0, 0.0, 200.0, 50.0);
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleColor:forState:", v7, 0);

  objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleColor:forState:", v8, 2);

  objc_msgSend(v5, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 5.0);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "CGColor");
  objc_msgSend(v5, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderColor:", v11);

  objc_msgSend(v5, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBorderWidth:", 1.5);

  objc_msgSend(v5, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 200.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v5, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToConstant:", 50.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  return v5;
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackView, a3);
}

- (UIButton)tenMinutesLogButton
{
  return self->_tenMinutesLogButton;
}

- (void)setTenMinutesLogButton:(id)a3
{
  objc_storeStrong((id *)&self->_tenMinutesLogButton, a3);
}

- (UIButton)halfHourButton
{
  return self->_halfHourButton;
}

- (void)setHalfHourButton:(id)a3
{
  objc_storeStrong((id *)&self->_halfHourButton, a3);
}

- (UIButton)hourButton
{
  return self->_hourButton;
}

- (void)setHourButton:(id)a3
{
  objc_storeStrong((id *)&self->_hourButton, a3);
}

- (UIButton)lastDayButton
{
  return self->_lastDayButton;
}

- (void)setLastDayButton:(id)a3
{
  objc_storeStrong((id *)&self->_lastDayButton, a3);
}

- (UIButton)streamButton
{
  return self->_streamButton;
}

- (void)setStreamButton:(id)a3
{
  objc_storeStrong((id *)&self->_streamButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamButton, 0);
  objc_storeStrong((id *)&self->_lastDayButton, 0);
  objc_storeStrong((id *)&self->_hourButton, 0);
  objc_storeStrong((id *)&self->_halfHourButton, 0);
  objc_storeStrong((id *)&self->_tenMinutesLogButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
}

@end
