@implementation CNContactTableViewHeaderFooterView

- (CNContactTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  CNContactTableViewHeaderFooterView *v3;
  id v4;
  uint64_t v5;
  UILabel *titleLabel;
  double v7;
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
  CNContactTableViewHeaderFooterView *v19;
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
  objc_super v35;
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)CNContactTableViewHeaderFooterView;
  v3 = -[CNContactTableViewHeaderFooterView initWithReuseIdentifier:](&v35, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v7) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    -[CNContactTableViewHeaderFooterView contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_titleLabel);

    -[CNContactTableViewHeaderFooterView contentView](v3, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactTableViewHeaderFooterView contentView](v3, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layoutMarginsGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v29;
    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactTableViewHeaderFooterView contentView](v3, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutMarginsGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v24;
    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactTableViewHeaderFooterView contentView](v3, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutMarginsGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v10;
    -[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactTableViewHeaderFooterView contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addConstraints:", v16);

    -[CNContactTableViewHeaderFooterView textLabel](v3, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v18);

    v19 = v3;
  }

  return v3;
}

- (void)setAttributedString:(id)a3
{
  void *v5;
  void *v6;
  NSAttributedString *v7;

  v7 = (NSAttributedString *)a3;
  if (self->_attributedString != v7)
  {
    objc_storeStrong((id *)&self->_attributedString, a3);
    -[CNContactTableViewHeaderFooterView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedText:", v7);

    -[CNContactTableViewHeaderFooterView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeToFit");

    -[CNContactTableViewHeaderFooterView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
