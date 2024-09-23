@implementation SFDialogContentView

- (SFDialogContentView)initWithFrame:(CGRect)a3
{
  SFDialogContentView *v3;
  SFDialogContentView *v4;
  NSArray *actionButtons;
  void *v6;
  id v7;
  id v8;
  double v9;
  SFDialogTextView *v10;
  SFDialogTextView *messageTextView;
  uint64_t v12;
  SFDialogTextField *inputTextField;
  uint64_t v14;
  SFDialogTextField *passwordTextField;
  id v16;
  uint64_t v17;
  UITableView *tableView;
  uint64_t v19;
  UIButton *closeButton;
  void *v21;
  double v22;
  double v23;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSArray *layoutConstraintsWhenInputAndPasswordAreVisible;
  void *v46;
  uint64_t v47;
  NSLayoutConstraint *tableViewHeightConstraint;
  SFDialogContentView *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;
  void *v57;
  _QWORD v58[3];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)SFDialogContentView;
  v3 = -[SFDialogContentView initWithFrame:](&v56, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    actionButtons = v3->_actionButtons;
    v3->_actionButtons = (NSArray *)MEMORY[0x1E0C9AA60];

    v4->_actionIndexTriggeredByEscapeKey = 0x7FFFFFFFFFFFFFFFLL;
    v4->_actionIndexTriggeredByReturnKey = 0x7FFFFFFFFFFFFFFFLL;
    v4->_actionIndexTriggeredByOptionReturnKey = 0x7FFFFFFFFFFFFFFFLL;
    -[SFDialogContentView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 12.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogContentView setBackgroundColor:](v4, "setBackgroundColor:", v6);

    -[SFDialogContentView layer](v4, "layer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    borderColorForTraitCollection(0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v55, "setBorderColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v55, "setBorderWidth:", _SFOnePixel());
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v55, "setShadowColor:", objc_msgSend(v8, "CGColor"));

    LODWORD(v9) = 1.0;
    objc_msgSend(v55, "setShadowOpacity:", v9);
    objc_msgSend(v55, "setShadowOffset:", 0.0, 4.0);
    objc_msgSend(v55, "setShadowRadius:", 14.0);
    v10 = objc_alloc_init(SFDialogTextView);
    messageTextView = v4->_messageTextView;
    v4->_messageTextView = v10;

    -[SFDialogTextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_messageTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFDialogContentView addSubview:](v4, "addSubview:", v4->_messageTextView);
    newTextField();
    v12 = objc_claimAutoreleasedReturnValue();
    inputTextField = v4->_inputTextField;
    v4->_inputTextField = (SFDialogTextField *)v12;

    -[SFDialogTextField setDelegate:](v4->_inputTextField, "setDelegate:", v4);
    -[SFDialogContentView addSubview:](v4, "addSubview:", v4->_inputTextField);
    newTextField();
    v14 = objc_claimAutoreleasedReturnValue();
    passwordTextField = v4->_passwordTextField;
    v4->_passwordTextField = (SFDialogTextField *)v14;

    -[SFDialogTextField setDelegate:](v4->_passwordTextField, "setDelegate:", v4);
    -[SFDialogTextField setReturnKeyType:](v4->_passwordTextField, "setReturnKeyType:", 1);
    -[SFDialogTextField setSecureTextEntry:](v4->_passwordTextField, "setSecureTextEntry:", 1);
    -[SFDialogTextField setStackPosition:](v4->_passwordTextField, "setStackPosition:", 2);
    -[SFDialogContentView addSubview:](v4, "addSubview:", v4->_passwordTextField);
    v16 = objc_alloc(MEMORY[0x1E0DC3D48]);
    -[SFDialogContentView bounds](v4, "bounds");
    v17 = objc_msgSend(v16, "initWithFrame:style:", 0);
    tableView = v4->_tableView;
    v4->_tableView = (UITableView *)v17;

    -[UITableView setDataSource:](v4->_tableView, "setDataSource:", v4);
    -[UITableView setDelegate:](v4->_tableView, "setDelegate:", v4);
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v4->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView _setContinuousCornerRadius:](v4->_tableView, "_setContinuousCornerRadius:", 12.0);
    v4->_selectedRow = 0;
    -[SFDialogContentView addSubview:](v4, "addSubview:", v4->_tableView);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v19 = objc_claimAutoreleasedReturnValue();
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v19;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4->_closeButton, "setTintColor:", v21);

    LODWORD(v22) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_closeButton, "setContentCompressionResistancePriority:forAxis:", 0, v22);
    LODWORD(v23) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_closeButton, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton _setTouchInsets:](v4->_closeButton, "_setTouchInsets:", -20.0, -10.0, 0.0, -10.0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4AD0], 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v4->_closeButton, "setImage:forState:", v53, 0);
    -[UIButton addTarget:action:forEvents:](v4->_closeButton, "addTarget:action:forEvents:", v4, sel__actionTriggered_, 0x2000);
    -[SFDialogContentView addSubview:](v4, "addSubview:", v4->_closeButton);
    v24 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton topAnchor](v4->_closeButton, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogContentView topAnchor](v4, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 17.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v27;
    -[UIButton trailingAnchor](v4->_closeButton, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogContentView trailingAnchor](v4, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -20.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v31);

    v51 = (void *)MEMORY[0x1E0CB3718];
    -[SFDialogTextView topAnchor](v4->_messageTextView, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogContentView topAnchor](v4, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v33;
    -[SFDialogTextView leadingAnchor](v4->_messageTextView, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogContentView leadingAnchor](v4, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v36;
    -[SFDialogTextView trailingAnchor](v4->_messageTextView, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogContentView trailingAnchor](v4, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "activateConstraints:", v40);

    -[SFDialogTextField bottomAnchor](v4->_inputTextField, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogTextField topAnchor](v4->_passwordTextField, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, _SFOnePixel());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
    v44 = objc_claimAutoreleasedReturnValue();
    layoutConstraintsWhenInputAndPasswordAreVisible = v4->_layoutConstraintsWhenInputAndPasswordAreVisible;
    v4->_layoutConstraintsWhenInputAndPasswordAreVisible = (NSArray *)v44;

    -[UITableView heightAnchor](v4->_tableView, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFPopoverSizingTableViewController caculateHeightForTableView:targetGlobalRow:outGlobalRow:](SFPopoverSizingTableViewController, "caculateHeightForTableView:targetGlobalRow:outGlobalRow:", v4->_tableView, 3, 0);
    objc_msgSend(v46, "constraintEqualToConstant:");
    v47 = objc_claimAutoreleasedReturnValue();
    tableViewHeightConstraint = v4->_tableViewHeightConstraint;
    v4->_tableViewHeightConstraint = (NSLayoutConstraint *)v47;

    -[SFDialogContentView _populateOptionalConstraints](v4, "_populateOptionalConstraints");
    -[SFDialogContentView setInputText:placeholder:](v4, "setInputText:placeholder:", 0, 0);
    -[SFDialogContentView setPasswordText:placeholder:](v4, "setPasswordText:placeholder:", 0, 0);
    -[SFDialogContentView setTableViewRows:didSelectRowAction:](v4, "setTableViewRows:didSelectRowAction:", 0, 0);
    v49 = v4;

  }
  return v4;
}

- (SFDialogContentView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFDialogContentView;
  return -[SFDialogContentView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  if (!self->_hasAttemptedHardwareKeyboardFocus && _SFDeviceIsPad())
  {
    objc_msgSend(MEMORY[0x1E0DC3958], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isInHardwareKeyboardMode") & 1) != 0)
    {
      v4 = -[SFDialogTextField isHidden](self->_inputTextField, "isHidden");

      self->_hasAttemptedHardwareKeyboardFocus = 1;
      if ((v4 & 1) == 0
        && (-[SFDialogTextField becomeFirstResponder](self->_inputTextField, "becomeFirstResponder") & 1) != 0)
      {
        return 1;
      }
      goto LABEL_9;
    }

  }
  self->_hasAttemptedHardwareKeyboardFocus = 1;
LABEL_9:
  if (!-[SFDialogTextField isHidden](self->_inputTextField, "isHidden")
    || (-[SFDialogTextField isHidden](self->_passwordTextField, "isHidden") & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)SFDialogContentView;
    return -[SFDialogContentView becomeFirstResponder](&v6, sel_becomeFirstResponder);
  }
  -[SFDialogTextField becomeFirstResponder](self->_passwordTextField, "becomeFirstResponder");
  return 1;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel__returnAction_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x80000, sel__optionReturnAction_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel__escapeAction_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0, sel__focusInputTextField_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWantsPriorityOverSystemBehavior:", 1);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  uint64_t v8;
  BOOL v9;
  objc_super v11;

  v6 = a4;
  if (sel__returnAction_ == a3)
  {
    if (-[SFDialogContentView isFirstResponder](self, "isFirstResponder"))
    {
      v8 = 456;
      goto LABEL_11;
    }
LABEL_13:
    v9 = 0;
    goto LABEL_16;
  }
  if (sel__optionReturnAction_ == a3)
  {
    if (-[SFDialogContentView isFirstResponder](self, "isFirstResponder"))
    {
      v8 = 440;
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (sel__escapeAction_ != a3)
  {
    if (sel__focusInputTextField_ != a3)
    {
      v11.receiver = self;
      v11.super_class = (Class)SFDialogContentView;
      v7 = -[SFDialogContentView canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, v6);
LABEL_15:
      v9 = v7;
      goto LABEL_16;
    }
    if ((-[SFDialogTextField isHidden](self->_inputTextField, "isHidden") & 1) == 0)
    {
      v7 = -[SFDialogContentView isFirstResponder](self, "isFirstResponder");
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  v8 = 448;
LABEL_11:
  v9 = *(Class *)((char *)&self->super.super.super.isa + v8) != (Class)0x7FFFFFFFFFFFFFFFLL;
LABEL_16:

  return v9;
}

- (void)updateConstraints
{
  void *v3;
  NSArray *layoutConstraintsWhenInputAndPasswordAreVisible;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFDialogContentView;
  -[SFDialogContentView updateConstraints](&v6, sel_updateConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "sf_setConstraints:active:", self->_layoutConstraintsWhenInputIsVisible, -[SFDialogTextField isHidden](self->_inputTextField, "isHidden") ^ 1);
  objc_msgSend(MEMORY[0x1E0CB3718], "sf_setConstraints:active:", self->_layoutConstraintsWhenPasswordIsVisible, -[SFDialogTextField isHidden](self->_passwordTextField, "isHidden") ^ 1);
  v3 = (void *)MEMORY[0x1E0CB3718];
  layoutConstraintsWhenInputAndPasswordAreVisible = self->_layoutConstraintsWhenInputAndPasswordAreVisible;
  if ((-[SFDialogTextField isHidden](self->_inputTextField, "isHidden") & 1) != 0)
    v5 = 0;
  else
    v5 = -[SFDialogTextField isHidden](self->_passwordTextField, "isHidden") ^ 1;
  objc_msgSend(v3, "sf_setConstraints:active:", layoutConstraintsWhenInputAndPasswordAreVisible, v5);
  objc_msgSend(MEMORY[0x1E0CB3718], "sf_setConstraints:active:", self->_layoutConstraintsWhenTableViewIsVisible, -[UITableView isHidden](self->_tableView, "isHidden") ^ 1);
}

- (id)_stackedActionButtons
{
  NSArray *actionButtons;
  _QWORD v4[5];

  actionButtons = self->_actionButtons;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SFDialogContentView__stackedActionButtons__block_invoke;
  v4[3] = &unk_1E21E54C0;
  v4[4] = self;
  -[NSArray safari_mapObjectsUsingBlock:](actionButtons, "safari_mapObjectsUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__SFDialogContentView__stackedActionButtons__block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(*(_QWORD *)(a1 + 32) + 432) == a2)
    return 0;
  else
    return a2;
}

- (double)_desiredButtonsWidth
{
  void *v2;
  double v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SFDialogContentView _stackedActionButtons](self, "_stackedActionButtons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v3 = (double)(unint64_t)(objc_msgSend(v2, "count") + 1) * 20.0;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = *MEMORY[0x1E0DC4FF8];
    v9 = *(double *)(MEMORY[0x1E0DC4FF8] + 8);
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "systemLayoutSizeFittingSize:", v8, v9, (_QWORD)v13);
        v3 = v3 + v11;
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_populateOptionalConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *layoutConstraintsWhenInputIsVisible;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *layoutConstraintsWhenPasswordIsVisible;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSLayoutConstraint *tableViewHeightConstraint;
  NSArray *v39;
  NSArray *layoutConstraintsWhenTableViewIsVisible;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[4];
  _QWORD v51[6];

  v51[4] = *MEMORY[0x1E0C80C00];
  -[SFDialogContentView _stackedActionButtons](self, "_stackedActionButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[SFDialogContentView bottomAnchor](self, "bottomAnchor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v48 = v7;

  -[SFDialogTextField leadingAnchor](self->_inputTextField, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogContentView leadingAnchor](self, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v42, 20.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v8;
  -[SFDialogTextField trailingAnchor](self->_inputTextField, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogContentView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -20.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v11;
  -[SFDialogTextField topAnchor](self->_inputTextField, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogTextView bottomAnchor](self->_messageTextView, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v14;
  -[SFDialogTextField bottomAnchor](self->_inputTextField, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:constant:", v48, -16.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  layoutConstraintsWhenInputIsVisible = self->_layoutConstraintsWhenInputIsVisible;
  self->_layoutConstraintsWhenInputIsVisible = v17;

  -[SFDialogTextField leadingAnchor](self->_passwordTextField, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogContentView leadingAnchor](self, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v43, 20.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v19;
  -[SFDialogTextField trailingAnchor](self->_passwordTextField, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogContentView trailingAnchor](self, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -20.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v22;
  -[SFDialogTextField topAnchor](self->_passwordTextField, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogTextView bottomAnchor](self->_messageTextView, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v25;
  -[SFDialogTextField bottomAnchor](self->_passwordTextField, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:constant:", v48, -16.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
  layoutConstraintsWhenPasswordIsVisible = self->_layoutConstraintsWhenPasswordIsVisible;
  self->_layoutConstraintsWhenPasswordIsVisible = v28;

  -[UITableView leadingAnchor](self->_tableView, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogContentView leadingAnchor](self, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v44, 20.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v41;
  -[UITableView trailingAnchor](self->_tableView, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogContentView trailingAnchor](self, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -20.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v32;
  -[UITableView topAnchor](self->_tableView, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogTextView bottomAnchor](self->_messageTextView, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v35;
  -[UITableView bottomAnchor](self->_tableView, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v48, -16.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  tableViewHeightConstraint = self->_tableViewHeightConstraint;
  v49[3] = v37;
  v49[4] = tableViewHeightConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 5);
  v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
  layoutConstraintsWhenTableViewIsVisible = self->_layoutConstraintsWhenTableViewIsVisible;
  self->_layoutConstraintsWhenTableViewIsVisible = v39;

}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MaxX;
  CGFloat MinX;
  double v30;
  SFDialogTextView *messageTextView;
  CGFloat rect;
  objc_super v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v34.receiver = self;
  v34.super_class = (Class)SFDialogContentView;
  -[SFDialogContentView layoutSubviews](&v34, sel_layoutSubviews);
  -[SFDialogContentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  borderColorForTraitCollection(v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[SFDialogContentView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", v5);

  -[UIButton frame](self->_closeButton, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  rect = v13;
  -[SFDialogTextView frame](self->_messageTextView, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = 20.0;
  if ((-[UIButton isHidden](self->_closeButton, "isHidden") & 1) != 0)
  {
    v23 = 20.0;
  }
  else
  {
    v24 = v15 + 20.0;
    v25 = v17 + 16.0;
    v26 = v19 + -40.0;
    v27 = v21 + -32.0;
    if (-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
    {
      v35.origin.x = v15 + 20.0;
      v35.origin.y = v25;
      v35.size.width = v26;
      v35.size.height = v27;
      MaxX = CGRectGetMaxX(v35);
      v36.origin.x = v8;
      v36.origin.y = v10;
      v36.size.width = v12;
      v36.size.height = rect;
      MinX = CGRectGetMinX(v36);
      v23 = 20.0;
      v22 = MaxX - MinX + 13.0 + 20.0;
    }
    else
    {
      v37.origin.x = v8;
      v37.origin.y = v10;
      v37.size.width = v12;
      v37.size.height = rect;
      v30 = CGRectGetMaxX(v37);
      v38.origin.x = v24;
      v38.origin.y = v25;
      v38.size.width = v26;
      v38.size.height = v27;
      v22 = 20.0;
      v23 = v30 - CGRectGetMinX(v38) + 13.0 + 20.0;
    }
  }
  -[SFDialogTextView setContentInsets:](self->_messageTextView, "setContentInsets:", 16.0, v23, 16.0, v22);
  messageTextView = self->_messageTextView;
  -[SFDialogTextView frame](messageTextView, "frame");
  -[SFDialogTextView setPreferredMaxLayoutWidth:](messageTextView, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v39));
  -[SFDialogContentView _addStackedActionButtonsIfNeeded](self, "_addStackedActionButtonsIfNeeded");
  v33.receiver = self;
  v33.super_class = (Class)SFDialogContentView;
  -[SFDialogContentView layoutSubviews](&v33, sel_layoutSubviews);
}

- (void)setTitleText:(id)a3
{
  -[SFDialogTextView setTitle:](self->_messageTextView, "setTitle:", a3);
}

- (void)setMessageText:(id)a3
{
  -[SFDialogTextView setMessage:](self->_messageTextView, "setMessage:", a3);
  -[SFDialogTextView setAccessibilityTraits:](self->_messageTextView, "setAccessibilityTraits:", *MEMORY[0x1E0DC46C0]);
  -[SFDialogTextView setAccessibilityIdentifier:](self->_messageTextView, "setAccessibilityIdentifier:", CFSTR("SFDialogViewMessageText"));
}

- (void)setInputText:(id)a3 placeholder:(id)a4
{
  -[SFDialogContentView _setText:placeholder:forTextField:](self, "_setText:placeholder:forTextField:", a3, a4, self->_inputTextField);
}

- (void)setPasswordText:(id)a3 placeholder:(id)a4
{
  _BOOL4 v5;
  _BOOL8 v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[SFDialogContentView _setText:placeholder:forTextField:](self, "_setText:placeholder:forTextField:", a3, a4, self->_passwordTextField);
  v5 = -[SFDialogContentView _usesLoginFormAppearance](self, "_usesLoginFormAppearance");
  v6 = v5;
  -[SFDialogTextField setAutocorrectionType:](self->_inputTextField, "setAutocorrectionType:", v5);
  v7 = !v5;
  if (v5)
    v8 = 0;
  else
    v8 = 2;
  if (v5)
    v9 = 4;
  else
    v9 = 0;
  if (v7)
    v10 = 0;
  else
    v10 = 2;
  -[SFDialogTextField setAutocapitalizationType:](self->_inputTextField, "setAutocapitalizationType:", v8);
  -[SFDialogTextField setReturnKeyType:](self->_inputTextField, "setReturnKeyType:", v9);
  -[SFDialogTextField setStackPosition:](self->_inputTextField, "setStackPosition:", v6);
  -[SFDialogTextField setStackPosition:](self->_passwordTextField, "setStackPosition:", v10);
}

- (void)_setText:(id)a3 placeholder:(id)a4 forTextField:(id)a5
{
  id v8;
  unint64_t v9;

  v8 = a5;
  v9 = (unint64_t)a4;
  objc_msgSend(v8, "setText:", a3);
  objc_msgSend(v8, "setPlaceholder:", v9);

  objc_msgSend(v8, "setHidden:", ((unint64_t)a3 | v9) == 0);
  -[SFDialogContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)endEditing
{
  -[SFDialogTextField endEditing:](self->_inputTextField, "endEditing:", 1);
  -[SFDialogTextField endEditing:](self->_passwordTextField, "endEditing:", 1);
}

- (void)setActions:(id)a3
{
  NSArray *v4;
  NSArray *actions;
  NSArray *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *actionButtons;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)objc_msgSend(a3, "copy");
  actions = self->_actions;
  self->_actions = v4;

  self->_actionIndexTriggeredByEscapeKey = 0x7FFFFFFFFFFFFFFFLL;
  self->_actionIndexTriggeredByReturnKey = 0x7FFFFFFFFFFFFFFFLL;
  v6 = self->_actions;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __34__SFDialogContentView_setActions___block_invoke;
  v21[3] = &unk_1E21E54E8;
  v21[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v21);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SFDialogContentView _stackedActionButtons](self, "_stackedActionButtons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12++), "removeFromSuperview");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v10);
  }

  -[UIButton setHidden:](self->_closeButton, "setHidden:", 1);
  v13 = self->_actions;
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __34__SFDialogContentView_setActions___block_invoke_2;
  v16[3] = &unk_1E21E5510;
  v16[4] = self;
  -[NSArray safari_mapObjectsUsingBlock:](v13, "safari_mapObjectsUsingBlock:", v16);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  actionButtons = self->_actionButtons;
  self->_actionButtons = v14;

  -[SFDialogContentView _updateActionButtons](self, "_updateActionButtons");
  -[SFDialogContentView _addStackedActionButtonsIfNeeded](self, "_addStackedActionButtonsIfNeeded");
  -[SFDialogContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

void __34__SFDialogContentView_setActions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if (objc_msgSend(v5, "activatingKeyboardShortcut") == 2)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) = a3;
  if (objc_msgSend(v5, "activatingKeyboardShortcut") == 1)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448) = a3;
  v6 = objc_msgSend(v5, "activatingKeyboardShortcut");

  if (v6 == 3)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) = a3;
}

id __34__SFDialogContentView_setActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  char **v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("\n!cancel"));

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setHidden:", 0);
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 432);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v7);

    LODWORD(v8) = 1148846080;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v3, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v10, 0);

    if ((objc_msgSend(v3, "hasCustomAction") & 1) != 0)
    {
      v11 = &selRef_triggerCustomAction;
      v12 = v3;
    }
    else
    {
      v12 = *(id *)(a1 + 32);
      v11 = &selRef__actionTriggered_;
    }
    objc_msgSend(v6, "addTarget:action:forEvents:", v12, *v11, 0x2000);
  }

  return v6;
}

- (void)_updateActionButtons
{
  NSArray *actions;
  _QWORD v3[5];

  actions = self->_actions;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__SFDialogContentView__updateActionButtons__block_invoke;
  v3[3] = &unk_1E21E54E8;
  v3[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](actions, "enumerateObjectsUsingBlock:", v3);
}

void __43__SFDialogContentView__updateActionButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = objc_msgSend(a2, "actionType");
  v6 = (_QWORD *)MEMORY[0x1E0DC4AD0];
  if (v5)
    v6 = (_QWORD *)MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v6, 0x8000, 3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v10, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v7);

}

- (void)_addStackedActionButtonsIfNeeded
{
  SFDialogContentView *v2;
  void *v3;
  double v4;
  double v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SFDialogContentView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
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
  void *v40;
  void *v41;
  SFDialogContentView *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _BYTE v62[128];
  uint64_t v63;

  v2 = self;
  v63 = *MEMORY[0x1E0C80C00];
  -[SFDialogContentView _stackedActionButtons](self, "_stackedActionButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogContentView _desiredButtonsWidth](v2, "_desiredButtonsWidth");
  v5 = v4;
  v6 = v4 <= 440.0;
  if (v2->cachedButtonAlignDirectionHorizontal != v6)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v56 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "removeFromSuperview");
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      }
      while (v9);
    }

    v2->cachedButtonAlignDirectionHorizontal = v6;
  }
  v53 = objc_msgSend(v3, "count");
  if (v53)
  {
    v12 = 0;
    v42 = v2;
    v52 = v3;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDialogContentView addSubview:](v2, "addSubview:", v13);
      if (v5 > 440.0)
      {
        if (v12)
        {
          -[NSArray objectAtIndexedSubscript:](v2->_actionButtons, "objectAtIndexedSubscript:", v12 - 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "topAnchor");
          v27 = objc_claimAutoreleasedReturnValue();

          v28 = -16.0;
        }
        else
        {
          -[SFDialogContentView bottomAnchor](v2, "bottomAnchor");
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = -10.0;
        }
        v48 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(v13, "centerXAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDialogContentView centerXAnchor](v2, "centerXAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "constraintEqualToAnchor:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v35;
        objc_msgSend(v13, "widthAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDialogContentView widthAnchor](v2, "widthAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v37, -40.0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v38;
        objc_msgSend(v13, "bottomAnchor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)v27;
        objc_msgSend(v39, "constraintEqualToAnchor:constant:", v27, v28);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v59[2] = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "activateConstraints:", v41);

        if (v53 - 1 != v12)
        {
          v2 = v42;
          v3 = v52;
          goto LABEL_24;
        }
        objc_msgSend(v13, "topAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v42;
        -[SFDialogTextView bottomAnchor](v42->_messageTextView, "bottomAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setActive:", 1);
        v3 = v52;
      }
      else
      {
        if (v12)
        {
          -[NSArray objectAtIndexedSubscript:](v2->_actionButtons, "objectAtIndexedSubscript:", v12 - 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)MEMORY[0x1E0CB3718];
          objc_msgSend(v13, "topAnchor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "topAnchor");
          v49 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "constraintEqualToAnchor:", v49);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v60[0] = v15;
          objc_msgSend(v13, "trailingAnchor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "leadingAnchor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "constraintEqualToAnchor:constant:", v16, -20.0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v60[1] = v17;
          objc_msgSend(v13, "bottomAnchor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v14;
          objc_msgSend(v14, "bottomAnchor");
          v19 = v2;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "constraintEqualToAnchor:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v60[2] = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "activateConstraints:", v22);

          v23 = v44;
          v2 = v19;
          v3 = v52;

          v24 = (void *)v49;
          v25 = v43;
        }
        else
        {
          v50 = (void *)MEMORY[0x1E0CB3718];
          objc_msgSend(v13, "trailingAnchor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFDialogContentView trailingAnchor](v2, "trailingAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v29;
          objc_msgSend(v29, "constraintEqualToAnchor:constant:", v23, -20.0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = v24;
          objc_msgSend(v13, "topAnchor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFDialogTextView bottomAnchor](v2->_messageTextView, "bottomAnchor");
          v47 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:", v47);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v61[1] = v45;
          objc_msgSend(v13, "bottomAnchor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFDialogContentView bottomAnchor](v2, "bottomAnchor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -10.0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v61[2] = v32;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "activateConstraints:", v33);

          v3 = v52;
          v25 = (void *)v47;
        }

      }
LABEL_24:

      ++v12;
    }
    while (v53 != v12);
  }
  -[SFDialogContentView _populateOptionalConstraints](v2, "_populateOptionalConstraints");

}

- (void)setTableViewRows:(id)a3 didSelectRowAction:(id)a4
{
  NSArray *v6;
  id v7;
  NSArray *tableData;
  NSArray *v9;
  void *v10;
  id tableDidSelectRowAction;

  v6 = (NSArray *)a3;
  v7 = a4;
  -[UITableView setHidden:](self->_tableView, "setHidden:", -[NSArray count](v6, "count") == 0);
  tableData = self->_tableData;
  self->_tableData = v6;
  v9 = v6;

  v10 = _Block_copy(v7);
  tableDidSelectRowAction = self->_tableDidSelectRowAction;
  self->_tableDidSelectRowAction = v10;

  -[UITableView reloadData](self->_tableView, "reloadData");
  +[SFPopoverSizingTableViewController caculateHeightForTableView:targetGlobalRow:outGlobalRow:](SFPopoverSizingTableViewController, "caculateHeightForTableView:targetGlobalRow:outGlobalRow:", self->_tableView, 3, 0);
  -[NSLayoutConstraint setConstant:](self->_tableViewHeightConstraint, "setConstant:");

  -[SFDialogContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)didAppear
{
  -[SFDialogTextView flashScrollIndicators](self->_messageTextView, "flashScrollIndicators");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  SFDialogTextField *v4;

  v4 = (SFDialogTextField *)a3;
  if (-[SFDialogContentView _usesLoginFormAppearance](self, "_usesLoginFormAppearance") && self->_inputTextField == v4)
    -[SFDialogTextField becomeFirstResponder](self->_passwordTextField, "becomeFirstResponder");
  else
    -[SFDialogContentView _invokeDelegateWithSelectedIndex:](self, "_invokeDelegateWithSelectedIndex:", self->_actionIndexTriggeredByReturnKey);

  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_tableData, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  UITableView *tableView;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *tableData;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  tableView = self->_tableView;
  v6 = a4;
  -[UITableView dequeueReusableCellWithIdentifier:](tableView, "dequeueReusableCellWithIdentifier:", CFSTR("tableCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("tableCell"));
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

  v10 = objc_msgSend(v6, "row") != self->_selectedRow;
  objc_msgSend(v7, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v10);

  -[NSArray safari_dictionaryAtIndex:](self->_tableData, "safari_dictionaryAtIndex:", objc_msgSend(v6, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_stringForKey:", CFSTR("textLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

  tableData = self->_tableData;
  v18 = objc_msgSend(v6, "row");

  -[NSArray safari_dictionaryAtIndex:](tableData, "safari_dictionaryAtIndex:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safari_stringForKey:", CFSTR("detailTextLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v20);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t selectedRow;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**tableDidSelectRowAction)(id, void *);
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v6, 1);
  selectedRow = self->_selectedRow;
  self->_selectedRow = objc_msgSend(v6, "row");
  if (selectedRow != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", selectedRow, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cellForRowAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

  }
  objc_msgSend(v16, "cellForRowAtIndexPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 0);

  tableDidSelectRowAction = (void (**)(id, void *))self->_tableDidSelectRowAction;
  -[NSArray safari_dictionaryAtIndex:](self->_tableData, "safari_dictionaryAtIndex:", objc_msgSend(v6, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("context"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  tableDidSelectRowAction[2](tableDidSelectRowAction, v15);

}

- (BOOL)_usesLoginFormAppearance
{
  if ((-[SFDialogTextField isHidden](self->_passwordTextField, "isHidden") & 1) != 0)
    return 0;
  else
    return -[SFDialogTextField isHidden](self->_inputTextField, "isHidden") ^ 1;
}

- (void)_actionTriggered:(id)a3
{
  -[SFDialogContentView _invokeDelegateWithSelectedIndex:](self, "_invokeDelegateWithSelectedIndex:", -[NSArray indexOfObject:](self->_actionButtons, "indexOfObject:", a3));
}

- (void)_focusInputTextField:(id)a3
{
  -[SFDialogTextField becomeFirstResponder](self->_inputTextField, "becomeFirstResponder", a3);
}

- (void)_returnAction:(id)a3
{
  -[SFDialogContentView _invokeDelegateWithSelectedIndex:](self, "_invokeDelegateWithSelectedIndex:", self->_actionIndexTriggeredByReturnKey);
}

- (void)_optionReturnAction:(id)a3
{
  -[SFDialogContentView _invokeDelegateWithSelectedIndex:](self, "_invokeDelegateWithSelectedIndex:", self->_actionIndexTriggeredByOptionReturnKey);
}

- (void)_escapeAction:(id)a3
{
  -[SFDialogContentView _invokeDelegateWithSelectedIndex:](self, "_invokeDelegateWithSelectedIndex:", self->_actionIndexTriggeredByEscapeKey);
}

- (void)_invokeDelegateWithSelectedIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dialogView);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogTextField text](self->_inputTextField, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogTextField text](self->_passwordTextField, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialogView:didSelectActionAtIndex:withInputText:passwordText:", WeakRetained, a3, v6, v7);

}

- (SFDialogView)dialogView
{
  return (SFDialogView *)objc_loadWeakRetained((id *)&self->_dialogView);
}

- (void)setDialogView:(id)a3
{
  objc_storeWeak((id *)&self->_dialogView, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_destroyWeak((id *)&self->_dialogView);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_layoutConstraintsWhenTableViewIsVisible, 0);
  objc_storeStrong(&self->_tableDidSelectRowAction, 0);
  objc_storeStrong((id *)&self->_tableData, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_passwordTextField, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_layoutConstraintsWhenInputAndPasswordAreVisible, 0);
  objc_storeStrong((id *)&self->_layoutConstraintsWhenPasswordIsVisible, 0);
  objc_storeStrong((id *)&self->_layoutConstraintsWhenInputIsVisible, 0);
  objc_storeStrong((id *)&self->_inputTextField, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_actionButtons, 0);
}

@end
