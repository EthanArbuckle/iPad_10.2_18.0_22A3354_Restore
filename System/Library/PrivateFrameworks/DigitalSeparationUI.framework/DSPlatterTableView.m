@implementation DSPlatterTableView

- (DSPlatterTableView)initWithController:(id)a3 color:(id)a4 softCorner:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  DSPlatterTableView *v10;
  os_log_t v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  _QWORD v17[2];

  v5 = a5;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DSPlatterTableView;
  v10 = -[DSPlatterTableView init](&v16, sel_init);
  if (v10)
  {
    v11 = os_log_create("com.apple.DigitalSeparation", "DSPlatterTableView");
    v12 = (void *)DSLog_6;
    DSLog_6 = (uint64_t)v11;

    -[DSPlatterTableView setPresentingViewController:](v10, "setPresentingViewController:", v8);
    -[DSPlatterTableView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DSPlatterTableView _pinBackgroundColor:cornerRadius:](v10, "_pinBackgroundColor:cornerRadius:", v9, v5);
    v17[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)-[DSPlatterTableView registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v13, sel__updateAppearanceForTraitCollectionChange);

  }
  return v10;
}

- (double)preferredHeight
{
  double v2;

  -[DSPlatterTableView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
  return v2;
}

+ (id)bannerWithPresentingViewController:(id)a3
{
  id v3;
  DSPlatterTableView *v4;
  void *v5;
  DSPlatterTableView *v6;
  double v7;
  double v8;
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

  v3 = a3;
  v4 = [DSPlatterTableView alloc];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DSPlatterTableView initWithController:color:softCorner:](v4, "initWithController:color:softCorner:", v3, v5, 0);

  LODWORD(v7) = 12.0;
  LODWORD(v8) = 0;
  -[DSPlatterTableView contentWithAlignment:axis:imageSeparator:textSeparator:textAlignment:](v6, "contentWithAlignment:axis:imageSeparator:textSeparator:textAlignment:", 0, 0, 4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView addSubview:](v6, "addSubview:", v9);
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView topAnchor](v6, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 16.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_msgSend(v9, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView bottomAnchor](v6, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -16.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v9, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView leadingAnchor](v6, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 16.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  objc_msgSend(v9, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView trailingAnchor](v6, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -16.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  return v6;
}

+ (id)cellWithPresentingViewController:(id)a3
{
  id v3;
  DSPlatterTableView *v4;
  void *v5;
  DSPlatterTableView *v6;
  double v7;
  double v8;
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

  v3 = a3;
  v4 = [DSPlatterTableView alloc];
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DSPlatterTableView initWithController:color:softCorner:](v4, "initWithController:color:softCorner:", v3, v5, 1);

  LODWORD(v7) = 8.0;
  LODWORD(v8) = 2.0;
  -[DSPlatterTableView contentWithAlignment:axis:imageSeparator:textSeparator:textAlignment:](v6, "contentWithAlignment:axis:imageSeparator:textSeparator:textAlignment:", 3, 1, 1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView addSubview:](v6, "addSubview:", v9);
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView topAnchor](v6, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 16.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_msgSend(v9, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView bottomAnchor](v6, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -16.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v9, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView leadingAnchor](v6, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 16.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  objc_msgSend(v9, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView trailingAnchor](v6, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -16.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  return v6;
}

- (void)_pinBackgroundColor:(id)a3 cornerRadius:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v6;
  id v7;
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
  id v21;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x24BEBDB00];
  v7 = a3;
  v21 = objc_alloc_init(v6);
  objc_msgSend(v21, "setBackgroundColor:", v7);

  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (v4)
  {
    objc_msgSend(v21, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 8.0);

  }
  -[DSPlatterTableView addSubview:](self, "addSubview:", v21);
  objc_msgSend(v21, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView topAnchor](self, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v21, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView bottomAnchor](self, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  objc_msgSend(v21, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView leadingAnchor](self, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(v21, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView trailingAnchor](self, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

}

- (id)contentWithAlignment:(int64_t)a3 axis:(int64_t)a4 imageSeparator:(float)a5 textSeparator:(float)a6 textAlignment:(int64_t)a7
{
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
  double v23;
  void *v24;

  -[DSPlatterTableView stackWithAlignment:axis:](self, "stackWithAlignment:axis:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  -[DSPlatterTableView setImageView:](self, "setImageView:", v13);

  -[DSPlatterTableView imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentMode:", 4);

  -[DSPlatterTableView imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DSPlatterTableView _lockImage](self, "_lockImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:", v16);

  -[DSPlatterTableView imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addArrangedSubview:", v18);

  -[DSPlatterTableView imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCustomSpacing:afterView:", v19, a5);

  -[DSPlatterTableView imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 34.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  *(float *)&v23 = a6;
  -[DSPlatterTableView platterTextWithAlignment:stackAlignment:customSpacing:](self, "platterTextWithAlignment:stackAlignment:customSpacing:", a7, a3, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addArrangedSubview:", v24);

  return v12;
}

- (id)_lockImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 34.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBD640];
  DSUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:withConfiguration:", CFSTR("lock.and.ring.2"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSPlatterTableView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  if (v8 == 2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTintColor:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }

  return v6;
}

- (id)platterTextWithAlignment:(int64_t)a3 stackAlignment:(int64_t)a4 customSpacing:(float)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[DSPlatterTableView stackWithAlignment:axis:](self, "stackWithAlignment:axis:", a4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v9, "setNumberOfLines:", 0);
  DSUIDTOLocStringForKey(CFSTR("WARNING_PLATTER_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView attributedTextWithString:alignment:style:bold:](self, "attributedTextWithString:alignment:style:bold:", v10, a3, *MEMORY[0x24BEBE220], 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v11);

  objc_msgSend(v8, "addArrangedSubview:", v9);
  objc_msgSend(v8, "setCustomSpacing:afterView:", v9, a5);
  -[DSPlatterTableView _descriptionWithAlignment:](self, "_descriptionWithAlignment:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addArrangedSubview:", v12);

  return v8;
}

- (id)_descriptionWithAlignment:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  DSUIDTOLocStringForKey(CFSTR("WARNING_PLATTER_BODY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView attributedTextWithString:alignment:style:bold:](self, "attributedTextWithString:alignment:style:bold:", v5, a3, *MEMORY[0x24BEBE1F0], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  DSUIDTOLocStringForKey(CFSTR("WARNING_PLATTER_LEARN_MORE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeOfString:", v7);
  v11 = v10;

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = DSLog_6;
    if (os_log_type_enabled((os_log_t)DSLog_6, OS_LOG_TYPE_ERROR))
      -[DSPlatterTableView _descriptionWithAlignment:].cold.1(v12);
    v13 = objc_msgSend(v6, "length");
    v9 = v13 - objc_msgSend(v7, "length");
    v11 = objc_msgSend(v7, "length");
  }
  v14 = *MEMORY[0x24BEBD288];
  DSUIDTOLocStringForKey(CFSTR("WARNING_PLATTER_LEARN_MORE_URL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttribute:value:range:", v14, v15, v9, v11);

  v16 = *MEMORY[0x24BEBD278];
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v6, "length"));

  v18 = objc_alloc_init(MEMORY[0x24BEBDA88]);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v18, "textContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v18, "setScrollEnabled:", 0);
  objc_msgSend(v18, "setEditable:", 0);
  objc_msgSend(v18, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v20);

  objc_msgSend(v18, "setAttributedText:", v6);
  return v18;
}

- (id)attributedTextWithString:(id)a3 alignment:(int64_t)a4 style:(id)a5 bold:(BOOL)a6
{
  _BOOL4 v6;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v6 = a6;
  v9 = (objc_class *)MEMORY[0x24BDD1688];
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithString:", v11);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setAlignment:", a4);
  v14 = objc_msgSend(v11, "length");

  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v16 = (void *)MEMORY[0x24BEBD5E0];
    objc_msgSend(v15, "fontDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fontDescriptorWithSymbolicTraits:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pointSize");
    objc_msgSend(v16, "fontWithDescriptor:size:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v19;
  }
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BEBD298], v13, 0, v14);
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BEBD270], v15, 0, v14);

  return v12;
}

- (id)stackWithAlignment:(int64_t)a3 axis:(int64_t)a4
{
  void *v6;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setAlignment:", a3);
  objc_msgSend(v6, "setAxis:", a4);
  return v6;
}

- (void)_updateAppearanceForTraitCollectionChange
{
  void *v3;
  void *v4;

  -[DSPlatterTableView _lockImage](self, "_lockImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPlatterTableView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

  -[DSPlatterTableView layoutSubviews](self, "layoutSubviews");
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__DSPlatterTableView_textView_primaryActionForTextItem_defaultAction___block_invoke;
  v6[3] = &unk_24EFF40B8;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BEBD388], "actionWithHandler:", v6, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __70__DSPlatterTableView_textView_primaryActionForTextItem_defaultAction___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  DSUIDTOLocStringForKey(CFSTR("WARNING_PLATTER_LEARN_MORE_URL"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSSafetyCheck showlearnMoreForPresentingViewController:withURL:](DSSafetyCheck, "showlearnMoreForPresentingViewController:withURL:", v2, v1);

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

- (void)_descriptionWithAlignment:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2278DF000, log, OS_LOG_TYPE_ERROR, "Couldn't find learn more string in the warning platter body, manually setting the link attribute range", v1, 2u);
}

@end
