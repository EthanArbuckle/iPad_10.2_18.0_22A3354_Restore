@implementation MKOpenInMapsSelectionAccessoryView

- (MKOpenInMapsSelectionAccessoryView)initWithURL:(id)a3
{
  id v5;
  MKOpenInMapsSelectionAccessoryView *v6;
  MKOpenInMapsSelectionAccessoryView *v7;
  uint64_t v8;
  UIColor *bgColor;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  objc_super v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MKOpenInMapsSelectionAccessoryView;
  v6 = -[MKSelectionAccessoryView initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v35 = v5;
    objc_storeStrong((id *)&v6->_url, a3);
    objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("DeveloperPlaceCardCaptionBackgroundColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    bgColor = v7->_bgColor;
    v7->_bgColor = (UIColor *)v8;

    -[MKOpenInMapsSelectionAccessoryView setBackgroundColor:](v7, "setBackgroundColor:", v7->_bgColor);
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[MKOpenInMapsSelectionAccessoryView layer](v7, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowOffset:", v10, v11);

    -[MKOpenInMapsSelectionAccessoryView layer](v7, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowRadius:", 15.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "CGColor");
    -[MKOpenInMapsSelectionAccessoryView layer](v7, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowColor:", v15);

    -[MKOpenInMapsSelectionAccessoryView layer](v7, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 1047904911;
    objc_msgSend(v17, "setShadowOpacity:", v18);

    -[MKOpenInMapsSelectionAccessoryView _createButton](v7, "_createButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKOpenInMapsSelectionAccessoryView addSubview:](v7, "addSubview:", v19);
    v29 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v19, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKOpenInMapsSelectionAccessoryView topAnchor](v7, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v32;
    objc_msgSend(v19, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKOpenInMapsSelectionAccessoryView leadingAnchor](v7, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v20;
    -[MKOpenInMapsSelectionAccessoryView trailingAnchor](v7, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v23;
    -[MKOpenInMapsSelectionAccessoryView bottomAnchor](v7, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v27);

    v5 = v35;
  }

  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKOpenInMapsSelectionAccessoryView;
  -[MKOpenInMapsSelectionAccessoryView layoutSubviews](&v6, sel_layoutSubviews);
  -[MKOpenInMapsSelectionAccessoryView bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[MKOpenInMapsSelectionAccessoryView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

}

- (id)_createButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  _MKLocalizedStringFromThisBundle(CFSTR("[Developer Selection Accessory] Open in Apple Maps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0CEA2A8];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __51__MKOpenInMapsSelectionAccessoryView__createButton__block_invoke;
  v12 = &unk_1E20D9218;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v3, 0, 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA3A8], "borderlessButtonConfiguration", v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentInsets:", 4.0, 8.0, 4.0, 8.0);
  objc_msgSend(v6, "setTitleTextAttributesTransformer:", &__block_literal_global_48);
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredBehavioralStyle:", 1);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __51__MKOpenInMapsSelectionAccessoryView__createButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePress");

}

id __51__MKOpenInMapsSelectionAccessoryView__createButton__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CEA098]);

  return v2;
}

- (void)_handlePress
{
  id v3;

  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:completionHandler:", self->_url, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgColor, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
