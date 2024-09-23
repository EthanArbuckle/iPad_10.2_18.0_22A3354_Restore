@implementation HSCameraInstructionsView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HSCameraInstructionsView)initWithFrame:(CGRect)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  v6 = NSStringFromSelector("initWithNFCStartFuture:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSCameraInstructionsView.m"), 58, CFSTR("%s is unavailable; use %@ instead"),
    "-[HSCameraInstructionsView initWithFrame:]",
    v7);

  return 0;
}

- (HSCameraInstructionsView)initWithCoder:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("initWithNFCStartFuture:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSCameraInstructionsView.m"), 63, CFSTR("%s is unavailable; use %@ instead"),
    "-[HSCameraInstructionsView initWithCoder:]",
    v7);

  return 0;
}

- (HSCameraInstructionsView)initWithNFCStartFuture:(id)a3
{
  id v5;
  double y;
  double width;
  double height;
  HSCameraInstructionsView *v9;
  HSCameraInstructionsView *v10;
  void *v11;
  id v12;
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
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  NAFuture *nfcStartFuture;
  id v84;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  id location;
  objc_super v91;

  v5 = a3;
  v91.receiver = self;
  v91.super_class = (Class)HSCameraInstructionsView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = -[HSCameraInstructionsView initWithFrame:](&v91, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nfcStartFuture, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[HSCameraInstructionsView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[HSCameraInstructionsView setPreservesSuperviewLayoutMargins:](v10, "setPreservesSuperviewLayoutMargins:", 1);
    v12 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[HSCameraInstructionsView setScanCodeTitleLabel:](v10, "setScanCodeTitleLabel:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeTitleLabel](v10, "scanCodeTitleLabel"));
    objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeTitleLabel](v10, "scanCodeTitleLabel"));
    objc_msgSend(v14, "setMinimumScaleFactor:", 0.01);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeTitleLabel](v10, "scanCodeTitleLabel"));
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeTitleLabel](v10, "scanCodeTitleLabel"));
    objc_msgSend(v16, "setNumberOfLines:", 0);

    v17 = HULocalizedString(CFSTR("HUProximityCardCameraScannerVCInstructionsCameraTitle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeTitleLabel](v10, "scanCodeTitleLabel"));
    objc_msgSend(v19, "setText:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeBodyLabel](v10, "scanCodeBodyLabel"));
    objc_msgSend(v21, "setTextColor:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeTitleLabel](v10, "scanCodeTitleLabel"));
    -[HSCameraInstructionsView addSubview:](v10, "addSubview:", v22);

    v23 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[HSCameraInstructionsView setScanCodeBodyLabel:](v10, "setScanCodeBodyLabel:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeBodyLabel](v10, "scanCodeBodyLabel"));
    objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeBodyLabel](v10, "scanCodeBodyLabel"));
    objc_msgSend(v25, "setMinimumScaleFactor:", 0.01);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeBodyLabel](v10, "scanCodeBodyLabel"));
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeBodyLabel](v10, "scanCodeBodyLabel"));
    objc_msgSend(v27, "setNumberOfLines:", 0);

    v28 = HULocalizedString(CFSTR("HUProximityCardCameraScannerVCInstructionsCameraSubtitle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeBodyLabel](v10, "scanCodeBodyLabel"));
    objc_msgSend(v30, "setText:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeBodyLabel](v10, "scanCodeBodyLabel"));
    objc_msgSend(v32, "setTextColor:", v31);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeBodyLabel](v10, "scanCodeBodyLabel"));
    -[HSCameraInstructionsView addSubview:](v10, "addSubview:", v33);

    v35 = (void *)objc_opt_new(UIImageView, v34);
    -[HSCameraInstructionsView setScanCodeIconView:](v10, "setScanCodeIconView:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView _scanCodeImageAssetForCurrentTraitEnvironment](v10, "_scanCodeImageAssetForCurrentTraitEnvironment"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeIconView](v10, "scanCodeIconView"));
    objc_msgSend(v37, "setImage:", v36);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeIconView](v10, "scanCodeIconView"));
    objc_msgSend(v39, "setTintColor:", v38);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeIconView](v10, "scanCodeIconView"));
    LODWORD(v41) = 1148846080;
    objc_msgSend(v40, "setContentCompressionResistancePriority:forAxis:", 0, v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeIconView](v10, "scanCodeIconView"));
    LODWORD(v43) = 1148846080;
    objc_msgSend(v42, "setContentHuggingPriority:forAxis:", 0, v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeIconView](v10, "scanCodeIconView"));
    objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeIconView](v10, "scanCodeIconView"));
    -[HSCameraInstructionsView addSubview:](v10, "addSubview:", v45);

    v46 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[HSCameraInstructionsView setNfcTitleLabel:](v10, "setNfcTitleLabel:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcTitleLabel](v10, "nfcTitleLabel"));
    objc_msgSend(v47, "setAdjustsFontSizeToFitWidth:", 1);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcTitleLabel](v10, "nfcTitleLabel"));
    objc_msgSend(v48, "setMinimumScaleFactor:", 0.01);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcTitleLabel](v10, "nfcTitleLabel"));
    objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcTitleLabel](v10, "nfcTitleLabel"));
    objc_msgSend(v50, "setNumberOfLines:", 0);

    v51 = HULocalizedString(CFSTR("HUProximityCardCameraScannerVCInstructionsNFCTitle"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcTitleLabel](v10, "nfcTitleLabel"));
    objc_msgSend(v53, "setText:", v52);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcTitleLabel](v10, "nfcTitleLabel"));
    objc_msgSend(v54, "setHidden:", 1);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcTitleLabel](v10, "nfcTitleLabel"));
    -[HSCameraInstructionsView addSubview:](v10, "addSubview:", v55);

    v56 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[HSCameraInstructionsView setNfcBodyLabel:](v10, "setNfcBodyLabel:", v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcBodyLabel](v10, "nfcBodyLabel"));
    objc_msgSend(v57, "setAdjustsFontSizeToFitWidth:", 1);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcBodyLabel](v10, "nfcBodyLabel"));
    objc_msgSend(v58, "setMinimumScaleFactor:", 0.01);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcBodyLabel](v10, "nfcBodyLabel"));
    objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcBodyLabel](v10, "nfcBodyLabel"));
    objc_msgSend(v60, "setNumberOfLines:", 0);

    v61 = HULocalizedString(CFSTR("HUProximityCardCameraScannerVCInstructionsNFCSubtitle"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcBodyLabel](v10, "nfcBodyLabel"));
    objc_msgSend(v63, "setText:", v62);

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcBodyLabel](v10, "nfcBodyLabel"));
    objc_msgSend(v65, "setTextColor:", v64);

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcBodyLabel](v10, "nfcBodyLabel"));
    objc_msgSend(v66, "setHidden:", 1);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcBodyLabel](v10, "nfcBodyLabel"));
    -[HSCameraInstructionsView addSubview:](v10, "addSubview:", v67);

    v69 = (void *)objc_opt_new(UIImageView, v68);
    -[HSCameraInstructionsView setNfcIconView:](v10, "setNfcIconView:", v69);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView _nfcCodeImageAssetForCurrentTraitEnvironment](v10, "_nfcCodeImageAssetForCurrentTraitEnvironment"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcIconView](v10, "nfcIconView"));
    objc_msgSend(v71, "setImage:", v70);

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcIconView](v10, "nfcIconView"));
    objc_msgSend(v73, "setTintColor:", v72);

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcIconView](v10, "nfcIconView"));
    LODWORD(v75) = 1148846080;
    objc_msgSend(v74, "setContentCompressionResistancePriority:forAxis:", 0, v75);

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcIconView](v10, "nfcIconView"));
    LODWORD(v77) = 1148846080;
    objc_msgSend(v76, "setContentHuggingPriority:forAxis:", 0, v77);

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcIconView](v10, "nfcIconView"));
    objc_msgSend(v78, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcIconView](v10, "nfcIconView"));
    objc_msgSend(v79, "setHidden:", 1);

    v80 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcIconView](v10, "nfcIconView"));
    -[HSCameraInstructionsView addSubview:](v10, "addSubview:", v80);

    -[HSCameraInstructionsView _setupFontsForCurrentTraitCollection](v10, "_setupFontsForCurrentTraitCollection");
    -[HSCameraInstructionsView layoutMargins](v10, "layoutMargins");
    -[HSCameraInstructionsView setLayoutMargins:](v10, "setLayoutMargins:");
    objc_initWeak(&location, v10);
    v81 = objc_alloc((Class)NAUILayoutConstraintSet);
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_1000579C4;
    v88[3] = &unk_1000A1B98;
    objc_copyWeak(&v89, &location);
    v82 = objc_msgSend(v81, "initWithOwningView:constraintBuilder:", v10, v88);
    -[HSCameraInstructionsView setConstraintSet:](v10, "setConstraintSet:", v82);

    nfcStartFuture = v10->_nfcStartFuture;
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_1000580D4;
    v86[3] = &unk_1000A2990;
    objc_copyWeak(&v87, &location);
    v84 = -[NAFuture addSuccessBlock:](nfcStartFuture, "addSuccessBlock:", v86);
    objc_destroyWeak(&v87);
    objc_destroyWeak(&v89);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView constraintSet](self, "constraintSet"));
  objc_msgSend(v3, "activateIfNeeded");

  v4.receiver = self;
  v4.super_class = (Class)HSCameraInstructionsView;
  -[HSCameraInstructionsView updateConstraints](&v4, "updateConstraints");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HSCameraInstructionsView;
  v4 = a3;
  -[HSCameraInstructionsView traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  -[HSCameraInstructionsView _updateScanCodeIcon](self, "_updateScanCodeIcon");
  v6.receiver = self;
  v6.super_class = (Class)HSCameraInstructionsView;
  -[HSCameraInstructionsView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView constraintSet](self, "constraintSet"));
  objc_msgSend(v5, "invalidate");

  -[HSCameraInstructionsView _setupFontsForCurrentTraitCollection](self, "_setupFontsForCurrentTraitCollection");
}

- (BOOL)requiresScrolling
{
  return 0;
}

- (void)_updateScanCodeIcon
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView _scanCodeImageAssetForCurrentTraitEnvironment](self, "_scanCodeImageAssetForCurrentTraitEnvironment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeIconView](self, "scanCodeIconView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeIconView](self, "scanCodeIconView"));
    objc_msgSend(v6, "setImage:", v8);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView constraintSet](self, "constraintSet"));
    objc_msgSend(v7, "invalidate");

  }
}

- (id)_scanCodeImageAssetForCurrentTraitEnvironment
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleTitle1, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("qrcode"), v2));

  return v3;
}

- (id)_nfcCodeImageAssetForCurrentTraitEnvironment
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleTitle1, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("nfc"), v2));

  return v3;
}

- (BOOL)_shouldStackIcons
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "largeContentSizeCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = objc_msgSend(v4, "containsObject:", v6);

  return v7;
}

- (BOOL)_isShowingNFCInstructions
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcTitleLabel](self, "nfcTitleLabel"));
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)_setupFontsForCurrentTraitCollection
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = sub_100005F88();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcTitleLabel](self, "nfcTitleLabel"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = sub_100005F88();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeTitleLabel](self, "scanCodeTitleLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = sub_100005FEC();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView nfcBodyLabel](self, "nfcBodyLabel"));
  objc_msgSend(v11, "setFont:", v10);

  v12 = sub_100005FEC();
  v14 = (id)objc_claimAutoreleasedReturnValue(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView scanCodeBodyLabel](self, "scanCodeBodyLabel"));
  objc_msgSend(v13, "setFont:", v14);

}

- (NAFuture)nfcStartFuture
{
  return self->_nfcStartFuture;
}

- (UILabel)scanCodeTitleLabel
{
  return self->_scanCodeTitleLabel;
}

- (void)setScanCodeTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_scanCodeTitleLabel, a3);
}

- (UILabel)scanCodeBodyLabel
{
  return self->_scanCodeBodyLabel;
}

- (void)setScanCodeBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_scanCodeBodyLabel, a3);
}

- (UIImageView)scanCodeIconView
{
  return self->_scanCodeIconView;
}

- (void)setScanCodeIconView:(id)a3
{
  objc_storeStrong((id *)&self->_scanCodeIconView, a3);
}

- (UILabel)nfcTitleLabel
{
  return self->_nfcTitleLabel;
}

- (void)setNfcTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nfcTitleLabel, a3);
}

- (UILabel)nfcBodyLabel
{
  return self->_nfcBodyLabel;
}

- (void)setNfcBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nfcBodyLabel, a3);
}

- (UIImageView)nfcIconView
{
  return self->_nfcIconView;
}

- (void)setNfcIconView:(id)a3
{
  objc_storeStrong((id *)&self->_nfcIconView, a3);
}

- (NAUILayoutConstraintSet)constraintSet
{
  return self->_constraintSet;
}

- (void)setConstraintSet:(id)a3
{
  objc_storeStrong((id *)&self->_constraintSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintSet, 0);
  objc_storeStrong((id *)&self->_nfcIconView, 0);
  objc_storeStrong((id *)&self->_nfcBodyLabel, 0);
  objc_storeStrong((id *)&self->_nfcTitleLabel, 0);
  objc_storeStrong((id *)&self->_scanCodeIconView, 0);
  objc_storeStrong((id *)&self->_scanCodeBodyLabel, 0);
  objc_storeStrong((id *)&self->_scanCodeTitleLabel, 0);
  objc_storeStrong((id *)&self->_nfcStartFuture, 0);
}

@end
