@implementation MKFullDeveloperPlaceCardErrorView

- (MKFullDeveloperPlaceCardErrorView)init
{
  MKFullDeveloperPlaceCardErrorView *v2;
  _MKUILabel *v3;
  _MKUILabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  _MKUILabel *v40;
  _MKUILabel *v41;
  objc_super v42;
  _QWORD v43[10];

  v43[8] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)MKFullDeveloperPlaceCardErrorView;
  v2 = -[MKFullDeveloperPlaceCardErrorView initWithFrame:](&v42, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = objc_alloc_init(_MKUILabel);
    v4 = objc_alloc_init(_MKUILabel);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](v3, "setFont:", v6);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](v4, "setFont:", v7);

    _MKLocalizedStringFromThisBundle(CFSTR("Place Error Title [Developer Place Card]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setText:](v3, "setText:", v8);

    _MKLocalizedStringFromThisBundle(CFSTR("Place Error Subtitle [Developer Place Card]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setText:](v4, "setText:", v9);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.55);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v3;
    -[_MKUILabel setTextColor:](v3, "setTextColor:", v11);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorWithAlphaComponent:", 0.55);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v4;
    -[_MKUILabel setTextColor:](v4, "setTextColor:", v13);

    v14 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setAlignment:", 3);
    objc_msgSend(v14, "set_mk_axis:", 1);
    objc_msgSend(v14, "setSpacing:", 0.0);
    objc_msgSend(v14, "addArrangedSubview:", v3);
    objc_msgSend(v14, "addArrangedSubview:", v4);
    -[MKFullDeveloperPlaceCardErrorView addSubview:](v2, "addSubview:", v14);
    -[MKFullDeveloperPlaceCardErrorView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v14, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFullDeveloperPlaceCardErrorView centerYAnchor](v2, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v37;
    objc_msgSend(v14, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFullDeveloperPlaceCardErrorView centerXAnchor](v2, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v34;
    objc_msgSend(v14, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFullDeveloperPlaceCardErrorView leadingAnchor](v2, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:constant:", v32, 12.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v31;
    objc_msgSend(v14, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFullDeveloperPlaceCardErrorView trailingAnchor](v2, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:constant:", v28, -12.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v27;
    objc_msgSend(v14, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFullDeveloperPlaceCardErrorView topAnchor](v2, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:constant:", v25, 8.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v24;
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFullDeveloperPlaceCardErrorView bottomAnchor](v2, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:constant:", v16, -8.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[5] = v17;
    -[MKFullDeveloperPlaceCardErrorView widthAnchor](v2, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintGreaterThanOrEqualToConstant:", 320.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[6] = v19;
    -[MKFullDeveloperPlaceCardErrorView heightAnchor](v2, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintGreaterThanOrEqualToConstant:", 180.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43[7] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v22);

  }
  return v2;
}

@end
