@implementation PHCarPlayPhoneCallViewCell

- (PHCarPlayPhoneCallViewCell)initWithFrame:(CGRect)a3
{
  PHCarPlayPhoneCallViewCell *v3;
  PHCarPlayPhoneCallViewCell *v4;
  UILabel *v5;
  UILabel *mainLabel;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *subtitleLabel;
  void *v12;
  void *v13;
  void *v14;
  UIStackView *v15;
  UIStackView *subtitleStackView;
  UIView *v17;
  UIView *avatarContentView;
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
  uint64_t v29;
  NSLayoutConstraint *topMainLabelConstraint;
  void *v31;
  void *v32;
  uint64_t v33;
  NSLayoutConstraint *topAvatarConstraint;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSLayoutConstraint *containerSpecificLeftConstraint;
  NSLayoutConstraint *containerSpecificRightConstraint;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  objc_super v70;
  _QWORD v71[2];
  _QWORD v72[12];

  v70.receiver = self;
  v70.super_class = (Class)PHCarPlayPhoneCallViewCell;
  v3 = -[PHCarPlayPhoneCallViewCell initWithFrame:](&v70, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, 62.5);
  v4 = v3;
  if (v3)
  {
    -[PHCarPlayPhoneCallViewCell setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    mainLabel = v4->_mainLabel;
    v4->_mainLabel = v5;

    -[UILabel setNumberOfLines:](v4->_mainLabel, "setNumberOfLines:", 2);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_mainLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v4->_mainLabel, "setTextAlignment:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 28.0));
    -[UILabel setFont:](v4->_mainLabel, "setFont:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
    -[UILabel setTextColor:](v4->_mainLabel, "setTextColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v4->_mainLabel, "setBackgroundColor:", v9);

    -[UILabel setOpaque:](v4->_mainLabel, "setOpaque:", 0);
    -[UILabel setText:](v4->_mainLabel, "setText:", &stru_10028DC20);
    -[UILabel setLineBreakMode:](v4->_mainLabel, "setLineBreakMode:", 4);
    -[PHCarPlayPhoneCallViewCell addSubview:](v4, "addSubview:", v4->_mainLabel);
    v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v4->_subtitleLabel, "setLineBreakMode:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", 16.0, UIFontWeightRegular));
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v4->_subtitleLabel, "setBackgroundColor:", v14);

    -[UILabel setOpaque:](v4->_subtitleLabel, "setOpaque:", 0);
    -[UILabel setText:](v4->_subtitleLabel, "setText:", &stru_10028DC20);
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 2);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v15 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    subtitleStackView = v4->_subtitleStackView;
    v4->_subtitleStackView = v15;

    -[UIStackView setAxis:](v4->_subtitleStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v4->_subtitleStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v4->_subtitleStackView, "setAlignment:", 5);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v4->_subtitleStackView, "setSpacing:", 4.0);
    -[UIStackView addArrangedSubview:](v4->_subtitleStackView, "addArrangedSubview:", v4->_subtitleLabel);
    -[PHCarPlayPhoneCallViewCell addSubview:](v4, "addSubview:", v4->_subtitleStackView);
    v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    avatarContentView = v4->_avatarContentView;
    v4->_avatarContentView = v17;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_avatarContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHCarPlayPhoneCallViewCell addSubview:](v4, "addSubview:", v4->_avatarContentView);
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leftAnchor](v4->_mainLabel, "leftAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell leftAnchor](v4, "leftAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintGreaterThanOrEqualToAnchor:", v67));
    v72[0] = v66;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](v4->_mainLabel, "rightAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell rightAnchor](v4, "rightAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintLessThanOrEqualToAnchor:", v64));
    v72[1] = v63;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v4->_mainLabel, "centerXAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell centerXAnchor](v4, "centerXAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
    v72[2] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_subtitleStackView, "topAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_mainLabel, "bottomAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 0.0));
    v72[3] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leftAnchor](v4->_subtitleStackView, "leftAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell leftAnchor](v4, "leftAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintGreaterThanOrEqualToAnchor:constant:", v55, 0.0));
    v72[4] = v54;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView rightAnchor](v4->_subtitleStackView, "rightAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell rightAnchor](v4, "rightAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:constant:", v52, 0.0));
    v72[5] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v4->_subtitleStackView, "centerXAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell centerXAnchor](v4, "centerXAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
    v72[6] = v48;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](v4->_subtitleStackView, "heightAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v4->_subtitleLabel, "heightAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:", v46));
    v72[7] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v4->_avatarContentView, "widthAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:", 72.0));
    v72[8] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v4->_avatarContentView, "heightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", 72.0));
    v72[9] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v4->_avatarContentView, "centerXAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell centerXAnchor](v4, "centerXAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    v72[10] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_avatarContentView, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_mainLabel, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -6.0));
    v72[11] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 12));
    objc_msgSend(v69, "addObjectsFromArray:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell topAnchor](v4, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_mainLabel, "topAnchor"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    topMainLabelConstraint = v4->_topMainLabelConstraint;
    v4->_topMainLabelConstraint = (NSLayoutConstraint *)v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell topAnchor](v4, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_avatarContentView, "topAnchor"));
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
    topAvatarConstraint = v4->_topAvatarConstraint;
    v4->_topAvatarConstraint = (NSLayoutConstraint *)v33;

    v71[0] = v4->_topMainLabelConstraint;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell bottomAnchor](v4, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v4->_subtitleStackView, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
    v71[1] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 2));
    objc_msgSend(v69, "addObjectsFromArray:", v38);

    -[PHCarPlayPhoneCallViewCell addConstraints:](v4, "addConstraints:", v69);
    -[PHCarPlayPhoneCallViewCell layoutIfNeeded](v4, "layoutIfNeeded");
    containerSpecificLeftConstraint = v4->_containerSpecificLeftConstraint;
    v4->_containerSpecificLeftConstraint = 0;

    containerSpecificRightConstraint = v4->_containerSpecificRightConstraint;
    v4->_containerSpecificRightConstraint = 0;

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v2;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHCarPlayPhoneCallViewCell;
  -[PHCarPlayPhoneCallViewCell layoutSubviews](&v11, "layoutSubviews");
  -[PHCarPlayPhoneCallViewCell frame](self, "frame");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell superview](self, "superview"));
  objc_msgSend(v6, "frame");
  v8 = v7;
  if (v5 > v7)
  {
    v9 = 1;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell mainLabel](self, "mainLabel"));
    v9 = (uint64_t)objc_msgSend(v2, "numberOfLines");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell mainLabel](self, "mainLabel"));
  objc_msgSend(v10, "setNumberOfLines:", v9);

  if (v5 <= v8)
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayPhoneCallViewCell;
  -[PHCarPlayPhoneCallViewCell setEnabled:](&v5, "setEnabled:");
  -[PHCarPlayPhoneCallViewCell setDimmed:animated:](self, "setDimmed:animated:", v3, 0);
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  _QWORD v8[6];

  v4 = a4;
  if (a3)
    v6 = 0.5;
  else
    v6 = 1.0;
  -[PHCarPlayPhoneCallViewCell alpha](self, "alpha");
  if (v7 != v6)
  {
    if (v4)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100082050;
      v8[3] = &unk_1002850B0;
      v8[4] = self;
      *(double *)&v8[5] = v6;
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", self, 5243012, v8, 0, 0.550000012);
    }
    else
    {
      -[PHCarPlayPhoneCallViewCell setAlpha:](self, "setAlpha:", v6);
    }
  }
}

- (void)setTitle:(id)a3 subtitle:(id)a4 subtitleColor:(id)a5 overrideBadgeColor:(id)a6 localizedSenderIdentityTitle:(id)a7 animated:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v8 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell mainLabel](self, "mainLabel"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10008225C;
    v26[3] = &unk_100285158;
    v26[4] = self;
    v27 = v13;
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v17, 5243012, v26, 0, 0.550000012);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleStackView](self, "subtitleStackView"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100082298;
    v22[3] = &unk_100285310;
    v22[4] = self;
    v23 = v16;
    v24 = v14;
    v25 = v15;
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v18, 5243012, v22, 0, 0.550000012);

  }
  else
  {
    -[PHCarPlayPhoneCallViewCell _updateBadgeViewForLocalizedSenderIdentityTitle:](self, "_updateBadgeViewForLocalizedSenderIdentityTitle:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell mainLabel](self, "mainLabel"));
    objc_msgSend(v19, "setText:", v13);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v20, "setText:", v14);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v21, "setColor:", v15);

  }
}

- (void)setTitle:(id)a3 subtitle:(id)a4 subtitleColor:(id)a5 localizedSenderIdentityTitle:(id)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v7)
  {
    -[PHCarPlayPhoneCallViewCell _updateBadgeViewForLocalizedSenderIdentityTitle:](self, "_updateBadgeViewForLocalizedSenderIdentityTitle:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell mainLabel](self, "mainLabel"));
    objc_msgSend(v18, "setText:", v12);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v19, "setText:", v13);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v20, "setColor:", v14);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ALERT_ERROR_LABEL"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
    if (objc_msgSend(v13, "isEqualToString:", v22))
    {
      v23 = -[PHCarPlayPhoneCallViewCell numberOfLinesInSubtitleLabel](self, "numberOfLinesInSubtitleLabel");

      if (v23 < 3)
        goto LABEL_7;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ALERT_ERROR_LABEL_NO_LINE_BREAK"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleLabel](self, "subtitleLabel"));
      objc_msgSend(v24, "setText:", v22);

    }
    goto LABEL_7;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell mainLabel](self, "mainLabel"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000825E4;
  v29[3] = &unk_100285158;
  v29[4] = self;
  v30 = v12;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v16, 5243012, v29, 0, 0.550000012);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleStackView](self, "subtitleStackView"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100082620;
  v25[3] = &unk_100285310;
  v25[4] = self;
  v26 = v15;
  v27 = v13;
  v28 = v14;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v17, 5243012, v25, 0, 0.550000012);

LABEL_7:
}

- (void)_updateBadgeViewForLocalizedSenderIdentityTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9 && objc_msgSend(v9, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell badgeView](self, "badgeView"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell badgeView](self, "badgeView"));
      objc_msgSend(v5, "setTitle:", v9);

    }
    else
    {
      v7 = objc_msgSend(objc_alloc((Class)TPBadgeView), "initWithTitle:theme:", v9, 6);
      objc_msgSend(v7, "setSizeCategory:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleStackView](self, "subtitleStackView"));
      objc_msgSend(v8, "insertArrangedSubview:atIndex:", v7, 0);

      -[PHCarPlayPhoneCallViewCell setBadgeView:](self, "setBadgeView:", v7);
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell badgeView](self, "badgeView"));
    objc_msgSend(v6, "removeFromSuperview");

    -[PHCarPlayPhoneCallViewCell setBadgeView:](self, "setBadgeView:", 0);
  }

}

- (void)setAvatarViewController:(id)a3
{
  CNAvatarViewController *v5;
  CNAvatarViewController **p_avatarViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CNAvatarViewController *v11;

  v5 = (CNAvatarViewController *)a3;
  p_avatarViewController = &self->_avatarViewController;
  if (self->_avatarViewController != v5)
  {
    v11 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNAvatarViewController view](v5, "view"));
      objc_msgSend(v7, "setAutoresizingMask:", 18);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell avatarContentView](self, "avatarContentView"));
      objc_msgSend(v8, "bounds");
      objc_msgSend(v7, "setFrame:");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell avatarContentView](self, "avatarContentView"));
      objc_msgSend(v9, "addSubview:", v7);

      -[NSLayoutConstraint setActive:](self->_topMainLabelConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_topAvatarConstraint, "setActive:", 1);
    }
    else
    {
      -[NSLayoutConstraint setActive:](self->_topAvatarConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_topMainLabelConstraint, "setActive:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell mainLabel](self, "mainLabel"));
      objc_msgSend(v7, "setNumberOfLines:", 2);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNAvatarViewController view](*p_avatarViewController, "view"));
    objc_msgSend(v10, "removeFromSuperview");

    objc_storeStrong((id *)p_avatarViewController, a3);
    v5 = v11;
  }

}

- (int64_t)numberOfLinesInSubtitleLabel
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSAttributedStringKey v17;
  void *v18;

  -[PHCarPlayPhoneCallViewCell frame](self, "frame");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleLabel](self, "subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "font"));
  objc_msgSend(v6, "lineHeight");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleLabel](self, "subtitleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));

  v17 = NSFontAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallViewCell subtitleLabel](self, "subtitleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "font"));
  v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v13, 0, v4, 1.79769313e308);
  v15 = v14;

  return (uint64_t)(v15 / v8);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSLayoutConstraint)containerSpecificLeftConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContainerSpecificLeftConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSLayoutConstraint)containerSpecificRightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainerSpecificRightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (UILabel)mainLabel
{
  return (UILabel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMainLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (UIStackView)subtitleStackView
{
  return self->_subtitleStackView;
}

- (void)setSubtitleStackView:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleStackView, a3);
}

- (TPBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UIView)avatarContentView
{
  return self->_avatarContentView;
}

- (NSLayoutConstraint)topMainLabelConstraint
{
  return self->_topMainLabelConstraint;
}

- (void)setTopMainLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topMainLabelConstraint, a3);
}

- (NSLayoutConstraint)topAvatarConstraint
{
  return self->_topAvatarConstraint;
}

- (void)setTopAvatarConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topAvatarConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topAvatarConstraint, 0);
  objc_storeStrong((id *)&self->_topMainLabelConstraint, 0);
  objc_storeStrong((id *)&self->_avatarContentView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_subtitleStackView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_containerSpecificRightConstraint, 0);
  objc_storeStrong((id *)&self->_containerSpecificLeftConstraint, 0);
}

@end
