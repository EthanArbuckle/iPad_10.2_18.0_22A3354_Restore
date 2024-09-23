@implementation CNAddressComponentSplitTextFieldCell

- (CNAddressComponentSplitTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNAddressComponentSplitTextFieldCell *v4;
  CNAddressComponentSplitTextFieldCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNAddressComponentSplitTextFieldCell;
  v4 = -[CNAddressComponentTextFieldCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[NUITableViewContainerCell containerView](v4, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAxis:", 0);
    objc_msgSend(v6, "setAlignment:", 3);
    objc_msgSend(v6, "setDistribution:", 0);
    objc_msgSend(v6, "setDelegate:", v5);

  }
  return v5;
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  -[CNAddressComponentSplitTextFieldCell separator](self, "separator");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v12)
  {
    objc_msgSend(v11, "bounds");
    height = v14;
    y = 0.0;
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)newSeparatorView
{
  CNRepeatingGradientSeparatorView *v3;
  CNRepeatingGradientSeparatorView *v4;
  void *v5;
  double v6;

  v3 = [CNRepeatingGradientSeparatorView alloc];
  v4 = -[CNRepeatingGradientSeparatorView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNAddressComponentSplitTextFieldCell setSeparator:](self, "setSeparator:", v4);

  -[CNAddressComponentSplitTextFieldCell separator](self, "separator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1148846080;
  objc_msgSend(v5, "setLayoutSize:withContentPriority:", 0.5, 0.5, v6);

  -[CNAddressComponentSplitTextFieldCell separator](self, "separator");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setupTextFields
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = -[CNAddressComponentTextFieldCell newTextField](self, "newTextField");
  -[CNAddressComponentSplitTextFieldCell setTextFieldLeft:](self, "setTextFieldLeft:", v3);

  -[NUITableViewContainerCell containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAddressComponentSplitTextFieldCell textFieldLeft](self, "textFieldLeft");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArrangedSubview:", v5);

  v6 = -[CNAddressComponentSplitTextFieldCell newSeparatorView](self, "newSeparatorView");
  -[CNAddressComponentSplitTextFieldCell setSeparator:](self, "setSeparator:", v6);

  -[NUITableViewContainerCell containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAddressComponentSplitTextFieldCell separator](self, "separator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addArrangedSubview:", v8);

  -[NUITableViewContainerCell containerView](self, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAddressComponentSplitTextFieldCell separator](self, "separator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMinimumSpacing:adjacentToView:", v10, 0.0, 0.0, 0.0, 8.0);

  v11 = -[CNAddressComponentTextFieldCell newTextField](self, "newTextField");
  -[CNAddressComponentSplitTextFieldCell setTextFieldRight:](self, "setTextFieldRight:", v11);

  -[NUITableViewContainerCell containerView](self, "containerView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAddressComponentSplitTextFieldCell textFieldRight](self, "textFieldRight");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addArrangedSubview:", v12);

}

- (id)textFields
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[CNAddressComponentSplitTextFieldCell textFieldLeft](self, "textFieldLeft");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[CNAddressComponentSplitTextFieldCell textFieldRight](self, "textFieldRight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTextAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CNAddressComponentSplitTextFieldCell textFieldLeft](self, "textFieldLeft");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ab_textAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v8)
  {
    -[CNAddressComponentSplitTextFieldCell textFieldLeft](self, "textFieldLeft");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAb_textAttributes:", v8);

    -[CNAddressComponentSplitTextFieldCell textFieldRight](self, "textFieldRight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAb_textAttributes:", v8);

  }
}

- (id)textAttributes
{
  void *v2;
  void *v3;

  -[CNAddressComponentSplitTextFieldCell textFieldLeft](self, "textFieldLeft");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ab_textAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UITextField)textFieldLeft
{
  return self->_textFieldLeft;
}

- (void)setTextFieldLeft:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldLeft, a3);
}

- (UITextField)textFieldRight
{
  return self->_textFieldRight;
}

- (void)setTextFieldRight:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldRight, a3);
}

- (CNRepeatingGradientSeparatorView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_textFieldRight, 0);
  objc_storeStrong((id *)&self->_textFieldLeft, 0);
}

+ (Class)containerViewClass
{
  return (Class)objc_opt_class();
}

+ (id)cellIdentifier
{
  return CFSTR("CNAddressComponentSplitTextFieldCell");
}

@end
