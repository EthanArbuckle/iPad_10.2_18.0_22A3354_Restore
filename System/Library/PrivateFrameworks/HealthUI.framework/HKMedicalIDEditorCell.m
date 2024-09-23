@implementation HKMedicalIDEditorCell

- (HKMedicalIDEditorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDEditorCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDEditorCell;
  v4 = -[HKMedicalIDEditorCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    if (objc_msgSend((id)objc_opt_class(), "showsLabelAndValue"))
    {
      -[HKMedicalIDEditorCell setupSubviews](v4, "setupSubviews");
      -[HKMedicalIDEditorCell setupStackView](v4, "setupStackView");
      -[HKMedicalIDEditorCell _contentSizeCategoryDidChange:](v4, "_contentSizeCategoryDidChange:", 0);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDEditorCell;
  -[HKMedicalIDEditorCell dealloc](&v4, sel_dealloc);
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  HKCaretOptionalTextField *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKMedicalIDEditorCell setLabelLabel:](self, "setLabelLabel:", v3);

  HKHealthKeyColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell labelLabel](self, "labelLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[HKMedicalIDEditorCell labelLabel](self, "labelLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1148846080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v7);

  v8 = objc_alloc_init(HKCaretOptionalTextField);
  -[HKMedicalIDEditorCell setInputTextField:](self, "setInputTextField:", v8);

  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1132068864;
  objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 0, v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v13);

  v15 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[HKMedicalIDEditorCell setVerticalSeparatorView:](self, "setVerticalSeparatorView:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell verticalSeparatorView](self, "verticalSeparatorView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

}

- (void)setupStackView
{
  id v3;
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
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  -[HKMedicalIDEditorCell labelLabel](self, "labelLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell verticalSeparatorView](self, "verticalSeparatorView", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v5;
  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithArrangedSubviews:", v7);
  -[HKMedicalIDEditorCell setStackView:](self, "setStackView:", v8);

  -[HKMedicalIDEditorCell stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSpacing:", 1.17549435e-38);

  -[HKMedicalIDEditorCell stackView](self, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKMedicalIDEditorCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell stackView](self, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[HKMedicalIDEditorCell stackView](self, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v16, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[HKMedicalIDEditorCell stackView](self, "stackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[HKMedicalIDEditorCell stackView](self, "stackView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[HKMedicalIDEditorCell stackView](self, "stackView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[HKMedicalIDEditorCell stackView](self, "stackView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintGreaterThanOrEqualToConstant:", 44.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v36) = 1144750080;
  objc_msgSend(v35, "setPriority:", v36);
  objc_msgSend(v35, "setActive:", 1);
  -[HKMedicalIDEditorCell labelLabel](self, "labelLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintGreaterThanOrEqualToConstant:", 90.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[HKMedicalIDEditorCell verticalSeparatorView](self, "verticalSeparatorView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToConstant:", 0.5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 IsUsingAccessibilityContentSizeCategory;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell labelLabel](self, "labelLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

  IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  -[HKMedicalIDEditorCell verticalSeparatorView](self, "verticalSeparatorView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", IsUsingAccessibilityContentSizeCategory);

  LODWORD(IsUsingAccessibilityContentSizeCategory) = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  -[HKMedicalIDEditorCell stackView](self, "stackView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAxis:", IsUsingAccessibilityContentSizeCategory);

}

- (void)setLabel:(id)a3
{
  -[UILabel setText:](self->_labelLabel, "setText:", a3);
}

- (NSString)label
{
  return -[UILabel text](self->_labelLabel, "text");
}

- (id)formattedValue
{
  return 0;
}

- (void)valueDidChange
{
  id v3;

  -[HKMedicalIDEditorCell updateValueLabel](self, "updateValueLabel");
  -[HKMedicalIDEditorCell editDelegate](self, "editDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medicalIDEditorCellDidChangeValue:", self);

}

- (void)updateValueLabel
{
  id v3;

  if (self->_inputTextField)
  {
    -[HKMedicalIDEditorCell formattedValue](self, "formattedValue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[HKCaretOptionalTextField setText:](self->_inputTextField, "setText:", v3);

  }
}

- (void)dismissInputView
{
  -[HKCaretOptionalTextField resignFirstResponder](self->_inputTextField, "resignFirstResponder");
}

+ (BOOL)showsLabelAndValue
{
  return 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  void *v4;
  BOOL v5;

  -[HKMedicalIDEditorCell _tableView](self, "_tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDragging") & 1) != 0
    || (objc_msgSend(v4, "isDecelerating") & 1) != 0
    || (objc_msgSend(v4, "isTracking") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    __setCurrentlyEditingCell(self);
    v5 = 1;
  }

  return v5;
}

- (double)minimumLabelWidth
{
  return self->_minimumLabelWidth;
}

- (void)setMinimumLabelWidth:(double)a3
{
  self->_minimumLabelWidth = a3;
}

- (HKMedicalIDEditorCellEditDelegate)editDelegate
{
  return (HKMedicalIDEditorCellEditDelegate *)objc_loadWeakRetained((id *)&self->_editDelegate);
}

- (void)setEditDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editDelegate, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (void)setLabelLabel:(id)a3
{
  objc_storeStrong((id *)&self->_labelLabel, a3);
}

- (HKCaretOptionalTextField)inputTextField
{
  return self->_inputTextField;
}

- (void)setInputTextField:(id)a3
{
  objc_storeStrong((id *)&self->_inputTextField, a3);
}

- (UIView)verticalSeparatorView
{
  return self->_verticalSeparatorView;
}

- (void)setVerticalSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_verticalSeparatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalSeparatorView, 0);
  objc_storeStrong((id *)&self->_inputTextField, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_editDelegate);
}

@end
