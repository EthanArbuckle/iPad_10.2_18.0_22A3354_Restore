@implementation _MKPlacePoisInlineMapContentView

- (BOOL)hasTitle
{
  return 1;
}

- (BOOL)useImageView
{
  return 1;
}

- (_MKPlacePoisInlineMapContentView)initWithFrame:(CGRect)a3
{
  _MKPlacePoisInlineMapContentView *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _MKUILabel *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _MKUILabel *storesLabel;
  void *v16;
  void *v17;
  _MKUILabel *v18;
  _MKUILabel *seeMoreLabel;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;
  _QWORD v57[11];

  v57[9] = *MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)_MKPlacePoisInlineMapContentView;
  v3 = -[_MKPlaceInlineMapContentView initWithFrame:](&v56, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);

    v7 = v6;
    objc_msgSend(v7, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->super._mapView, "addSubview:", v7);
    -[_MKUILabel setText:](v3->super._titleLabel, "setText:", &stru_1E20DFC00);
    -[_MKUILabel setAlpha:](v3->super._titleLabel, "setAlpha:", 0.0);
    v9 = [_MKUILabel alloc];
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = -[_MKUILabel initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
    storesLabel = v3->_storesLabel;
    v3->_storesLabel = (_MKUILabel *)v14;

    -[_MKUILabel setTextAlignment:](v3->_storesLabel, "setTextAlignment:", 4);
    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_storesLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKUILabel setPreservesSuperviewLayoutMargins:](v3->_storesLabel, "setPreservesSuperviewLayoutMargins:", 1);
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributionFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](v3->_storesLabel, "setFont:", v17);

    v55 = v8;
    objc_msgSend(v8, "addSubview:", v3->_storesLabel);
    v18 = -[_MKUILabel initWithFrame:]([_MKUILabel alloc], "initWithFrame:", v10, v11, v12, v13);
    seeMoreLabel = v3->_seeMoreLabel;
    v3->_seeMoreLabel = v18;

    -[_MKUILabel set_mapkit_themeColorProvider:](v3->_seeMoreLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_208);
    -[_MKUILabel setTextAlignment:](v3->_seeMoreLabel, "setTextAlignment:", 4);
    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_seeMoreLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKUILabel setPreservesSuperviewLayoutMargins:](v3->_seeMoreLabel, "setPreservesSuperviewLayoutMargins:", 1);
    _MKLocalizedStringFromThisBundle(CFSTR("Map_View_More"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setText:](v3->_seeMoreLabel, "setText:", v20);

    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attributionFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](v3->_seeMoreLabel, "setFont:", v22);

    objc_msgSend(v8, "addSubview:", v3->_seeMoreLabel);
    v43 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->super._mapView, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v52;
    objc_msgSend(v7, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->super._mapView, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v49;
    objc_msgSend(v7, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->super._mapView, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v46;
    objc_msgSend(v7, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", 40.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v44;
    -[_MKUILabel centerYAnchor](v3->_storesLabel, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v57[4] = v40;
    -[_MKUILabel leadingAnchor](v3->_storesLabel, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutMarginsGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v57[5] = v35;
    -[_MKUILabel trailingAnchor](v3->_storesLabel, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel leadingAnchor](v3->_seeMoreLabel, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v57[6] = v23;
    -[_MKUILabel centerYAnchor](v3->_seeMoreLabel, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel centerYAnchor](v3->_storesLabel, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v57[7] = v26;
    -[_MKUILabel trailingAnchor](v3->_seeMoreLabel, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v7;
    objc_msgSend(v7, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v57[8] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v31);

    -[_MKPlaceInlineMapContentView _contentSizeDidChange](v3, "_contentSizeDidChange");
    -[_MKUILabel layoutIfNeeded](v3->super._titleLabel, "layoutIfNeeded");

  }
  return v3;
}

- (void)setVisible:(BOOL)a3
{
  double v3;

  if (self->_visible != a3)
  {
    self->_visible = a3;
    v3 = 0.0;
    if (a3)
      v3 = 1.0;
    -[_MKUILabel setAlpha:](self->super._titleLabel, "setAlpha:", v3);
  }
}

- (void)setLocationsNumber:(unint64_t)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3 >= 2)
    v5 = CFSTR("Map_View_title_plural");
  else
    v5 = CFSTR("Map_View_title");
  _MKLocalizedStringFromThisBundle(v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setText:](self->super._titleLabel, "setText:", v8);
  _MKLocalizedStringFromThisBundle(CFSTR("Map_Location_Nearby"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setText:](self->_storesLabel, "setText:", v7);

}

- (double)mapViewHeight
{
  return 188.0;
}

- (CGSize)intrinsicContentSize
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = -[_MKPlacePoisInlineMapContentView visible](self, "visible");
  v4 = *MEMORY[0x1E0CEBDE0];
  v5 = 0.0;
  if (v3)
  {
    -[_MKPlacePoisInlineMapContentView mapViewHeight](self, "mapViewHeight");
    v7 = v6;
    -[_MKPlaceInlineMapContentView titleHeight](self, "titleHeight");
    v5 = v7 + v8;
  }
  v9 = v4;
  result.height = v5;
  result.width = v9;
  return result;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seeMoreLabel, 0);
  objc_storeStrong((id *)&self->_storesLabel, 0);
}

@end
