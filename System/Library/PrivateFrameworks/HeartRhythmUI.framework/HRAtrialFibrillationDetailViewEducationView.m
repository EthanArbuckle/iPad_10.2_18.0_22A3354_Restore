@implementation HRAtrialFibrillationDetailViewEducationView

- (HRAtrialFibrillationDetailViewEducationView)init
{
  HRAtrialFibrillationDetailViewEducationView *v2;
  HRAtrialFibrillationDetailViewEducationView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HRAtrialFibrillationDetailViewEducationView;
  v2 = -[HRAtrialFibrillationDetailViewEducationView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v3 = v2;
  if (v2)
    -[HRAtrialFibrillationDetailViewEducationView _setupUI](v2, "_setupUI");
  return v3;
}

- (void)_setupUI
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
  id v34;

  objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDetailViewEducationView setBackgroundColor:](self, "setBackgroundColor:", v3);

  HRHeartRhythmUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETAIL_EDUCATION_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDetailViewEducationView _labelWithText:fontTextStyle:symbolicTraits:](self, "_labelWithText:fontTextStyle:symbolicTraits:", v5, *MEMORY[0x24BDF7848], 2);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  -[HRAtrialFibrillationDetailViewEducationView addSubview:](self, "addSubview:", v34);
  objc_msgSend(v34, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDetailViewEducationView layoutMarginsGuide](self, "layoutMarginsGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, 12.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HRAtrialFibrillationDetailViewEducationView layoutMarginsGuide](self, "layoutMarginsGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 12.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(v34, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDetailViewEducationView topAnchor](self, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 22.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  HRHeartRhythmUIFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETAIL_EDUCATION_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDetailViewEducationView _labelWithText:fontTextStyle:symbolicTraits:](self, "_labelWithText:fontTextStyle:symbolicTraits:", v18, *MEMORY[0x24BDF77B0], 0x8000);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HRAtrialFibrillationDetailViewEducationView addSubview:](self, "addSubview:", v19);
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationDetailViewEducationView layoutMarginsGuide](self, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 12.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HRAtrialFibrillationDetailViewEducationView layoutMarginsGuide](self, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 12.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  objc_msgSend(v19, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 12.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[HRAtrialFibrillationDetailViewEducationView bottomAnchor](self, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 16.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

}

- (id)_labelWithText:(id)a3 fontTextStyle:(id)a4 symbolicTraits:(unsigned int)a5
{
  uint64_t v5;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = *(_QWORD *)&a5;
  v7 = (objc_class *)MEMORY[0x24BDF6B68];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v9);

  v12 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v12, "setParagraphSpacing:", 10.0);
  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v12, 0, objc_msgSend(v11, "length"));
  objc_msgSend(v10, "setAttributedText:", v11);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v13);

  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v10, "setTextAlignment:", 4);
  objc_msgSend(v10, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v8, v5, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v15);

  return v10;
}

@end
