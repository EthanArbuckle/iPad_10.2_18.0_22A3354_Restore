@implementation MUAmenityItemImageView

- (MUAmenityItemImageView)initWithFrame:(CGRect)a3
{
  MUAmenityItemImageView *v3;
  MUAmenityItemImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUAmenityItemImageView;
  v3 = -[MKViewWithHairline initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MUAmenityItemImageView _setupImageView](v3, "_setupImageView");
  return v4;
}

- (void)_setupImageView
{
  UIImageView *v3;
  UIImageView *nfcImageView;
  UIImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *applePayImageView;
  UIImageView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIImageView *v24;
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
  NSLayoutConstraint *v35;
  NSLayoutConstraint *leadingConstraint;
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
  _QWORD v59[9];

  v59[7] = *MEMORY[0x1E0C80C00];
  _createAmenityImageView();
  v3 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  nfcImageView = self->_nfcImageView;
  self->_nfcImageView = v3;

  v5 = self->_nfcImageView;
  v6 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bodyFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithFont:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](v5, "setPreferredSymbolConfiguration:", v9);

  v10 = self->_nfcImageView;
  v11 = (void *)MEMORY[0x1E0DC3870];
  v12 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bodyFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationWithFont:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_systemImageNamed:withConfiguration:", CFSTR("nfc"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](v10, "setImage:", v16);

  -[MUAmenityItemImageView addSubview:](self, "addSubview:", self->_nfcImageView);
  _createAmenityImageView();
  v17 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  applePayImageView = self->_applePayImageView;
  self->_applePayImageView = v17;

  v19 = self->_applePayImageView;
  v20 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bodyFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "configurationWithFont:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](v19, "setPreferredSymbolConfiguration:", v23);

  v24 = self->_applePayImageView;
  v25 = (void *)MEMORY[0x1E0DC3870];
  v26 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bodyFont");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "configurationWithFont:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_mapsui_customSymbolImageNamed:withConfiguration:", CFSTR("applePay"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](v24, "setImage:", v30);

  -[MUAmenityItemImageView addSubview:](self, "addSubview:", self->_applePayImageView);
  -[UIImageView leadingAnchor](self->_nfcImageView, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemImageView leadingAnchor](self, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bodyFont");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_scaledValueForValue:", 34.0);
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingConstraint = self->_leadingConstraint;
  self->_leadingConstraint = v35;

  _MULocalizedStringFromThisBundle(CFSTR("Accepts Apple Pay [AX Label]"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setAccessibilityLabel:](self->_applePayImageView, "setAccessibilityLabel:", v37);

  -[UIImageView setIsAccessibilityElement:](self->_applePayImageView, "setIsAccessibilityElement:", 1);
  -[UIImageView setAccessibilityTraits:](self->_applePayImageView, "setAccessibilityTraits:", *MEMORY[0x1E0DC4690]);
  v52 = (void *)MEMORY[0x1E0CB3718];
  v59[0] = self->_leadingConstraint;
  -[UIImageView topAnchor](self->_nfcImageView, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemImageView topAnchor](self, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v56;
  -[UIImageView bottomAnchor](self->_nfcImageView, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemImageView bottomAnchor](self, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v53;
  -[UIImageView trailingAnchor](self->_nfcImageView, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_applePayImageView, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, -8.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v49;
  -[UIImageView trailingAnchor](self->_applePayImageView, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemImageView trailingAnchor](self, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v39;
  -[UIImageView topAnchor](self->_applePayImageView, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemImageView topAnchor](self, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v59[5] = v42;
  -[UIImageView bottomAnchor](self->_applePayImageView, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemImageView bottomAnchor](self, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v59[6] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 7);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "activateConstraints:", v46);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

}

- (void)_contentSizeDidChange
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 34.0);
  -[NSLayoutConstraint setConstant:](self->_leadingConstraint, "setConstant:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_applePayImageView, 0);
  objc_storeStrong((id *)&self->_nfcImageView, 0);
}

@end
