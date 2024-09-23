@implementation HUEditableTextViewCell

- (HUEditableTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUEditableTextViewCell *v4;
  id v5;
  uint64_t v6;
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
  double v36;
  void *v37;
  void *v38;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)HUEditableTextViewCell;
  v4 = -[HUEditableTextViewCell initWithStyle:reuseIdentifier:](&v40, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v6 = objc_msgSend(v5, "initWithFrame:textContainer:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textView = v4->_textView;
    v4->_textView = (UITextView *)v6;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v4->_textView, "setFont:", v8);

    -[UITextView setAdjustsFontForContentSizeCategory:](v4->_textView, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    -[UITextView textContainer](v4->_textView, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_textView, "setBackgroundColor:", v10);

    -[HUEditableTextViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_textView);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView leadingAnchor](v4->_textView, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextViewCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutMarginsGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v17);

    -[UITextView trailingAnchor](v4->_textView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextViewCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutMarginsGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v22);

    -[UITextView topAnchor](v4->_textView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextViewCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v27);

    -[UITextView bottomAnchor](v4->_textView, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextViewCell contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v32);

    -[HUEditableTextViewCell contentView](v4, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 176.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v36) = 1144750080;
    objc_msgSend(v35, "setPriority:", v36);
    objc_msgSend(v12, "addObject:", v35);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v12);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v4, sel_handleUITextViewTextDidBeginEditingNotification_, *MEMORY[0x1E0CEBD88], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v4, sel_handleUITextViewTextDidEndEditingNotification_, *MEMORY[0x1E0CEBD98], 0);

  }
  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  id v4;

  if (a3)
  {
    -[HUEditableTextViewCell textView](self, "textView", a3, a4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUEditableTextViewCell;
  -[HUEditableTextViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[HUEditableTextViewCell setText:](self, "setText:", 0);
  -[HUEditableTextViewCell setPlaceholderText:](self, "setPlaceholderText:", 0);
  -[HUEditableTextViewCell setShowingPlaceholder:](self, "setShowingPlaceholder:", 0);
  -[HUEditableTextViewCell textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[HUEditableTextViewCell textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[HUEditableTextViewCell updateTextColor](self, "updateTextColor");
}

- (void)handleUITextViewTextDidBeginEditingNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUEditableTextViewCell textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7 == v4)
  {
    if (-[HUEditableTextViewCell showingPlaceholder](self, "showingPlaceholder"))
    {
      -[HUEditableTextViewCell setShowingPlaceholder:](self, "setShowingPlaceholder:", 0);
      -[HUEditableTextViewCell textView](self, "textView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setText:", 0);

    }
    -[HUEditableTextViewCell updateTextColor](self, "updateTextColor");
    v5 = v7;
  }

}

- (void)handleUITextViewTextDidEndEditingNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *placeholderText;
  void *v13;
  id v14;

  objc_msgSend(a3, "object");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[HUEditableTextViewCell textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v14;
  if (v14 == v4)
  {
    objc_msgSend(v14, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextViewCell trimmedStringForText:](self, "trimmedStringForText:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextViewCell textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[HUEditableTextViewCell textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", &stru_1E6F60E80) & 1) == 0)
    {

      goto LABEL_6;
    }
    -[HUEditableTextViewCell placeholderText](self, "placeholderText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v14;
    if (v11)
    {
      -[HUEditableTextViewCell setShowingPlaceholder:](self, "setShowingPlaceholder:", 1);
      placeholderText = self->_placeholderText;
      -[HUEditableTextViewCell textView](self, "textView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", placeholderText);

      -[HUEditableTextViewCell updateTextColor](self, "updateTextColor");
LABEL_6:
      v5 = v14;
    }
  }

}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  -[HUEditableTextViewCell updateTextColor](self, "updateTextColor");
}

- (void)setEditEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUEditableTextViewCell textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditable:", v3);

}

- (UITextViewDelegate)textViewDelegate
{
  void *v2;
  void *v3;

  -[HUEditableTextViewCell textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextViewDelegate *)v3;
}

- (void)setTextViewDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUEditableTextViewCell textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (NSString)text
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[HUEditableTextViewCell showingPlaceholder](self, "showingPlaceholder"))
    goto LABEL_3;
  -[HUEditableTextViewCell textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditableTextViewCell placeholderText](self, "placeholderText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
LABEL_3:
    v7 = 0;
  }
  else
  {
    -[HUEditableTextViewCell textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextViewCell trimmedStringForText:](self, "trimmedStringForText:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;

  -[HUEditableTextViewCell trimmedStringForText:](self, "trimmedStringForText:", a3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  text = self->_text;
  self->_text = v4;

  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:", &stru_1E6F60E80))
  {
    -[HUEditableTextViewCell setShowingPlaceholder:](self, "setShowingPlaceholder:", 0);
    v9 = self->_text;
    -[HUEditableTextViewCell textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v9);
    goto LABEL_5;
  }
  -[HUEditableTextViewCell placeholderText](self, "placeholderText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUEditableTextViewCell setShowingPlaceholder:](self, "setShowingPlaceholder:", 1);
    -[HUEditableTextViewCell placeholderText](self, "placeholderText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextViewCell textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

LABEL_5:
  }
  -[HUEditableTextViewCell updateTextColor](self, "updateTextColor");
}

- (void)setPlaceholderText:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  NSString *placeholderText;
  void *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_placeholderText, a3);
  -[HUEditableTextViewCell textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", &stru_1E6F60E80);

  if (v7)
  {
    -[HUEditableTextViewCell setShowingPlaceholder:](self, "setShowingPlaceholder:", 1);
    placeholderText = self->_placeholderText;
    -[HUEditableTextViewCell textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", placeholderText);

  }
  else
  {
    -[HUEditableTextViewCell setShowingPlaceholder:](self, "setShowingPlaceholder:", 0);
  }
  -[HUEditableTextViewCell updateTextColor](self, "updateTextColor");

}

- (void)updateTextColor
{
  int v3;
  int v4;
  void *v5;
  id v6;

  if (-[HUEditableTextViewCell showingPlaceholder](self, "showingPlaceholder")
    || -[HUEditableTextViewCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = 0;
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    v3 = 1;
  }
  -[HUEditableTextViewCell textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

  if (v3)
  if (v4)

}

- (id)trimmedStringForText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (BOOL)editEnabled
{
  return self->_editEnabled;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (BOOL)showingPlaceholder
{
  return self->_showingPlaceholder;
}

- (void)setShowingPlaceholder:(BOOL)a3
{
  self->_showingPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
