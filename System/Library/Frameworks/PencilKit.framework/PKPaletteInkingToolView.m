@implementation PKPaletteInkingToolView

- (PKPaletteInkingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PKPaletteInkingToolView *v21;
  _QWORD v24[3];
  _QWORD v25[3];
  __int128 v26;
  double v27[3];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = xmmword_1BE4FCCA0;
  *(_OWORD *)v27 = unk_1BE4FCCB0;
  v11 = objc_retainAutorelease(v10);
  DKUColorGetRGBAComponents((CGColor *)objc_msgSend(v11, "CGColor"), &v26);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("PKInkRedComponentProperty");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v24[1] = CFSTR("PKInkGreenComponentProperty");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v26 + 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  v24[2] = CFSTR("PKInkBlueComponentProperty");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27[0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("PKInkColorProperty"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  +[PKInk defaultWeightForIdentifier:](PKInk, "defaultWeightForIdentifier:", v9);
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("PKInkWeightProperty"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27[1]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("PKInkOpacityProperty"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("PKInkVariantProperty"));
  v20 = (void *)objc_msgSend(v12, "copy");
  v21 = -[PKPaletteInkingToolView initWithToolIdentifier:variant:configuration:toolProperties:](self, "initWithToolIdentifier:variant:configuration:toolProperties:", v9, v8, v7, v20);

  return v21;
}

- (PKPaletteInkingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5 toolProperties:(id)a6
{
  id v10;
  id v11;
  PKPaletteInkingToolView *v12;
  PKPaletteInkingToolView *v13;
  UIImageView *v14;
  UIImageView *colorIndicatorImageView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIImageView *v33;
  UIImageView *colorIndicatorContourImageView;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  UIImage *colorIndicatorContourImageUp;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  UIImage *colorIndicatorContourImageLeft;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  UIImage *colorIndicatorContourImageRight;
  UIImageView *v50;
  UIImageView *tipIndicatorImageView;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  UIImageView *v71;
  UIImageView *tipIndicatorContourImageView;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  UIImage *toolTipContourImageUp;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  UIImage *toolTipContourImageLeft;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  UIImage *toolTipContourImageRight;
  UILabel *v89;
  UILabel *opacityLabel;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  NSLayoutConstraint *opacityLabelTopConstraint;
  void *v97;
  void *v98;
  uint64_t v99;
  NSLayoutConstraint *opacityLabelLeftConstraint;
  void *v101;
  void *v102;
  uint64_t v103;
  NSLayoutConstraint *opacityLabelRightConstraint;
  void *v105;
  void *v106;
  uint64_t v107;
  NSLayoutConstraint *opacityLabelCenterXConstraint;
  void *v109;
  void *v110;
  uint64_t v111;
  NSLayoutConstraint *opacityLabelCenterYConstraint;
  objc_super v114;

  v10 = a3;
  v11 = a6;
  v114.receiver = self;
  v114.super_class = (Class)PKPaletteInkingToolView;
  v12 = -[PKPaletteToolView initWithToolIdentifier:variant:configuration:](&v114, sel_initWithToolIdentifier_variant_configuration_, v10, a4, a5);
  v13 = v12;
  if (v12)
  {
    -[PKPaletteInkingToolView _setToolProperties:toolIdentifier:](v12, "_setToolProperties:toolIdentifier:", v11, v10);
    if ((objc_msgSend(v10, "isEqual:", CFSTR("com.apple.ink.lasso")) & 1) == 0
      && (objc_msgSend(v10, "isEqual:", CFSTR("com.apple.ink.generationtool")) & 1) == 0)
    {
      v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      colorIndicatorImageView = v13->_colorIndicatorImageView;
      v13->_colorIndicatorImageView = v14;

      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithLegibilityWeight:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView _setLocalOverrideTraitCollection:](v13->_colorIndicatorImageView, "_setLocalOverrideTraitCollection:", v16);

      -[PKPaletteInkingToolView addSubview:](v13, "addSubview:", v13->_colorIndicatorImageView);
      -[PKPaletteToolView configuration](v13, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bandMaskImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "imageWithRenderingMode:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteInkingToolView setColorIndicatorImageUp:](v13, "setColorIndicatorImageUp:", v19);

      v20 = (void *)MEMORY[0x1E0DC3870];
      -[PKPaletteInkingToolView colorIndicatorImageUp](v13, "colorIndicatorImageUp");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = objc_msgSend(v21, "CGImage");
      -[PKPaletteInkingToolView colorIndicatorImageUp](v13, "colorIndicatorImageUp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "scale");
      objc_msgSend(v20, "imageWithCGImage:scale:orientation:", v22, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "imageWithRenderingMode:", 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteInkingToolView setColorIndicatorImageRight:](v13, "setColorIndicatorImageRight:", v25);

      v26 = (void *)MEMORY[0x1E0DC3870];
      -[PKPaletteInkingToolView colorIndicatorImageUp](v13, "colorIndicatorImageUp");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = objc_msgSend(v27, "CGImage");
      -[PKPaletteInkingToolView colorIndicatorImageUp](v13, "colorIndicatorImageUp");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "scale");
      objc_msgSend(v26, "imageWithCGImage:scale:orientation:", v28, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "imageWithRenderingMode:", 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteInkingToolView setColorIndicatorImageLeft:](v13, "setColorIndicatorImageLeft:", v31);

      -[PKPaletteInkingToolView colorIndicatorImageUp](v13, "colorIndicatorImageUp");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v13->_colorIndicatorImageView, "setImage:", v32);

      v33 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      colorIndicatorContourImageView = v13->_colorIndicatorContourImageView;
      v13->_colorIndicatorContourImageView = v33;

      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithLegibilityWeight:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView _setLocalOverrideTraitCollection:](v13->_colorIndicatorContourImageView, "_setLocalOverrideTraitCollection:", v35);

      -[PKPaletteInkingToolView addSubview:](v13, "addSubview:", v13->_colorIndicatorContourImageView);
      -[PKPaletteToolView configuration](v13, "configuration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bandContourImage");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "imageWithRenderingMode:", 1);
      v38 = objc_claimAutoreleasedReturnValue();
      colorIndicatorContourImageUp = v13->_colorIndicatorContourImageUp;
      v13->_colorIndicatorContourImageUp = (UIImage *)v38;

      v40 = (void *)MEMORY[0x1E0DC3870];
      v41 = -[UIImage CGImage](v13->_colorIndicatorContourImageUp, "CGImage");
      -[UIImage scale](v13->_colorIndicatorContourImageUp, "scale");
      objc_msgSend(v40, "imageWithCGImage:scale:orientation:", v41, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "imageWithRenderingMode:", 1);
      v43 = objc_claimAutoreleasedReturnValue();
      colorIndicatorContourImageLeft = v13->_colorIndicatorContourImageLeft;
      v13->_colorIndicatorContourImageLeft = (UIImage *)v43;

      v45 = (void *)MEMORY[0x1E0DC3870];
      v46 = -[UIImage CGImage](v13->_colorIndicatorContourImageUp, "CGImage");
      -[UIImage scale](v13->_colorIndicatorContourImageUp, "scale");
      objc_msgSend(v45, "imageWithCGImage:scale:orientation:", v46, 3);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "imageWithRenderingMode:", 1);
      v48 = objc_claimAutoreleasedReturnValue();
      colorIndicatorContourImageRight = v13->_colorIndicatorContourImageRight;
      v13->_colorIndicatorContourImageRight = (UIImage *)v48;

      -[UIImageView setImage:](v13->_colorIndicatorContourImageView, "setImage:", v13->_colorIndicatorContourImageUp);
      v50 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      tipIndicatorImageView = v13->_tipIndicatorImageView;
      v13->_tipIndicatorImageView = v50;

      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithLegibilityWeight:", 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView _setLocalOverrideTraitCollection:](v13->_tipIndicatorImageView, "_setLocalOverrideTraitCollection:", v52);

      -[PKPaletteToolView imageView](v13, "imageView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addSubview:", v13->_tipIndicatorImageView);

      -[PKPaletteToolView configuration](v13, "configuration");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "tipMaskImage");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "imageWithRenderingMode:", 2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteInkingToolView setToolTipImageUp:](v13, "setToolTipImageUp:", v56);

      v57 = (void *)MEMORY[0x1E0DC3870];
      -[PKPaletteInkingToolView toolTipImageUp](v13, "toolTipImageUp");
      v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v59 = objc_msgSend(v58, "CGImage");
      -[PKPaletteInkingToolView toolTipImageUp](v13, "toolTipImageUp");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "scale");
      objc_msgSend(v57, "imageWithCGImage:scale:orientation:", v59, 3);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "imageWithRenderingMode:", 2);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteInkingToolView setToolTipImageRight:](v13, "setToolTipImageRight:", v62);

      v63 = (void *)MEMORY[0x1E0DC3870];
      -[PKPaletteInkingToolView toolTipImageUp](v13, "toolTipImageUp");
      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v65 = objc_msgSend(v64, "CGImage");
      -[PKPaletteInkingToolView toolTipImageUp](v13, "toolTipImageUp");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "scale");
      objc_msgSend(v63, "imageWithCGImage:scale:orientation:", v65, 2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "imageWithRenderingMode:", 2);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteInkingToolView setToolTipImageLeft:](v13, "setToolTipImageLeft:", v68);

      -[PKPaletteInkingToolView toolTipImageUp](v13, "toolTipImageUp");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteInkingToolView tipIndicatorImageView](v13, "tipIndicatorImageView");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setImage:", v69);

      v71 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      tipIndicatorContourImageView = v13->_tipIndicatorContourImageView;
      v13->_tipIndicatorContourImageView = v71;

      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithLegibilityWeight:", 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView _setLocalOverrideTraitCollection:](v13->_tipIndicatorContourImageView, "_setLocalOverrideTraitCollection:", v73);

      -[PKPaletteToolView imageView](v13, "imageView");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "addSubview:", v13->_tipIndicatorContourImageView);

      -[PKPaletteToolView configuration](v13, "configuration");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "tipContourImage");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "imageWithRenderingMode:", 1);
      v77 = objc_claimAutoreleasedReturnValue();
      toolTipContourImageUp = v13->_toolTipContourImageUp;
      v13->_toolTipContourImageUp = (UIImage *)v77;

      v79 = (void *)MEMORY[0x1E0DC3870];
      v80 = -[UIImage CGImage](v13->_toolTipContourImageUp, "CGImage");
      -[UIImage scale](v13->_toolTipContourImageUp, "scale");
      objc_msgSend(v79, "imageWithCGImage:scale:orientation:", v80, 2);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "imageWithRenderingMode:", 1);
      v82 = objc_claimAutoreleasedReturnValue();
      toolTipContourImageLeft = v13->_toolTipContourImageLeft;
      v13->_toolTipContourImageLeft = (UIImage *)v82;

      v84 = (void *)MEMORY[0x1E0DC3870];
      v85 = -[UIImage CGImage](v13->_toolTipContourImageUp, "CGImage");
      -[UIImage scale](v13->_toolTipContourImageUp, "scale");
      objc_msgSend(v84, "imageWithCGImage:scale:orientation:", v85, 3);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "imageWithRenderingMode:", 1);
      v87 = objc_claimAutoreleasedReturnValue();
      toolTipContourImageRight = v13->_toolTipContourImageRight;
      v13->_toolTipContourImageRight = (UIImage *)v87;

      -[UIImageView setImage:](v13->_tipIndicatorContourImageView, "setImage:", v13->_toolTipContourImageUp);
      if (-[PKPaletteInkingToolView _shouldInstallOpacityLabel](v13, "_shouldInstallOpacityLabel"))
      {
        v89 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        opacityLabel = v13->_opacityLabel;
        v13->_opacityLabel = v89;

        -[PKPaletteInkingToolView _opacityLabelFont](v13, "_opacityLabelFont");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v13->_opacityLabel, "setFont:", v91);

        -[UILabel setTextAlignment:](v13->_opacityLabel, "setTextAlignment:", 1);
        -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13->_opacityLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[PKPaletteInkingToolView _opacityLabelTextColor](v13, "_opacityLabelTextColor");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v13->_opacityLabel, "setTextColor:", v92);

        -[PKPaletteInkingToolView addSubview:](v13, "addSubview:", v13->_opacityLabel);
        -[PKPaletteInkingToolView _updateOpacityLabel](v13, "_updateOpacityLabel");
        -[UILabel topAnchor](v13->_opacityLabel, "topAnchor");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteInkingToolView topAnchor](v13, "topAnchor");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "constraintEqualToAnchor:", v94);
        v95 = objc_claimAutoreleasedReturnValue();
        opacityLabelTopConstraint = v13->_opacityLabelTopConstraint;
        v13->_opacityLabelTopConstraint = (NSLayoutConstraint *)v95;

        -[UILabel leftAnchor](v13->_opacityLabel, "leftAnchor");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteInkingToolView leftAnchor](v13, "leftAnchor");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "constraintEqualToAnchor:", v98);
        v99 = objc_claimAutoreleasedReturnValue();
        opacityLabelLeftConstraint = v13->_opacityLabelLeftConstraint;
        v13->_opacityLabelLeftConstraint = (NSLayoutConstraint *)v99;

        -[PKPaletteInkingToolView rightAnchor](v13, "rightAnchor");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel rightAnchor](v13->_opacityLabel, "rightAnchor");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "constraintEqualToAnchor:", v102);
        v103 = objc_claimAutoreleasedReturnValue();
        opacityLabelRightConstraint = v13->_opacityLabelRightConstraint;
        v13->_opacityLabelRightConstraint = (NSLayoutConstraint *)v103;

        -[UILabel centerXAnchor](v13->_opacityLabel, "centerXAnchor");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteInkingToolView centerXAnchor](v13, "centerXAnchor");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "constraintEqualToAnchor:", v106);
        v107 = objc_claimAutoreleasedReturnValue();
        opacityLabelCenterXConstraint = v13->_opacityLabelCenterXConstraint;
        v13->_opacityLabelCenterXConstraint = (NSLayoutConstraint *)v107;

        -[UILabel centerYAnchor](v13->_opacityLabel, "centerYAnchor");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteInkingToolView centerYAnchor](v13, "centerYAnchor");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "constraintEqualToAnchor:", v110);
        v111 = objc_claimAutoreleasedReturnValue();
        opacityLabelCenterYConstraint = v13->_opacityLabelCenterYConstraint;
        v13->_opacityLabelCenterYConstraint = (NSLayoutConstraint *)v111;

      }
      -[PKPaletteInkingToolView setEdgeLocation:](v13, "setEdgeLocation:", 4);
    }
  }

  return v13;
}

- (BOOL)_shouldInstallOpacityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;

  -[PKPaletteToolView configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsOpacity"))
  {
    -[PKPaletteToolView configuration](self, "configuration");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = *(void **)(v4 + 160);
    else
      v6 = 0;
    v7 = v6;
    v8 = v7 == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_opacityLabelTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (void)_setToolProperties:(id)a3 toolIdentifier:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  +[PKInk inkWithIdentifier:properties:](PKInk, "inkWithIdentifier:properties:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView setInk:](self, "setInk:", v5);

  -[PKPaletteInkingToolView _updateOpacityLabel](self, "_updateOpacityLabel");
  -[PKPaletteToolView configuration](self, "configuration");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = *(void **)(v6 + 160);
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    -[PKPaletteToolView _setToolImageNeedsReload](self, "_setToolImageNeedsReload");
}

- (void)setToolProperties:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaletteToolView toolIdentifier](self, "toolIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView _setToolProperties:toolIdentifier:](self, "_setToolProperties:toolIdentifier:", v4, v5);

}

- (id)toolProperties
{
  void *v2;
  void *v3;

  -[PKPaletteInkingToolView ink](self, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)PKPaletteInkingToolView;
  -[PKPaletteToolView layoutSubviews](&v33, sel_layoutSubviews);
  -[PKPaletteInkingToolView _colorIndicatorImageViewFrame](self, "_colorIndicatorImageViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPaletteInkingToolView colorIndicatorImageView](self, "colorIndicatorImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PKPaletteInkingToolView colorIndicatorContourImageView](self, "colorIndicatorContourImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[PKPaletteToolView imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PKPaletteInkingToolView tipIndicatorImageView](self, "tipIndicatorImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[PKPaletteToolView imageView](self, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[PKPaletteInkingToolView tipIndicatorContourImageView](self, "tipIndicatorContourImageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

}

- (id)_toolColorIndicatorImageForCurrentEdgeLocation
{
  void *v3;

  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
  {
    -[PKPaletteInkingToolView colorIndicatorImageRight](self, "colorIndicatorImageRight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 8)
      -[PKPaletteInkingToolView colorIndicatorImageLeft](self, "colorIndicatorImageLeft");
    else
      -[PKPaletteInkingToolView colorIndicatorImageUp](self, "colorIndicatorImageUp");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_toolColorIndicatorContourImageForCurrentEdgeLocation
{
  void *v3;

  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
  {
    -[PKPaletteInkingToolView colorIndicatorContourImageRight](self, "colorIndicatorContourImageRight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 8)
      -[PKPaletteInkingToolView colorIndicatorContourImageLeft](self, "colorIndicatorContourImageLeft");
    else
      -[PKPaletteInkingToolView colorIndicatorContourImageUp](self, "colorIndicatorContourImageUp");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_toolTipImageForCurrentEdgeLocation
{
  void *v3;

  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
  {
    -[PKPaletteInkingToolView toolTipImageRight](self, "toolTipImageRight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 8)
      -[PKPaletteInkingToolView toolTipImageLeft](self, "toolTipImageLeft");
    else
      -[PKPaletteInkingToolView toolTipImageUp](self, "toolTipImageUp");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_toolTipContourImageForCurrentEdgeLocation
{
  void *v3;

  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
  {
    -[PKPaletteInkingToolView toolTipContourImageRight](self, "toolTipContourImageRight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 8)
      -[PKPaletteInkingToolView toolTipContourImageLeft](self, "toolTipContourImageLeft");
    else
      -[PKPaletteInkingToolView toolTipContourImageUp](self, "toolTipContourImageUp");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (CGRect)_colorIndicatorImageViewFrame
{
  void *v3;
  void *v4;
  double v5;
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
  CGRect v19;
  CGRect result;

  -[PKPaletteToolView configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsStrokeWeight"))
  {
    -[PKPaletteInkingToolView ink](self, "ink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "weight");
    -[PKToolConfiguration bandThicknessForStrokeWeight:](v3, v5);
  }
  else
  {
    -[PKPaletteInkingToolView colorIndicatorImageUp](self, "colorIndicatorImageUp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
  }

  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  -[PKPaletteToolView _toolSelectedOffset](self, "_toolSelectedOffset");
  objc_msgSend(v3, "bandVerticalOffset");
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  -[PKPaletteToolView edgeLocation](self, "edgeLocation");
  -[PKPaletteToolView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");

  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
  {
    -[PKPaletteInkingToolView bounds](self, "bounds");
    CGRectGetWidth(v19);
  }
  else
  {
    -[PKPaletteToolView edgeLocation](self, "edgeLocation");
  }
  UIRectIntegralWithScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  char v15;
  int v16;
  double v17;
  int v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  objc_super v23;

  -[PKPaletteInkingToolView opacityLabelTopConstraint](self, "opacityLabelTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 0.0);

  -[PKPaletteInkingToolView opacityLabelLeftConstraint](self, "opacityLabelLeftConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", 0.0);

  -[PKPaletteInkingToolView opacityLabelRightConstraint](self, "opacityLabelRightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", 0.0);

  -[PKPaletteToolView configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "opacityLabelVerticalOffset");
  v8 = v7;
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  v10 = v8 * v9;

  -[PKPaletteInkingToolView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PKUseCompactSize(v11, v13);

  v15 = -[PKPaletteInkingToolView isSelected](self, "isSelected");
  if (v14)
  {
    if ((v15 & 1) == 0)
    {
      v16 = -[PKPaletteInkingToolView isHighlighted](self, "isHighlighted");
      v17 = 10.0;
      if (v16)
        v17 = 11.0;
      v10 = v10 + v17;
    }
    goto LABEL_14;
  }
  if ((v15 & 1) == 0)
  {
    v18 = -[PKPaletteInkingToolView isHighlighted](self, "isHighlighted");
    -[PKPaletteToolView scalingFactor](self, "scalingFactor");
    v20 = 20.0;
    if (v18)
      v20 = 22.0;
    v10 = v10 + v19 * v20;
  }
  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
  {
    -[PKPaletteInkingToolView opacityLabelRightConstraint](self, "opacityLabelRightConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") != 8)
    {
LABEL_14:
      -[PKPaletteInkingToolView opacityLabelTopConstraint](self, "opacityLabelTopConstraint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    -[PKPaletteInkingToolView opacityLabelLeftConstraint](self, "opacityLabelLeftConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:
  v22 = v21;
  objc_msgSend(v21, "setConstant:", v10);

  v23.receiver = self;
  v23.super_class = (Class)PKPaletteInkingToolView;
  -[PKPaletteToolView updateConstraints](&v23, sel_updateConstraints);
}

- (void)setEdgeLocation:(unint64_t)a3
{
  unint64_t v5;
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
  _QWORD *v17;
  unint64_t v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _OWORD v35[3];
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  objc_super v40;
  _QWORD v41[2];
  _QWORD v42[3];
  _QWORD v43[2];
  _QWORD v44[4];
  _QWORD v45[2];
  _QWORD v46[5];

  v46[4] = *MEMORY[0x1E0C80C00];
  v5 = -[PKPaletteToolView edgeLocation](self, "edgeLocation");
  v40.receiver = self;
  v40.super_class = (Class)PKPaletteInkingToolView;
  -[PKPaletteToolView setEdgeLocation:](&v40, sel_setEdgeLocation_, a3);
  if (v5 != -[PKPaletteToolView edgeLocation](self, "edgeLocation"))
  {
    if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
    {
      if (-[PKPaletteInkingToolView _shouldInstallOpacityLabel](self, "_shouldInstallOpacityLabel"))
      {
        CGAffineTransformMakeRotation(&v39, 1.57079633);
        -[PKPaletteInkingToolView opacityLabel](self, "opacityLabel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v39;
        objc_msgSend(v6, "setTransform:", &v38);

        v7 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteInkingToolView opacityLabelLeftConstraint](self, "opacityLabelLeftConstraint");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = v8;
        -[PKPaletteInkingToolView opacityLabelTopConstraint](self, "opacityLabelTopConstraint");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v46[1] = v9;
        -[PKPaletteInkingToolView opacityLabelRightConstraint](self, "opacityLabelRightConstraint");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v46[2] = v10;
        -[PKPaletteInkingToolView opacityLabelCenterXConstraint](self, "opacityLabelCenterXConstraint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v46[3] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "deactivateConstraints:", v12);

        v13 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteInkingToolView opacityLabelRightConstraint](self, "opacityLabelRightConstraint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v14;
        -[PKPaletteInkingToolView opacityLabelCenterYConstraint](self, "opacityLabelCenterYConstraint");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v15;
        v16 = (void *)MEMORY[0x1E0C99D20];
        v17 = v45;
LABEL_10:
        objc_msgSend(v16, "arrayWithObjects:count:", v17, 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "activateConstraints:", v34);

      }
    }
    else
    {
      v18 = -[PKPaletteToolView edgeLocation](self, "edgeLocation");
      v19 = -[PKPaletteInkingToolView _shouldInstallOpacityLabel](self, "_shouldInstallOpacityLabel");
      if (v18 == 8)
      {
        if (v19)
        {
          CGAffineTransformMakeRotation(&v37, -1.57079633);
          -[PKPaletteInkingToolView opacityLabel](self, "opacityLabel");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v37;
          objc_msgSend(v20, "setTransform:", &v36);

          v21 = (void *)MEMORY[0x1E0CB3718];
          -[PKPaletteInkingToolView opacityLabelRightConstraint](self, "opacityLabelRightConstraint");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = v22;
          -[PKPaletteInkingToolView opacityLabelTopConstraint](self, "opacityLabelTopConstraint");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v44[1] = v23;
          -[PKPaletteInkingToolView opacityLabelRightConstraint](self, "opacityLabelRightConstraint");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v44[2] = v24;
          -[PKPaletteInkingToolView opacityLabelCenterXConstraint](self, "opacityLabelCenterXConstraint");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v44[3] = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "deactivateConstraints:", v26);

          v13 = (void *)MEMORY[0x1E0CB3718];
          -[PKPaletteInkingToolView opacityLabelLeftConstraint](self, "opacityLabelLeftConstraint");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = v14;
          -[PKPaletteInkingToolView opacityLabelCenterYConstraint](self, "opacityLabelCenterYConstraint");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v43[1] = v15;
          v16 = (void *)MEMORY[0x1E0C99D20];
          v17 = v43;
          goto LABEL_10;
        }
      }
      else if (v19)
      {
        -[PKPaletteInkingToolView opacityLabel](self, "opacityLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v35[0] = *MEMORY[0x1E0C9BAA8];
        v35[1] = v28;
        v35[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        objc_msgSend(v27, "setTransform:", v35);

        v29 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteInkingToolView opacityLabelRightConstraint](self, "opacityLabelRightConstraint");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v30;
        -[PKPaletteInkingToolView opacityLabelLeftConstraint](self, "opacityLabelLeftConstraint");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v42[1] = v31;
        -[PKPaletteInkingToolView opacityLabelCenterYConstraint](self, "opacityLabelCenterYConstraint");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v42[2] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "deactivateConstraints:", v33);

        v13 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteInkingToolView opacityLabelCenterXConstraint](self, "opacityLabelCenterXConstraint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v14;
        -[PKPaletteInkingToolView opacityLabelTopConstraint](self, "opacityLabelTopConstraint");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v15;
        v16 = (void *)MEMORY[0x1E0C99D20];
        v17 = v41;
        goto LABEL_10;
      }
    }
    -[PKPaletteInkingToolView _updateToolColorBandAndTipImageViews](self, "_updateToolColorBandAndTipImageViews");
    -[PKPaletteInkingToolView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (int64_t)_uiColorUserInterfaceStyle
{
  void *v4;
  int64_t v5;

  if (-[PKPaletteToolView colorUserInterfaceStyle](self, "colorUserInterfaceStyle"))
    return -[PKPaletteToolView colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
  -[PKPaletteInkingToolView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  return v5;
}

- (id)_uiColor
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPaletteInkingToolView ink](self, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkingTool convertColor:fromUserInterfaceStyle:to:](PKInkingTool, "convertColor:fromUserInterfaceStyle:to:", v4, 1, -[PKPaletteInkingToolView _uiColorUserInterfaceStyle](self, "_uiColorUserInterfaceStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateToolColorBandAndTipImageViews
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
  id v16;

  -[PKPaletteInkingToolView _toolColorIndicatorImageForCurrentEdgeLocation](self, "_toolColorIndicatorImageForCurrentEdgeLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView colorIndicatorImageView](self, "colorIndicatorImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

  -[PKPaletteInkingToolView _uiColor](self, "_uiColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView colorIndicatorImageView](self, "colorIndicatorImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

  -[PKPaletteInkingToolView _toolColorIndicatorContourImageForCurrentEdgeLocation](self, "_toolColorIndicatorContourImageForCurrentEdgeLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView colorIndicatorContourImageView](self, "colorIndicatorContourImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

  -[PKPaletteInkingToolView _toolTipImageForCurrentEdgeLocation](self, "_toolTipImageForCurrentEdgeLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView tipIndicatorImageView](self, "tipIndicatorImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v10);

  -[PKPaletteInkingToolView _uiColor](self, "_uiColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView tipIndicatorImageView](self, "tipIndicatorImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTintColor:", v13);

  -[PKPaletteInkingToolView _toolTipContourImageForCurrentEdgeLocation](self, "_toolTipContourImageForCurrentEdgeLocation");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView tipIndicatorContourImageView](self, "tipIndicatorContourImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v16);

}

- (void)_reloadToolImage
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteInkingToolView;
  -[PKPaletteToolView _reloadToolImage](&v3, sel__reloadToolImage);
  -[PKPaletteInkingToolView _updateToolColorBandAndTipImageViews](self, "_updateToolColorBandAndTipImageViews");
}

- (void)setInk:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (!-[PKInk isEqual:](self->_ink, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_ink, a3);
    -[PKPaletteToolView configuration](self, "configuration");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = *(void **)(v5 + 160);
    else
      v7 = 0;
    v8 = v7;

    if (v8)
      -[PKPaletteToolView _setToolImageNeedsReload](self, "_setToolImageNeedsReload");
    -[PKPaletteInkingToolView _updateToolColorBandAndTipImageViews](self, "_updateToolColorBandAndTipImageViews");
    -[PKPaletteInkingToolView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setInkColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  CGColor *ConvertedToSRGB;
  uint64_t v9;
  CGColor *v10;
  BOOL IsEqualToColorIgnoringOpacity;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  -[PKPaletteInkingToolView ink](self, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = v4;
  ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB(objc_msgSend(v6, "CGColor"));
  v18 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v18, "CGColor");

  v10 = DKUCGColorCreateConvertedToSRGB(v9);
  IsEqualToColorIgnoringOpacity = DKUColorIsEqualToColorIgnoringOpacity(ConvertedToSRGB, v10, 0);
  CGColorRelease(ConvertedToSRGB);
  CGColorRelease(v10);

  if (!IsEqualToColorIgnoringOpacity)
  {
    -[PKPaletteInkingToolView ink](self, "ink");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v12, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteInkingToolView setInk:](self, "setInk:", v13);

    -[PKPaletteToolView configuration](self, "configuration");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = *(void **)(v14 + 160);
    else
      v16 = 0;
    v17 = v16;

    if (v17)
      -[PKPaletteToolView _setToolImageNeedsReload](self, "_setToolImageNeedsReload");
    -[PKPaletteInkingToolView _updateOpacityLabel](self, "_updateOpacityLabel");
  }

}

- (void)_updateOpacityLabel
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  id v9;

  if (-[PKPaletteInkingToolView _shouldInstallOpacityLabel](self, "_shouldInstallOpacityLabel"))
  {
    -[PKPaletteInkingToolView ink](self, "ink");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alphaComponent");
    v6 = v5;

    v7 = llround(v6 * 100.0);
    if (v7 > 0x63)
    {
      -[PKPaletteInkingToolView opacityLabel](self, "opacityLabel");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[PKPaletteInkingToolView opacityLabel](self, "opacityLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v9);

    }
  }
}

- (void)setInkWeight:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  -[PKPaletteInkingToolView ink](self, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "weight");
  v7 = vabdd_f64(v6, a3);

  if (v7 >= 0.1)
  {
    -[PKPaletteInkingToolView ink](self, "ink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInk inkFromInk:weight:](PKInk, "inkFromInk:weight:", v8, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteInkingToolView setInk:](self, "setInk:", v9);

    -[PKPaletteToolView configuration](self, "configuration");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = *(void **)(v10 + 160);
    else
      v12 = 0;
    v13 = v12;

    if (v13)
      -[PKPaletteToolView _setToolImageNeedsReload](self, "_setToolImageNeedsReload");
  }
}

- (id)attributeViewController
{
  PKInkAttributesPicker *v3;
  void *v4;
  void *v5;
  PKPaletteAttributeViewController *v6;
  PKPaletteAttributeViewController *attributeViewController;
  PKPaletteAttributeViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(void);
  void *v14;
  id v15;
  PKPaletteAttributeViewController *v16;
  PKPaletteAttributeViewController *v17;
  objc_super v19;

  if (!self->_attributeViewController
    && -[PKPaletteInkingToolView _shouldHaveAttributeViewController](self, "_shouldHaveAttributeViewController"))
  {
    v3 = [PKInkAttributesPicker alloc];
    -[PKPaletteInkingToolView ink](self, "ink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKInkAttributesPicker initWithInk:toolConfiguration:](v3, "initWithInk:toolConfiguration:", v4, v5);

    -[PKPaletteAttributeViewController setDisplayMode:](v6, "setDisplayMode:", -[PKPaletteInkingToolView _displayModeForAttributeViewController](self, "_displayModeForAttributeViewController"));
    -[PKPaletteAttributeViewController setMinimumOpacityValue:](v6, "setMinimumOpacityValue:", 0.0);
    -[PKPaletteAttributeViewController setDelegate:](v6, "setDelegate:", self);
    attributeViewController = self->_attributeViewController;
    self->_attributeViewController = v6;

  }
  v8 = self->_attributeViewController;
  -[PKPaletteInkingToolView ink](self, "ink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteAttributeViewController setSelectedInk:](v8, "setSelectedInk:", v9);

  -[PKPaletteAttributeViewController setColorUserInterfaceStyle:](v8, "setColorUserInterfaceStyle:", -[PKPaletteToolView colorUserInterfaceStyle](self, "colorUserInterfaceStyle"));
  -[PKPaletteToolView configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PKPaletteToolView configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewControllerProvider");
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v13[2]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("view controller from configuration must not be nil."), 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v15);
    }
  }
  else
  {
    v14 = 0;
  }
  -[PKPaletteAttributeViewController setTopViewController:](v8, "setTopViewController:", v14);
  v16 = self->_attributeViewController;
  if (!v16)
  {
    v19.receiver = self;
    v19.super_class = (Class)PKPaletteInkingToolView;
    -[PKPaletteToolView attributeViewController](&v19, sel_attributeViewController);
    v17 = (PKPaletteAttributeViewController *)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_11;
    v16 = self->_attributeViewController;
  }
  v17 = v16;
LABEL_11:

  return v17;
}

- (BOOL)_hasStrokeWeightControl
{
  _BYTE *v2;
  int v3;
  BOOL v4;

  -[PKPaletteToolView configuration](self, "configuration");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsStrokeWeight");
  v4 = 0;
  if (v2 && v3)
    v4 = v2[19] != 0;

  return v4;
}

- (BOOL)_hasOpacityControl
{
  _BYTE *v2;
  int v3;
  BOOL v4;

  -[PKPaletteToolView configuration](self, "configuration");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsOpacity");
  v4 = 0;
  if (v2 && v3)
    v4 = v2[20] != 0;

  return v4;
}

- (BOOL)_shouldHaveAttributeViewController
{
  return -[PKPaletteInkingToolView _hasStrokeWeightControl](self, "_hasStrokeWeightControl")
      || -[PKPaletteInkingToolView _hasOpacityControl](self, "_hasOpacityControl");
}

- (unint64_t)_displayModeForAttributeViewController
{
  _BOOL4 v3;
  _BOOL4 v4;
  BOOL v5;
  unint64_t result;
  NSObject *v7;
  uint8_t v8[16];

  v3 = -[PKPaletteInkingToolView _hasStrokeWeightControl](self, "_hasStrokeWeightControl");
  v4 = -[PKPaletteInkingToolView _hasOpacityControl](self, "_hasOpacityControl");
  v5 = v4;
  if (v3)
    result = !v3 || !v4;
  else
    result = 2;
  if (!v3 && !v5)
  {
    v7 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1BE213000, v7, OS_LOG_TYPE_FAULT, "Should not ask for display mode if tool supports neither stroke weight or opacity.", v8, 2u);
    }

    return 2;
  }
  return result;
}

- (void)inkAttributesPickerDidChangeInkOpacity:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "selectedInk");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v5 = objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView setInkColor:](self, "setInkColor:", v5);

  LOBYTE(v5) = objc_msgSend(v4, "isUpdatingOpacityValue");
  if ((v5 & 1) == 0)
    -[PKPaletteInkingToolView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);

}

- (void)inkAttributesPickerDidChangeInkThickness:(id)a3
{
  id v4;

  objc_msgSend(a3, "selectedInk");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "weight");
  -[PKPaletteInkingToolView setInkWeight:](self, "setInkWeight:");
  -[PKPaletteInkingToolView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);

}

- (void)setScalingFactor:(double)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteInkingToolView;
  -[PKPaletteToolView setScalingFactor:](&v6, sel_setScalingFactor_, a3);
  -[PKPaletteInkingToolView _opacityLabelFont](self, "_opacityLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolView opacityLabel](self, "opacityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[PKPaletteInkingToolView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (id)_opacityLabelFont
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x1E0DC1350];
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  return (id)objc_msgSend(v2, "boldSystemFontOfSize:", v3 * 8.0);
}

- (PKInk)ink
{
  return self->_ink;
}

- (UIImageView)colorIndicatorImageView
{
  return self->_colorIndicatorImageView;
}

- (void)setColorIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_colorIndicatorImageView, a3);
}

- (UIImage)colorIndicatorImageUp
{
  return self->_colorIndicatorImageUp;
}

- (void)setColorIndicatorImageUp:(id)a3
{
  objc_storeStrong((id *)&self->_colorIndicatorImageUp, a3);
}

- (UIImage)colorIndicatorImageRight
{
  return self->_colorIndicatorImageRight;
}

- (void)setColorIndicatorImageRight:(id)a3
{
  objc_storeStrong((id *)&self->_colorIndicatorImageRight, a3);
}

- (UIImage)colorIndicatorImageLeft
{
  return self->_colorIndicatorImageLeft;
}

- (void)setColorIndicatorImageLeft:(id)a3
{
  objc_storeStrong((id *)&self->_colorIndicatorImageLeft, a3);
}

- (UIImageView)colorIndicatorContourImageView
{
  return self->_colorIndicatorContourImageView;
}

- (void)setColorIndicatorContourImageView:(id)a3
{
  objc_storeStrong((id *)&self->_colorIndicatorContourImageView, a3);
}

- (UIImage)colorIndicatorContourImageUp
{
  return self->_colorIndicatorContourImageUp;
}

- (void)setColorIndicatorContourImageUp:(id)a3
{
  objc_storeStrong((id *)&self->_colorIndicatorContourImageUp, a3);
}

- (UIImage)colorIndicatorContourImageRight
{
  return self->_colorIndicatorContourImageRight;
}

- (void)setColorIndicatorContourImageRight:(id)a3
{
  objc_storeStrong((id *)&self->_colorIndicatorContourImageRight, a3);
}

- (UIImage)colorIndicatorContourImageLeft
{
  return self->_colorIndicatorContourImageLeft;
}

- (void)setColorIndicatorContourImageLeft:(id)a3
{
  objc_storeStrong((id *)&self->_colorIndicatorContourImageLeft, a3);
}

- (UIImageView)tipIndicatorImageView
{
  return self->_tipIndicatorImageView;
}

- (void)setTipIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_tipIndicatorImageView, a3);
}

- (UIImage)toolTipImageUp
{
  return self->_toolTipImageUp;
}

- (void)setToolTipImageUp:(id)a3
{
  objc_storeStrong((id *)&self->_toolTipImageUp, a3);
}

- (UIImage)toolTipImageRight
{
  return self->_toolTipImageRight;
}

- (void)setToolTipImageRight:(id)a3
{
  objc_storeStrong((id *)&self->_toolTipImageRight, a3);
}

- (UIImage)toolTipImageLeft
{
  return self->_toolTipImageLeft;
}

- (void)setToolTipImageLeft:(id)a3
{
  objc_storeStrong((id *)&self->_toolTipImageLeft, a3);
}

- (UIImageView)tipIndicatorContourImageView
{
  return self->_tipIndicatorContourImageView;
}

- (void)setTipIndicatorContourImageView:(id)a3
{
  objc_storeStrong((id *)&self->_tipIndicatorContourImageView, a3);
}

- (UIImage)toolTipContourImageUp
{
  return self->_toolTipContourImageUp;
}

- (void)setToolTipContourImageUp:(id)a3
{
  objc_storeStrong((id *)&self->_toolTipContourImageUp, a3);
}

- (UIImage)toolTipContourImageRight
{
  return self->_toolTipContourImageRight;
}

- (void)setToolTipContourImageRight:(id)a3
{
  objc_storeStrong((id *)&self->_toolTipContourImageRight, a3);
}

- (UIImage)toolTipContourImageLeft
{
  return self->_toolTipContourImageLeft;
}

- (void)setToolTipContourImageLeft:(id)a3
{
  objc_storeStrong((id *)&self->_toolTipContourImageLeft, a3);
}

- (UILabel)opacityLabel
{
  return self->_opacityLabel;
}

- (void)setOpacityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_opacityLabel, a3);
}

- (NSLayoutConstraint)opacityLabelTopConstraint
{
  return self->_opacityLabelTopConstraint;
}

- (void)setOpacityLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_opacityLabelTopConstraint, a3);
}

- (NSLayoutConstraint)opacityLabelLeftConstraint
{
  return self->_opacityLabelLeftConstraint;
}

- (void)setOpacityLabelLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_opacityLabelLeftConstraint, a3);
}

- (NSLayoutConstraint)opacityLabelRightConstraint
{
  return self->_opacityLabelRightConstraint;
}

- (void)setOpacityLabelRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_opacityLabelRightConstraint, a3);
}

- (NSLayoutConstraint)opacityLabelCenterXConstraint
{
  return self->_opacityLabelCenterXConstraint;
}

- (void)setOpacityLabelCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_opacityLabelCenterXConstraint, a3);
}

- (NSLayoutConstraint)opacityLabelCenterYConstraint
{
  return self->_opacityLabelCenterYConstraint;
}

- (void)setOpacityLabelCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_opacityLabelCenterYConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacityLabelCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_opacityLabelCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_opacityLabelRightConstraint, 0);
  objc_storeStrong((id *)&self->_opacityLabelLeftConstraint, 0);
  objc_storeStrong((id *)&self->_opacityLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_opacityLabel, 0);
  objc_storeStrong((id *)&self->_toolTipContourImageLeft, 0);
  objc_storeStrong((id *)&self->_toolTipContourImageRight, 0);
  objc_storeStrong((id *)&self->_toolTipContourImageUp, 0);
  objc_storeStrong((id *)&self->_tipIndicatorContourImageView, 0);
  objc_storeStrong((id *)&self->_toolTipImageLeft, 0);
  objc_storeStrong((id *)&self->_toolTipImageRight, 0);
  objc_storeStrong((id *)&self->_toolTipImageUp, 0);
  objc_storeStrong((id *)&self->_tipIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_colorIndicatorContourImageLeft, 0);
  objc_storeStrong((id *)&self->_colorIndicatorContourImageRight, 0);
  objc_storeStrong((id *)&self->_colorIndicatorContourImageUp, 0);
  objc_storeStrong((id *)&self->_colorIndicatorContourImageView, 0);
  objc_storeStrong((id *)&self->_colorIndicatorImageLeft, 0);
  objc_storeStrong((id *)&self->_colorIndicatorImageRight, 0);
  objc_storeStrong((id *)&self->_colorIndicatorImageUp, 0);
  objc_storeStrong((id *)&self->_colorIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_attributeViewController, 0);
}

@end
