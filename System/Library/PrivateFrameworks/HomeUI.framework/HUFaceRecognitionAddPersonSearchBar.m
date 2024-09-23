@implementation HUFaceRecognitionAddPersonSearchBar

- (HUFaceRecognitionAddPersonSearchBar)init
{
  HUFaceRecognitionAddPersonSearchBar *v2;
  UIImageView *v3;
  UIImageView *faceCropView;
  UITextField *v5;
  UITextField *searchTextField;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *separatorView;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUFaceRecognitionAddPersonSearchBar;
  v2 = -[HUFaceRecognitionAddPersonSearchBar init](&v14, sel_init);
  if (v2)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    faceCropView = v2->_faceCropView;
    v2->_faceCropView = v3;

    -[UIImageView setClipsToBounds:](v2->_faceCropView, "setClipsToBounds:", 1);
    -[HUFaceRecognitionAddPersonSearchBar addSubview:](v2, "addSubview:", v2->_faceCropView);
    v5 = (UITextField *)objc_alloc_init(MEMORY[0x1E0CEAAD0]);
    searchTextField = v2->_searchTextField;
    v2->_searchTextField = v5;

    -[UITextField setAutocapitalizationType:](v2->_searchTextField, "setAutocapitalizationType:", 1);
    -[UITextField setAutocorrectionType:](v2->_searchTextField, "setAutocorrectionType:", 1);
    -[UITextField setClearButtonMode:](v2->_searchTextField, "setClearButtonMode:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v2->_searchTextField, "setFont:", v7);

    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPersonNameCellUnknownPerson"), CFSTR("HUFaceRecognitionPersonNameCellUnknownPerson"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setPlaceholder:](v2->_searchTextField, "setPlaceholder:", v8);

    -[UITextField setReturnKeyType:](v2->_searchTextField, "setReturnKeyType:", 9);
    -[HUFaceRecognitionAddPersonSearchBar addSubview:](v2, "addSubview:", v2->_searchTextField);
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    separatorView = v2->_separatorView;
    v2->_separatorView = v9;

    objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v2->_separatorView, "setBackgroundColor:", v11);

    -[HUFaceRecognitionAddPersonSearchBar addSubview:](v2, "addSubview:", v2->_separatorView);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonSearchBar setBackgroundColor:](v2, "setBackgroundColor:", v12);

  }
  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HUFaceRecognitionAddPersonSearchBar;
  -[HUFaceRecognitionAddPersonSearchBar layoutSubviews](&v16, sel_layoutSubviews);
  -[HUFaceRecognitionAddPersonSearchBar faceCropView](self, "faceCropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 * 0.5;
  -[HUFaceRecognitionAddPersonSearchBar faceCropView](self, "faceCropView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v5);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = 1.0 / v9;

  -[HUFaceRecognitionAddPersonSearchBar bounds](self, "bounds");
  v12 = v11;
  v14 = v13 - v10;
  -[HUFaceRecognitionAddPersonSearchBar separatorView](self, "separatorView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", 0.0, v14, v12, v10);

}

- (void)updateConstraints
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[11];

  v53[9] = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)HUFaceRecognitionAddPersonSearchBar;
  -[HUFaceRecognitionAddPersonSearchBar updateConstraints](&v52, sel_updateConstraints);
  -[HUFaceRecognitionAddPersonSearchBar constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HUFaceRecognitionAddPersonSearchBar faceCropView](self, "faceCropView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUFaceRecognitionAddPersonSearchBar searchTextField](self, "searchTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUFaceRecognitionAddPersonSearchBar faceCropView](self, "faceCropView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonSearchBar layoutMarginsGuide](self, "layoutMarginsGuide");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v47;
    -[HUFaceRecognitionAddPersonSearchBar faceCropView](self, "faceCropView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", 44.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v44;
    -[HUFaceRecognitionAddPersonSearchBar faceCropView](self, "faceCropView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "widthAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonSearchBar faceCropView](self, "faceCropView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v39;
    -[HUFaceRecognitionAddPersonSearchBar faceCropView](self, "faceCropView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonSearchBar layoutMarginsGuide](self, "layoutMarginsGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v34;
    -[HUFaceRecognitionAddPersonSearchBar faceCropView](self, "faceCropView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonSearchBar layoutMarginsGuide](self, "layoutMarginsGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v53[4] = v29;
    -[HUFaceRecognitionAddPersonSearchBar searchTextField](self, "searchTextField");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonSearchBar faceCropView](self, "faceCropView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v25, 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53[5] = v24;
    -[HUFaceRecognitionAddPersonSearchBar searchTextField](self, "searchTextField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonSearchBar layoutMarginsGuide](self, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v53[6] = v19;
    -[HUFaceRecognitionAddPersonSearchBar searchTextField](self, "searchTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonSearchBar layoutMarginsGuide](self, "layoutMarginsGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v53[7] = v8;
    -[HUFaceRecognitionAddPersonSearchBar searchTextField](self, "searchTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonSearchBar layoutMarginsGuide](self, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53[8] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonSearchBar setConstraints:](self, "setConstraints:", v14);

    v15 = (void *)MEMORY[0x1E0CB3718];
    -[HUFaceRecognitionAddPersonSearchBar constraints](self, "constraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

  }
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (UIImageView)faceCropView
{
  return self->_faceCropView;
}

- (UITextField)searchTextField
{
  return self->_searchTextField;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_searchTextField, 0);
  objc_storeStrong((id *)&self->_faceCropView, 0);
}

@end
