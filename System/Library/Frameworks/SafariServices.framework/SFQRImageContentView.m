@implementation SFQRImageContentView

- (SFQRImageContentView)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  SFQRImageContentView *v8;
  id v9;
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
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SFQRImageContentView *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  id v61;
  id v62;
  objc_super v63;
  _QWORD v64[7];
  _QWORD v65[6];

  v65[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v63.receiver = self;
  v63.super_class = (Class)SFQRImageContentView;
  v8 = -[SFQRImageContentView init](&v63, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineShadowColor");
    v61 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFQRImageContentView addSubview:](v8, "addSubview:", v9);
    v52 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v9, "heightAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    _SFOnePixel();
    objc_msgSend(v58, "constraintEqualToConstant:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v56;
    v11 = v9;
    objc_msgSend(v9, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQRImageContentView leadingAnchor](v8, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v13;
    v60 = v11;
    objc_msgSend(v11, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQRImageContentView trailingAnchor](v8, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v16;
    objc_msgSend(v11, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQRImageContentView topAnchor](v8, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v62 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "activateConstraints:", v20);

    v21 = *MEMORY[0x1E0DC4A98];
    objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A98], 2, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v59, 0.0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v24 = (void *)v22;
    objc_msgSend(v23, "setFont:", v22);
    objc_msgSend(v23, "setText:", v62);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTextColor:", v25);

    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFQRImageContentView addSubview:](v8, "addSubview:", v23);
    v26 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v27);

    objc_msgSend(v26, "setText:", v61);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v28);

    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFQRImageContentView addSubview:](v8, "addSubview:", v26);
    v47 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v23, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQRImageContentView leadingAnchor](v8, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v55, 16.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v53;
    objc_msgSend(v23, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQRImageContentView trailingAnchor](v8, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, -16.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v49;
    objc_msgSend(v23, "firstBaselineAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQRImageContentView topAnchor](v8, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_scaledValueForValue:", 20.0);
    _SFRoundFloatToPixels();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v45;
    objc_msgSend(v26, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQRImageContentView leadingAnchor](v8, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 16.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v42;
    objc_msgSend(v26, "firstBaselineAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstBaselineAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v24;
    objc_msgSend(v24, "_scaledValueForValue:", 15.0);
    _SFRoundFloatToPixels();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v64[4] = v38;
    objc_msgSend(v26, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQRImageContentView trailingAnchor](v8, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -16.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v64[5] = v31;
    -[SFQRImageContentView bottomAnchor](v8, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstBaselineAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_scaledValueForValue:", 12.0);
    _SFRoundFloatToPixels();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v64[6] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "activateConstraints:", v35);

    v7 = v61;
    v6 = v62;

    v36 = v8;
  }

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SFQRImageContentView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

@end
