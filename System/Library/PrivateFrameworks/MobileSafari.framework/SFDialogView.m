@implementation SFDialogView

- (SFDialogView)initWithFrame:(CGRect)a3
{
  SFDialogView *v3;
  SFKeyboardLayoutAlignmentView *v4;
  SFKeyboardLayoutAlignmentView *keyboardAlignmentView;
  id v6;
  void *v7;
  SFDialogContentView *v8;
  SFDialogContentView *contentViewConfiguredForMinimumHeight;
  SFDialogContentView *v10;
  SFDialogContentView *contentView;
  void *v12;
  void *v13;
  uint64_t v14;
  NSLayoutConstraint *obscuredInsetTopConstraint;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *obscuredInsetLeftConstraint;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *obscuredInsetBottomConstraint;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *obscuredInsetRightConstraint;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  UISwipeGestureRecognizer *keyboardDismissSwipeGesture;
  uint64_t v51;
  UITapGestureRecognizer *keyboardDismissTapGesture;
  SFDialogView *v53;
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
  id v84;
  objc_super v85;
  _QWORD v86[20];

  v86[18] = *MEMORY[0x1E0C80C00];
  v85.receiver = self;
  v85.super_class = (Class)SFDialogView;
  v3 = -[SFDialogView initWithFrame:](&v85, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SFKeyboardLayoutAlignmentView);
    keyboardAlignmentView = v3->_keyboardAlignmentView;
    v3->_keyboardAlignmentView = v4;

    -[SFDialogView addSubview:](v3, "addSubview:", v3->_keyboardAlignmentView);
    v6 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    objc_msgSend(v6, "setIdentifier:", CFSTR("SFDialogView.availableSpace"));
    -[SFDialogView addLayoutGuide:](v3, "addLayoutGuide:", v6);
    v84 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setBackgroundColor:", v7);

    objc_msgSend(v84, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFDialogView addSubview:](v3, "addSubview:", v84);
    v8 = objc_alloc_init(SFDialogContentView);
    contentViewConfiguredForMinimumHeight = v3->_contentViewConfiguredForMinimumHeight;
    v3->_contentViewConfiguredForMinimumHeight = v8;

    -[SFDialogContentView setHidden:](v3->_contentViewConfiguredForMinimumHeight, "setHidden:", 1);
    -[SFDialogContentView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentViewConfiguredForMinimumHeight, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFDialogView addSubview:](v3, "addSubview:", v3->_contentViewConfiguredForMinimumHeight);
    v10 = objc_alloc_init(SFDialogContentView);
    contentView = v3->_contentView;
    v3->_contentView = v10;

    -[SFDialogContentView setAccessibilityIdentifier:](v3->_contentView, "setAccessibilityIdentifier:", CFSTR("SFDialogView"));
    -[SFDialogContentView setDialogView:](v3->_contentView, "setDialogView:", v3);
    -[SFDialogContentView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFDialogView addSubview:](v3, "addSubview:", v3->_contentView);
    objc_msgSend(v6, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogView topAnchor](v3, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    obscuredInsetTopConstraint = v3->_obscuredInsetTopConstraint;
    v3->_obscuredInsetTopConstraint = (NSLayoutConstraint *)v14;

    objc_msgSend(v6, "leftAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogView leftAnchor](v3, "leftAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    obscuredInsetLeftConstraint = v3->_obscuredInsetLeftConstraint;
    v3->_obscuredInsetLeftConstraint = (NSLayoutConstraint *)v18;

    objc_msgSend(v6, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogView bottomAnchor](v3, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    obscuredInsetBottomConstraint = v3->_obscuredInsetBottomConstraint;
    v3->_obscuredInsetBottomConstraint = (NSLayoutConstraint *)v22;

    LODWORD(v24) = 1144750080;
    -[NSLayoutConstraint setPriority:](v3->_obscuredInsetBottomConstraint, "setPriority:", v24);
    objc_msgSend(v6, "rightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogView rightAnchor](v3, "rightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    obscuredInsetRightConstraint = v3->_obscuredInsetRightConstraint;
    v3->_obscuredInsetRightConstraint = (NSLayoutConstraint *)v27;

    v69 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v84, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogView topAnchor](v3, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v82);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v81;
    objc_msgSend(v84, "leftAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogView leftAnchor](v3, "leftAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v78;
    objc_msgSend(v84, "bottomAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogView bottomAnchor](v3, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v75;
    objc_msgSend(v84, "rightAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogView rightAnchor](v3, "rightAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v86[3] = v72;
    v86[4] = v3->_obscuredInsetTopConstraint;
    v86[5] = v3->_obscuredInsetLeftConstraint;
    v86[6] = v3->_obscuredInsetBottomConstraint;
    objc_msgSend(v6, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFKeyboardLayoutAlignmentView topAnchor](v3->_keyboardAlignmentView, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintLessThanOrEqualToAnchor:", v70);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v86[7] = v68;
    v86[8] = v3->_obscuredInsetRightConstraint;
    -[SFDialogContentView widthAnchor](v3->_contentView, "widthAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintLessThanOrEqualToConstant:", 440.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v86[9] = v65;
    -[SFDialogContentView widthAnchor](v3->_contentView, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintGreaterThanOrEqualToConstant:", 440.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v30) = 1144750080;
    objc_msgSend(v64, "setPriority:", v30);
    v86[10] = v64;
    -[SFDialogContentView widthAnchor](v3->_contentView, "widthAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widthAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintLessThanOrEqualToAnchor:constant:", v62, -40.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v86[11] = v61;
    -[SFDialogContentView heightAnchor](v3->_contentView, "heightAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintLessThanOrEqualToConstant:", 500.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v86[12] = v59;
    -[SFDialogContentView heightAnchor](v3->_contentView, "heightAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogContentView heightAnchor](v3->_contentViewConfiguredForMinimumHeight, "heightAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintGreaterThanOrEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v86[13] = v56;
    -[SFDialogContentView heightAnchor](v3->_contentView, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:", v32, -40.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v34) = 1144750080;
    objc_msgSend(v33, "setPriority:", v34);
    v86[14] = v33;
    -[SFDialogContentView centerXAnchor](v3->_contentView, "centerXAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v86[15] = v36;
    -[SFDialogContentView centerYAnchor](v3->_contentView, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v6;
    objc_msgSend(v6, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v40) = 1144750080;
    objc_msgSend(v39, "setPriority:", v40);
    v86[16] = v39;
    -[SFDialogContentView bottomAnchor](v3->_contentView, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:constant:", v42, -20.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v86[17] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 18);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "activateConstraints:", v44);

    LODWORD(v45) = 1148846080;
    -[SFDialogContentView setContentHuggingPriority:forAxis:](v3->_contentViewConfiguredForMinimumHeight, "setContentHuggingPriority:forAxis:", 1, v45);
    LODWORD(v46) = 1148846080;
    -[SFDialogContentView setContentCompressionResistancePriority:forAxis:](v3->_contentViewConfiguredForMinimumHeight, "setContentCompressionResistancePriority:forAxis:", 1, v46);
    LODWORD(v47) = 1148846080;
    -[SFDialogContentView setContentHuggingPriority:forAxis:](v3->_contentView, "setContentHuggingPriority:forAxis:", 1, v47);
    LODWORD(v48) = 1144750080;
    -[SFDialogContentView setContentCompressionResistancePriority:forAxis:](v3->_contentView, "setContentCompressionResistancePriority:forAxis:", 1, v48);
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", v3, sel__keyboardDismissGesture_);
    keyboardDismissSwipeGesture = v3->_keyboardDismissSwipeGesture;
    v3->_keyboardDismissSwipeGesture = (UISwipeGestureRecognizer *)v49;

    -[UISwipeGestureRecognizer setDirection:](v3->_keyboardDismissSwipeGesture, "setDirection:", 8);
    -[SFDialogView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_keyboardDismissSwipeGesture);
    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel__keyboardDismissGesture_);
    keyboardDismissTapGesture = v3->_keyboardDismissTapGesture;
    v3->_keyboardDismissTapGesture = (UITapGestureRecognizer *)v51;

    objc_msgSend(v84, "addGestureRecognizer:", v3->_keyboardDismissTapGesture);
    -[SFDialogView setUsesOpaqueAppearance:](v3, "setUsesOpaqueAppearance:", 0);
    v53 = v3;

  }
  return v3;
}

- (SFDialogView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFDialogView;
  return -[SFDialogView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (BOOL)becomeFirstResponder
{
  return -[SFDialogContentView becomeFirstResponder](self->_contentView, "becomeFirstResponder");
}

- (void)setTitleText:(id)a3
{
  const __CFString *v5;

  -[SFDialogContentView setTitleText:](self->_contentView, "setTitleText:");
  if (a3)
    v5 = CFSTR("a");
  else
    v5 = 0;
  -[SFDialogContentView setTitleText:](self->_contentViewConfiguredForMinimumHeight, "setTitleText:", v5);
}

- (void)setMessageText:(id)a3
{
  const __CFString *v5;

  -[SFDialogContentView setMessageText:](self->_contentView, "setMessageText:");
  if (a3)
    v5 = CFSTR("a");
  else
    v5 = 0;
  -[SFDialogContentView setMessageText:](self->_contentViewConfiguredForMinimumHeight, "setMessageText:", v5);
}

- (void)setObscuredInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  -[NSLayoutConstraint setConstant:](self->_obscuredInsetTopConstraint, "setConstant:", a3.top);
  -[NSLayoutConstraint setConstant:](self->_obscuredInsetBottomConstraint, "setConstant:", -bottom);
  -[NSLayoutConstraint setConstant:](self->_obscuredInsetLeftConstraint, "setConstant:", left);
  -[NSLayoutConstraint setConstant:](self->_obscuredInsetRightConstraint, "setConstant:", -right);
}

- (void)setUsesOpaqueAppearance:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SFDialogView setBackgroundColor:](self, "setBackgroundColor:", v4);

  }
  else
  {
    -[SFDialogView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
}

- (void)setInputText:(id)a3 placeholder:(id)a4
{
  SFDialogContentView *contentViewConfiguredForMinimumHeight;
  __CFString *v8;
  const __CFString *v9;
  __CFString *v10;

  -[SFDialogContentView setInputText:placeholder:](self->_contentView, "setInputText:placeholder:");
  contentViewConfiguredForMinimumHeight = self->_contentViewConfiguredForMinimumHeight;
  if (a3)
    v8 = CFSTR("a");
  else
    v8 = 0;
  if (a4)
    v9 = CFSTR("a");
  else
    v9 = 0;
  v10 = v8;
  -[SFDialogContentView setInputText:placeholder:](contentViewConfiguredForMinimumHeight, "setInputText:placeholder:", v10, v9);

}

- (void)setPasswordText:(id)a3 placeholder:(id)a4
{
  SFDialogContentView *contentViewConfiguredForMinimumHeight;
  __CFString *v8;
  const __CFString *v9;
  __CFString *v10;

  -[SFDialogContentView setPasswordText:placeholder:](self->_contentView, "setPasswordText:placeholder:");
  contentViewConfiguredForMinimumHeight = self->_contentViewConfiguredForMinimumHeight;
  if (a3)
    v8 = CFSTR("a");
  else
    v8 = 0;
  if (a4)
    v9 = CFSTR("a");
  else
    v9 = 0;
  v10 = v8;
  -[SFDialogContentView setPasswordText:placeholder:](contentViewConfiguredForMinimumHeight, "setPasswordText:placeholder:", v10, v9);

}

- (void)setDialogActions:(id)a3
{
  SFDialogContentView *contentView;
  id v5;

  contentView = self->_contentView;
  v5 = a3;
  -[SFDialogContentView setActions:](contentView, "setActions:", v5);
  -[SFDialogContentView setActions:](self->_contentViewConfiguredForMinimumHeight, "setActions:", v5);

}

- (void)setTableViewRows:(id)a3 didSelectRowAction:(id)a4
{
  SFDialogContentView *contentView;
  id v7;
  id v8;

  contentView = self->_contentView;
  v7 = a4;
  v8 = a3;
  -[SFDialogContentView setTableViewRows:didSelectRowAction:](contentView, "setTableViewRows:didSelectRowAction:", v8, v7);
  -[SFDialogContentView setTableViewRows:didSelectRowAction:](self->_contentViewConfiguredForMinimumHeight, "setTableViewRows:didSelectRowAction:", v8, v7);

}

- (void)didAppear
{
  -[SFDialogContentView didAppear](self->_contentView, "didAppear");
}

- (void)willDisappear
{
  -[SFKeyboardLayoutAlignmentView setAutomaticKeyboardFrameTrackingDisabled:](self->_keyboardAlignmentView, "setAutomaticKeyboardFrameTrackingDisabled:", 1);
  -[SFDialogView endEditing:](self, "endEditing:", 0);
}

- (void)_keyboardDismissGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[SFDialogContentView endEditing](self->_contentView, "endEditing");
}

- (SFDialogViewDelegate)delegate
{
  return (SFDialogViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentView
{
  return &self->_contentView->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_obscuredInsetRightConstraint, 0);
  objc_storeStrong((id *)&self->_obscuredInsetBottomConstraint, 0);
  objc_storeStrong((id *)&self->_obscuredInsetLeftConstraint, 0);
  objc_storeStrong((id *)&self->_obscuredInsetTopConstraint, 0);
  objc_storeStrong((id *)&self->_keyboardDismissTapGesture, 0);
  objc_storeStrong((id *)&self->_keyboardDismissSwipeGesture, 0);
  objc_storeStrong((id *)&self->_keyboardAlignmentView, 0);
  objc_storeStrong((id *)&self->_contentViewConfiguredForMinimumHeight, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
