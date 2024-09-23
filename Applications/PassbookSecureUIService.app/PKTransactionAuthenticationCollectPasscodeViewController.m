@implementation PKTransactionAuthenticationCollectPasscodeViewController

- (PKTransactionAuthenticationCollectPasscodeViewController)init
{

  return 0;
}

- (PKTransactionAuthenticationCollectPasscodeViewController)initWithPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKTransactionAuthenticationCollectPasscodeViewController *v12;
  PKTransactionAuthenticationCollectPasscodeViewController *v13;
  CGSize *p_keyboardSize;
  objc_class *v15;
  CGFloat v16;
  PKPaymentService *v17;
  PKPaymentService *paymentService;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PKTransactionAuthenticationCollectPasscodeViewController;
  v12 = -[PKTransactionAuthenticationCollectPasscodeViewController init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    p_keyboardSize = &v12->_keyboardSize;
    +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", 1);
    *(_QWORD *)&p_keyboardSize->width = v15;
    v13->_keyboardSize.height = v16;
    objc_storeStrong((id *)&v13->_passUniqueIdentifier, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_transactionIdentifier, a4);
    v17 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
    paymentService = v13->_paymentService;
    v13->_paymentService = v17;

    v13->_currentState = 0;
  }

  return v13;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  PKPaymentPass *v8;
  PKPaymentPass *pass;
  PKPaymentService *paymentService;
  NSString *transactionIdentifier;
  _QWORD v12[5];
  _QWORD *v13;
  id v14;
  id location;
  _QWORD v16[4];
  id v17;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000038E4;
  v16[3] = &unk_10000C390;
  v4 = a3;
  v17 = v4;
  v5 = objc_retainBlock(v16);
  if (!self->_passUniqueIdentifier)
    goto LABEL_5;
  if (!self->_transactionIdentifier)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "passWithUniqueID:", self->_passUniqueIdentifier));
  v8 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "paymentPass"));
  pass = self->_pass;
  self->_pass = v8;

  if (self->_pass)
  {
    objc_initWeak(&location, self);
    paymentService = self->_paymentService;
    transactionIdentifier = self->_transactionIdentifier;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000038F8;
    v12[3] = &unk_10000C3B8;
    objc_copyWeak(&v14, &location);
    v12[4] = self;
    v13 = v5;
    -[PKPaymentService transactionWithTransactionIdentifier:completion:](paymentService, "transactionWithTransactionIdentifier:completion:", transactionIdentifier, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_5:
    ((void (*)(_QWORD *, _QWORD))v5[2])(v5, 0);
  }

}

- (void)resetWithTransactionAuthenticationFailure:(int64_t)a3 completion:(id)a4
{
  id v6;
  _QWORD block[5];
  id v8;
  int64_t v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003A54;
  block[3] = &unk_10000C3E0;
  v8 = a4;
  v9 = a3;
  block[4] = self;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *logoImageView;
  NSString *v13;
  UILabel *v14;
  UILabel *titleLabel;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  UILabel *v28;
  UILabel *bodyTextLabel;
  UILabel *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  UIButton *v40;
  UIButton *footerButton;
  PKLinkedApplication *v42;
  PKLinkedApplication *linkedApplication;
  UIButton *v44;
  id v45;
  double v46;
  UIActivityIndicatorView *v47;
  UIActivityIndicatorView *spinner;
  UILabel *v49;
  UILabel *failureLabel;
  UILabel *v51;
  uint64_t v52;
  void *v53;
  UILabel *v54;
  void *v55;
  UILabel *v56;
  void *v57;
  void *v58;
  UIBarButtonItem *v59;
  UIBarButtonItem *cancelButton;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  UIBarButtonItem *v65;
  UIBarButtonItem *confirmButton;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  id location;
  objc_super v77;

  v77.receiver = self;
  v77.super_class = (Class)PKTransactionAuthenticationCollectPasscodeViewController;
  -[PKTransactionAuthenticationCollectPasscodeViewController loadView](&v77, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentPass compactBankLogoDarkImage](self->_pass, "compactBankLogoDarkImage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithPKImage:](UIImage, "imageWithPKImage:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentPass compactBankLogoLightImage](self->_pass, "compactBankLogoLightImage"));
  v8 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithPKImage:](UIImage, "imageWithPKImage:", v7));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageAsset"));
    objc_msgSend(v10, "registerImage:withTraitCollection:", v8, v9);

  }
  v72 = (void *)v8;
  v73 = v6;
  if (v6)
  {
    v11 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v6);
    logoImageView = self->_logoImageView;
    self->_logoImageView = v11;

    objc_msgSend(v3, "addSubview:", self->_logoImageView);
    v13 = UIContentSizeCategoryAccessibilityMedium;
  }
  else
  {
    v14 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v14;

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    v16 = self->_titleLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentPass organizationName](self->_pass, "organizationName"));
    -[UILabel setText:](v16, "setText:", v17);

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    v18 = self->_titleLabel;
    v13 = UIContentSizeCategoryAccessibilityMedium;
    v19 = PKFontForDefaultDesign(UIFontTextStyleTitle1, UIContentSizeCategoryAccessibilityMedium);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[UILabel setFont:](v18, "setFont:", v20);

    objc_msgSend(v3, "addSubview:", self->_titleLabel);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction currencyAmount](self->_transaction, "currencyAmount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "formattedStringValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction merchant](self->_transaction, "merchant"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "displayName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentPass organizationName](self->_pass, "organizationName"));
  v26 = PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_PAYMENT_PIN_BODY"), CFSTR("%@%@%@"), v22, v24, v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);

  v28 = (UILabel *)objc_alloc_init((Class)UILabel);
  bodyTextLabel = self->_bodyTextLabel;
  self->_bodyTextLabel = v28;

  -[UILabel setNumberOfLines:](self->_bodyTextLabel, "setNumberOfLines:", 0);
  v71 = (void *)v27;
  -[UILabel setText:](self->_bodyTextLabel, "setText:", v27);
  -[UILabel setTextAlignment:](self->_bodyTextLabel, "setTextAlignment:", 1);
  v30 = self->_bodyTextLabel;
  v31 = PKFontForDefaultDesign(UIFontTextStyleBody, v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  -[UILabel setFont:](v30, "setFont:", v32);

  v33 = v3;
  objc_msgSend(v3, "addSubview:", self->_bodyTextLabel);
  v34 = PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_FORGOT_PIN_BUTTON"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = PKFontForDefaultDesign(UIFontTextStyleCallout, v13);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration pkui_plainConfigurationWithTitle:font:](UIButtonConfiguration, "pkui_plainConfigurationWithTitle:font:", v35, v37));

  objc_initWeak(&location, self);
  v74[1] = 3221225472;
  v74[2] = sub_100004200;
  v74[3] = &unk_10000C408;
  v74[0] = _NSConcreteStackBlock;
  objc_copyWeak(&v75, &location);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v74));
  v70 = (void *)v38;
  v40 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v38, v39));
  footerButton = self->_footerButton;
  self->_footerButton = v40;

  v42 = (PKLinkedApplication *)objc_msgSend(objc_alloc((Class)PKLinkedApplication), "initWithPass:", self->_pass);
  linkedApplication = self->_linkedApplication;
  self->_linkedApplication = v42;

  -[PKLinkedApplication addObserver:](self->_linkedApplication, "addObserver:", self);
  -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
  v44 = self->_footerButton;
  v45 = -[PKLinkedApplication state](self->_linkedApplication, "state");
  v46 = 0.0;
  if (v45 == (id)1)
    v46 = 1.0;
  -[UIButton setAlpha:](v44, "setAlpha:", v46);
  objc_msgSend(v3, "addSubview:", self->_footerButton);
  -[PKTransactionAuthenticationCollectPasscodeViewController _createPasscodeField](self, "_createPasscodeField");
  objc_msgSend(v3, "addSubview:", self->_passcodeField);
  v47 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  spinner = self->_spinner;
  self->_spinner = v47;

  -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 1);
  objc_msgSend(v3, "addSubview:", self->_spinner);
  v49 = (UILabel *)objc_alloc_init((Class)UILabel);
  failureLabel = self->_failureLabel;
  self->_failureLabel = v49;

  v51 = self->_failureLabel;
  v52 = PKFontForDefaultDesign(UIFontTextStyleCallout, v13);
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  -[UILabel setFont:](v51, "setFont:", v53);

  v54 = self->_failureLabel;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UILabel setTextColor:](v54, "setTextColor:", v55);

  v56 = self->_failureLabel;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  -[UILabel setBackgroundColor:](v56, "setBackgroundColor:", v57);

  -[UILabel setTextAlignment:](self->_failureLabel, "setTextAlignment:", 1);
  -[UILabel setClipsToBounds:](self->_failureLabel, "setClipsToBounds:", 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_failureLabel, "layer"));
  objc_msgSend(v58, "setCornerCurve:", kCACornerCurveContinuous);

  objc_msgSend(v3, "addSubview:", self->_failureLabel);
  -[PKTransactionAuthenticationCollectPasscodeViewController _updateFailureLabelVisibility](self, "_updateFailureLabelVisibility");
  v59 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelButtonPressed");
  cancelButton = self->_cancelButton;
  self->_cancelButton = v59;

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v61, "setLeftBarButtonItem:", self->_cancelButton);

  if (self->_PINFormat == 2)
  {
    v62 = objc_alloc((Class)UIBarButtonItem);
    v63 = PKLocalizedAquamanString(CFSTR("CONFIRM"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    v65 = (UIBarButtonItem *)objc_msgSend(v62, "initWithTitle:style:target:action:", v64, 0, self, "_passcodeInputFinished");
    confirmButton = self->_confirmButton;
    self->_confirmButton = v65;

    -[UIBarButtonItem setEnabled:](self->_confirmButton, "setEnabled:", 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v67, "setRightBarButtonItem:", self->_confirmButton);

  }
  v68 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v68, "configureWithTransparentBackground");
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v69, "setStandardAppearance:", v68);

  objc_destroyWeak(&v75);
  objc_destroyWeak(&location);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double MaxY;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  id v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  int64_t PINFormat;
  double v67;
  id v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  id v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double Center;
  double v88;
  id v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  double v102;
  double v103;
  uint64_t v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  objc_super v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v114.receiver = self;
  v114.super_class = (Class)PKTransactionAuthenticationCollectPasscodeViewController;
  -[PKTransactionAuthenticationCollectPasscodeViewController viewWillLayoutSubviews](&v114, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController view](self, "view"));
  v4 = ((uint64_t (*)(void))PKUIGetMinScreenWidthType)();
  v5 = 44.0;
  if (v4 == 1)
    v5 = 24.0;
  if (v4)
    v6 = v5;
  else
    v6 = 16.0;
  v7 = objc_msgSend(v3, "bounds", v5);
  v9 = v8;
  v11 = v10;
  v113 = v12;
  v13 = v8 + v6;
  v14 = v10 + 0.0;
  v111 = v15;
  v16 = v15 - (v6 + v6);
  v17 = PKUIGetMinScreenWidthType(v7);
  if (v17)
    MaxY = 96.0;
  else
    MaxY = 64.0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](self->_logoImageView, "superview"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_logoImageView, "image"));
    objc_msgSend(v20, "size");
    v22 = v21;
    v24 = v23;

    v25 = PKSizeAspectFit(v22, v24, v16, 24.0);
    v28 = UIRectCenteredXInRect(v26, v9, v11 + MaxY, v25, v27, v13, v14, v16, v113);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    -[UIImageView setFrame:](self->_logoImageView, "setFrame:");
    v115.origin.x = v28;
    v115.origin.y = v30;
    v115.size.width = v32;
    v115.size.height = v34;
    MaxY = CGRectGetMaxY(v115);
    v35 = v13;
    v36 = v14;
  }
  else
  {
    v36 = v14;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_titleLabel, "superview"));

    if (v37)
    {
      v38 = -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v16, 1.79769313e308);
      v41 = UIRectCenteredXInRect(v38, 0.0, MaxY, v39, v40, v13, v14, v16, v113);
      v43 = v42;
      v45 = v44;
      v47 = v46;
      -[UILabel setFrame:](self->_titleLabel, "setFrame:");
      v116.origin.x = v41;
      v116.origin.y = v43;
      v116.size.width = v45;
      v116.size.height = v47;
      MaxY = CGRectGetMaxY(v116);
    }
    v35 = v13;
  }
  v48 = -[UILabel sizeThatFits:](self->_bodyTextLabel, "sizeThatFits:", v16);
  v50 = v49;
  v52 = v51;
  v53 = 40.0;
  if (!v17)
    v53 = 21.0;
  v105 = v53;
  v106 = v16;
  v54 = v53 + MaxY;
  v55 = 24.0;
  if (v17)
    v56 = 24.0;
  else
    v56 = 20.0;
  if (!v17)
    v55 = 14.0;
  v109 = v56;
  v110 = v55;
  v107 = v36;
  v108 = v35;
  v57 = UIRectCenteredXInRect(v48, 0.0, v54, v50, v52, v35, v36, v16, v113);
  v59 = v58;
  v61 = v60;
  v62 = v36;
  v64 = v63;
  -[UILabel setFrame:](self->_bodyTextLabel, "setFrame:");
  v117.origin.x = v57;
  v117.origin.y = v59;
  v117.size.width = v61;
  v117.size.height = v64;
  v65 = CGRectGetMaxY(v117);
  PINFormat = self->_PINFormat;
  v67 = 0.8;
  if (PINFormat != 2)
    v67 = 0.0;
  if (PINFormat == 1)
    v67 = 0.6;
  v68 = -[UIView sizeThatFits:](self->_passcodeField, "sizeThatFits:", PKFloatRoundToPixel(v111 * v67), 1.79769313e308);
  v71 = UIRectCenteredXInRect(v68, 0.0, v105 + v65, v69, v70, v35, v62, v16, v113);
  v73 = v72;
  v75 = v74;
  v77 = v76;
  -[UIView setFrame:](self->_passcodeField, "setFrame:");
  v118.origin.x = v71;
  v118.origin.y = v73;
  v118.size.width = v75;
  v118.size.height = v77;
  v112 = CGRectGetMaxY(v118);
  v78 = -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v80 = v79;
  v82 = v81;
  v84 = v83;
  v86 = v85;
  Center = UIRectGetCenter(v78, v71, v73, v75, v77);
  UIRectCenteredAboutPoint(v80, v82, v84, v86, Center, v88);
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  v89 = -[UILabel sizeThatFits:](self->_failureLabel, "sizeThatFits:", v106, 1.79769313e308);
  v92 = v91 + 4.0;
  -[UILabel setFrame:](self->_failureLabel, "setFrame:", UIRectCenteredXInRect(v89, 0.0, v109 + v112, fmin(v90 + 34.0, v106), v91 + 4.0, v108, v107, v106, v113));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_failureLabel, "layer"));
  objc_msgSend(v93, "setCornerRadius:", v92 * 0.5);

  -[UIButton sizeToFit](self->_footerButton, "sizeToFit");
  -[UIButton frame](self->_footerButton, "frame");
  v95 = v94;
  v97 = v96;
  v99 = v98;
  v100 = v113 - self->_keyboardSize.height;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_footerButton, "titleLabel"));
  objc_msgSend(v101, "frame");
  v103 = v100 - v102 - v110;

  -[UIButton setFrame:](self->_footerButton, "setFrame:", UIRectCenteredXInRect(v104, v95, v103, v97, v99, v108, v107, v106, v113));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTransactionAuthenticationCollectPasscodeViewController;
  -[PKTransactionAuthenticationCollectPasscodeViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[UIView becomeFirstResponder](self->_passcodeField, "becomeFirstResponder");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = objc_msgSend(a3, "userInterfaceStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (v4 != v6)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationComplexPasscodeTextField layer](self->_complexPasscodeField, "layer"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor")));
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v7, "CGColor"));

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)explanationViewDidUpdateLayout:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController view](self, "view", a3));
  objc_msgSend(v3, "setNeedsLayout");

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;

  if (self->_PINFormat == 2)
  {
    length = a4.length;
    location = a4.location;
    v9 = a5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9));

    -[UIBarButtonItem setEnabled:](self->_confirmButton, "setEnabled:", (unint64_t)objc_msgSend(v11, "length") > 5);
  }
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v5 = objc_msgSend(v4, "length");

  if ((unint64_t)v5 >= 6)
    -[PKTransactionAuthenticationCollectPasscodeViewController _passcodeInputFinished](self, "_passcodeInputFinished");
  return (unint64_t)v5 > 5;
}

- (void)pinCodeTextFieldWasUpdated:(id)a3 isComplete:(BOOL)a4
{
  if (a4)
    -[PKTransactionAuthenticationCollectPasscodeViewController _passcodeInputFinished](self, "_passcodeInputFinished", a3);
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  if (objc_msgSend(a3, "state") == (id)1)
  {
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100004A1C;
    v4[3] = &unk_10000C430;
    objc_copyWeak(&v5, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004B70;
  v5[3] = &unk_10000C458;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)_createPasscodeField
{
  int64_t PINFormat;
  PKPinCodeField *v4;
  id *p_complexPasscodeField;
  PKPinCodeField *simplePasscodeField;
  PKTransactionAuthenticationComplexPasscodeTextField *v7;
  PKTransactionAuthenticationComplexPasscodeTextField *complexPasscodeField;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *passcodeField;

  PINFormat = self->_PINFormat;
  if (PINFormat == 2)
  {
    v7 = objc_alloc_init(PKTransactionAuthenticationComplexPasscodeTextField);
    p_complexPasscodeField = (id *)&self->_complexPasscodeField;
    complexPasscodeField = self->_complexPasscodeField;
    self->_complexPasscodeField = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationComplexPasscodeTextField layer](self->_complexPasscodeField, "layer"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor")));
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationComplexPasscodeTextField layer](self->_complexPasscodeField, "layer"));
    objc_msgSend(v11, "setBorderWidth:", 1.0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationComplexPasscodeTextField layer](self->_complexPasscodeField, "layer"));
    objc_msgSend(v12, "setCornerRadius:", 10.0);

    -[PKTransactionAuthenticationComplexPasscodeTextField setTextInsets:](self->_complexPasscodeField, "setTextInsets:", 0.0, 10.0, 0.0, 10.0);
    -[PKTransactionAuthenticationComplexPasscodeTextField setSecureTextEntry:](self->_complexPasscodeField, "setSecureTextEntry:", 1);
    -[PKTransactionAuthenticationComplexPasscodeTextField setDevicePasscodeEntry:](self->_complexPasscodeField, "setDevicePasscodeEntry:", 1);
    -[PKTransactionAuthenticationComplexPasscodeTextField setDelegate:](self->_complexPasscodeField, "setDelegate:", self);
  }
  else
  {
    if (PINFormat != 1)
      return;
    v4 = (PKPinCodeField *)objc_msgSend(objc_alloc((Class)PKPinCodeField), "initWithPinCodeLength:style:delegate:", 6, 1, self);
    p_complexPasscodeField = (id *)&self->_simplePasscodeField;
    simplePasscodeField = self->_simplePasscodeField;
    self->_simplePasscodeField = v4;

    -[PKPinCodeField setHyphenatePinCode:](self->_simplePasscodeField, "setHyphenatePinCode:", 0);
    -[PKPinCodeField setSecureTextEntry:](self->_simplePasscodeField, "setSecureTextEntry:", 1);
  }
  v13 = (UIView *)*p_complexPasscodeField;
  passcodeField = self->_passcodeField;
  self->_passcodeField = v13;

}

- (void)_clearPasscodeField
{
  -[PKPinCodeField setPinCode:](self->_simplePasscodeField, "setPinCode:", 0);
  -[PKTransactionAuthenticationComplexPasscodeTextField setText:](self->_complexPasscodeField, "setText:", 0);
}

- (void)_cancelButtonPressed
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[2];
  _QWORD v8[2];

  v3 = PKAnalyticsSubjectSecureUIService;
  v7[0] = PKAnalyticsReportEventKey;
  v7[1] = PKAnalyticsReportButtonTagKey;
  v8[0] = PKAnalyticsReportEventTypeButtonTap;
  v8[1] = PKAnalyticsReportPaymentPINInputCancelButtonTag;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", v3, v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "passcodeViewControllerDidCancel:", self);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController presentingViewController](self, "presentingViewController"));
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_footerButtonPressed
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  PKTransactionAuthenticationCollectPasscodeViewController *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  objc_initWeak(&location, self);
  v3 = PKLocalizedAquamanString(CFSTR("CANCEL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100005258;
  v25[3] = &unk_10000C480;
  objc_copyWeak(&v26, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v4, 1, v25));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentPass organizationName](self->_pass, "organizationName"));
  if (-[PKLinkedApplication isInstalled](self->_linkedApplication, "isInstalled"))
  {
    v7 = PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_FORGOT_PIN_ALERT_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_FORGOT_PIN_ALERT_BODY"), CFSTR("%@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = PKLocalizedAquamanString(CFSTR("OPEN"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (id *)&PKAnalyticsReportResetPaymentPINOpenButtonTag;
  }
  else
  {
    v14 = PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_APP_REQUIRED_TITLE"), CFSTR("%@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v15 = PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_FORGOT_PIN_APP_REQUIRED_ALERT_BODY"), CFSTR("%@%@"), v6, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v16 = PKLocalizedAquamanString(CFSTR("VIEW_IN_APP_STORE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v13 = (id *)&PKAnalyticsReportResetPaymentPINViewInAppStoreButtonTag;
  }
  v17 = *v13;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100005350;
  v21[3] = &unk_10000C4A8;
  objc_copyWeak(&v24, &location);
  v18 = v17;
  v22 = v18;
  v23 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v21));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1));
  PKApplyDefaultIconToAlertController();
  objc_msgSend(v20, "addAction:", v5);
  objc_msgSend(v20, "addAction:", v19);
  objc_msgSend(v20, "setPreferredAction:", v19);
  -[PKTransactionAuthenticationCollectPasscodeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)_passcodeInputFinished
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[UIView forceDisplayIfNeeded](self->_passcodeField, "forceDisplayIfNeeded");
  v3 = dispatch_time(0, 76000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005588;
  block[3] = &unk_10000C4D0;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_transitionToState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    if (!a3 || a3 == 2)
    {
      -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
      -[UIBarButtonItem setEnabled:](self->_confirmButton, "setEnabled:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v6, "setRightBarButtonItem:", self->_confirmButton);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v7, "setLeftBarButtonItem:", self->_cancelButton);

      -[UIButton setEnabled:](self->_footerButton, "setEnabled:", 1);
      -[UIView setHidden:](self->_passcodeField, "setHidden:", 0);
      -[UIView becomeFirstResponder](self->_passcodeField, "becomeFirstResponder");
    }
    else if (a3 == 1)
    {
      -[UIView setHidden:](self->_passcodeField, "setHidden:");
      -[UIView resignFirstResponder](self->_passcodeField, "resignFirstResponder");
      -[PKTransactionAuthenticationCollectPasscodeViewController _clearPasscodeField](self, "_clearPasscodeField");
      -[UIButton setEnabled:](self->_footerButton, "setEnabled:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v4, "setRightBarButtonItem:", 0);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v5, "setLeftBarButtonItem:", 0);

      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    }
    -[PKTransactionAuthenticationCollectPasscodeViewController _updateFailureLabelVisibility](self, "_updateFailureLabelVisibility");
  }
}

- (void)_encryptPasscodeInput
{
  int64_t PINFormat;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  PINFormat = self->_PINFormat;
  if (PINFormat == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationComplexPasscodeTextField text](self->_complexPasscodeField, "text"));
  }
  else
  {
    if (PINFormat != 1)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPinCodeField pinCode](self->_simplePasscodeField, "pinCode"));
  }
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pk_zString"));

LABEL_7:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentPass uniqueID](self->_pass, "uniqueID"));
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005878;
  v9[3] = &unk_10000C520;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  -[PKTransactionAuthenticationCollectPasscodeViewController _retrievePINEncryptionCertificateForPassUniqueIdentifier:completion:](self, "_retrievePINEncryptionCertificateForPassUniqueIdentifier:completion:", v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005ABC;
    v9[3] = &unk_10000C570;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    v10 = v6;
    objc_msgSend(WeakRetained, "passcodeViewController:requestSessionExchangeToken:", self, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_encryptPIN:(id)a3 withCertificates:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_initWeak(&location, self);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100005DB8;
      v12[3] = &unk_10000C5C0;
      objc_copyWeak(&v16, &location);
      v15 = v10;
      v13 = v8;
      v14 = v9;
      objc_msgSend(WeakRetained, "passcodeViewController:requestSessionExchangeToken:", self, v12);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

- (void)_updateFailureLabelVisibility
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (self->_currentFailure == 1 && self->_currentState == 2)
  {
    v3 = PKLocalizedAquamanString(CFSTR("TRANSACTION_AUTHENTICATION_INCORRECT_PIN_ENTRY"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    -[UILabel setText:](self->_failureLabel, "setText:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionAuthenticationCollectPasscodeViewController viewIfLoaded](self, "viewIfLoaded"));
    objc_msgSend(v5, "setNeedsLayout");

    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  -[UILabel setHidden:](self->_failureLabel, "setHidden:", v6);
}

- (PKTransactionAuthenticationCollectPasscodeViewControllerDelegate)delegate
{
  return (PKTransactionAuthenticationCollectPasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)passcodeField
{
  return self->_passcodeField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_failureLabel, 0);
  objc_storeStrong((id *)&self->_bodyTextLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_complexPasscodeField, 0);
  objc_storeStrong((id *)&self->_simplePasscodeField, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end
