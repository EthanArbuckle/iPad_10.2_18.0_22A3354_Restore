@implementation HKMedicalIDEmergencyAccessLearnMoreCell

- (HKMedicalIDEmergencyAccessLearnMoreCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDEmergencyAccessLearnMoreCell *v4;
  HKMedicalIDEmergencyAccessLearnMoreCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDEmergencyAccessLearnMoreCell;
  v4 = -[HKMedicalIDEmergencyAccessLearnMoreCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKMedicalIDEmergencyAccessLearnMoreCell _setUpViews](v4, "_setUpViews");
    -[HKMedicalIDEmergencyAccessLearnMoreCell _addSubviews](v5, "_addSubviews");
    -[HKMedicalIDEmergencyAccessLearnMoreCell _setUpConstraints](v5, "_setUpConstraints");
  }
  return v5;
}

- (void)_setUpViews
{
  id v3;
  UIStackView *v4;
  UIStackView *itemsStackView;

  -[HKMedicalIDEmergencyAccessLearnMoreCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  itemsStackView = self->_itemsStackView;
  self->_itemsStackView = v4;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_itemsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](self->_itemsStackView, "setSpacing:", 20.0);
  -[UIStackView setAxis:](self->_itemsStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_itemsStackView, "setAlignment:", 0);
  -[UIStackView setDistribution:](self->_itemsStackView, "setDistribution:", 0);
}

- (void)_addSubviews
{
  id v3;

  -[HKMedicalIDEmergencyAccessLearnMoreCell contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_itemsStackView);

}

- (void)_setUpConstraints
{
  void *v3;
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
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView topAnchor](self->_itemsStackView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEmergencyAccessLearnMoreCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 16.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  -[UIStackView leadingAnchor](self->_itemsStackView, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEmergencyAccessLearnMoreCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v13, 16.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v3;
  -[UIStackView trailingAnchor](self->_itemsStackView, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEmergencyAccessLearnMoreCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, -16.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  -[UIStackView bottomAnchor](self->_itemsStackView, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEmergencyAccessLearnMoreCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -16.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v12);

}

- (id)_makeTextView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v3, "setScrollEnabled:", 0);
  objc_msgSend(v3, "setBounces:", 0);
  objc_msgSend(v3, "setEditable:", 0);
  objc_msgSend(v3, "_setInteractiveTextSelectionDisabled:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  return v3;
}

- (void)setItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  HKMedicalIDEmergencyAccessLearnMoreCell *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v37 = self;
  -[UIStackView arrangedSubviews](self->_itemsStackView, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "removeFromSuperview");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v4;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v38)
  {
    v36 = *(_QWORD *)v43;
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v35 = *MEMORY[0x1E0DC4B58];
    v34 = *MEMORY[0x1E0DC1140];
    v33 = *MEMORY[0x1E0DC4A88];
    v14 = *MEMORY[0x1E0DC1138];
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v43 != v36)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithFrame:", v10, v11, v12, v13);
        objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v17, "setSpacing:", 0.0);
        objc_msgSend(v17, "setAxis:", 1);
        objc_msgSend(v17, "setAlignment:", 0);
        objc_msgSend(v17, "setDistribution:", 0);
        -[HKMedicalIDEmergencyAccessLearnMoreCell _makeTextView](v37, "_makeTextView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v35);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fontDescriptorWithSymbolicTraits:", 2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v41, 0.0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = v34;
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = v14;
        v53[0] = v20;
        v53[1] = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_alloc(MEMORY[0x1E0CB3498]);
        v22 = v16;
        objc_msgSend(v16, "title");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v21, "initWithString:attributes:", v23, v39);
        objc_msgSend(v18, "setAttributedText:", v24);

        objc_msgSend(v17, "addArrangedSubview:", v18);
        -[HKMedicalIDEmergencyAccessLearnMoreCell _makeTextView](v37, "_makeTextView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v34;
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v14;
        v51[0] = v26;
        objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v22, "body");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithString:attributes:", v30, v28);
        objc_msgSend(v25, "setAttributedText:", v31);

        objc_msgSend(v17, "addArrangedSubview:", v25);
        -[UIStackView addArrangedSubview:](v37->_itemsStackView, "addArrangedSubview:", v17);

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v38);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsStackView, 0);
}

@end
