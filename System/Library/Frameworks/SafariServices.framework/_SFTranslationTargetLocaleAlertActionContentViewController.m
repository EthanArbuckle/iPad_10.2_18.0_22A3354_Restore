@implementation _SFTranslationTargetLocaleAlertActionContentViewController

- (_SFTranslationTargetLocaleAlertActionContentViewController)initWithLocaleIdentifier:(id)a3
{
  id v5;
  _SFTranslationTargetLocaleAlertActionContentViewController *v6;
  _SFTranslationTargetLocaleAlertActionContentViewController *v7;
  void *v8;
  id v9;
  _SFTranslationTargetLocaleAlertActionContentViewController *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFTranslationTargetLocaleAlertActionContentViewController;
  v6 = -[_SFTranslationTargetLocaleAlertActionContentViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localeIdentifier, a3);
    v13[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)-[_SFTranslationTargetLocaleAlertActionContentViewController registerForTraitChanges:withTarget:action:](v7, "registerForTraitChanges:withTarget:action:", v8, v7, sel__updateVerticalPadding);

    v10 = v7;
  }

  return v7;
}

- (void)loadView
{
  _SFTranslationTargetLocaleAlertActionContentView *v3;

  v3 = objc_alloc_init(_SFTranslationTargetLocaleAlertActionContentView);
  -[_SFTranslationTargetLocaleAlertActionContentViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *topTextPaddingConstraint;
  double v25;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *bottomTextPaddingConstraint;
  double v30;
  NSLayoutConstraint *v31;
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
  objc_super v63;
  _QWORD v64[8];
  _QWORD v65[6];

  v65[4] = *MEMORY[0x1E0C80C00];
  v63.receiver = self;
  v63.super_class = (Class)_SFTranslationTargetLocaleAlertActionContentViewController;
  -[_SFTranslationTargetLocaleAlertActionContentViewController viewDidLoad](&v63, sel_viewDidLoad);
  -[_SFTranslationTargetLocaleAlertActionContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[_SFTranslationTargetLocaleAlertActionContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0C99DC8], "safari_displayNameForLocaleIdentifier:inNativeLanguage:", self->_localeIdentifier, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  objc_msgSend(v3, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v7);

  objc_msgSend(v4, "setTextAlignment:", 1);
  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v3, "setTitleLabel:", v4);
  v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v62 = v3;
  objc_msgSend(v3, "addSubview:", v8);
  objc_msgSend(v8, "addSubview:", v4);
  if ((objc_msgSend(MEMORY[0x1E0C99DC8], "safari_currentLocaleHasSameBaseLanguageAsLocaleIdentifier:", self->_localeIdentifier) & 1) != 0)
  {
    objc_msgSend(v4, "bottomAnchor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0C99DC8], "safari_displayNameForLocaleIdentifier:inNativeLanguage:", self->_localeIdentifier, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v12);

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v14);

    objc_msgSend(v9, "setTextAlignment:", 1);
    objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v8, "addSubview:", v9);
    v54 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v9, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v11, 0.4);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v60;
    objc_msgSend(v9, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v56);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v50;
    objc_msgSend(v9, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v46);
    v15 = v4;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v16;
    objc_msgSend(v9, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "activateConstraints:", v20);

    v10 = v52;
    v4 = v15;

  }
  objc_msgSend(v8, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v22);
  v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topTextPaddingConstraint = self->_topTextPaddingConstraint;
  self->_topTextPaddingConstraint = v23;

  LODWORD(v25) = 1132068864;
  -[NSLayoutConstraint setPriority:](self->_topTextPaddingConstraint, "setPriority:", v25);
  objc_msgSend(v62, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:", v27);
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomTextPaddingConstraint = self->_bottomTextPaddingConstraint;
  self->_bottomTextPaddingConstraint = v28;

  LODWORD(v30) = 1132068864;
  -[NSLayoutConstraint setPriority:](self->_bottomTextPaddingConstraint, "setPriority:", v30);
  -[_SFTranslationTargetLocaleAlertActionContentViewController _updateVerticalPadding](self, "_updateVerticalPadding");
  v45 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v8, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v59);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v57;
  objc_msgSend(v8, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v53);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v51;
  objc_msgSend(v8, "centerYAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v47);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = self->_topTextPaddingConstraint;
  v64[2] = v43;
  v64[3] = v31;
  v64[4] = self->_bottomTextPaddingConstraint;
  objc_msgSend(v4, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v33;
  objc_msgSend(v4, "leadingAnchor");
  v34 = v4;
  v44 = v4;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v37;
  objc_msgSend(v34, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "activateConstraints:", v41);

}

- (void)_updateVerticalPadding
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:", 8.0);
  v5 = v4;

  -[NSLayoutConstraint setConstant:](self->_topTextPaddingConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_bottomTextPaddingConstraint, "setConstant:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomTextPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_topTextPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
