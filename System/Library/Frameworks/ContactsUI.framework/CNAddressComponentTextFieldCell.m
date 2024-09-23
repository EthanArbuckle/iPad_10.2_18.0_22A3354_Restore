@implementation CNAddressComponentTextFieldCell

- (CNAddressComponentTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNAddressComponentTextFieldCell *v4;
  CNAddressComponentTextFieldCell *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNAddressComponentTextFieldCell;
  v4 = -[NUITableViewContainerCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNAddressComponentTextFieldCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[CNAddressComponentTextFieldCell setupTextFields](v5, "setupTextFields");
    -[CNAddressComponentTextFieldCell contentSizeCategoryDidChange:](v5, "contentSizeCategoryDidChange:", 0);
    -[NUITableViewContainerCell containerView](v5, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAxis:", 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  return v5;
}

- (void)setupTextFields
{
  id v3;
  void *v4;
  id v5;

  v3 = -[CNAddressComponentTextFieldCell newTextField](self, "newTextField");
  -[CNAddressComponentTextFieldCell setTextField:](self, "setTextField:", v3);

  -[NUITableViewContainerCell containerView](self, "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAddressComponentTextFieldCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addArrangedSubview:", v4);

}

- (void)prepareForReuse
{
  double v2;
  void *v4;
  objc_super v5;

  self->_showsChevron = 0;
  LODWORD(v2) = 1148846080;
  -[UIImageView setLayoutSize:withContentPriority:](self->_chevron, "setLayoutSize:withContentPriority:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v2);
  -[UIImageView setHidden:](self->_chevron, "setHidden:", 1);
  -[CNAddressComponentTextFieldCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[CNAddressComponentTextFieldCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)CNAddressComponentTextFieldCell;
  -[CNAddressComponentTextFieldCell prepareForReuse](&v5, sel_prepareForReuse);
}

- (id)newTextField
{
  CNTextField *v2;
  CNTextField *v3;
  void *v4;

  v2 = [CNTextField alloc];
  v3 = -[CNTextField initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNTextField setClearButtonMode:](v3, "setClearButtonMode:", 0);
  -[CNTextField textInputTraits](v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnKeyGoesToNextResponder:", 1);

  -[UITextField _cnui_applyContactStyle](v3, "_cnui_applyContactStyle");
  return v3;
}

- (void)updateMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = *MEMORY[0x1E0DC3298];
  v4 = *(double *)(MEMORY[0x1E0DC3298] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  if (!objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
    v4 = 16.0;
  -[NUITableViewContainerCell containerView](self, "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDirectionalLayoutMargins:", v3, v4, v5, v6);

}

- (UIImageView)chevron
{
  UIImageView *chevron;
  void *v4;
  UIImageView *v5;
  UIImageView *v6;
  double v7;

  chevron = self->_chevron;
  if (!chevron)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageForContactCardChevron");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
    v6 = self->_chevron;
    self->_chevron = v5;

    -[UIImageView setContentMode:](self->_chevron, "setContentMode:", 1);
    LODWORD(v7) = 1148846080;
    -[UIImageView setLayoutSize:withContentPriority:](self->_chevron, "setLayoutSize:withContentPriority:", *MEMORY[0x1E0CFAA88], *(double *)(MEMORY[0x1E0CFAA88] + 8), v7);
    -[UIImageView setDirectionalLayoutMargins:](self->_chevron, "setDirectionalLayoutMargins:", *MEMORY[0x1E0DC3298], 8.0, *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));

    chevron = self->_chevron;
  }
  return chevron;
}

- (void)setShowsChevron:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v3 = a3;
  v12[2] = *MEMORY[0x1E0C80C00];
  self->_showsChevron = a3;
  -[CNAddressComponentTextFieldCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
    {
      LODWORD(v6) = 1148846080;
      -[UIImageView setLayoutSize:withContentPriority:](self->_chevron, "setLayoutSize:withContentPriority:", *MEMORY[0x1E0CFAA88], *(double *)(MEMORY[0x1E0CFAA88] + 8), v6);
      -[UIImageView setHidden:](self->_chevron, "setHidden:", 0);
      -[CNAddressComponentTextFieldCell textField](self, "textField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v7;
      -[CNAddressComponentTextFieldCell chevron](self, "chevron");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUITableViewContainerCell containerView](self, "containerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setArrangedSubviews:", v9);

    }
    else
    {
      -[CNAddressComponentTextFieldCell textField](self, "textField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUITableViewContainerCell containerView](self, "containerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setArrangedSubviews:", v8);
    }

  }
}

- (NSArray)textFields
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[CNAddressComponentTextFieldCell textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTextAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNAddressComponentTextFieldCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ab_textAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[CNAddressComponentTextFieldCell textField](self, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAb_textAttributes:", v7);

  }
}

- (NSDictionary)textAttributes
{
  void *v2;
  void *v3;

  -[CNAddressComponentTextFieldCell textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ab_textAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)showsChevron
{
  return self->_showsChevron;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (void)setChevron:(id)a3
{
  objc_storeStrong((id *)&self->_chevron, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

+ (Class)containerViewClass
{
  return (Class)objc_opt_class();
}

+ (id)cellIdentifier
{
  return CFSTR("CNAddressComponentTextFieldCell");
}

@end
