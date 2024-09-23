@implementation PKPaletteToolView

+ (PKPaletteToolView)toolViewWithIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  __CFString *v7;
  id v8;
  id v9;
  __objc2_class **v10;
  const __CFString *v11;
  void *v12;

  v7 = (__CFString *)a3;
  v8 = a4;
  v9 = a5;
  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.eraser")) & 1) != 0
    || (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.objectEraser")) & 1) != 0)
  {
    v10 = off_1E776F7E8;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.pen")) & 1) != 0
         || (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.pencil")) & 1) != 0
         || (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.marker")) & 1) != 0
         || (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.custom")) & 1) != 0
         || (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")) & 1) != 0
         || (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.watercolor")) & 1) != 0
         || (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) != 0
         || (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.crayon")) & 1) != 0)
  {
    v10 = off_1E776F808;
  }
  else
  {
    v10 = off_1E776F890;
    v11 = v7;
    if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.lasso")) & 1) != 0)
      goto LABEL_14;
    v11 = CFSTR("com.apple.ink.handwriting");
    if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.handwriting")) & 1) != 0)
    {
      v10 = off_1E776F7F8;
      goto LABEL_14;
    }
    if (!-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.ink.generationtool")))
      v10 = off_1E776F938;
  }
  v11 = v7;
LABEL_14:
  v12 = (void *)objc_msgSend(objc_alloc(*v10), "initWithToolIdentifier:variant:configuration:", v11, v8, v9);

  return (PKPaletteToolView *)v12;
}

- (PKPaletteToolView)initWithToolIdentifier:(id)a3 configuration:(id)a4 toolProperties:(id)a5
{
  id v8;
  PKPaletteToolView *v9;

  v8 = a5;
  v9 = -[PKPaletteToolView initWithToolIdentifier:variant:configuration:](self, "initWithToolIdentifier:variant:configuration:", a3, 0, a4);
  -[PKPaletteToolView setToolProperties:](v9, "setToolProperties:", v8);

  return v9;
}

- (PKPaletteToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaletteToolView *v11;
  uint64_t v12;
  NSString *toolIdentifier;
  uint64_t v14;
  NSString *toolVariant;
  NSDictionary *toolProperties;
  uint64_t v17;
  PKToolConfiguration *configuration;
  PKPaletteToolShadowPathView *v19;
  PKPaletteToolShadowPathView *toolShadowView;
  UIImageView *v21;
  UIImageView *imageView;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *imageViewWidthAnchorConstraint;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  NSLayoutConstraint *imageViewHeightAnchorConstraint;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSLayoutConstraint *imageViewTopAnchorConstraint;
  void *v41;
  void *v42;
  uint64_t v43;
  NSLayoutConstraint *imageViewBottomAnchorConstraint;
  void *v45;
  void *v46;
  uint64_t v47;
  NSLayoutConstraint *imageViewLeftAnchorConstraint;
  void *v49;
  void *v50;
  uint64_t v51;
  NSLayoutConstraint *imageViewRightAnchorConstraint;
  void *v53;
  void *v54;
  uint64_t v55;
  NSLayoutConstraint *toolShadowViewTopAnchorConstraint;
  void *v57;
  void *v58;
  uint64_t v59;
  NSLayoutConstraint *toolShadowViewLeftAnchorConstraint;
  void *v61;
  void *v62;
  uint64_t v63;
  NSLayoutConstraint *toolShadowViewBottomAnchorConstraint;
  void *v65;
  void *v66;
  uint64_t v67;
  NSLayoutConstraint *toolShadowViewRightAnchorConstraint;
  uint64_t v69;
  UIPointerInteraction *pointerInteraction;
  void *v71;
  id v72;
  void *v73;
  objc_super v75;
  _QWORD v76[3];

  v76[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v75.receiver = self;
  v75.super_class = (Class)PKPaletteToolView;
  v11 = -[PKPaletteToolView initWithFrame:](&v75, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    toolIdentifier = v11->_toolIdentifier;
    v11->_toolIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    toolVariant = v11->_toolVariant;
    v11->_toolVariant = (NSString *)v14;

    toolProperties = v11->_toolProperties;
    v11->_toolProperties = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v11->_scalingFactor = 1.0;
    v17 = objc_msgSend(v10, "copy");
    configuration = v11->_configuration;
    v11->_configuration = (PKToolConfiguration *)v17;

    v11->_supportsDisplayingSelectedColor = objc_msgSend(v10, "supportsColor");
    v19 = -[PKPaletteToolShadowPathView initWithToolConfiguration:]([PKPaletteToolShadowPathView alloc], "initWithToolConfiguration:", v10);
    toolShadowView = v11->_toolShadowView;
    v11->_toolShadowView = v19;

    -[PKPaletteToolShadowPathView setTranslatesAutoresizingMaskIntoConstraints:](v11->_toolShadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteToolView addSubview:](v11, "addSubview:", v11->_toolShadowView);
    v21 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v11->_imageView;
    v11->_imageView = v21;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v11->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setUserInteractionEnabled:](v11->_imageView, "setUserInteractionEnabled:", 0);
    -[UIImageView layer](v11->_imageView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMasksToBounds:", 0);

    -[PKPaletteToolView addSubview:](v11, "addSubview:", v11->_imageView);
    -[UIImageView widthAnchor](v11->_imageView, "widthAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView image](v11->_imageView, "image");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "size");
    objc_msgSend(v24, "constraintEqualToConstant:");
    v26 = objc_claimAutoreleasedReturnValue();
    imageViewWidthAnchorConstraint = v11->_imageViewWidthAnchorConstraint;
    v11->_imageViewWidthAnchorConstraint = (NSLayoutConstraint *)v26;

    -[UIImageView heightAnchor](v11->_imageView, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView image](v11->_imageView, "image");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "size");
    objc_msgSend(v28, "constraintEqualToConstant:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    imageViewHeightAnchorConstraint = v11->_imageViewHeightAnchorConstraint;
    v11->_imageViewHeightAnchorConstraint = (NSLayoutConstraint *)v31;

    LODWORD(v33) = 1148829696;
    -[NSLayoutConstraint setPriority:](v11->_imageViewWidthAnchorConstraint, "setPriority:", v33);
    LODWORD(v34) = 1148829696;
    -[NSLayoutConstraint setPriority:](v11->_imageViewHeightAnchorConstraint, "setPriority:", v34);
    v35 = (void *)MEMORY[0x1E0CB3718];
    v76[0] = v11->_imageViewWidthAnchorConstraint;
    v76[1] = v11->_imageViewHeightAnchorConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v36);

    -[UIImageView topAnchor](v11->_imageView, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView topAnchor](v11, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = objc_claimAutoreleasedReturnValue();
    imageViewTopAnchorConstraint = v11->_imageViewTopAnchorConstraint;
    v11->_imageViewTopAnchorConstraint = (NSLayoutConstraint *)v39;

    -[UIImageView bottomAnchor](v11->_imageView, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView bottomAnchor](v11, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = objc_claimAutoreleasedReturnValue();
    imageViewBottomAnchorConstraint = v11->_imageViewBottomAnchorConstraint;
    v11->_imageViewBottomAnchorConstraint = (NSLayoutConstraint *)v43;

    -[UIImageView leftAnchor](v11->_imageView, "leftAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView leftAnchor](v11, "leftAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v46);
    v47 = objc_claimAutoreleasedReturnValue();
    imageViewLeftAnchorConstraint = v11->_imageViewLeftAnchorConstraint;
    v11->_imageViewLeftAnchorConstraint = (NSLayoutConstraint *)v47;

    -[UIImageView rightAnchor](v11->_imageView, "rightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView rightAnchor](v11, "rightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = objc_claimAutoreleasedReturnValue();
    imageViewRightAnchorConstraint = v11->_imageViewRightAnchorConstraint;
    v11->_imageViewRightAnchorConstraint = (NSLayoutConstraint *)v51;

    -[PKPaletteToolShadowPathView topAnchor](v11->_toolShadowView, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView topAnchor](v11->_imageView, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = objc_claimAutoreleasedReturnValue();
    toolShadowViewTopAnchorConstraint = v11->_toolShadowViewTopAnchorConstraint;
    v11->_toolShadowViewTopAnchorConstraint = (NSLayoutConstraint *)v55;

    -[PKPaletteToolShadowPathView leftAnchor](v11->_toolShadowView, "leftAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leftAnchor](v11->_imageView, "leftAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = objc_claimAutoreleasedReturnValue();
    toolShadowViewLeftAnchorConstraint = v11->_toolShadowViewLeftAnchorConstraint;
    v11->_toolShadowViewLeftAnchorConstraint = (NSLayoutConstraint *)v59;

    -[PKPaletteToolShadowPathView bottomAnchor](v11->_toolShadowView, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v11->_imageView, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = objc_claimAutoreleasedReturnValue();
    toolShadowViewBottomAnchorConstraint = v11->_toolShadowViewBottomAnchorConstraint;
    v11->_toolShadowViewBottomAnchorConstraint = (NSLayoutConstraint *)v63;

    -[PKPaletteToolShadowPathView rightAnchor](v11->_toolShadowView, "rightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView rightAnchor](v11->_imageView, "rightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v66);
    v67 = objc_claimAutoreleasedReturnValue();
    toolShadowViewRightAnchorConstraint = v11->_toolShadowViewRightAnchorConstraint;
    v11->_toolShadowViewRightAnchorConstraint = (NSLayoutConstraint *)v67;

    v69 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v11);
    pointerInteraction = v11->_pointerInteraction;
    v11->_pointerInteraction = (UIPointerInteraction *)v69;

    -[PKPaletteToolView addInteraction:](v11, "addInteraction:", v11->_pointerInteraction);
    -[PKPaletteToolView _setToolImageNeedsReload](v11, "_setToolImageNeedsReload");
    -[PKPaletteToolView _reloadToolImage](v11, "_reloadToolImage");
    -[PKPaletteToolView _updateToolShadowView](v11, "_updateToolShadowView");
    -[PKPaletteToolView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 1);
    -[PKPaletteToolView setHitTestInsets:](v11, "setHitTestInsets:", -8.0, -8.0, -8.0, -8.0);
    -[PKPaletteToolView setTintAdjustmentMode:](v11, "setTintAdjustmentMode:", 1);
    -[PKPaletteToolView toolName](v11, "toolName");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView setAccessibilityLabel:](v11, "setAccessibilityLabel:", v71);

    -[PKPaletteToolView setShowsLargeContentViewer:](v11, "setShowsLargeContentViewer:", 1);
    v72 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[PKPaletteToolView addInteraction:](v11, "addInteraction:", v72);

    -[PKPaletteToolView toolName](v11, "toolName");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView setLargeContentTitle:](v11, "setLargeContentTitle:", v73);

    -[PKPaletteToolView _updateRemoteEffects](v11, "_updateRemoteEffects");
  }

  return v11;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PKPaletteToolView;
  -[PKPaletteToolView layoutSubviews](&v14, sel_layoutSubviews);
  -[PKPaletteToolView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsEdgeAntialiasing:", 1);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PKPaletteToolView layer](self, "layer", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sublayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setAllowsEdgeAntialiasing:", 1);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  if (self->_toolImageNeedsReload)
  {
    -[PKPaletteToolView _reloadToolImage](self, "_reloadToolImage");
    self->_toolImageNeedsReload = 0;
  }
}

- (BOOL)isInkingTool
{
  return -[PKPaletteToolView conformsToProtocol:](self, "conformsToProtocol:", &unk_1EF59C2D8);
}

- (PKPaletteInkingTool)inkingTool
{
  PKPaletteToolView *v3;

  if (-[PKPaletteToolView isInkingTool](self, "isInkingTool"))
    v3 = self;
  else
    v3 = 0;
  return (PKPaletteInkingTool *)v3;
}

- (BOOL)isRulerTool
{
  void *v2;
  char v3;

  -[PKPaletteToolView toolIdentifier](self, "toolIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.tool.ruler"));

  return v3;
}

- (BOOL)isErasingTool
{
  return -[PKPaletteToolView conformsToProtocol:](self, "conformsToProtocol:", &unk_1EF5B0630);
}

- (PKPaletteErasingTool)erasingTool
{
  PKPaletteToolView *v3;

  if (-[PKPaletteToolView isErasingTool](self, "isErasingTool"))
    v3 = self;
  else
    v3 = 0;
  return (PKPaletteErasingTool *)v3;
}

- (BOOL)isLassoTool
{
  return -[PKPaletteToolView conformsToProtocol:](self, "conformsToProtocol:", &unk_1EF5C4170);
}

- (BOOL)isGenerationTool
{
  void *v2;
  char v3;

  -[PKPaletteToolView toolIdentifier](self, "toolIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.generationtool"));

  return v3;
}

- (BOOL)isHandwritingTool
{
  return -[PKPaletteToolView conformsToProtocol:](self, "conformsToProtocol:", &unk_1EF596930);
}

- (PKPaletteHandwritingTool)handwritingTool
{
  PKPaletteToolView *v3;

  if (-[PKPaletteToolView isHandwritingTool](self, "isHandwritingTool"))
    v3 = self;
  else
    v3 = 0;
  return (PKPaletteHandwritingTool *)v3;
}

- (BOOL)isCustomTool
{
  void *v2;
  char v3;

  -[PKPaletteToolView toolIdentifier](self, "toolIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.custom"));

  return v3;
}

- (NSString)toolName
{
  void *v2;
  void *v3;

  -[PKPaletteToolView configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PKPaletteAttributeViewController)attributeViewController
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  PKPaletteAttributeViewControllerContainer *v8;
  PKPaletteAttributeViewController *attributeViewController;
  id v11;

  if (!self->_attributeViewController)
  {
    -[PKPaletteToolView configuration](self, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewControllerProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PKPaletteToolView configuration](self, "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "viewControllerProvider");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("view controller from configuration must not be nil."), 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v11);
      }
      v8 = -[PKPaletteAttributeViewControllerContainer initWithContentViewController:]([PKPaletteAttributeViewControllerContainer alloc], "initWithContentViewController:", v7);
      attributeViewController = self->_attributeViewController;
      self->_attributeViewController = &v8->super;

    }
  }
  return self->_attributeViewController;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteToolView _updateToolShadowView](self, "_updateToolShadowView");
    -[PKPaletteToolView _reloadToolImageSizeConstraints](self, "_reloadToolImageSizeConstraints");
    -[PKPaletteToolView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PKPaletteToolView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)_updateToolShadowView
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = -[PKPaletteToolView edgeLocation](self, "edgeLocation");
  -[PKPaletteToolView toolShadowView](self, "toolShadowView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEdgeLocation:", v3);

  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  v6 = v5;
  -[PKPaletteToolView toolShadowView](self, "toolShadowView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScalingFactor:", v6);

  -[PKToolConfiguration shadowPath](self->_configuration, "shadowPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (!v8 || (v9 = objc_msgSend(v8, "isEmpty"), v10 = v13, v9))
  {
    -[PKPaletteToolView toolShadowView](self, "toolShadowView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applyShadowToLayer:", v12);

    v10 = v13;
  }

}

- (void)_reloadToolImageSizeConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  CGSize v27;

  v26 = *MEMORY[0x1E0C80C00];
  -[PKPaletteToolView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  v8 = v6 * v7;

  -[PKPaletteToolView imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  v14 = v12 * v13;

  v15 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPaletteToolView imageView](self, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    NSStringFromCGSize(v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView scalingFactor](self, "scalingFactor");
    v22 = 138478083;
    v23 = v18;
    v24 = 2049;
    v25 = v19;
    _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "Reload tool image size constraints, image size: %{private}@, scaling factor: %{private}.2f", (uint8_t *)&v22, 0x16u);

  }
  -[PKPaletteToolView imageViewWidthAnchorConstraint](self, "imageViewWidthAnchorConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setConstant:", v8);

  -[PKPaletteToolView imageViewHeightAnchorConstraint](self, "imageViewHeightAnchorConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setConstant:", v14);

}

- (void)_setToolImageNeedsReload
{
  self->_toolImageNeedsReload = 1;
  -[PKPaletteToolView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_reloadToolImage
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  _OWORD v30[3];
  _QWORD v31[7];
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  if (self->_toolImageNeedsReload)
  {
    *(_QWORD *)buf = 0;
    v33 = buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__18;
    v36 = __Block_byref_object_dispose__18;
    v37 = 0;
    -[PKPaletteToolView configuration](self, "configuration");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = *(void **)(v3 + 160);
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      -[PKPaletteToolView toolIdentifier](self, "toolIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolView toolProperties](self, "toolProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKInk inkWithIdentifier:properties:](PKInk, "inkWithIdentifier:properties:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPaletteToolView traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __37__PKPaletteToolView__reloadToolImage__block_invoke;
      v31[3] = &unk_1E777AFF8;
      v31[5] = v9;
      v31[6] = buf;
      v31[4] = self;
      objc_msgSend(v10, "performAsCurrentTraitCollection:", v31);

      objc_msgSend(*((id *)v33 + 5), "accessibilityLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[PKPaletteToolView setAccessibilityLabel:](self, "setAccessibilityLabel:", v11);
      }
      else
      {
        -[PKPaletteToolView toolName](self, "toolName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteToolView setAccessibilityLabel:](self, "setAccessibilityLabel:", v20);

      }
    }
    else
    {
      -[PKPaletteToolView configuration](self, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "baseImage");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)*((_QWORD *)v33 + 5);
      *((_QWORD *)v33 + 5) = v14;

      objc_msgSend(*((id *)v33 + 5), "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolView traitCollection](self, "traitCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configurationWithTraitCollection:", v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*((id *)v33 + 5), "imageWithConfiguration:", v9);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)*((_QWORD *)v33 + 5);
      *((_QWORD *)v33 + 5) = v18;

    }
    if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
    {
      v21 = (void *)MEMORY[0x1E0DC3870];
      v22 = objc_msgSend(objc_retainAutorelease(*((id *)v33 + 5)), "CGImage");
      objc_msgSend(*((id *)v33 + 5), "scale");
      objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v22, 3);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") != 8)
      {
LABEL_18:
        v27 = *((_QWORD *)v33 + 5);
        -[PKPaletteToolView imageView](self, "imageView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setImage:", v27);

        v29 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v30[0] = *MEMORY[0x1E0C9BAA8];
        v30[1] = v29;
        v30[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        -[PKPaletteToolView setTransform:](self, "setTransform:", v30);
        -[PKPaletteToolView _reloadToolImageSizeConstraints](self, "_reloadToolImageSizeConstraints");
        _Block_object_dispose(buf, 8);

        return;
      }
      v24 = (void *)MEMORY[0x1E0DC3870];
      v25 = objc_msgSend(objc_retainAutorelease(*((id *)v33 + 5)), "CGImage");
      objc_msgSend(*((id *)v33 + 5), "scale");
      objc_msgSend(v24, "imageWithCGImage:scale:orientation:", v25, 2);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)*((_QWORD *)v33 + 5);
    *((_QWORD *)v33 + 5) = v23;

    goto LABEL_18;
  }
  v12 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BE213000, v12, OS_LOG_TYPE_ERROR, "Skip reloading tool image as it is not marked as needing reload.", buf, 2u);
  }

}

void __37__PKPaletteToolView__reloadToolImage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(id, _QWORD);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v2 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v2;
  if (v2)
    v3 = *(void **)(v2 + 160);
  else
    v3 = 0;
  v4 = v3;
  v4[2](v4, *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)setEdgeLocation:(unint64_t)a3
{
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
  _QWORD *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[10];

  v27[8] = *MEMORY[0x1E0C80C00];
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    v23 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteToolView imageViewTopAnchorConstraint](self, "imageViewTopAnchorConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v4;
    -[PKPaletteToolView imageViewLeftAnchorConstraint](self, "imageViewLeftAnchorConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v5;
    -[PKPaletteToolView imageViewRightAnchorConstraint](self, "imageViewRightAnchorConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v6;
    -[PKPaletteToolView imageViewBottomAnchorConstraint](self, "imageViewBottomAnchorConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v7;
    -[PKPaletteToolView toolShadowViewTopAnchorConstraint](self, "toolShadowViewTopAnchorConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v8;
    -[PKPaletteToolView toolShadowViewLeftAnchorConstraint](self, "toolShadowViewLeftAnchorConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[5] = v9;
    -[PKPaletteToolView toolShadowViewRightAnchorConstraint](self, "toolShadowViewRightAnchorConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[6] = v10;
    -[PKPaletteToolView toolShadowViewBottomAnchorConstraint](self, "toolShadowViewBottomAnchorConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[7] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "deactivateConstraints:", v12);

    switch(-[PKPaletteToolView edgeLocation](self, "edgeLocation"))
    {
      case 1uLL:
      case 4uLL:
        v13 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteToolView imageViewTopAnchorConstraint](self, "imageViewTopAnchorConstraint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v14;
        -[PKPaletteToolView imageViewLeftAnchorConstraint](self, "imageViewLeftAnchorConstraint");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v15;
        -[PKPaletteToolView imageViewRightAnchorConstraint](self, "imageViewRightAnchorConstraint");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2] = v16;
        -[PKPaletteToolView toolShadowViewTopAnchorConstraint](self, "toolShadowViewTopAnchorConstraint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26[3] = v17;
        -[PKPaletteToolView toolShadowViewLeftAnchorConstraint](self, "toolShadowViewLeftAnchorConstraint");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26[4] = v18;
        -[PKPaletteToolView toolShadowViewRightAnchorConstraint](self, "toolShadowViewRightAnchorConstraint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26[5] = v19;
        v20 = (void *)MEMORY[0x1E0C99D20];
        v21 = v26;
        goto LABEL_6;
      case 2uLL:
        v13 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteToolView imageViewTopAnchorConstraint](self, "imageViewTopAnchorConstraint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v14;
        -[PKPaletteToolView imageViewRightAnchorConstraint](self, "imageViewRightAnchorConstraint");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v15;
        -[PKPaletteToolView imageViewBottomAnchorConstraint](self, "imageViewBottomAnchorConstraint");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2] = v16;
        -[PKPaletteToolView toolShadowViewTopAnchorConstraint](self, "toolShadowViewTopAnchorConstraint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25[3] = v17;
        -[PKPaletteToolView toolShadowViewRightAnchorConstraint](self, "toolShadowViewRightAnchorConstraint");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25[4] = v18;
        -[PKPaletteToolView toolShadowViewBottomAnchorConstraint](self, "toolShadowViewBottomAnchorConstraint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25[5] = v19;
        v20 = (void *)MEMORY[0x1E0C99D20];
        v21 = v25;
        goto LABEL_6;
      case 8uLL:
        v13 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteToolView imageViewTopAnchorConstraint](self, "imageViewTopAnchorConstraint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v14;
        -[PKPaletteToolView imageViewLeftAnchorConstraint](self, "imageViewLeftAnchorConstraint");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v15;
        -[PKPaletteToolView imageViewBottomAnchorConstraint](self, "imageViewBottomAnchorConstraint");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2] = v16;
        -[PKPaletteToolView toolShadowViewTopAnchorConstraint](self, "toolShadowViewTopAnchorConstraint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24[3] = v17;
        -[PKPaletteToolView toolShadowViewLeftAnchorConstraint](self, "toolShadowViewLeftAnchorConstraint");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24[4] = v18;
        -[PKPaletteToolView toolShadowViewBottomAnchorConstraint](self, "toolShadowViewBottomAnchorConstraint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24[5] = v19;
        v20 = (void *)MEMORY[0x1E0C99D20];
        v21 = v24;
LABEL_6:
        objc_msgSend(v20, "arrayWithObjects:count:", v21, 6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "activateConstraints:", v22);

        break;
      default:
        break;
    }
    -[PKPaletteToolView _setToolImageNeedsReload](self, "_setToolImageNeedsReload");
    -[PKPaletteToolView _updateToolShadowView](self, "_updateToolShadowView");
    -[PKPaletteToolView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setConfiguration:(id)a3
{
  PKToolConfiguration *v4;
  PKToolConfiguration *configuration;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[PKToolConfiguration isEqual:](self->_configuration, "isEqual:"))
  {
    v4 = (PKToolConfiguration *)objc_msgSend(v8, "copy");
    configuration = self->_configuration;
    self->_configuration = v4;

    -[PKPaletteToolView toolName](self, "toolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView setAccessibilityLabel:](self, "setAccessibilityLabel:", v6);

    -[PKPaletteToolView toolName](self, "toolName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView setLargeContentTitle:](self, "setLargeContentTitle:", v7);

    -[PKPaletteToolView _setToolImageNeedsReload](self, "_setToolImageNeedsReload");
  }

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  unint64_t v10;
  double v11;
  void *v12;
  objc_super v13;

  -[PKPaletteToolView imageViewTopAnchorConstraint](self, "imageViewTopAnchorConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 0.0);

  -[PKPaletteToolView imageViewLeftAnchorConstraint](self, "imageViewLeftAnchorConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", 0.0);

  -[PKPaletteToolView imageViewBottomAnchorConstraint](self, "imageViewBottomAnchorConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", 0.0);

  -[PKPaletteToolView imageViewRightAnchorConstraint](self, "imageViewRightAnchorConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", 0.0);

  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
  {
    -[PKPaletteToolView _toolSelectedOffset](self, "_toolSelectedOffset");
    v8 = -v7;
    -[PKPaletteToolView imageViewRightAnchorConstraint](self, "imageViewRightAnchorConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = -[PKPaletteToolView edgeLocation](self, "edgeLocation");
    -[PKPaletteToolView _toolSelectedOffset](self, "_toolSelectedOffset");
    v8 = v11;
    if (v10 == 8)
      -[PKPaletteToolView imageViewLeftAnchorConstraint](self, "imageViewLeftAnchorConstraint");
    else
      -[PKPaletteToolView imageViewTopAnchorConstraint](self, "imageViewTopAnchorConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v9;
  objc_msgSend(v9, "setConstant:", v8);

  v13.receiver = self;
  v13.super_class = (Class)PKPaletteToolView;
  -[PKPaletteToolView updateConstraints](&v13, sel_updateConstraints);
}

- (double)_toolSelectedOffset
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  double v7;
  double result;
  int v9;
  double v10;

  -[PKPaletteToolView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  if (-[PKPaletteToolView isSelected](self, "isSelected"))
  {
    v7 = 0.0;
    result = 0.0;
    if (v6)
      return result;
LABEL_8:
    -[PKPaletteToolView scalingFactor](self, "scalingFactor", result);
    return v7 * v10;
  }
  v9 = -[PKPaletteToolView isHighlighted](self, "isHighlighted");
  result = 10.0;
  if (v9)
  {
    result = 11.0;
    v7 = 22.0;
  }
  else
  {
    v7 = 20.0;
  }
  if (!v6)
    goto LABEL_8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[PKPaletteToolView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = -[PKPaletteToolView edgeLocation](self, "edgeLocation");
  if (v9 == 8)
    v10 = v8;
  else
    v10 = v6;
  if (v9 == 8)
    v11 = v6;
  else
    v11 = v8;
  if (v9 == 2)
  {
    v12 = v6;
  }
  else
  {
    v8 = v10;
    v12 = v11;
  }
  -[PKPaletteToolView scalingFactor](self, "scalingFactor", v10, v11);
  v14 = v8 * v13;
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  v16 = v12 * v15;
  v17 = v14;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __int128 v7;
  _OWORD v8[3];
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteToolView;
  -[PKPaletteToolView setSelected:](&v9, sel_setSelected_);
  -[PKPaletteToolView pointerInteraction](self, "pointerInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setEnabled:", 0);

    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v8[0] = *MEMORY[0x1E0C9BAA8];
    v8[1] = v7;
    v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[PKPaletteToolView setTransform:](self, "setTransform:", v8);
  }
  else
  {
    objc_msgSend(v5, "setEnabled:", 1);

  }
  -[PKPaletteToolView _updateRemoteEffects](self, "_updateRemoteEffects");
  -[PKPaletteToolView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteToolView;
  -[PKPaletteToolView setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[PKPaletteToolView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaletteToolView;
  -[PKPaletteToolView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle") == 2;
  -[PKPaletteToolView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle") == 2;

  if (v5 != v7)
    -[PKPaletteToolView _setToolImageNeedsReload](self, "_setToolImageNeedsReload");
  -[PKPaletteToolView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verticalSizeClass");
  if (v9 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKPaletteToolView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "horizontalSizeClass");
    v12 = objc_msgSend(v4, "horizontalSizeClass");

    if (v11 == v12)
      goto LABEL_8;
  }
  else
  {

  }
  -[PKPaletteToolView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
LABEL_8:

}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    -[PKPaletteToolView _setToolImageNeedsReload](self, "_setToolImageNeedsReload");
  }
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  id v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v7 = a5;
  objc_msgSend(a3, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v16, 0, sizeof(v16));
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  v10 = v9 * 4.5;
  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
  {
    v11 = 0.0;
    v12 = v10;
  }
  else if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 8)
  {
    v11 = 0.0;
    v12 = -v10;
  }
  else
  {
    v12 = 0.0;
    v11 = -v10;
  }
  CGAffineTransformMakeTranslation(&v16, v12, v11);
  if ((-[PKPaletteToolView isSelected](self, "isSelected") & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__PKPaletteToolView_pointerInteraction_willEnterRegion_animator___block_invoke;
    v13[3] = &unk_1E777AF88;
    v14 = v8;
    v15 = v16;
    objc_msgSend(v7, "addAnimations:", v13);

  }
}

uint64_t __65__PKPaletteToolView_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v3);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a5;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PKPaletteToolView_pointerInteraction_willExitRegion_animator___block_invoke;
  v9[3] = &unk_1E7778020;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v6, "addAnimations:", v9);

}

uint64_t __64__PKPaletteToolView_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3B38], "systemPointerStyle", a3, a4);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;

  objc_msgSend(a5, "rect", a3, a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PKPaletteToolView hitTestInsets](self, "hitTestInsets");
  v15 = v14;
  -[PKPaletteToolView hitTestInsets](self, "hitTestInsets");
  v17 = v16;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  v20 = CGRectInset(v19, v15, v17);
  return (id)objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
}

- (void)showTooltip:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  id v15;

  v4 = a3;
  -[PKPaletteToolView toolName](self, "toolName");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[PKPaletteToolView edgeLocation](self, "edgeLocation");
  -[PKPaletteToolView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showWithText:fromView:rect:atEdge:offset:traitCollection:", v15, self, v13, v14, v6, v8, v10, v12, 10.0);

}

- (NSString)toolIdentifier
{
  return self->_toolIdentifier;
}

- (NSString)toolVariant
{
  return self->_toolVariant;
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (NSDictionary)toolProperties
{
  return self->_toolProperties;
}

- (void)setToolProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (BOOL)supportsDisplayingSelectedColor
{
  return self->_supportsDisplayingSelectedColor;
}

- (void)setSupportsDisplayingSelectedColor:(BOOL)a3
{
  self->_supportsDisplayingSelectedColor = a3;
}

- (PKToolConfiguration)configuration
{
  return self->_configuration;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (PKPaletteToolShadowPathView)toolShadowView
{
  return self->_toolShadowView;
}

- (void)setToolShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_toolShadowView, a3);
}

- (NSLayoutConstraint)toolShadowViewTopAnchorConstraint
{
  return self->_toolShadowViewTopAnchorConstraint;
}

- (void)setToolShadowViewTopAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolShadowViewTopAnchorConstraint, a3);
}

- (NSLayoutConstraint)toolShadowViewLeftAnchorConstraint
{
  return self->_toolShadowViewLeftAnchorConstraint;
}

- (void)setToolShadowViewLeftAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolShadowViewLeftAnchorConstraint, a3);
}

- (NSLayoutConstraint)toolShadowViewBottomAnchorConstraint
{
  return self->_toolShadowViewBottomAnchorConstraint;
}

- (void)setToolShadowViewBottomAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolShadowViewBottomAnchorConstraint, a3);
}

- (NSLayoutConstraint)toolShadowViewRightAnchorConstraint
{
  return self->_toolShadowViewRightAnchorConstraint;
}

- (void)setToolShadowViewRightAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolShadowViewRightAnchorConstraint, a3);
}

- (NSLayoutConstraint)imageViewTopAnchorConstraint
{
  return self->_imageViewTopAnchorConstraint;
}

- (void)setImageViewTopAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewTopAnchorConstraint, a3);
}

- (NSLayoutConstraint)imageViewBottomAnchorConstraint
{
  return self->_imageViewBottomAnchorConstraint;
}

- (void)setImageViewBottomAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewBottomAnchorConstraint, a3);
}

- (NSLayoutConstraint)imageViewLeftAnchorConstraint
{
  return self->_imageViewLeftAnchorConstraint;
}

- (void)setImageViewLeftAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewLeftAnchorConstraint, a3);
}

- (NSLayoutConstraint)imageViewRightAnchorConstraint
{
  return self->_imageViewRightAnchorConstraint;
}

- (void)setImageViewRightAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewRightAnchorConstraint, a3);
}

- (NSLayoutConstraint)imageViewWidthAnchorConstraint
{
  return self->_imageViewWidthAnchorConstraint;
}

- (void)setImageViewWidthAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewWidthAnchorConstraint, a3);
}

- (NSLayoutConstraint)imageViewHeightAnchorConstraint
{
  return self->_imageViewHeightAnchorConstraint;
}

- (void)setImageViewHeightAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewHeightAnchorConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewHeightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewRightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewLeftAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_toolShadowViewRightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_toolShadowViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_toolShadowViewLeftAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_toolShadowViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_toolShadowView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_toolProperties, 0);
  objc_storeStrong((id *)&self->_toolVariant, 0);
  objc_storeStrong((id *)&self->_toolIdentifier, 0);
  objc_storeStrong((id *)&self->_attributeViewController, 0);
}

@end
