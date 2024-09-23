@implementation CKDetailsAddGroupNameView

- (CKDetailsAddGroupNameView)initWithFrame:(CGRect)a3
{
  CKDetailsAddGroupNameView *v3;
  CKDetailsAddGroupNameView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UILabel *placeholderLabel;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  CKDetailsViewAddGroupNameViewUITextField *v22;
  CKDetailsViewAddGroupNameViewUITextField *inputField;
  CKDetailsViewAddGroupNameViewUITextField *v24;
  void *v25;
  CKDetailsViewAddGroupNameViewUITextField *v26;
  uint64_t v27;
  void *v28;
  CKDetailsViewAddGroupNameViewUITextField *v29;
  void *v30;
  void *v31;
  void *v32;
  CKDetailsViewAddGroupNameViewUITextField *v33;
  void *v34;
  void *v35;
  CKDetailsViewAddGroupNameViewUITextField *v36;
  id v37;
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
  objc_super v66;
  _QWORD v67[6];
  _QWORD v68[2];
  _QWORD v69[4];

  v69[2] = *MEMORY[0x1E0C80C00];
  v66.receiver = self;
  v66.super_class = (Class)CKDetailsAddGroupNameView;
  v3 = -[CKDetailsAddGroupNameView initWithFrame:](&v66, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_enabled = 1;
    v5 = objc_alloc(MEMORY[0x1E0CEA700]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    placeholderLabel = v4->_placeholderLabel;
    v4->_placeholderLabel = (UILabel *)v10;

    v12 = v4->_placeholderLabel;
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("GROUP_NAME_LABEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedUppercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v12, "setText:", v15);

    v16 = v4->_placeholderLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "theme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "primaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16, "setTextColor:", v19);

    v20 = v4->_placeholderLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[CKDetailsAddGroupNameView addSubview:](v4, "addSubview:", v4->_placeholderLabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_placeholderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = -[CKDetailsViewAddGroupNameViewUITextField initWithFrame:]([CKDetailsViewAddGroupNameViewUITextField alloc], "initWithFrame:", v6, v7, v8, v9);
    inputField = v4->_inputField;
    v4->_inputField = v22;

    v24 = v4->_inputField;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsViewAddGroupNameViewUITextField setBackgroundColor:](v24, "setBackgroundColor:", v25);

    -[CKDetailsViewAddGroupNameViewUITextField setReturnKeyType:](v4->_inputField, "setReturnKeyType:", 9);
    v26 = v4->_inputField;
    v27 = *MEMORY[0x1E0CEB538];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsViewAddGroupNameViewUITextField setFont:](v26, "setFont:", v28);

    -[CKDetailsViewAddGroupNameViewUITextField setClearButtonMode:](v4->_inputField, "setClearButtonMode:", 1);
    -[CKDetailsViewAddGroupNameViewUITextField setDelegate:](v4->_inputField, "setDelegate:", v4);
    v29 = v4->_inputField;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "theme");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "primaryLabelColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsViewAddGroupNameViewUITextField setTextColor:](v29, "setTextColor:", v32);

    v33 = v4->_inputField;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "theme");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsViewAddGroupNameViewUITextField setKeyboardAppearance:](v33, "setKeyboardAppearance:", objc_msgSend(v35, "keyboardAppearance"));

    v36 = v4->_inputField;
    v37 = objc_alloc(MEMORY[0x1E0CB3498]);
    CKFrameworkBundle();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("GROUP_NAME_PLACEHOLDER"), &stru_1E276D870, CFSTR("ChatKit"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v40;
    v68[1] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v27);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v37, "initWithString:attributes:", v39, v42);
    -[CKDetailsViewAddGroupNameViewUITextField setAttributedPlaceholder:](v36, "setAttributedPlaceholder:", v43);

    -[CKDetailsAddGroupNameView addSubview:](v4, "addSubview:", v4->_inputField);
    -[CKDetailsViewAddGroupNameViewUITextField setTranslatesAutoresizingMaskIntoConstraints:](v4->_inputField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v57 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v4->_placeholderLabel, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAddGroupNameView topAnchor](v4, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, 4.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v63;
    -[UILabel leadingAnchor](v4->_placeholderLabel, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAddGroupNameView leadingAnchor](v4, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v60;
    -[UILabel trailingAnchor](v4->_placeholderLabel, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAddGroupNameView trailingAnchor](v4, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v67[2] = v56;
    -[CKDetailsViewAddGroupNameViewUITextField topAnchor](v4->_inputField, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAddGroupNameView placeholderLabel](v4, "placeholderLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v44, 4.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = v45;
    -[CKDetailsViewAddGroupNameViewUITextField leadingAnchor](v4->_inputField, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAddGroupNameView leadingAnchor](v4, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v67[4] = v48;
    -[CKDetailsViewAddGroupNameViewUITextField trailingAnchor](v4->_inputField, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAddGroupNameView trailingAnchor](v4, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v67[5] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 6);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v52);

  }
  return v4;
}

+ (double)preferredHeight
{
  return *MEMORY[0x1E0CEBC10];
}

- (void)commitGroupName
{
  void *v3;
  id v4;

  -[CKDetailsAddGroupNameView inputField](self, "inputField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCanResignFirstResponderInternal:", 1);

  -[CKDetailsAddGroupNameView inputField](self, "inputField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

}

- (void)setGroupName:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;

  v5 = (NSString *)a3;
  if (self->_groupName != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_groupName, a3);
    -[CKDetailsAddGroupNameView inputField](self, "inputField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", self->_groupName);

    -[CKDetailsAddGroupNameView inputField](self, "inputField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v10);

    -[CKDetailsAddGroupNameView setNeedsLayout](self, "setNeedsLayout");
    v5 = v11;
  }

}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[CKDetailsAddGroupNameView inputField](self, "inputField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("GROUP_NAME_PLACEHOLDER"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithString:attributes:", v7, v9);
    objc_msgSend(v4, "setAttributedPlaceholder:", v10);

    -[CKDetailsAddGroupNameView inputField](self, "inputField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", self->_enabled);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKDetailsViewAddGroupNameViewUITextField sizeThatFits:](self->_inputField, "sizeThatFits:");
  v7 = v6;
  -[UILabel sizeThatFits:](self->_placeholderLabel, "sizeThatFits:", width, height);
  v9 = v7 + v8 + 8.0;
  -[CKDetailsAddGroupNameView layoutMargins](self, "layoutMargins");
  v11 = v10 + v9;
  -[CKDetailsAddGroupNameView layoutMargins](self, "layoutMargins");
  v13 = v12 + v11;
  v14 = width;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v3;

  -[CKDetailsAddGroupNameView inputField](self, "inputField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCanResignFirstResponderInternal:", 0);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  void *v5;

  -[CKDetailsAddGroupNameView inputField](self, "inputField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanResignFirstResponderInternal:", 1);

  -[CKDetailsAddGroupNameView inputField](self, "inputField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKDetailsAddGroupNameView inputField](self, "inputField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCanResignFirstResponderInternal:", 1);

  -[CKDetailsAddGroupNameView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "detailsAddGroupNameView:didCommitGroupName:", self, v6);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  length = a4.length;
  v7 = a5;
  objc_msgSend(a3, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v10 = objc_msgSend(v7, "length");

  return v9 - length + v10 <= *MEMORY[0x1E0D38048];
}

- (CKDetailsAddGroupNameViewDelegate)delegate
{
  return (CKDetailsAddGroupNameViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)setPlaceholderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderLabel, a3);
}

- (CKDetailsViewAddGroupNameViewUITextField)inputField
{
  return self->_inputField;
}

- (void)setInputField:(id)a3
{
  objc_storeStrong((id *)&self->_inputField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputField, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
