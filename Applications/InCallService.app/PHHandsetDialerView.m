@implementation PHHandsetDialerView

- (PHHandsetDialerView)initWithFrame:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PHHandsetDialerView *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  objc_super v39;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v39.receiver = self;
  v39.super_class = (Class)PHHandsetDialerView;
  v13 = -[PHHandsetDialerView initWithFrame:](&v39, "initWithFrame:", v6, v8, v10, v12);
  if (v13)
  {
    v14 = objc_alloc_init((Class)TUFeatureFlags);
    -[PHHandsetDialerView setFeatureFlags:](v13, "setFeatureFlags:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicBackgroundColor](UIColor, "dynamicBackgroundColor"));
    -[PHHandsetDialerView setBackgroundColor:](v13, "setBackgroundColor:", v15);

    -[PHHandsetDialerView setOpaque:](v13, "setOpaque:", 0);
    v16 = -[PHHandsetDialerView newLCDView](v13, "newLCDView");
    -[PHAbstractDialerView setLcdView:](v13, "setLcdView:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](v13, "lcdView"));
    objc_msgSend(v17, "setDelegate:", v13);

    v18 = -[PHHandsetDialerView newNumberPadView](v13, "newNumberPadView");
    -[PHAbstractDialerView setPhonePadView:](v13, "setPhonePadView:", v18);

    v19 = -[PHHandsetDialerView newCallButton](v13, "newCallButton");
    -[PHAbstractDialerView setCallButton:](v13, "setCallButton:", v19);

    v20 = -[PHHandsetDialerView newDeleteButton](v13, "newDeleteButton");
    -[PHAbstractDialerView setDeleteButton:](v13, "setDeleteButton:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](v13, "deleteButton"));
    objc_msgSend(v21, "setAlpha:", 0.0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v13, "phonePadView"));
    -[PHHandsetDialerView addSubview:](v13, "addSubview:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](v13, "lcdView"));
    -[PHHandsetDialerView addSubview:](v13, "addSubview:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView callButton](v13, "callButton"));
    -[PHHandsetDialerView addSubview:](v13, "addSubview:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](v13, "deleteButton"));
    -[PHHandsetDialerView addSubview:](v13, "addSubview:", v25);

    -[PHHandsetDialerView createDeleteButtonX](v13, "createDeleteButtonX");
    v26 = -[PHHandsetDialerView phonePadViewTopShouldConstrainToLCDView](v13, "phonePadViewTopShouldConstrainToLCDView");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v13, "phonePadView"));
    if (v26)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](v13, "lcdView"));
      -[PHHandsetDialerView _yOffsetForKeypadView](v13, "_yOffsetForKeypadView");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 3, 0, v28, 4, 1.0, v29));
      -[PHHandsetDialerView setPhonePadViewTopConstraint:](v13, "setPhonePadViewTopConstraint:", v30);

    }
    else
    {
      -[PHHandsetDialerView _yOffsetForKeypadView](v13, "_yOffsetForKeypadView");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 3, 0, v13, 3, 1.0, v31));
      -[PHHandsetDialerView setPhonePadViewTopConstraint:](v13, "setPhonePadViewTopConstraint:", v28);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerView phonePadViewTopConstraint](v13, "phonePadViewTopConstraint"));
    -[PHHandsetDialerView addConstraint:](v13, "addConstraint:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView callButton](v13, "callButton"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](v13, "phonePadView"));
    -[PHHandsetDialerView _keypadToCallButtonYSpacing](v13, "_keypadToCallButtonYSpacing");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 3, 0, v34, 4, 1.0, v35));
    -[PHHandsetDialerView setCallButtonKeypadOffsetConstraint:](v13, "setCallButtonKeypadOffsetConstraint:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerView callButtonKeypadOffsetConstraint](v13, "callButtonKeypadOffsetConstraint"));
    -[PHHandsetDialerView addConstraint:](v13, "addConstraint:", v37);

    -[PHHandsetDialerView updateContraintsForStatusBar](v13, "updateContraintsForStatusBar");
    -[PHHandsetDialerView createConstraints](v13, "createConstraints");
  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHHandsetDialerView;
  -[PHAbstractDialerView dealloc](&v4, "dealloc");
}

- (void)createConstraints
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
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self, "lcdView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 3, 0, self, 3, 1.0, 0.0));
  -[PHHandsetDialerView addConstraint:](self, "addConstraint:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView callButton](self, "callButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self, "phonePadView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 9, 0, v6, 9, 1.0, 0.0));
  -[PHHandsetDialerView addConstraint:](self, "addConstraint:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self, "phonePadView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 9, 0, self, 9, 1.0, 0.0));
  -[PHHandsetDialerView addConstraint:](self, "addConstraint:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](self, "deleteButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self, "phonePadView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self, "phonePadView"));
  objc_msgSend(v12, "bounds");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 9, 0, v11, 2, 1.0, v13 / -6.0 + -2.0));
  -[PHHandsetDialerView addConstraint:](self, "addConstraint:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](self, "deleteButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView callButton](self, "callButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 10, 0, v16, 10, 1.0, 0.0));
  -[PHHandsetDialerView addConstraint:](self, "addConstraint:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self, "lcdView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 9, 0, self, 9, 1.0, 0.0));
  -[PHHandsetDialerView addConstraint:](self, "addConstraint:", v19);

  v24 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self, "lcdView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self, "phonePadView"));
  objc_msgSend(v21, "bounds");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", v22));
  objc_msgSend(v23, "setActive:", 1);

}

- (BOOL)dialerIsNumericOnly
{
  if (qword_1002DC978 != -1)
    dispatch_once(&qword_1002DC978, &stru_1002863A0);
  return byte_1002DC970;
}

- (void)updateContraintsForStatusBar
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[PHHandsetDialerView _keypadToCallButtonYSpacing](self, "_keypadToCallButtonYSpacing");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerView callButtonKeypadOffsetConstraint](self, "callButtonKeypadOffsetConstraint"));
  objc_msgSend(v5, "setConstant:", v4);

  -[PHHandsetDialerView _yOffsetForKeypadView](self, "_yOffsetForKeypadView");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerView phonePadViewTopConstraint](self, "phonePadViewTopConstraint"));
  objc_msgSend(v8, "setConstant:", v7);

  -[PHHandsetDialerView _yOffsetForAddContactButton](self, "_yOffsetForAddContactButton");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerView addContactButtonTopConstraint](self, "addContactButtonTopConstraint"));
  objc_msgSend(v11, "setConstant:", v10);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self, "phonePadView"));
  objc_msgSend(v12, "invalidateIntrinsicContentSize");

}

- (void)setIsHostedInRemoteViewController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PHHandsetDialerView;
  -[PHAbstractDialerView setIsHostedInRemoteViewController:](&v6, "setIsHostedInRemoteViewController:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self, "lcdView"));
  objc_msgSend(v5, "setIsHostedInRemoteViewController:", v3);

  -[PHHandsetDialerView updateContraintsForStatusBar](self, "updateContraintsForStatusBar");
}

- (id)newLCDView
{
  PHHandsetDialerLCDView *v3;
  PHHandsetDialerLCDView *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = [PHHandsetDialerLCDView alloc];
  -[PHHandsetDialerView bounds](self, "bounds");
  v4 = -[PHHandsetDialerLCDView initWithFrame:forDialerType:](v3, "initWithFrame:forDialerType:", 0, 0.0, 0.0);
  -[PHHandsetDialerLCDView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](v4, "addContactButton"));
  -[PHAbstractDialerView setAddContactButton:](self, "setAddContactButton:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView searchButton](v4, "searchButton"));
  -[PHAbstractDialerView setSearchButton:](self, "setSearchButton:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactCountButton](v4, "contactCountButton"));
  -[PHAbstractDialerView setContactCountButton:](self, "setContactCountButton:", v7);

  return v4;
}

- (id)numberPadButtonsForCharacters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006E33C;
  v9[3] = &unk_100285388;
  v9[4] = self;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

- (void)createDeleteButtonX
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIView *v16;
  UIView *deleteButtonXView;
  void *v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerView deleteButtonXImageView](self, "deleteButtonXImageView"));
  v3 = objc_alloc((Class)UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](self, "deleteButton"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  +[PHHandsetDialerNumberPadButton circleBounds](PHHandsetDialerNumberPadButton, "circleBounds");
  v8 = v6 - (v7 * 0.5 + 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](self, "deleteButton"));
  objc_msgSend(v9, "frame");
  v11 = v10 * 0.5;
  objc_msgSend(v19, "frame");
  v13 = v11 - v12 * 0.5;
  objc_msgSend(v19, "frame");
  v15 = v14;
  objc_msgSend(v19, "frame");
  v16 = (UIView *)objc_msgSend(v3, "initWithFrame:", v8, v13, v15);
  deleteButtonXView = self->_deleteButtonXView;
  self->_deleteButtonXView = v16;

  -[UIView setUserInteractionEnabled:](self->_deleteButtonXView, "setUserInteractionEnabled:", 0);
  -[UIView addSubview:](self->_deleteButtonXView, "addSubview:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](self, "deleteButton"));
  objc_msgSend(v18, "addSubview:", self->_deleteButtonXView);

}

- (id)deleteButtonXImageView
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = objc_alloc((Class)UIImageView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("keypad-delete-x")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithRenderingMode:", 2));
  v5 = objc_msgSend(v2, "initWithImage:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
  objc_msgSend(v5, "setTintColor:", v6);

  return v5;
}

- (id)deleteButtonImageName
{
  return CFSTR("keypad-delete-arrow");
}

- (id)newDeleteButton
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHHandsetDialerDeleteButton buttonWithType:](PHHandsetDialerDeleteButton, "buttonWithType:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setOpaque:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
  objc_msgSend(v3, "setTintColor:", v5);

  objc_msgSend(v3, "setHighlighted:", 0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1144750080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerView deleteButtonImageName](self, "deleteButtonImageName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v7));

  objc_msgSend(v3, "setImage:forState:", v8, 0);
  +[PHHandsetDialerNumberPadButton circleBounds](PHHandsetDialerNumberPadButton, "circleBounds");
  v10 = v9 * 0.5;
  objc_msgSend(v8, "size");
  v12 = v10 - v11 * 0.5;
  +[PHHandsetDialerNumberPadButton circleBounds](PHHandsetDialerNumberPadButton, "circleBounds");
  v14 = v13 * 0.5;
  objc_msgSend(v8, "size");
  v16 = v14 - v15 * 0.5;
  +[PHHandsetDialerNumberPadButton circleBounds](PHHandsetDialerNumberPadButton, "circleBounds");
  v18 = v17 * 0.5;
  objc_msgSend(v8, "size");
  v20 = v18 - v19 * 0.5;
  +[PHHandsetDialerNumberPadButton circleBounds](PHHandsetDialerNumberPadButton, "circleBounds");
  v22 = v21 * 0.5;
  objc_msgSend(v8, "size");
  objc_msgSend(v3, "setContentEdgeInsets:", v12, v16, v20, v22 - v23 * 0.5);
  +[PHHandsetDialerNumberPadButton circleBounds](PHHandsetDialerNumberPadButton, "circleBounds");
  v25 = v24 * 0.5;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v26, "setCornerRadius:", v25);

  objc_msgSend(v3, "sizeToFit");
  return v3;
}

- (void)setDeleteButtonAlpha:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](self, "deleteButton"));
  objc_msgSend(v4, "setAlpha:", a3);

}

- (id)newNumberPadView
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (-[PHHandsetDialerView dialerIsNumericOnly](self, "dialerIsNumericOnly"))
    v3 = objc_claimAutoreleasedReturnValue(+[TPDialerNumberPad dialerNumberPadNumericCharacters](TPDialerNumberPad, "dialerNumberPadNumericCharacters"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[TPDialerNumberPad dialerNumberPadFullCharacters](TPDialerNumberPad, "dialerNumberPadFullCharacters"));
  v4 = (void *)v3;
  v5 = objc_alloc((Class)TPDialerNumberPad);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerView numberPadButtonsForCharacters:](self, "numberPadButtonsForCharacters:", v4));
  v7 = objc_msgSend(v5, "initWithButtons:", v6);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v7;
}

- (id)newCallButton
{
  PHBottomBarButtonConfiguration *v3;
  PHBottomBarButtonConfiguration *v4;
  PHBottomBarButton *v5;

  v3 = [PHBottomBarButtonConfiguration alloc];
  -[PHHandsetDialerView callButtonDiameter](self, "callButtonDiameter");
  v4 = -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:](v3, "initWithAction:diameter:callState:", 1, 2);
  v5 = -[PHBottomBarButton initWithConfiguration:]([PHBottomBarButton alloc], "initWithConfiguration:", v4);
  -[PHBottomBarButton setTitle:forState:](v5, "setTitle:forState:", 0, 0);
  -[PHBottomBarButton setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  return v5;
}

- (double)callButtonDiameter
{
  double v2;
  double v3;
  double result;

  +[PHBottomBarButtonConfiguration defaultWidth](PHBottomBarButtonConfiguration, "defaultWidth");
  v3 = v2;
  if (!+[PHInCallUIUtilities hasMultipleSenderIdentities](PHInCallUIUtilities, "hasMultipleSenderIdentities")|| (+[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing") | 2) != 2)
  {
    return v3;
  }
  +[PHHandsetDialerNumberPadButton outerCircleDiameter](PHHandsetDialerNumberPadButton, "outerCircleDiameter");
  return result;
}

- (double)_yOffsetForAddContactButton
{
  double v3;

  v3 = 0.0;
  if (+[PHUIConfiguration requiresSmallScreenConfig](PHUIConfiguration, "requiresSmallScreenConfig")
    && !+[PHInCallUIUtilities hasMultipleSenderIdentities](PHInCallUIUtilities, "hasMultipleSenderIdentities"))
  {
    if (-[PHAbstractDialerView isHostedInRemoteViewController](self, "isHostedInRemoteViewController"))
      return 0.0;
    else
      return 15.0;
  }
  return v3;
}

- (double)_yOffsetForKeypadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  if (+[PHUIConfiguration shouldUseExplicitLayoutDimensions](PHUIConfiguration, "shouldUseExplicitLayoutDimensions"))
  {
    -[PHHandsetDialerView yOffsetFromKeypadToLCDViewForExplicitLayoutDevices](self, "yOffsetFromKeypadToLCDViewForExplicitLayoutDevices");
  }
  else
  {
    v3 = 84.0;
    switch(+[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing"))
    {
      case 0uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding](PHHandsetDialerNumberPadButton, "verticalPadding");
        v5 = 17.0;
        goto LABEL_13;
      case 1uLL:
        break;
      case 2uLL:
        if (+[PHInCallUIUtilities hasMultipleSenderIdentities](PHInCallUIUtilities, "hasMultipleSenderIdentities"))
        {
          v3 = 156.0;
        }
        else
        {
          v3 = 141.0;
        }
        break;
      case 3uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding](PHHandsetDialerNumberPadButton, "verticalPadding");
        v5 = 173.5;
        goto LABEL_13;
      case 4uLL:
        v3 = 87.5;
        break;
      case 5uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding](PHHandsetDialerNumberPadButton, "verticalPadding");
        v5 = 81.0;
        goto LABEL_13;
      case 6uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding](PHHandsetDialerNumberPadButton, "verticalPadding");
        v5 = 99.0;
LABEL_13:
        v3 = v5 - v4;
        break;
      default:
        v3 = 150.0;
        break;
    }
    -[PHHandsetDialerView _remoteViewControllerDialerOffset](self, "_remoteViewControllerDialerOffset");
    v7 = v3 - v6;
    +[PHUIConfiguration yOffsetForSmartDialerLCDView](PHUIConfiguration, "yOffsetForSmartDialerLCDView");
    return v7 - v8;
  }
  return result;
}

- (double)_remoteViewControllerDialerOffset
{
  double v2;
  unint64_t v3;

  v2 = 0.0;
  if (-[PHAbstractDialerView isHostedInRemoteViewController](self, "isHostedInRemoteViewController"))
  {
    v3 = +[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing");
    if (v3 <= 6)
      return dbl_10023FCC8[v3];
  }
  return v2;
}

- (double)_keypadToCallButtonYSpacing
{
  unint64_t v3;
  double v4;
  double v5;
  double result;

  if (+[PHUIConfiguration shouldUseExplicitLayoutDimensions](PHUIConfiguration, "shouldUseExplicitLayoutDimensions"))
  {
    -[PHHandsetDialerView yOffsetFromKeypadToDialerButtonForExplictLayoutDevices](self, "yOffsetFromKeypadToDialerButtonForExplictLayoutDevices");
  }
  else
  {
    v3 = +[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing");
    result = 7.0;
    switch(v3)
    {
      case 0uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding](PHHandsetDialerNumberPadButton, "verticalPadding", 7.0);
        break;
      case 1uLL:
        return result;
      case 3uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding](PHHandsetDialerNumberPadButton, "verticalPadding", 7.0);
        v5 = 17.0;
        goto LABEL_8;
      case 5uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding](PHHandsetDialerNumberPadButton, "verticalPadding", 7.0);
        v5 = 18.0;
LABEL_8:
        result = v5 - v4;
        break;
      default:
        result = 8.5;
        break;
    }
  }
  return result;
}

- (double)yOffsetFromKeypadToLCDViewForExplicitLayoutDevices
{
  unint64_t v3;
  double result;
  BOOL v5;

  v3 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  result = 3.0;
  switch(v3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      v5 = !-[PHAbstractDialerView isHostedInRemoteViewController](self, "isHostedInRemoteViewController", 3.0);
      result = 17.0;
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      return 38.0;
    case 4uLL:
    case 9uLL:
      goto LABEL_8;
    default:
      if (v3 != 15 && v3 != 13)
        return 38.0;
LABEL_8:
      v5 = !-[PHAbstractDialerView isHostedInRemoteViewController](self, "isHostedInRemoteViewController", 3.0);
      result = 20.0;
LABEL_9:
      if (!v5)
        return 12.0;
      return result;
  }
}

- (double)yOffsetFromKeypadToDialerButtonForExplictLayoutDevices
{
  double v2;
  double v3;
  double v4;
  double v5;

  v2 = 0.0;
  switch(+[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize"))
  {
    case 0uLL:
      +[PHHandsetDialerNumberPadButton verticalPadding](PHHandsetDialerNumberPadButton, "verticalPadding");
      v4 = 3.5;
      goto LABEL_6;
    case 1uLL:
      +[PHHandsetDialerNumberPadButton verticalPadding](PHHandsetDialerNumberPadButton, "verticalPadding");
      v4 = 8.5;
LABEL_6:
      v2 = v3 + v4;
      break;
    case 4uLL:
    case 0xAuLL:
    case 0xFuLL:
      v2 = 18.0;
      break;
    case 9uLL:
    case 0xBuLL:
    case 0xDuLL:
      v2 = 9.0;
      break;
    case 0xCuLL:
      v2 = 19.0;
      break;
    case 0xEuLL:
      v2 = 26.0;
      break;
    default:
      break;
  }
  +[PHHandsetDialerNumberPadButton verticalPadding](PHHandsetDialerNumberPadButton, "verticalPadding");
  return v2 - v5;
}

- (BOOL)phonePadViewTopShouldConstrainToLCDView
{
  unint64_t v2;

  v2 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  return (v2 < 0x10) & (0xFC31u >> v2);
}

- (NSLayoutConstraint)phonePadViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPhonePadViewTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSLayoutConstraint)addContactButtonTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAddContactButtonTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSLayoutConstraint)callButtonKeypadOffsetConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCallButtonKeypadOffsetConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (UIView)deleteButtonXView
{
  return self->_deleteButtonXView;
}

- (void)setDeleteButtonXView:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButtonXView, a3);
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_deleteButtonXView, 0);
  objc_storeStrong((id *)&self->_callButtonKeypadOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_addContactButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_phonePadViewTopConstraint, 0);
}

@end
