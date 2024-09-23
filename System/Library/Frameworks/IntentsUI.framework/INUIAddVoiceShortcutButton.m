@implementation INUIAddVoiceShortcutButton

- (INUIAddVoiceShortcutButton)initWithStyle:(INUIAddVoiceShortcutButtonStyle)style
{
  INUIAddVoiceShortcutButton *v4;
  INUIAddVoiceShortcutButton *v5;
  INUIAddVoiceShortcutButton *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INUIAddVoiceShortcutButton;
  v4 = -[INUIAddVoiceShortcutButton initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[INUIAddVoiceShortcutButton _configureWithStyle:](v4, "_configureWithStyle:", style);
    v6 = v5;
  }

  return v5;
}

- (INUIAddVoiceShortcutButton)initWithCoder:(id)a3
{
  return -[INUIAddVoiceShortcutButton initWithStyle:](self, "initWithStyle:", 0);
}

- (void)_configureWithStyle:(unint64_t)a3
{
  double v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
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
  id v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *addToSiriLeadingConstraint;
  double v49;
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
  NSLayoutConstraint *v63;
  NSLayoutConstraint *addedToSiriLeadingConstraint;
  void *v65;
  void *v66;
  void *v67;
  id v68;
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
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSLayoutConstraint *v113;
  void *v114;
  _QWORD v115[18];
  _QWORD v116[4];

  v116[2] = *MEMORY[0x1E0C80C00];
  self->_style = a3;
  -[INUIAddVoiceShortcutButton INUIAddVoiceShortcutDefaultCornerRadius](self, "INUIAddVoiceShortcutDefaultCornerRadius");
  self->_cornerRadius = v5;
  -[INUIAddVoiceShortcutButton layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _backgroundColorForStyle:](self, "_backgroundColorForStyle:", a3);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  -[INUIAddVoiceShortcutButton layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMasksToBounds:", 1);

  -[INUIAddVoiceShortcutButton layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _strokeColorForStyle:](self, "_strokeColorForStyle:", a3);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

  -[INUIAddVoiceShortcutButton layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _strokeWidthForStyle:](self, "_strokeWidthForStyle:", a3);
  objc_msgSend(v11, "setBorderWidth:");

  -[INUIAddVoiceShortcutButton layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  LODWORD(v13) = 1148846080;
  -[UIView _inui_setContentHuggingPriority:forAxis:](self, "_inui_setContentHuggingPriority:forAxis:", 0, v13);
  LODWORD(v14) = 1148846080;
  -[UIView _inui_setContentHuggingPriority:forAxis:](self, "_inui_setContentHuggingPriority:forAxis:", 1, v14);
  v15 = (void *)MEMORY[0x1E0CEA658];
  -[INUIAddVoiceShortcutButton _sphiriImageForStyle:](self, "_sphiriImageForStyle:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_inui_imageViewWithImage:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "setAccessibilityIgnoresInvertColors:", 1);
  -[INUIAddVoiceShortcutButton addSubview:](self, "addSubview:", v17);
  v18 = v17;
  objc_storeWeak((id *)&self->_sphiriImageView, v17);
  v19 = objc_alloc_init(MEMORY[0x1E0CEA710]);
  -[INUIAddVoiceShortcutButton addLayoutGuide:](self, "addLayoutGuide:");
  v20 = (void *)MEMORY[0x1E0CEA658];
  -[INUIAddVoiceShortcutButton _checkmarkImage](self, "_checkmarkImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_inui_imageViewWithImage:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[INUIAddVoiceShortcutButton _textColorForStyle:](self, "_textColorForStyle:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_inui_setTintColor:", v23);

  objc_msgSend(v22, "setHidden:", 1);
  -[INUIAddVoiceShortcutButton addSubview:](self, "addSubview:", v22);
  objc_storeWeak((id *)&self->_checkmarkImageView, v22);
  v24 = (void *)MEMORY[0x1E0CEA700];
  -[INUIAddVoiceShortcutButton _addToSiriText](self, "_addToSiriText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_inui_labelWithText:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v26;
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[INUIAddVoiceShortcutButton _textColorForStyle:](self, "_textColorForStyle:", a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v28);

  -[INUIAddVoiceShortcutButton _addToSiriFont](self, "_addToSiriFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFont:", v29);

  v112 = v27;
  objc_storeWeak((id *)&self->_addToSiriLabel, v27);
  objc_msgSend(MEMORY[0x1E0CEA700], "_inui_labelWithText:", 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setTextColor:", v30);

  -[INUIAddVoiceShortcutButton _phraseFont](self, "_phraseFont");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setFont:", v31);

  objc_msgSend(v111, "setHidden:", 1);
  objc_storeWeak((id *)&self->_phraseLabel, v111);
  v32 = (void *)MEMORY[0x1E0CEA9E0];
  v116[0] = v27;
  v116[1] = v111;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_inui_stackViewWithArrangedSubviews:userInteractionEnabled:", v33, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v34, "_inui_setAxis:", 1);
  objc_msgSend(v34, "setAlignment:", 1);
  v35 = v34;
  -[INUIAddVoiceShortcutButton addSubview:](self, "addSubview:", v34);
  v36 = objc_alloc_init(MEMORY[0x1E0CEA710]);
  -[INUIAddVoiceShortcutButton addLayoutGuide:](self, "addLayoutGuide:", v36);
  objc_msgSend(v18, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v104 = v39;
  LODWORD(v40) = 1148846080;
  objc_msgSend(v39, "setPriority:", v40);
  objc_msgSend(v22, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v43) = 1148846080;
  objc_msgSend(v114, "setPriority:", v43);
  v44 = v36;
  objc_msgSend(v36, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  addToSiriLeadingConstraint = self->_addToSiriLeadingConstraint;
  self->_addToSiriLeadingConstraint = v47;
  v113 = v47;

  v90 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v19, "leadingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton leadingAnchor](self, "leadingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton INUIAddVoiceShortcutDefaultHorizontalMargin](self, "INUIAddVoiceShortcutDefaultHorizontalMargin");
  objc_msgSend(v109, "constraintGreaterThanOrEqualToAnchor:constant:", v108);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v107;
  objc_msgSend(v19, "trailingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton trailingAnchor](self, "trailingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton INUIAddVoiceShortcutDefaultHorizontalMargin](self, "INUIAddVoiceShortcutDefaultHorizontalMargin");
  objc_msgSend(v105, "constraintLessThanOrEqualToAnchor:constant:", v103, -v49);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v102;
  objc_msgSend(v19, "centerXAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton centerXAnchor](self, "centerXAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:", v100);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v98;
  objc_msgSend(v19, "centerYAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton centerYAnchor](self, "centerYAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:", v96);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v115[3] = v95;
  objc_msgSend(v35, "topAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v93);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v115[4] = v92;
  objc_msgSend(v35, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v44;
  v80 = v44;
  objc_msgSend(v44, "trailingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v115[5] = v88;
  v110 = v35;
  objc_msgSend(v35, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v86);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v115[6] = v85;
  objc_msgSend(v35, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v19;
  objc_msgSend(v19, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v115[7] = v81;
  objc_msgSend(v18, "centerYAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v115[8] = v77;
  v106 = v18;
  objc_msgSend(v18, "heightAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton INUIAddVoiceShortcutIconWidthHeight](self, "INUIAddVoiceShortcutIconWidthHeight");
  objc_msgSend(v76, "constraintEqualToConstant:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v115[9] = v75;
  v115[10] = v39;
  objc_msgSend(v18, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v19;
  objc_msgSend(v19, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v115[11] = v72;
  objc_msgSend(v22, "centerYAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton centerYAnchor](self, "centerYAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v70);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v115[12] = v52;
  v83 = v22;
  objc_msgSend(v22, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton INUIAddVoiceShortcutIconWidthHeight](self, "INUIAddVoiceShortcutIconWidthHeight");
  objc_msgSend(v53, "constraintEqualToConstant:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v115[13] = v54;
  v115[14] = v114;
  objc_msgSend(v22, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v115[15] = v57;
  v115[16] = v113;
  objc_msgSend(v50, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton INUIAddVoiceShortcutDefaultHorizontalPadding](self, "INUIAddVoiceShortcutDefaultHorizontalPadding");
  objc_msgSend(v58, "constraintEqualToConstant:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v115[17] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 18);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "activateConstraints:", v60);

  objc_msgSend(v80, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v62);
  v63 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  addedToSiriLeadingConstraint = self->_addedToSiriLeadingConstraint;
  self->_addedToSiriLeadingConstraint = v63;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addObserver:selector:name:object:", self, sel__handleVoiceShortcutUpdateNotification_, CFSTR("com.apple.IntentsUI.INUIAddVoiceShortcutViewController.didAddVoiceShortcut"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObserver:selector:name:object:", self, sel__handleVoiceShortcutUpdateNotification_, CFSTR("com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didUpdateVoiceShortcut"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addObserver:selector:name:object:", self, sel__handleVoiceShortcutUpdateNotification_, CFSTR("com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didDeleteVoiceShortcut"), 0);

  v68 = objc_alloc(MEMORY[0x1E0CEA550]);
  v69 = (void *)objc_msgSend(v68, "initWithDelegate:", self);
  -[INUIAddVoiceShortcutButton addInteraction:](self, "addInteraction:", v69);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.IntentsUI.INUIAddVoiceShortcutViewController.didAddVoiceShortcut"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didUpdateVoiceShortcut"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didDeleteVoiceShortcut"), 0);

  v6.receiver = self;
  v6.super_class = (Class)INUIAddVoiceShortcutButton;
  -[INUIAddVoiceShortcutButton dealloc](&v6, sel_dealloc);
}

- (double)metricsScale
{
  return 1.0;
}

- (double)INUIAddVoiceShortcutDefaultHeight
{
  double v2;

  -[INUIAddVoiceShortcutButton metricsScale](self, "metricsScale");
  return v2 * 50.0;
}

- (double)INUIAddVoiceShortcutIconWidthHeight
{
  double v2;

  -[INUIAddVoiceShortcutButton metricsScale](self, "metricsScale");
  return v2 * 29.0;
}

- (double)INUIAddVoiceShortcutDefaultHorizontalMargin
{
  double v2;

  -[INUIAddVoiceShortcutButton metricsScale](self, "metricsScale");
  return v2 * 16.0;
}

- (double)INUIAddVoiceShortcutDefaultHorizontalPadding
{
  double v2;

  -[INUIAddVoiceShortcutButton metricsScale](self, "metricsScale");
  return v2 * 10.0;
}

- (double)INUIAddVoiceShortcutDefaultCornerRadius
{
  return 13.0;
}

- (void)setStyle:(INUIAddVoiceShortcutButtonStyle)style
{
  if (self->_style != style)
  {
    self->_style = style;
    -[INUIAddVoiceShortcutButton _updateColors](self, "_updateColors");
  }
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  self->_cornerRadius = cornerRadius;
  -[UIView _inui_setNeedsLayout](self, "_inui_setNeedsLayout");
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[INUIAddVoiceShortcutButton removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", self, sel__didTapButton, 64);
    v5 = obj;
    if (obj)
    {
      -[INUIAddVoiceShortcutButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__didTapButton, 64);
      v5 = obj;
    }
  }

}

- (void)setShortcut:(INShortcut *)shortcut
{
  INShortcut *v5;
  INShortcut *v6;

  v5 = shortcut;
  if (self->_shortcut != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_shortcut, shortcut);
    -[INUIAddVoiceShortcutButton _checkAndUpdateForShortcut](self, "_checkAndUpdateForShortcut");
    v5 = v6;
  }

}

- (void)setVoiceShortcut:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_voiceShortcut) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_voiceShortcut, a3);
    -[INUIAddVoiceShortcutButton _updateContent](self, "_updateContent");
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INUIAddVoiceShortcutButton;
  -[INUIAddVoiceShortcutButton setHighlighted:](&v15, sel_setHighlighted_);
  -[INUIAddVoiceShortcutButton _createHighlightFilterIfNecessary](self, "_createHighlightFilterIfNecessary");
  -[INUIAddVoiceShortcutButton layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.6;
  if (!v3)
    v6 = 1.0;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithCGColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v7);
  objc_msgSend(v5, "setValue:forKeyPath:", objc_msgSend(v11, "CGColor"), CFSTR("filters.highlightFilter.inputColor"));
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDuration:", 0.15);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  v13 = objc_retainAutorelease(v10);
  objc_msgSend(v12, "setFromValue:", objc_msgSend(v13, "CGColor"));
  v14 = objc_retainAutorelease(v11);
  objc_msgSend(v12, "setToValue:", objc_msgSend(v14, "CGColor"));
  objc_msgSend(v5, "addAnimation:forKey:", v12, CFSTR("filters.highlightFilter.inputColor"));

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INUIAddVoiceShortcutButton;
  -[INUIAddVoiceShortcutButton layoutSubviews](&v4, sel_layoutSubviews);
  -[INUIAddVoiceShortcutButton layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _cornerRadius](self, "_cornerRadius");
  objc_msgSend(v3, "setCornerRadius:");

  -[INUIAddVoiceShortcutButton _updatePhraseVisibility](self, "_updatePhraseVisibility");
}

- (double)_cornerRadius
{
  double Height;
  double result;
  CGRect v5;

  -[INUIAddVoiceShortcutButton frame](self, "frame");
  Height = CGRectGetHeight(v5);
  -[INUIAddVoiceShortcutButton cornerRadius](self, "cornerRadius");
  if (result >= Height * 0.5)
    return Height * 0.5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
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
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA700], "_inui_labelWithText:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton voiceShortcut](self, "voiceShortcut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[INUIAddVoiceShortcutButton _addedToSiriText](self, "_addedToSiriText");
  else
    -[INUIAddVoiceShortcutButton _addToSiriText](self, "_addToSiriText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_inui_setText:", v5);

  -[INUIAddVoiceShortcutButton _addToSiriFont](self, "_addToSiriFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v6);

  -[INUIAddVoiceShortcutButton INUIAddVoiceShortcutDefaultHorizontalMargin](self, "INUIAddVoiceShortcutDefaultHorizontalMargin");
  v8 = v7;
  -[INUIAddVoiceShortcutButton INUIAddVoiceShortcutDefaultHorizontalPadding](self, "INUIAddVoiceShortcutDefaultHorizontalPadding");
  v10 = v9 + v8 * 2.0;
  -[INUIAddVoiceShortcutButton INUIAddVoiceShortcutIconWidthHeight](self, "INUIAddVoiceShortcutIconWidthHeight");
  v12 = v10 + v11;
  objc_msgSend(v3, "intrinsicContentSize");
  v14 = v12 + v13;
  -[INUIAddVoiceShortcutButton INUIAddVoiceShortcutDefaultHeight](self, "INUIAddVoiceShortcutDefaultHeight");
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)_updateColors
{
  INUIAddVoiceShortcutButtonStyle v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = -[INUIAddVoiceShortcutButton style](self, "style");
  -[INUIAddVoiceShortcutButton layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _backgroundColorForStyle:](self, "_backgroundColorForStyle:", v3);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  -[INUIAddVoiceShortcutButton layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _strokeColorForStyle:](self, "_strokeColorForStyle:", v3);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

  -[INUIAddVoiceShortcutButton layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _strokeWidthForStyle:](self, "_strokeWidthForStyle:", v3);
  objc_msgSend(v8, "setBorderWidth:");

  -[INUIAddVoiceShortcutButton checkmarkImageView](self, "checkmarkImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _textColorForStyle:](self, "_textColorForStyle:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_inui_setTintColor:", v10);

  -[INUIAddVoiceShortcutButton addToSiriLabel](self, "addToSiriLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _textColorForStyle:](self, "_textColorForStyle:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

}

- (id)_sphiriImageForStyle:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      -[INUIAddVoiceShortcutButton _lightSphiriImage](self, "_lightSphiriImage", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
    case 3uLL:
      -[INUIAddVoiceShortcutButton _darkSphiriImage](self, "_darkSphiriImage", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      -[INUIAddVoiceShortcutButton _dynamicDarkSphiriImage](self, "_dynamicDarkSphiriImage", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      -[INUIAddVoiceShortcutButton _dynamicLightSphiriImage](self, "_dynamicLightSphiriImage", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (id)_backgroundColorForStyle:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      -[INUIAddVoiceShortcutButton _dynamicBlackColor](self, "_dynamicBlackColor", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      -[INUIAddVoiceShortcutButton _dynamicWhiteColor](self, "_dynamicWhiteColor", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (id)_textColorForStyle:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      -[INUIAddVoiceShortcutButton _dynamicWhiteColor](self, "_dynamicWhiteColor", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      -[INUIAddVoiceShortcutButton _dynamicBlackColor](self, "_dynamicBlackColor", v3, v4);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (id)_strokeColorForStyle:(unint64_t)a3
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (a3 == 1)
  {
    v3 = (void *)MEMORY[0x1E0CEA478];
    v4 = 0.0;
    goto LABEL_6;
  }
  if (a3 != 5)
  {
    if (a3 != 3)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v3 = (void *)MEMORY[0x1E0CEA478];
    v4 = 1.0;
LABEL_6:
    objc_msgSend(v3, "colorWithWhite:alpha:", v4, 0.3);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = (void *)v5;
    return v7;
  }
  -[INUIAddVoiceShortcutButton _dynamicBlackColor](self, "_dynamicBlackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)_strokeWidthForStyle:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 - 1 <= 4)
    return dbl_1DC0666D8[a3 - 1];
  return result;
}

- (void)_createHighlightFilterIfNecessary
{
  void *v3;
  id v4;
  CAFilter *v5;
  CAFilter *highlightFilter;
  CAFilter *v7;
  id v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!self->_highlightFilter)
  {
    -[INUIAddVoiceShortcutButton layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0CD2780]);
    v5 = (CAFilter *)objc_msgSend(v4, "initWithType:", *MEMORY[0x1E0CD2E60]);
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v5;

    -[CAFilter setName:](self->_highlightFilter, "setName:", CFSTR("highlightFilter"));
    v7 = self->_highlightFilter;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAFilter setValue:forKey:](v7, "setValue:forKey:", objc_msgSend(v8, "CGColor"), CFSTR("inputColor"));

    v10[0] = self->_highlightFilter;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFilters:", v9);

  }
}

- (id)_addToSiriText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Add to Siri"), &stru_1EA43AE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_addedToSiriText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Added to Siri"), &stru_1EA43AE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_phraseText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[INUIAddVoiceShortcutButton voiceShortcut](self, "voiceShortcut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invocationPhrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("“%@”"), &stru_1EA43AE30, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_addToSiriFont
{
  void *v2;
  _BOOL4 v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CEA5F0];
  v3 = -[INUIAddVoiceShortcutButton _shouldUseLargerFont](self, "_shouldUseLargerFont");
  v4 = (_QWORD *)MEMORY[0x1E0CEB590];
  if (!v3)
    v4 = (_QWORD *)MEMORY[0x1E0CEB558];
  objc_msgSend(v2, "_inui_preferredFontDescriptorWithTextStyle:", *v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_phraseFont
{
  void *v2;
  _BOOL4 v3;
  _QWORD *v4;

  v2 = (void *)MEMORY[0x1E0CEA5E8];
  v3 = -[INUIAddVoiceShortcutButton _shouldUseLargerFont](self, "_shouldUseLargerFont");
  v4 = (_QWORD *)MEMORY[0x1E0CEB558];
  if (!v3)
    v4 = (_QWORD *)MEMORY[0x1E0CEB550];
  return (id)objc_msgSend(v2, "_inui_preferredFontForTextStyle:", *v4);
}

- (BOOL)_shouldUseLargerFont
{
  CGRect v3;

  -[INUIAddVoiceShortcutButton bounds](self, "bounds");
  return CGRectGetHeight(v3) >= 44.0;
}

- (id)_lightSphiriImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inui_imageNamed:inBundle:", CFSTR("SphiriLight"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_darkSphiriImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inui_imageNamed:inBundle:", CFSTR("SphiriDark"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_dynamicLightSphiriImage
{
  void *v3;
  void *v4;
  void *v5;

  -[INUIAddVoiceShortcutButton _lightSphiriImage](self, "_lightSphiriImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _darkSphiriImage](self, "_darkSphiriImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_inui_imageWithLightModeImage:darkModeImage:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_dynamicDarkSphiriImage
{
  void *v3;
  void *v4;
  void *v5;

  -[INUIAddVoiceShortcutButton _darkSphiriImage](self, "_darkSphiriImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton _lightSphiriImage](self, "_lightSphiriImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_inui_imageWithLightModeImage:darkModeImage:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_checkmarkImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inui_imageNamed:inBundle:", CFSTR("Checkmark"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_dynamicWhiteColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inui_colorNamed:bundle:", CFSTR("ColorLight"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_dynamicBlackColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inui_colorNamed:bundle:", CFSTR("ColorDark"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;

  -[INUIAddVoiceShortcutButton voiceShortcut](self, "voiceShortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[INUIAddVoiceShortcutButton addToSiriLabel](self, "addToSiriLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[INUIAddVoiceShortcutButton _addedToSiriText](self, "_addedToSiriText");
  else
    -[INUIAddVoiceShortcutButton _addToSiriText](self, "_addToSiriText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_inui_setText:", v5);

  -[INUIAddVoiceShortcutButton phraseLabel](self, "phraseLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    -[INUIAddVoiceShortcutButton _phraseText](self, "_phraseText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_inui_setText:", v8);

  }
  else
  {
    objc_msgSend(v6, "_inui_setText:", 0);
  }
  v9 = v3 == 0;
  v10 = v3 == 0;
  v11 = !v9;

  -[INUIAddVoiceShortcutButton sphiriImageView](self, "sphiriImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v11);

  -[INUIAddVoiceShortcutButton checkmarkImageView](self, "checkmarkImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v10);

  -[INUIAddVoiceShortcutButton _updatePhraseVisibility](self, "_updatePhraseVisibility");
  -[INUIAddVoiceShortcutButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_updatePhraseVisibility
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;
  CGRect v8;

  -[INUIAddVoiceShortcutButton voiceShortcut](self, "voiceShortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[INUIAddVoiceShortcutButton bounds](self, "bounds");
    v4 = CGRectGetHeight(v8) >= 36.0;
  }
  else
  {
    v4 = 0;
  }

  -[INUIAddVoiceShortcutButton phraseLabel](self, "phraseLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4 ^ 1);

  -[INUIAddVoiceShortcutButton addToSiriLeadingConstraint](self, "addToSiriLeadingConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", v4 ^ 1);

  -[INUIAddVoiceShortcutButton addedToSiriLeadingConstraint](self, "addedToSiriLeadingConstraint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", v4);

}

- (void)_didTapButton
{
  void *v3;
  INUIEditVoiceShortcutViewController *v4;
  void *v5;
  INUIEditVoiceShortcutViewController *v6;
  void *v7;
  INUIAddVoiceShortcutViewController *v8;
  void *v9;
  id v10;

  -[INUIAddVoiceShortcutButton delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[INUIAddVoiceShortcutButton voiceShortcut](self, "voiceShortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [INUIEditVoiceShortcutViewController alloc];
    -[INUIAddVoiceShortcutButton voiceShortcut](self, "voiceShortcut");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[INUIEditVoiceShortcutViewController initWithVoiceShortcut:](v4, "initWithVoiceShortcut:", v5);

    objc_msgSend(v10, "presentEditVoiceShortcutViewController:forAddVoiceShortcutButton:", v6, self);
LABEL_5:

    goto LABEL_6;
  }
  -[INUIAddVoiceShortcutButton shortcut](self, "shortcut");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [INUIAddVoiceShortcutViewController alloc];
    -[INUIAddVoiceShortcutButton shortcut](self, "shortcut");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[INUIAddVoiceShortcutViewController initWithShortcut:](v8, "initWithShortcut:", v9);

    objc_msgSend(v10, "presentAddVoiceShortcutViewController:forAddVoiceShortcutButton:", v6, self);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_checkAndUpdateForShortcut
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0CBDCF8], "sharedCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke;
  v4[3] = &unk_1EA43A940;
  v4[4] = self;
  objc_msgSend(v3, "getAllVoiceShortcutsWithCompletion:", v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INUIAddVoiceShortcutButton;
  -[INUIAddVoiceShortcutButton traitCollectionDidChange:](&v15, sel_traitCollectionDidChange_, v4);
  -[INUIAddVoiceShortcutButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[INUIAddVoiceShortcutButton _updateColors](self, "_updateColors");
  -[INUIAddVoiceShortcutButton traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    -[INUIAddVoiceShortcutButton addToSiriLabel](self, "addToSiriLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INUIAddVoiceShortcutButton _addToSiriFont](self, "_addToSiriFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    -[INUIAddVoiceShortcutButton phraseLabel](self, "phraseLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INUIAddVoiceShortcutButton _phraseFont](self, "_phraseFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v14);

  }
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INUIAddVoiceShortcutButton voiceShortcut](self, "voiceShortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[INUIAddVoiceShortcutButton _phraseText](self, "_phraseText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", CFSTR("Added to Siri with phrase: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[INUIAddVoiceShortcutButton _addToSiriText](self, "_addToSiriText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)prepareForInterfaceBuilder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INUIAddVoiceShortcutButton;
  -[INUIAddVoiceShortcutButton prepareForInterfaceBuilder](&v3, sel_prepareForInterfaceBuilder);
  -[INUIAddVoiceShortcutButton _configureWithStyle:](self, "_configureWithStyle:", 0);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[INUIAddVoiceShortcutButton shortcut](self, "shortcut", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return MEMORY[0x1E0C9AA60];
  v6 = objc_alloc(MEMORY[0x1E0CB36C8]);
  -[INUIAddVoiceShortcutButton shortcut](self, "shortcut");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithObject:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v8);
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (INUIAddVoiceShortcutButtonStyle)style
{
  return self->_style;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (INVoiceShortcut)voiceShortcut
{
  return self->_voiceShortcut;
}

- (CAFilter)highlightFilter
{
  return self->_highlightFilter;
}

- (void)setHighlightFilter:(id)a3
{
  objc_storeStrong((id *)&self->_highlightFilter, a3);
}

- (UIImageView)sphiriImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_sphiriImageView);
}

- (void)setSphiriImageView:(id)a3
{
  objc_storeWeak((id *)&self->_sphiriImageView, a3);
}

- (UIImageView)checkmarkImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_checkmarkImageView);
}

- (void)setCheckmarkImageView:(id)a3
{
  objc_storeWeak((id *)&self->_checkmarkImageView, a3);
}

- (UILabel)addToSiriLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_addToSiriLabel);
}

- (void)setAddToSiriLabel:(id)a3
{
  objc_storeWeak((id *)&self->_addToSiriLabel, a3);
}

- (UILabel)phraseLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_phraseLabel);
}

- (void)setPhraseLabel:(id)a3
{
  objc_storeWeak((id *)&self->_phraseLabel, a3);
}

- (NSLayoutConstraint)checkmarkHeightConstraint
{
  return self->_checkmarkHeightConstraint;
}

- (void)setCheckmarkHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkHeightConstraint, a3);
}

- (NSLayoutConstraint)addToSiriLeadingConstraint
{
  return self->_addToSiriLeadingConstraint;
}

- (void)setAddToSiriLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_addToSiriLeadingConstraint, a3);
}

- (NSLayoutConstraint)addedToSiriLeadingConstraint
{
  return self->_addedToSiriLeadingConstraint;
}

- (void)setAddedToSiriLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_addedToSiriLeadingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedToSiriLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_addToSiriLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_checkmarkHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_phraseLabel);
  objc_destroyWeak((id *)&self->_addToSiriLabel);
  objc_destroyWeak((id *)&self->_checkmarkImageView);
  objc_destroyWeak((id *)&self->_sphiriImageView);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_voiceShortcut, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  __int128 *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  BOOL v34;
  id obj;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  _QWORD block[5];
  _QWORD v45[6];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v7 = &v46;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  if (v9)
  {
    v10 = (void *)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      objc_msgSend(v9, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v52 = "-[INUIAddVoiceShortcutButton _checkAndUpdateForShortcut]_block_invoke";
      v53 = 2112;
      v54 = v12;
      _os_log_error_impl(&dword_1DC055000, v11, OS_LOG_TYPE_ERROR, "%s Failed to get shortcuts in INUIAddVoiceShortcutButton: %@", buf, 0x16u);

    }
    goto LABEL_28;
  }
  objc_msgSend(*(id *)(a1 + 32), "shortcut");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userActivity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = a1;
  objc_msgSend(*(id *)(a1 + 32), "shortcut");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  v33 = v8;
  obj = v8;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v47;
    v34 = v14 != 0;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v17);
        if (!v14)
          goto LABEL_13;
        objc_msgSend(v14, "activityType");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "shortcut");
        v7 = (__int128 *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "userActivity");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "activityType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqualToString:", v15))
        {
          objc_msgSend(v14, "userInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "shortcut");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "userActivity");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "userInfo");
          v39 = v19;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v20) = 1;
          if ((objc_msgSend(v19, "isEqualToDictionary:") & 1) != 0)
          {
            v21 = 1;
            goto LABEL_15;
          }
          if (!v16)
          {
            v21 = 0;
LABEL_15:

            if ((v20 & 1) == 0)
              goto LABEL_16;
            goto LABEL_19;
          }
        }
        else
        {
LABEL_13:
          LODWORD(v20) = 0;
          v21 = 0;
          if (!v16)
            goto LABEL_18;
        }
        v42 = v20;
        v22 = objc_msgSend(v16, "_indexingHash");
        objc_msgSend(v18, "shortcut");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v20, "intent");
        v43 = v17;
        v23 = v18;
        v24 = v15;
        v25 = v14;
        v26 = v3;
        v27 = v7;
        v28 = v4;
        v29 = v16;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v22 == objc_msgSend(v30, "_indexingHash");

        v16 = v29;
        v4 = v28;
        v7 = v27;
        v3 = v26;
        v14 = v25;
        v15 = v24;
        v18 = v23;
        v17 = v43;

        LOBYTE(v20) = v34;
        if (v42)
          goto LABEL_15;
LABEL_18:
        if (!v14)
        {
LABEL_16:
          if (v21)
            goto LABEL_26;
          goto LABEL_20;
        }
LABEL_19:

        if (v21)
        {
LABEL_26:
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke_51;
          v45[3] = &unk_1EA43A968;
          v45[4] = *(_QWORD *)(v32 + 32);
          v45[5] = v18;
          dispatch_async(MEMORY[0x1E0C80D38], v45);

          goto LABEL_27;
        }
LABEL_20:
        ++v17;
      }
      while (v41 != v17);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      v41 = v31;
    }
    while (v31);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke_2;
  block[3] = &unk_1EA43A918;
  block[4] = *(_QWORD *)(v32 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_27:

  v9 = 0;
  v8 = v33;
LABEL_28:

}

uint64_t __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke_51(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVoiceShortcut:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVoiceShortcut:", 0);
}

@end
