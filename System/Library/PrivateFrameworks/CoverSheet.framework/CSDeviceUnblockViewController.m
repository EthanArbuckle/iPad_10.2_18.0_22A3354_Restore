@implementation CSDeviceUnblockViewController

- (CSDeviceUnblockViewController)initWithViewModel:(id)a3
{
  id v5;
  CSDeviceUnblockViewController *v6;
  CSDeviceUnblockViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDeviceUnblockViewController;
  v6 = -[CSDeviceUnblockViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewModel, a3);

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  id v3;
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
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  UILabel *v23;
  UILabel *bodyLabel;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
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
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
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
  objc_super v88;
  uint64_t v89;
  void *v90;
  _QWORD v91[5];
  _QWORD v92[6];

  v92[4] = *MEMORY[0x1E0C80C00];
  v88.receiver = self;
  v88.super_class = (Class)CSDeviceUnblockViewController;
  -[CSDeviceUnblockViewController viewDidLoad](&v88, sel_viewDidLoad);
  -[CSDeviceUnblockViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  v3 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
  objc_msgSend(v3, "setAxis:", 1);
  objc_msgSend(v3, "setLayoutMargins:", 10.0, 20.0, 20.0, 20.0);
  objc_msgSend(v3, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v3, "setSpacing:", 16.0);
  -[CSDeviceUnblockViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v69 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v3, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewController view](self, "view");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "safeAreaLayoutGuide");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "topAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v81);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v79;
  objc_msgSend(v3, "bottomAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewController view](self, "view");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "safeAreaLayoutGuide");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintLessThanOrEqualToAnchor:", v71);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v67;
  objc_msgSend(v3, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewController view](self, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "safeAreaLayoutGuide");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v92[2] = v6;
  objc_msgSend(v3, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v92[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "activateConstraints:", v12);

  -[CSDeviceUnblockViewController _addHeaderCancelIfNeededToStack:](self, "_addHeaderCancelIfNeededToStack:", v3);
  -[CSDeviceUnblockViewModel iconName](self->_viewModel, "iconName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewController _addSystemImageWithName:toStack:](self, "_addSystemImageWithName:toStack:", v13, v3);

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB5B0], 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "pointSize");
  objc_msgSend(v15, "fontWithSize:", v16 * 1.2);
  v17 = objc_claimAutoreleasedReturnValue();

  -[CSDeviceUnblockViewModel titleText](self->_viewModel, "titleText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)v17;
  v20 = -[CSDeviceUnblockViewController _addLabelWithText:color:font:toStack:](self, "_addLabelWithText:color:font:toStack:", v18, v19, v17, v3);

  -[CSDeviceUnblockViewModel bodyTextForTimeout:](self->_viewModel, "bodyTextForTimeout:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewController _addLabelWithText:color:font:toStack:](self, "_addLabelWithText:color:font:toStack:", v21, v22, 0, v3);
  v23 = (UILabel *)objc_claimAutoreleasedReturnValue();
  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = v23;

  -[CSDeviceUnblockViewModel bodySubtitleText](self->_viewModel, "bodySubtitleText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v3;
  v27 = -[CSDeviceUnblockViewController _addLabelWithText:color:font:toStack:](self, "_addLabelWithText:color:font:toStack:", v25, v26, 0, v3);

  v28 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
  objc_msgSend(v28, "setAxis:", 1);
  objc_msgSend(v28, "setLayoutMargins:", 10.0, 20.0, 20.0, 20.0);
  objc_msgSend(v28, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v28, "setSpacing:", 10.0);
  -[CSDeviceUnblockViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v28);

  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v60 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v28, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewController view](self, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "safeAreaLayoutGuide");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintGreaterThanOrEqualToAnchor:", v74);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v72;
  objc_msgSend(v28, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "safeAreaLayoutGuide");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v64, -8.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v62;
  objc_msgSend(v28, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewController view](self, "view");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "safeAreaLayoutGuide");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v56);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v91[2] = v30;
  objc_msgSend(v28, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDeviceUnblockViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "safeAreaLayoutGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v91[3] = v35;
  v87 = v28;
  objc_msgSend(v28, "widthAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintLessThanOrEqualToConstant:", 100.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v91[4] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "activateConstraints:", v38);

  -[CSDeviceUnblockViewModel primaryButtonText](self->_viewModel, "primaryButtonText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (_QWORD *)MEMORY[0x1E0CEB538];
  if (v39)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCornerStyle:", -1);
    objc_msgSend(v41, "background");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCornerRadius:", 15.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setBaseForegroundColor:", v43);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setBaseBackgroundColor:", v44);

    objc_msgSend(v41, "setButtonSize:", 3);
    objc_msgSend(v41, "setTitleLineBreakMode:", 2);
    v45 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CSDeviceUnblockViewModel primaryButtonText](self->_viewModel, "primaryButtonText");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = *MEMORY[0x1E0CEA098];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", *v40, *MEMORY[0x1E0CEB5E8]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v45, "initWithString:attributes:", v46, v48);

    objc_msgSend(v41, "setAttributedTitle:", v49);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setConfiguration:", v41);
    objc_msgSend(v50, "addTarget:action:forControlEvents:", self->_viewModel, sel_primaryButtonAction, 64);
    objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v87, "addArrangedSubview:", v50);

  }
  -[CSDeviceUnblockViewModel secondaryButtonText](self->_viewModel, "secondaryButtonText");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addTarget:action:forControlEvents:", self->_viewModel, sel_secondaryButtonAction, 64);
    -[CSDeviceUnblockViewModel secondaryButtonText](self->_viewModel, "secondaryButtonText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setTitle:forState:", v53, 0);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", *v40, *MEMORY[0x1E0CEB5F0]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setFont:", v54);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setTitleColor:forState:", v55, 0);

    objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v87, "addArrangedSubview:", v52);

  }
}

- (void)setTimeoutString:(id)a3
{
  UILabel *bodyLabel;
  id v4;

  bodyLabel = self->_bodyLabel;
  -[CSDeviceUnblockViewModel bodyTextForTimeout:](self->_viewModel, "bodyTextForTimeout:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](bodyLabel, "setText:", v4);

}

- (void)_addHeaderCancelIfNeededToStack:(id)a3
{
  objc_class *v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0CEA9E0];
  v5 = a3;
  v13 = objc_alloc_init(v4);
  objc_msgSend(v13, "setAxis:", 0);
  objc_msgSend(v5, "addArrangedSubview:", v13);
  objc_msgSend(v5, "spacing");
  objc_msgSend(v5, "setCustomSpacing:afterView:", v13, v6 * 1.75);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self->_viewModel, sel_cancelButtonAction, 64);
  -[CSDeviceUnblockViewModel cancelButtonText](self->_viewModel, "cancelButtonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setFont:", v9);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleColor:forState:", v10, 0);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "addArrangedSubview:", v7);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v12) = 1132068864;
  objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 0, v12);
  objc_msgSend(v13, "addArrangedSubview:", v11);

}

- (void)_addSystemImageWithName:(id)a3 toStack:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = a4;
  objc_msgSend(v5, "_systemImageNamed:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v12);
  objc_msgSend(v7, "setContentMode:", 1);
  objc_msgSend(v7, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", 70.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v10);

  objc_msgSend(v6, "addArrangedSubview:", v7);
  objc_msgSend(v6, "spacing");
  objc_msgSend(v6, "setCustomSpacing:afterView:", v7, v11 * 1.75);

}

- (id)_addLabelWithText:(id)a3 color:(id)a4 font:(id)a5 toStack:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0CEA700];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  objc_msgSend(v14, "setColor:", v12);

  if (v9)
  {
    objc_msgSend(v14, "setFont:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB538], 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v16);

  }
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(v14, "setTextAlignment:", 1);
  objc_msgSend(v14, "setNumberOfLines:", 0);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "addArrangedSubview:", v14);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
