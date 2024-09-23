@implementation STKClass0SMSViewController

- (void)dealloc
{
  objc_super v3;

  -[STKClass0SMSSessionAction invalidate](self->_sessionAction, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STKClass0SMSViewController;
  -[STKClass0SMSViewController dealloc](&v3, "dealloc");
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
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STKClass0SMSViewController;
  -[STKClass0SMSViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "setAllowsAlertStacking:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STKClass0SMSViewController;
  -[STKClass0SMSViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController sessionAction](self, "sessionAction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "body"));
  -[STKClass0SMSViewController setMessageString:](self, "setMessageString:", v6);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat y;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  void *v32;
  CGFloat v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  void *v47;
  double Width;
  CGFloat v49;
  CGFloat v50;
  CALayer *lineLayer;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat recta;
  CGFloat rect_8;
  double rect_16;
  double v70;
  double v71;
  double v72;
  double v73;
  objc_super v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v74.receiver = self;
  v74.super_class = (Class)STKClass0SMSViewController;
  -[STKClass0SMSViewController viewDidLayoutSubviews](&v74, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v71 = v5;
  v72 = v4;
  v70 = v6;
  v73 = v7;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController view](self, "view"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController messageTitleLabel](self, "messageTitleLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController learnMoreButton](self, "learnMoreButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController messageTextLabel](self, "messageTextLabel"));
  v75.origin.x = v10;
  v75.origin.y = v12;
  v20 = v12;
  v75.size.width = v14;
  v75.size.height = v16;
  v21 = CGRectGetHeight(v75) + -40.0 + -52.0 + -24.0;
  objc_msgSend(v17, "frame");
  v22 = v21 - (CGRectGetHeight(v76) + 16.0);
  objc_msgSend(v18, "frame");
  v23 = v22 - (CGRectGetHeight(v77) + 32.0) + -44.0;
  objc_msgSend(v19, "sizeThatFits:");
  if (v24 >= v23)
    v24 = v23;
  rect_16 = v24;
  y = CGRectZero.origin.y;
  v26 = v24 + 52.0 + 44.0 + 24.0;
  v78.origin.x = v10;
  v78.origin.y = v20;
  v78.size.width = v14;
  v78.size.height = v16;
  v27 = CGRectGetWidth(v78) * 0.5;
  v79.origin.x = CGRectZero.origin.x;
  rect_8 = y;
  v79.origin.y = y;
  v79.size.width = 270.0;
  v79.size.height = v26;
  v28 = v27 - CGRectGetWidth(v79) * 0.5;
  v80.origin.x = v10;
  v80.origin.y = v20;
  v80.size.width = v14;
  v80.size.height = v16;
  v29 = CGRectGetHeight(v80) * 0.5;
  v81.origin.x = v28;
  v81.origin.y = y;
  v81.size.width = 270.0;
  v81.size.height = v26;
  v30 = v29 - CGRectGetHeight(v81) * 0.5;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController contentContainerView](self, "contentContainerView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController blurEffectContainerView](self, "blurEffectContainerView"));
  objc_msgSend(v32, "setFrame:", v28, v30, 270.0, v26);
  recta = v30;
  v33 = v26;
  objc_msgSend(v31, "setFrame:", v28, v30, 270.0, v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController view](self, "view"));
  objc_msgSend(v34, "bringSubviewToFront:", v31);

  objc_msgSend(v17, "frame");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v82.origin.x = v28;
  v82.origin.y = v30;
  v82.size.width = 270.0;
  v82.size.height = v33;
  v43 = CGRectGetWidth(v82) * 0.5;
  v83.origin.x = v36;
  v83.origin.y = v38;
  v83.size.width = v40;
  v83.size.height = v42;
  v44 = v43 - CGRectGetWidth(v83) * 0.5;
  v84.origin.x = v44;
  v84.origin.y = v38;
  v84.size.width = v40;
  v84.size.height = v42;
  v45 = 36.0 - CGRectGetHeight(v84);
  objc_msgSend(v17, "setFrame:", v44, v45, v40, v42);
  v85.origin.x = v44;
  v85.origin.y = v45;
  v85.size.width = v40;
  v85.size.height = v42;
  v46 = CGRectGetMaxY(v85) + 16.0;
  objc_msgSend(v19, "setFrame:", 20.0, v46, 230.0, rect_16);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController dismissButton](self, "dismissButton"));
  objc_msgSend(v32, "frame");
  Width = CGRectGetWidth(v86);
  v87.origin.x = v28;
  v87.size.width = 270.0;
  v87.origin.y = recta;
  v87.size.height = v33;
  v49 = CGRectGetWidth(v87) * 0.5;
  v88.origin.x = CGRectZero.origin.x;
  v88.origin.y = rect_8;
  v88.size.width = Width;
  v88.size.height = 44.0;
  v50 = v49 - CGRectGetWidth(v88) * 0.5;
  v89.origin.x = 20.0;
  v89.origin.y = v46;
  v89.size.width = 230.0;
  v89.size.height = rect_16;
  objc_msgSend(v47, "setFrame:", v50, CGRectGetMaxY(v89) + 24.0, Width, 44.0);
  lineLayer = self->_lineLayer;
  objc_msgSend(v47, "frame");
  v53 = v52;
  objc_msgSend(v47, "frame");
  -[CALayer setFrame:](lineLayer, "setFrame:", v53, -1.0, CGRectGetWidth(v90), 1.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController alertContainerView](self, "alertContainerView"));
  objc_msgSend(v54, "setFrame:", v72, v71, v70, v73);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController darkBlurView](self, "darkBlurView"));
  objc_msgSend(v55, "setFrame:", v72, v71, v70, v73);
  objc_msgSend(v18, "sizeToFit");
  objc_msgSend(v18, "frame");
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v91.origin.x = v72;
  v91.origin.y = v71;
  v91.size.width = v70;
  v91.size.height = v73;
  v64 = CGRectGetHeight(v91) + -32.0;
  v92.origin.x = v57;
  v92.origin.y = v59;
  v92.size.width = v61;
  v92.size.height = v63;
  v65 = v64 - CGRectGetHeight(v92);
  v93.origin.x = v72;
  v93.origin.y = v71;
  v93.size.width = v70;
  v93.size.height = v73;
  v66 = CGRectGetWidth(v93) * 0.5;
  v94.origin.x = v57;
  v94.origin.y = v65;
  v94.size.width = v61;
  v94.size.height = v63;
  objc_msgSend(v18, "setFrame:", v66 - CGRectGetWidth(v94) * 0.5, v65, v61, v63);

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
  STKClass0SMSSessionAction *v12;
  uint64_t v13;
  STKClass0SMSSessionAction *sessionAction;
  STKClass0SMSSessionAction *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  STKClass0SMSSessionAction *v21;
  _BYTE v22[128];

  v6 = (void (**)(_QWORD))a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "actions", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (STKClass0SMSSessionAction *)objc_claimAutoreleasedReturnValue(+[STKSessionAction _sessionActionFromBSAction:](STKSessionAction, "_sessionActionFromBSAction:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i)));
        v13 = objc_opt_class(STKClass0SMSSessionAction);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          sessionAction = self->_sessionAction;
          self->_sessionAction = v12;

          goto LABEL_11;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = self->_sessionAction;
    *(_DWORD *)buf = 138412290;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sessionAction = %@", buf, 0xCu);
  }
  if (v6)
    v6[2](v6);

}

- (void)learnMoreButtonClicked:(id)a3
{
  id v4;
  STKClass0SMSAboutViewController *v5;

  v5 = -[STKClass0SMSAboutViewController initWithNibName:bundle:]([STKClass0SMSAboutViewController alloc], "initWithNibName:bundle:", 0, 0);
  v4 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v5);
  -[STKClass0SMSViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)dismiss
{
  _QWORD v3[5];
  _QWORD v4[5];

  -[STKClass0SMSSessionAction sendResponse:](self->_sessionAction, "sendResponse:", 0);
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005738;
  v4[3] = &unk_100014438;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000576C;
  v3[3] = &unk_100014460;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v3, 0.3);
}

- (void)setMessageString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController sessionAction](self, "sessionAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionData"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "address"));
  if (objc_msgSend(v7, "length") && objc_msgSend(v6, "showsFromAddress"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CLASS_0_ALERT_MESSAGE_FROM"), &stru_100014540, CFSTR("SIMToolkitUI")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7));

    v15[0] = v10;
    v15[1] = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n")));

    v4 = (id)v12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController messageTextLabel](self, "messageTextLabel"));
  objc_msgSend(v13, "setText:", v4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController view](self, "view"));
  objc_msgSend(v14, "setNeedsLayout");

}

- (id)contentContainerView
{
  UIView *contentContainerView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;

  contentContainerView = self->_contentContainerView;
  if (!contentContainerView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_contentContainerView;
    self->_contentContainerView = v4;

    v6 = self->_contentContainerView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController view](self, "view"));
    objc_msgSend(v8, "addSubview:", self->_contentContainerView);

    contentContainerView = self->_contentContainerView;
  }
  return contentContainerView;
}

- (id)messageTitleLabel
{
  UILabel *messageTitleLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;

  messageTitleLabel = self->_messageTitleLabel;
  if (!messageTitleLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_messageTitleLabel;
    self->_messageTitleLabel = v4;

    v6 = self->_messageTitleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = self->_messageTitleLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CLASS0SMS_ALERT_TITLE"), &stru_100014540, CFSTR("SIMToolkitUI")));
    -[UILabel setText:](v8, "setText:", v10);

    v11 = self->_messageTitleLabel;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[UILabel sizeToFit](self->_messageTitleLabel, "sizeToFit");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController contentContainerView](self, "contentContainerView"));
    objc_msgSend(v13, "addSubview:", self->_messageTitleLabel);

    messageTitleLabel = self->_messageTitleLabel;
  }
  return messageTitleLabel;
}

- (id)messageTextLabel
{
  UILabel *messageTextLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;

  messageTextLabel = self->_messageTextLabel;
  if (!messageTextLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_messageTextLabel;
    self->_messageTextLabel = v4;

    -[UILabel setTextAlignment:](self->_messageTextLabel, "setTextAlignment:", 1);
    v6 = self->_messageTextLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = self->_messageTextLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[UILabel setLineBreakMode:](self->_messageTextLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](self->_messageTextLabel, "setNumberOfLines:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController contentContainerView](self, "contentContainerView"));
    objc_msgSend(v10, "addSubview:", self->_messageTextLabel);

    messageTextLabel = self->_messageTextLabel;
  }
  return messageTextLabel;
}

- (id)dismissButton
{
  UIButton *dismissButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  void *v14;
  CALayer *v15;
  CALayer *lineLayer;
  CALayer *v17;
  id v18;
  double v19;
  void *v20;

  dismissButton = self->_dismissButton;
  if (!dismissButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    v5 = self->_dismissButton;
    self->_dismissButton = v4;

    v6 = self->_dismissButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CLASS0SMS_DISMISS"), &stru_100014540, CFSTR("SIMToolkitUI")));
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_dismissButton, "titleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
    objc_msgSend(v9, "setFont:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_dismissButton, "titleLabel"));
    objc_msgSend(v11, "sizeToFit");

    v12 = self->_dismissButton;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTitleColor:forState:](v12, "setTitleColor:forState:", v13, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_dismissButton, "addTarget:action:forControlEvents:", self, "dismissButtonClicked:", 64);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController contentContainerView](self, "contentContainerView"));
    objc_msgSend(v14, "addSubview:", self->_dismissButton);

    v15 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    lineLayer = self->_lineLayer;
    self->_lineLayer = v15;

    v17 = self->_lineLayer;
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    -[CALayer setBackgroundColor:](v17, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));

    LODWORD(v19) = 1036831949;
    -[CALayer setOpacity:](self->_lineLayer, "setOpacity:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_dismissButton, "layer"));
    objc_msgSend(v20, "addSublayer:", self->_lineLayer);

    dismissButton = self->_dismissButton;
  }
  return dismissButton;
}

- (id)learnMoreButton
{
  UIButton *learnMoreButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;

  learnMoreButton = self->_learnMoreButton;
  if (!learnMoreButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    v5 = self->_learnMoreButton;
    self->_learnMoreButton = v4;

    v6 = self->_learnMoreButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CLASS0SMS_ALERT_LEARN_MORE_TITLE"), &stru_100014540, CFSTR("SIMToolkitUI")));
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_learnMoreButton, "addTarget:action:forControlEvents:", self, "learnMoreButtonClicked:", 64);
    v9 = self->_learnMoreButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTitleColor:forState:](v9, "setTitleColor:forState:", v10, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController alertContainerView](self, "alertContainerView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
    objc_msgSend(v12, "addSubview:", self->_learnMoreButton);

    learnMoreButton = self->_learnMoreButton;
  }
  return learnMoreButton;
}

- (id)darkBlurView
{
  UIVisualEffectView *darkBlurView;
  UIVisualEffectView *v4;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;

  darkBlurView = self->_darkBlurView;
  if (!darkBlurView)
  {
    v4 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
    v5 = self->_darkBlurView;
    self->_darkBlurView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
    -[UIVisualEffectView setEffect:](self->_darkBlurView, "setEffect:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController view](self, "view"));
    objc_msgSend(v7, "insertSubview:atIndex:", self->_darkBlurView, 0);

    darkBlurView = self->_darkBlurView;
  }
  return darkBlurView;
}

- (id)alertContainerView
{
  UIVisualEffectView *alertContainerView;
  UIVisualEffectView *v4;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  alertContainerView = self->_alertContainerView;
  if (!alertContainerView)
  {
    v4 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
    v5 = self->_alertContainerView;
    self->_alertContainerView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](UIVibrancyEffect, "effectForBlurEffect:", v6));

    -[UIVisualEffectView setEffect:](self->_alertContainerView, "setEffect:", v7);
    v8 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v8, "setBackgroundColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_alertContainerView, "contentView"));
    objc_msgSend(v10, "addSubview:", v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController view](self, "view"));
    objc_msgSend(v11, "insertSubview:atIndex:", self->_alertContainerView, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController view](self, "view"));
    objc_msgSend(v12, "setNeedsLayout");

    alertContainerView = self->_alertContainerView;
  }
  return alertContainerView;
}

- (id)blurEffectContainerView
{
  UIVisualEffectView *blurEffectContainerView;
  UIVisualEffectView *v4;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  void *v8;

  blurEffectContainerView = self->_blurEffectContainerView;
  if (!blurEffectContainerView)
  {
    v4 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_blurEffectContainerView;
    self->_blurEffectContainerView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1));
    -[UIVisualEffectView setEffect:](self->_blurEffectContainerView, "setEffect:", v6);
    -[UIVisualEffectView setAlpha:](self->_blurEffectContainerView, "setAlpha:", 0.6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_blurEffectContainerView, "layer"));
    objc_msgSend(v7, "setCornerRadius:", 13.0);

    -[UIVisualEffectView setClipsToBounds:](self->_blurEffectContainerView, "setClipsToBounds:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSViewController view](self, "view"));
    objc_msgSend(v8, "addSubview:", self->_blurEffectContainerView);

    blurEffectContainerView = self->_blurEffectContainerView;
  }
  return blurEffectContainerView;
}

- (STKClass0SMSSessionAction)sessionAction
{
  return self->_sessionAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionAction, 0);
  objc_storeStrong((id *)&self->_lineLayer, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_messageTitleLabel, 0);
  objc_storeStrong((id *)&self->_messageTextLabel, 0);
  objc_storeStrong((id *)&self->_darkBlurView, 0);
  objc_storeStrong((id *)&self->_blurEffectContainerView, 0);
  objc_storeStrong((id *)&self->_alertContainerView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end
