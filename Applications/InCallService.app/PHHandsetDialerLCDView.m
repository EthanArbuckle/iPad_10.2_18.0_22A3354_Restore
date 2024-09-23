@implementation PHHandsetDialerLCDView

- (double)numberLabelMaximumFontSize
{
  double result;

  +[PHUIConfiguration dialerLCDFontSize](PHUIConfiguration, "dialerLCDFontSize");
  return result;
}

- (float)numberLabelMinimumFontSize
{
  return 25.0;
}

- (float)spacingBetweenNumberBaselineAndNameBaseline
{
  unint64_t v2;
  float result;
  float v4;

  v2 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  result = 25.0;
  switch(v2)
  {
    case 0xBuLL:
    case 0xDuLL:
    case 0xFuLL:
      return result;
    case 0xCuLL:
    case 0xEuLL:
      v4 = 42.0;
      goto LABEL_6;
    default:
      if (v2)
      {
        v4 = 34.0;
LABEL_6:
        result = v4;
      }
      else
      {
        result = 24.0;
      }
      break;
  }
  return result;
}

- (id)numberLabelFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 36.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "withCaseSensitiveAttribute"));

  return v3;
}

- (double)nameAndLabelFontSize
{
  double result;

  +[PHUIConfiguration dialerLCDLabelFontSize](PHUIConfiguration, "dialerLCDLabelFontSize");
  return result;
}

- (float)addNumberFontSize
{
  unint64_t v2;
  float result;

  v2 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  result = 18.0;
  if (!v2)
    return 16.0;
  return result;
}

- (id)generateNumberLabelHorizontalConstraints
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;

  v7 = CFSTR("numberLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberTextField](self, "numberTextField"));
  v8 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("|[numberLabel]|")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v4, 0x10000, 0, v3));

  return v5;
}

- (PHHandsetDialerLCDView)initWithFrame:(CGRect)a3 forDialerType:(int)a4
{
  uint64_t v4;
  PHHandsetDialerLCDView *v5;
  TUFeatureFlags *v6;
  TUFeatureFlags *featureFlags;
  void *v8;
  PHLCDViewTextField *v9;
  double y;
  double width;
  double height;
  PHLCDViewTextField *v13;
  PHLCDViewTextField *numberTextField;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  double v20;
  id v21;
  id v22;
  PHLCDViewTextField *v23;
  UITextField *layoutTextField;
  void *v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  objc_super v44;

  v4 = *(_QWORD *)&a4;
  v44.receiver = self;
  v44.super_class = (Class)PHHandsetDialerLCDView;
  v5 = -[PHHandsetDialerLCDView initWithFrame:](&v44, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v5->_featureFlags;
    v5->_featureFlags = v6;

    -[PHHandsetDialerLCDView setDialerType:](v5, "setDialerType:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHHandsetDialerLCDView setBackgroundColor:](v5, "setBackgroundColor:", v8);

    if (-[PHHandsetDialerLCDView canBecomeFirstResponder](v5, "canBecomeFirstResponder"))
      -[PHHandsetDialerLCDView becomeFirstResponder](v5, "becomeFirstResponder");
    v9 = [PHLCDViewTextField alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v13 = -[PHLCDViewTextField initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    numberTextField = v5->_numberTextField;
    v5->_numberTextField = v13;

    -[PHLCDViewTextField setDelegate:](v5->_numberTextField, "setDelegate:", v5);
    -[PHLCDViewTextField setLcdViewTextFieldDelegate:](v5->_numberTextField, "setLcdViewTextFieldDelegate:", v5);
    -[PHLCDViewTextField setTranslatesAutoresizingMaskIntoConstraints:](v5->_numberTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHLCDViewTextField setBackgroundColor:](v5->_numberTextField, "setBackgroundColor:", v15);

    -[PHLCDViewTextField setOpaque:](v5->_numberTextField, "setOpaque:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
    -[PHLCDViewTextField setTextColor:](v5->_numberTextField, "setTextColor:", v16);

    -[PHLCDViewTextField setTextAlignment:](v5->_numberTextField, "setTextAlignment:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberLabelFont](v5, "numberLabelFont"));
    -[PHLCDViewTextField setFont:](v5->_numberTextField, "setFont:", v17);

    -[PHHandsetDialerLCDView numberLabelMinimumFontSize](v5, "numberLabelMinimumFontSize");
    -[PHLCDViewTextField setMinimumFontSize:](v5->_numberTextField, "setMinimumFontSize:", v18);
    -[PHLCDViewTextField setAdjustsFontSizeToFitWidth:](v5->_numberTextField, "setAdjustsFontSizeToFitWidth:", 1);
    -[PHLCDViewTextField setText:](v5->_numberTextField, "setText:", &stru_10028DC20);
    -[PHLCDViewTextField sizeToFit](v5->_numberTextField, "sizeToFit");
    LODWORD(v19) = 1144750080;
    -[PHLCDViewTextField setContentCompressionResistancePriority:forAxis:](v5->_numberTextField, "setContentCompressionResistancePriority:forAxis:", 0, v19);
    LODWORD(v20) = 1132068864;
    -[PHLCDViewTextField setContentHuggingPriority:forAxis:](v5->_numberTextField, "setContentHuggingPriority:forAxis:", 0, v20);
    -[PHHandsetDialerLCDView addSubview:](v5, "addSubview:", v5->_numberTextField);
    v21 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v5, "handleTapGesture:");
    -[PHHandsetDialerLCDView addGestureRecognizer:](v5, "addGestureRecognizer:", v21);
    v22 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v5, "handleTapGesture:");
    -[PHLCDViewTextField addGestureRecognizer:](v5->_numberTextField, "addGestureRecognizer:", v22);
    v23 = -[PHLCDViewTextField initWithFrame:]([PHLCDViewTextField alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    layoutTextField = v5->_layoutTextField;
    v5->_layoutTextField = &v23->super;

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v5->_layoutTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField setTextAlignment:](v5->_layoutTextField, "setTextAlignment:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberLabelFont](v5, "numberLabelFont"));
    -[UITextField setFont:](v5->_layoutTextField, "setFont:", v25);

    -[UITextField setText:](v5->_layoutTextField, "setText:", CFSTR("M"));
    -[UITextField setHidden:](v5->_layoutTextField, "setHidden:", 1);
    -[UITextField sizeToFit](v5->_layoutTextField, "sizeToFit");
    LODWORD(v26) = 1144750080;
    -[UITextField setContentCompressionResistancePriority:forAxis:](v5->_layoutTextField, "setContentCompressionResistancePriority:forAxis:", 0, v26);
    LODWORD(v27) = 1132068864;
    -[UITextField setContentHuggingPriority:forAxis:](v5->_layoutTextField, "setContentHuggingPriority:forAxis:", 0, v27);
    -[PHHandsetDialerLCDView addSubview:](v5, "addSubview:", v5->_layoutTextField);
    v28 = -[PHHandsetDialerLCDView newAddContactButton](v5, "newAddContactButton");
    -[PHHandsetDialerLCDView setAddContactButton:](v5, "setAddContactButton:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](v5, "addContactButton"));
    objc_msgSend(v29, "addTarget:action:forEvents:", v5, "addContactPressed:", 64);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](v5, "addContactButton"));
    objc_msgSend(v30, "setAlpha:", 0.0);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](v5, "addContactButton"));
    -[PHHandsetDialerLCDView addSubview:](v5, "addSubview:", v31);

    v32 = objc_alloc_init((Class)UILabel);
    -[PHHandsetDialerLCDView setContactLabel:](v5, "setContactLabel:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](v5, "contactLabel"));
    objc_msgSend(v34, "setTextColor:", v33);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](v5, "contactLabel"));
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 36.0));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](v5, "contactLabel"));
    objc_msgSend(v37, "setFont:", v36);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](v5, "contactLabel"));
    objc_msgSend(v38, "sizeToFit");

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](v5, "contactLabel"));
    objc_msgSend(v39, "setAlpha:", 0.0);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](v5, "contactLabel"));
    -[PHHandsetDialerLCDView addSubview:](v5, "addSubview:", v40);

    v41 = objc_alloc_init((Class)UILayoutGuide);
    -[PHHandsetDialerLCDView setPillLayoutGuide:](v5, "setPillLayoutGuide:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillLayoutGuide](v5, "pillLayoutGuide"));
    -[PHHandsetDialerLCDView addLayoutGuide:](v5, "addLayoutGuide:", v42);

    -[PHHandsetDialerLCDView applyLayoutConstraints](v5, "applyLayoutConstraints");
  }
  return v5;
}

- (id)menuForPillView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView selectedSenderIdentity](self, "selectedSenderIdentity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderIdentityMenuForDialerField:selectedSenderIdentity:", self, v5));

  return v6;
}

- (void)setSenderIdentity:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (a3)
  {
    -[PHHandsetDialerLCDView createPillViewForSenderIdentity:](self, "createPillViewForSenderIdentity:", v5);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillView](self, "pillView"));
    objc_msgSend(v6, "removeFromSuperview");

    -[PHHandsetDialerLCDView setPillView:](self, "setPillView:", 0);
  }
  -[PHHandsetDialerLCDView setSelectedSenderIdentity:](self, "setSelectedSenderIdentity:", v7);

}

- (void)createPillViewForSenderIdentity:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  _QWORD v30[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillView](self, "pillView"));

  if (!v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)TPPillView), "initWithTitle:frame:", &stru_10028DC20, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v7) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v8);
    -[PHHandsetDialerLCDView setPillView:](self, "setPillView:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillView](self, "pillView"));
    -[PHHandsetDialerLCDView addSubview:](self, "addSubview:", v9);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillView](self, "pillView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillLayoutGuide](self, "pillLayoutGuide"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
    v30[0] = v25;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillView](self, "pillView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillLayoutGuide](self, "pillLayoutGuide"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
    v30[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillView](self, "pillView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillLayoutGuide](self, "pillLayoutGuide"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerXAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
    v30[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillView](self, "pillView"));
  objc_msgSend(v18, "setTitle:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedShortName"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillView](self, "pillView"));
  objc_msgSend(v20, "setBadgeText:", v19);

}

- (CGSize)intrinsicContentSize
{
  unint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = +[PHUIConfiguration handsetDialerSize](PHUIConfiguration, "handsetDialerSize");
  v3 = 52.0;
  if (v2 != 1)
    v3 = 64.0;
  v4 = 340.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHHandsetDialerLCDView;
  -[PHHandsetDialerLCDView dealloc](&v4, "dealloc");
}

- (void)endEditing
{
  -[PHLCDViewTextField endEditing:](self->_numberTextField, "endEditing:", 1);
}

- (id)text
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField text](self->_numberTextField, "text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet unicodeDirectionalCharactersSet](NSCharacterSet, "unicodeDirectionalCharactersSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByRemovingCharactersFromSet:", v3));

  return v4;
}

- (id)unformattedText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView text](self, "text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "unformattedNumber"));

  return v3;
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4 name:(id)a5 label:(id)a6
{
  PHLCDViewTextField *numberTextField;
  id v9;
  id v10;

  numberTextField = self->_numberTextField;
  v9 = a5;
  v10 = a3;
  -[PHLCDViewTextField setText:](numberTextField, "setText:", v10);
  -[PHHandsetDialerLCDView updateAddAndDeleteButtonForText:name:animated:](self, "updateAddAndDeleteButtonForText:name:animated:", v10, v9, 1);

}

- (void)setText:(id)a3 needsFormat:(BOOL)a4
{
  -[PHLCDViewTextField setText:](self->_numberTextField, "setText:", a3, a4);
}

- (void)deleteCharacter
{
  unsigned __int8 v3;
  PHLCDViewTextField *numberTextField;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = -[PHLCDViewTextField isEditing](self->_numberTextField, "isEditing");
  numberTextField = self->_numberTextField;
  if ((v3 & 1) != 0)
  {
    -[PHLCDViewTextField deleteBackward](numberTextField, "deleteBackward");
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField text](numberTextField, "text"));
    v5 = UIFormattedPhoneStringByRemovingFromEnd();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[PHLCDViewTextField setText:](numberTextField, "setText:", v6);

  }
}

- (BOOL)shouldInsertStringAtCurrentPosition:(id)a3 deletingPreviousCharacter:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  unsigned int v13;
  PHLCDViewTextField *numberTextField;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet pauseCharacterSet](NSCharacterSet, "pauseCharacterSet"));
  v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v7);

  if (v8)
    v9 = 1;
  else
    v9 = !v4;
  if (v9)
    return 1;
  if (-[PHLCDViewTextField isEditing](self->_numberTextField, "isEditing"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet unicodeDirectionalCharactersSet](NSCharacterSet, "unicodeDirectionalCharactersSet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField text](self->_numberTextField, "text"));
    v13 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", 0));

    numberTextField = self->_numberTextField;
    if (v13)
    {
      return (unint64_t)-[PHLCDViewTextField selectionRange](numberTextField, "selectionRange") > 2;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField selectedTextRange](numberTextField, "selectedTextRange"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "start"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField beginningOfDocument](self->_numberTextField, "beginningOfDocument"));
      v10 = v20 != v21;

    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField text](self->_numberTextField, "text"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet unicodeDirectionalCharactersSet](NSCharacterSet, "unicodeDirectionalCharactersSet"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet starAndOctothorpeCharacterSet](NSCharacterSet, "starAndOctothorpeCharacterSet"));
    v10 = objc_msgSend(v17, "rangeOfCharacterFromSet:", v18) != 0;

  }
  return v10;
}

- (void)insertStringAtCurrentPosition:(id)a3
{
  -[PHHandsetDialerLCDView insertStringAtCurrentPosition:deletingPreviousCharacter:](self, "insertStringAtCurrentPosition:deletingPreviousCharacter:", a3, 0);
}

- (void)insertStringAtCurrentPosition:(id)a3 deletingPreviousCharacter:(BOOL)a4
{
  _BOOL4 v4;
  PHLCDViewTextField *numberTextField;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (-[PHHandsetDialerLCDView shouldInsertStringAtCurrentPosition:deletingPreviousCharacter:](self, "shouldInsertStringAtCurrentPosition:deletingPreviousCharacter:"))
  {
    if (-[PHLCDViewTextField isEditing](self->_numberTextField, "isEditing"))
    {
      if (v4)
        -[PHLCDViewTextField deleteBackward](self->_numberTextField, "deleteBackward");
      numberTextField = self->_numberTextField;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField selectedTextRange](numberTextField, "selectedTextRange"));
      -[PHLCDViewTextField replaceRange:withText:](numberTextField, "replaceRange:withText:", v7, v9);
    }
    else
    {
      if (v4)
        -[PHHandsetDialerLCDView deleteCharacter](self, "deleteCharacter");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView text](self, "text"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", v9));

      -[PHHandsetDialerLCDView setText:needsFormat:](self, "setText:needsFormat:", v7, !v4);
    }

    -[PHHandsetDialerLCDView _requestMakeCutCopyPasteCalloutVisible:](self, "_requestMakeCutCopyPasteCalloutVisible:", 0);
  }

}

- (void)setName:(id)a3 numberLabel:(id)a4
{
  -[PHHandsetDialerLCDView setName:numberLabel:suggestion:](self, "setName:numberLabel:suggestion:", a3, a4, 0);
}

- (void)setName:(id)a3 numberLabel:(id)a4 suggestion:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView text](self, "text"));
  -[PHHandsetDialerLCDView updateAddAndDeleteButtonForText:name:label:suggestion:animated:](self, "updateAddAndDeleteButtonForText:name:label:suggestion:animated:", v10, v9, v8, v5, 1);

}

- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 animated:(BOOL)a5
{
  -[PHHandsetDialerLCDView updateAddAndDeleteButtonForText:name:label:suggestion:animated:](self, "updateAddAndDeleteButtonForText:name:label:suggestion:animated:", a3, a4, 0, 0, a5);
}

- (id)attributedStringForName:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)NSMutableAttributedString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v7));
  v10 = objc_msgSend(v8, "initWithString:", v9);

  -[PHHandsetDialerLCDView nameAndLabelFontSize](self, "nameAndLabelFontSize");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  v12 = objc_msgSend(v7, "length");

  objc_msgSend(v10, "addAttribute:value:range:", NSFontAttributeName, v11, 0, v12);
  if (v6)
  {
    v13 = objc_alloc((Class)NSAttributedString);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@"), v6));
    v15 = objc_msgSend(v13, "initWithString:", v14);
    objc_msgSend(v10, "appendAttributedString:", v15);

    objc_msgSend(v11, "pointSize");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
    objc_msgSend(v10, "addAttribute:value:range:", NSFontAttributeName, v16, (_BYTE *)objc_msgSend(v10, "length") - (_BYTE *)objc_msgSend(v6, "length"), objc_msgSend(v6, "length"));

  }
  v17 = objc_msgSend(v10, "copy");

  return v17;
}

- (void)checkAndUpdateVisibilityForView:(id)a3 shouldInvertVisibility:(BOOL)a4
{
  double v4;
  id v5;

  if (a4)
  {
    v5 = a3;
    objc_msgSend(v5, "alpha");
    objc_msgSend(v5, "setAlpha:", 1.0 - v4);

  }
}

- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 label:(id)a5 suggestion:(BOOL)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  BOOL *p_addContactButtonVisible;
  void *v20;
  double v21;
  double v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v26;
  double v27;
  double v28;
  _QWORD *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  BOOL v33;
  BOOL v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];

  v7 = a7;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(a3, "length");
  v14 = v13;
  v15 = v13 != 0;
  if (v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView attributedStringForName:label:](self, "attributedStringForName:label:", v11, v12));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](self, "contactLabel"));
    objc_msgSend(v17, "setAttributedText:", v16);

    p_addContactButtonVisible = &self->_addContactButtonVisible;
    if (self->_addContactButtonVisible && v14 != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](self, "addContactButton"));
      objc_msgSend(v20, "alpha");
      v22 = v21;

      if (v22 >= 0.0)
      {
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100007CF4;
        v38[3] = &unk_1002848C0;
        v38[4] = self;
        v23 = objc_retainBlock(v38);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100007D90;
        v37[3] = &unk_100284898;
        v37[4] = self;
        v24 = v37;
LABEL_14:
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v24, v23, 0.150000006);

      }
    }
  }
  else
  {
    p_addContactButtonVisible = &self->_addContactButtonVisible;
    if (self->_addContactButtonVisible && v13 != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](self, "contactLabel"));
      objc_msgSend(v26, "alpha");
      v28 = v27;

      if (v28 >= 0.0)
      {
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100007DC4;
        v36[3] = &unk_1002848C0;
        v36[4] = self;
        v23 = objc_retainBlock(v36);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100007E60;
        v35[3] = &unk_100284898;
        v35[4] = self;
        v24 = v35;
        goto LABEL_14;
      }
    }
  }
  if (*p_addContactButtonVisible != v15 || self->_deleteButtonVisible != v15)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100007E94;
    v31[3] = &unk_1002848E8;
    v31[4] = self;
    v33 = v15;
    v32 = v11;
    v34 = v15;
    v29 = objc_retainBlock(v31);
    v30 = v29;
    if (v7)
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v29, 0.300000012);
    else
      ((void (*)(_QWORD *))v29[2])(v29);
    *p_addContactButtonVisible = v15;
    self->_deleteButtonVisible = v15;

  }
}

- (void)_makeCalloutVisible:(BOOL)a3
{
  int v3;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  id v17;
  CGRect v18;
  CGRect v19;

  v3 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
  if (objc_msgSend(v17, "isMenuVisible") != v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    if (v3)
    {
      -[PHHandsetDialerLCDView bounds](self, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[PHHandsetDialerLCDView bounds](self, "bounds");
      v15 = floor(v14 * 0.5);
      if (v15 <= 25.0)
        v16 = v15;
      else
        v16 = 25.0;
      v18.origin.x = v7;
      v18.origin.y = v9;
      v18.size.width = v11;
      v18.size.height = v13;
      v19 = CGRectInset(v18, 0.0, v16);
      objc_msgSend(v17, "setTargetRect:inView:", self, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
      objc_msgSend(v17, "setArrowDirection:", 1);
      objc_msgSend(v17, "setMenuVisible:animated:", 1, 1);
      objc_msgSend(v5, "addObserver:selector:name:object:", self, "_menuDidHide:", UIMenuControllerDidHideMenuNotification, 0);
    }
    else
    {
      objc_msgSend(v17, "setMenuVisible:animated:", 0, 1);
      objc_msgSend(v5, "removeObserver:name:object:", self, UIMenuControllerDidHideMenuNotification, 0);
    }

  }
}

- (void)_menuDidHide:(id)a3
{
  -[PHHandsetDialerLCDView _makeCalloutVisible:](self, "_makeCalloutVisible:", 0);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHHandsetDialerLCDView;
  v3 = -[PHHandsetDialerLCDView resignFirstResponder](&v5, "resignFirstResponder");
  if (v3)
    -[PHHandsetDialerLCDView _makeCalloutVisible:](self, "_makeCalloutVisible:", 0);
  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  objc_super v11;

  v6 = a4;
  if ("copy:" == a3
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView text](self, "text")),
        v8 = objc_msgSend(v7, "length"),
        v7,
        !v8))
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PHHandsetDialerLCDView;
    v9 = -[PHHandsetDialerLCDView canPerformAction:withSender:](&v11, "canPerformAction:withSender:", a3, v6);
  }

  return v9;
}

- (void)copy:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView text](self, "text"));
  objc_msgSend(v5, "setString:", v4);

}

- (void)paste:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard", a3));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));

  v5 = v9;
  if (v9)
  {
    -[PHHandsetDialerLCDView _makeCalloutVisible:](self, "_makeCalloutVisible:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector(WeakRetained, "dialerField:stringWasPasted:");

    v5 = v9;
    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "dialerField:stringWasPasted:", self, v9);

      v5 = v9;
    }
  }

}

- (void)handleTapGesture:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController", a3));
  -[PHHandsetDialerLCDView _makeCalloutVisible:](self, "_makeCalloutVisible:", objc_msgSend(v4, "isMenuVisible") ^ 1);

}

- (id)newAddContactButton
{
  void *v3;
  void *v4;
  unsigned int v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  float v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = +[PHUIConfiguration requiresSmallScreenConfig](PHUIConfiguration, "requiresSmallScreenConfig");
  v6 = 10.0;
  if (v5)
    v6 = 5.0;
  objc_msgSend(v3, "setContentEdgeInsets:", v6, v6, v6, v6);
  objc_msgSend(v3, "setOpaque:", 0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1144750080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v3, "setTintColor:", v8);

  objc_msgSend(v3, "sizeToFit");
  v9 = objc_alloc((Class)NSAttributedString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ADD_NUMBER"), &stru_10028DC20, CFSTR("Dialer")));
  v12 = objc_msgSend(v9, "initWithString:", v11);
  objc_msgSend(v3, "setAttributedTitle:forState:", v12, 0);

  -[PHHandsetDialerLCDView addNumberFontSize](self, "addNumberFontSize");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v15, "setFont:", v14);

  return v3;
}

- (void)applyLayoutConstraints
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](self, "addContactButton"));
  -[PHHandsetDialerLCDView addContactButtonTopConstraintConstant](self, "addContactButtonTopConstraintConstant");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 11, 0, self, 3, 1.0, v4));
  -[PHHandsetDialerLCDView setAddContactButtonTopConstraint:](self, "setAddContactButtonTopConstraint:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButtonTopConstraint](self, "addContactButtonTopConstraint"));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](self, "addContactButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, v7, 11, 1.0, 0.0));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](self, "addContactButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 9, 0, self, 9, 1.0, 0.0));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](self, "addContactButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView layoutTextField](self, "layoutTextField"));
  -[PHHandsetDialerLCDView spacingBetweenNumberBaselineAndNameBaseline](self, "spacingBetweenNumberBaselineAndNameBaseline");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 11, 0, v12, 11, 1.0, v13));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](self, "addContactButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView layoutTextField](self, "layoutTextField"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 9, 0, v16, 9, 1.0, 0.0));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberTextField](self, "numberTextField"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView layoutTextField](self, "layoutTextField"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 10, 0, v19, 10, 1.0, 0.0));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberTextField](self, "numberTextField"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView layoutTextField](self, "layoutTextField"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 9, 0, v22, 9, 1.0, 0.0));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](self, "contactLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](self, "addContactButton"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 9, 0, v25, 9, 1.0, 0.0));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](self, "contactLabel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButton](self, "addContactButton"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 12, 0, v28, 12, 1.0, 0.0));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](self, "contactLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v30, 5, 1, self, 5, 1.0, 0.0));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView contactLabel](self, "contactLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 6, -1, self, 6, 1.0, 0.0));
  -[PHHandsetDialerLCDView addConstraint:](self, "addConstraint:", v33);

  -[PHHandsetDialerLCDView updateNumberLabelHorizontalConstraints](self, "updateNumberLabelHorizontalConstraints");
}

- (void)updateNumberLabelHorizontalConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberLabelHorizontalConstraints](self, "numberLabelHorizontalConstraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberLabelHorizontalConstraints](self, "numberLabelHorizontalConstraints"));
    -[PHHandsetDialerLCDView removeConstraints:](self, "removeConstraints:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView generateNumberLabelHorizontalConstraints](self, "generateNumberLabelHorizontalConstraints"));
  -[PHHandsetDialerLCDView setNumberLabelHorizontalConstraints:](self, "setNumberLabelHorizontalConstraints:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView numberLabelHorizontalConstraints](self, "numberLabelHorizontalConstraints"));
  -[PHHandsetDialerLCDView addConstraints:](self, "addConstraints:", v6);

}

- (double)addContactButtonTopConstraintConstant
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  +[PHUIConfiguration yOffsetForDialerLCDView](PHUIConfiguration, "yOffsetForDialerLCDView");
  v4 = v3;
  -[PHHandsetDialerLCDView pillViewTopOffset](self, "pillViewTopOffset");
  v6 = v4 + v5;
  -[PHHandsetDialerLCDView remoteViewControllerLCDOffset](self, "remoteViewControllerLCDOffset");
  return v6 - v7;
}

- (double)pillViewTopConstraintConstant
{
  double v3;
  unint64_t v4;

  v3 = 0.0;
  if (+[PHInCallUIUtilities hasMultipleSenderIdentities](PHInCallUIUtilities, "hasMultipleSenderIdentities")&& -[PHHandsetDialerLCDView isHostedInRemoteViewController](self, "isHostedInRemoteViewController"))
  {
    v4 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
    if (v4 > 0xF)
      return 13.0;
    v3 = 10.0;
    if (((1 << v4) & 0xA200) == 0)
    {
      if (((1 << v4) & 3) != 0)
        return 0.0;
      return 13.0;
    }
  }
  return v3;
}

- (float)pillViewHiddenOffset
{
  unsigned int v2;
  double v3;
  uint64_t v4;

  v2 = +[PHInCallUIUtilities hasMultipleSenderIdentities](PHInCallUIUtilities, "hasMultipleSenderIdentities");
  LODWORD(v3) = 30.0;
  if (v2)
  {
    v4 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize", v3);
    if (v4 <= 8)
    {
      if (v4)
      {
        if (v4 != 1)
        {
LABEL_15:
          LODWORD(v3) = 9.0;
          return *(float *)&v3;
        }
        LODWORD(v3) = 2.0;
      }
      else
      {
        LODWORD(v3) = 0;
      }
    }
    else
    {
      LODWORD(v3) = 6.0;
      if (v4 != 9 && v4 != 13 && v4 != 15)
        goto LABEL_15;
    }
  }
  return *(float *)&v3;
}

- (float)spacingBetweenNumberAndContactResult
{
  uint64_t v3;
  float result;
  BOOL v7;
  float v8;

  v3 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  if (v3 <= 8)
  {
    if (v3)
    {
      if (v3 != 1)
        return 19.0;
      v7 = !-[PHHandsetDialerLCDView isHostedInRemoteViewController](self, "isHostedInRemoteViewController");
      result = 14.0;
      v8 = 6.0;
    }
    else
    {
      v7 = !-[PHHandsetDialerLCDView isHostedInRemoteViewController](self, "isHostedInRemoteViewController");
      result = 2.0;
      v8 = 0.0;
    }
    if (!v7)
      return v8;
  }
  else
  {
    result = 10.0;
    if (v3 != 9 && v3 != 13 && v3 != 15)
      return 19.0;
  }
  return result;
}

- (float)spacingBetweenContactResultButtons
{
  unint64_t v3;
  unsigned int v4;
  float result;

  v3 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  if (v3 == 1)
    return 5.0;
  if (v3)
    return 10.0;
  v4 = -[PHHandsetDialerLCDView isHostedInRemoteViewController](self, "isHostedInRemoteViewController");
  result = 5.0;
  if (v4)
    return 2.0;
  return result;
}

- (double)pillViewTopOffset
{
  unsigned int v2;
  double result;
  unint64_t v4;

  v2 = +[PHInCallUIUtilities hasMultipleSenderIdentities](PHInCallUIUtilities, "hasMultipleSenderIdentities");
  result = 0.0;
  if (v2)
  {
    v4 = +[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing", 0.0);
    result = 0.0;
    if (v4 == 2)
      result = 25.0;
    if (!v4)
      return 30.0;
  }
  return result;
}

- (double)remoteViewControllerLCDOffset
{
  double v2;
  unint64_t v3;

  v2 = 0.0;
  if (-[PHHandsetDialerLCDView isHostedInRemoteViewController](self, "isHostedInRemoteViewController"))
  {
    v3 = +[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing");
    if (v3 <= 6)
      return dbl_10023EF98[v3];
  }
  return v2;
}

- (void)setIsHostedInRemoteViewController:(BOOL)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  if (self->_isHostedInRemoteViewController != a3)
  {
    self->_isHostedInRemoteViewController = a3;
    -[PHHandsetDialerLCDView addContactButtonTopConstraintConstant](self, "addContactButtonTopConstraintConstant");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView addContactButtonTopConstraint](self, "addContactButtonTopConstraint"));
    objc_msgSend(v6, "setConstant:", v5);

    -[PHHandsetDialerLCDView pillViewTopConstraintConstant](self, "pillViewTopConstraintConstant");
    v8 = v7;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView pillViewTopConstraint](self, "pillViewTopConstraint"));
    objc_msgSend(v9, "setConstant:", v8);

  }
}

- (void)textField:(id)a3 didPasteString:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector(WeakRetained, "dialerField:stringWasPasted:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "dialerField:stringWasPasted:", self, v6);

    }
  }
  objc_msgSend(v10, "endEditing:", 1);

}

- (void)textField:(id)a3 didUpdateString:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView text](self, "text"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    objc_msgSend(v7, "endEditing:", 1);

}

- (void)addContactPressed:(id)a3
{
  -[PHLCDViewTextField endEditing:](self->_numberTextField, "endEditing:", 1);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLCDViewTextField text](self->_numberTextField, "text", a3));
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController", a3));
  v5 = objc_msgSend(v4, "isMenuVisible");

  if (v5)
    -[PHHandsetDialerLCDView _makeCalloutVisible:](self, "_makeCalloutVisible:", 0);
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerLCDView text](self, "text", a3));
  -[PHHandsetDialerLCDView setText:needsFormat:](self, "setText:needsFormat:", v4, 1);

}

- (int)dialerType
{
  return self->_dialerType;
}

- (void)setDialerType:(int)a3
{
  self->_dialerType = a3;
}

- (UIButton)addContactButton
{
  return (UIButton *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAddContactButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UIButton)searchButton
{
  return (UIButton *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSearchButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (UIButton)contactCountButton
{
  return (UIButton *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContactCountButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UILabel)contactLabel
{
  return (UILabel *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContactLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (DialerLCDFieldDelegate)delegate
{
  return (DialerLCDFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (PHLCDViewTextField)numberTextField
{
  return self->_numberTextField;
}

- (void)setNumberTextField:(id)a3
{
  objc_storeStrong((id *)&self->_numberTextField, a3);
}

- (BOOL)isHostedInRemoteViewController
{
  return self->_isHostedInRemoteViewController;
}

- (NSArray)numberLabelHorizontalConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNumberLabelHorizontalConstraints:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (TPPillView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
  objc_storeStrong((id *)&self->_pillView, a3);
}

- (UILayoutGuide)pillLayoutGuide
{
  return self->_pillLayoutGuide;
}

- (void)setPillLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_pillLayoutGuide, a3);
}

- (UITextField)layoutTextField
{
  return self->_layoutTextField;
}

- (void)setLayoutTextField:(id)a3
{
  objc_storeStrong((id *)&self->_layoutTextField, a3);
}

- (NSLayoutConstraint)addContactButtonTopConstraint
{
  return self->_addContactButtonTopConstraint;
}

- (void)setAddContactButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_addContactButtonTopConstraint, a3);
}

- (NSLayoutConstraint)pillViewTopConstraint
{
  return self->_pillViewTopConstraint;
}

- (void)setPillViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pillViewTopConstraint, a3);
}

- (TUSenderIdentity)selectedSenderIdentity
{
  return self->_selectedSenderIdentity;
}

- (void)setSelectedSenderIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSenderIdentity, a3);
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
  objc_storeStrong((id *)&self->_selectedSenderIdentity, 0);
  objc_storeStrong((id *)&self->_pillViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_addContactButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_layoutTextField, 0);
  objc_storeStrong((id *)&self->_pillLayoutGuide, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_numberLabelHorizontalConstraints, 0);
  objc_storeStrong((id *)&self->_numberTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactLabel, 0);
  objc_storeStrong((id *)&self->_contactCountButton, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_storeStrong((id *)&self->_addContactButton, 0);
}

@end
