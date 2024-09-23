@implementation PBASimpleLockScreenView

- (PBASimpleLockScreenView)initWithFrame:(CGRect)a3
{
  PBASimpleLockScreenView *v3;
  void *v4;
  SBUICallToActionLabel *v5;
  SBUICallToActionLabel *callToAction;
  SBUICallToActionLabel *v7;
  void *v8;
  void *v9;
  id v10;
  MTLumaDodgePillView *v11;
  MTLumaDodgePillView *homeAffordance;
  UIScrollView *v13;
  UIScrollView *contentScrollView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIStackView *v23;
  UIStackView *contentStackView;
  void *v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *contentStackViewWidth;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
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
  objc_super v49;
  _QWORD v50[5];
  _QWORD v51[4];

  v49.receiver = self;
  v49.super_class = (Class)PBASimpleLockScreenView;
  v3 = -[PBASimpleLockScreenView initWithFrame:](&v49, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[PBASimpleLockScreenView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (SBUICallToActionLabel *)objc_msgSend(objc_alloc((Class)SBUICallToActionLabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    callToAction = v3->_callToAction;
    v3->_callToAction = v5;

    v7 = v3->_callToAction;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_UILegibilitySettings sharedInstanceForStyle:](_UILegibilitySettings, "sharedInstanceForStyle:", 2));
    -[SBUICallToActionLabel setLegibilitySettings:](v7, "setLegibilitySettings:", v8);

    -[PBASimpleLockScreenView addSubview:](v3, "addSubview:", v3->_callToAction);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, "_screenDidBlank:", CFSTR("PBAScreenDidBlankNotification"), 0);
    v48 = v9;
    if (SBFEffectiveHomeButtonType(objc_msgSend(v9, "addObserver:selector:name:object:", v3, "_screenWillUnblank:", CFSTR("PBAScreenWillUnblankNotification"), 0)) == 2)
    {
      v10 = objc_alloc((Class)MTLumaDodgePillView);
      -[PBASimpleLockScreenView bounds](v3, "bounds");
      v11 = (MTLumaDodgePillView *)objc_msgSend(v10, "initWithFrame:");
      homeAffordance = v3->_homeAffordance;
      v3->_homeAffordance = v11;

      -[MTLumaDodgePillView setStyle:](v3->_homeAffordance, "setStyle:", 3);
      -[PBASimpleLockScreenView addSubview:](v3, "addSubview:", v3->_homeAffordance);
    }
    v13 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    contentScrollView = v3->_contentScrollView;
    v3->_contentScrollView = v13;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PBASimpleLockScreenView addSubview:](v3, "addSubview:", v3->_contentScrollView);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](v3->_contentScrollView, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[PBASimpleLockScreenView leadingAnchor](v3, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v44));
    v51[0] = v42;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](v3->_contentScrollView, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PBASimpleLockScreenView trailingAnchor](v3, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v38));
    v51[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](v3->_contentScrollView, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBASimpleLockScreenView topAnchor](v3, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    v51[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](v3->_contentScrollView, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SBUICallToActionLabel topAnchor](v3->_callToAction, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -24.0));
    v51[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    v23 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    contentStackView = v3->_contentStackView;
    v3->_contentStackView = v23;

    -[UIStackView setAxis:](v3->_contentStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v3->_contentStackView, "setDistribution:", 3);
    -[UIStackView setAlignment:](v3->_contentStackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v3->_contentStackView, "setSpacing:", 8.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView addSubview:](v3->_contentScrollView, "addSubview:", v3->_contentStackView);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v3->_contentStackView, "widthAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView widthAnchor](v3->_contentScrollView, "widthAnchor"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    contentStackViewWidth = v3->_contentStackViewWidth;
    v3->_contentStackViewWidth = (NSLayoutConstraint *)v27;

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v3->_contentStackView, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](v3->_contentScrollView, "leadingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v45));
    v50[0] = v43;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v3->_contentStackView, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](v3->_contentScrollView, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v39));
    v50[1] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_contentStackView, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](v3->_contentScrollView, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
    v50[2] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_contentStackView, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](v3->_contentScrollView, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
    v50[3] = v35;
    v50[4] = v3->_contentStackViewWidth;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

  }
  return v3;
}

- (NSString)pressToOpenText
{
  return (NSString *)-[SBUICallToActionLabel text](self->_callToAction, "text");
}

- (void)setPressToOpenText:(id)a3
{
  -[SBUICallToActionLabel setText:](self->_callToAction, "setText:", a3);
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void)setIconSystemName:(id)a3
{
  id v5;
  UIImageView *iconImageView;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIImageView *v14;
  _QWORD v15[2];

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_iconSystemName) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_iconSystemName, a3);
    iconImageView = self->_iconImageView;
    if (v5)
    {
      if (!iconImageView)
      {
        v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
        v8 = self->_iconImageView;
        self->_iconImageView = v7;

        -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", 2);
        -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIStackView insertArrangedSubview:atIndex:](self->_contentStackView, "insertArrangedSubview:atIndex:", self->_iconImageView, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_iconImageView, "heightAnchor"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:", 80.0));
        v15[0] = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_iconImageView, "widthAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 80.0));
        v15[1] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

        iconImageView = self->_iconImageView;
      }
      v14 = (UIImageView *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v5));
      -[UIImageView setImage:](iconImageView, "setImage:", v14);
    }
    else
    {
      -[UIImageView removeFromSuperview](self->_iconImageView, "removeFromSuperview");
      v14 = self->_iconImageView;
      self->_iconImageView = 0;
    }

  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  UILabel *titleLabel;
  id v7;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBASimpleLockScreenView title](self, "title"));
  v5 = objc_msgSend(v4, "isEqualToString:", v13);

  if ((v5 & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    v7 = v13;
    if (v13)
    {
      if (!titleLabel)
      {
        v8 = (UILabel *)objc_alloc_init((Class)UILabel);
        v9 = self->_titleLabel;
        self->_titleLabel = v8;

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
        v10 = self->_titleLabel;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleLargeTitle, UIFontWeightBold));
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UIStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", self->_titleLabel);
        v7 = v13;
        if (self->_messageLabel)
        {
          -[UIStackView removeArrangedSubview:](self->_contentStackView, "removeArrangedSubview:");
          -[UIStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", self->_messageLabel);
          v7 = v13;
        }
      }
      -[UILabel setText:](self->_titleLabel, "setText:", v7);
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v12 = self->_titleLabel;
      self->_titleLabel = 0;

    }
  }

}

- (NSString)message
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setMessage:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  UILabel *messageLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBASimpleLockScreenView message](self, "message"));
  v5 = objc_msgSend(v4, "isEqualToString:", v13);

  v6 = v13;
  if ((v5 & 1) == 0)
  {
    messageLabel = self->_messageLabel;
    if (v13)
    {
      if (!messageLabel)
      {
        v8 = (UILabel *)objc_alloc_init((Class)UILabel);
        v9 = self->_messageLabel;
        self->_messageLabel = v8;

        -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
        v10 = self->_messageLabel;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleBody, UIFontWeightRegular));
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UIStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", self->_messageLabel);
        messageLabel = self->_messageLabel;
      }
      -[UILabel setText:](messageLabel, "setText:", v13);
    }
    else
    {
      -[UILabel removeFromSuperview](messageLabel, "removeFromSuperview");
      v12 = self->_messageLabel;
      self->_messageLabel = 0;

    }
    v6 = v13;
  }

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setShowInternalUIWarning:(BOOL)a3
{
  UILabel *v4;
  UILabel *internalUIWarningLabel;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;

  if (self->_showInternalUIWarning != a3)
  {
    self->_showInternalUIWarning = a3;
    if (a3)
    {
      v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      internalUIWarningLabel = self->_internalUIWarningLabel;
      self->_internalUIWarningLabel = v4;

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v13, 0.0));
      -[UILabel setFont:](self->_internalUIWarningLabel, "setFont:", v6);
      v7 = self->_internalUIWarningLabel;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      -[UILabel setTextColor:](v7, "setTextColor:", v8);

      v9 = self->_internalUIWarningLabel;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PREBOARD_INTERNAL_UI"), &stru_100018D78, CFSTR("PreBoard")));
      -[UILabel setText:](v9, "setText:", v11);

      -[PBASimpleLockScreenView addSubview:](self, "addSubview:", self->_internalUIWarningLabel);
      -[PBASimpleLockScreenView setNeedsLayout](self, "setNeedsLayout");

    }
    else
    {
      -[UILabel removeFromSuperview](self->_internalUIWarningLabel, "removeFromSuperview");
      v12 = self->_internalUIWarningLabel;
      self->_internalUIWarningLabel = 0;

    }
  }
}

- (void)layoutSubviews
{
  -[PBASimpleLockScreenView _layoutCallToActionLabel](self, "_layoutCallToActionLabel");
  -[PBASimpleLockScreenView _layoutInternalUIWarningLabel](self, "_layoutInternalUIWarningLabel");
  -[PBASimpleLockScreenView _layoutHomeAffordance](self, "_layoutHomeAffordance");
  -[PBASimpleLockScreenView _layoutContent](self, "_layoutContent");
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBASimpleLockScreenView;
  -[PBASimpleLockScreenView updateConstraints](&v3, "updateConstraints");
  -[PBASimpleLockScreenView _updateContentWidthConstraint](self, "_updateContentWidthConstraint");
}

- (void)_layoutHomeAffordance
{
  MTLumaDodgePillView *homeAffordance;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double MidX;
  double Height;
  double v16;
  double v17;
  double v18;
  MTLumaDodgePillView *v19;
  CGRect v20;
  CGRect v21;

  homeAffordance = self->_homeAffordance;
  if (homeAffordance)
  {
    v19 = homeAffordance;
    -[PBASimpleLockScreenView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[MTLumaDodgePillView setFrame:](self->_homeAffordance, "setFrame:");
    -[MTLumaDodgePillView suggestedSizeForContentWidth:](self->_homeAffordance, "suggestedSizeForContentWidth:", v9);
    -[MTLumaDodgePillView setBounds:](v19, "setBounds:", 0.0, 0.0, v12, v13);
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    MidX = CGRectGetMidX(v20);
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    Height = CGRectGetHeight(v21);
    -[MTLumaDodgePillView bounds](v19, "bounds");
    v17 = Height + v16 * -0.5;
    -[MTLumaDodgePillView suggestedEdgeSpacing](self->_homeAffordance, "suggestedEdgeSpacing");
    -[MTLumaDodgePillView setCenter:](v19, "setCenter:", MidX, v17 - v18);

  }
}

- (void)_layoutCallToActionLabel
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  SBUICallToActionLabel *callToAction;

  -[PBASimpleLockScreenView bounds](self, "bounds");
  v7 = v6;
  v8 = 44.0;
  if (!self->_homeAffordance)
    v8 = 40.0;
  callToAction = self->_callToAction;
  +[SBFDashBoardViewMetrics suggestedFrameForCallToActionLabel:yOffset:inBounds:](SBFDashBoardViewMetrics, "suggestedFrameForCallToActionLabel:yOffset:inBounds:", callToAction, v8, v7, v3, v4, v5);
  -[SBUICallToActionLabel setFrame:](callToAction, "setFrame:");
}

- (void)_layoutInternalUIWarningLabel
{
  if (self->_internalUIWarningLabel)
  {
    -[PBASimpleLockScreenView bounds](self, "bounds");
    -[UILabel sizeToFit](self->_internalUIWarningLabel, "sizeToFit");
    UIRectCenteredIntegralRectScale(-[UILabel frame](self->_internalUIWarningLabel, "frame"));
    -[UILabel setFrame:](self->_internalUIWarningLabel, "setFrame:");
  }
}

- (double)_contentHorizontalInset
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Width;
  CGRect v13;
  CGRect v14;

  -[PBASimpleLockScreenView bounds](self, "bounds");
  +[SBFDashBoardViewMetrics suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:](SBFDashBoardViewMetrics, "suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:", 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PBASimpleLockScreenView bounds](self, "bounds");
  Width = CGRectGetWidth(v13);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  return (Width - CGRectGetWidth(v14)) * 0.5;
}

- (void)_layoutContent
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  UIScrollView *contentScrollView;
  CGFloat v15;
  CGRect v16;

  -[PBASimpleLockScreenView bounds](self, "bounds");
  +[SBFDashBoardViewMetrics suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:](SBFDashBoardViewMetrics, "suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:", 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PBASimpleLockScreenView _contentHorizontalInset](self, "_contentHorizontalInset");
  v12 = v11;
  -[UIScrollView contentInset](self->_contentScrollView, "contentInset");
  if (v12 != v13)
  {
    contentScrollView = self->_contentScrollView;
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    v15 = CGRectGetMinY(v16) + 40.0;
    -[UIScrollView setContentInset:](contentScrollView, "setContentInset:", v15, v12, 0.0, v12);
  }
}

- (void)_updateContentWidthConstraint
{
  double v3;
  double v4;
  double v5;

  -[PBASimpleLockScreenView _contentHorizontalInset](self, "_contentHorizontalInset");
  v4 = v3 * -2.0;
  -[NSLayoutConstraint constant](self->_contentStackViewWidth, "constant");
  if (v4 != v5)
    -[NSLayoutConstraint setConstant:](self->_contentStackViewWidth, "setConstant:", v4);
}

- (void)willMoveToWindow:(id)a3
{
  if (!a3)
    -[PBASimpleLockScreenView _hideCallToAction](self, "_hideCallToAction");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  NSRunLoopMode v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBASimpleLockScreenView window](self, "window"));

  if (v3)
  {
    v5 = NSRunLoopCommonModes;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
    -[PBASimpleLockScreenView performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "_showCallToAction", 0, v4, 0.5);

  }
}

- (void)_screenDidBlank:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBASimpleLockScreenView window](self, "window", a3));

  if (v4)
    -[PBASimpleLockScreenView _hideCallToAction](self, "_hideCallToAction");
}

- (void)_screenWillUnblank:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBASimpleLockScreenView window](self, "window", a3));

  if (v4)
    -[PBASimpleLockScreenView _showCallToAction](self, "_showCallToAction");
}

- (void)_showCallToAction
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_hideCallToAction", 0);
  -[SBUICallToActionLabel setHidden:](self->_callToAction, "setHidden:", 0);
  -[SBUICallToActionLabel fadeInImmediately:](self->_callToAction, "fadeInImmediately:", 1);
}

- (void)_hideCallToAction
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_showCallToAction", 0);
  -[SBUICallToActionLabel fadeOut](self->_callToAction, "fadeOut");
  -[SBUICallToActionLabel setHidden:](self->_callToAction, "setHidden:", 1);
}

- (BOOL)showInternalUIWarning
{
  return self->_showInternalUIWarning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordance, 0);
  objc_storeStrong((id *)&self->_internalUIWarningLabel, 0);
  objc_storeStrong((id *)&self->_callToAction, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconSystemName, 0);
  objc_storeStrong((id *)&self->_contentStackViewWidth, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
}

@end
