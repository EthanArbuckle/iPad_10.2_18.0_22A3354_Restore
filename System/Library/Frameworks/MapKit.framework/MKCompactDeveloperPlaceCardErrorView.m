@implementation MKCompactDeveloperPlaceCardErrorView

- (MKCompactDeveloperPlaceCardErrorView)init
{
  MKCompactDeveloperPlaceCardErrorView *v2;
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
  _MKUILabel *v36;
  _MKUILabel *v37;
  objc_super v38;
  _QWORD v39[8];

  v39[6] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)MKCompactDeveloperPlaceCardErrorView;
  v2 = -[MKCompactDeveloperPlaceCardErrorView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
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
    v37 = v3;
    -[_MKUILabel setTextColor:](v3, "setTextColor:", v11);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorWithAlphaComponent:", 0.55);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v4;
    -[_MKUILabel setTextColor:](v4, "setTextColor:", v13);

    v14 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setAlignment:", 1);
    objc_msgSend(v14, "set_mk_axis:", 1);
    objc_msgSend(v14, "setSpacing:", 0.0);
    objc_msgSend(v14, "addArrangedSubview:", v3);
    objc_msgSend(v14, "addArrangedSubview:", v4);
    -[MKCompactDeveloperPlaceCardErrorView addSubview:](v2, "addSubview:", v14);
    -[MKCompactDeveloperPlaceCardErrorView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v28 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v14, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCompactDeveloperPlaceCardErrorView centerYAnchor](v2, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v33;
    objc_msgSend(v14, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCompactDeveloperPlaceCardErrorView centerXAnchor](v2, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v30;
    objc_msgSend(v14, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCompactDeveloperPlaceCardErrorView leadingAnchor](v2, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:constant:", v27, 12.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v26;
    objc_msgSend(v14, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCompactDeveloperPlaceCardErrorView trailingAnchor](v2, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:constant:", v24, -12.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v15;
    objc_msgSend(v14, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCompactDeveloperPlaceCardErrorView topAnchor](v2, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:constant:", v17, 8.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v18;
    objc_msgSend(v14, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCompactDeveloperPlaceCardErrorView bottomAnchor](v2, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:constant:", v20, -8.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v22);

  }
  return v2;
}

@end
