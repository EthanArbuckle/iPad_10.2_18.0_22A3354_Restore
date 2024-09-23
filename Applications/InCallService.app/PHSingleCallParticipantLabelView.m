@implementation PHSingleCallParticipantLabelView

- (PHSingleCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3
{
  return -[PHSingleCallParticipantLabelView initWithCallDisplayStyleManager:delegate:](self, "initWithCallDisplayStyleManager:delegate:", a3, 0);
}

- (PHSingleCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3 delegate:(id)a4
{
  id v7;
  PHSingleCallParticipantLabelView *v8;
  PHSingleCallParticipantLabelView *v9;
  UIStackView *v10;
  UIStackView *stackView;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  UITapGestureRecognizer *v37;
  UITapGestureRecognizer *statusLabelTapRecognizer;
  void *v39;
  UITapGestureRecognizer *v40;
  UITapGestureRecognizer *callDetailsGestureRecognizer;
  UILayoutGuide *v42;
  UILayoutGuide *participantAndStatusRectangle;
  UILabel *v44;
  UILabel *secondaryInfoLabel;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v52;

  v7 = a3;
  v52.receiver = self;
  v52.super_class = (Class)PHSingleCallParticipantLabelView;
  v8 = -[PHAbstractCallParticipantLabelView initWithCallDisplayStyleManager:delegate:](&v52, "initWithCallDisplayStyleManager:delegate:", v7, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_callDisplayStyleManager, a3);
    v10 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    stackView = v9->_stackView;
    v9->_stackView = v10;

    -[UIStackView setAxis:](v9->_stackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v9->_stackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v9->_stackView, "setAlignment:", 3);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v9->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v9->_stackView, "setSpacing:", 6.0);
    -[PHSingleCallParticipantLabelView addSubview:](v9, "addSubview:", v9->_stackView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](v9, "participantMarqueeLabel"));
    objc_msgSend(v13, "setTextColor:", v12);

    -[PHSingleCallParticipantLabelView updateLabelScales](v9, "updateLabelScales");
    v14 = objc_alloc_init((Class)UILabel);
    -[PHAbstractCallParticipantLabelView setStatusLabel:](v9, "setStatusLabel:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("PHSingleCallParticipantLabelView_StatusLabel"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](v9, "callDisplayStyleManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", objc_msgSend(v16, "callDisplayStyle")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    objc_msgSend(v18, "setFont:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](v9, "callDisplayStyleManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration statusLabelFontColorForCallDisplayStyle:](PHUIConfiguration, "statusLabelFontColorForCallDisplayStyle:", objc_msgSend(v19, "callDisplayStyle")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    objc_msgSend(v21, "setTextColor:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    objc_msgSend(v22, "setAdjustsFontSizeToFitWidth:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    objc_msgSend(v23, "setMinimumScaleFactor:", 0.75999999);

    if (objc_msgSend(v7, "callDisplayStyle") == (id)3)
      v24 = 1;
    else
      v24 = 2;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    objc_msgSend(v25, "setNumberOfLines:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    LODWORD(v28) = 1144750080;
    objc_msgSend(v27, "setContentCompressionResistancePriority:forAxis:", 0, v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    LODWORD(v30) = 1148846080;
    objc_msgSend(v29, "setContentCompressionResistancePriority:forAxis:", 1, v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    LODWORD(v32) = 1148846080;
    objc_msgSend(v31, "setContentHuggingPriority:forAxis:", 0, v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    LODWORD(v34) = 1148846080;
    objc_msgSend(v33, "setContentHuggingPriority:forAxis:", 1, v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](v9, "stackView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    objc_msgSend(v35, "addArrangedSubview:", v36);

    v37 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v9, "statusLabelTapped:");
    statusLabelTapRecognizer = v9->_statusLabelTapRecognizer;
    v9->_statusLabelTapRecognizer = v37;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v9->_statusLabelTapRecognizer, "setNumberOfTapsRequired:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](v9, "statusLabel"));
    objc_msgSend(v39, "addGestureRecognizer:", v9->_statusLabelTapRecognizer);

    v40 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v9, "callDetailsGestureRecognizerTapped:");
    callDetailsGestureRecognizer = v9->_callDetailsGestureRecognizer;
    v9->_callDetailsGestureRecognizer = v40;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v9->_callDetailsGestureRecognizer, "setNumberOfTapsRequired:", 1);
    -[PHSingleCallParticipantLabelView addGestureRecognizer:](v9, "addGestureRecognizer:", v9->_callDetailsGestureRecognizer);
    -[PHSingleCallParticipantLabelView updateGestureRecognizersEnabled](v9, "updateGestureRecognizersEnabled");
    v42 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    participantAndStatusRectangle = v9->_participantAndStatusRectangle;
    v9->_participantAndStatusRectangle = v42;

    -[PHSingleCallParticipantLabelView addLayoutGuide:](v9, "addLayoutGuide:", v9->_participantAndStatusRectangle);
    v44 = (UILabel *)objc_alloc_init((Class)UILabel);
    secondaryInfoLabel = v9->_secondaryInfoLabel;
    v9->_secondaryInfoLabel = v44;

    -[UILabel setAccessibilityIdentifier:](v9->_secondaryInfoLabel, "setAccessibilityIdentifier:", CFSTR("PHSingleCallParticipantLabelView_SecondaryInfoLabel"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](v9, "callDisplayStyleManager"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", objc_msgSend(v46, "callDisplayStyle")));
    -[UILabel setFont:](v9->_secondaryInfoLabel, "setFont:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](v9, "callDisplayStyleManager"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration statusLabelFontColorForCallDisplayStyle:](PHUIConfiguration, "statusLabelFontColorForCallDisplayStyle:", objc_msgSend(v48, "callDisplayStyle")));
    -[UILabel setTextColor:](v9->_secondaryInfoLabel, "setTextColor:", v49);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_secondaryInfoLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAlpha:](v9->_secondaryInfoLabel, "setAlpha:", 0.0);
    -[PHSingleCallParticipantLabelView addSubview:](v9, "addSubview:", v9->_secondaryInfoLabel);
    -[PHSingleCallParticipantLabelView updateLayoutForCallDisplayStyle:](v9, "updateLayoutForCallDisplayStyle:", objc_msgSend(v7, "callDisplayStyle"));
    -[PHSingleCallParticipantLabelView updateLabelConstraints](v9, "updateLabelConstraints");
    -[PHSingleCallParticipantLabelView setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("PHSingleCallParticipantLabelView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v50, "addObserver:selector:name:object:", v9, "handleContactStoreDidChangeNotification:", CNContactStoreDidChangeNotification, 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[PHSingleCallParticipantLabelView invalidateStatusLabelTimer](self, "invalidateStatusLabelTimer");
  v4.receiver = self;
  v4.super_class = (Class)PHSingleCallParticipantLabelView;
  -[PHSingleCallParticipantLabelView dealloc](&v4, "dealloc");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHSingleCallParticipantLabelView;
  -[PHSingleCallParticipantLabelView layoutSubviews](&v14, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (!objc_msgSend(v3, "callDisplayStyle"))
  {
    -[PHSingleCallParticipantLabelView cachedBannerParticipantLabelWidth](self, "cachedBannerParticipantLabelWidth");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    objc_msgSend(v6, "bounds");
    v8 = v7;

    if (v5 == v8)
      goto LABEL_5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    objc_msgSend(v9, "bounds");
    -[PHSingleCallParticipantLabelView setCachedBannerParticipantLabelWidth:](self, "setCachedBannerParticipantLabelWidth:", v10);

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView updatedParticipantMarqueeLabelFont](self, "updatedParticipantMarqueeLabelFont"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    objc_msgSend(v11, "setFont:", v3);

  }
LABEL_5:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v13 = objc_msgSend(v12, "callDisplayStyle");

  if (v13 == (id)3)
  {
    -[PHSingleCallParticipantLabelView updateAvatarViewConstraints](self, "updateAvatarViewConstraints");
    -[PHSingleCallParticipantLabelView updateLabelAlignmentForCallDisplayStyle:](self, "updateLabelAlignmentForCallDisplayStyle:", 3);
    -[PHSingleCallParticipantLabelView updateHeightConstraints](self, "updateHeightConstraints");
    -[PHSingleCallParticipantLabelView updateViewForCallState](self, "updateViewForCallState");
  }
}

- (void)setDelegate:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHSingleCallParticipantLabelView;
  -[PHAbstractCallParticipantLabelView setDelegate:](&v5, "setDelegate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  -[PHSingleCallParticipantLabelView updateLayoutForCallDisplayStyle:](self, "updateLayoutForCallDisplayStyle:", objc_msgSend(v4, "callDisplayStyle"));

}

- (double)labelsVerticalOffset
{
  void *v2;
  id v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  result = 2.0;
  if (v3 == (id)3)
    result = -2.0;
  if (v3 == (id)1)
    return 0.0;
  return result;
}

- (void)setLabelLayoutState:(int64_t)a3
{
  -[PHSingleCallParticipantLabelView setLabelLayoutState:animated:](self, "setLabelLayoutState:animated:", a3, 0);
}

- (void)setLabelLayoutState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  Block_layout *v7;
  void ***v8;
  Block_layout *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  Block_layout *v14;
  id v15;
  id location;

  if (self->_labelLayoutState != a3)
  {
    v4 = a4;
    self->_labelLayoutState = a3;
    -[PHSingleCallParticipantLabelView updateLayoutGuide](self, "updateLayoutGuide");
    -[PHSingleCallParticipantLabelView updateHeightConstraints](self, "updateHeightConstraints");
    if (v4)
    {
      if (a3 == 1)
        v7 = &stru_100284C70;
      else
        v7 = &stru_100284C50;
      objc_initWeak(&location, self);
      v10 = _NSConcreteStackBlock;
      v11 = 3221225472;
      v12 = sub_100019D30;
      v13 = &unk_100284B68;
      objc_copyWeak(&v15, &location);
      v14 = v7;
      v8 = objc_retainBlock(&v10);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", self, 5243008, v8, 0, 0.300000012);
    }
    else
    {
      if (a3 == 1)
        v9 = &stru_100284C70;
      else
        v9 = &stru_100284C50;
      objc_initWeak(&location, self);
      v10 = _NSConcreteStackBlock;
      v11 = 3221225472;
      v12 = sub_100019D30;
      v13 = &unk_100284B68;
      objc_copyWeak(&v15, &location);
      v14 = v9;
      v8 = objc_retainBlock(&v10);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
      ((void (*)(void ***))v8[2])(v8);
    }

  }
}

- (void)setLabelDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  id v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  Block_layout *v40;
  _QWORD *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  char isKindOfClass;
  void *v55;
  _QWORD v56[4];
  Block_layout *v57;
  id v58;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "strings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelsArray](self, "statusLabelsArray"));
  v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  if ((v7 & 1) != 0)
    goto LABEL_20;
  -[PHSingleCallParticipantLabelView setStatusLabelsArray:](self, "setStatusLabelsArray:", v5);
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    v14 = objc_msgSend(v13, "isHeroImageEnabled");

    if ((v14 & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView traitCollection](self, "traitCollection"));
      v16 = objc_msgSend(v15, "_backlightLuminance");

      if (v16 == (id)1)
        v17 = 0.0;
      else
        v17 = 1.0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      objc_msgSend(v18, "setAlpha:", v17);

    }
    -[PHSingleCallParticipantLabelView invalidateStatusLabelTimer](self, "invalidateStatusLabelTimer");
    -[PHSingleCallParticipantLabelView setCurrentStatusLabelIndex:](self, "setCurrentStatusLabelIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "strings"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
    objc_msgSend(v19, "setAttributedOrPlainText:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView posterNameViewModel](self, "posterNameViewModel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "text"));
    objc_msgSend(v22, "updateStatus:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "strings"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
    v28 = objc_opt_class(NSString, v27);
    LOBYTE(v24) = objc_opt_isKindOfClass(v26, v28);

    if ((v24 & 1) == 0)
      goto LABEL_16;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "strings"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstObject"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("ALERT_ERROR_LABEL"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
    if (objc_msgSend(v30, "isEqualToString:", v32))
    {
      v33 = -[PHSingleCallParticipantLabelView numberOfLinesInStatusLabel](self, "numberOfLinesInStatusLabel");

      if (v33 < 3)
      {
LABEL_15:

LABEL_16:
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryString"));
        objc_msgSend(v38, "setText:", v39);

        if (objc_msgSend(v4, "layoutState") == (id)1)
          v40 = &stru_100284C70;
        else
          v40 = &stru_100284C50;
        objc_initWeak(&location, self);
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_100019D30;
        v56[3] = &unk_100284B68;
        objc_copyWeak(&v58, &location);
        v57 = v40;
        v41 = objc_retainBlock(v56);

        objc_destroyWeak(&v58);
        objc_destroyWeak(&location);
        ((void (*)(_QWORD *))v41[2])(v41);

        goto LABEL_20;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("ALERT_ERROR_LABEL_NO_LINE_BREAK"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
      objc_msgSend(v34, "setAttributedOrPlainText:", v36);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView posterNameViewModel](self, "posterNameViewModel"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "text"));
      objc_msgSend(v31, "updateStatus:", v37);

    }
    goto LABEL_15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  objc_msgSend(v8, "setAttributedOrPlainText:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView posterNameViewModel](self, "posterNameViewModel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
  objc_msgSend(v10, "updateStatus:", v12);

  -[PHSingleCallParticipantLabelView setCurrentStatusLabelIndex:](self, "setCurrentStatusLabelIndex:", 0);
  -[PHSingleCallParticipantLabelView invalidateStatusLabelTimer](self, "invalidateStatusLabelTimer");
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    -[PHSingleCallParticipantLabelView scheduleStatusLabelTimer](self, "scheduleStatusLabelTimer");
LABEL_20:
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedSenderIdentity"));
  v43 = objc_msgSend(v42, "length");

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView badgeView](self, "badgeView"));

    if (v44)
    {
      v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedSenderIdentity"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView badgeView](self, "badgeView"));
      objc_msgSend(v46, "setTitle:", v45);

    }
    else
    {
      v47 = objc_alloc((Class)TPBadgeView);
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedSenderIdentity"));
      v45 = objc_msgSend(v47, "initWithTitle:theme:", v48, 1);

      objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v45, "setHidden:", -[PHAbstractCallParticipantLabelView hidesLabel](self, "hidesLabel"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "arrangedSubviews"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "firstObject"));
      v53 = objc_opt_class(TPBadgeView, v52);
      isKindOfClass = objc_opt_isKindOfClass(v51, v53);

      if ((isKindOfClass & 1) == 0)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
        objc_msgSend(v55, "insertArrangedSubview:atIndex:", v45, 0);

      }
      -[PHSingleCallParticipantLabelView setBadgeView:](self, "setBadgeView:", v45);
    }

    -[PHSingleCallParticipantLabelView updatePosterBadgeView](self, "updatePosterBadgeView");
  }
  -[PHSingleCallParticipantLabelView setLabelLayoutState:animated:](self, "setLabelLayoutState:animated:", objc_msgSend(v4, "layoutState"), 1);

}

- (int64_t)numberOfLinesInStatusLabel
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

  -[PHSingleCallParticipantLabelView frame](self, "frame");
  v4 = v3 + -48.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "font"));
  objc_msgSend(v6, "lineHeight");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));

  v17 = NSFontAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "font"));
  v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v13, 0, v4, 1.79769313e308);
  v15 = v14;

  return (uint64_t)(v15 / v8);
}

- (double)getParticipantsViewHeight
{
  double v3;
  double v4;
  double v5;

  -[PHSingleCallParticipantLabelView getStatusLabelHeight](self, "getStatusLabelHeight");
  v4 = v3;
  -[PHSingleCallParticipantLabelView getParticipantsMarqueeLabelHeight](self, "getParticipantsMarqueeLabelHeight");
  return v4 + v5;
}

- (double)getStatusLabelHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));

  if (!v3)
    return 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  objc_msgSend(v4, "intrinsicContentSize");
  v6 = v5;

  return v6;
}

- (double)getParticipantsMarqueeLabelHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));

  if (!v3)
    return 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
  objc_msgSend(v4, "intrinsicContentSize");
  v6 = v5;

  return v6;
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
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PHSingleCallParticipantLabelView;
  v4 = a3;
  -[PHSingleCallParticipantLabelView traitCollectionDidChange:](&v21, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "_backlightLuminance", v21.receiver, v21.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "_backlightLuminance");

  if (v5 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "_backlightLuminance");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
    v11 = v10;
    if (v9 == (id)1)
    {
      v12 = 0.0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ALERT_ERROR_LABEL"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
      if ((objc_msgSend(v13, "isEqualToString:", v15) & 1) != 0)
      {

LABEL_9:
        return;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "text"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ALERT_ERROR_LABEL_NO_LINE_BREAK"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
      v20 = objc_msgSend(v17, "isEqualToString:", v19);

      if ((v20 & 1) != 0)
        return;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      v11 = v10;
      v12 = 1.0;
    }
    objc_msgSend(v10, "setAlpha:", v12);
    goto LABEL_9;
  }
}

- (void)setHidesLabel:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  if (-[PHAbstractCallParticipantLabelView hidesLabel](self, "hidesLabel") != a3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000117E8;
    v6[3] = &unk_100284C98;
    v6[4] = self;
    v7 = v3;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);
    v5.receiver = self;
    v5.super_class = (Class)PHSingleCallParticipantLabelView;
    -[PHAbstractCallParticipantLabelView setHidesLabel:](&v5, "setHidesLabel:", v3);
  }
}

- (void)hideBadgesOnly
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000118D0;
  v2[3] = &unk_100284898;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)setActivityState:(unsigned __int16)a3
{
  -[PHSingleCallParticipantLabelView setActivityState:animated:](self, "setActivityState:animated:", a3, 0);
}

- (void)setActivityState:(unsigned __int16)a3 animated:(BOOL)a4
{
  uint64_t v4;
  objc_super v6;

  v4 = a3;
  if (-[PHAbstractCallParticipantLabelView activityState](self, "activityState", a3, a4) != a3)
  {
    -[PHAbstractCallParticipantLabelView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v4 > 1);
    v6.receiver = self;
    v6.super_class = (Class)PHSingleCallParticipantLabelView;
    -[PHAbstractCallParticipantLabelView setActivityState:](&v6, "setActivityState:", v4);
  }
}

- (void)setShowsConferenceParticipantsButton:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[3];

  v3 = a3;
  v5 = -[PHSingleCallParticipantLabelView shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));

  if (v5 || !v3)
  {
    if (v6)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
      objc_msgSend(v26, "removeFromSuperview");

      -[PHSingleCallParticipantLabelView setConferenceParticipantsButton:](self, "setConferenceParticipantsButton:", 0);
    }
  }
  else if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 3));
    -[PHSingleCallParticipantLabelView setConferenceParticipantsButton:](self, "setConferenceParticipantsButton:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemTealColor](UIColor, "systemTealColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
    objc_msgSend(v9, "setTintColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
    LODWORD(v12) = 1148846080;
    objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 0, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
    LODWORD(v14) = 1148846080;
    objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 1, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, "infoButtonTapped:", 64);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
    -[PHSingleCallParticipantLabelView addSubview:](self, "addSubview:", v16);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstBaselineAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v33[0] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -10.0));
    v33[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingAnchor](self, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:constant:", v23, -24.0));
    v33[2] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 3));
    -[PHSingleCallParticipantLabelView addConstraints:](self, "addConstraints:", v25);

  }
  -[PHSingleCallParticipantLabelView updateLabelTrailingConstraints](self, "updateLabelTrailingConstraints");
}

- (void)infoButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate", a3));
  objc_msgSend(v4, "callLabelInfoLabelWasTappedForLabel:", self);

}

- (BOOL)showsCallDetailsViewButton
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
  v3 = v2 != 0;

  return v3;
}

- (void)setShowsCallDetailsViewButton:(BOOL)a3
{
  void *v4;
  void *v5;

  if (a3 && !-[PHSingleCallParticipantLabelView shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));

    if (v5)
      goto LABEL_5;
    -[PHSingleCallParticipantLabelView setUpCallDetailsViewButton](self, "setUpCallDetailsViewButton");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
    objc_msgSend(v4, "removeFromSuperview");

    -[PHSingleCallParticipantLabelView setCallDetailsViewButton:](self, "setCallDetailsViewButton:", 0);
  }
  -[PHSingleCallParticipantLabelView updateGestureRecognizersEnabled](self, "updateGestureRecognizersEnabled");
LABEL_5:
  -[PHSingleCallParticipantLabelView updateLabelTrailingConstraints](self, "updateLabelTrailingConstraints");
}

- (void)setUpCallDetailsViewButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 4));
  -[PHSingleCallParticipantLabelView setCallDetailsViewButton:](self, "setCallDetailsViewButton:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v5, "setTintColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
  LODWORD(v9) = 1148846080;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
  LODWORD(v11) = 1148846080;
  objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 1, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
  -[PHSingleCallParticipantLabelView addSubview:](self, "addSubview:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerYAnchor](self, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v22[0] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingAnchor](self, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -20.0));
  v22[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  -[PHSingleCallParticipantLabelView addConstraints:](self, "addConstraints:", v21);

}

- (BOOL)setUpFirstAndLastNameLabelsIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *firstNameLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  UILabel *lastNameLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  UILabel *v21;
  UILabel *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
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
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[11];

  if ((id)-[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView contact](self, "contact"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter posterNameComponentsForContact:](CNContactFormatter, "posterNameComponentsForContact:", v4));

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondNameComponent"));
      LOBYTE(v3) = v6 != 0;

      if (v6)
      {
        firstNameLabel = self->_firstNameLabel;
        if (!firstNameLabel)
        {
          if (self->_lastNameLabel)
          {
            firstNameLabel = 0;
          }
          else
          {
            v8 = (UILabel *)objc_alloc_init((Class)UILabel);
            v9 = self->_firstNameLabel;
            self->_firstNameLabel = v8;

            -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_firstNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            -[UILabel setTextAlignment:](self->_firstNameLabel, "setTextAlignment:", 1);
            -[UILabel setNumberOfLines:](self->_firstNameLabel, "setNumberOfLines:", 1);
            -[UILabel setAdjustsFontSizeToFitWidth:](self->_firstNameLabel, "setAdjustsFontSizeToFitWidth:", 1);
            -[UILabel _setExtremeSizingEnabled:](self->_firstNameLabel, "_setExtremeSizingEnabled:", 1);
            -[UILabel setAlpha:](self->_firstNameLabel, "setAlpha:", 0.0);
            -[PHSingleCallParticipantLabelView addSubview:](self, "addSubview:", self->_firstNameLabel);
            v10 = (UILabel *)objc_alloc_init((Class)UILabel);
            lastNameLabel = self->_lastNameLabel;
            self->_lastNameLabel = v10;

            -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_lastNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            -[UILabel setTextAlignment:](self->_lastNameLabel, "setTextAlignment:", 1);
            -[UILabel setNumberOfLines:](self->_lastNameLabel, "setNumberOfLines:", 1);
            -[UILabel setAdjustsFontSizeToFitWidth:](self->_lastNameLabel, "setAdjustsFontSizeToFitWidth:", 1);
            -[UILabel _setExtremeSizingEnabled:](self->_lastNameLabel, "_setExtremeSizingEnabled:", 1);
            -[UILabel setAlpha:](self->_lastNameLabel, "setAlpha:", 0.0);
            -[PHSingleCallParticipantLabelView addSubview:](self, "addSubview:", self->_lastNameLabel);
            v74 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_firstNameLabel, "topAnchor"));
            v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView topAnchor](self, "topAnchor"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintGreaterThanOrEqualToAnchor:", v73));
            v77[0] = v72;
            v70 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_firstNameLabel, "leadingAnchor"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "leadingAnchor"));
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintGreaterThanOrEqualToAnchor:", v69));
            v77[1] = v68;
            v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_firstNameLabel, "centerXAnchor"));
            v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "centerXAnchor"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
            v77[2] = v64;
            v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_firstNameLabel, "trailingAnchor"));
            v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "trailingAnchor"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintLessThanOrEqualToAnchor:", v61));
            v77[3] = v60;
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_firstNameLabel, "trailingAnchor"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingAnchor](self, "trailingAnchor"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
            v77[4] = v57;
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_firstNameLabel, "bottomAnchor"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_lastNameLabel, "topAnchor"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 16.0));
            v77[5] = v54;
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_lastNameLabel, "leadingAnchor"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintGreaterThanOrEqualToAnchor:", v51));
            v77[6] = v50;
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_lastNameLabel, "centerXAnchor"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "centerXAnchor"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
            v77[7] = v46;
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_lastNameLabel, "trailingAnchor"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:", v43));
            v77[8] = v42;
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_lastNameLabel, "firstBaselineAnchor"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstBaselineAnchor"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
            v77[9] = v12;
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_lastNameLabel, "bottomAnchor"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v15));
            v77[10] = v16;
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 11));
            +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

            firstNameLabel = self->_firstNameLabel;
          }
        }
        v18 = self->_lastNameLabel;
        v76[0] = firstNameLabel;
        v76[1] = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 2));
        v20 = (UILabel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v5, "emphasizedNameComponentIndex")));

        v21 = self->_firstNameLabel;
        if (v20 == v21)
          v21 = self->_lastNameLabel;
        v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView updatedParticipantMarqueeLabelFont](self, "updatedParticipantMarqueeLabelFont"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "fontWithSize:", 48.0));
        -[UILabel setFont:](v22, "setFont:", v24);

        -[UILabel setMinimumFontSize:](v22, "setMinimumFontSize:", 25.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "textColor"));
        -[UILabel setTextColor:](v22, "setTextColor:", v26);

        LODWORD(v27) = 1132134400;
        -[UILabel setContentCompressionResistancePriority:forAxis:](v22, "setContentCompressionResistancePriority:forAxis:", 1, v27);
        -[UILabel setFont:](v20, "setFont:", v23);
        -[UILabel setMinimumFontSize:](v20, "setMinimumFontSize:", 38.0);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "textColor"));
        -[UILabel setTextColor:](v20, "setTextColor:", v29);

        LODWORD(v30) = 1132068864;
        -[UILabel setContentCompressionResistancePriority:forAxis:](v20, "setContentCompressionResistancePriority:forAxis:", 1, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstNameComponent"));
        -[UILabel setText:](self->_firstNameLabel, "setText:", v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondNameComponent"));
        -[UILabel setText:](self->_lastNameLabel, "setText:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstNameComponent"));
        v75[0] = v33;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondNameComponent"));
        v75[1] = v34;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 2));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v5, "singleNameComponentIndex")));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
        objc_msgSend(v37, "setText:", v36);

      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (void)showFirstAndLastNameAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  if (self->_firstNameLabel && self->_lastNameLabel)
  {
    if (a3)
    {
      CGAffineTransformMakeScale(&v17, 0.9, 0.9);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView firstNameLabel](self, "firstNameLabel"));
      v16 = v17;
      objc_msgSend(v4, "setTransform:", &v16);

      CGAffineTransformMakeScale(&v15, 0.9, 0.9);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView lastNameLabel](self, "lastNameLabel"));
      v14 = v15;
      objc_msgSend(v5, "setTransform:", &v14);

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100012B3C;
      v13[3] = &unk_100284898;
      v13[4] = self;
      +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, v13, &stru_100284CD8, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100012BA4;
      v12[3] = &unk_100284898;
      v12[4] = self;
      +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, v12, &stru_100284CF8, 0.5, 0.0, 2.0, 300.0, 50.0, 0.0);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100012C20;
      v11[3] = &unk_100284898;
      v11[4] = self;
      +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, v11, &stru_100284D18, 0.8, 0.25, 2.0, 300.0, 50.0, 0.0);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      objc_msgSend(v6, "setAlpha:", 0.0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView badgeView](self, "badgeView"));
      objc_msgSend(v7, "setAlpha:", 0.0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      objc_msgSend(v8, "setAlpha:", 0.0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView firstNameLabel](self, "firstNameLabel"));
      objc_msgSend(v9, "setAlpha:", 1.0);

      v10 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView lastNameLabel](self, "lastNameLabel"));
      objc_msgSend(v10, "setAlpha:", 1.0);

    }
  }
}

- (void)hideFirstAndLastNameAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  CGAffineTransform v19;
  CGAffineTransform v20;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView firstNameLabel](self, "firstNameLabel"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView lastNameLabel](self, "lastNameLabel"));

    if (v7)
    {
      if (v3)
      {
        CGAffineTransformMakeScale(&v20, 0.9, 0.9);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
        v19 = v20;
        objc_msgSend(v8, "setTransform:", &v19);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
        objc_msgSend(v9, "setAlpha:", 0.0);

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView badgeView](self, "badgeView"));
        objc_msgSend(v10, "setAlpha:", 0.0);

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100012F98;
        v18[3] = &unk_100284898;
        v18[4] = self;
        +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, v18, &stru_100284D38, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100013048;
        v17[3] = &unk_100284898;
        v17[4] = self;
        +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, v17, &stru_100284D58, 0.5, 0.0, 2.0, 300.0, 50.0, 0.0);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000130A8;
        v16[3] = &unk_100284898;
        v16[4] = self;
        +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, v16, &stru_100284D78, 0.8, 0.25, 2.0, 300.0, 50.0, 0.0);
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView firstNameLabel](self, "firstNameLabel"));
        objc_msgSend(v11, "setAlpha:", 0.0);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView lastNameLabel](self, "lastNameLabel"));
        objc_msgSend(v12, "setAlpha:", 0.0);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
        objc_msgSend(v13, "setAlpha:", 1.0);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView badgeView](self, "badgeView"));
        objc_msgSend(v14, "setAlpha:", 1.0);

        v15 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
        objc_msgSend(v15, "setAlpha:", 1.0);

      }
    }
  }
}

- (void)callDetailsGestureRecognizerTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate", a3));
  objc_msgSend(v4, "callLabelDetailsGestureRecognizerTappedForLabel:", self);

}

- (void)setTextColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHSingleCallParticipantLabelView;
  v4 = a3;
  -[PHAbstractCallParticipantLabelView setTextColor:](&v8, "setTextColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel", v8.receiver, v8.super_class));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  objc_msgSend(v6, "setTextColor:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
  objc_msgSend(v7, "setTextColor:", v4);

}

- (void)setStatusLabelTextColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView posterNameViewModel](self, "posterNameViewModel"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
    objc_msgSend(v5, "setTextColor:", v6);

  }
}

- (void)setParticipantMarqueeLabelTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)setStatusLabelTextFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  objc_msgSend(v5, "setFont:", v4);

}

- (void)setParticipantMarqueeLabelFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
  objc_msgSend(v5, "setFont:", v4);

}

- (CNContact)contact
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  v5 = objc_opt_class(_TtC13InCallService19BlurrableAvatarView, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  if ((isKindOfClass & 1) == 0)
  {
    v9 = objc_opt_class(_TtC13InCallService17AmbientAvatarView, v7);
    v10 = objc_opt_isKindOfClass(v8, v9);

    if ((v10 & 1) == 0)
    {
      v11 = 0;
      return (CNContact *)v11;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contact"));

  return (CNContact *)v11;
}

- (void)setContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC13InCallService17AmbientAvatarView *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  unsigned int v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  unsigned int v33;
  _TtC13InCallService19BlurrableAvatarView *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  id v61;
  NSObject *v62;
  unsigned int v63;
  id v64;
  void *v65;
  unsigned int v66;
  char v67;
  void *v68;
  id v69;
  id v70;
  NSObject *v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  char v76;
  uint8_t buf[4];
  _QWORD v78[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  v6 = v5;
  if (!v4)
  {
    if (!v5)
      goto LABEL_26;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    v9 = objc_opt_class(_TtC13InCallService19BlurrableAvatarView, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v24 = objc_opt_class(_TtC13InCallService17AmbientAvatarView, v23);
      isKindOfClass = objc_opt_isKindOfClass(v22, v24);

      if ((isKindOfClass & 1) == 0)
        goto LABEL_26;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    objc_msgSend(v26, "removeFromSuperview");

    -[PHSingleCallParticipantLabelView setAvatarView:](self, "setAvatarView:", 0);
    -[PHSingleCallParticipantLabelView updateLayoutGuide](self, "updateLayoutGuide");
    goto LABEL_24;
  }
  if (!v5)
  {
    if (!objc_msgSend(v4, "imageDataAvailable"))
      goto LABEL_10;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
    v11 = objc_msgSend(v10, "callDisplayStyle");

    if (v11 == (id)3)
    {
      v12 = -[AmbientAvatarView initWithContact:]([_TtC13InCallService17AmbientAvatarView alloc], "initWithContact:", v4);
      -[PHSingleCallParticipantLabelView setAvatarView:](self, "setAvatarView:", v12);
    }
    else
    {
      v12 = (_TtC13InCallService17AmbientAvatarView *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView currentIMNicknameMatchingContact:](self, "currentIMNicknameMatchingContact:", v4));
      if (+[SensitivityFeatureFlags isSensitivityAvatarTreatmentEnabled](_TtC13InCallService23SensitivityFeatureFlags, "isSensitivityAvatarTreatmentEnabled"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientAvatarView avatar](v12, "avatar"));
        v28 = objc_msgSend(v27, "contentIsSensitive");

        v29 = sub_1000C5588();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v78[0]) = v28;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for currentNickname returning %d", buf, 8u);
        }
      }
      else
      {
        v31 = sub_1000C5588();
        v30 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for currentNickname not performing check", buf, 2u);
        }
        v28 = 0;
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
      v33 = objc_msgSend(v32, "forceBlurCurrentPoster");

      v34 = -[BlurrableAvatarView initWithContact:wantsBlur:isCommunicationSafetyEnabled:]([_TtC13InCallService19BlurrableAvatarView alloc], "initWithContact:wantsBlur:isCommunicationSafetyEnabled:", v4, v33 | v28, +[SensitivityFeatureFlags isCommunicationSafetyEnabled](_TtC13InCallService23SensitivityFeatureFlags, "isCommunicationSafetyEnabled"));
      -[PHSingleCallParticipantLabelView setAvatarView:](self, "setAvatarView:", v34);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    -[PHSingleCallParticipantLabelView addSubview:](self, "addSubview:", v36);

    -[PHSingleCallParticipantLabelView updateLayoutGuide](self, "updateLayoutGuide");
    -[PHSingleCallParticipantLabelView updateAvatarViewConstraints](self, "updateAvatarViewConstraints");
LABEL_24:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
    -[PHSingleCallParticipantLabelView updateLabelAlignmentForCallDisplayStyle:](self, "updateLabelAlignmentForCallDisplayStyle:", objc_msgSend(v19, "callDisplayStyle"));
    goto LABEL_25;
  }

LABEL_10:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  v15 = objc_opt_class(_TtC13InCallService19BlurrableAvatarView, v14);
  v16 = objc_opt_isKindOfClass(v13, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  v19 = v17;
  if ((v16 & 1) != 0)
  {
LABEL_13:
    objc_msgSend(v17, "setContact:", v4);
LABEL_25:

    goto LABEL_26;
  }
  v20 = objc_opt_class(_TtC13InCallService17AmbientAvatarView, v18);
  v21 = objc_opt_isKindOfClass(v19, v20);

  if ((v21 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    v19 = v17;
    goto LABEL_13;
  }
LABEL_26:
  -[PHSingleCallParticipantLabelView setUpFirstAndLastNameLabelsIfPossible](self, "setUpFirstAndLastNameLabelsIfPossible");
  if (-[PHSingleCallParticipantLabelView shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    v38 = objc_msgSend(v37, "isNameAndPhotoC3Enabled");

    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "frontmostCall"));

      if (!v4)
        goto LABEL_56;
      if (!v40)
        goto LABEL_56;
      if (objc_msgSend(v40, "status") != 1)
        goto LABEL_56;
      v41 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      if (!v41)
        goto LABEL_56;
      v42 = (void *)v41;
      v43 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v45 = objc_opt_class(_TtC13InCallService19BlurrableAvatarView, v44);
      if ((objc_opt_isKindOfClass(v43, v45) & 1) == 0)
        goto LABEL_55;
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v47 = objc_msgSend(v46, "currentCallCount");

      if (v47 != (id)1)
      {
LABEL_56:

        goto LABEL_57;
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView sharedProfileStateOracle](self, "sharedProfileStateOracle"));

      if (!v48)
      {
        v49 = sub_1000C5588();
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "contactIdentifier"));
          *(_DWORD *)buf = 138412290;
          v78[0] = v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "SNAP: creating a new oracle for contactIdentifier: %@", buf, 0xCu);

        }
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v40));
        v53 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v52);
        v54 = objc_msgSend(objc_alloc((Class)CNSharedProfileStateOracle), "initWithContact:contactStore:", v4, v53);
        -[PHSingleCallParticipantLabelView setSharedProfileStateOracle:](self, "setSharedProfileStateOracle:", v54);

      }
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "cnAvatarView"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView sharedProfileStateOracle](self, "sharedProfileStateOracle"));
      objc_msgSend(v56, "setSharedProfileStateOracle:", v57);

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView sharedProfileStateOracle](self, "sharedProfileStateOracle"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "pendingNickname"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "avatar"));

      if (+[SensitivityFeatureFlags isSensitivityAvatarTreatmentEnabled](_TtC13InCallService23SensitivityFeatureFlags, "isSensitivityAvatarTreatmentEnabled"))
      {
        v60 = objc_msgSend(v42, "contentIsSensitive");
        v61 = sub_1000C5588();
        v62 = objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v63 = objc_msgSend(v55, "wantsBlur");
          *(_DWORD *)buf = 67109376;
          LODWORD(v78[0]) = v60;
          WORD2(v78[0]) = 1024;
          *(_DWORD *)((char *)v78 + 6) = v63;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for pendingNickname returning %d currentlyBlurred=%d", buf, 0xEu);
        }
      }
      else
      {
        v64 = sub_1000C5588();
        v62 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for pendingNickname not performing checks", buf, 2u);
        }
        v60 = 0;
      }

      v65 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
      v66 = objc_msgSend(v65, "forceBlurNewPoster");

      v67 = 0;
      if (v42 && v66 | v60)
      {
        if ((objc_msgSend(v55, "wantsBlur") & 1) == 0)
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView sharedProfileStateOracle](self, "sharedProfileStateOracle"));
          v69 = objc_msgSend(v68, "avatarViewAnimationTypeForEffectiveState");

          v67 = 0;
          if (v69)
          {
            if (v69 != (id)1)
              goto LABEL_52;
            v67 = 1;
          }
          objc_msgSend(v55, "setWantsBlur:", 1);
          goto LABEL_52;
        }
        v67 = 0;
      }
LABEL_52:
      v70 = sub_1000C5588();
      v71 = objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "SNAP: asking avatarView to do a coin flip", buf, 2u);
      }

      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_100013C44;
      v73[3] = &unk_100284DA0;
      v76 = v67;
      v74 = v55;
      v75 = v56;
      v72 = v56;
      v43 = v55;
      objc_msgSend(v72, "performTransitionAnimationWithCompletion:", v73);

LABEL_55:
      goto LABEL_56;
    }
  }
LABEL_57:

}

- (void)handleContactStoreDidChangeNotification:(id)a3
{
  -[PHSingleCallParticipantLabelView setSharedProfileStateOracle:](self, "setSharedProfileStateOracle:", 0);
}

- (unint64_t)ambientLayout
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "participantLabelShouldShowLargeAvatar");

  return v3;
}

- (void)updateLabelsOrderAndLayout
{
  -[PHSingleCallParticipantLabelView updateLabelsOrder](self, "updateLabelsOrder");
  -[PHSingleCallParticipantLabelView updateLayoutGuide](self, "updateLayoutGuide");
  -[PHSingleCallParticipantLabelView updateHeightConstraints](self, "updateHeightConstraints");
}

- (void)updateLabelsOrder
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = -[PHSingleCallParticipantLabelView labelsOrder](self, "labelsOrder");
  if (-[PHSingleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient"))
  {
    v4 = (id)-[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == (id)1;
  }
  else if (-[PHSingleCallParticipantLabelView shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
    if (-[PHSingleCallParticipantLabelView inBrandedCall](self, "inBrandedCall")
      || -[PHSingleCallParticipantLabelView inCallDirectoryCall](self, "inCallDirectoryCall"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      objc_msgSend(v5, "setMarqueeEnabled:", 1);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      objc_msgSend(v6, "setMarqueeRunning:", 1);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
      objc_msgSend(v7, "setMarqueeEnabled:", 1);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
      v9 = v8;
      v10 = 1;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      objc_msgSend(v11, "setMarqueeEnabled:", 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      objc_msgSend(v12, "setMarqueeRunning:", 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
      objc_msgSend(v13, "setMarqueeEnabled:", 0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
      v9 = v8;
      v10 = 0;
    }
    objc_msgSend(v8, "setMarqueeRunning:", v10);

    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  -[PHSingleCallParticipantLabelView setLabelsOrder:](self, "setLabelsOrder:", v4);
  if (v3 != (void *)-[PHSingleCallParticipantLabelView labelsOrder](self, "labelsOrder"))
    -[PHSingleCallParticipantLabelView updateLabelConstraints](self, "updateLabelConstraints");
}

- (double)_distanceFromParticipantNameBaseLineToStatus
{
  void *v2;
  id v3;
  unint64_t v4;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  if (!v3)
    return -24.0;
  v4 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  result = -34.0;
  if (!v4)
    return -26.0;
  return result;
}

- (BOOL)_statusLabelStringWillFit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  NSAttributedStringKey v10;
  void *v11;

  v10 = NSFontAttributeName;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", objc_msgSend(v5, "callDisplayStyle")));
  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  LODWORD(v8) = 15.0;
  LOBYTE(self) = -[PHSingleCallParticipantLabelView _statusLabelStringWillFit:attributes:padding:](self, "_statusLabelStringWillFit:attributes:padding:", v4, v7, v8);

  return (char)self;
}

- (BOOL)_statusLabelStringWillFit:(id)a3 attributes:(id)a4 padding:(float)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  objc_msgSend(a3, "sizeWithAttributes:", a4);
  v8 = v7;
  -[PHSingleCallParticipantLabelView intrinsicContentSize](self, "intrinsicContentSize");
  v10 = v9 + -48.0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  objc_msgSend(v11, "bounds");
  v13 = v10 - (v12 + a5);

  return v13 > v8;
}

- (void)setIcon:(id)a3
{
  id v4;
  UIImageView *iconView;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  iconView = self->_iconView;
  v20 = v4;
  if (v4 && !iconView)
  {
    v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    v7 = self->_iconView;
    self->_iconView = v6;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHSingleCallParticipantLabelView addSubview:](self, "addSubview:", self->_iconView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView iconView](self, "iconView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "heightAnchor"));
    -[PHSingleCallParticipantLabelView voipIconEdge](self, "voipIconEdge");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:"));
    -[PHSingleCallParticipantLabelView setAppIconHeightConstraint:](self, "setAppIconHeightConstraint:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconHeightConstraint](self, "appIconHeightConstraint"));
    objc_msgSend(v11, "setActive:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView iconView](self, "iconView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "widthAnchor"));
    -[PHSingleCallParticipantLabelView voipIconEdge](self, "voipIconEdge");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:"));
    -[PHSingleCallParticipantLabelView setAppIconWidthConstraint:](self, "setAppIconWidthConstraint:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconWidthConstraint](self, "appIconWidthConstraint"));
    objc_msgSend(v15, "setActive:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_iconView, "centerYAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](self->_stackView, "centerYAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    objc_msgSend(v18, "setActive:", 1);

    -[PHSingleCallParticipantLabelView updateStackViewHorizontalConstraintsWithVoIPAppIcon](self, "updateStackViewHorizontalConstraintsWithVoIPAppIcon");
    iconView = self->_iconView;
  }
  if (iconView)
  {
    -[UIImageView setImage:](iconView, "setImage:", v20);
    -[PHSingleCallParticipantLabelView updateStackViewHorizontalConstraintsWithVoIPAppIcon](self, "updateStackViewHorizontalConstraintsWithVoIPAppIcon");
  }
  -[PHSingleCallParticipantLabelView updatePosterBadgeView](self, "updatePosterBadgeView");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  -[PHSingleCallParticipantLabelView updateLabelTextAlignmentForCallDisplayStyle:](self, "updateLabelTextAlignmentForCallDisplayStyle:", objc_msgSend(v19, "callDisplayStyle"));

}

- (void)updateIconSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView iconView](self, "iconView"));

  if (v3)
  {
    -[PHSingleCallParticipantLabelView voipIconEdge](self, "voipIconEdge");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconHeightConstraint](self, "appIconHeightConstraint"));
    objc_msgSend(v6, "setConstant:", v5);

    -[PHSingleCallParticipantLabelView voipIconEdge](self, "voipIconEdge");
    v8 = v7;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconWidthConstraint](self, "appIconWidthConstraint"));
    objc_msgSend(v9, "setConstant:", v8);

  }
}

- (double)voipIconEdge
{
  void *v2;
  id v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  result = 16.0;
  if (v3 == (id)3)
    result = 26.0;
  if (!v3)
    return 13.0;
  return result;
}

- (double)voipIconMarginH
{
  void *v2;
  id v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  result = 5.0;
  if (v3 == (id)3)
    result = 8.0;
  if (!v3)
    return 4.0;
  return result;
}

- (void)setBusinessLogo:(id)a3 isPerson:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  UIImageView *businessLogoView;
  UIImageView *v19;
  UIImageView *v20;
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
  double v32;
  double v33;
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
  UIImageView *v44;
  id v45;

  v4 = a4;
  v45 = a3;
  if (!-[PHSingleCallParticipantLabelView shouldUseHeroImageLayout](self, "shouldUseHeroImageLayout"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
    v7 = objc_msgSend(v6, "callDisplayStyle");

    if (v7 != (id)3)
    {
      businessLogoView = self->_businessLogoView;
      if (v45 && !businessLogoView)
      {
        v19 = (UIImageView *)objc_alloc_init((Class)UIImageView);
        v20 = self->_businessLogoView;
        self->_businessLogoView = v19;

        -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_businessLogoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[PHSingleCallParticipantLabelView addSubview:](self, "addSubview:", self->_businessLogoView);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoView](self, "businessLogoView"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "heightAnchor"));
        -[PHSingleCallParticipantLabelView businessLogoEdge](self, "businessLogoEdge");
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:"));
        -[PHSingleCallParticipantLabelView setBusinessLogoHeightConstraint:](self, "setBusinessLogoHeightConstraint:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoHeightConstraint](self, "businessLogoHeightConstraint"));
        objc_msgSend(v24, "setActive:", 1);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoView](self, "businessLogoView"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "widthAnchor"));
        -[PHSingleCallParticipantLabelView businessLogoEdge](self, "businessLogoEdge");
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:"));
        -[PHSingleCallParticipantLabelView setBusinessLogoWidthConstraint:](self, "setBusinessLogoWidthConstraint:", v27);

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoWidthConstraint](self, "businessLogoWidthConstraint"));
        objc_msgSend(v28, "setActive:", 1);

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_businessLogoView, "centerYAnchor"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](self->_stackView, "centerYAnchor"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
        objc_msgSend(v31, "setActive:", 1);

        -[PHSingleCallParticipantLabelView updateStackViewHorizontalConstraintsWithBusinessLogo](self, "updateStackViewHorizontalConstraintsWithBusinessLogo");
        businessLogoView = self->_businessLogoView;
      }
      if (businessLogoView)
      {
        if (v45)
        {
          -[UIImageView setImage:](businessLogoView, "setImage:");
          -[PHSingleCallParticipantLabelView businessLogoCornerRadius](self, "businessLogoCornerRadius");
          v33 = v32;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_businessLogoView, "layer"));
          objc_msgSend(v34, "setCornerRadius:", v33);

          v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_businessLogoView, "layer"));
          objc_msgSend(v35, "setMasksToBounds:", 1);

          -[PHSingleCallParticipantLabelView updateStackViewHorizontalConstraintsWithBusinessLogo](self, "updateStackViewHorizontalConstraintsWithBusinessLogo");
        }
        else
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoHeightConstraint](self, "businessLogoHeightConstraint"));
          objc_msgSend(v42, "setActive:", 0);

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoWidthConstraint](self, "businessLogoWidthConstraint"));
          objc_msgSend(v43, "setActive:", 0);

          -[UIImageView removeFromSuperview](self->_businessLogoView, "removeFromSuperview");
          v44 = self->_businessLogoView;
          self->_businessLogoView = 0;

        }
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
      -[PHSingleCallParticipantLabelView updateLabelTextAlignmentForCallDisplayStyle:](self, "updateLabelTextAlignmentForCallDisplayStyle:", objc_msgSend(v17, "callDisplayStyle"));
      goto LABEL_25;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));

  if (v45 && !v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v45);
    -[PHSingleCallParticipantLabelView setAvatarView:](self, "setAvatarView:", v9);

    if (v4)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      objc_msgSend(v9, "frame");
      v11 = v10 * 0.5;
    }
    else
    {
      v11 = 10.0;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layer"));
    objc_msgSend(v37, "setCornerRadius:", v11);

    if (v4)
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layer"));
    objc_msgSend(v39, "setMasksToBounds:", 1);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    -[PHSingleCallParticipantLabelView addSubview:](self, "addSubview:", v41);

    -[PHSingleCallParticipantLabelView updateLayoutGuide](self, "updateLayoutGuide");
    -[PHSingleCallParticipantLabelView updateAvatarViewConstraints](self, "updateAvatarViewConstraints");
    goto LABEL_21;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));

  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    if (!v45)
    {
      objc_msgSend(v14, "removeFromSuperview");

      -[PHSingleCallParticipantLabelView setAvatarView:](self, "setAvatarView:", 0);
      -[PHSingleCallParticipantLabelView updateLayoutGuide](self, "updateLayoutGuide");
LABEL_21:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
      -[PHSingleCallParticipantLabelView updateLabelAlignmentForCallDisplayStyle:](self, "updateLabelAlignmentForCallDisplayStyle:", objc_msgSend(v17, "callDisplayStyle"));
      goto LABEL_25;
    }
    v15 = objc_opt_class(UIImageView, v13);
    isKindOfClass = objc_opt_isKindOfClass(v14, v15);

    if ((isKindOfClass & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      objc_msgSend(v17, "setImage:", v45);
LABEL_25:

    }
  }

}

- (void)updateBusinessLogoSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoView](self, "businessLogoView"));

  if (v3)
  {
    -[PHSingleCallParticipantLabelView businessLogoEdge](self, "businessLogoEdge");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoHeightConstraint](self, "businessLogoHeightConstraint"));
    objc_msgSend(v6, "setConstant:", v5);

    -[PHSingleCallParticipantLabelView businessLogoEdge](self, "businessLogoEdge");
    v8 = v7;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoWidthConstraint](self, "businessLogoWidthConstraint"));
    objc_msgSend(v9, "setConstant:", v8);

  }
}

- (double)businessLogoEdge
{
  void *v2;
  id v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  result = 22.0;
  if (v3 == (id)3)
    result = 26.0;
  if (!v3)
    return 16.0;
  return result;
}

- (double)businessLogoMarginH
{
  void *v2;
  id v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  result = 8.0;
  if (!v3)
    return 6.0;
  return result;
}

- (double)businessLogoCornerRadius
{
  void *v2;
  id v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  result = 4.0;
  if (v3 == (id)3)
    result = 6.0;
  if (!v3)
    return 3.0;
  return result;
}

- (void)setBannerButtonsState:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
  objc_msgSend(v4, "setState:", a3);

}

- (void)setBannerAudioRouteButtonSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
  objc_msgSend(v4, "setAudioRouteButtonSelected:", v3);

}

- (void)setTrailingSideLayoutGuide:(id)a3
{
  id v4;

  objc_storeWeak((id *)&self->_trailingSideLayoutGuide, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  -[PHSingleCallParticipantLabelView updateLayoutForCallDisplayStyle:](self, "updateLayoutForCallDisplayStyle:", objc_msgSend(v4, "callDisplayStyle"));

}

- (void)setCustomAvatar:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    objc_msgSend(v5, "removeFromSuperview");

    -[PHSingleCallParticipantLabelView setAvatarView:](self, "setAvatarView:", 0);
  }
  if (v11)
  {
    v6 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v11);
    -[PHSingleCallParticipantLabelView setAvatarView:](self, "setAvatarView:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    -[PHSingleCallParticipantLabelView addSubview:](self, "addSubview:", v8);

    -[PHSingleCallParticipantLabelView updateLayoutGuide](self, "updateLayoutGuide");
    -[PHSingleCallParticipantLabelView updateAvatarViewConstraints](self, "updateAvatarViewConstraints");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    objc_msgSend(v9, "removeFromSuperview");

    -[PHSingleCallParticipantLabelView setAvatarView:](self, "setAvatarView:", 0);
    -[PHSingleCallParticipantLabelView updateLayoutGuide](self, "updateLayoutGuide");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  -[PHSingleCallParticipantLabelView updateLabelAlignmentForCallDisplayStyle:](self, "updateLabelAlignmentForCallDisplayStyle:", objc_msgSend(v10, "callDisplayStyle"));

}

- (void)setPosterNameViewModel:(id)a3
{
  PHPosterNameViewModel **p_posterNameViewModel;
  id v5;
  void *v6;
  void *v7;
  id v8;

  p_posterNameViewModel = &self->_posterNameViewModel;
  v8 = a3;
  v5 = objc_storeWeak((id *)p_posterNameViewModel, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  objc_msgSend(v8, "updateStatus:", v7);

}

- (void)setPosterBadgeView:(id)a3
{
  objc_storeWeak((id *)&self->_posterBadgeView, a3);
  -[PHSingleCallParticipantLabelView updatePosterBadgeView](self, "updatePosterBadgeView");
}

- (void)updatePosterBadgeView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView posterBadgeView](self, "posterBadgeView"));
  v5 = objc_opt_class(TPBadgeView, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView posterBadgeView](self, "posterBadgeView"));
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView badgeView](self, "badgeView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    objc_msgSend(v12, "setTitle:", v9);
  }
  else
  {
    v10 = objc_opt_class(UIImageView, v7);
    v11 = objc_opt_isKindOfClass(v12, v10);

    if ((v11 & 1) == 0)
      return;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView posterBadgeView](self, "posterBadgeView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView iconView](self, "iconView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
    objc_msgSend(v12, "setImage:", v9);
  }

}

- (void)statusLabelTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelsArray](self, "statusLabelsArray", a3));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelsArray](self, "statusLabelsArray"));
    v7 = objc_msgSend(v6, "count");

    if ((unint64_t)v7 >= 2)
    {
      -[PHSingleCallParticipantLabelView invalidateStatusLabelTimer](self, "invalidateStatusLabelTimer");
      -[PHSingleCallParticipantLabelView animateToNextLabel](self, "animateToNextLabel");
    }
  }
}

- (void)animateToFirstLabel
{
  -[PHSingleCallParticipantLabelView animateToNextLabel](self, "animateToNextLabel");
  -[PHSingleCallParticipantLabelView scheduleStatusLabelTimer](self, "scheduleStatusLabelTimer");
}

- (void)animateToNextLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelsArray](self, "statusLabelsArray"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelsArray](self, "statusLabelsArray"));
    v6 = objc_msgSend(v5, "count");

    if ((unint64_t)v6 >= 2)
    {
      -[PHSingleCallParticipantLabelView setCurrentStatusLabelIndex:](self, "setCurrentStatusLabelIndex:", (char *)-[PHSingleCallParticipantLabelView currentStatusLabelIndex](self, "currentStatusLabelIndex") + 1);
      v7 = -[PHSingleCallParticipantLabelView currentStatusLabelIndex](self, "currentStatusLabelIndex");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelsArray](self, "statusLabelsArray"));
      v9 = objc_msgSend(v8, "count");

      if (v7 >= (unint64_t)v9)
        -[PHSingleCallParticipantLabelView setCurrentStatusLabelIndex:](self, "setCurrentStatusLabelIndex:", 0);
      v11 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelsArray](self, "statusLabelsArray"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", -[PHSingleCallParticipantLabelView currentStatusLabelIndex](self, "currentStatusLabelIndex")));
      -[PHSingleCallParticipantLabelView fadeStatusLabelToAttributedOrPlainString:](self, "fadeStatusLabelToAttributedOrPlainString:", v10);

    }
  }
}

- (void)scheduleStatusLabelTimer
{
  void *v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  -[PHSingleCallParticipantLabelView invalidateStatusLabelTimer](self, "invalidateStatusLabelTimer");
  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_100015078;
  v7 = &unk_100284DC8;
  objc_copyWeak(&v8, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v4, 2.5));
  -[PHSingleCallParticipantLabelView setStatusLabelTimer:](self, "setStatusLabelTimer:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)invalidateStatusLabelTimer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelTimer](self, "statusLabelTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelTimer](self, "statusLabelTimer"));
    objc_msgSend(v4, "invalidate");

    -[PHSingleCallParticipantLabelView setStatusLabelTimer:](self, "setStatusLabelTimer:", 0);
  }
}

- (void)fadeStatusLabelToAttributedOrPlainString:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000151B0;
  v7[3] = &unk_100284898;
  v7[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001520C;
  v5[3] = &unk_100284DF0;
  v5[4] = self;
  v4 = v6;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, v5, 0.200000003);

}

- (void)updateLayoutForCallDisplayStyle:(int64_t)a3
{
  id v5;
  NSObject *v6;
  int64_t v7;
  void *v8;
  double v9;
  void *v10;
  int v11;
  int64_t v12;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[ICSCallDisplayStyleManager callDisplayStyle](self->_callDisplayStyleManager, "callDisplayStyle");
    v11 = 134217984;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating single-participant label for presentation mode %ld", (uint8_t *)&v11, 0xCu);
  }

  -[PHSingleCallParticipantLabelView updateParticipantMarqueeLabelNumberOfLines](self, "updateParticipantMarqueeLabelNumberOfLines");
  -[PHSingleCallParticipantLabelView updateLabelsOrderAndLayout](self, "updateLabelsOrderAndLayout");
  -[PHSingleCallParticipantLabelView updateBannerButtonsViewForCallDisplayStyle:](self, "updateBannerButtonsViewForCallDisplayStyle:", a3);
  -[PHSingleCallParticipantLabelView updateAvatarViewConstraints](self, "updateAvatarViewConstraints");
  -[PHSingleCallParticipantLabelView updateLabelAlignmentForCallDisplayStyle:](self, "updateLabelAlignmentForCallDisplayStyle:", a3);
  -[PHSingleCallParticipantLabelView updateLabelScales](self, "updateLabelScales");
  -[PHSingleCallParticipantLabelView updateLabelFonts](self, "updateLabelFonts");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate"));
  if (v8)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate"));
    v9 = (double)-[NSObject shouldShowParticipantLabel](v6, "shouldShowParticipantLabel");
  }
  else
  {
    v9 = 1.0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
  objc_msgSend(v10, "setAlpha:", v9);

  if (v8)
}

- (void)deactivateLayoutGuideConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleMinLeadingConstraint](self, "participantAndStatusRectangleMinLeadingConstraint"));
  objc_msgSend(v3, "setActive:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleMaxLeadingConstraint](self, "participantAndStatusRectangleMaxLeadingConstraint"));
  objc_msgSend(v4, "setActive:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleTrailingConstraint](self, "participantAndStatusRectangleTrailingConstraint"));
  objc_msgSend(v5, "setActive:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleCenterXConstraint](self, "participantAndStatusRectangleCenterXConstraint"));
  objc_msgSend(v6, "setActive:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleCenterYConstraint](self, "participantAndStatusRectangleCenterYConstraint"));
  objc_msgSend(v7, "setActive:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleTopConstraint](self, "participantAndStatusRectangleTopConstraint"));
  objc_msgSend(v8, "setActive:", 0);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleBottomConstraint](self, "participantAndStatusRectangleBottomConstraint"));
  objc_msgSend(v9, "setActive:", 0);

}

- (void)updateLayoutGuide
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
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
  double v43;
  double v44;
  void *v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  id v57;

  -[PHSingleCallParticipantLabelView deactivateLayoutGuideConstraints](self, "deactivateLayoutGuideConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerYAnchor](self, "centerYAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  -[PHSingleCallParticipantLabelView setParticipantAndStatusRectangleCenterYConstraint:](self, "setParticipantAndStatusRectangleCenterYConstraint:", v6);

  v7 = -[PHSingleCallParticipantLabelView labelsOrder](self, "labelsOrder");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  if (v7 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    -[PHSingleCallParticipantLabelView setParticipantAndStatusRectangleTopConstraint:](self, "setParticipantAndStatusRectangleTopConstraint:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
    if (!v13
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text")),
          !objc_msgSend(v11, "length")))
    {
      v16 = objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      goto LABEL_10;
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    -[PHSingleCallParticipantLabelView setParticipantAndStatusRectangleTopConstraint:](self, "setParticipantAndStatusRectangleTopConstraint:", v14);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
    if (!v13
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text")),
          !objc_msgSend(v11, "length")))
    {
      v16 = objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
LABEL_10:
      v15 = (void *)v16;
      if (!v13)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
LABEL_11:

LABEL_12:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  -[PHSingleCallParticipantLabelView setParticipantAndStatusRectangleBottomConstraint:](self, "setParticipantAndStatusRectangleBottomConstraint:", v20);

  v21 = -[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleCenterYConstraint](self, "participantAndStatusRectangleCenterYConstraint"));
  objc_msgSend(v22, "setActive:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleTopConstraint](self, "participantAndStatusRectangleTopConstraint"));
  objc_msgSend(v23, "setActive:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleBottomConstraint](self, "participantAndStatusRectangleBottomConstraint"));
  objc_msgSend(v24, "setActive:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v26 = (char *)objc_msgSend(v25, "callDisplayStyle");

  if ((unint64_t)(v26 - 1) <= 3)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v28 = (unint64_t)objc_msgSend(v27, "userInterfaceIdiom");

    v29 = v28 & 0xFFFFFFFFFFFFFFFBLL;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView leadingAnchor](self, "leadingAnchor"));
    if (v29 == 1)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v32));
      -[PHSingleCallParticipantLabelView setParticipantAndStatusRectangleMinLeadingConstraint:](self, "setParticipantAndStatusRectangleMinLeadingConstraint:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerXAnchor](self, "centerXAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:constant:", v36, -130.0));
      -[PHSingleCallParticipantLabelView setParticipantAndStatusRectangleMaxLeadingConstraint:](self, "setParticipantAndStatusRectangleMaxLeadingConstraint:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "centerXAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerXAnchor](self, "centerXAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
      -[PHSingleCallParticipantLabelView setParticipantAndStatusRectangleCenterXConstraint:](self, "setParticipantAndStatusRectangleCenterXConstraint:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
      objc_msgSend(v42, "intrinsicContentSize");
      v44 = v43;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      objc_msgSend(v45, "intrinsicContentSize");
      if (v44 > v46)
        v47 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
      else
        v47 = objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      v30 = (void *)v47;

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));
      -[PHSingleCallParticipantLabelView setParticipantAndStatusRectangleTrailingConstraint:](self, "setParticipantAndStatusRectangleTrailingConstraint:", v52);

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleMaxLeadingConstraint](self, "participantAndStatusRectangleMaxLeadingConstraint"));
      LODWORD(v54) = 1148846080;
      objc_msgSend(v53, "setPriority:", v54);

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleMaxLeadingConstraint](self, "participantAndStatusRectangleMaxLeadingConstraint"));
      objc_msgSend(v55, "setActive:", 1);

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleCenterXConstraint](self, "participantAndStatusRectangleCenterXConstraint"));
      objc_msgSend(v56, "setActive:", 1);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleTrailingConstraint](self, "participantAndStatusRectangleTrailingConstraint"));
      objc_msgSend(v31, "setActive:", 1);
    }
    else
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 20.0));
      -[PHSingleCallParticipantLabelView setParticipantAndStatusRectangleMinLeadingConstraint:](self, "setParticipantAndStatusRectangleMinLeadingConstraint:", v48);

    }
    v57 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangleMinLeadingConstraint](self, "participantAndStatusRectangleMinLeadingConstraint"));
    objc_msgSend(v57, "setActive:", 1);

  }
}

- (void)updateBannerButtonsViewForCallDisplayStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  PHBannerButtonsView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  if (!a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (!v6)
    {
      v7 = -[PHBannerButtonsView initWithState:]([PHBannerButtonsView alloc], "initWithState:", -[PHSingleCallParticipantLabelView initialStateForBannerButtonsView](self, "initialStateForBannerButtonsView"));
      -[PHSingleCallParticipantLabelView setBannerButtonsView:](self, "setBannerButtonsView:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
      objc_msgSend(v8, "setDelegate:", self);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
      -[PHSingleCallParticipantLabelView addSubview:](self, "addSubview:", v10);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerYAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerYAnchor](self, "centerYAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v11));
      v22[0] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView layoutMarginsGuide](self, "layoutMarginsGuide"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
      v22[1] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
      -[PHSingleCallParticipantLabelView addConstraints:](self, "addConstraints:", v18);

    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
  objc_msgSend(v19, "setHidden:", a3 != 0);

}

- (unint64_t)initialStateForBannerButtonsView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "incomingVideoCall"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingVideoCall"));
    v7 = objc_msgSend(v6, "isConversation");

    if (!v7)
      return 2;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "incomingVideoCall"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeConversationForCall:", v10));

    v12 = objc_msgSend(v11, "resolvedAudioVideoMode");
    if (v12 == (id)1)
      return 0;
    else
      return 2;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingCall"));
    v13 = v14 == 0;

  }
  return v13;
}

- (void)updateViewForCallState
{
  _QWORD *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  _QWORD *v17;
  _QWORD v18[5];

  if (-[PHSingleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient"))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100016194;
    v18[3] = &unk_100284898;
    v18[4] = self;
    v3 = objc_retainBlock(v18);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView previousIsCallRinging](self, "previousIsCallRinging"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate"));
    v6 = objc_msgSend(v5, "isCallRinging");
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView previousIsCallRinging](self, "previousIsCallRinging"));
      v8 = objc_msgSend(v7, "BOOLValue");

      if (v6 != v8)
      {
        v13 = _NSConcreteStackBlock;
        v14 = 3221225472;
        v15 = sub_100016260;
        v16 = &unk_100284E18;
        v17 = v3;
        +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, &v13, &stru_100284E38, 0.5, 0.0, 2.0, 300.0, 37.0, 0.0);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate", v13, v14, v15, v16));
        v10 = objc_msgSend(v9, "isCallRinging");

        if ((v10 & 1) == 0)
          -[PHSingleCallParticipantLabelView hideFirstAndLastNameAnimated:](self, "hideFirstAndLastNameAnimated:", 1);

      }
    }
    else
    {

      if (v6)
      {
        ((void (*)(_QWORD *))v3[2])(v3);
        -[PHSingleCallParticipantLabelView showFirstAndLastNameAnimated:](self, "showFirstAndLastNameAnimated:", 0);
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v11, "isCallRinging")));
    -[PHSingleCallParticipantLabelView setPreviousIsCallRinging:](self, "setPreviousIsCallRinging:", v12);

  }
}

- (void)updateGestureRecognizersEnabled
{
  void *v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v4 = objc_msgSend(v3, "callDisplayStyle");

  if ((unint64_t)v4 < 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsGestureRecognizer](self, "callDetailsGestureRecognizer"));
    objc_msgSend(v8, "setEnabled:", 0);

    v7 = 0;
  }
  else
  {
    v5 = -[PHSingleCallParticipantLabelView showsCallDetailsViewButton](self, "showsCallDetailsViewButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsGestureRecognizer](self, "callDetailsGestureRecognizer"));
    objc_msgSend(v6, "setEnabled:", v5);

    v7 = -[PHSingleCallParticipantLabelView showsCallDetailsViewButton](self, "showsCallDetailsViewButton") ^ 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelTapRecognizer](self, "statusLabelTapRecognizer"));
  objc_msgSend(v9, "setEnabled:", v7);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView statusLabelTapRecognizer](self, "statusLabelTapRecognizer"));
  v10 = objc_msgSend(v12, "isEnabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  objc_msgSend(v11, "setUserInteractionEnabled:", v10);

}

- (void)updateLabelAlignmentForCallDisplayStyle:(int64_t)a3
{
  -[PHSingleCallParticipantLabelView updateStackViewHorizontalConstraints](self, "updateStackViewHorizontalConstraints");
  -[PHSingleCallParticipantLabelView updateParticipantMarqueeLabelHorizontalConstraint](self, "updateParticipantMarqueeLabelHorizontalConstraint");
  -[PHSingleCallParticipantLabelView updateSecondaryLabelHorizontalConstraint](self, "updateSecondaryLabelHorizontalConstraint");
  -[PHSingleCallParticipantLabelView updateLabelTrailingConstraints](self, "updateLabelTrailingConstraints");
  -[PHSingleCallParticipantLabelView updateLabelTextAlignmentForCallDisplayStyle:](self, "updateLabelTextAlignmentForCallDisplayStyle:", a3);
}

- (void)updateLabelScales
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (!objc_msgSend(v3, "callDisplayStyle"))
  {

    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v5 = objc_msgSend(v4, "callDisplayStyle");

  if (v5 == (id)1)
  {
LABEL_8:
    v8 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 0);
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
  objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 1);

  if (-[PHSingleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient"))
    v7 = 0.37;
  else
    v7 = 0.9;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
  objc_msgSend(v8, "setMinimumScaleFactor:", v7);
LABEL_9:

}

- (void)updateLabelFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView updatedParticipantMarqueeLabelFont](self, "updatedParticipantMarqueeLabelFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
  objc_msgSend(v4, "setFont:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", objc_msgSend(v5, "callDisplayStyle")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  objc_msgSend(v7, "setFont:", v6);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", objc_msgSend(v10, "callDisplayStyle")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
  objc_msgSend(v9, "setFont:", v8);

}

- (void)updateLabelsOrderAndText
{
  -[PHSingleCallParticipantLabelView updateLabelsOrder](self, "updateLabelsOrder");
  -[PHSingleCallParticipantLabelView updateStatusLabelText](self, "updateStatusLabelText");
}

- (void)updateStatusLabelText
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[PHSingleCallParticipantLabelView inBrandedCall](self, "inBrandedCall"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
    objc_msgSend(v5, "setNumberOfLines:", 1);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v5, "callDisplayStyle") == (id)3)
      v3 = 1;
    else
      v3 = 2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
    objc_msgSend(v4, "setNumberOfLines:", v3);

  }
}

- (BOOL)inBrandedCall
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostCall"));

  LOBYTE(v2) = objc_msgSend(v3, "isBranded");
  return (char)v2;
}

- (BOOL)inCallDirectoryCall
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostCall"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callDirectoryName"));
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)updatedParticipantMarqueeLabelFont
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  double v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v4 = objc_msgSend(v3, "callDisplayStyle");

  if (v4 != (id)3)
  {
    if (v4 == (id)1)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelMiniWindowFont](PHUIConfiguration, "singleCallParticipantLabelMiniWindowFont"));
    }
    else
    {
      if (!v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
        objc_msgSend(v7, "bounds");
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelBannerFontForText:availableWidth:](PHUIConfiguration, "singleCallParticipantLabelBannerFontForText:availableWidth:", v6, v8));

        return v9;
      }
      v10 = objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelFullscreenFont](PHUIConfiguration, "singleCallParticipantLabelFullscreenFont"));
    }
    v9 = (void *)v10;
    return v9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelAmbientFont](PHUIConfiguration, "singleCallParticipantLabelAmbientFont"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate"));
  v13 = objc_opt_respondsToSelector(v12, "customFontForParticipantLabel");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "customFontForParticipantLabel"));
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v11;
    v18 = v17;

    v11 = v18;
  }
  v19 = -[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout");
  v20 = 60.0;
  if (v19 == 1)
    v20 = 90.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fontWithSize:", v20));

  return v9;
}

- (void)updateLabelTextAlignmentForCallDisplayStyle:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if ((id)-[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == (id)1)
    goto LABEL_2;
  if (!a3)
  {
LABEL_7:
    v5 = 4;
    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  if (v6)
  {

    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView iconView](self, "iconView"));

  if (v7)
    goto LABEL_7;
LABEL_2:
  v5 = 1;
LABEL_8:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
  objc_msgSend(v8, "setTextAlignment:", v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  objc_msgSend(v9, "setTextAlignment:", v5);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
  objc_msgSend(v10, "setTextAlignment:", v5);

}

- (void)updateStackViewHorizontalConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackViewHorizontalConstraint](self, "stackViewHorizontalConstraint"));
  objc_msgSend(v3, "setActive:", 0);

  if (-[PHSingleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient")
    && (id)-[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
LABEL_8:
    v9 = (void *)v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
    -[PHSingleCallParticipantLabelView setStackViewHorizontalConstraint:](self, "setStackViewHorizontalConstraint:", v10);

    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  if (v8 || -[PHSingleCallParticipantLabelView isDisplayStyleBanner](self, "isDisplayStyleBanner"))
  {

LABEL_7:
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    goto LABEL_8;
  }
  if (-[PHSingleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient"))
    goto LABEL_7;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerXAnchor](self, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  -[PHSingleCallParticipantLabelView setStackViewHorizontalConstraint:](self, "setStackViewHorizontalConstraint:", v9);
LABEL_9:

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackViewHorizontalConstraint](self, "stackViewHorizontalConstraint"));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView iconView](self, "iconView"));
  if (v12)
  {
    -[PHSingleCallParticipantLabelView updateIconSize](self, "updateIconSize");
    -[PHSingleCallParticipantLabelView updateStackViewHorizontalConstraintsWithVoIPAppIcon](self, "updateStackViewHorizontalConstraintsWithVoIPAppIcon");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoView](self, "businessLogoView"));

  if (v13)
  {
    -[PHSingleCallParticipantLabelView updateBusinessLogoSize](self, "updateBusinessLogoSize");
    -[PHSingleCallParticipantLabelView updateStackViewHorizontalConstraintsWithBusinessLogo](self, "updateStackViewHorizontalConstraintsWithBusinessLogo");
  }
}

- (void)updateStackViewHorizontalConstraintsWithVoIPAppIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
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
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconViewLeadingAnchor](self, "appIconViewLeadingAnchor"));
  objc_msgSend(v3, "setActive:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconLayoutGuide](self, "appIconLayoutGuide"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconLayoutGuide](self, "appIconLayoutGuide"));
    -[PHSingleCallParticipantLabelView removeLayoutGuide:](self, "removeLayoutGuide:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconLayoutGuideHorizontalAnchor](self, "appIconLayoutGuideHorizontalAnchor"));
  objc_msgSend(v6, "setActive:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_iconView, "image"));
  if (v7)
  {
    -[PHSingleCallParticipantLabelView voipIconEdge](self, "voipIconEdge");
    v9 = v8;
    -[PHSingleCallParticipantLabelView voipIconMarginH](self, "voipIconMarginH");
    v11 = v9 + v10;
  }
  else
  {
    v11 = 0.0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  if (v12)
  {

LABEL_8:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_iconView, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    -[PHSingleCallParticipantLabelView setAppIconViewLeadingAnchor:](self, "setAppIconViewLeadingAnchor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackViewHorizontalConstraint](self, "stackViewHorizontalConstraint"));
    objc_msgSend(v17, "setConstant:", v11);
    goto LABEL_14;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v19 = objc_msgSend(v18, "callDisplayStyle");

  if (!v19)
    goto LABEL_8;
  v20 = objc_alloc_init((Class)UILayoutGuide);
  -[PHSingleCallParticipantLabelView setAppIconLayoutGuide:](self, "setAppIconLayoutGuide:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconLayoutGuide](self, "appIconLayoutGuide"));
  -[PHSingleCallParticipantLabelView addLayoutGuide:](self, "addLayoutGuide:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_iconView, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconLayoutGuide](self, "appIconLayoutGuide"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
  -[PHSingleCallParticipantLabelView setAppIconViewLeadingAnchor:](self, "setAppIconViewLeadingAnchor:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackViewHorizontalConstraint](self, "stackViewHorizontalConstraint"));
  objc_msgSend(v26, "setActive:", 0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_iconView, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v11));
  -[PHSingleCallParticipantLabelView setStackViewHorizontalConstraint:](self, "setStackViewHorizontalConstraint:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackViewHorizontalConstraint](self, "stackViewHorizontalConstraint"));
  objc_msgSend(v31, "setActive:", 1);

  LODWORD(v28) = -[PHSingleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconLayoutGuide](self, "appIconLayoutGuide"));
  v33 = v32;
  if ((_DWORD)v28)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
    v35 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView leadingAnchor](self, "leadingAnchor"));
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerXAnchor"));
    v35 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerXAnchor](self, "centerXAnchor"));
  }
  v36 = (void *)v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  -[PHSingleCallParticipantLabelView setAppIconLayoutGuideHorizontalAnchor:](self, "setAppIconLayoutGuideHorizontalAnchor:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconLayoutGuideHorizontalAnchor](self, "appIconLayoutGuideHorizontalAnchor"));
  objc_msgSend(v38, "setActive:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconLayoutGuide](self, "appIconLayoutGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));
  objc_msgSend(v42, "setActive:", 1);

LABEL_14:
  v43 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView appIconViewLeadingAnchor](self, "appIconViewLeadingAnchor"));
  objc_msgSend(v43, "setActive:", 1);

}

- (void)updateStackViewHorizontalConstraintsWithBusinessLogo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
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
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoViewLeadingAnchor](self, "businessLogoViewLeadingAnchor"));
  objc_msgSend(v3, "setActive:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoLayoutGuide](self, "businessLogoLayoutGuide"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoLayoutGuide](self, "businessLogoLayoutGuide"));
    -[PHSingleCallParticipantLabelView removeLayoutGuide:](self, "removeLayoutGuide:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoLayoutGuideHorizontalAnchor](self, "businessLogoLayoutGuideHorizontalAnchor"));
  objc_msgSend(v6, "setActive:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_businessLogoView, "image"));
  if (v7)
  {
    -[PHSingleCallParticipantLabelView businessLogoEdge](self, "businessLogoEdge");
    v9 = v8;
    -[PHSingleCallParticipantLabelView businessLogoMarginH](self, "businessLogoMarginH");
    v11 = v9 + v10;
  }
  else
  {
    v11 = 0.0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
  if (v12)
  {

LABEL_8:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_businessLogoView, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    -[PHSingleCallParticipantLabelView setBusinessLogoViewLeadingAnchor:](self, "setBusinessLogoViewLeadingAnchor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackViewHorizontalConstraint](self, "stackViewHorizontalConstraint"));
    objc_msgSend(v17, "setConstant:", v11);
    goto LABEL_14;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v19 = objc_msgSend(v18, "callDisplayStyle");

  if (!v19)
    goto LABEL_8;
  v20 = objc_alloc_init((Class)UILayoutGuide);
  -[PHSingleCallParticipantLabelView setBusinessLogoLayoutGuide:](self, "setBusinessLogoLayoutGuide:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoLayoutGuide](self, "businessLogoLayoutGuide"));
  -[PHSingleCallParticipantLabelView addLayoutGuide:](self, "addLayoutGuide:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_businessLogoView, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoLayoutGuide](self, "businessLogoLayoutGuide"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
  -[PHSingleCallParticipantLabelView setBusinessLogoViewLeadingAnchor:](self, "setBusinessLogoViewLeadingAnchor:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackViewHorizontalConstraint](self, "stackViewHorizontalConstraint"));
  objc_msgSend(v26, "setActive:", 0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_businessLogoView, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v11));
  -[PHSingleCallParticipantLabelView setStackViewHorizontalConstraint:](self, "setStackViewHorizontalConstraint:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackViewHorizontalConstraint](self, "stackViewHorizontalConstraint"));
  objc_msgSend(v31, "setActive:", 1);

  LODWORD(v28) = -[PHSingleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoLayoutGuide](self, "businessLogoLayoutGuide"));
  v33 = v32;
  if ((_DWORD)v28)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
    v35 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView leadingAnchor](self, "leadingAnchor"));
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerXAnchor"));
    v35 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerXAnchor](self, "centerXAnchor"));
  }
  v36 = (void *)v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  -[PHSingleCallParticipantLabelView setBusinessLogoLayoutGuideHorizontalAnchor:](self, "setBusinessLogoLayoutGuideHorizontalAnchor:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoLayoutGuideHorizontalAnchor](self, "businessLogoLayoutGuideHorizontalAnchor"));
  objc_msgSend(v38, "setActive:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoLayoutGuide](self, "businessLogoLayoutGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));
  objc_msgSend(v42, "setActive:", 1);

LABEL_14:
  v43 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView businessLogoViewLeadingAnchor](self, "businessLogoViewLeadingAnchor"));
  objc_msgSend(v43, "setActive:", 1);

}

- (void)updateParticipantMarqueeLabelNumberOfLines
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  id v22;

  if (-[PHSingleCallParticipantLabelView isDisplayStyleBanner](self, "isDisplayStyleBanner"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    objc_msgSend(v3, "setNumberOfLines:", 2);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    objc_msgSend(v4, "setMarqueeEnabled:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v6 = v5;
    v7 = 0;
  }
  else
  {
    v8 = -[PHSingleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    objc_msgSend(v9, "setNumberOfLines:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v11 = v10;
    if (v8)
    {
      objc_msgSend(v10, "setMarqueeEnabled:", 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      objc_msgSend(v12, "setMarqueeRunning:", 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      objc_msgSend(v13, "setLineBreakMode:", 4);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      objc_msgSend(v6, "_setExtremeSizingEnabled:", 1);
      goto LABEL_7;
    }
    objc_msgSend(v10, "setMarqueeEnabled:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v6 = v5;
    v7 = 1;
  }
  objc_msgSend(v5, "setMarqueeRunning:", v7);
LABEL_7:

  v14 = sub_1000C5588();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    if (objc_msgSend(v16, "marqueeEnabled"))
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v19 = 138412546;
    v20 = v17;
    v21 = 2048;
    v22 = objc_msgSend(v18, "numberOfLines");
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Marquee enabled = %@, number of lines for particpant name = %ld", (uint8_t *)&v19, 0x16u);

  }
}

- (void)updateParticipantMarqueeLabelHorizontalConstraint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantMarqueeLabelHorizontalConstraint](self, "participantMarqueeLabelHorizontalConstraint"));
  objc_msgSend(v3, "setActive:", 0);

  if ((id)-[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
LABEL_14:
      v11 = (void *)v8;
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
LABEL_15:
      v15 = (void *)v12;
      -[PHSingleCallParticipantLabelView setParticipantMarqueeLabelHorizontalConstraint:](self, "setParticipantMarqueeLabelHorizontalConstraint:", v12);

      goto LABEL_16;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));

  if (v9)
  {
    v10 = 10.0;
    if (!-[PHSingleCallParticipantLabelView isDisplayStyleBanner](self, "isDisplayStyleBanner"))
    {
      if (-[PHSingleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient"))
        v10 = 28.0;
      else
        v10 = 12.0;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v11, v10));
    goto LABEL_15;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v14 = (unint64_t)objc_msgSend(v13, "callDisplayStyle");

  if (v14 <= 4)
  {
    if (((1 << v14) & 0x16) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerXAnchor](self, "centerXAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
      -[PHSingleCallParticipantLabelView setParticipantMarqueeLabelHorizontalConstraint:](self, "setParticipantMarqueeLabelHorizontalConstraint:", v11);
LABEL_16:

      goto LABEL_17;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView layoutMarginsGuide](self, "layoutMarginsGuide"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    goto LABEL_14;
  }
LABEL_17:
  v16 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantMarqueeLabelHorizontalConstraint](self, "participantMarqueeLabelHorizontalConstraint"));
  objc_msgSend(v16, "setActive:", 1);

}

- (void)updateSecondaryLabelHorizontalConstraint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabelHorizontalConstraint](self, "secondaryInfoLabelHorizontalConstraint"));
  objc_msgSend(v3, "setActive:", 0);

  if ((id)-[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == (id)1
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide")),
        v4,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));

    if (v9)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
      v14 = (unint64_t)objc_msgSend(v13, "callDisplayStyle");

      if (v14 > 4)
        goto LABEL_9;
      if (((1 << v14) & 0x16) != 0)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerXAnchor](self, "centerXAnchor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
        -[PHSingleCallParticipantLabelView setSecondaryInfoLabelHorizontalConstraint:](self, "setSecondaryInfoLabelHorizontalConstraint:", v11);
        goto LABEL_8;
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView layoutMarginsGuide](self, "layoutMarginsGuide"));
    }
    v7 = v10;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  }
  v11 = (void *)v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  -[PHSingleCallParticipantLabelView setSecondaryInfoLabelHorizontalConstraint:](self, "setSecondaryInfoLabelHorizontalConstraint:", v12);

LABEL_8:
LABEL_9:
  v15 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabelHorizontalConstraint](self, "secondaryInfoLabelHorizontalConstraint"));
  objc_msgSend(v15, "setActive:", 1);

}

- (void)updateLabelTrailingConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantMarqueeLabelTrailingConstraint](self, "participantMarqueeLabelTrailingConstraint"));
  objc_msgSend(v3, "setActive:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackViewTrailingConstraint](self, "stackViewTrailingConstraint"));
  objc_msgSend(v4, "setActive:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabelTrailingConstraint](self, "secondaryInfoLabelTrailingConstraint"));
  objc_msgSend(v5, "setActive:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v6, "callDisplayStyle"))
  {

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -10.0));
      -[PHSingleCallParticipantLabelView setParticipantMarqueeLabelTrailingConstraint:](self, "setParticipantMarqueeLabelTrailingConstraint:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:constant:", v29, -10.0));
      -[PHSingleCallParticipantLabelView setStackViewTrailingConstraint:](self, "setStackViewTrailingConstraint:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bannerButtonsView](self, "bannerButtonsView"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:constant:", v34, -10.0));
      -[PHSingleCallParticipantLabelView setSecondaryInfoLabelTrailingConstraint:](self, "setSecondaryInfoLabelTrailingConstraint:", v35);

      goto LABEL_12;
    }
  }
  -[PHSingleCallParticipantLabelView horizontalPaddingConstantForTrailingConstraints](self, "horizontalPaddingConstantForTrailingConstraints");
  v8 = -v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView conferenceParticipantsButton](self, "conferenceParticipantsButton"));
  if (v9
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"))) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:constant:", v12, -10.0));
    -[PHSingleCallParticipantLabelView setParticipantMarqueeLabelTrailingConstraint:](self, "setParticipantMarqueeLabelTrailingConstraint:", v13);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingAnchor](self, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:constant:", v11, v8));
    -[PHSingleCallParticipantLabelView setParticipantMarqueeLabelTrailingConstraint:](self, "setParticipantMarqueeLabelTrailingConstraint:", v12);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  if (v14)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDetailsViewButton](self, "callDetailsViewButton"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v18, -10.0));
    -[PHSingleCallParticipantLabelView setStackViewTrailingConstraint:](self, "setStackViewTrailingConstraint:", v19);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingAnchor](self, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v17, v8));
    -[PHSingleCallParticipantLabelView setStackViewTrailingConstraint:](self, "setStackViewTrailingConstraint:", v18);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingAnchor](self, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:constant:", v33, v8));
  -[PHSingleCallParticipantLabelView setSecondaryInfoLabelTrailingConstraint:](self, "setSecondaryInfoLabelTrailingConstraint:", v34);
LABEL_12:

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantMarqueeLabelTrailingConstraint](self, "participantMarqueeLabelTrailingConstraint"));
  objc_msgSend(v36, "setActive:", 1);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackViewTrailingConstraint](self, "stackViewTrailingConstraint"));
  objc_msgSend(v37, "setActive:", 1);

  v38 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabelTrailingConstraint](self, "secondaryInfoLabelTrailingConstraint"));
  objc_msgSend(v38, "setActive:", 1);

}

- (double)horizontalPaddingConstantForTrailingConstraints
{
  double result;
  void *v4;
  unint64_t v5;

  if (-[PHSingleCallParticipantLabelView isDisplayStyleMiniWindow](self, "isDisplayStyleMiniWindow"))
  {
    -[PHSingleCallParticipantLabelView horizontalPaddingForMiniWindow](self, "horizontalPaddingForMiniWindow");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v5 = (unint64_t)objc_msgSend(v4, "userInterfaceIdiom");

    result = 20.0;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      return 0.0;
  }
  return result;
}

- (void)updateAvatarViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarViewConstraints](self, "avatarViewConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView updatedAvatarViewConstraints](self, "updatedAvatarViewConstraints"));
    -[PHSingleCallParticipantLabelView setAvatarViewConstraints:](self, "setAvatarViewConstraints:", v5);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarViewConstraints](self, "avatarViewConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

  }
}

- (id)updatedAvatarViewConstraints
{
  void *v2;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  double v35;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _QWORD v90[4];
  _QWORD v91[8];
  _QWORD v92[3];
  _QWORD v93[4];
  _QWORD v94[4];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v5 = objc_msgSend(v4, "callDisplayStyle");

  switch((unint64_t)v5)
  {
    case 0uLL:
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "leadingAnchor"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView layoutMarginsGuide](self, "layoutMarginsGuide"));
      v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "leadingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v80));
      v94[0] = v18;
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "centerYAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerYAnchor](self, "centerYAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v19));
      v94[1] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "widthAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 48.0));
      v94[2] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "heightAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToConstant:", 48.0));
      v94[3] = v26;
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v94, 4));

      goto LABEL_6;
    case 1uLL:
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "leadingAnchor"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView layoutMarginsGuide](self, "layoutMarginsGuide"));
      v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "leadingAnchor"));
      -[PHSingleCallParticipantLabelView horizontalPaddingForMiniWindow](self, "horizontalPaddingForMiniWindow");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:", v80));
      v93[0] = v18;
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "centerYAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerYAnchor](self, "centerYAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v19));
      v93[1] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "widthAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 40.0));
      v93[2] = v23;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "heightAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToConstant:", 40.0));
      v93[3] = v29;
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v93, 4));

LABEL_6:
      v30 = (void *)v80;

      v16 = v76;
      v15 = v85;

      goto LABEL_7;
    case 2uLL:
    case 4uLL:
      v83 = objc_alloc((Class)NSMutableArray);
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "leadingAnchor"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "leadingAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v6));
      v92[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widthAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:", 60.0));
      v92[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", 60.0));
      v92[2] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 3));
      v84 = objc_msgSend(v83, "initWithArray:", v14);

      LODWORD(v12) = -[PHSingleCallParticipantLabelView inBrandedCall](self, "inBrandedCall");
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
      if ((_DWORD)v12)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "topAnchor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "centerYAnchor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
      }
      v30 = (void *)v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
      v2 = v84;
      objc_msgSend(v84, "addObject:", v18);
      goto LABEL_15;
    case 3uLL:
      if ((id)-[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == (id)1
        && (v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide")),
            v32,
            v32))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "heightAnchor"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToConstant:", 1.79769313e308));

        LODWORD(v35) = 1144733696;
        objc_msgSend(v89, "setPriority:", v35);
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "leadingAnchor"));
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
        v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "leadingAnchor"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v63));
        v91[0] = v74;
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "leadingAnchor"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView leadingAnchor](self, "leadingAnchor"));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
        v91[1] = v68;
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "trailingAnchor"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "leadingAnchor"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintLessThanOrEqualToAnchor:constant:", v64, -32.0));
        v91[2] = v62;
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "centerYAnchor"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView centerYAnchor](self, "centerYAnchor"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
        v91[3] = v58;
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "widthAnchor"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "heightAnchor"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
        v91[4] = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView topAnchor](self, "topAnchor"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v39));
        v91[5] = v40;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bottomAnchor](self, "bottomAnchor"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:", v43));
        v91[6] = v44;
        v91[7] = v89;
        v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 8));

        v18 = (void *)v63;
        v30 = v81;

        v16 = v77;
        v15 = v86;

LABEL_7:
        v31 = v72;
      }
      else
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "leadingAnchor"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
        v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "leadingAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v82));
        v90[0] = v18;
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "centerYAnchor"));
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView participantAndStatusRectangle](self, "participantAndStatusRectangle"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "centerYAnchor"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v45));
        v90[1] = v46;
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "widthAnchor"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", 80.0));
        v90[2] = v49;
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView avatarView](self, "avatarView"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "heightAnchor"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToConstant:", 80.0));
        v90[3] = v52;
        v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v90, 4));

        v30 = (void *)v82;
        v16 = v78;

        v15 = v87;
        v31 = v71;
      }

LABEL_15:
      return v2;
    default:
      return v2;
  }
}

- (double)horizontalPaddingForMiniWindow
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  result = 0.0;
  if (v2 - 10 <= 5)
    return dbl_10023F1A0[v2 - 10];
  return result;
}

- (void)updateLabelConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  id v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView labelConstraints](self, "labelConstraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView labelConstraints](self, "labelConstraints"));
    -[PHSingleCallParticipantLabelView removeConstraints:](self, "removeConstraints:", v4);

  }
  v29 = objc_alloc_init((Class)NSMutableArray);
  if ((id)-[PHSingleCallParticipantLabelView labelsOrder](self, "labelsOrder") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_stackView, "bottomAnchor"));
    -[PHSingleCallParticipantLabelView labelsVerticalOffset](self, "labelsVerticalOffset");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7));
    objc_msgSend(v29, "addObject:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    -[PHSingleCallParticipantLabelView labelsVerticalOffset](self, "labelsVerticalOffset");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12));
    objc_msgSend(v29, "addObject:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_secondaryInfoLabel, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
    -[PHSingleCallParticipantLabelView labelsVerticalOffset](self, "labelsVerticalOffset");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19));
    objc_msgSend(v29, "addObject:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_stackView, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    -[PHSingleCallParticipantLabelView labelsVerticalOffset](self, "labelsVerticalOffset");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23));
    objc_msgSend(v29, "addObject:", v24);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_secondaryInfoLabel, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
  }
  v25 = v15;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  -[PHSingleCallParticipantLabelView labelsVerticalOffset](self, "labelsVerticalOffset");
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v26));
  objc_msgSend(v29, "addObject:", v27);

  -[PHSingleCallParticipantLabelView setLabelConstraints:](self, "setLabelConstraints:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView labelConstraints](self, "labelConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (void)updateHeightConstraints
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
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
  uint64_t v35;
  void **v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView heightConstraints](self, "heightConstraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView heightConstraints](self, "heightConstraints"));
    -[PHSingleCallParticipantLabelView removeConstraints:](self, "removeConstraints:", v4);

  }
  v5 = 0.0;
  if (-[PHSingleCallParticipantLabelView isDisplayStyleAmbient](self, "isDisplayStyleAmbient"))
  {
    if ((id)-[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == (id)1)
      v5 = 18.0;
    else
      v5 = 0.0;
  }
  if (-[PHSingleCallParticipantLabelView isDisplayStyleBanner](self, "isDisplayStyleBanner"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView heightAnchor](self, "heightAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 100.0));
    v57 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v8));

  }
  else if (-[PHSingleCallParticipantLabelView isDisplayStyleMiniWindow](self, "isDisplayStyleMiniWindow"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
    if (v10
      && (v11 = (void *)v10,
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "text")),
          v14 = objc_msgSend(v13, "length"),
          v13,
          v12,
          v11,
          v14))
    {
      v15 = -[PHSingleCallParticipantLabelView labelsOrder](self, "labelsOrder");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView topAnchor](self, "topAnchor"));
      if (v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, -v5));
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
      }
      v24 = (void *)v19;

      v37 = -[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bottomAnchor](self, "bottomAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView secondaryInfoLabel](self, "secondaryInfoLabel"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
      if (v37 == 1)
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v40));
      else
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v40));
      v31 = (void *)v41;

      v55 = v24;
      v56 = v31;
      v36 = &v55;
    }
    else
    {
      v20 = -[PHSingleCallParticipantLabelView labelsOrder](self, "labelsOrder");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView topAnchor](self, "topAnchor"));
      if (v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, -v5));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bottomAnchor](self, "bottomAnchor"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v28));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bottomAnchor](self, "bottomAnchor"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView statusLabel](self, "statusLabel"));
      }
      v29 = v26;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v30));

      if ((id)-[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == (id)1)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView bottomAnchor](self, "bottomAnchor"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView stackView](self, "stackView"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
        v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:", v34));

        v31 = (void *)v35;
      }
      v53 = v24;
      v54 = v31;
      v36 = &v53;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2, v53, v54, v55, v56));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v42));

  }
  if ((id)-[PHSingleCallParticipantLabelView ambientLayout](self, "ambientLayout") == (id)1
    && (v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide")),
        v43,
        v43))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView trailingSideLayoutGuide](self, "trailingSideLayoutGuide"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:", v47));
    objc_msgSend(v9, "addObject:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v50 = v49;
    LODWORD(v51) = 1132068864;
  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView participantMarqueeLabel](self, "participantMarqueeLabel"));
    v50 = v49;
    LODWORD(v51) = 1144750080;
  }
  objc_msgSend(v49, "setContentCompressionResistancePriority:forAxis:", 1, v51);

  -[PHSingleCallParticipantLabelView setHeightConstraints:](self, "setHeightConstraints:", v9);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView heightConstraints](self, "heightConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v52);

}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  if ((unint64_t)a3 <= 1)
  {
    -[PHSingleCallParticipantLabelView updateLayoutForCallDisplayStyle:](self, "updateLayoutForCallDisplayStyle:", a4);
    -[PHSingleCallParticipantLabelView updateGestureRecognizersEnabled](self, "updateGestureRecognizersEnabled");
  }
}

- (BOOL)isDisplayStyleBanner
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle") == 0;

  return v3;
}

- (BOOL)isDisplayStyleMiniWindow
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle") == (id)1;

  return v3;
}

- (BOOL)isDisplayStyleAmbient
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSingleCallParticipantLabelView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle") == (id)3;

  return v3;
}

- (void)bannerButtonsView:(id)a3 didPerformActionType:(int64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractCallParticipantLabelView delegate](self, "delegate", a3));
  objc_msgSend(v6, "participantLabelView:didPerformActionType:", self, a4);

}

- (BOOL)shouldUseHeroImageLayout
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v3 = objc_msgSend(v2, "isHeroImageEnabled");

  return v3;
}

- (unint64_t)bannerButtonsState
{
  return self->_bannerButtonsState;
}

- (UILayoutGuide)leadingSideLayoutGuide
{
  return (UILayoutGuide *)objc_loadWeakRetained((id *)&self->_leadingSideLayoutGuide);
}

- (void)setLeadingSideLayoutGuide:(id)a3
{
  objc_storeWeak((id *)&self->_leadingSideLayoutGuide, a3);
}

- (UILayoutGuide)trailingSideLayoutGuide
{
  return (UILayoutGuide *)objc_loadWeakRetained((id *)&self->_trailingSideLayoutGuide);
}

- (PHPosterNameViewModel)posterNameViewModel
{
  return (PHPosterNameViewModel *)objc_loadWeakRetained((id *)&self->_posterNameViewModel);
}

- (UIView)posterBadgeView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_posterBadgeView);
}

- (TPBadgeView)badgeView
{
  return (TPBadgeView *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBadgeView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (UIImageView)iconView
{
  return (UIImageView *)objc_getProperty(self, a2, 112, 1);
}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)setSharedProfileStateOracle:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
}

- (NSLayoutConstraint)participantMarqueeLabelHorizontalConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 136, 1);
}

- (void)setParticipantMarqueeLabelHorizontalConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSLayoutConstraint)participantMarqueeLabelTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 144, 1);
}

- (void)setParticipantMarqueeLabelTrailingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSLayoutConstraint)stackViewHorizontalConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 152, 1);
}

- (void)setStackViewHorizontalConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSLayoutConstraint)stackViewTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStackViewTrailingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSLayoutConstraint)statusLabelTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 168, 1);
}

- (void)setStatusLabelTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSLayoutConstraint)appIconViewLeadingAnchor
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAppIconViewLeadingAnchor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSLayoutConstraint)appIconLayoutGuideHorizontalAnchor
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAppIconLayoutGuideHorizontalAnchor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSLayoutConstraint)businessLogoViewLeadingAnchor
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBusinessLogoViewLeadingAnchor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSLayoutConstraint)businessLogoLayoutGuideHorizontalAnchor
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 200, 1);
}

- (void)setBusinessLogoLayoutGuideHorizontalAnchor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSArray)heightConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setHeightConstraints:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSArray)labelConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLabelConstraints:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (UILayoutGuide)appIconLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAppIconLayoutGuide:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (UILayoutGuide)businessLogoLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBusinessLogoLayoutGuide:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSArray)avatarViewConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAvatarViewConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSLayoutConstraint)secondaryInfoLabelHorizontalConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSecondaryInfoLabelHorizontalConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSLayoutConstraint)secondaryInfoLabelTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSecondaryInfoLabelTrailingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (UILayoutGuide)participantAndStatusRectangle
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 264, 1);
}

- (void)setParticipantAndStatusRectangle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSLayoutConstraint)participantAndStatusRectangleMinLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 272, 1);
}

- (void)setParticipantAndStatusRectangleMinLeadingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSLayoutConstraint)participantAndStatusRectangleMaxLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 280, 1);
}

- (void)setParticipantAndStatusRectangleMaxLeadingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSLayoutConstraint)participantAndStatusRectangleCenterXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 288, 1);
}

- (void)setParticipantAndStatusRectangleCenterXConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSLayoutConstraint)participantAndStatusRectangleCenterYConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 296, 1);
}

- (void)setParticipantAndStatusRectangleCenterYConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSLayoutConstraint)participantAndStatusRectangleTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 304, 1);
}

- (void)setParticipantAndStatusRectangleTrailingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSLayoutConstraint)participantAndStatusRectangleTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 312, 1);
}

- (void)setParticipantAndStatusRectangleTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSLayoutConstraint)participantAndStatusRectangleBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 320, 1);
}

- (void)setParticipantAndStatusRectangleBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (unint64_t)labelsOrder
{
  return self->_labelsOrder;
}

- (void)setLabelsOrder:(unint64_t)a3
{
  self->_labelsOrder = a3;
}

- (UILabel)firstNameLabel
{
  return (UILabel *)objc_getProperty(self, a2, 336, 1);
}

- (void)setFirstNameLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (UILabel)lastNameLabel
{
  return (UILabel *)objc_getProperty(self, a2, 344, 1);
}

- (void)setLastNameLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (UILabel)secondaryInfoLabel
{
  return (UILabel *)objc_getProperty(self, a2, 352, 1);
}

- (void)setSecondaryInfoLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSArray)statusLabelsArray
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (void)setStatusLabelsArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSTimer)statusLabelTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 368, 1);
}

- (void)setStatusLabelTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (unint64_t)currentStatusLabelIndex
{
  return self->_currentStatusLabelIndex;
}

- (void)setCurrentStatusLabelIndex:(unint64_t)a3
{
  self->_currentStatusLabelIndex = a3;
}

- (UIButton)conferenceParticipantsButton
{
  return (UIButton *)objc_getProperty(self, a2, 384, 1);
}

- (void)setConferenceParticipantsButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (UIButton)callDetailsViewButton
{
  return (UIButton *)objc_getProperty(self, a2, 392, 1);
}

- (void)setCallDetailsViewButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSLayoutConstraint)appIconHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 400, 1);
}

- (void)setAppIconHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSLayoutConstraint)appIconWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 408, 1);
}

- (void)setAppIconWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (UIImageView)businessLogoView
{
  return (UIImageView *)objc_getProperty(self, a2, 416, 1);
}

- (void)setBusinessLogoView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSLayoutConstraint)businessLogoHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 424, 1);
}

- (void)setBusinessLogoHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSLayoutConstraint)businessLogoWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 432, 1);
}

- (void)setBusinessLogoWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_getProperty(self, a2, 440, 1);
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return (ICSCallDisplayStyleManager *)objc_getProperty(self, a2, 448, 1);
}

- (PHBannerButtonsView)bannerButtonsView
{
  return self->_bannerButtonsView;
}

- (void)setBannerButtonsView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerButtonsView, a3);
}

- (int64_t)labelLayoutState
{
  return self->_labelLayoutState;
}

- (UITapGestureRecognizer)statusLabelTapRecognizer
{
  return self->_statusLabelTapRecognizer;
}

- (UITapGestureRecognizer)callDetailsGestureRecognizer
{
  return self->_callDetailsGestureRecognizer;
}

- (double)cachedBannerParticipantLabelWidth
{
  return self->_cachedBannerParticipantLabelWidth;
}

- (void)setCachedBannerParticipantLabelWidth:(double)a3
{
  self->_cachedBannerParticipantLabelWidth = a3;
}

- (NSNumber)previousIsCallRinging
{
  return self->_previousIsCallRinging;
}

- (void)setPreviousIsCallRinging:(id)a3
{
  objc_storeStrong((id *)&self->_previousIsCallRinging, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousIsCallRinging, 0);
  objc_storeStrong((id *)&self->_callDetailsGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusLabelTapRecognizer, 0);
  objc_storeStrong((id *)&self->_bannerButtonsView, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_businessLogoWidthConstraint, 0);
  objc_storeStrong((id *)&self->_businessLogoHeightConstraint, 0);
  objc_storeStrong((id *)&self->_businessLogoView, 0);
  objc_storeStrong((id *)&self->_appIconWidthConstraint, 0);
  objc_storeStrong((id *)&self->_appIconHeightConstraint, 0);
  objc_storeStrong((id *)&self->_callDetailsViewButton, 0);
  objc_storeStrong((id *)&self->_conferenceParticipantsButton, 0);
  objc_storeStrong((id *)&self->_statusLabelTimer, 0);
  objc_storeStrong((id *)&self->_statusLabelsArray, 0);
  objc_storeStrong((id *)&self->_secondaryInfoLabel, 0);
  objc_storeStrong((id *)&self->_lastNameLabel, 0);
  objc_storeStrong((id *)&self->_firstNameLabel, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleBottomConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleTopConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleMaxLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleMinLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangle, 0);
  objc_storeStrong((id *)&self->_secondaryInfoLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryInfoLabelHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_avatarViewConstraints, 0);
  objc_storeStrong((id *)&self->_businessLogoLayoutGuide, 0);
  objc_storeStrong((id *)&self->_appIconLayoutGuide, 0);
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_heightConstraints, 0);
  objc_storeStrong((id *)&self->_businessLogoLayoutGuideHorizontalAnchor, 0);
  objc_storeStrong((id *)&self->_businessLogoViewLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_appIconLayoutGuideHorizontalAnchor, 0);
  objc_storeStrong((id *)&self->_appIconViewLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_statusLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_participantMarqueeLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_participantMarqueeLabelHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_destroyWeak((id *)&self->_posterBadgeView);
  objc_destroyWeak((id *)&self->_posterNameViewModel);
  objc_destroyWeak((id *)&self->_trailingSideLayoutGuide);
  objc_destroyWeak((id *)&self->_leadingSideLayoutGuide);
}

- (id)currentIMNicknameMatchingContact:(id)a3
{
  id v5;
  PHSingleCallParticipantLabelView *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1001929B4((uint64_t)a3);

  return v7;
}

@end
