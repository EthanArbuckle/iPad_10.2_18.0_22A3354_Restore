@implementation CNContactListDuplicatesBannerView

- (CNContactListDuplicatesBannerView)initWithDuplicatesCount:(int64_t)a3
{
  CNContactListDuplicatesBannerView *v4;
  CNContactListDuplicatesBannerView *v5;
  CNContactListDuplicatesBannerView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNContactListDuplicatesBannerView;
  v4 = -[CNContactListDuplicatesBannerView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_duplicatesCount = a3;
    -[CNContactListDuplicatesBannerView setupSubviews](v4, "setupSubviews");
    v6 = v5;
  }

  return v5;
}

- (void)setDuplicatesCount:(int64_t)a3
{
  void *v4;
  id v5;

  if (self->_duplicatesCount != a3)
  {
    self->_duplicatesCount = a3;
    -[CNContactListDuplicatesBannerView countStringForLocalizedStringKey:count:](self, "countStringForLocalizedStringKey:count:", CFSTR("DUPLICATES_COUNT"), a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactListDuplicatesBannerView titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v5);

  }
}

- (void)setupSubviews
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  double v34;
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
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  CNContactListDuplicatesBannerView *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[2];
  _QWORD v93[7];
  _QWORD v94[3];
  _QWORD v95[4];

  v95[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListDuplicatesBannerView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[CNContactListDuplicatesBannerView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 12.0);

  v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[CNContactListDuplicatesBannerView countStringForLocalizedStringKey:count:](self, "countStringForLocalizedStringKey:count:", CFSTR("DUPLICATES_COUNT"), self->_duplicatesCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  v8 = v5;
  v84 = v5;
  -[CNContactListDuplicatesBannerView setTitleLabel:](self, "setTitleLabel:", v5);
  v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DUPLICATES_FOUND_HINT"), &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v11);

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B08]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v86, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v14);

  objc_msgSend(v9, "setNumberOfLines:", 0);
  v83 = v9;
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
  v15 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v16 = (void *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  v18 = v16;
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = objc_alloc_init(MEMORY[0x1E0DC3518]);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("DUPLICATES_FOUND_ACTION"), &stru_1E20507A8, CFSTR("Localized"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v22);

  v23 = *MEMORY[0x1E0DC3298];
  v24 = *(double *)(MEMORY[0x1E0DC3298] + 8);
  v25 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  v26 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  v85 = v20;
  objc_msgSend(v20, "setContentInsets:", *MEMORY[0x1E0DC3298], v24, v25, v26);
  objc_msgSend(v19, "setConfiguration:", v20);
  v27 = v19;
  v82 = v19;
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_didTapViewDuplicates, 64);
  v28 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v28, "setAxis:", 1);
  objc_msgSend(v28, "setAlignment:", 0);
  v95[0] = v8;
  v95[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __50__CNContactListDuplicatesBannerView_setupSubviews__block_invoke;
  v90[3] = &unk_1E204E100;
  v91 = v28;
  v81 = v28;
  objc_msgSend(v29, "_cn_each:", v90);

  v31 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v31, "setAxis:", 1);
  objc_msgSend(v31, "setAlignment:", 1);
  objc_msgSend(v31, "setSpacing:", 10.0);
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v94[0] = v81;
  v94[1] = v18;
  v94[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v30;
  v88[1] = 3221225472;
  v88[2] = __50__CNContactListDuplicatesBannerView_setupSubviews__block_invoke_2;
  v88[3] = &unk_1E204E100;
  v89 = v31;
  v33 = v31;
  objc_msgSend(v32, "_cn_each:", v88);

  -[CNContactListDuplicatesBannerView addSubview:](self, "addSubview:", v33);
  v66 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v33, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListDuplicatesBannerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, 4.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v74;
  objc_msgSend(v33, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListDuplicatesBannerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, -4.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v70;
  objc_msgSend(v33, "topAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = self;
  -[CNContactListDuplicatesBannerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 4.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = v65;
  objc_msgSend(v33, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListDuplicatesBannerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, -4.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = v61;
  objc_msgSend(v18, "heightAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "scale");
  objc_msgSend(v59, "constraintEqualToConstant:", 1.0 / v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = v35;
  v80 = v18;
  objc_msgSend(v18, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v33;
  objc_msgSend(v33, "layoutMarginsGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v93[5] = v39;
  objc_msgSend(v18, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutMarginsGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v93[6] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "activateConstraints:", v44);

  v45 = objc_alloc_init(MEMORY[0x1E0DC3518]);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x1E0DC3870];
  v48 = *MEMORY[0x1E0DC4CD8];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", CFSTR("xmark"), v48, 4, v49, 1, *MEMORY[0x1E0DC4A88]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setImage:", v50);

  objc_msgSend(v46, "setContentInsets:", v23, v24, v25, v26);
  objc_msgSend(v45, "setConfiguration:", v46);
  objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v45, "addTarget:action:forControlEvents:", v79, sel_didTapDismiss, 64);
  -[CNContactListDuplicatesBannerView addSubview:](v79, "addSubview:", v45);
  v78 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v45, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v53;
  objc_msgSend(v45, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListDuplicatesBannerView layoutMarginsGuide](v79, "layoutMarginsGuide");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "activateConstraints:", v58);

}

- (id)countStringForLocalizedStringKey:(id)a3 count:(int64_t)a4
{
  id v5;
  id v6;
  void (**v7)(void);
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v13;
  int64_t v14;

  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__CNContactListDuplicatesBannerView_countStringForLocalizedStringKey_count___block_invoke;
  aBlock[3] = &unk_1E204E128;
  v13 = v5;
  v14 = a4;
  v6 = v5;
  v7 = (void (**)(void))_Block_copy(aBlock);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v7[2]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)didTapDismiss
{
  id v3;

  -[CNContactListDuplicatesBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duplicatesBannerViewDidTapDismiss:", self);

}

- (void)didTapViewDuplicates
{
  id v3;

  -[CNContactListDuplicatesBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duplicatesBannerViewDidTapViewDuplicates:", self);

}

- (int64_t)duplicatesCount
{
  return self->_duplicatesCount;
}

- (CNContactListDuplicatesBannerViewDelegate)delegate
{
  return (CNContactListDuplicatesBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

id __76__CNContactListDuplicatesBannerView_countStringForLocalizedStringKey_count___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[CNNumberFormatting localizedStringWithInteger:](CNNumberFormatting, "localizedStringWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", *(_QWORD *)(a1 + 32), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, *(_QWORD *)(a1 + 40), v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __50__CNContactListDuplicatesBannerView_setupSubviews__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addArrangedSubview:", a2);
}

uint64_t __50__CNContactListDuplicatesBannerView_setupSubviews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addArrangedSubview:", a2);
}

@end
