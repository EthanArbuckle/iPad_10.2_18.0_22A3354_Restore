@implementation SFAccountNoteTableViewCell

- (SFAccountNoteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFAccountNoteTableViewCell *v4;
  uint64_t v5;
  UITextView *textView;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UITapGestureRecognizer *v17;
  UITapGestureRecognizer *textViewTapGestureRecognizer;
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
  SFAccountNoteTableViewCell *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UITapGestureRecognizer *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[4];
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)SFAccountNoteTableViewCell;
  v4 = -[SFAccountNoteTableViewCell initWithStyle:reuseIdentifier:](&v41, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4EC70]), "initWithMaxHeight:", 350.0);
    textView = v4->_textView;
    v4->_textView = (UITextView *)v5;

    +[_SFAccountManagerAppearanceValues subtitleFontForLargerCell](_SFAccountManagerAppearanceValues, "subtitleFontForLargerCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v4->_textView, "setFont:", v7);

    -[UITextView textContainer](v4->_textView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineFragmentPadding:", 0.0);

    -[SFAccountNoteTableViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutMargins");
    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:");

    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = *MEMORY[0x1E0DC32A8];
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v13);
    -[UITextView setAttributedPlaceholder:](v4->_textView, "setAttributedPlaceholder:", v14);

    -[UITextView setDelegate:](v4->_textView, "setDelegate:", v4);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_textView, "setBackgroundColor:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTintColor:](v4->_textView, "setTintColor:", v16);

    v17 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__didTapTextView);
    -[UITextView addGestureRecognizer:](v4->_textView, "addGestureRecognizer:", v17);
    textViewTapGestureRecognizer = v4->_textViewTapGestureRecognizer;
    v4->_textViewTapGestureRecognizer = v17;
    v36 = v17;

    -[SFAccountNoteTableViewCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v4->_textView);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFAccountNoteTableViewCell _updateHeightConstraint](v4, "_updateHeightConstraint");
    v32 = (void *)MEMORY[0x1E0CB3718];
    -[UITextView leadingAnchor](v4->_textView, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountNoteTableViewCell contentView](v4, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v37;
    -[UITextView trailingAnchor](v4->_textView, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountNoteTableViewCell contentView](v4, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v31;
    -[UITextView topAnchor](v4->_textView, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountNoteTableViewCell contentView](v4, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v23;
    -[UITextView bottomAnchor](v4->_textView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountNoteTableViewCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v28);

    v29 = v4;
  }

  return v4;
}

- (void)layoutMarginsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAccountNoteTableViewCell;
  -[SFAccountNoteTableViewCell layoutMarginsDidChange](&v4, sel_layoutMarginsDidChange);
  -[SFAccountNoteTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:");

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFAccountNoteTableViewCell;
  -[SFAccountNoteTableViewCell setEditing:animated:](&v7, sel_setEditing_animated_, a3, a4);
  -[SFAccountNoteTableViewCell textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditable:", v4);

  -[UITapGestureRecognizer setEnabled:](self->_textViewTapGestureRecognizer, "setEnabled:", v4 ^ 1);
  -[SFAccountNoteTableViewCell _updateHeightConstraint](self, "_updateHeightConstraint");
}

- (void)_updateHeightConstraint
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *heightConstraint;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *v12;
  double v13;
  void *v14;
  NSLayoutConstraint *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[SFAccountNoteTableViewCell textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEditable"))
  {

LABEL_6:
    heightConstraint = self->_heightConstraint;
    if (!heightConstraint)
    {
      -[UITextView heightAnchor](self->_textView, "heightAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintGreaterThanOrEqualToConstant:", 62.0);
      v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v12 = self->_heightConstraint;
      self->_heightConstraint = v11;

      LODWORD(v13) = 1144750080;
      -[NSLayoutConstraint setPriority:](self->_heightConstraint, "setPriority:", v13);
      heightConstraint = self->_heightConstraint;
    }
    v14 = (void *)MEMORY[0x1E0CB3718];
    v15 = heightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activateConstraints:", v8);
    goto LABEL_9;
  }
  -[SFAccountNoteTableViewCell textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    goto LABEL_6;
  if (!self->_heightConstraint)
    return;
  v7 = (void *)MEMORY[0x1E0CB3718];
  v16[0] = self->_heightConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deactivateConstraints:", v8);
LABEL_9:

}

- (void)_didTapTextView
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "noteTableViewCellTextViewTapped:", self);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
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

  LOBYTE(length) = v9 - length + v10 <= *MEMORY[0x1E0D8B488];
  return length;
}

- (void)textViewDidChange:(id)a3
{
  void (**textDidChange)(void);

  objc_msgSend(a3, "invalidateIntrinsicContentSize");
  textDidChange = (void (**)(void))self->_textDidChange;
  if (textDidChange)
    textDidChange[2]();
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (id)textDidChange
{
  return self->_textDidChange;
}

- (void)setTextDidChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (SFAccountNoteTableViewCellDelegate)delegate
{
  return (SFAccountNoteTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_textDidChange, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
