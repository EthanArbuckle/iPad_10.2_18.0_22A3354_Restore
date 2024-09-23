@implementation PHMultipleCallParticipantLabelView

- (PHMultipleCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3
{
  id v5;
  PHMultipleCallParticipantLabelView *v6;
  PHMultipleCallParticipantLabelView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  void *v17;
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
  uint64_t v29;
  NSArray *badgeViewHiddenLayoutConstraints;
  uint64_t v31;
  NSArray *badgeViewVisibleLayoutConstraints;
  void *v33;
  void *v34;
  id v35;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  objc_super v61;
  void *v62;
  void *v63;

  v5 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PHMultipleCallParticipantLabelView;
  v6 = -[PHAbstractCallParticipantLabelView initWithCallDisplayStyleManager:](&v61, "initWithCallDisplayStyleManager:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView marqueeLabelFont](v7, "marqueeLabelFont"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](v7, "participantMarqueeLabel"));
    objc_msgSend(v9, "setFont:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](v7, "participantMarqueeLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView leadingAnchor](v7, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 24.0));

    objc_msgSend(v13, "setActive:", 1);
    v14 = objc_msgSend(objc_alloc((Class)TPBadgeView), "initWithTitle:theme:", &stru_10028DC20, 1);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setHidden:", 1);
    -[PHMultipleCallParticipantLabelView addSubview:](v7, "addSubview:", v14);
    -[PHMultipleCallParticipantLabelView setBadgeView:](v7, "setBadgeView:", v14);
    -[PHMultipleCallParticipantLabelView leadingTrailingLabelSpacing](v7, "leadingTrailingLabelSpacing");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](v7, "participantMarqueeLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    -[PHMultipleCallParticipantLabelView addConstraint:](v7, "addConstraint:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView leadingAnchor](v7, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, v16));
    -[PHMultipleCallParticipantLabelView addConstraint:](v7, "addConstraint:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](v7, "participantMarqueeLabel"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView badgeView](v7, "badgeView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 6.0));

    objc_msgSend(v28, "setActive:", 0);
    v63 = v13;
    v29 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
    badgeViewHiddenLayoutConstraints = v7->_badgeViewHiddenLayoutConstraints;
    v7->_badgeViewHiddenLayoutConstraints = (NSArray *)v29;

    v62 = v28;
    v31 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));
    badgeViewVisibleLayoutConstraints = v7->_badgeViewVisibleLayoutConstraints;
    v7->_badgeViewVisibleLayoutConstraints = (NSArray *)v31;

    -[PHMultipleCallParticipantLabelView addConstraints:](v7, "addConstraints:", v7->_badgeViewHiddenLayoutConstraints);
    -[PHMultipleCallParticipantLabelView addConstraints:](v7, "addConstraints:", v7->_badgeViewVisibleLayoutConstraints);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](v7, "participantMarqueeLabel"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 3, 0, v7, 3, 1.0, 0.0));
    -[PHMultipleCallParticipantLabelView addConstraint:](v7, "addConstraint:", v34);

    v35 = objc_alloc_init((Class)UILabel);
    -[PHAbstractCallParticipantLabelView setStatusLabel:](v7, "setStatusLabel:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    objc_msgSend(v36, "setAccessibilityIdentifier:", CFSTR("PHMultipleCallParticipantLabelView_StatusLabel"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView statusLabelFont](v7, "statusLabelFont"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    objc_msgSend(v38, "setFont:", v37);

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    objc_msgSend(v40, "setTextColor:", v39);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    objc_msgSend(v41, "setTextAlignment:", 1);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    -[PHMultipleCallParticipantLabelView addSubview:](v7, "addSubview:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](v7, "participantMarqueeLabel"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, 10, 0, v45, 10, 1.0, 0.0));
    -[PHMultipleCallParticipantLabelView addConstraint:](v7, "addConstraint:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v47, 6, 0, v7, 6, 1.0, -v16));
    -[PHMultipleCallParticipantLabelView setStatusLabelRightConstraint:](v7, "setStatusLabelRightConstraint:", v48);

    -[PHMultipleCallParticipantLabelView addConstraint:](v7, "addConstraint:", v7->_statusLabelRightConstraint);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](v7, "participantMarqueeLabel"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v49, 3, 0, v50, 3, 1.0, 0.0));
    -[PHMultipleCallParticipantLabelView addConstraint:](v7, "addConstraint:", v51);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](v7, "participantMarqueeLabel"));
    -[PHMultipleCallParticipantLabelView spacingBetweenLabels](v7, "spacingBetweenLabels");
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v52, 5, 1, v53, 6, 1.0, v54));
    -[PHMultipleCallParticipantLabelView setParticipantMarqueeLabelRightConstraint:](v7, "setParticipantMarqueeLabelRightConstraint:", v55);

    -[PHMultipleCallParticipantLabelView addConstraint:](v7, "addConstraint:", v7->_participantMarqueeLabelRightConstraint);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](v7, "participantMarqueeLabel"));
    LODWORD(v57) = 1132068864;
    objc_msgSend(v56, "setContentCompressionResistancePriority:forAxis:", 0, v57);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v7, "statusLabel"));
    LODWORD(v59) = 1148846080;
    objc_msgSend(v58, "setContentCompressionResistancePriority:forAxis:", 0, v59);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHMultipleCallParticipantLabelView;
  -[PHMultipleCallParticipantLabelView dealloc](&v4, "dealloc");
}

- (id)marqueeLabelFont
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[PHMultipleCallParticipantLabelView isDisplayStyleMiniWindow](self, "isDisplayStyleMiniWindow"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[PHUIConfiguration multipleCallParticipantLabelFontMiniWindow](PHUIConfiguration, "multipleCallParticipantLabelFontMiniWindow"));
LABEL_6:
    v5 = (void *)v3;
    return v5;
  }
  if (!-[PHMultipleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[PHUIConfiguration multipleCallParticipantLabelFont](PHUIConfiguration, "multipleCallParticipantLabelFont"));
    goto LABEL_6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 50.0, UIFontWeightMedium));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

- (id)statusLabelFont
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[PHMultipleCallParticipantLabelView isDisplayStyleMiniWindow](self, "isDisplayStyleMiniWindow"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[PHUIConfiguration multipleCallStatusLabelFontMiniWindow](PHUIConfiguration, "multipleCallStatusLabelFontMiniWindow"));
LABEL_6:
    v5 = (void *)v3;
    return v5;
  }
  if (!-[PHMultipleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[PHUIConfiguration multipleCallStatusLabelFont](PHUIConfiguration, "multipleCallStatusLabelFont"));
    goto LABEL_6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 50.0, UIFontWeightMedium));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

- (double)leadingTrailingLabelSpacing
{
  void *v2;
  id v3;
  double v4;
  unint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  v4 = 24.0;
  if (v3 == (id)1)
  {
    v5 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
    if (v5 - 10 <= 5)
      return dbl_10023F0A0[v5 - 10];
  }
  return v4;
}

- (double)spacingBetweenLabels
{
  void *v2;
  id v3;
  double v4;
  unint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  v4 = 15.0;
  if (v3 == (id)1)
  {
    v5 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
    if (v5 - 10 <= 5)
      return dbl_10023F0D0[v5 - 10];
  }
  return v4;
}

- (BOOL)isDisplayStyleMiniWindow
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle") == (id)1;

  return v3;
}

- (BOOL)isDisplayStyleAmbient
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle") == (id)3;

  return v3;
}

- (void)setLabelDescriptor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "strings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedSenderIdentity"));
  v7 = objc_msgSend(v6, "length");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView badgeView](self, "badgeView"));
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "setHidden:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedSenderIdentity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView badgeView](self, "badgeView"));
    objc_msgSend(v11, "setTitle:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView badgeViewVisibleLayoutConstraints](self, "badgeViewVisibleLayoutConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

    v13 = objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView badgeViewHiddenLayoutConstraints](self, "badgeViewHiddenLayoutConstraints"));
  }
  else
  {
    objc_msgSend(v8, "setHidden:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView badgeViewHiddenLayoutConstraints](self, "badgeViewHiddenLayoutConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    v13 = objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView badgeViewVisibleLayoutConstraints](self, "badgeViewVisibleLayoutConstraints"));
  }
  v15 = (void *)v13;
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v13);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  objc_msgSend(v16, "setAttributedOrPlainText:", v5);

}

- (void)setShowsActivitySpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *progressSpinner;
  void *v8;
  UIActivityIndicatorView *v9;
  void *v10;
  void *v11;
  UIActivityIndicatorView *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView progressSpinner](self, "progressSpinner"));

  if (v3)
  {
    if (!v5)
    {
      v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 3);
      progressSpinner = self->_progressSpinner;
      self->_progressSpinner = v6;

      -[UIActivityIndicatorView startAnimating](self->_progressSpinner, "startAnimating");
      -[PHMultipleCallParticipantLabelView addSubview:](self, "addSubview:", self->_progressSpinner);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView progressSpinner](self, "progressSpinner"));
      objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v9 = self->_progressSpinner;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 6, 0, v10, 5, 1.0, -5.0));
      -[PHMultipleCallParticipantLabelView addConstraint:](self, "addConstraint:", v11);

      v12 = self->_progressSpinner;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 10, 0, v13, 10, 1.0, 0.0));
      -[PHMultipleCallParticipantLabelView addConstraint:](self, "addConstraint:", v14);

      -[UIActivityIndicatorView intrinsicContentSize](self->_progressSpinner, "intrinsicContentSize");
      v16 = v15 + 10.0;
      v19 = (id)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView participantMarqueeLabelRightConstraint](self, "participantMarqueeLabelRightConstraint"));
      objc_msgSend(v19, "setConstant:", v16);

    }
  }
  else if (v5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView participantMarqueeLabelRightConstraint](self, "participantMarqueeLabelRightConstraint"));
    objc_msgSend(v17, "setConstant:", 15.0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView progressSpinner](self, "progressSpinner"));
    objc_msgSend(v18, "removeFromSuperview");

    -[PHMultipleCallParticipantLabelView setProgressSpinner:](self, "setProgressSpinner:", 0);
  }
}

- (void)setTextColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHMultipleCallParticipantLabelView;
  v4 = a3;
  -[PHAbstractCallParticipantLabelView setTextColor:](&v6, "setTextColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel", v6.receiver, v6.super_class));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)setActivityState:(unsigned __int16)a3
{
  -[PHMultipleCallParticipantLabelView setActivityState:animated:](self, "setActivityState:animated:", a3, 0);
}

- (void)setActivityState:(unsigned __int16)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  __int16 v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  unsigned int v17;

  v4 = a4;
  v5 = a3;
  if (-[PHAbstractCallParticipantLabelView activityState](self, "activityState") != a3)
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v15 = v5;
      v16 = 1024;
      v17 = -[PHAbstractCallParticipantLabelView activityState](self, "activityState");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Participant label setting selection state to %d (current is %d)", buf, 0xEu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000CB5C;
    v12[3] = &unk_100284AF8;
    v12[4] = self;
    v13 = v5;
    v9 = objc_retainBlock(v12);
    v10 = v9;
    if (v4)
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, 0, 0.5);
    else
      ((void (*)(_QWORD *))v9[2])(v9);
    -[PHMultipleCallParticipantLabelView setShowsActivitySpinner:](self, "setShowsActivitySpinner:", (_DWORD)v5 == 2);
    v11.receiver = self;
    v11.super_class = (Class)PHMultipleCallParticipantLabelView;
    -[PHAbstractCallParticipantLabelView setActivityState:](&v11, "setActivityState:", v5);

  }
}

- (double)labelAlphaValueForActivityState:(unsigned __int16)a3
{
  double result;

  result = 1.0;
  if (a3 < 2u)
    return 0.5;
  return result;
}

- (void)setHidesLabel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[PHAbstractCallParticipantLabelView hidesLabel](self, "hidesLabel") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
    objc_msgSend(v5, "setHidden:", v3);

    v6.receiver = self;
    v6.super_class = (Class)PHMultipleCallParticipantLabelView;
    -[PHAbstractCallParticipantLabelView setHidesLabel:](&v6, "setHidesLabel:", v3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  _BOOL8 v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHMultipleCallParticipantLabelView;
  v4 = a3;
  -[PHMultipleCallParticipantLabelView traitCollectionDidChange:](&v14, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "_backlightLuminance", v14.receiver, v14.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "_backlightLuminance");

  if (v5 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "_backlightLuminance");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));

    v13 = 0;
    if (v11)
    {
      if (objc_msgSend(v11, "length"))
      {
        v12 = objc_msgSend(v11, "characterAtIndex:", 0);
        if (v9 == (id)1 && v12 - 58 > 0xFFFFFFF5)
          v13 = 1;
      }
    }
    -[PHMultipleCallParticipantLabelView setHidesLabel:](self, "setHidesLabel:", v13);

  }
}

- (void)setShowsConferenceParticipantsButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *conferenceParticipantsButton;
  void *v13;
  void *v14;
  UIButton *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  id v23;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v6 = objc_msgSend(v5, "isHeroImageEnabled");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));

    if (v3)
    {
      if (v7)
        return;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 3));
      -[PHMultipleCallParticipantLabelView setConferenceParticipantsButton:](self, "setConferenceParticipantsButton:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemTealColor](UIColor, "systemTealColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
      objc_msgSend(v10, "setTintColor:", v9);

      -[PHMultipleCallParticipantLabelView addSubview:](self, "addSubview:", self->_conferenceParticipantsButton);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIButton addTarget:action:forControlEvents:](self->_conferenceParticipantsButton, "addTarget:action:forControlEvents:", self, "infoButtonTapped:", 64);
      conferenceParticipantsButton = self->_conferenceParticipantsButton;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", conferenceParticipantsButton, 5, 0, v13, 6, 1.0, 9.0));
      -[PHMultipleCallParticipantLabelView addConstraint:](self, "addConstraint:", v14);

      v15 = self->_conferenceParticipantsButton;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 10, 0, v16, 10, 1.0, 0.0));
      -[PHMultipleCallParticipantLabelView addConstraint:](self, "addConstraint:", v17);

      -[UIButton bounds](self->_conferenceParticipantsButton, "bounds");
      v19 = -24.0 - v18 + -9.0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView statusLabelRightConstraint](self, "statusLabelRightConstraint"));
      v23 = v20;
      v21 = v19;
    }
    else
    {
      if (!v7)
        return;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
      objc_msgSend(v22, "removeFromSuperview");

      -[PHMultipleCallParticipantLabelView setConferenceParticipantsButton:](self, "setConferenceParticipantsButton:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHMultipleCallParticipantLabelView statusLabelRightConstraint](self, "statusLabelRightConstraint"));
      v21 = -24.0;
      v23 = v20;
    }
    objc_msgSend(v20, "setConstant:", v21);

  }
}

- (void)infoButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate", a3));
  objc_msgSend(v4, "callLabelInfoLabelWasTappedForLabel:", self);

}

- (void)setShowsCallDetailsViewButton:(BOOL)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Multi-call participant label unexpectedly configured to show details disclosure button", v5, 2u);
  }

}

- (NSLayoutConstraint)participantMarqueeLabelRightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 64, 1);
}

- (void)setParticipantMarqueeLabelRightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSLayoutConstraint)statusLabelRightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStatusLabelRightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (UIActivityIndicatorView)progressSpinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProgressSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (UIButton)conferenceParticipantsButton
{
  return (UIButton *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConferenceParticipantsButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (TPBadgeView)badgeView
{
  return (TPBadgeView *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBadgeView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return (ICSCallDisplayStyleManager *)objc_getProperty(self, a2, 104, 1);
}

- (NSArray)badgeViewHiddenLayoutConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (NSArray)badgeViewVisibleLayoutConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeViewVisibleLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_badgeViewHiddenLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_conferenceParticipantsButton, 0);
  objc_storeStrong((id *)&self->_progressSpinner, 0);
  objc_storeStrong((id *)&self->_statusLabelRightConstraint, 0);
  objc_storeStrong((id *)&self->_participantMarqueeLabelRightConstraint, 0);
}

@end
