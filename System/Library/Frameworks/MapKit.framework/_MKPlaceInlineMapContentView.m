@implementation _MKPlaceInlineMapContentView

- (BOOL)hasTitle
{
  return 0;
}

- (BOOL)useImageView
{
  return 0;
}

- (_MKPlaceInlineMapContentView)initWithFrame:(CGRect)a3
{
  return -[_MKPlaceInlineMapContentView initWithFrame:hideLookAroundView:showMapAttribution:mapSnapshotAuditToken:](self, "initWithFrame:hideLookAroundView:showMapAttribution:mapSnapshotAuditToken:", 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_MKPlaceInlineMapContentView)initWithFrame:(CGRect)a3 hideLookAroundView:(BOOL)a4 showMapAttribution:(BOOL)a5 mapSnapshotAuditToken:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v13;
  _MKPlaceInlineMapContentView *v14;
  _MKPlaceInlineMapContentView *v15;
  MKViewWithHairline *v16;
  MKViewWithHairline *hairlineView;
  MKVibrantLabel *v18;
  _MKUILabel *titleLabel;
  void *v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  UIImageView *mapImageView;
  MKMapItemView *v25;
  MKMapItemView *mapItemView;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
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
  uint64_t v47;
  NSLayoutConstraint *topToTitleConstraint;
  void *v49;
  void *v50;
  uint64_t v51;
  NSLayoutConstraint *titleToBottomConstraint;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  objc_super v82;
  void *v83;
  _QWORD v84[4];
  _QWORD v85[9];

  v6 = a5;
  v7 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v85[7] = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v82.receiver = self;
  v82.super_class = (Class)_MKPlaceInlineMapContentView;
  v14 = -[_MKUIViewControllerRootView initWithFrame:](&v82, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    -[_MKPlaceInlineMapContentView setPreservesSuperviewLayoutMargins:](v14, "setPreservesSuperviewLayoutMargins:", 1);
    v16 = -[MKViewWithHairline initWithFrame:]([MKViewWithHairline alloc], "initWithFrame:", x, y, width, height);
    hairlineView = v15->_hairlineView;
    v15->_hairlineView = v16;

    -[MKViewWithHairline setTranslatesAutoresizingMaskIntoConstraints:](v15->_hairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKViewWithHairline setTopHairlineHidden:](v15->_hairlineView, "setTopHairlineHidden:", 1);
    -[MKViewWithHairline setBottomHairlineHidden:](v15->_hairlineView, "setBottomHairlineHidden:", 0);
    -[_MKPlaceInlineMapContentView addSubview:](v15, "addSubview:", v15->_hairlineView);
    v18 = -[MKVibrantLabel initWithStyle:]([MKVibrantLabel alloc], "initWithStyle:", 1);
    titleLabel = v15->_titleLabel;
    v15->_titleLabel = (_MKUILabel *)v18;

    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v15->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKUILabel setPreservesSuperviewLayoutMargins:](v15->_titleLabel, "setPreservesSuperviewLayoutMargins:", 1);
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sectionHeaderFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setFont:](v15->_titleLabel, "setFont:", v21);

    -[MKViewWithHairline addSubview:](v15->_hairlineView, "addSubview:", v15->_titleLabel);
    v22 = -[_MKPlaceInlineMapContentView useImageView](v15, "useImageView");
    if (v22)
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", x, y, width, height);
      mapImageView = v15->_mapImageView;
      v15->_mapImageView = (UIImageView *)v23;

      objc_storeStrong((id *)&v15->_mapView, v15->_mapImageView);
    }
    else
    {
      v25 = -[MKMapItemView initWithFrame:]([MKMapItemView alloc], "initWithFrame:", x, y, width, height);
      mapItemView = v15->_mapItemView;
      v15->_mapItemView = v25;

      -[MKMapItemView setShouldShowBorders:](v15->_mapItemView, "setShouldShowBorders:", 1);
      -[MKMapItemView setShouldResolveMapItem:](v15->_mapItemView, "setShouldResolveMapItem:", 0);
      -[MKMapItemView setHideLookAroundView:](v15->_mapItemView, "setHideLookAroundView:", v7);
      -[MKMapItemView setShouldShowMapAttribution:](v15->_mapItemView, "setShouldShowMapAttribution:", v6);
      -[MKMapItemView _setAuditToken:](v15->_mapItemView, "_setAuditToken:", v13);
      objc_storeStrong((id *)&v15->_mapView, v15->_mapItemView);
      -[_MKUIViewControllerClickableRootView setTarget:action:](v15, "setTarget:action:", 0, 0);
    }
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v15->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setPreservesSuperviewLayoutMargins:](v15->_mapView, "setPreservesSuperviewLayoutMargins:", 1);
    -[_MKPlaceInlineMapContentView window](v15, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "screen");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "nativeScale");
      v31 = v30;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "nativeScale");
      v31 = v33;

    }
    v79 = v13;

    -[UIView layer](v15->_mapView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCornerRadius:", 8.0);

    if (v22)
    {
      if (v31 <= 1.0)
        v35 = 1.0;
      else
        v35 = 1.0 / v31;
      -[UIView layer](v15->_mapView, "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setBorderWidth:", v35);

    }
    -[UIView setClipsToBounds:](v15->_mapView, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v15->_mapView, "setUserInteractionEnabled:", 1);
    -[UIView setContentMode:](v15->_mapView, "setContentMode:", 2);
    -[MKViewWithHairline addSubview:](v15->_hairlineView, "addSubview:", v15->_mapView);
    -[_MKPlaceInlineMapContentView infoCardThemeChanged](v15, "infoCardThemeChanged");
    v80 = (void *)MEMORY[0x1E0C99DE8];
    -[MKViewWithHairline leadingAnchor](v15->_hairlineView, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceInlineMapContentView layoutMarginsGuide](v15, "layoutMarginsGuide");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v75;
    -[_MKPlaceInlineMapContentView layoutMarginsGuide](v15, "layoutMarginsGuide");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKViewWithHairline trailingAnchor](v15->_hairlineView, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v71;
    -[MKViewWithHairline topAnchor](v15->_hairlineView, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceInlineMapContentView topAnchor](v15, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v85[2] = v68;
    -[_MKPlaceInlineMapContentView bottomAnchor](v15, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKViewWithHairline bottomAnchor](v15->_hairlineView, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v85[3] = v65;
    -[UIView leadingAnchor](v15->_mapView, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKViewWithHairline leadingAnchor](v15->_hairlineView, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v63);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v85[4] = v37;
    -[MKViewWithHairline trailingAnchor](v15->_hairlineView, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v15->_mapView, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v85[5] = v40;
    -[MKViewWithHairline bottomAnchor](v15->_hairlineView, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v15->_mapView, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v85[6] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 7);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "arrayWithArray:", v44);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_MKPlaceInlineMapContentView hasTitle](v15, "hasTitle"))
    {
      -[_MKUILabel firstBaselineAnchor](v15->_titleLabel, "firstBaselineAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKPlaceInlineMapContentView topAnchor](v15, "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:", v46);
      v47 = objc_claimAutoreleasedReturnValue();
      topToTitleConstraint = v15->_topToTitleConstraint;
      v15->_topToTitleConstraint = (NSLayoutConstraint *)v47;

      -[UIView topAnchor](v15->_mapView, "topAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel lastBaselineAnchor](v15->_titleLabel, "lastBaselineAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v50);
      v51 = objc_claimAutoreleasedReturnValue();
      titleToBottomConstraint = v15->_titleToBottomConstraint;
      v15->_titleToBottomConstraint = (NSLayoutConstraint *)v51;

      v84[0] = v15->_topToTitleConstraint;
      v84[1] = v15->_titleToBottomConstraint;
      -[_MKUILabel leadingAnchor](v15->_titleLabel, "leadingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKPlaceInlineMapContentView layoutMarginsGuide](v15, "layoutMarginsGuide");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "leadingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v84[2] = v56;
      -[_MKPlaceInlineMapContentView layoutMarginsGuide](v15, "layoutMarginsGuide");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "trailingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel trailingAnchor](v15->_titleLabel, "trailingAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v84[3] = v60;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 4);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "addObjectsFromArray:", v61);

    }
    else
    {
      -[UIView topAnchor](v15->_mapView, "topAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKViewWithHairline topAnchor](v15->_hairlineView, "topAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v55;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "addObjectsFromArray:", v56);
    }
    v13 = v79;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v81);
  }

  return v15;
}

- (double)titleHeight
{
  double v3;
  double v4;
  double v5;

  -[NSLayoutConstraint constant](self->_topToTitleConstraint, "constant");
  v4 = v3;
  -[NSLayoutConstraint constant](self->_titleToBottomConstraint, "constant");
  return v4 + v5;
}

- (void)_contentSizeDidChange
{
  void *v3;
  id v4;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionHeaderFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[_MKUILabel setFont:](self->_titleLabel, "setFont:", v4);
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 22.0);
  -[NSLayoutConstraint setConstant:](self->_topToTitleConstraint, "setConstant:");
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 10.0);
  -[NSLayoutConstraint setConstant:](self->_titleToBottomConstraint, "setConstant:");

}

- (BOOL)isBottomHairlineHidden
{
  return -[MKViewWithHairline isBottomHairlineHidden](self->_hairlineView, "isBottomHairlineHidden");
}

- (void)setBottomHairlineHidden:(BOOL)a3
{
  -[MKViewWithHairline setBottomHairlineHidden:](self->_hairlineView, "setBottomHairlineHidden:", a3);
}

- (void)infoCardThemeChanged
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_MKPlaceInlineMapContentView;
  -[UIView infoCardThemeChanged](&v12, sel_infoCardThemeChanged);
  -[UIView mk_theme](self, "mk_theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "separatorLineColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewWithHairline setHairlineColor:](self->_hairlineView, "setHairlineColor:", v4);

  -[UIView mk_theme](self, "mk_theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isDarkTheme");

  v6 = 0.0;
  if ((_DWORD)v4)
    v6 = 1.0;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", v6, 0.100000001);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _mapkit_setBackgroundColor:](self->_mapView, "_mapkit_setBackgroundColor:", v7);
  -[UIView mk_theme](self, "mk_theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "separatorLineColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "CGColor");
  -[UIView layer](self->_mapView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderColor:", v10);

}

- (UIImage)map
{
  return -[UIImageView image](self->_mapImageView, "image");
}

- (void)setMap:(id)a3
{
  -[UIImageView setImage:](self->_mapImageView, "setImage:", a3);
}

- (double)mapViewHeight
{
  return 148.0;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *MEMORY[0x1E0CEBDE0];
  -[_MKPlaceInlineMapContentView mapViewHeight](self, "mapViewHeight");
  v4 = v3 + 0.0;
  v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (MKMapItemView)mapItemView
{
  return self->_mapItemView;
}

- (void)setMapItemView:(id)a3
{
  objc_storeStrong((id *)&self->_mapItemView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mapImageView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_titleToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToTitleConstraint, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
}

@end
