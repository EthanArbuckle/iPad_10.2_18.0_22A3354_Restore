@implementation HUCameraStatusOverlayView

- (HUCameraStatusOverlayView)initWithFrame:(CGRect)a3
{
  HUCameraStatusOverlayView *v3;
  void *v4;
  HULegibilityLabel *v5;
  double v6;
  void *v7;
  uint64_t v8;
  HULegibilityLabel *statusLabel;
  void *v10;
  uint64_t v11;
  UIImageView *statusIndicatorImageView;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HUCameraStatusOverlayView;
  v3 = -[HUCameraStatusOverlayView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [HULegibilityLabel alloc];
    v6 = *MEMORY[0x1E0CEC0C0];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HULegibilityLabel initWithSettings:strength:text:font:options:](v5, "initWithSettings:strength:text:font:options:", v4, &stru_1E6F60E80, v7, *MEMORY[0x1E0CEC0E0], v6);
    statusLabel = v3->_statusLabel;
    v3->_statusLabel = (HULegibilityLabel *)v8;

    -[HUCameraStatusOverlayView addSubview:](v3, "addSubview:", v3->_statusLabel);
    -[HUCameraStatusOverlayView alertBadge](v3, "alertBadge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraStatusOverlayView addSubview:](v3, "addSubview:", v10);

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", 0.0, 0.0, 12.0, 12.0);
    statusIndicatorImageView = v3->_statusIndicatorImageView;
    v3->_statusIndicatorImageView = (UIImageView *)v11;

    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIImageView layer](v3->_statusIndicatorImageView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowOffset:", v13, v14);

    -[UIImageView layer](v3->_statusIndicatorImageView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowRadius:", 8.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "CGColor");
    -[UIImageView layer](v3->_statusIndicatorImageView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShadowColor:", v18);

    -[UIImageView layer](v3->_statusIndicatorImageView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 1061997773;
    objc_msgSend(v20, "setShadowOpacity:", v21);

    -[UIImageView setContentMode:](v3->_statusIndicatorImageView, "setContentMode:", 1);
    -[HUCameraStatusOverlayView addSubview:](v3, "addSubview:", v3->_statusIndicatorImageView);

  }
  return v3;
}

- (void)layoutSubviews
{
  double MidX;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double MidY;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  CGFloat v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  CGFloat v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  objc_super v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v72.receiver = self;
  v72.super_class = (Class)HUCameraStatusOverlayView;
  -[HUCameraStatusOverlayView layoutSubviews](&v72, sel_layoutSubviews);
  -[HUCameraStatusOverlayView updateStatusLabelBounds](self, "updateStatusLabelBounds");
  -[HUCameraStatusOverlayView bounds](self, "bounds");
  MidX = CGRectGetMidX(v73);
  -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");

  -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v6)
  {
    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v8 = (CGRectGetWidth(v74) + 10.0) * 0.5;

    -[HUCameraStatusOverlayView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "layoutDirection");

    v11 = -v8;
    if (!v10)
      v11 = v8;
    MidX = MidX + v11;
  }
  -[HUCameraStatusOverlayView bounds](self, "bounds");
  MidY = CGRectGetMidY(v75);
  -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCenter:", MidX, MidY);

  -[HUCameraStatusOverlayView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "layoutDirection");

  if (v15)
  {
    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24 - (v20 + 7.0);

    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v25, v18, v20, v22);

    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "center");
    v29 = v28;

    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCenter:", v29, MidY);

    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    v33 = v32;
    v35 = v34;
    v37 = v36;

    -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "frame");
    v39 = CGRectGetMaxX(v76) + 10.0;

    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFrame:", v39, v33, v35, v37);

    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "center");
    v43 = v42;

    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
  }
  else
  {
    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "frame");
    v46 = v45;
    v48 = v47;
    v50 = v49;

    -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "frame");
    v53 = v52 - (v48 + 10.0);

    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFrame:", v53, v46, v48, v50);

    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "center");
    v57 = v56;

    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setCenter:", v57, MidY);

    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "frame");
    v61 = v60;
    v63 = v62;
    v65 = v64;

    -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "frame");
    v67 = CGRectGetMaxX(v77) + 7.0;

    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setFrame:", v67, v61, v63, v65);

    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "center");
    v43 = v70;

    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setCenter:", v43, MidY);

}

- (void)updateStatusForPlaybackEngine:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "playbackError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "cameraProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraStatusOverlayView setStatusString:](self, "setStatusString:", v7);

  if (v4)
  {
    objc_msgSend(v11, "cameraProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_shouldDisableLiveStream");

    if (v9)
      v10 = 1;
    else
      v10 = 2;
  }
  else
  {
    v10 = 1;
  }
  -[HUCameraStatusOverlayView setBadgeStatus:](self, "setBadgeStatus:", v10);

}

- (void)setStatusString:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_statusString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_statusString, a3);
    -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

    -[HUCameraStatusOverlayView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setStatusColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIColor isEqual:](self->_statusColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_statusColor, a3);
    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v6);

  }
}

- (void)setStatusImageName:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_statusImageName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_statusImageName, a3);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v5);

  }
}

- (void)setBadgeStatus:(unint64_t)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3 == 2)
  {
    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

    -[HUCameraStatusOverlayView _exclamationImage](self, "_exclamationImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v10);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = -[HUCameraStatusOverlayView isDisplayingForSingleCamera](self, "isDisplayingForSingleCamera");
    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    -[HUCameraStatusOverlayView _chevronImage](self, "_chevronImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v8;
    -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v12);

  }
  -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeToFit");

  -[HUCameraStatusOverlayView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateStatusLabelBounds
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[HUCameraStatusOverlayView bounds](self, "bounds");
  v5 = v4;
  -[HUCameraStatusOverlayView alertBadge](self, "alertBadge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7 + 17.0;
  -[HUCameraStatusOverlayView statusIndicatorImageView](self, "statusIndicatorImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v5 - (v8 + v10);

  if (v11 > 0.0)
  {
    -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;

    if (v14 > v11)
    {
      -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;

      -[HUCameraStatusOverlayView statusLabel](self, "statusLabel");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBounds:", v17, v19, v11, v21);

    }
  }
}

- (UIImageView)alertBadge
{
  UIImageView *alertBadge;
  id v4;
  void *v5;
  UIImageView *v6;
  void *v7;
  UIImageView *v8;

  alertBadge = self->_alertBadge;
  if (!alertBadge)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[HUCameraStatusOverlayView _chevronImage](self, "_chevronImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v6, "setTintColor:", v7);

    -[UIImageView setContentMode:](v6, "setContentMode:", 1);
    v8 = self->_alertBadge;
    self->_alertBadge = v6;

    alertBadge = self->_alertBadge;
  }
  return alertBadge;
}

- (id)_exclamationImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("exclamationmark.circle.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_chevronImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("chevron.down"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (UIColor)statusColor
{
  return self->_statusColor;
}

- (NSString)statusImageName
{
  return self->_statusImageName;
}

- (void)setAlertBadge:(id)a3
{
  objc_storeStrong((id *)&self->_alertBadge, a3);
}

- (BOOL)isDisplayingForSingleCamera
{
  return self->_isDisplayingForSingleCamera;
}

- (void)setIsDisplayingForSingleCamera:(BOOL)a3
{
  self->_isDisplayingForSingleCamera = a3;
}

- (HULegibilityLabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (UIImageView)statusIndicatorImageView
{
  return self->_statusIndicatorImageView;
}

- (void)setStatusIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorImageView, a3);
}

- (BOOL)didUpdateConstraints
{
  return self->_didUpdateConstraints;
}

- (void)setDidUpdateConstraints:(BOOL)a3
{
  self->_didUpdateConstraints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_alertBadge, 0);
  objc_storeStrong((id *)&self->_statusImageName, 0);
  objc_storeStrong((id *)&self->_statusColor, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
}

@end
