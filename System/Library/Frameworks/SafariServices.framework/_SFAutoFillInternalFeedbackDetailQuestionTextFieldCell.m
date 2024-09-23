@implementation _SFAutoFillInternalFeedbackDetailQuestionTextFieldCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("_SFAutoFillInternalFeedbackDetailQuestionTextFieldCellReuseIdentifier");
}

- (_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell)initWithFrame:(CGRect)a3
{
  _SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *v3;
  _SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *v4;
  UITextView *v5;
  UITextView *textView;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  NSLayoutConstraint *textViewHeightConstraint;
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
  _SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[7];

  v38[5] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell;
  v3 = -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell setAutomaticallyUpdatesBackgroundConfiguration:](v3, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
    v5 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    textView = v4->_textView;
    v4->_textView = v5;

    -[UITextView setDelegate:](v4->_textView, "setDelegate:", v4);
    v7 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend(MEMORY[0x1E0DC37E8], "labelFontSize");
    objc_msgSend(v7, "systemFontOfSize:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v4->_textView, "setFont:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_textView, "setBackgroundColor:", v9);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = *MEMORY[0x1E0DC49E8];
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[UITextView setContentInset:](v4->_textView, "setContentInset:", *MEMORY[0x1E0DC49E8], v11, v12, v13);
    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:", v10, v11, v12, v13);
    -[UITextView setEditable:](v4->_textView, "setEditable:", 1);
    -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell contentView](v4, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v4->_textView);
    -[UITextView heightAnchor](v4->_textView, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView contentSize](v4->_textView, "contentSize");
    objc_msgSend(v14, "constraintEqualToConstant:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    textViewHeightConstraint = v4->_textViewHeightConstraint;
    v4->_textViewHeightConstraint = (NSLayoutConstraint *)v16;

    objc_msgSend(v36, "setLayoutMargins:", 8.0, 16.0, 8.0, 16.0);
    -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0CB3718];
    -[UITextView leadingAnchor](v4->_textView, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v33;
    -[UITextView trailingAnchor](v4->_textView, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v20;
    -[UITextView topAnchor](v4->_textView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v23;
    -[UITextView bottomAnchor](v4->_textView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v26;
    v38[4] = v4->_textViewHeightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v27);

    -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell _setShowPlaceholder:](v4, "_setShowPlaceholder:", 1);
    v28 = v4;

  }
  return v4;
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(v6, "setHighlighted:", 0);
  objc_msgSend(v6, "setSelected:", 0);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedConfigurationForState:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v5);

}

- (void)setText:(id)a3
{
  UITextView *textView;
  id v5;
  uint64_t v6;

  textView = self->_textView;
  v5 = a3;
  -[UITextView setText:](textView, "setText:", v5);
  v6 = objc_msgSend(v5, "length");

  -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell _setShowPlaceholder:](self, "_setShowPlaceholder:", v6 == 0);
  -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell _updateTextViewHeight](self, "_updateTextViewHeight");
}

- (NSString)text
{
  return -[UITextView text](self->_textView, "text");
}

- (void)setPlaceholder:(id)a3
{
  NSString *v4;
  NSString *placeholder;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  placeholder = self->_placeholder;
  self->_placeholder = v4;

  if (self->_isShowingPlaceholder)
  {
    -[UITextView setText:](self->_textView, "setText:", self->_placeholder);
    -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell _updateTextViewHeight](self, "_updateTextViewHeight");
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
  -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell _setShowPlaceholder:](self, "_setShowPlaceholder:", 0);
}

- (void)textViewDidChange:(id)a3
{
  id WeakRetained;

  -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell _updateTextViewHeight](self, "_updateTextViewHeight", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "textFieldCellTextDidChange:", self);

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell _setShowPlaceholder:](self, "_setShowPlaceholder:", objc_msgSend(v4, "length") == 0);

}

- (void)_setShowPlaceholder:(BOOL)a3
{
  NSString *placeholder;
  void *v5;

  if (self->_isShowingPlaceholder != a3)
  {
    self->_isShowingPlaceholder = a3;
    if (a3)
      placeholder = self->_placeholder;
    else
      placeholder = 0;
    -[UITextView setText:](self->_textView, "setText:", placeholder);
    if (self->_isShowingPlaceholder)
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](self->_textView, "setTextColor:", v5);

    -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell _updateTextViewHeight](self, "_updateTextViewHeight");
  }
}

- (void)_updateTextViewHeight
{
  double v3;

  -[UITextView contentSize](self->_textView, "contentSize");
  -[NSLayoutConstraint setConstant:](self->_textViewHeightConstraint, "setConstant:", v3);
  -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (_SFAutoFillInternalFeedbackDetailQuestionTextFieldCellDelegate)delegate
{
  return (_SFAutoFillInternalFeedbackDetailQuestionTextFieldCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_textViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
