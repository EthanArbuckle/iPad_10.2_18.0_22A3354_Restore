@implementation LPImageView

- (LPImageView)initWithHost:(id)a3
{

  return 0;
}

- (LPImageView)initWithHost:(id)a3 image:(id)a4 properties:(id)a5 style:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  LPImageView *v14;
  id *p_isa;
  LPImageView *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  LPImageView *v24;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)LPImageView;
  v14 = -[LPComponentView initWithHost:](&v26, sel_initWithHost_, v10);
  p_isa = (id *)&v14->super.super.super.super.isa;
  v16 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_image, a4);
    objc_storeStrong(p_isa + 55, a5);
    objc_storeStrong(p_isa + 56, a6);
    objc_storeStrong(p_isa + 57, a6);
    if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = objc_msgSend(v17, "CGColor");
      -[LPImageView layer](v16, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setBorderColor:", v18);

      -[LPImageView layer](v16, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBorderWidth:", 0.5);

    }
    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)-[LPImageView registerForTraitChanges:withAction:](v16, "registerForTraitChanges:withAction:", v22, sel__userInterfaceStyleDidChange_);

    v24 = v16;
  }

  return v16;
}

- (int64_t)_filter
{
  uint64_t v3;
  void *v4;
  int64_t v5;

  v3 = LPImageViewFilterResolve(self->_image, self->_properties, self->_style);
  -[LPComponentView host](self, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "componentView:allowedImageFilterForFilter:", self, v3);

  return v5;
}

- (void)ensureImageView
{
  LPImageViewStyle *originalStyle;
  uint64_t v4;
  LPImage *image;
  double v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  LPPointUnit *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  LPPointUnit *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  LPSize *v26;
  LPImageViewStyle *style;
  int64_t v28;
  id *p_filteredImage;
  LPImage *filteredImage;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  LPImage *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  char v65;
  id v66;
  UIView *v67;
  UIView *backgroundView;
  UIImageView *v69;
  UIImageView *imageView;
  UIImageView *v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  void *v93;
  id v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  id v98;
  void *v99;
  LPImageViewStyle *v100;
  id v101;
  id v102;

  if (!self->_imageView)
  {
    originalStyle = self->_originalStyle;
    v4 = -[LPImageView _filter](self, "_filter");
    image = self->_image;
    -[UIView _lp_backingScaleFactor](self, "_lp_backingScaleFactor");
    v7 = shouldUseIconPlatter(originalStyle, v4, image, v6);
    self->_platterReason = v7;
    if (v7)
    {
      v100 = (LPImageViewStyle *)-[LPImageViewStyle copy](self->_style, "copy");
      +[LPTheme iconPlatterPaddingForReason:](LPTheme, "iconPlatterPaddingForReason:", self->_platterReason);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v10 = v9;

      -[LPImageViewStyle fixedSize](self->_originalStyle, "fixedSize");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "asSize");
      v13 = v12;
      v15 = v14;

      v16 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", (v15 - v10) * 0.5);
      -[LPImageViewStyle padding](v100, "padding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTop:", v16);

      -[LPImageViewStyle padding](v100, "padding");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "top");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImageViewStyle padding](v100, "padding");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBottom:", v19);

      v21 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", (v13 - v10) * 0.5);
      -[LPImageViewStyle padding](v100, "padding");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setLeading:", v21);

      -[LPImageViewStyle padding](v100, "padding");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "leading");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImageViewStyle padding](v100, "padding");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTrailing:", v24);

      v26 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", v10);
      -[LPImageViewStyle setFixedSize:](v100, "setFixedSize:", v26);

      style = self->_style;
      self->_style = v100;

    }
    v28 = -[LPImageView _filter](self, "_filter");
    p_filteredImage = (id *)&self->_filteredImage;
    filteredImage = self->_filteredImage;
    self->_filteredImage = 0;

    v31 = +[LPTestingOverrides forceImageLoadingScaleFactor](LPTestingOverrides, "forceImageLoadingScaleFactor");
    if (v31)
    {
      v32 = (double)v31;
    }
    else
    {
      -[UIView _lp_backingScaleFactor](self, "_lp_backingScaleFactor");
      v32 = v33;
    }
    -[LPImagePresentationProperties fixedSize](self->_properties, "fixedSize");
    if (v35 == *MEMORY[0x1E0C9D820] && v34 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[LPImageViewStyle fixedSize](self->_style, "fixedSize");
      v101 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "asSize");
      v38 = v41;
      v40 = v42;

    }
    else
    {
      -[LPImagePresentationProperties fixedSize](self->_properties, "fixedSize");
      v38 = v37;
      v40 = v39;
    }
    -[LPImageView _effectiveCornerRadius](self, "_effectiveCornerRadius");
    v44 = v43;
    -[LPImagePresentationProperties maskColor](self->_properties, "maskColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
    {
      v47 = v45;
    }
    else
    {
      -[LPImageViewStyle maskColor](self->_style, "maskColor");
      v47 = (id)objc_claimAutoreleasedReturnValue();
    }
    v102 = v47;

    -[LPImagePresentationProperties backgroundColor](self->_properties, "backgroundColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
    {
      v50 = v48;
    }
    else
    {
      -[LPImageViewStyle backgroundColor](self->_style, "backgroundColor");
      v50 = (id)objc_claimAutoreleasedReturnValue();
    }
    v51 = v50;

    -[LPImageViewStyle backgroundInset](self->_style, "backgroundInset");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "value");
    v54 = v53;

    switch(v28)
    {
      case 1:
      case 2:
      case 12:
      case 13:
        v55 = self->_image;
        goto LABEL_21;
      case 3:
        squareImageWithCornerRadius(self->_image, v51, v38, v40, v44, v32, v54);
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = *p_filteredImage;
        *p_filteredImage = (id)v57;

        -[LPImage _darkInterfaceAlternativeImage](self->_image, "_darkInterfaceAlternativeImage");
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v59)
          goto LABEL_33;
        -[LPImage _darkInterfaceAlternativeImage](self->_image, "_darkInterfaceAlternativeImage");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        squareImageWithCornerRadius(v60, v51, v38, v40, v44, v32, v54);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*p_filteredImage, "_setDarkInterfaceAlternativeImage:", v61);
        goto LABEL_44;
      case 4:
        -[LPImage _asTemplate](self->_image, "_asTemplate");
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = *p_filteredImage;
        *p_filteredImage = (id)v62;

        if (!v102)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v102 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_33;
      case 5:
        appIconImage(self->_image, v38, v40, v32);
        v56 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 6:
        messagesAppIconImage(self->_image, v38, v40, v32);
        v56 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 7:
        appClipIconImage(self->_image, v38, v40, v32);
        v56 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 8:
      case 9:
      case 10:
        bookCoverImage(self->_image, v28 == 10, v28 == 9, v32);
        v56 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 11:
        -[LPComponentView host](self, "host");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "usesBackgroundForSymbolImagesForComponentView:", self);

        v55 = self->_image;
        if ((v65 & 1) != 0)
        {
LABEL_21:
          objc_storeStrong((id *)&self->_filteredImage, v55);
        }
        else
        {
          -[LPImage filledVariant](self->_image, "filledVariant");
          v56 = objc_claimAutoreleasedReturnValue();
LABEL_32:
          v66 = *p_filteredImage;
          *p_filteredImage = (id)v56;

        }
        goto LABEL_33;
      case 14:
        squareFittingImageWithCornerRadius(self->_image, v51, v38, v40, v44, v32, v54);
        v97 = objc_claimAutoreleasedReturnValue();
        v98 = *p_filteredImage;
        *p_filteredImage = (id)v97;

        -[LPImage _darkInterfaceAlternativeImage](self->_image, "_darkInterfaceAlternativeImage");
        v99 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v99)
          goto LABEL_33;
        -[LPImage _darkInterfaceAlternativeImage](self->_image, "_darkInterfaceAlternativeImage");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        squareFittingImageWithCornerRadius(v60, v51, v38, v40, v44, v32, v54);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*p_filteredImage, "_setDarkInterfaceAlternativeImage:", v61);
LABEL_44:

LABEL_33:
        if (-[LPImageView shouldApplyBackground](self, "shouldApplyBackground"))
        {
          v67 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
          backgroundView = self->_backgroundView;
          self->_backgroundView = v67;

          -[UIView _lp_setBackgroundColor:](self->_backgroundView, "_lp_setBackgroundColor:", v51);
          -[LPImageView addSubview:](self, "addSubview:", self->_backgroundView);
        }
        -[LPImageView _createImageViewWithImage:](self, "_createImageViewWithImage:", *p_filteredImage);
        v69 = (UIImageView *)objc_claimAutoreleasedReturnValue();
        imageView = self->_imageView;
        self->_imageView = v69;

        -[LPImageView _updateScalingMode](self, "_updateScalingMode");
        v71 = self->_imageView;
        -[LPImageViewStyle opacity](self->_style, "opacity");
        -[UIImageView _lp_setOpacity:](v71, "_lp_setOpacity:");
        -[UIImageView _lp_setTintColor:](self->_imageView, "_lp_setTintColor:", v102);
        -[LPImageView addSubview:](self, "addSubview:", self->_imageView);
        if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
          v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v73 = objc_msgSend(v72, "CGColor");
          -[UIImageView layer](self->_imageView, "layer");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setBorderColor:", v73);

          -[UIImageView layer](self->_imageView, "layer");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setBorderWidth:", 0.5);

        }
        if (v28 == 2)
          -[LPImageView installDarkeningViewIfNeeded](self, "installDarkeningViewIfNeeded");
        -[LPImageViewStyle shadow](self->_style, "shadow");
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          -[LPImageViewStyle shadow](self->_style, "shadow");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "radius");
          v79 = v78;
          -[LPImageView layer](self, "layer");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setShadowRadius:", v79);

          -[LPImageViewStyle shadow](self->_style, "shadow");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "offset");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "asSize");
          v84 = v83;
          v86 = v85;
          -[LPImageView layer](self, "layer");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setShadowOffset:", v84, v86);

          -[LPImageViewStyle shadow](self->_style, "shadow");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "opacity");
          v90 = v89;
          -[LPImageView layer](self, "layer");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v92 = v90;
          objc_msgSend(v91, "setShadowOpacity:", v92);

          -[LPImageViewStyle shadow](self->_style, "shadow");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "color");
          v94 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v95 = objc_msgSend(v94, "CGColor");
          -[LPImageView layer](self, "layer");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setShadowColor:", v95);

          -[LPImageView updateShadowPath](self, "updateShadowPath");
        }

        break;
      default:
        goto LABEL_33;
    }
  }
}

- (void)_userInterfaceStyleDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  LPImage *filteredImage;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[LPImage _darkInterfaceAlternativeImage](self->_filteredImage, "_darkInterfaceAlternativeImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");
    filteredImage = self->_filteredImage;
    if (v6 == 2)
    {
      -[LPImage _darkInterfaceAlternativeImage](filteredImage, "_darkInterfaceAlternativeImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "platformImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[LPImage platformImage](filteredImage, "platformImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9;
    }
    -[UIImageView setImage:](self->_imageView, "setImage:", v9);
    if (v6 == 2)

  }
}

- (void)updateCornerRadius
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  _BOOL4 v27;
  int64_t v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  -[UIImageView frame](self->_imageView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView frame](self->_backgroundView, "frame");
  v49.origin.x = v11;
  v49.origin.y = v12;
  v49.size.width = v13;
  v49.size.height = v14;
  v47.origin.x = v4;
  v47.origin.y = v6;
  v47.size.width = v8;
  v47.size.height = v10;
  if (CGRectEqualToRect(v47, v49))
  {
    -[UIImageView frame](self->_imageView, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[LPImageView bounds](self, "bounds");
    v50.origin.x = v23;
    v50.origin.y = v24;
    v50.size.width = v25;
    v50.size.height = v26;
    v48.origin.x = v16;
    v48.origin.y = v18;
    v48.size.width = v20;
    v48.size.height = v22;
    v27 = CGRectEqualToRect(v48, v50);
  }
  else
  {
    v27 = 0;
  }
  v28 = -[LPImageView _filter](self, "_filter");
  v29 = 0.0;
  if (v28 == 11 || v28 == 13)
  {
    -[LPImageView _effectiveCornerRadius](self, "_effectiveCornerRadius");
    v34 = v35;
    v32 = 1;
  }
  else if (v28 == 12)
  {
    if (v27)
    {
      -[LPImageView frame](self, "frame");
      v31 = v30;
      -[LPImageView frame](self, "frame");
      v32 = 0;
      v34 = fmin(v31, v33) * 0.5;
    }
    else
    {
      -[UIImageView frame](self->_imageView, "frame");
      v37 = v36;
      -[UIImageView frame](self->_imageView, "frame");
      v34 = fmin(v37, v38) * 0.5;
      -[UIView frame](self->_backgroundView, "frame");
      v40 = v39;
      -[UIView frame](self->_backgroundView, "frame");
      v32 = 0;
      v29 = fmin(v40, v41) * 0.5;
    }
  }
  else
  {
    v32 = 0;
    v34 = 0.0;
  }
  if (self->_platterReason)
  {
    +[LPTheme iconPlatterCornerRadius](LPTheme, "iconPlatterCornerRadius");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "value");
    v34 = v43;

  }
  if (v29 == 0.0)
    v44 = v34;
  else
    v44 = v29;
  if (v27)
    v45 = v34;
  else
    v45 = 0.0;
  if (v27)
  {
    v34 = 0.0;
    v46 = 0.0;
  }
  else
  {
    v46 = v44;
  }
  -[UIView _lp_setCornerRadius:continuous:](self, "_lp_setCornerRadius:continuous:", v32, v45, v44);
  -[UIImageView _lp_setCornerRadius:continuous:](self->_imageView, "_lp_setCornerRadius:continuous:", v32, v34);
  -[UIView _lp_setCornerRadius:continuous:](self->_backgroundView, "_lp_setCornerRadius:continuous:", v32, v46);
}

- (void)updateShadowPath
{
  void *v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGPathRef v21;
  CFTypeRef v22;
  uint64_t v23;
  CGPathRef v24;
  CFTypeRef v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGPathRef v44;
  CFTypeRef v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  CGRect v51;
  CGRect v52;

  -[LPImageViewStyle shadow](self->_style, "shadow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[LPImageView _filter](self, "_filter");
    if ((unint64_t)(v4 - 5) < 3
      || (v5 = v4,
          -[LPImage properties](self->_image, "properties"),
          v46 = (id)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v46, "type"),
          v46,
          v6 == 5)
      || !-[LPImageView shouldApplyBackground](self, "shouldApplyBackground")
      && -[LPImage _hasTransparency](self->_image, "_hasTransparency"))
    {
      -[LPImageView layer](self, "layer");
      v47 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setShadowPath:", 0);

      if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v7 = objc_msgSend(v48, "CGColor");
        -[LPImageView layer](self, "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShadowColor:", v7);
LABEL_8:

      }
    }
    else
    {
      if (-[LPImageView shouldApplyBackground](self, "shouldApplyBackground"))
        -[LPImageView bounds](self, "bounds");
      else
        -[UIImageView frame](self->_imageView, "frame");
      v13 = v9;
      v14 = v10;
      v15 = v11;
      v16 = v12;
      if (v5 == 3 || v5 == 13 || self->_platterReason)
      {
        -[LPImageView _effectiveCornerRadius](self, "_effectiveCornerRadius");
        v18 = v17;
        -[LPImageView _effectiveCornerRadius](self, "_effectiveCornerRadius");
        v20 = v19;
        v51.origin.x = v13;
        v51.origin.y = v14;
        v51.size.width = v15;
        v51.size.height = v16;
        v21 = CGPathCreateWithRoundedRect(v51, v18, v20, 0);
        v22 = CFAutorelease(v21);
        -[LPImageView layer](self, "layer");
        v49 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setShadowPath:", v22);
      }
      else if (v5 == 14)
      {
        -[LPImage platformImage](self->_image, "platformImage");
        v50 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "size");
        v27 = v26;
        v29 = v28;
        -[LPImageView bounds](self, "bounds");
        sizeFittingInsideSizeMaintainingAspectRatio(v27, v29, v30, v31);
        v33 = v32;
        v35 = v34;

        -[LPImageView bounds](self, "bounds");
        v37 = (v36 - v33) * 0.5;
        -[LPImageView bounds](self, "bounds");
        v39 = (v38 - v35) * 0.5;
        -[LPImageView _effectiveCornerRadius](self, "_effectiveCornerRadius");
        v41 = v40;
        -[LPImageView _effectiveCornerRadius](self, "_effectiveCornerRadius");
        v43 = v42;
        v52.origin.x = v37;
        v52.origin.y = v39;
        v52.size.width = v33;
        v52.size.height = v35;
        v44 = CGPathCreateWithRoundedRect(v52, v41, v43, 0);
        v45 = CFAutorelease(v44);
        -[LPImageView layer](self, "layer");
        v49 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setShadowPath:", v45);
      }
      else
      {
        if (v5 == 12)
          v24 = CGPathCreateWithEllipseInRect(*(CGRect *)&v9, 0);
        else
          v24 = CGPathCreateWithRect(*(CGRect *)&v9, 0);
        v25 = CFAutorelease(v24);
        -[LPImageView layer](self, "layer");
        v49 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setShadowPath:", v25);
      }

      if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
        v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v23 = objc_msgSend(v48, "CGColor");
        -[LPImageView layer](self, "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShadowColor:", v23);
        goto LABEL_8;
      }
    }
  }
}

- (void)updateBorder
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  -[LPImageViewStyle borderWidth](self->_style, "borderWidth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((unint64_t)(-[LPImageView _filter](self, "_filter") - 5) < 3
      || (-[LPImage properties](self->_image, "properties"),
          v12 = (id)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v12, "type"),
          v12,
          v4 == 5)
      || !-[LPImageView shouldApplyBackground](self, "shouldApplyBackground")
      && -[LPImage _hasTransparency](self->_image, "_hasTransparency"))
    {
      -[UIImageView layer](self->_imageView, "layer");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBorderWidth:", 0.0);

      -[UIImageView layer](self->_imageView, "layer");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBorderColor:", 0);

      -[LPImageView layer](self, "layer");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBorderWidth:", 0.0);

      -[LPImageView layer](self, "layer");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBorderColor:", 0);
    }
    else
    {
      v5 = -[LPImageView shouldApplyBackground](self, "shouldApplyBackground");
      -[LPImageViewStyle borderWidth](self->_style, "borderWidth");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "value");
      v7 = v6;
      if (v5)
      {
        -[LPImageView layer](self, "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBorderWidth:", v7);

        -[LPImageViewStyle borderColor](self->_style, "borderColor");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v9 = objc_msgSend(v16, "CGColor");
        -[LPImageView layer](self, "layer");
      }
      else
      {
        -[UIImageView layer](self->_imageView, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBorderWidth:", v7);

        -[LPImageViewStyle borderColor](self->_style, "borderColor");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v9 = objc_msgSend(v16, "CGColor");
        -[UIImageView layer](self->_imageView, "layer");
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBorderColor:", v9);

    }
  }
}

- (void)layoutComponentView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MidX;
  double v35;
  UIImageView *imageView;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _QWORD v52[9];
  CGRect v53;
  CGRect v54;

  -[LPImageView ensureImageView](self, "ensureImageView");
  -[LPImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v51 = v9;
  -[LPImageViewStyle padding](self->_style, "padding");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asInsetsForLTR:", -[UIImageView _lp_isLTR](self->_imageView, "_lp_isLTR"));
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[LPImage platformImage](self->_image, "platformImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "_lp_isSymbolImage");
  v21 = v4 + v14;
  v22 = v6 + v12;
  v23 = v14 + v18;
  v24 = v12 + v16;

  if (v20)
  {
    -[UIImageView alignmentRectInsets](self->_imageView, "alignmentRectInsets");
    v21 = v21 + v26 - v25;
    v22 = v22 + v28 - v27;
  }
  v29 = v8 - v23;
  v30 = v51 - v24;
  if (self->_currentScalingMode == 1)
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __34__LPImageView_layoutComponentView__block_invoke;
    v52[3] = &unk_1E44A9570;
    v52[4] = self;
    *(double *)&v52[5] = v21;
    *(double *)&v52[6] = v22;
    *(double *)&v52[7] = v29;
    *(double *)&v52[8] = v51 - v24;
    v31 = __34__LPImageView_layoutComponentView__block_invoke((uint64_t)v52);
    v33 = v32;
    v53.origin.x = v21;
    v53.origin.y = v22;
    v53.size.width = v29;
    v53.size.height = v30;
    MidX = CGRectGetMidX(v53);
    v54.origin.x = v21;
    v54.origin.y = v22;
    v54.size.width = v29;
    v54.size.height = v30;
    v35 = CGRectGetMidY(v54) - v33 * 0.5;
    imageView = self->_imageView;
    v37 = MidX - v31 * 0.5;
    v38 = v31;
    v39 = v33;
  }
  else
  {
    imageView = self->_imageView;
    v37 = v21;
    v35 = v22;
    v38 = v29;
    v39 = v51 - v24;
  }
  -[UIImageView setFrame:](imageView, "setFrame:", v37, v35, v38, v39);
  -[UIImageView frame](self->_imageView, "frame");
  -[UIView setFrame:](self->_overlayView, "setFrame:");
  if (-[LPImageView shouldApplyBackground](self, "shouldApplyBackground")
    && -[LPImageView _filter](self, "_filter") != 11)
  {
    -[LPImageView bounds](self, "bounds");
  }
  else
  {
    -[LPImageViewStyle backgroundInset](self->_style, "backgroundInset");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "value");
    v42 = v41;

    -[LPImageView bounds](self, "bounds");
    v44 = v42 + v43;
    v46 = v42 + v45;
    v48 = v47 - (v42 + v42);
    v50 = v49 - (v42 + v42);
  }
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v44, v46, v48, v50);
  -[LPImageView updateCornerRadius](self, "updateCornerRadius");
  -[LPImageView _updateScalingMode](self, "_updateScalingMode");
  -[LPImageView updateShadowPath](self, "updateShadowPath");
  -[LPImageView updateBorder](self, "updateBorder");
}

double __34__LPImageView_layoutComponentView__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "filter") == 3
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "requireFixedSize"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "fixedSize");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "asSize");
    sizeFittingInsideSizeMaintainingAspectRatio(v3, v4, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "fixedSize");
    v9 = v8;
    v11 = v10;
    v12 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "platformImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v14;
    if (v9 == v12 && v11 == v13)
    {
      objc_msgSend(v14, "size");
      sizeFittingInsideSizeMaintainingAspectRatio(v22, v23, *(double *)(a1 + 56), *(double *)(a1 + 64));
    }
    else
    {
      objc_msgSend(v14, "size");
      v17 = v16;
      v19 = v18;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "fixedSize");
      sizeFittingInsideSizeMaintainingAspectRatio(v17, v19, v20, v21);
    }
  }
  v6 = v5;

  return v6;
}

- (BOOL)shouldApplyBackground
{
  char v3;
  void *v5;

  if (-[LPImagePresentationProperties shouldApplyBackground](self->_properties, "shouldApplyBackground")
    || -[LPImageViewStyle shouldApplyBackground](self->_style, "shouldApplyBackground")
    || self->_platterReason)
  {
    return 1;
  }
  if (-[LPImageView _filter](self, "_filter") != 11)
    return 0;
  -[LPComponentView host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "usesBackgroundForSymbolImagesForComponentView:", self);

  return v3;
}

- (void)installDarkeningViewIfNeeded
{
  UIView *v3;
  UIView *overlayView;
  unint64_t v5;

  if (!self->_overlayView)
  {
    -[LPImageViewStyle darkeningAmount](self->_style, "darkeningAmount");
    -[LPImageView _createOverlayViewWithOpacity:](self, "_createOverlayViewWithOpacity:");
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
    overlayView = self->_overlayView;
    self->_overlayView = v3;

    -[UIImageView addSubview:](self->_imageView, "addSubview:", self->_overlayView);
    v5 = -[LPImageView _filter](self, "_filter");
    if (v5 <= 0xD && ((1 << v5) & 0x2808) != 0)
    {
      -[LPImageView _effectiveCornerRadius](self, "_effectiveCornerRadius");
      -[UIView _lp_setCornerRadius:](self, "_lp_setCornerRadius:");
    }
  }
}

- (int64_t)scalingModeForSize:(CGSize)a3
{
  double height;
  double width;
  int64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;

  height = a3.height;
  width = a3.width;
  v6 = -[LPImageViewStyle scalingMode](self->_style, "scalingMode");
  if (-[LPImagePresentationProperties scalingMode](self->_properties, "scalingMode"))
    v6 = -[LPImagePresentationProperties scalingMode](self->_properties, "scalingMode");
  -[LPImage properties](self->_image, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if ((unint64_t)(v8 - 1) < 6)
    v9 = 1;
  else
    v9 = v6;
  -[LPImageViewStyle minimumSize](self->_style, "minimumSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v9 == 1;
  else
    v11 = 0;
  if (v11)
  {
    -[LPImageViewStyle padding](self->_style, "padding");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[LPImageView imageSizeThatFits:](self, "imageSizeThatFits:", width - (v25 + v29), height - (v23 + v27));
    v31 = v30;
    v33 = v32;
    -[LPImageViewStyle minimumSize](self->_style, "minimumSize");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "width");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "value");
    if (ceil(v31) < v36)
    {

    }
    else
    {
      -[LPImageViewStyle minimumSize](self->_style, "minimumSize");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "height");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "value");
      v40 = v39;

      if (ceil(v33) >= v40)
        return 1;
    }
    return 2;
  }
  if (v9 == 3)
  {
    -[LPImage platformImage](self->_filteredImage, "platformImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "size");
    v14 = v13;
    -[UIImageView frame](self->_imageView, "frame");
    if (v14 > v15)
    {

    }
    else
    {
      -[LPImage platformImage](self->_filteredImage, "platformImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "size");
      v18 = v17;
      -[UIImageView frame](self->_imageView, "frame");
      v20 = v19;

      if (v18 <= v20)
        return 3;
    }
    return 1;
  }
  return v9;
}

- (CGSize)imageSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[LPImageViewStyle fixedSize](self->_style, "fixedSize");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    if (-[LPImageViewStyle filter](self->_style, "filter") == 3
      || -[LPImageViewStyle filter](self->_style, "filter") == 11
      || -[LPImageViewStyle requireFixedSize](self->_style, "requireFixedSize"))
    {

LABEL_6:
      -[LPImageViewStyle fixedSize](self->_style, "fixedSize");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "asSize");
      sizeFittingInsideSizeMaintainingAspectRatio(v9, v10, width, height);
      v12 = v11;
      v14 = v13;

      v15 = v12;
      v16 = v14;
      goto LABEL_14;
    }
    v17 = -[LPImagePresentationProperties requireFixedSize](self->_properties, "requireFixedSize");

    if (v17)
      goto LABEL_6;
  }
  -[LPImage platformImage](self->_image, "platformImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "size");
  v20 = v19;
  v22 = v21;

  v23 = -[LPImage _isFallbackIcon](self->_image, "_isFallbackIcon");
  v24 = fmax(v20, v22);
  if (v23)
    v25 = v24;
  else
    v25 = v20;
  if (!v23)
    v24 = v22;
  sizeFittingInsideSizeMaintainingAspectRatio(v25, v24, width, height);
LABEL_14:
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[LPImageViewStyle padding](self->_style, "padding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[LPImageView imageSizeThatFits:](self, "imageSizeThatFits:", width - (v10 + v14), height - (v8 + v12));
  v16 = ceil(v15);
  v18 = ceil(v17);
  -[LPImageViewStyle minimumSize](self->_style, "minimumSize");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = -[LPImageViewStyle requireFixedSize](self->_style, "requireFixedSize");

    if (!v21)
    {
      -[LPImageViewStyle minimumSize](self->_style, "minimumSize");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "width");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "value");
      v25 = v24;

      -[LPImageViewStyle minimumSize](self->_style, "minimumSize");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "height");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "value");
      v16 = fmax(v16, v25);
      v18 = fmax(v18, v28);

    }
  }
  -[LPImageViewStyle maximumSize](self->_style, "maximumSize");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    v31 = -[LPImageViewStyle requireFixedSize](self->_style, "requireFixedSize");

    if (!v31)
    {
      -[LPImageViewStyle maximumSize](self->_style, "maximumSize");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "width");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "value");
      v35 = v34;

      -[LPImageViewStyle maximumSize](self->_style, "maximumSize");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "height");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "value");
      v16 = fmin(v16, v35);
      v18 = fmin(v18, v38);

    }
  }
  v39 = v16 - (-v14 - v10);
  v40 = v18 - (-v12 - v8);
  result.height = v40;
  result.width = v39;
  return result;
}

- (id)_createOverlayViewWithOpacity:(double)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  -[LPComponentView host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appearanceForComponentView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "_lp_prefersDarkInterface");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", (double)v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v9, "_lp_setBackgroundColor:", v8);
  objc_msgSend(v9, "_lp_disableAutomaticVibrancy");

  return v9;
}

- (void)_updateScalingMode
{
  double v3;
  double v4;
  int64_t v5;

  -[LPImageView bounds](self, "bounds");
  v5 = -[LPImageView scalingModeForSize:](self, "scalingModeForSize:", v3, v4);
  if (v5 != self->_currentScalingMode)
  {
    self->_currentScalingMode = v5;
    -[LPImageView _setImageViewScalingMode:](self, "_setImageViewScalingMode:", v5);
  }
}

- (double)_effectiveCornerRadius
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[LPImageViewStyle cornerRadius](self->_style, "cornerRadius");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = v4;
  -[LPComponentView host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minimumCornerRadiusForComponentView:", self);
  v8 = fmax(v5, v7);

  return v8;
}

- (id)_createImageViewWithImage:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
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
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v44;
  _QWORD v45[5];
  id v46;
  id location;

  v5 = a3;
  objc_msgSend(v5, "_darkInterfaceAlternativeImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[LPImageView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceStyle") == 2)
    {
      objc_msgSend(v5, "_darkInterfaceAlternativeImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "platformImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
      goto LABEL_6;
    }
  }
  objc_msgSend(v5, "platformImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_5;
LABEL_6:

  v9 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v8, "_lp_pixelSize");
  v11 = v10;
  v13 = v12;
  if ((objc_msgSend(v8, "isSymbolImage") & 1) == 0 && !sizeFitsWithinSize(v11, v13, 1024.0, 1024.0))
  {
    -[LPComponentView host](self, "host");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "allowsAsynchronousImageDecodingForComponentView:", self);

    if (v15)
    {
      sizeFittingInsideSizeMaintainingAspectRatio(v11, v13, 1024.0, 1024.0);
      v17 = v16;
      v19 = v18;
      objc_initWeak(&location, v9);
      -[LPImageView setHidden:](self, "setHidden:", 1);
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __41__LPImageView__createImageViewWithImage___block_invoke;
      v45[3] = &unk_1E44A95C0;
      v45[4] = self;
      objc_copyWeak(&v46, &location);
      objc_msgSend(v8, "prepareThumbnailOfSize:completionHandler:", v45, v17, v19);

      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
      v8 = 0;
    }
  }
  objc_msgSend(v9, "setImage:", v8);
  objc_msgSend(v9, "setUserInteractionEnabled:", 1);
  objc_msgSend(v5, "properties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accessibilityText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v21);

  -[LPImageViewStyle fixedFallbackImageFont](self->_style, "fixedFallbackImageFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E0DC3888];
    -[LPImageViewStyle fixedFallbackImageFont](self->_style, "fixedFallbackImageFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "configurationWithFont:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0DC3888];
    -[LPImageViewStyle fixedFallbackImageScale](self->_style, "fixedFallbackImageScale");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "configurationWithScale:", objc_msgSend(v27, "integerValue"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "configurationByApplyingConfiguration:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreferredSymbolConfiguration:", v29);

  }
  else
  {
    -[LPImageViewStyle fixedFallbackImageSize](self->_style, "fixedFallbackImageSize");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30
      || (-[LPImageViewStyle fixedFallbackImageWeight](self->_style, "fixedFallbackImageWeight"),
          (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      -[LPImageViewStyle fixedFallbackImageFontTextStyle](self->_style, "fixedFallbackImageFontTextStyle");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPreferredSymbolConfiguration:", v24);
        goto LABEL_20;
      }
    }
    v31 = (void *)MEMORY[0x1E0DC3888];
    -[LPImageViewStyle fixedFallbackImageSize](self->_style, "fixedFallbackImageSize");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "value");
    objc_msgSend(v31, "configurationWithPointSize:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[LPImageViewStyle fixedFallbackImageWeight](self->_style, "fixedFallbackImageWeight");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = (void *)MEMORY[0x1E0DC3888];
      -[LPImageViewStyle fixedFallbackImageWeight](self->_style, "fixedFallbackImageWeight");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "configurationWithWeight:", objc_msgSend(v35, "integerValue"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "configurationByApplyingConfiguration:", v36);
      v37 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v37;
    }
    -[LPImageViewStyle fixedFallbackImageFontTextStyle](self->_style, "fixedFallbackImageFontTextStyle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = (void *)MEMORY[0x1E0DC3888];
      -[LPImageViewStyle fixedFallbackImageFontTextStyle](self->_style, "fixedFallbackImageFontTextStyle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "configurationWithTextStyle:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "configurationByApplyingConfiguration:", v41);
      v42 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v42;
    }
    objc_msgSend(v9, "setPreferredSymbolConfiguration:", v24);
  }
LABEL_20:

  return v9;
}

void __41__LPImageView__createImageViewWithImage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__LPImageView__createImageViewWithImage___block_invoke_2;
  block[3] = &unk_1E44A9598;
  block[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v7);
}

void __41__LPImageView__createImageViewWithImage___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 480);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (v2 == WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setImage:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_setImageViewScalingMode:(int64_t)a3
{
  UIImageView **p_imageView;
  UIImageView *imageView;
  _BOOL8 v6;

  if (a3 == 1)
  {
    p_imageView = &self->_imageView;
    v6 = 1;
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:");
    if (-[LPImageView _filter](self, "_filter") != 12)
      v6 = -[LPImageView _filter](self, "_filter") == 13;
  }
  else
  {
    if (a3 == 3)
    {
      p_imageView = &self->_imageView;
      imageView = self->_imageView;
      a3 = 4;
    }
    else
    {
      if (a3 != 2)
        return;
      p_imageView = &self->_imageView;
      imageView = self->_imageView;
    }
    -[UIImageView setContentMode:](imageView, "setContentMode:", a3);
    v6 = 1;
  }
  -[UIImageView setClipsToBounds:](*p_imageView, "setClipsToBounds:", v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_originalStyle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_filteredImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
