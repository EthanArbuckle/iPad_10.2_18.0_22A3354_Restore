@implementation STKBaseAlertViewController

- (void)dealloc
{
  objc_super v3;

  -[STKSessionAction invalidate](self->_sessionAction, "invalidate");
  -[STKBaseAlertViewController clearTimeoutTimer](self, "clearTimeoutTimer");
  v3.receiver = self;
  v3.super_class = (Class)STKBaseAlertViewController;
  -[STKBaseAlertViewController dealloc](&v3, "dealloc");
}

- (void)startTimeoutTimerIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKSessionAction behavior](self->_sessionAction, "behavior"));
  objc_msgSend(v3, "timeout");
  v5 = v4;

  HIDWORD(v6) = 1065646817;
  if (v5 <= 0.01)
  {
    -[STKBaseAlertViewController clearTimeoutTimer](self, "clearTimeoutTimer");
  }
  else
  {
    *(float *)&v6 = v5;
    -[STKBaseAlertViewController _restartTimeoutTimer:](self, "_restartTimeoutTimer:", v6);
  }
}

- (void)clearTimeoutTimer
{
  NSTimer *timeoutTimer;

  -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

}

- (void)dismiss
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004080;
  v3[3] = &unk_100014438;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000040B4;
  v2[3] = &unk_100014460;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v3, v2, 0.3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30;
  else
    return 2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *topBar;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *bottomBar;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *bottomBarBottomConstraint;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  UITextView *v31;
  UITextView *textView;
  UITextView *v33;
  void *v34;
  UITextView *v35;
  void *v36;
  UITextView *v37;
  void *v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *textViewCenterYConstraint;
  double v43;
  UIView *v44;
  uint64_t v45;
  void *v46;
  UIView *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSLayoutConstraint *v58;
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
  objc_super v73;
  _QWORD v74[6];
  _QWORD v75[4];
  _QWORD v76[3];

  v73.receiver = self;
  v73.super_class = (Class)STKBaseAlertViewController;
  -[STKBaseAlertViewController viewDidLoad](&v73, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0431372549, 0.0431372549, 0.0431372549, 0.9));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = -[STKBaseAlertViewController newTopBar](self, "newTopBar");
  topBar = self->_topBar;
  self->_topBar = v5;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_topBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v72 = v3;
  if (self->_topBar)
  {
    objc_msgSend(v3, "addSubview:");
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_topBar, "topAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v64));
    v76[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_topBar, "widthAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    v76[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_topBar, "centerXAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "centerXAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    v76[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    v3 = v72;
  }
  v15 = -[STKBaseAlertViewController newBottomBar](self, "newBottomBar");
  bottomBar = self->_bottomBar;
  self->_bottomBar = v15;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (self->_bottomBar)
  {
    objc_msgSend(v3, "addSubview:");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_bottomBar, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    bottomBarBottomConstraint = self->_bottomBarBottomConstraint;
    self->_bottomBarBottomConstraint = v20;

    v75[0] = self->_bottomBarBottomConstraint;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_bottomBar, "widthAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v65));
    v75[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_bottomBar, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    v75[2] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_bottomBar, "heightAnchor"));
    -[UIView bounds](self->_bottomBar, "bounds");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", v27));
    v75[3] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    v3 = v72;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v30, "addObserver:selector:name:object:", self, "_keyboardWillChangeFrame:", UIKeyboardWillChangeFrameNotification, 0);

  }
  if (objc_msgSend((id)objc_opt_class(self), "wantsTextView"))
  {
    v31 = (UITextView *)objc_alloc_init((Class)UITextView);
    textView = self->_textView;
    self->_textView = v31;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = self->_textView;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
    -[UITextView setFont:](v33, "setFont:", v34);

    v35 = self->_textView;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UITextView setTextColor:](v35, "setTextColor:", v36);

    v37 = self->_textView;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](v37, "setBackgroundColor:", v38);

    -[UITextView setTextAlignment:](self->_textView, "setTextAlignment:", 1);
    -[UITextView setEditable:](self->_textView, "setEditable:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView centerYAnchor](self->_textView, "centerYAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
    v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
    textViewCenterYConstraint = self->_textViewCenterYConstraint;
    self->_textViewCenterYConstraint = v41;

    LODWORD(v43) = 1144766464;
    -[NSLayoutConstraint setPriority:](self->_textViewCenterYConstraint, "setPriority:", v43);
    v44 = self->_bottomBar;
    if (v44)
    {
      v45 = objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v44, "topAnchor"));
    }
    else
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));

    }
    v47 = self->_topBar;
    if (v47)
    {
      v48 = objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v47, "bottomAnchor"));
    }
    else
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
      v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));

    }
    v61 = (void *)v48;
    objc_msgSend(v3, "addSubview:", self->_textView);
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView leadingAnchor](self->_textView, "leadingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:constant:", v69, 30.0));
    v74[0] = v66;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView trailingAnchor](self->_textView, "trailingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, -30.0));
    v74[1] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView topAnchor](self->_textView, "topAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v48, 30.0));
    v74[2] = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView bottomAnchor](self->_textView, "bottomAnchor"));
    v60 = (void *)v45;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v45, -30.0));
    v74[3] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView centerXAnchor](self->_textView, "centerXAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
    v58 = self->_textViewCenterYConstraint;
    v74[4] = v57;
    v74[5] = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v59);

    v3 = v72;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STKBaseAlertViewController;
  -[STKBaseAlertViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[STKBaseAlertViewController clearTimeoutTimer](self, "clearTimeoutTimer");
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  STKSessionAction *sessionAction;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  STKSessionAction *v20;
  _BYTE v21[128];

  v6 = (void (**)(_QWORD))a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "actions", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_claimAutoreleasedReturnValue(+[STKSessionAction _sessionActionFromBSAction:](STKSessionAction, "_sessionActionFromBSAction:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i)));
        if (v12)
        {
          v13 = (void *)v12;
          if (-[STKBaseAlertViewController validateAction:](self, "validateAction:", v12))
            objc_storeStrong((id *)&self->_sessionAction, v13);

          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    sessionAction = self->_sessionAction;
    *(_DWORD *)buf = 138412290;
    v20 = sessionAction;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sessionAction = %@", buf, 0xCu);
  }
  if (v6)
    v6[2](v6);

}

+ (BOOL)wantsTextView
{
  return 0;
}

- (BOOL)validateAction:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(STKSessionAction);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (id)newTopBar
{
  return 0;
}

- (id)newBottomBar
{
  return 0;
}

- (void)setTextViewText:(id)a3
{
  -[UITextView setText:](self->_textView, "setText:", a3);
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MinY;
  void *v15;
  double MaxY;
  double v17;
  CGRect v18;
  CGRect v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.width = v11;
  v18.size.height = v13;
  MinY = CGRectGetMinY(v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController view](self, "view"));
  objc_msgSend(v15, "bounds");
  MaxY = CGRectGetMaxY(v19);

  v17 = MaxY - MinY;
  -[NSLayoutConstraint setConstant:](self->_bottomBarBottomConstraint, "setConstant:", -v17);
  -[NSLayoutConstraint setConstant:](self->_textViewCenterYConstraint, "setConstant:", v17 * -0.5);
}

- (void)_restartTimeoutTimer:(float)a3
{
  NSTimer *v5;
  NSTimer *timeoutTimer;

  -[STKBaseAlertViewController clearTimeoutTimer](self, "clearTimeoutTimer");
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_displayDidTimeout", 0, 0, a3));
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v5;

}

- (void)_displayDidTimeout
{
  -[STKSessionAction sendResponse:](self->_sessionAction, "sendResponse:", 2);
  -[STKBaseAlertViewController dismiss](self, "dismiss");
}

- (UIView)bottomBar
{
  return self->_bottomBar;
}

- (UIView)topBar
{
  return self->_topBar;
}

- (STKSessionAction)sessionAction
{
  return self->_sessionAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_bottomBarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_sessionAction, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
