@implementation DKNotableUserDataCardCell

- (DKNotableUserDataCardCell)initWithTitle:(id)a3 subtitle:(id)a4 accessoryView:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  DKNotableUserDataCardCell *v15;
  DKNotableUserDataCardCell *v16;
  id *p_accessoryView;
  uint64_t v18;
  UILabel *titleLabel;
  void *v20;
  uint64_t v21;
  UILabel *subtitleLabel;
  void *v23;
  void *v24;
  uint64_t v25;
  UIStackView *labelContainer;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  objc_super v67;
  _QWORD v68[4];
  _QWORD v69[9];

  v69[7] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v67.receiver = self;
  v67.super_class = (Class)DKNotableUserDataCardCell;
  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v15 = -[DKNotableUserDataCardCell initWithFrame:](&v67, sel_initWithFrame_, *MEMORY[0x24BDBF090], v12, v13, v14);
  v16 = v15;
  if (v15)
  {
    v64 = v10;
    p_accessoryView = (id *)&v15->_accessoryView;
    objc_storeStrong((id *)&v15->_accessoryView, a5);
    objc_msgSend(*p_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v8)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v11, v12, v13, v14);
      titleLabel = v16->_titleLabel;
      v16->_titleLabel = (UILabel *)v18;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v16->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[DKNotableUserDataCardCell _titleFont](v16, "_titleFont");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v16->_titleLabel, "setFont:", v20);

      -[UILabel setText:](v16->_titleLabel, "setText:", v8);
      -[UILabel setNumberOfLines:](v16->_titleLabel, "setNumberOfLines:", 0);
    }
    v66 = v8;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v11, v12, v13, v14);
    subtitleLabel = v16->_subtitleLabel;
    v16->_subtitleLabel = (UILabel *)v21;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v16->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16->_subtitleLabel, "setTextColor:", v23);

    -[DKNotableUserDataCardCell _bodyFont](v16, "_bodyFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16->_subtitleLabel, "setFont:", v24);

    v65 = v9;
    -[UILabel setText:](v16->_subtitleLabel, "setText:", v9);
    -[UILabel setNumberOfLines:](v16->_subtitleLabel, "setNumberOfLines:", 0);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithFrame:", v11, v12, v13, v14);
    labelContainer = v16->_labelContainer;
    v16->_labelContainer = (UIStackView *)v25;

    -[UIStackView setAxis:](v16->_labelContainer, "setAxis:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v16->_labelContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v16->_labelContainer, "addArrangedSubview:", v16->_titleLabel);
    -[UIStackView addArrangedSubview:](v16->_labelContainer, "addArrangedSubview:", v16->_subtitleLabel);
    -[DKNotableUserDataCardCell addSubview:](v16, "addSubview:", v16->_labelContainer);
    if (*p_accessoryView)
    {
      -[DKNotableUserDataCardCell addSubview:](v16, "addSubview:");
      objc_msgSend(*p_accessoryView, "widthAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToConstant:", 40.0);
      v53 = objc_claimAutoreleasedReturnValue();
      v69[0] = v53;
      objc_msgSend(*p_accessoryView, "heightAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToConstant:", 40.0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v62;
      objc_msgSend(*p_accessoryView, "leadingAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKNotableUserDataCardCell leadingAnchor](v16, "leadingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:", v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v69[2] = v55;
      objc_msgSend(*p_accessoryView, "topAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKNotableUserDataCardCell topAnchor](v16, "topAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v51);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v69[3] = v50;
      -[UIStackView leadingAnchor](v16->_labelContainer, "leadingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_accessoryView, "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 14.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v69[4] = v27;
      -[UIStackView topAnchor](v16->_labelContainer, "topAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_accessoryView, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v69[5] = v30;
      -[UIStackView bottomAnchor](v16->_labelContainer, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_accessoryView, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v69[6] = v33;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 7);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKNotableUserDataCardCell addConstraints:](v16, "addConstraints:", v34);

      v35 = (void *)v53;
      v36 = v58;

      v37 = v54;
    }
    else
    {
      -[UIStackView leadingAnchor](v16->_labelContainer, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKNotableUserDataCardCell leadingAnchor](v16, "leadingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 54.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKNotableUserDataCardCell addConstraint:](v16, "addConstraint:", v37);
    }

    -[UIStackView trailingAnchor](v16->_labelContainer, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardCell trailingAnchor](v16, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v61);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v59;
    -[UIStackView centerYAnchor](v16->_labelContainer, "centerYAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardCell centerYAnchor](v16, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v39;
    -[UIStackView topAnchor](v16->_labelContainer, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardCell topAnchor](v16, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v42;
    -[UIStackView bottomAnchor](v16->_labelContainer, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardCell bottomAnchor](v16, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v68[3] = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardCell addConstraints:](v16, "addConstraints:", v46);

    v9 = v65;
    v8 = v66;
    v10 = v64;
  }

  return v16;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DKNotableUserDataCardCell;
  -[DKNotableUserDataCardCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  -[DKNotableUserDataCardCell _titleFont](self, "_titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKNotableUserDataCardCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[DKNotableUserDataCardCell _bodyFont](self, "_bodyFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKNotableUserDataCardCell subtitleLabel](self, "subtitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

}

- (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7810]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_stateFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_bodyFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7810]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_stateStackViewAxis
{
  void *v2;
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryView, a3);
}

- (UIStackView)labelContainer
{
  return self->_labelContainer;
}

- (void)setLabelContainer:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainer, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)stateLabel
{
  return self->_stateLabel;
}

- (void)setStateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_stateLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
