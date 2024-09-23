@implementation MULabeledValueActionTextFieldRowView

- (MULabeledValueActionTextFieldRowView)initWithFrame:(CGRect)a3
{
  MULabeledValueActionTextFieldRowView *v3;
  MULabeledValueActionTextFieldRowView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MULabeledValueActionTextFieldRowView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_maximumNumberOfCharacters = 100;
    -[MULabeledValueActionTextFieldRowView _setupSubviews](v3, "_setupSubviews");
    -[MULabeledValueActionTextFieldRowView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MULabelViewProtocol *titleLabel;
  UITextView *v8;
  UITextView *valueTextField;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UILayoutGuide *v14;
  UILayoutGuide *titleValueLayoutGuide;

  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionHeaderFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

  titleLabel = self->_titleLabel;
  self->_titleLabel = (MULabelViewProtocol *)v3;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MULabelViewProtocol setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[MULabeledValueActionTextFieldRowView addSubview:](self, "addSubview:", self->_titleLabel);
  objc_msgSend(MEMORY[0x1E0DC3E50], "_mapsui_defaultTextView");
  v8 = (UITextView *)objc_claimAutoreleasedReturnValue();
  valueTextField = self->_valueTextField;
  self->_valueTextField = v8;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_valueTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setAdjustsFontForContentSizeCategory:](self->_valueTextField, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bodyFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_valueTextField, "setFont:", v11);

  -[UITextView setEditable:](self->_valueTextField, "setEditable:", 1);
  -[UITextView setScrollEnabled:](self->_valueTextField, "setScrollEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_valueTextField, "setBackgroundColor:", v12);

  -[UITextView textContainer](self->_valueTextField, "textContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMaximumNumberOfLines:", 5);

  -[UITextView setDelegate:](self->_valueTextField, "setDelegate:", self);
  -[MULabeledValueActionTextFieldRowView addSubview:](self, "addSubview:", self->_valueTextField);
  v14 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  titleValueLayoutGuide = self->_titleValueLayoutGuide;
  self->_titleValueLayoutGuide = v14;

  -[MULabeledValueActionTextFieldRowView addLayoutGuide:](self, "addLayoutGuide:", self->_titleValueLayoutGuide);
}

- (void)_setupConstraints
{
  void *v3;
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
  _QWORD v38[13];

  v38[11] = *MEMORY[0x1E0C80C00];
  v25 = (void *)MEMORY[0x1E0CB3718];
  -[MULabelViewProtocol leadingAnchor](self->_titleLabel, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v35;
  -[MULabelViewProtocol topAnchor](self->_titleLabel, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_titleValueLayoutGuide, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v32;
  -[MULabelViewProtocol trailingAnchor](self->_titleLabel, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v29;
  -[MULabelViewProtocol bottomAnchor](self->_titleLabel, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView topAnchor](self->_valueTextField, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v26;
  -[UITextView leadingAnchor](self->_valueTextField, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v22;
  -[UITextView trailingAnchor](self->_valueTextField, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v19;
  -[UITextView bottomAnchor](self->_valueTextField, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_titleValueLayoutGuide, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v16;
  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionTextFieldRowView leadingAnchor](self, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, 16.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v13;
  -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionTextFieldRowView trailingAnchor](self, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, -16.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v5;
  -[UILayoutGuide topAnchor](self->_titleValueLayoutGuide, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionTextFieldRowView topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 12.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v8;
  -[UILayoutGuide bottomAnchor](self->_titleValueLayoutGuide, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionTextFieldRowView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -12.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[10] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v12);

}

- (unint64_t)maximumNumberOfLines
{
  void *v2;
  unint64_t v3;

  -[UITextView textContainer](self->_valueTextField, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumNumberOfLines");

  return v3;
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  id v4;

  -[UITextView textContainer](self->_valueTextField, "textContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumNumberOfLines:", a3);

}

- (id)textView
{
  return self->_valueTextField;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;

  v6 = a5;
  v7 = a3;
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "count");
  v14 = v13 + objc_msgSend(v12, "count") - 1;
  objc_msgSend(v7, "textContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = v14 <= objc_msgSend(v15, "maximumNumberOfLines");
  return (char)v7;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;

  -[MULabeledValueActionTextFieldRowView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textFieldRowViewDidBeginEditing:", self);

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;

  -[MULabeledValueActionTextFieldRowView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textFieldRowViewDidEndEditing:", self);

}

- (void)textViewDidChange:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t maximumNumberOfCharacters;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 >= self->_maximumNumberOfCharacters)
    maximumNumberOfCharacters = self->_maximumNumberOfCharacters;
  else
    maximumNumberOfCharacters = v6;
  objc_msgSend(v4, "substringWithRange:", 0, maximumNumberOfCharacters);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
    objc_msgSend(v12, "setText:", v8);
  -[MULabeledValueActionTextFieldRowView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textFieldRowViewDidChange:", self);

}

- (BOOL)becomeFirstResponder
{
  return -[UITextView becomeFirstResponder](self->_valueTextField, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return -[UITextView resignFirstResponder](self->_valueTextField, "resignFirstResponder");
}

- (BOOL)isEditing
{
  return -[UITextView isFirstResponder](self->_valueTextField, "isFirstResponder");
}

- (void)setCurrentTextFieldValue:(id)a3
{
  -[UITextView setText:](self->_valueTextField, "setText:", a3);
}

- (NSString)currentTextFieldValue
{
  return -[UITextView text](self->_valueTextField, "text");
}

- (void)setTitleText:(id)a3
{
  -[MULabelViewProtocol setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)titleText
{
  return (NSString *)-[MULabelViewProtocol text](self->_titleLabel, "text");
}

- (void)setPlaceholderText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = [v4 alloc];
  v11 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bodyFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v9);

  -[UITextView setAttributedPlaceholder:](self->_valueTextField, "setAttributedPlaceholder:", v10);
}

- (NSString)placeholderText
{
  void *v2;
  void *v3;

  -[UITextView attributedPlaceholder](self->_valueTextField, "attributedPlaceholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCurrentTextFieldValueIfNeeded:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[MULabeledValueActionTextFieldRowView isEditing](self, "isEditing"))
    -[MULabeledValueActionTextFieldRowView setCurrentTextFieldValue:](self, "setCurrentTextFieldValue:", v4);

}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (void)setPlaceholderColor:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderColor, a3);
}

- (MULabeledValueActionTextFieldRowViewDelegate)delegate
{
  return (MULabeledValueActionTextFieldRowViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)maximumNumberOfCharacters
{
  return self->_maximumNumberOfCharacters;
}

- (void)setMaximumNumberOfCharacters:(unint64_t)a3
{
  self->_maximumNumberOfCharacters = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_titleValueLayoutGuide, 0);
  objc_storeStrong((id *)&self->_valueTextField, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
