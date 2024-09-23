@implementation HKExportPDFControl

- (HKExportPDFControl)initWithText:(id)a3 layoutMargins:(UIEdgeInsets)a4 accessibilityIdentifierPrefix:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  id v12;
  HKExportPDFControl *v13;
  void *v14;
  objc_super v16;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKExportPDFControl;
  v13 = -[HKExportPDFControl initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v13)
  {
    objc_msgSend(v12, "stringByAppendingString:", CFSTR(".exportPDFButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKExportPDFControl _setupUIWithText:layoutMargins:accessibilityIdentifier:](v13, "_setupUIWithText:layoutMargins:accessibilityIdentifier:", v11, v14, top, left, bottom, right);

  }
  return v13;
}

- (void)_setupUIWithText:(id)a3 layoutMargins:(UIEdgeInsets)a4 accessibilityIdentifier:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  HKSeparatorLineView *v43;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v11 = a5;
  v12 = a3;
  -[HKExportPDFControl setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKExportPDFControl heightAnchor](self, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintGreaterThanOrEqualToConstant:", 44.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  v43 = objc_alloc_init(HKSeparatorLineView);
  -[HKSeparatorLineView setTranslatesAutoresizingMaskIntoConstraints:](v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSeparatorLineView setColor:](v43, "setColor:", v15);

  -[HKSeparatorLineView setSeparatorThickness:](v43, "setSeparatorThickness:", HKUIFloorToScreenScale(0.5));
  -[HKExportPDFControl addSubview:](self, "addSubview:", v43);
  v16 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "setText:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v17);

  objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v16, "setTextAlignment:", 4);
  objc_msgSend(v16, "setNumberOfLines:", 0);
  objc_msgSend(v16, "setAccessibilityIdentifier:", v11);

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v18, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v19);

  -[HKExportPDFControl addSubview:](self, "addSubview:", v16);
  objc_msgSend(v16, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKExportPDFControl layoutMarginsGuide](self, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, left);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HKExportPDFControl layoutMarginsGuide](self, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, right);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  objc_msgSend(v16, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKExportPDFControl topAnchor](self, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, top);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[HKExportPDFControl bottomAnchor](self, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, bottom);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  -[HKSeparatorLineView leadingAnchor](v43, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[HKSeparatorLineView trailingAnchor](v43, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKExportPDFControl trailingAnchor](self, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[HKSeparatorLineView topAnchor](v43, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKExportPDFControl topAnchor](self, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

}

@end
