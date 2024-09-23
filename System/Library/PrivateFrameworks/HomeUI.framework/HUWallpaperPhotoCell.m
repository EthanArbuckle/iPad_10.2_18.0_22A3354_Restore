@implementation HUWallpaperPhotoCell

- (HUWallpaperPhotoCell)initWithFrame:(CGRect)a3
{
  HUWallpaperPhotoCell *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *imageView;
  id v8;
  void *v9;
  uint64_t v10;
  UIView *selectionOverlayView;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIButton *deleteButton;
  UIButton *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  UILabel *choosePhotoLabel;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  UIStackView *stackView;
  uint64_t v35;
  CAShapeLayer *borderLayer;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
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
  void *v61;
  void *v62;
  objc_super v64;
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  v64.receiver = self;
  v64.super_class = (Class)HUWallpaperPhotoCell;
  v3 = -[HUWallpaperPhotoCell initWithFrame:](&v64, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[HUWallpaperPhotoCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    -[UIImageView setAutoresizingMask:](v3->_imageView, "setAutoresizingMask:", 18);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    v3->_busy = 0;
    v3->_removable = 0;
    v3->_empty = 0;
    v3->_showBorder = 0;
    v3->_contentMode = 2;
    v8 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[HUWallpaperPhotoCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = objc_msgSend(v8, "initWithFrame:");
    selectionOverlayView = v3->_selectionOverlayView;
    v3->_selectionOverlayView = (UIView *)v10;

    -[UIView setClipsToBounds:](v3->_selectionOverlayView, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_selectionOverlayView, "setBackgroundColor:", v12);

    -[UIView layer](v3->_selectionOverlayView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 10.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "CGColor");
    -[UIView layer](v3->_selectionOverlayView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBorderColor:", v15);

    -[UIView layer](v3->_selectionOverlayView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBorderWidth:", 2.0);

    -[UIView setAlpha:](v3->_selectionOverlayView, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v18 = objc_claimAutoreleasedReturnValue();
    deleteButton = v3->_deleteButton;
    v3->_deleteButton = (UIButton *)v18;

    v20 = v3->_deleteButton;
    HUImageNamed(CFSTR("deleteWallpaperButton"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v20, "setImage:forState:", v21, 0);

    -[UIButton layer](v3->_deleteButton, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBorderWidth:", 3.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = objc_msgSend(v23, "CGColor");
    -[UIButton layer](v3->_deleteButton, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBorderColor:", v24);

    -[UIButton addTarget:action:forControlEvents:](v3->_deleteButton, "addTarget:action:forControlEvents:", v3, sel_deleteButtonPressed, 64);
    v26 = objc_alloc(MEMORY[0x1E0CEA700]);
    v27 = objc_msgSend(v26, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    choosePhotoLabel = v3->_choosePhotoLabel;
    v3->_choosePhotoLabel = (UILabel *)v27;

    _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationChoosePhotoLabelMac"), CFSTR("HUEditLocationChoosePhotoLabelMac"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_choosePhotoLabel, "setText:", v29);

    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_choosePhotoLabel, "setTextColor:", v30);

    -[UILabel setHidden:](v3->_choosePhotoLabel, "setHidden:", 1);
    -[UILabel sizeToFit](v3->_choosePhotoLabel, "sizeToFit");
    v31 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    v65[0] = v3->_imageView;
    v65[1] = v3->_choosePhotoLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "initWithArrangedSubviews:", v32);
    stackView = v3->_stackView;
    v3->_stackView = (UIStackView *)v33;

    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](v3->_stackView, "setDistribution:", 3);
    -[UIStackView setSpacing:](v3->_stackView, "setSpacing:", 8.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v35 = objc_claimAutoreleasedReturnValue();
    borderLayer = v3->_borderLayer;
    v3->_borderLayer = (CAShapeLayer *)v35;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v3->_borderLayer, "setStrokeColor:", objc_msgSend(v37, "CGColor"));

    -[CAShapeLayer setFillColor:](v3->_borderLayer, "setFillColor:", 0);
    -[CAShapeLayer setLineWidth:](v3->_borderLayer, "setLineWidth:", 2.0);
    -[CAShapeLayer setLineDashPattern:](v3->_borderLayer, "setLineDashPattern:", &unk_1E7042CF0);
    -[HUWallpaperPhotoCell contentView](v3, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v3->_stackView);

    -[HUWallpaperPhotoCell contentView](v3, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSubview:", v3->_selectionOverlayView);

    -[HUWallpaperPhotoCell contentView](v3, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addSublayer:", v3->_borderLayer);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v43 = objc_msgSend(v42, "CGColor");
    -[HUWallpaperPhotoCell contentView](v3, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setBackgroundColor:", v43);

    -[HUWallpaperPhotoCell contentView](v3, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAutoresizingMask:", 18);

    -[UIStackView heightAnchor](v3->_stackView, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCell contentView](v3, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "heightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

    -[UIStackView widthAnchor](v3->_stackView, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCell contentView](v3, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    -[UIStackView centerYAnchor](v3->_stackView, "centerYAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCell contentView](v3, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "centerYAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setActive:", 1);

    -[UIImageView widthAnchor](v3->_imageView, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCell stackView](v3, "stackView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "widthAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCell setImageWidthConstraint:](v3, "setImageWidthConstraint:", v62);

  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[HUWallpaperPhotoCell setBusy:](self, "setBusy:", 0);
  -[HUWallpaperPhotoCell setEmpty:](self, "setEmpty:", 0);
  -[HUWallpaperPhotoCell setRemovable:](self, "setRemovable:", 0);
  -[HUWallpaperPhotoCell setShowBorder:](self, "setShowBorder:", 0);
  -[HUWallpaperPhotoCell choosePhotoLabel](self, "choosePhotoLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  v4.receiver = self;
  v4.super_class = (Class)HUWallpaperPhotoCell;
  -[HUWallpaperPhotoCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)deleteButtonPressed
{
  void *v3;
  id v4;

  -[HUWallpaperPhotoCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUWallpaperPhotoCell delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wallpaperPhotoCellDidPressDeleteButton:", self);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  -[HUWallpaperPhotoCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[HUWallpaperPhotoCell selectionOverlayView](self, "selectionOverlayView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5 + -4.0, v7 + -4.0, v9 + 8.0, v11 + 8.0);

  -[HUWallpaperPhotoCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "origin");
  v15 = v14 + -8.0;
  -[HUWallpaperPhotoCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "origin");
  v18 = v17 + -8.0;
  -[HUWallpaperPhotoCell deleteButton](self, "deleteButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v15, v18, 26.0, 26.0);

  -[HUWallpaperPhotoCell deleteButton](self, "deleteButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentEdgeInsets:", 3.0, 3.0, 3.0, 3.0);

  -[HUWallpaperPhotoCell deleteButton](self, "deleteButton");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v22 = v21 * 0.5;
  -[HUWallpaperPhotoCell deleteButton](self, "deleteButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerRadius:", v22);

}

- (void)updateView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
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
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  uint64_t v65;
  void *v66;
  double v67;
  void *v68;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    if (-[HUWallpaperPhotoCell showBorder](self, "showBorder") && !-[HUWallpaperPhotoCell empty](self, "empty"))
    {
      -[HUWallpaperPhotoCell selectionOverlayView](self, "selectionOverlayView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 1.0;
    }
    else
    {
      if (-[HUWallpaperPhotoCell empty](self, "empty"))
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUWallpaperPhotoCell imageView](self, "imageView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setTintColor:", v3);

        -[HUWallpaperPhotoCell imageView](self, "imageView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_setContinuousCornerRadius:", 0.0);

        -[HUWallpaperPhotoCell choosePhotoLabel](self, "choosePhotoLabel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setHidden:", 0);

        -[HUWallpaperPhotoCell imageWidthConstraint](self, "imageWidthConstraint");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = 0;
      }
      else
      {
        -[HUWallpaperPhotoCell imageView](self, "imageView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTintColor:", 0);

        -[HUWallpaperPhotoCell cornerRadius](self, "cornerRadius");
        v12 = v11 / 1.5;
        -[HUWallpaperPhotoCell imageView](self, "imageView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setContinuousCornerRadius:", v12);

        -[HUWallpaperPhotoCell choosePhotoLabel](self, "choosePhotoLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setHidden:", 1);

        -[HUWallpaperPhotoCell imageWidthConstraint](self, "imageWidthConstraint");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = 1;
      }
      objc_msgSend(v7, "setActive:", v9);

      -[HUWallpaperPhotoCell selectionOverlayView](self, "selectionOverlayView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 0.0;
    }
    objc_msgSend(v15, "setAlpha:", v17);

    -[HUWallpaperPhotoCell cornerRadius](self, "cornerRadius");
    v19 = v18;
    -[HUWallpaperPhotoCell selectionOverlayView](self, "selectionOverlayView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_setCornerRadius:", v19);

    if (-[HUWallpaperPhotoCell removable](self, "removable"))
    {
      -[HUWallpaperPhotoCell contentView](self, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWallpaperPhotoCell deleteButton](self, "deleteButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);

    }
    else
    {
      if (-[HUWallpaperPhotoCell removable](self, "removable"))
        goto LABEL_14;
      -[HUWallpaperPhotoCell deleteButton](self, "deleteButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeFromSuperview");
    }

  }
LABEL_14:
  v23 = -[HUWallpaperPhotoCell busy](self, "busy");
  -[HUWallpaperPhotoCell spinnerView](self, "spinnerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23)
  {

    if (!v25)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 101);
      -[HUWallpaperPhotoCell setSpinnerView:](self, "setSpinnerView:", v26);

      -[HUWallpaperPhotoCell spinnerView](self, "spinnerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    }
    -[HUWallpaperPhotoCell spinnerView](self, "spinnerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "startAnimating");

    -[HUWallpaperPhotoCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCell spinnerView](self, "spinnerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v30);

    -[HUWallpaperPhotoCell spinnerView](self, "spinnerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[HUWallpaperPhotoCell spinnerView](self, "spinnerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCell contentView](self, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

  }
  else
  {
    objc_msgSend(v24, "stopAnimating");

    -[HUWallpaperPhotoCell spinnerView](self, "spinnerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeFromSuperview");
  }

  v41 = (void *)MEMORY[0x1E0CEA390];
  -[HUWallpaperPhotoCell contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bounds");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  -[HUWallpaperPhotoCell cornerRadius](self, "cornerRadius");
  objc_msgSend(v41, "bezierPathWithRoundedRect:cornerRadius:", v44, v46, v48, v50, v51);
  v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v53 = objc_msgSend(v52, "CGPath");
  -[HUWallpaperPhotoCell borderLayer](self, "borderLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setPath:", v53);

  -[HUWallpaperPhotoCell contentView](self, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bounds");
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  -[HUWallpaperPhotoCell borderLayer](self, "borderLayer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setFrame:", v57, v59, v61, v63);

  v65 = -[HUWallpaperPhotoCell empty](self, "empty") ^ 1;
  -[HUWallpaperPhotoCell borderLayer](self, "borderLayer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setHidden:", v65);

  if ((-[HUWallpaperPhotoCell isHighlighted](self, "isHighlighted") & 1) != 0
    || (v67 = 1.0, -[HUWallpaperPhotoCell busy](self, "busy")))
  {
    if (-[HUWallpaperPhotoCell empty](self, "empty"))
      v67 = 1.0;
    else
      v67 = 0.5;
  }
  -[HUWallpaperPhotoCell imageView](self, "imageView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setAlpha:", v67);

  -[HUWallpaperPhotoCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[HUWallpaperPhotoCell isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)HUWallpaperPhotoCell;
    -[HUWallpaperPhotoCell setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[HUWallpaperPhotoCell updateView](self, "updateView");
  }
}

- (void)setBusy:(BOOL)a3
{
  if (self->_busy != a3)
  {
    self->_busy = a3;
    -[HUWallpaperPhotoCell updateView](self, "updateView");
  }
}

- (void)setEmpty:(BOOL)a3
{
  if (self->_empty != a3)
  {
    self->_empty = a3;
    -[HUWallpaperPhotoCell updateView](self, "updateView");
  }
}

- (void)setRemovable:(BOOL)a3
{
  if (self->_removable != a3)
  {
    self->_removable = a3;
    -[HUWallpaperPhotoCell updateView](self, "updateView");
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[HUWallpaperPhotoCell updateView](self, "updateView");
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUWallpaperPhotoCell;
  v4 = a3;
  -[HUWallpaperPhotoCell setBackgroundColor:](&v9, sel_setBackgroundColor_, v4);
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor", v9.receiver, v9.super_class);

  -[HUWallpaperPhotoCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v6);

}

- (void)setShowBorder:(BOOL)a3
{
  -[HUWallpaperPhotoCell showBorder:animated:](self, "showBorder:animated:", a3, 0);
}

- (void)showBorder:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];

  if (self->_showBorder != a3)
  {
    self->_showBorder = a3;
    if (a4)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __44__HUWallpaperPhotoCell_showBorder_animated___block_invoke;
      v4[3] = &unk_1E6F4D988;
      v4[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.1, 0.0);
    }
    else
    {
      -[HUWallpaperPhotoCell updateView](self, "updateView");
    }
  }
}

uint64_t __44__HUWallpaperPhotoCell_showBorder_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateView");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (UIImage)image
{
  void *v3;
  void *v4;

  if (-[HUWallpaperPhotoCell empty](self, "empty"))
  {
    -[HUWallpaperPhotoCell imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (UIImage *)v4;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUWallpaperPhotoCell imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)setContentMode:(int64_t)a3
{
  id v4;

  self->_contentMode = a3;
  -[HUWallpaperPhotoCell imageView](self, "imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", a3);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUWallpaperPhotoCell;
  -[HUWallpaperPhotoCell hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[HUWallpaperPhotoCell deleteButton](self, "deleteButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HUWallpaperPhotoCell deleteButton](self, "deleteButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWallpaperPhotoCell deleteButton](self, "deleteButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWallpaperPhotoCell convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
      objc_msgSend(v9, "hitTest:withEvent:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (BOOL)busy
{
  return self->_busy;
}

- (BOOL)empty
{
  return self->_empty;
}

- (BOOL)removable
{
  return self->_removable;
}

- (BOOL)showBorder
{
  return self->_showBorder;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (HUWallpaperPhotoCellDelegate)delegate
{
  return (HUWallpaperPhotoCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerView, a3);
}

- (UIView)selectionOverlayView
{
  return self->_selectionOverlayView;
}

- (void)setSelectionOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionOverlayView, a3);
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (UILabel)choosePhotoLabel
{
  return self->_choosePhotoLabel;
}

- (void)setChoosePhotoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_choosePhotoLabel, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (CAShapeLayer)borderLayer
{
  return self->_borderLayer;
}

- (void)setBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_borderLayer, a3);
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_choosePhotoLabel, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_selectionOverlayView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end
