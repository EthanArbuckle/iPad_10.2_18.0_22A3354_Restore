@implementation LUIUserSwitchTestOngoingIndicatorView

- (LUIUserSwitchTestOngoingIndicatorView)init
{
  return -[LUIUserSwitchTestOngoingIndicatorView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 330.0, 40.0);
}

- (LUIUserSwitchTestOngoingIndicatorView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  LUIUserSwitchTestOngoingIndicatorView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *textLabel;
  void *v12;
  double v13;
  uint64_t v14;
  UIButton *cancelButton;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  UIButton *v22;
  void *v23;
  UIButton *v24;
  void *v25;
  void *v26;
  objc_super v28;

  height = a3.size.height;
  width = a3.size.width;
  v28.receiver = self;
  v28.super_class = (Class)LUIUserSwitchTestOngoingIndicatorView;
  v5 = -[LUIUserSwitchTestOngoingIndicatorView initWithFrame:](&v28, "initWithFrame:", a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.600000024));
    -[LUIUserSwitchTestOngoingIndicatorView setBackgroundColor:](v5, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorView layer](v5, "layer"));
    objc_msgSend(v8, "setCornerRadius:", height * 0.5);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserSwitchTestOngoingIndicatorView layer](v5, "layer"));
    objc_msgSend(v9, "setMasksToBounds:", 1);

    v10 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 10.0, 0.0, width + -20.0, height);
    textLabel = v5->_textLabel;
    v5->_textLabel = v10;

    -[UILabel setAutoresizingMask:](v5->_textLabel, "setAutoresizingMask:", 18);
    -[UILabel setText:](v5->_textLabel, "setText:", CFSTR("User Switch Test Ongoing"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v5->_textLabel, "setTextColor:", v12);

    v13 = height + -20.0;
    v14 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (UIButton *)v14;

    -[UIButton setFrame:](v5->_cancelButton, "setFrame:", width + -10.0 + -80.0, 10.0, 80.0, v13);
    -[UIButton setAutoresizingMask:](v5->_cancelButton, "setAutoresizingMask:", 41);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v5->_cancelButton, "layer"));
    objc_msgSend(v16, "setCornerRadius:", v13 * 0.5);

    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    v18 = objc_msgSend(v17, "CGColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v5->_cancelButton, "layer"));
    objc_msgSend(v19, "setBorderColor:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v5->_cancelButton, "layer"));
    objc_msgSend(v20, "setBorderWidth:", 1.0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v5->_cancelButton, "layer"));
    objc_msgSend(v21, "setMasksToBounds:", 1);

    -[UIButton setTitle:forState:](v5->_cancelButton, "setTitle:forState:", CFSTR("Cancel"), 0);
    v22 = v5->_cancelButton;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTitleColor:forState:](v22, "setTitleColor:forState:", v23, 0);

    v24 = v5->_cancelButton;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "colorWithAlphaComponent:", 0.200000003));
    -[UIButton setBackgroundColor:](v24, "setBackgroundColor:", v26);

    -[LUIUserSwitchTestOngoingIndicatorView addSubview:](v5, "addSubview:", v5->_textLabel);
    -[LUIUserSwitchTestOngoingIndicatorView addSubview:](v5, "addSubview:", v5->_cancelButton);
  }
  return v5;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
