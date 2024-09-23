@implementation CNContactListLimitedAccessTipView

- (CNContactListLimitedAccessTipView)initWithAppName:(id)a3 isLimited:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CNContactListLimitedAccessTipView *v7;
  CNContactListLimitedAccessTipView *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  CNContactListLimitedAccessTipView *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  CNContactListLimitedAccessTipView *v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  objc_super v108;
  _QWORD v109[7];
  _QWORD v110[2];
  _QWORD v111[4];

  v4 = a4;
  v111[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v108.receiver = self;
  v108.super_class = (Class)CNContactListLimitedAccessTipView;
  v7 = -[CNContactListLimitedAccessTipView initWithFrame:](&v108, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    -[CNContactListLimitedAccessTipView layer](v7, "layer");
    v103 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 12.0);

    -[CNContactListLimitedAccessTipView setClipsToBounds:](v103, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListLimitedAccessTipView setBackgroundColor:](v103, "setBackgroundColor:", v10);

    v11 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    CNContactsUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v4)
      v14 = CFSTR("LIMITED_TIP");
    else
      v14 = CFSTR("PRIVATE_TIP");
    if (v4)
      v15 = CFSTR("LIMITED_TIP_HINT");
    else
      v15 = CFSTR("PRIVATE_TIP_HINT");
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E20507A8, CFSTR("Localized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v16);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v17);

    objc_msgSend(v11, "setNumberOfLines:", 0);
    objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);
    v18 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v19 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", v15, &stru_1E20507A8, CFSTR("Localized"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v21, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v22);

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B08]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v101, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v24);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v25);

    objc_msgSend(v18, "setNumberOfLines:", 0);
    v100 = v18;
    objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 1);
    v26 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v26, "setAxis:", 1);
    objc_msgSend(v26, "setAlignment:", 0);
    v27 = v11;
    v98 = v11;
    v111[0] = v11;
    v111[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 2);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v106[0] = MEMORY[0x1E0C809B0];
    v106[1] = 3221225472;
    v106[2] = __63__CNContactListLimitedAccessTipView_initWithAppName_isLimited___block_invoke;
    v106[3] = &unk_1E204E100;
    v107 = v26;
    v29 = v26;
    objc_msgSend(v99, "_cn_each:", v106);
    objc_msgSend(v29, "setSpacing:", 8.0);
    v93 = v29;
    objc_msgSend(v29, "setCustomSpacing:afterView:", v27, 5.0);
    v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", CFSTR("com.apple.MobileAddressBook"));
    v30 = objc_alloc(MEMORY[0x1E0D3A830]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scale");
    v96 = (void *)objc_msgSend(v30, "initWithSize:scale:", 30.0, 30.0, v32);

    objc_msgSend(v97, "prepareImageForDescriptor:", v96);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0DC3870];
    v34 = objc_msgSend(v95, "CGImage");
    objc_msgSend(v95, "scale");
    objc_msgSend(v33, "imageWithCGImage:scale:orientation:", v34, 0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v94);
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v36) = 1144750080;
    objc_msgSend(v35, "setContentHuggingPriority:forAxis:", 0, v36);
    LODWORD(v37) = 1148846080;
    objc_msgSend(v35, "setContentCompressionResistancePriority:forAxis:", 0, v37);
    objc_msgSend(v35, "setContentMode:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v39 = objc_msgSend(v38, "CGColor");
    objc_msgSend(v35, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setShadowColor:", v39);

    objc_msgSend(v35, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = 1041865114;
    objc_msgSend(v41, "setShadowOpacity:", v42);

    v43 = *MEMORY[0x1E0C9D820];
    v44 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v35, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setShadowOffset:", v43, v44);

    objc_msgSend(v35, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setShadowRadius:", 1.0);

    v47 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v47, "setAxis:", 0);
    objc_msgSend(v47, "setAlignment:", 1);
    objc_msgSend(v47, "setSpacing:", 11.0);
    objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v110[0] = v35;
    v110[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = v28;
    v104[1] = 3221225472;
    v104[2] = __63__CNContactListLimitedAccessTipView_initWithAppName_isLimited___block_invoke_2;
    v104[3] = &unk_1E204E100;
    v105 = v47;
    v49 = v47;
    objc_msgSend(v48, "_cn_each:", v104);

    v50 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "configurationWithHierarchicalColor:", v51);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setContentInsets:", 2.0, 2.0, 2.0, 2.0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", (uint64_t)*MEMORY[0x1E0DC1448], 15.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "configurationByApplyingConfiguration:", v92);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setPreferredSymbolConfigurationForImage:", v54);

    v91 = v52;
    objc_msgSend(v52, "setButtonSize:", 1);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setImage:", v55);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v52, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v57) = 1148846080;
    objc_msgSend(v56, "setContentHuggingPriority:forAxis:", 0, v57);
    LODWORD(v58) = 1148846080;
    objc_msgSend(v56, "setContentCompressionResistancePriority:forAxis:", 0, v58);
    objc_msgSend(v56, "setPreferredBehavioralStyle:", 1);
    objc_msgSend(v56, "addTarget:action:forControlEvents:", v103, sel_didTapDismiss, 64);
    -[CNContactListLimitedAccessTipView addSubview:](v103, "addSubview:", v49);
    -[CNContactListLimitedAccessTipView addSubview:](v103, "addSubview:", v56);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListLimitedAccessTipView layoutMarginsGuide](v103, "layoutMarginsGuide");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:constant:", v88, 4.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = v87;
    objc_msgSend(v49, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListLimitedAccessTipView layoutMarginsGuide](v103, "layoutMarginsGuide");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "trailingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v83, -4.0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v109[1] = v82;
    objc_msgSend(v49, "topAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListLimitedAccessTipView layoutMarginsGuide](v103, "layoutMarginsGuide");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:constant:", v78, 4.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v109[2] = v77;
    v81 = v49;
    objc_msgSend(v49, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListLimitedAccessTipView layoutMarginsGuide](v103, "layoutMarginsGuide");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:constant:", v74, -4.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v109[3] = v73;
    v84 = v35;
    objc_msgSend(v35, "widthAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "heightAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v109[4] = v70;
    objc_msgSend(v56, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v109[5] = v61;
    objc_msgSend(v56, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListLimitedAccessTipView layoutMarginsGuide](v103, "layoutMarginsGuide");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v64);
    v65 = v6;
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v109[6] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 7);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObjectsFromArray:", v67);

    v6 = v65;
    v8 = v103;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v102);
    v68 = v103;

  }
  return v8;
}

- (void)didTapDismiss
{
  id v3;

  -[CNContactListLimitedAccessTipView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "limitedAccessTipViewDidTapDismiss:", self);

}

- (CNContactListLimitedAccessTipViewDelegate)delegate
{
  return (CNContactListLimitedAccessTipViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __63__CNContactListLimitedAccessTipView_initWithAppName_isLimited___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addArrangedSubview:", a2);
}

uint64_t __63__CNContactListLimitedAccessTipView_initWithAppName_isLimited___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addArrangedSubview:", a2);
}

@end
