@implementation LUIPrivacyView

+ (id)defaultPrivacyView
{
  LUIPrivacyView *v2;
  void *v3;

  v2 = -[LUIPrivacyView initWithFrame:dynamicHeight:]([LUIPrivacyView alloc], "initWithFrame:dynamicHeight:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyController sharedController](LUIPrivacyController, "sharedController"));
  -[LUIPrivacyView setDelegate:](v2, "setDelegate:", v3);

  return v2;
}

+ (id)dynamicHeightPrivacyView
{
  LUIPrivacyView *v2;
  void *v3;

  v2 = -[LUIPrivacyView initWithFrame:dynamicHeight:]([LUIPrivacyView alloc], "initWithFrame:dynamicHeight:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyController sharedController](LUIPrivacyController, "sharedController"));
  -[LUIPrivacyView setDelegate:](v2, "setDelegate:", v3);

  return v2;
}

- (LUIPrivacyView)initWithFrame:(CGRect)a3 dynamicHeight:(BOOL)a4
{
  _BOOL4 v4;
  LUIPrivacyView *v5;
  LUIPrivacyView *v6;
  UILabel *v7;
  UILabel *privacyTextLabel;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *buttonTitle;
  uint64_t v18;
  UIButton *moreInfoButton;
  UIButton *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  UIStackView *v31;
  UIStackView *privacyLineStackView;
  id v33;
  void *v34;
  UIStackView *v35;
  uint64_t v36;
  UILabel *assetTagTextLabel;
  uint64_t v38;
  UILabel *ifFoundTextLabel;
  UIStackView *allContentStackView;
  void *v41;
  void *v42;
  uint64_t v43;
  id profileObserver;
  _QWORD v46[4];
  id v47;
  id location;
  objc_super v49;
  _QWORD v50[3];
  UIStackView *v51;
  _QWORD v52[2];

  v4 = a4;
  v49.receiver = self;
  v49.super_class = (Class)LUIPrivacyView;
  v5 = -[LUIPrivacyView initWithFrame:](&v49, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_dynamicHeightEnabled = v4;
    v7 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    privacyTextLabel = v6->_privacyTextLabel;
    v6->_privacyTextLabel = v7;

    v9 = v6->_privacyTextLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "privacyViewTextFont"));
    -[UILabel setFont:](v9, "setFont:", v11);

    v12 = v6->_privacyTextLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privacyViewTextColor"));
    -[UILabel setTextColor:](v12, "setTextColor:", v14);

    -[UILabel setLineBreakMode:](v6->_privacyTextLabel, "setLineBreakMode:", 4);
    -[UILabel setTextAlignment:](v6->_privacyTextLabel, "setTextAlignment:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_100069EB8, 0));
    buttonTitle = v6->_buttonTitle;
    v6->_buttonTitle = (NSString *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    moreInfoButton = v6->_moreInfoButton;
    v6->_moreInfoButton = (UIButton *)v18;

    v20 = v6->_moreInfoButton;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
    -[UIButton setTitleColor:forState:](v20, "setTitleColor:forState:", v21, 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v6->_moreInfoButton, "titleLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "privacyViewTextFont"));
    objc_msgSend(v22, "setFont:", v24);

    -[UIButton addTarget:action:forControlEvents:](v6->_moreInfoButton, "addTarget:action:forControlEvents:", v6, "moreInfoButtonPressed:", 64);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v6->_moreInfoButton, "titleLabel"));
    objc_msgSend(v25, "setLineBreakMode:", 4);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v6->_moreInfoButton, "titleLabel"));
    objc_msgSend(v26, "setTextAlignment:", 1);

    LODWORD(v27) = 1144766464;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v6->_moreInfoButton, "setContentCompressionResistancePriority:forAxis:", 0, v27);
    LODWORD(v28) = 1144766464;
    -[UIButton setContentHuggingPriority:forAxis:](v6->_moreInfoButton, "setContentHuggingPriority:forAxis:", 0, v28);
    -[UIButton setTitle:forState:](v6->_moreInfoButton, "setTitle:forState:", v6->_buttonTitle, 0);
    -[UIButton sizeToFit](v6->_moreInfoButton, "sizeToFit");
    v29 = objc_alloc((Class)UIStackView);
    v52[0] = v6->_privacyTextLabel;
    v52[1] = v6->_moreInfoButton;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 2));
    v31 = (UIStackView *)objc_msgSend(v29, "initWithArrangedSubviews:", v30);
    privacyLineStackView = v6->_privacyLineStackView;
    v6->_privacyLineStackView = v31;

    -[UIStackView setSpacing:](v6->_privacyLineStackView, "setSpacing:", 5.0);
    if (v4)
    {
      v33 = objc_alloc((Class)UIStackView);
      v51 = v6->_privacyLineStackView;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
    }
    else
    {
      v36 = objc_claimAutoreleasedReturnValue(-[LUIPrivacyView _createFooterNoteLabel](v6, "_createFooterNoteLabel"));
      assetTagTextLabel = v6->_assetTagTextLabel;
      v6->_assetTagTextLabel = (UILabel *)v36;

      v38 = objc_claimAutoreleasedReturnValue(-[LUIPrivacyView _createFooterNoteLabel](v6, "_createFooterNoteLabel"));
      ifFoundTextLabel = v6->_ifFoundTextLabel;
      v6->_ifFoundTextLabel = (UILabel *)v38;

      v33 = objc_alloc((Class)UIStackView);
      v50[0] = v6->_privacyLineStackView;
      v50[1] = v6->_assetTagTextLabel;
      v50[2] = v6->_ifFoundTextLabel;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 3));
    }
    v35 = (UIStackView *)objc_msgSend(v33, "initWithArrangedSubviews:", v34);
    allContentStackView = v6->_allContentStackView;
    v6->_allContentStackView = v35;

    -[UIStackView setAlignment:](v6->_allContentStackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](v6->_allContentStackView, "setDistribution:", 1);
    -[UIStackView setAxis:](v6->_allContentStackView, "setAxis:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v6->_allContentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[LUIPrivacyView addSubview:](v6, "addSubview:", v6->_allContentStackView);
    -[UIStackView sizeToFit](v6->_allContentStackView, "sizeToFit");
    -[LUIPrivacyView _updateFooterText](v6, "_updateFooterText");
    objc_initWeak(&location, v6);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10002C7AC;
    v46[3] = &unk_100069C60;
    objc_copyWeak(&v47, &location);
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "addObserverForName:object:queue:usingBlock:", MCProfileListChangedNotification, 0, v42, v46));
    profileObserver = v6->_profileObserver;
    v6->_profileObserver = (id)v43;

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  id profileObserver;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self->_profileObserver);

  profileObserver = self->_profileObserver;
  self->_profileObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)LUIPrivacyView;
  -[LUIPrivacyView dealloc](&v5, "dealloc");
}

+ (id)bottomCenterConstraintsForPrivacyView:(id)a3 inView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double height;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v5 = a4;
  v6 = a3;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
  objc_msgSend(v7, "privacyViewBaselineToBottomPadding");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22));
  v24[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v24[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  height = CGSizeZero.height;
  objc_msgSend(v6, "sizeThatFits:", CGSizeZero.width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", v14));
  v24[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  objc_msgSend(v6, "sizeThatFits:", CGSizeZero.width, height);
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", v18));
  v24[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));

  return v20;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[LUIPrivacyView layoutIfNeeded](self, "layoutIfNeeded");
  -[UIStackView sizeThatFits:](self->_allContentStackView, "sizeThatFits:", width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)_organizationName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceOrganizationName"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "classConfiguration"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "schoolName"));

  }
  return v3;
}

- (void)_updateOrganizationName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[LUIPrivacyView _organizationName](self, "_organizationName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PRIVACY_TEXT_FORMAT_ORG_NAME"), &stru_100069EB8, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6));
    -[LUIPrivacyView setPrivacyText:](self, "setPrivacyText:", v5);

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PRIVACY_TEXT_GENERIC"), &stru_100069EB8, 0));
    -[LUIPrivacyView setPrivacyText:](self, "setPrivacyText:", v4);
  }

}

- (void)_updateFooterText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[LUIPrivacyView _updateOrganizationName](self, "_updateOrganizationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceLockScreenFootnote"));
  -[LUIPrivacyView setIfFoundText:](self, "setIfFoundText:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceAssetTag"));
  -[LUIPrivacyView setAssetTagText:](self, "setAssetTagText:", v5);

}

- (id)_createFooterNoteLabel
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "privacyViewTextFont"));
  objc_msgSend(v2, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "privacyViewTextColor"));
  objc_msgSend(v2, "setTextColor:", v6);

  objc_msgSend(v2, "setLineBreakMode:", 4);
  objc_msgSend(v2, "setTextAlignment:", 1);
  return v2;
}

- (void)setAssetTagText:(id)a3
{
  NSString *v5;
  void *v6;
  UIStackView *allContentStackView;
  void *v8;
  UILabel *assetTagTextLabel;
  NSString *v10;

  v5 = (NSString *)a3;
  if (self->_assetTagText != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_assetTagText, a3);
    if (-[NSString length](v10, "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPrivacyView assetTagTextLabel](self, "assetTagTextLabel"));
      objc_msgSend(v6, "setText:", v10);

      allContentStackView = self->_allContentStackView;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPrivacyView assetTagTextLabel](self, "assetTagTextLabel"));
      -[UIStackView addArrangedSubview:](allContentStackView, "addArrangedSubview:", v8);

LABEL_6:
      -[LUIPrivacyView setNeedsLayout](self, "setNeedsLayout");
      v5 = v10;
      goto LABEL_7;
    }
    assetTagTextLabel = self->_assetTagTextLabel;
    v5 = v10;
    if (assetTagTextLabel)
    {
      -[UILabel removeFromSuperview](assetTagTextLabel, "removeFromSuperview", v10);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)setIfFoundText:(id)a3
{
  NSString *v5;
  void *v6;
  UIStackView *allContentStackView;
  void *v8;
  UILabel *ifFoundTextLabel;
  NSString *v10;

  v5 = (NSString *)a3;
  if (self->_ifFoundText != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_ifFoundText, a3);
    if (-[NSString length](v10, "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPrivacyView ifFoundTextLabel](self, "ifFoundTextLabel"));
      objc_msgSend(v6, "setText:", v10);

      allContentStackView = self->_allContentStackView;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPrivacyView ifFoundTextLabel](self, "ifFoundTextLabel"));
      -[UIStackView addArrangedSubview:](allContentStackView, "addArrangedSubview:", v8);

LABEL_6:
      -[LUIPrivacyView setNeedsLayout](self, "setNeedsLayout");
      v5 = v10;
      goto LABEL_7;
    }
    ifFoundTextLabel = self->_ifFoundTextLabel;
    v5 = v10;
    if (ifFoundTextLabel)
    {
      -[UILabel removeFromSuperview](ifFoundTextLabel, "removeFromSuperview", v10);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)setButtonTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_buttonTitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_buttonTitle, a3);
    v5 = v6;
    if (v6)
    {
      -[UIButton setTitle:forState:](self->_moreInfoButton, "setTitle:forState:", v6, 0);
      -[UIButton sizeToFit](self->_moreInfoButton, "sizeToFit");
      -[LUIPrivacyView setNeedsLayout](self, "setNeedsLayout");
      v5 = v6;
    }
  }

}

- (void)setPrivacyText:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_privacyText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_privacyText, a3);
    v5 = v6;
    if (v6)
    {
      -[UILabel setText:](self->_privacyTextLabel, "setText:", self->_privacyText);
      -[LUIPrivacyView setNeedsLayout](self, "setNeedsLayout");
      v5 = v6;
    }
  }

}

- (void)setDelegate:(id)a3
{
  LUIPrivacyViewDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (id)ifFoundTextLabel
{
  UILabel *ifFoundTextLabel;
  UILabel *v4;
  UILabel *v5;

  ifFoundTextLabel = self->_ifFoundTextLabel;
  if (!ifFoundTextLabel)
  {
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue(-[LUIPrivacyView _createFooterNoteLabel](self, "_createFooterNoteLabel"));
    v5 = self->_ifFoundTextLabel;
    self->_ifFoundTextLabel = v4;

    ifFoundTextLabel = self->_ifFoundTextLabel;
  }
  return ifFoundTextLabel;
}

- (id)assetTagTextLabel
{
  UILabel *assetTagTextLabel;
  UILabel *v4;
  UILabel *v5;

  assetTagTextLabel = self->_assetTagTextLabel;
  if (!assetTagTextLabel)
  {
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue(-[LUIPrivacyView _createFooterNoteLabel](self, "_createFooterNoteLabel"));
    v5 = self->_assetTagTextLabel;
    self->_assetTagTextLabel = v4;

    assetTagTextLabel = self->_assetTagTextLabel;
  }
  return assetTagTextLabel;
}

- (void)moreInfoButtonPressed:(id)a3
{
  LUIPrivacyViewDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector(v7, "moreInfoButtonPressed:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "moreInfoButtonPressed:", v10);

    }
  }

}

- (LUIPrivacyViewDelegate)delegate
{
  return (LUIPrivacyViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)privacyText
{
  return self->_privacyText;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSString)ifFoundText
{
  return self->_ifFoundText;
}

- (NSString)assetTagText
{
  return self->_assetTagText;
}

- (BOOL)isDynamicHeightEnabled
{
  return self->_dynamicHeightEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTagText, 0);
  objc_storeStrong((id *)&self->_ifFoundText, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_privacyText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_profileObserver, 0);
  objc_storeStrong((id *)&self->_allContentStackView, 0);
  objc_storeStrong((id *)&self->_privacyLineStackView, 0);
  objc_storeStrong((id *)&self->_assetTagTextLabel, 0);
  objc_storeStrong((id *)&self->_ifFoundTextLabel, 0);
  objc_storeStrong((id *)&self->_moreInfoButton, 0);
  objc_storeStrong((id *)&self->_privacyTextLabel, 0);
}

@end
