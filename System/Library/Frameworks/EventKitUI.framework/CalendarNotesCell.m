@implementation CalendarNotesCell

- (CalendarNotesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CalendarNotesCell *v4;
  CalendarNotesCell *v5;
  UITextView *v6;
  UITextView *textView;
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
  objc_super v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)CalendarNotesCell;
  v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v37, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CalendarNotesCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    textView = v5->_textView;
    v5->_textView = v6;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v5->_textView, "setFont:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v5->_textView, "setTextColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v5->_textView, "setBackgroundColor:", v10);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v5->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setTextContainerInset:](v5->_textView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView textContainer](v5->_textView, "textContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLineFragmentPadding:", 0.0);

    -[UITextView textLayoutManager](v5->_textView, "textLayoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLimitsLayoutForSuspiciousContents:", 1);

    -[UITextView setAccessibilityIdentifier:](v5->_textView, "setAccessibilityIdentifier:", CFSTR("Notes"));
    -[CalendarNotesCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v5->_textView);

    v27 = (void *)MEMORY[0x1E0CB3718];
    -[UITextView leadingAnchor](v5->_textView, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarNotesCell contentView](v5, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutMarginsGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v32;
    -[UITextView trailingAnchor](v5->_textView, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarNotesCell contentView](v5, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v26;
    -[UITextView topAnchor](v5->_textView, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarNotesCell contentView](v5, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v16;
    -[UITextView bottomAnchor](v5->_textView, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarNotesCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v22);

  }
  return v5;
}

- (UITextView)textView
{
  return self->_textView;
}

- (BOOL)becomeFirstResponder
{
  return -[UITextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (void)setPlaceholder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = *MEMORY[0x1E0DC1138];
  v4 = (void *)MEMORY[0x1E0DC1350];
  v5 = *MEMORY[0x1E0DC4A88];
  v6 = a3;
  objc_msgSend(v4, "preferredFontForTextStyle:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v9);
  -[UITextView setAttributedPlaceholder:](self->_textView, "setAttributedPlaceholder:", v10);

}

- (NSString)placeholder
{
  void *v2;
  void *v3;

  -[UITextView attributedPlaceholder](self->_textView, "attributedPlaceholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
