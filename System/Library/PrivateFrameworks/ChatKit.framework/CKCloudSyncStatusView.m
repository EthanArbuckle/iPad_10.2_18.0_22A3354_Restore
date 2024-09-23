@implementation CKCloudSyncStatusView

- (CKCloudSyncStatusView)initWithFrame:(CGRect)a3
{
  CKCloudSyncStatusView *v3;
  CKCloudSyncStatusView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKCloudSyncStatusView;
  v3 = -[CKCloudSyncStatusView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_hasFinishedFirstLayoutPass = 0;
    -[CKCloudSyncStatusView _configureUI](v3, "_configureUI");
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKCloudSyncStatusView;
  -[CKCloudSyncStatusView layoutSubviews](&v3, sel_layoutSubviews);
  if (!-[CKCloudSyncStatusView hasFinishedFirstLayoutPass](self, "hasFinishedFirstLayoutPass"))
    -[CKCloudSyncStatusView setHasFinishedFirstLayoutPass:](self, "setHasFinishedFirstLayoutPass:", 1);
}

- (void)_configureUI
{
  void *v3;
  void *v4;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIVisualEffectView *backgroundVisualEffectView;
  UIView *v15;
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
  UIView *hairlineView;
  id v27;
  void *v28;
  UIProgressView *v29;
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
  UIProgressView *progressView;
  UIView *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  UIView *containerView;
  UIView *v53;
  UILabel *v54;
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
  UILabel *progressLabel;
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
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  CKCloudSyncStatusView *v92;
  void *v93;
  void *v94;
  void *v95;
  UIProgressView *v96;
  void *v97;
  void *v98;
  UIView *v99;
  void *v100;
  UIVisualEffectView *v101;
  void *v102;
  _QWORD v103[3];
  _QWORD v104[5];
  _QWORD v105[3];
  _QWORD v106[4];
  _QWORD v107[6];

  v107[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CEA398];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectWithStyle:", objc_msgSend(v4, "syncBarBlurEffectStyle"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v102);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKCloudSyncStatusView addSubview:](self, "addSubview:", v5);
  v77 = (void *)MEMORY[0x1E0CB3718];
  -[UIVisualEffectView leadingAnchor](v5, "leadingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView leadingAnchor](self, "leadingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v97);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v93;
  -[UIVisualEffectView trailingAnchor](v5, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView trailingAnchor](self, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v82);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v6;
  -[UIVisualEffectView topAnchor](v5, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView topAnchor](self, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v9;
  -[UIVisualEffectView bottomAnchor](v5, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView bottomAnchor](self, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v107[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "activateConstraints:", v13);

  backgroundVisualEffectView = self->_backgroundVisualEffectView;
  self->_backgroundVisualEffectView = v5;
  v101 = v5;

  v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "syncBarHairlineColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v17);

  -[CKCloudSyncStatusView addSubview:](self, "addSubview:", v15);
  v78 = (void *)MEMORY[0x1E0CB3718];
  -[UIView leadingAnchor](v15, "leadingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView leadingAnchor](self, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v94);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v88;
  -[UIView trailingAnchor](v15, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView trailingAnchor](self, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v19;
  -[UIView topAnchor](v15, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView topAnchor](self, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v106[2] = v22;
  -[UIView heightAnchor](v15, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToConstant:", 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v106[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "activateConstraints:", v25);

  hairlineView = self->_hairlineView;
  self->_hairlineView = v15;
  v99 = v15;

  v27 = objc_alloc(MEMORY[0x1E0CEA8E8]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (UIProgressView *)objc_msgSend(v27, "initWithProgressViewStyle:", objc_msgSend(v28, "syncProgressBarStyle"));

  -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIProgressView setClipsToBounds:](v29, "setClipsToBounds:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "syncProgressTrackColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressView setTrackTintColor:](v29, "setTrackTintColor:", v31);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "syncProgressColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressView setTintColor:](v29, "setTintColor:", v33);

  -[CKCloudSyncStatusView addSubview:](self, "addSubview:", v29);
  v75 = (void *)MEMORY[0x1E0CB3718];
  -[UIProgressView leadingAnchor](v29, "leadingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView leadingAnchor](self, "leadingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "syncProgressLeadingPadding");
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v84);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v79;
  -[UIProgressView trailingAnchor](v29, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView trailingAnchor](self, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "syncProgressTrailingPadding");
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v36;
  -[UIProgressView topAnchor](v29, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView topAnchor](self, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "syncProgressTopPadding");
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v105[2] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "activateConstraints:", v41);

  progressView = self->_progressView;
  self->_progressView = v29;
  v96 = v29;

  v43 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKCloudSyncStatusView addSubview:](self, "addSubview:", v43);
  v69 = (void *)MEMORY[0x1E0CB3718];
  -[UIView leadingAnchor](v43, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "leadingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v80);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v76;
  -[UIView trailingAnchor](v43, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v70;
  -[UIView topAnchor](v43, "topAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView topAnchor](self, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2] = v66;
  -[UIView bottomAnchor](v43, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSyncStatusView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v104[3] = v47;
  -[UIView heightAnchor](v43, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "syncBarFooterHeight");
  objc_msgSend(v48, "constraintEqualToConstant:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v104[4] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "activateConstraints:", v51);

  v92 = self;
  containerView = self->_containerView;
  self->_containerView = v43;
  v53 = v43;

  v54 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](v54, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setTextAlignment:](v54, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v54, "setNumberOfLines:", 2);
  -[UILabel setText:](v54, "setText:", &stru_1E276D870);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "syncProgressLabelFont");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v54, "setFont:", v56);

  -[UIView addSubview:](v53, "addSubview:", v54);
  v81 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel leadingAnchor](v54, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v53, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v86);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v57;
  -[UILabel trailingAnchor](v54, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v53, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v60;
  -[UILabel centerYAnchor](v54, "centerYAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](v53, "centerYAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 3);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "activateConstraints:", v64);

  progressLabel = v92->_progressLabel;
  v92->_progressLabel = v54;

}

- (BOOL)isVisibleInViewHierarchy
{
  void *v3;
  int v4;

  -[CKCloudSyncStatusView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[CKCloudSyncStatusView isHidden](self, "isHidden") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)updateWithSyncState:(id)a3
{
  int v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;

  v20 = a3;
  if (objc_msgSend(v20, "syncType") == 2)
    v4 = objc_msgSend(v20, "hasNotSyncedInLastSevenDays") ^ 1;
  else
    v4 = 1;
  if (objc_msgSend(v20, "hasAvailableRecordsToDownload"))
  {
    if (objc_msgSend(v20, "syncJobState") != 2 && objc_msgSend(v20, "syncJobState") != 3)
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  -[CKCloudSyncStatusView progressView](self, "progressView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v4 == v6)
  {
    -[CKCloudSyncStatusView progressView](self, "progressView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v4 ^ 1u);

    -[CKCloudSyncStatusView progressView](self, "progressView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "isHidden");

  }
  else
  {
    v7 = 1;
  }
  v10 = v20;
  if (v4)
  {
    objc_msgSend(v20, "lastDownloadProgress");
    v12 = v11;
    v13 = -[CKCloudSyncStatusView hasFinishedFirstLayoutPass](self, "hasFinishedFirstLayoutPass") & v7;
    -[CKCloudSyncStatusView progressView](self, "progressView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v15 = v12;
    objc_msgSend(v14, "setProgress:animated:", v13, v15);

    v10 = v20;
  }
  objc_msgSend(v10, "syncStatusText");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_1E276D870;
  -[CKCloudSyncStatusView progressLabel](self, "progressLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, a3);
}

- (UIView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_progressLabel, a3);
}

- (BOOL)hasFinishedFirstLayoutPass
{
  return self->_hasFinishedFirstLayoutPass;
}

- (void)setHasFinishedFirstLayoutPass:(BOOL)a3
{
  self->_hasFinishedFirstLayoutPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
}

@end
