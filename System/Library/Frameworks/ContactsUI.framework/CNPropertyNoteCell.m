@implementation CNPropertyNoteCell

- (BOOL)displaysCellSelectionState
{
  return 0;
}

- (id)valueView
{
  UITextView *textView;
  id v4;
  UITextView *v5;
  UITextView *v6;
  void *v7;
  void *v8;

  textView = self->_textView;
  if (!textView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3E50]);
    v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_textView;
    self->_textView = v5;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](self->_textView, "setFont:", v7);

    -[UITextView textContainer](self->_textView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineFragmentPadding:", 0.0);

    -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", 0);
    -[UITextView _cnui_applyContactStyle](self->_textView, "_cnui_applyContactStyle");
    textView = self->_textView;
  }
  return textView;
}

- (id)labelView
{
  UILabel *labelLabel;
  UILabel *v4;
  UILabel *v5;

  labelLabel = self->_labelLabel;
  if (!labelLabel)
  {
    -[CNLabeledCell standardLabelView](self, "standardLabelView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_labelLabel;
    self->_labelLabel = v4;

    labelLabel = self->_labelLabel;
  }
  return labelLabel;
}

- (double)valueViewBottomMargin
{
  double v2;

  -[CNPropertyNoteCell layoutMargins](self, "layoutMargins");
  return 44.0 - v2;
}

- (CNPropertyNoteCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyNoteCell *v4;
  CNPropertyNoteCell *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPropertyNoteCell;
  v4 = -[CNPropertyCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNPropertyNoteCell setAllowsEditing:](v4, "setAllowsEditing:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_textViewChanged_, *MEMORY[0x1E0DC55A0], v5->_textView);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_textViewEditingDidEnd_, *MEMORY[0x1E0DC55A8], v5->_textView);

  }
  return v5;
}

- (void)setAllowsEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[CNPropertyCell allowsEditing](self, "allowsEditing") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CNPropertyNoteCell;
    -[CNPropertyCell setAllowsEditing:](&v6, sel_setAllowsEditing_, v3);
    -[CNPropertyNoteCell textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEditable:", v3);

  }
}

- (void)setValueTextAttributes:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0DC1140];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyNoteCell textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  v10[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v11[0] = v7;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)CNPropertyNoteCell;
  -[CNLabeledCell setValueTextAttributes:](&v9, sel_setValueTextAttributes_, v8);

}

- (UITextView)textView
{
  return self->_textView;
}

- (BOOL)supportsTintColorValue
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyNoteCell;
  -[CNContactCell dealloc](&v4, sel_dealloc);
}

- (void)setProperty:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNPropertyNoteCell labelView](self, "labelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAb_text:", CFSTR("Notes"));

  -[CNPropertyNoteCell valueView](self, "valueView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAb_text:", v4);

}

- (BOOL)allowsCellSelection
{
  return 1;
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (void)performDefaultAction
{
  id v2;

  -[CNPropertyNoteCell textView](self, "textView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)textViewChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyCell:didUpdateItem:withNewValue:", self, v5, v6);

  -[CNPropertyCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyCellDidChangeLayout:", self);

}

- (void)textViewEditingDidEnd:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:animated:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  if ((-[CNPropertyNoteCell isEditing](self, "isEditing") & 1) == 0)
  {
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "saveChangesImmediately:", 1);

  }
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end
