@implementation HUItemTableSectionHeaderFooterView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUItemTableSectionHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  return -[HUItemTableSectionHeaderFooterView initWithReuseIdentifier:type:](self, "initWithReuseIdentifier:type:", a3, 0);
}

- (HUItemTableSectionHeaderFooterView)initWithReuseIdentifier:(id)a3 type:(unint64_t)a4
{
  HUItemTableSectionHeaderFooterView *v5;
  HUTappableTextView *v6;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUItemTableSectionHeaderFooterView;
  v5 = -[HUItemTableSectionHeaderFooterView initWithReuseIdentifier:](&v19, sel_initWithReuseIdentifier_, a3);
  if (v5)
  {
    v6 = objc_alloc_init(HUTappableTextView);
    -[HUItemTableSectionHeaderFooterView setMessageTextView:](v5, "setMessageTextView:", v6);

    -[HUItemTableSectionHeaderFooterView messageTextView](v5, "messageTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUItemTableSectionHeaderFooterView messageTextView](v5, "messageTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEditable:", 0);

    -[HUItemTableSectionHeaderFooterView messageTextView](v5, "messageTextView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setInteractiveTextSelectionDisabled:", 1);

    -[HUItemTableSectionHeaderFooterView messageTextView](v5, "messageTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setScrollEnabled:", 0);

    -[HUItemTableSectionHeaderFooterView messageTextView](v5, "messageTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineFragmentPadding:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableSectionHeaderFooterView messageTextView](v5, "messageTextView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    -[HUItemTableSectionHeaderFooterView tableView](v5, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "separatorInset");
    -[HUItemTableSectionHeaderFooterView setIndentationInset:](v5, "setIndentationInset:");

    -[HUItemTableSectionHeaderFooterView contentView](v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableSectionHeaderFooterView messageTextView](v5, "messageTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

    -[HUItemTableSectionHeaderFooterView setType:](v5, "setType:", a4);
  }
  return v5;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[HUItemTableSectionHeaderFooterView setMessage:](self, "setMessage:", 0);
  -[HUItemTableSectionHeaderFooterView messageTextView](self, "messageTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTappableTextViewDelegate:", 0);

  -[HUItemTableSectionHeaderFooterView setType:](self, "setType:", 0);
  v4.receiver = self;
  v4.super_class = (Class)HUItemTableSectionHeaderFooterView;
  -[HUItemTableSectionHeaderFooterView prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)updateConstraints
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
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
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;

  -[HUItemTableSectionHeaderFooterView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0x1E0CB3000uLL;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[HUItemTableSectionHeaderFooterView constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

    -[HUItemTableSectionHeaderFooterView setConstraints:](self, "setConstraints:", 0);
  }
  v7 = (void *)objc_opt_new();
  -[HUItemTableSectionHeaderFooterView messageTextView](self, "messageTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableSectionHeaderFooterView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableSectionHeaderFooterView indentationInset](self, "indentationInset");
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v13);
  -[HUItemTableSectionHeaderFooterView messageTextView](self, "messageTextView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableSectionHeaderFooterView contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableSectionHeaderFooterView indentationInset](self, "indentationInset");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v19);
  if (-[HUItemTableSectionHeaderFooterView type](self, "type"))
  {
    objc_msgSend((id)objc_opt_class(), "defaultAttributesForType:", -[HUItemTableSectionHeaderFooterView type](self, "type"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableSectionHeaderFooterView messageTextView](self, "messageTextView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstBaselineAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableSectionHeaderFooterView contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_scaledValueForValue:", 20.0);
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = 0x1E0CB3000;
    objc_msgSend(v7, "addObject:", v26);

  }
  else
  {
    -[HUItemTableSectionHeaderFooterView contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableSectionHeaderFooterView messageTextView](self, "messageTextView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, 0.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v26);
  }
  -[HUItemTableSectionHeaderFooterView contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableSectionHeaderFooterView messageTextView](self, "messageTextView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v35);
  -[HUItemTableSectionHeaderFooterView contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableSectionHeaderFooterView messageTextView](self, "messageTextView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:multiplier:constant:", v39, 1.0, 0.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v40);
  objc_msgSend(*(id *)(v4 + 1816), "activateConstraints:", v7);
  -[HUItemTableSectionHeaderFooterView setConstraints:](self, "setConstraints:", v7);
  v41.receiver = self;
  v41.super_class = (Class)HUItemTableSectionHeaderFooterView;
  -[HUItemTableSectionHeaderFooterView updateConstraints](&v41, sel_updateConstraints);

}

- (UILabel)textLabel
{
  return 0;
}

- (UILabel)detailTextLabel
{
  return 0;
}

- (HFStringGenerator)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  HFStringGenerator *v4;
  HFStringGenerator *message;
  id v6;

  v6 = a3;
  if ((-[HFStringGenerator isEqual:](self->_message, "isEqual:") & 1) == 0)
  {
    v4 = (HFStringGenerator *)objc_msgSend(v6, "copyWithZone:", 0);
    message = self->_message;
    self->_message = v4;

    -[HUItemTableSectionHeaderFooterView _updateViewContent](self, "_updateViewContent");
  }

}

- (void)setType:(unint64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[HUItemTableSectionHeaderFooterView _updateViewContent](self, "_updateViewContent");
    -[HUItemTableSectionHeaderFooterView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (BOOL)_updateViewContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "defaultAttributesForType:", -[HUItemTableSectionHeaderFooterView type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableSectionHeaderFooterView message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithAttributes:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableSectionHeaderFooterView messageTextView](self, "messageTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    -[HUItemTableSectionHeaderFooterView messageTextView](self, "messageTextView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedText:", v5);

  }
  return v8 ^ 1;
}

+ (id)defaultAttributesForType:(unint64_t)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a3 == 0;
  v8[0] = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEAA78], "_defaultTextColorForTableViewStyle:isSectionHeader:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = *MEMORY[0x1E0CEA098];
  objc_msgSend(MEMORY[0x1E0CEAA78], "_defaultFontForTableViewStyle:isSectionHeader:", 1, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HUTappableTextView)messageTextView
{
  return self->_messageTextView;
}

- (void)setMessageTextView:(id)a3
{
  objc_storeStrong((id *)&self->_messageTextView, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (UIEdgeInsets)indentationInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_indentationInset.top;
  left = self->_indentationInset.left;
  bottom = self->_indentationInset.bottom;
  right = self->_indentationInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setIndentationInset:(UIEdgeInsets)a3
{
  self->_indentationInset = a3;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
