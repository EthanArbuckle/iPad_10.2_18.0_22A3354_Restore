@implementation CNStarkContactInfoViewController

- (CNStarkContactInfoViewController)init
{
  CNStarkContactInfoViewController *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNStarkContactInfoViewController)initWithCoder:(id)a3
{
  id v4;
  CNStarkContactInfoViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNInitializerUnavailableException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (CNStarkContactInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  CNStarkContactInfoViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNInitializerUnavailableException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (CNStarkContactInfoViewController)initWithContact:(id)a3
{
  id v5;
  CNStarkContactInfoViewController *v6;
  UILabel *v7;
  UILabel *primaryLabel;
  UILabel *v9;
  UILabel *secondaryLabel;
  UIStackView *v11;
  UIStackView *stackView;
  CNContactGeminiView *v13;
  uint64_t v14;
  CNContactGeminiView *contactGeminiView;
  CNUIGeminiDataSource *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CNUIGeminiDataSource *geminiDataSource;
  CNStarkContactInfoViewController *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNStarkContactInfoViewController;
  v6 = -[CNStarkContactInfoViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryLabel = v6->_primaryLabel;
    v6->_primaryLabel = v7;

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryLabel = v6->_secondaryLabel;
    v6->_secondaryLabel = v9;

    v11 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    stackView = v6->_stackView;
    v6->_stackView = v11;

    if (objc_msgSend(MEMORY[0x1E0C97310], "deviceSupportsGemini"))
    {
      v13 = [CNContactGeminiView alloc];
      v14 = -[CNContactGeminiView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      contactGeminiView = v6->_contactGeminiView;
      v6->_contactGeminiView = (CNContactGeminiView *)v14;

      v16 = [CNUIGeminiDataSource alloc];
      +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "geminiManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[CNUIGeminiDataSource initWithGeminiManager:](v16, "initWithGeminiManager:", v18);
      geminiDataSource = v6->_geminiDataSource;
      v6->_geminiDataSource = (CNUIGeminiDataSource *)v19;

      -[CNUIGeminiDataSource setDelegate:](v6->_geminiDataSource, "setDelegate:", v6);
      -[CNUIGeminiDataSource setContact:](v6->_geminiDataSource, "setContact:", v5);
    }
    objc_storeStrong((id *)&v6->_contact, a3);
    v21 = v6;
  }

  return v6;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNStarkContactInfoViewController;
  -[CNStarkContactInfoViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNStarkContactInfoViewController setupViews](self, "setupViews");
  -[CNStarkContactInfoViewController updateViews](self, "updateViews");
}

- (void)setupViews
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
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 1);

  -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);

  +[CNUIFontRepository carPlayContactInfoViewPrimaryLabelFont](CNUIFontRepository, "carPlayContactInfoViewPrimaryLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  +[CNUIColorRepository carPlayContactInfoViewPrimaryLabelTextColor](CNUIColorRepository, "carPlayContactInfoViewPrimaryLabelTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsAccessibilityElement:", 0);

  -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextAlignment:", 4);

  -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 1);

  -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);

  +[CNUIFontRepository carPlayContactInfoViewSecondaryLabelFont](CNUIFontRepository, "carPlayContactInfoViewSecondaryLabelFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v15);

  +[CNUIColorRepository carPlayContactInfoViewSecondaryLabelTextColor](CNUIColorRepository, "carPlayContactInfoViewSecondaryLabelTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIsAccessibilityElement:", 0);

  -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextAlignment:", 4);

  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlignment:", 1);

  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDistribution:", 3);

  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAxis:", 1);

  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBaselineRelativeArrangement:", 1);

  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSpacing:", 20.0);

  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addArrangedSubview:", v28);

  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addArrangedSubview:", v30);

  -[CNStarkContactInfoViewController contactGeminiView](self, "contactGeminiView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[CNStarkContactInfoViewController contactGeminiView](self, "contactGeminiView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNStarkContactInfoViewController contactGeminiView](self, "contactGeminiView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setUserInteractionEnabled:", 0);

    -[CNStarkContactInfoViewController contactGeminiView](self, "contactGeminiView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAllowsPickerActions:", 0);

    -[CNStarkContactInfoViewController geminiResult](self, "geminiResult");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactInfoViewController contactGeminiView](self, "contactGeminiView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setGeminiResult:", v35);

    v45[0] = *MEMORY[0x1E0DC1138];
    +[CNUIFontRepository carPlayContactInfoViewSecondaryLabelFont](CNUIFontRepository, "carPlayContactInfoViewSecondaryLabelFont");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v37;
    v45[1] = *MEMORY[0x1E0DC1140];
    +[CNUIColorRepository carPlayContactInfoViewSecondaryLabelTextColor](CNUIColorRepository, "carPlayContactInfoViewSecondaryLabelTextColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactInfoViewController contactGeminiView](self, "contactGeminiView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAb_textAttributes:", v39);

    if (-[CNStarkContactInfoViewController shouldShowGemini](self, "shouldShowGemini"))
    {
      -[CNStarkContactInfoViewController stackView](self, "stackView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNStarkContactInfoViewController contactGeminiView](self, "contactGeminiView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addArrangedSubview:", v42);

    }
  }
  -[CNStarkContactInfoViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addSubview:", v44);

}

- (void)updateViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v3 = (void *)MEMORY[0x1E0C97218];
  -[CNStarkContactInfoViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromContact:style:", v4, 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  -[CNStarkContactInfoViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v22, "isEqualToString:", v6);
  -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "setText:", v6);

    -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityValue:", CFSTR("CNStarkContactCompanyLabel"));

    -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", 0);

    -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 0;
  }
  else
  {
    objc_msgSend(v8, "setText:", v22);

    -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessibilityValue:", CFSTR("CNStarkContactNameLabel"));

    -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v6);

    -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("CNStarkContactCompanyLabel");
  }
  objc_msgSend(v12, "setAccessibilityValue:", v14);

  -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    -[CNStarkContactInfoViewController stackView](self, "stackView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "insertArrangedSubview:atIndex:", v21, 1);

  }
  else
  {
    -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeFromSuperview");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNStarkContactInfoViewController;
  -[CNStarkContactInfoViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  +[CNUIFontRepository carPlayContactInfoViewPrimaryLabelFont](CNUIFontRepository, "carPlayContactInfoViewPrimaryLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController primaryLabel](self, "primaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  +[CNUIFontRepository carPlayContactInfoViewSecondaryLabelFont](CNUIFontRepository, "carPlayContactInfoViewSecondaryLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController secondaryLabel](self, "secondaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[CNStarkContactInfoViewController resetLayoutConstraints](self, "resetLayoutConstraints");
}

- (void)resetLayoutConstraints
{
  void *v3;
  void *v4;
  id v5;

  -[CNStarkContactInfoViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController layoutConstraints](self, "layoutConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints:", v4);

  -[CNStarkContactInfoViewController setLayoutConstraints:](self, "setLayoutConstraints:", 0);
  -[CNStarkContactInfoViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)updateViewConstraints
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactInfoViewController;
  -[CNStarkContactInfoViewController updateViewConstraints](&v5, sel_updateViewConstraints);
  v3 = *MEMORY[0x1E0D137F8];
  -[CNStarkContactInfoViewController layoutConstraints](self, "layoutConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((_DWORD)v3)
    -[CNStarkContactInfoViewController setupLayoutConstraints](self, "setupLayoutConstraints");
}

- (void)setupLayoutConstraints
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
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  -[CNStarkContactInfoViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  -[CNStarkContactInfoViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  -[CNStarkContactInfoViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v6;
  -[CNStarkContactInfoViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkContactInfoViewController setLayoutConstraints:](self, "setLayoutConstraints:", v14);
  -[CNStarkContactInfoViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController layoutConstraints](self, "layoutConstraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraints:", v13);

}

- (BOOL)shouldShowGemini
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CNStarkContactInfoViewController geminiResult](self, "geminiResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CNContactContentDisplayViewController shouldShowGeminiForResult:contact:](CNContactContentDisplayViewController, "shouldShowGeminiForResult:contact:", v3, v4);

  return v5;
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "geminiResult");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactInfoViewController setGeminiResult:](self, "setGeminiResult:", v7);
  -[CNStarkContactInfoViewController contactGeminiView](self, "contactGeminiView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGeminiResult:", v7);

  if (-[CNStarkContactInfoViewController shouldShowGemini](self, "shouldShowGemini"))
  {
    -[CNStarkContactInfoViewController stackView](self, "stackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactInfoViewController contactGeminiView](self, "contactGeminiView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addArrangedSubview:", v6);

  }
  else
  {
    -[CNStarkContactInfoViewController contactGeminiView](self, "contactGeminiView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");
  }

}

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  return self->_firstBaselineAnchor;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNContactGeminiView)contactGeminiView
{
  return self->_contactGeminiView;
}

- (void)setContactGeminiView:(id)a3
{
  objc_storeStrong((id *)&self->_contactGeminiView, a3);
}

- (CNUIGeminiDataSource)geminiDataSource
{
  return self->_geminiDataSource;
}

- (void)setGeminiDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_geminiDataSource, a3);
}

- (CNGeminiResult)geminiResult
{
  return self->_geminiResult;
}

- (void)setGeminiResult:(id)a3
{
  objc_storeStrong((id *)&self->_geminiResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geminiResult, 0);
  objc_storeStrong((id *)&self->_geminiDataSource, 0);
  objc_storeStrong((id *)&self->_contactGeminiView, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_firstBaselineAnchor, 0);
}

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C967B8];
  v8[0] = v3;
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v5, CFSTR("CNStarkNameViewController keys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNKeyDescriptor *)v6;
}

@end
