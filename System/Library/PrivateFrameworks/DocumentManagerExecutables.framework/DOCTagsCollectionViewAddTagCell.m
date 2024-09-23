@implementation DOCTagsCollectionViewAddTagCell

- (DOCTagsCollectionViewAddTagCell)initWithFrame:(CGRect)a3
{
  DOCTagsCollectionViewAddTagCell *v3;
  UILabel *v4;
  UILabel *addTagLabel;
  void *v6;
  void *v7;
  uint64_t v8;
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
  objc_super v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)DOCTagsCollectionViewAddTagCell;
  v3 = -[DOCTagsCollectionViewAddTagCell initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    addTagLabel = v3->_addTagLabel;
    v3->_addTagLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_addTagLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DOCTagsCollectionViewAddTagCell tintColor](v3, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_addTagLabel, "setTextColor:", v6);

    v7 = (void *)MEMORY[0x24BEBB520];
    v8 = *MEMORY[0x24BEBE1F0];
    -[DOCTagsCollectionViewAddTagCell traitCollection](v3, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_addTagLabel, "setFont:", v10);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_addTagLabel, "setAdjustsFontForContentSizeCategory:", 1);
    _DocumentManagerBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Add Tag [Action Title]"), CFSTR("Add Tag"), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_addTagLabel, "setText:", v12);

    -[DOCTagsCollectionViewAddTagCell contentView](v3, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionViewAddTagCell addTagLabel](v3, "addTagLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

    v25 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v13, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionViewAddTagCell addTagLabel](v3, "addTagLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    objc_msgSend(v13, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionViewAddTagCell addTagLabel](v3, "addTagLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v15;
    -[UILabel firstBaselineAnchor](v3->_addTagLabel, "firstBaselineAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v17, 0.727272727);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v18;
    objc_msgSend(v13, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v3->_addTagLabel, "lastBaselineAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v20, 0.52173913);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v22);

  }
  return v3;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCTagsCollectionViewAddTagCell;
  -[DOCTagsCollectionViewAddTagCell tintColorDidChange](&v5, sel_tintColorDidChange);
  -[DOCTagsCollectionViewAddTagCell tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagsCollectionViewAddTagCell addTagLabel](self, "addTagLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

}

- (UILabel)addTagLabel
{
  return self->_addTagLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addTagLabel, 0);
}

@end
