@implementation HKCurrentTimeView

- (HKCurrentTimeView)initWithWideHorizontalMargin:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HKCurrentTimeView *v6;
  objc_super v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v8.receiver = self;
  v8.super_class = (Class)HKCurrentTimeView;
  v6 = -[HKCurrentTimeView initWithFrame:](&v8, sel_initWithFrame_);

  if (v6)
    -[HKCurrentTimeView setupViewWithWideHorizontalMargin:](v6, "setupViewWithWideHorizontalMargin:", v3);
  return v6;
}

- (HKCurrentTimeView)initWithFrame:(CGRect)a3
{
  return -[HKCurrentTimeView initWithWideHorizontalMargin:](self, "initWithWideHorizontalMargin:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HKCurrentTimeView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKCurrentTimeView;
  return -[HKCurrentTimeView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKCurrentTimeView;
  -[HKCurrentTimeView dealloc](&v4, sel_dealloc);
}

- (void)setupViewWithWideHorizontalMargin:(BOOL)a3
{
  _BOOL4 v3;
  UIButton *v5;
  UIButton *currentTimeButton;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  HKCurrentTimeChevronButton *v13;
  HKCurrentTimeChevronButton *previousTimeIndexButton;
  HKCurrentTimeChevronButton *v15;
  HKCurrentTimeChevronButton *nextTimeIndexButton;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v3 = a3;
  v5 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  currentTimeButton = self->_currentTimeButton;
  self->_currentTimeButton = v5;

  -[UIButton addTarget:action:forControlEvents:](self->_currentTimeButton, "addTarget:action:forControlEvents:", self, sel_currentTimeButtonTapped_, 64);
  -[UIButton titleLabel](self->_currentTimeButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView _currentTimeButtonFont](self, "_currentTimeButtonFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  -[UIButton titleLabel](self->_currentTimeButton, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

  -[UIButton titleLabel](self->_currentTimeButton, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBaselineAdjustment:", 1);

  v11 = self->_currentTimeButton;
  HKHealthKeyColor();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v11, "setTitleColor:forState:", v12, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_currentTimeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKCurrentTimeView addSubview:](self, "addSubview:", self->_currentTimeButton);
  v13 = -[HKCurrentTimeChevronButton initWithChevronDirection:]([HKCurrentTimeChevronButton alloc], "initWithChevronDirection:", 1);
  previousTimeIndexButton = self->_previousTimeIndexButton;
  self->_previousTimeIndexButton = v13;

  -[HKCurrentTimeChevronButton addTarget:action:forControlEvents:](self->_previousTimeIndexButton, "addTarget:action:forControlEvents:", self, sel_previousTimeIndexButtonTapped_, 64);
  -[HKCurrentTimeChevronButton setTranslatesAutoresizingMaskIntoConstraints:](self->_previousTimeIndexButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKCurrentTimeView addSubview:](self, "addSubview:", self->_previousTimeIndexButton);
  v15 = -[HKCurrentTimeChevronButton initWithChevronDirection:]([HKCurrentTimeChevronButton alloc], "initWithChevronDirection:", 0);
  nextTimeIndexButton = self->_nextTimeIndexButton;
  self->_nextTimeIndexButton = v15;

  -[HKCurrentTimeChevronButton addTarget:action:forControlEvents:](self->_nextTimeIndexButton, "addTarget:action:forControlEvents:", self, sel_nextTimeIndexButtonTapped_, 64);
  -[HKCurrentTimeChevronButton setTranslatesAutoresizingMaskIntoConstraints:](self->_nextTimeIndexButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKCurrentTimeView addSubview:](self, "addSubview:", self->_nextTimeIndexButton);
  -[HKCurrentTimeView setPreviousTimeButtonEnabled:](self, "setPreviousTimeButtonEnabled:", 0);
  -[HKCurrentTimeView setNextTimeButtonEnabled:](self, "setNextTimeButtonEnabled:", 0);
  if (v3)
    v17 = 16.0;
  else
    v17 = 3.0;
  -[HKCurrentTimeChevronButton leftAnchor](self->_previousTimeIndexButton, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView leftAnchor](self, "leftAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[HKCurrentTimeChevronButton centerYAnchor](self->_previousTimeIndexButton, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton centerYAnchor](self->_currentTimeButton, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HKCurrentTimeChevronButton widthAnchor](self->_previousTimeIndexButton, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 54.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[HKCurrentTimeChevronButton rightAnchor](self->_nextTimeIndexButton, "rightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView rightAnchor](self, "rightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[HKCurrentTimeChevronButton centerYAnchor](self->_nextTimeIndexButton, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton centerYAnchor](self->_currentTimeButton, "centerYAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[HKCurrentTimeChevronButton widthAnchor](self->_nextTimeIndexButton, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", 54.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  -[UIButton centerXAnchor](self->_currentTimeButton, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView centerXAnchor](self, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[UIButton leftAnchor](self->_currentTimeButton, "leftAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView leftAnchor](self, "leftAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, v17 + 27.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[UIButton rightAnchor](self->_currentTimeButton, "rightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView rightAnchor](self, "rightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, -27.0 - v17);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  -[UIButton topAnchor](self->_currentTimeButton, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView topAnchor](self, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, 2.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[UIButton bottomAnchor](self->_currentTimeButton, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView bottomAnchor](self, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, -2.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObserver:selector:name:object:", self, sel__handleContentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

}

- (void)setCurrentTimeString:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_currentTimeString, a3);
  v5 = a3;
  -[UIButton setTitle:forState:](self->_currentTimeButton, "setTitle:forState:", v5, 0);

}

- (void)setDisableControls:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 omitPrevNextButtons;

  v3 = a3;
  self->_disableControls = a3;
  if (a3)
  {
    omitPrevNextButtons = 1;
    -[HKCurrentTimeChevronButton setHidden:](self->_previousTimeIndexButton, "setHidden:", 1);
  }
  else
  {
    -[HKCurrentTimeChevronButton setHidden:](self->_previousTimeIndexButton, "setHidden:", self->_omitPrevNextButtons);
    omitPrevNextButtons = self->_omitPrevNextButtons;
  }
  -[HKCurrentTimeChevronButton setHidden:](self->_nextTimeIndexButton, "setHidden:", omitPrevNextButtons);
  -[UIButton setEnabled:](self->_currentTimeButton, "setEnabled:", !v3);
  -[HKCurrentTimeView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)previousTimeButtonEnabled
{
  return -[HKCurrentTimeChevronButton isEnabled](self->_previousTimeIndexButton, "isEnabled");
}

- (BOOL)nextTimeButtonEnabled
{
  return -[HKCurrentTimeChevronButton isEnabled](self->_nextTimeIndexButton, "isEnabled");
}

- (void)setPreviousTimeButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  HKCurrentTimeChevronButton *previousTimeIndexButton;
  id v8;

  v3 = a3;
  -[HKCurrentTimeChevronButton setEnabled:](self->_previousTimeIndexButton, "setEnabled:");
  -[HKCurrentTimeChevronButton imageView](self->_previousTimeIndexButton, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView _colorIfForeground:enabled:](self, "_colorIfForeground:enabled:", 1, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  previousTimeIndexButton = self->_previousTimeIndexButton;
  -[HKCurrentTimeView _colorIfForeground:enabled:](self, "_colorIfForeground:enabled:", 0, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeChevronButton setTintColor:](previousTimeIndexButton, "setTintColor:", v8);

}

- (void)setNextTimeButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  HKCurrentTimeChevronButton *nextTimeIndexButton;
  id v8;

  v3 = a3;
  -[HKCurrentTimeChevronButton setEnabled:](self->_nextTimeIndexButton, "setEnabled:");
  -[HKCurrentTimeChevronButton imageView](self->_nextTimeIndexButton, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView _colorIfForeground:enabled:](self, "_colorIfForeground:enabled:", 1, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  nextTimeIndexButton = self->_nextTimeIndexButton;
  -[HKCurrentTimeView _colorIfForeground:enabled:](self, "_colorIfForeground:enabled:", 0, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeChevronButton setTintColor:](nextTimeIndexButton, "setTintColor:", v8);

}

- (void)setCurrentTimeButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  UIButton *currentTimeButton;
  id v6;

  v3 = a3;
  -[UIButton setEnabled:](self->_currentTimeButton, "setEnabled:");
  currentTimeButton = self->_currentTimeButton;
  -[HKCurrentTimeView _labelColor:](self, "_labelColor:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](currentTimeButton, "setTitleColor:forState:", v6, 0);

}

- (void)setOmitPrevNextButtons:(BOOL)a3
{
  self->_omitPrevNextButtons = a3;
  -[HKCurrentTimeView setDisableControls:](self, "setDisableControls:", self->_disableControls);
}

- (void)currentTimeButtonTapped:(id)a3
{
  id v4;

  -[HKCurrentTimeView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTimeViewDidTapOnDateSelector:", self);

}

- (void)previousTimeIndexButtonTapped:(id)a3
{
  id v4;

  -[HKCurrentTimeView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTimeViewDidTapOnPreviousTimeButton:", self);

}

- (void)nextTimeIndexButtonTapped:(id)a3
{
  id v4;

  -[HKCurrentTimeView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTimeViewDidTapOnNextTimeButton:", self);

}

- (id)_currentTimeButtonFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4AB8], 2);
}

- (double)_currentTimeButtonBaselineToTop
{
  void *v2;
  double v3;
  double v4;

  -[HKCurrentTimeView _currentTimeButtonFont](self, "_currentTimeButtonFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 27.0);
  v4 = v3;

  return v4;
}

- (double)_currentTimeButtonBaselineToBottom
{
  void *v2;
  double v3;
  double v4;

  -[HKCurrentTimeView _currentTimeButtonFont](self, "_currentTimeButtonFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 19.0);
  v4 = v3;

  return v4;
}

- (id)_colorIfForeground:(BOOL)a3 enabled:(BOOL)a4
{
  if (a3)
    -[HKCurrentTimeView _foregroundColor:](self, "_foregroundColor:", a4);
  else
    -[HKCurrentTimeView _backgroundColor:](self, "_backgroundColor:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_tintColor:(BOOL)a3
{
  if (a3)
    HKHealthTintColor();
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_labelColor:(BOOL)a3
{
  if (a3)
    HKHealthKeyColor();
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayTextColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_foregroundColor:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[HKCurrentTimeView _tintColor:](self, "_tintColor:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView _foregroundAlpha:](self, "_foregroundAlpha:", v3);
  objc_msgSend(v5, "colorWithAlphaComponent:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_backgroundColor:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[HKCurrentTimeView _tintColor:](self, "_tintColor:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView _backgroundAlpha:](self, "_backgroundAlpha:", v3);
  objc_msgSend(v5, "colorWithAlphaComponent:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)_foregroundAlpha:(BOOL)a3
{
  double result;

  result = 0.4;
  if (a3)
    return 1.0;
  return result;
}

- (double)_backgroundAlpha:(BOOL)a3
{
  double result;

  result = 0.1;
  if (a3)
    return 0.05;
  return result;
}

- (void)_handleContentSizeCategoryDidChange
{
  void *v3;
  id v4;

  -[UIButton titleLabel](self->_currentTimeButton, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKCurrentTimeView _currentTimeButtonFont](self, "_currentTimeButtonFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

}

- (NSString)currentTimeString
{
  return self->_currentTimeString;
}

- (HKCurrentTimeViewDelegate)delegate
{
  return (HKCurrentTimeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disableControls
{
  return self->_disableControls;
}

- (BOOL)currentTimeButtonEnabled
{
  return self->_currentTimeButtonEnabled;
}

- (BOOL)omitPrevNextButtons
{
  return self->_omitPrevNextButtons;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentTimeString, 0);
  objc_storeStrong((id *)&self->_nextTimeIndexButton, 0);
  objc_storeStrong((id *)&self->_previousTimeIndexButton, 0);
  objc_storeStrong((id *)&self->_currentTimeButton, 0);
}

@end
