@implementation _MKBalloonCalloutView

- (_MKBalloonCalloutView)initWithAnnotationView:(id)a3
{
  _MKBalloonCalloutView *v3;
  _MKBalloonCalloutView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKBalloonCalloutView;
  v3 = -[MKCalloutView initWithAnnotationView:](&v6, sel_initWithAnnotationView_, a3);
  v4 = v3;
  if (v3)
    -[_MKBalloonCalloutView _commonInit](v3, "_commonInit");
  return v4;
}

- (_MKBalloonCalloutView)initWithStyle:(int64_t)a3
{
  return -[_MKBalloonCalloutView initWithAnnotationView:](self, "initWithAnnotationView:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[_MKBalloonCalloutView _stopObservingAnnotationView](self, "_stopObservingAnnotationView");
  v3.receiver = self;
  v3.super_class = (Class)_MKBalloonCalloutView;
  -[_MKBalloonCalloutView dealloc](&v3, sel_dealloc);
}

- (void)_commonInit
{
  void *v3;
  UIColor *v4;
  UIColor *strokeColor;
  void *v6;
  UIColor *v7;
  UIColor *imageTintColor;
  id v9;
  UIView *v10;
  UIView *containerView;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  id v20;
  CGImage *v21;
  CGImage *v22;
  CGImage *v23;
  void *v24;
  void *v25;
  UIView *v26;
  void *v27;
  void *v28;
  UIView *shadowView;
  objc_class *v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  UIView *v35;
  void *v36;
  void *v37;
  void *v38;
  UIImageView *v39;
  UIImageView *tailView;
  _MKBezierPathView *v41;
  _MKBezierPathView *backgroundShapeView;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  void *v48;
  UIVisualEffectView *v49;
  UIVisualEffectView *backgroundVisualEffectView;
  id v51;
  void *v52;
  UIImageView *v53;
  UIImageView *balloonBodyImageView;
  _MKMarkerAnnotationBaseImageView *backgroundView;
  _MKBalloonCalloutView *v56;
  _MKMarkerAnnotationBaseImageView *v57;
  _MKMarkerAnnotationBaseImageView *backgroundShapeGradientView;
  _MKMarkerAnnotationBaseImageView *v59;
  void *v60;
  _MKMarkerAnnotationBaseImageView *v61;
  _MKMarkerAnnotationBaseImageView *rectangularImageView;
  double v63;
  double v64;
  double v65;
  double v66;
  int64_t style;
  id v68;
  void *v69;
  UIView *v70;
  UIView *innerBackgroundView;
  UIView *v72;
  UIView *v73;
  void *v74;
  void *v75;
  UIImageView *v76;
  UIImageView *imageView;
  unint64_t v78;
  double MaxX;
  _MKMarkerAnnotationBaseImageView *v80;
  CGFloat MaxY;
  char v82;
  double v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  -[MKCalloutView annotationView](self, "annotationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EE016DE8) & 1) != 0)
  {
    -[_MKBalloonCalloutView _startObservingAnnotationView](self, "_startObservingAnnotationView");
    self->_style = objc_msgSend(v3, "_balloonCalloutStyle");
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    strokeColor = self->_strokeColor;
    self->_strokeColor = v4;

    self->_showsArrow = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "_balloonImageTintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (UIColor *)objc_msgSend(v6, "copy");
      imageTintColor = self->_imageTintColor;
      self->_imageTintColor = v7;

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->_centerAnnotationWhenOffscreen = objc_msgSend(v3, "_balloonCalloutShouldCenterWhenOffscreen");
    v9 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v10 = (UIView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    containerView = self->_containerView;
    self->_containerView = v10;

    -[_MKBalloonCalloutView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);

    -[UIView layer](self->_containerView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAnchorPoint:", 0.5, 1.0);

    v14 = 0x1E0CEA000uLL;
    if (self->_style == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("rectangle_balloon_shadow"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "size");
      self->_shadowSize.width = v16;
      self->_shadowSize.height = v17;
      objc_msgSend(v15, "scale");
      v19 = v18;
      v20 = objc_retainAutorelease(v15);
      v21 = (CGImage *)objc_msgSend(v20, "CGImage");
      v88.size.width = v19 * self->_shadowSize.width * 0.5;
      v88.size.height = v19 * self->_shadowSize.height;
      v88.origin.x = 0.0;
      v88.origin.y = 0.0;
      v22 = CGImageCreateWithImageInRect(v21, v88);
      v89.origin.x = v19 * self->_shadowSize.width * 0.5;
      v89.size.height = v19 * self->_shadowSize.height;
      v89.origin.y = 0.0;
      v89.size.width = v89.origin.x;
      v23 = CGImageCreateWithImageInRect(v21, v89);
      v24 = (void *)objc_opt_new();
      objc_msgSend(v24, "setContents:", v22);
      objc_msgSend(v24, "setContentsScale:", v19);
      objc_msgSend(v24, "setContentsCenter:", 0.589999974, 0.0, 0.00999999978, 1.0);
      v25 = (void *)objc_opt_new();
      objc_msgSend(v25, "setContents:", v23);
      objc_msgSend(v25, "setContentsScale:", v19);
      objc_msgSend(v25, "setContentsCenter:", 0.400000006, 0.0, 0.00999999978, 1.0);
      CGImageRelease(v22);
      CGImageRelease(v23);
      v26 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, self->_shadowSize.width, self->_shadowSize.height);
      -[UIView layer](v26, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSublayer:", v24);

      -[UIView layer](v26, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addSublayer:", v25);

      shadowView = self->_shadowView;
      self->_shadowView = v26;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("balloon_shadow"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "size");
      self->_shadowSize.width = v33;
      self->_shadowSize.height = v34;
      v35 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v20);
      v24 = self->_shadowView;
      self->_shadowView = v35;
    }

    -[UIView layer](self->_shadowView, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAnchorPoint:", 0.5, 1.0);

    -[UIView _mapkit_sizeToFit](self->_shadowView, "_mapkit_sizeToFit");
    -[_MKBalloonCalloutView addSubview:](self, "addSubview:", self->_shadowView);
    objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("balloon_tail"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_flatImageWithColor:", self->_strokeColor);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v38);
    tailView = self->_tailView;
    self->_tailView = v39;

    -[UIImageView _mapkit_sizeToFit](self->_tailView, "_mapkit_sizeToFit");
    switch(self->_style)
    {
      case 0:
      case 2:
        v41 = -[_MKBezierPathView initWithBalloonRadius:tailLength:smoothTailTransition:]([_MKBezierPathView alloc], "initWithBalloonRadius:tailLength:smoothTailTransition:", 1, 30.0, 6.0);
        backgroundShapeView = self->_backgroundShapeView;
        self->_backgroundShapeView = v41;

        -[_MKBezierPathView layer](self->_backgroundShapeView, "layer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setShadowOffset:", 0.0, 4.0);

        -[_MKBezierPathView layer](self->_backgroundShapeView, "layer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setShadowRadius:", 4.0);

        -[_MKBezierPathView layer](self->_backgroundShapeView, "layer");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v46) = 0;
        objc_msgSend(v45, "setShadowOpacity:", v46);

        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v3, "_balloonMaterial"), (v47 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v48 = (void *)v47;
          v49 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v47);
          backgroundVisualEffectView = self->_backgroundVisualEffectView;
          self->_backgroundVisualEffectView = v49;

          -[_MKBezierPathView frame](self->_backgroundShapeView, "frame");
          -[UIVisualEffectView setFrame:](self->_backgroundVisualEffectView, "setFrame:");
          -[UIVisualEffectView setMaskView:](self->_backgroundVisualEffectView, "setMaskView:", self->_backgroundShapeView);
          objc_storeStrong((id *)&self->_backgroundView, self->_backgroundVisualEffectView);

        }
        else
        {
          objc_storeStrong((id *)&self->_backgroundView, self->_backgroundShapeView);
          -[_MKBezierPathView setFillColor:](self->_backgroundShapeView, "setFillColor:", self->_strokeColor);
        }
        -[UIView addSubview:](self->_containerView, "addSubview:", self->_backgroundView);
        v14 = 0x1E0CEA000;
        break;
      case 1:
        v51 = objc_alloc(MEMORY[0x1E0CEA658]);
        objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("square_balloon_mask"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (UIImageView *)objc_msgSend(v51, "initWithImage:", v52);
        balloonBodyImageView = self->_balloonBodyImageView;
        self->_balloonBodyImageView = v53;

        -[UIImageView setFrame:](self->_balloonBodyImageView, "setFrame:", 0.0, 0.0, 60.0, 60.0);
        -[UIImageView setTintColor:](self->_balloonBodyImageView, "setTintColor:", self->_strokeColor);
        -[UIView addSubview:](self->_containerView, "addSubview:", self->_balloonBodyImageView);
        backgroundView = (_MKMarkerAnnotationBaseImageView *)self->_tailView;
        v56 = self;
        goto LABEL_19;
      case 3:
        v57 = -[_MKMarkerAnnotationBaseImageView initWithBalloonRadius:tailLength:]([_MKMarkerAnnotationBaseImageView alloc], "initWithBalloonRadius:tailLength:", 30.0, 6.0);
        backgroundShapeGradientView = self->_backgroundShapeGradientView;
        self->_backgroundShapeGradientView = v57;

        objc_storeStrong((id *)&self->_backgroundView, self->_backgroundShapeGradientView);
        v56 = (_MKBalloonCalloutView *)self->_containerView;
        backgroundView = (_MKMarkerAnnotationBaseImageView *)self->_backgroundView;
        goto LABEL_19;
      case 4:
        v59 = [_MKMarkerAnnotationBaseImageView alloc];
        objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("rectaloon_asset"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[_MKMarkerAnnotationBaseImageView initWithImage:](v59, "initWithImage:", v60);
        rectangularImageView = self->_rectangularImageView;
        self->_rectangularImageView = v61;

        -[_MKMarkerAnnotationBaseImageView setFrame:](self->_rectangularImageView, "setFrame:", 0.0, 0.0, 60.0, 60.0);
        v56 = (_MKBalloonCalloutView *)self->_containerView;
        backgroundView = self->_rectangularImageView;
LABEL_19:
        -[_MKBalloonCalloutView addSubview:](v56, "addSubview:", backgroundView);
        break;
      default:
        break;
    }
    -[UIImageView frame](self->_tailView, "frame");
    -[UIImageView setFrame:](self->_tailView, "setFrame:", 30.0 - v63 * 0.5, 59.0);
    -[_MKBalloonCalloutView _innerDiameter](self, "_innerDiameter");
    v65 = v64;
    v66 = (60.0 - v64) * 0.5;
    style = self->_style;
    if ((unint64_t)(style - 2) >= 2 && style)
    {
      if (style == 1)
      {
        v68 = objc_alloc(*(Class *)(v14 + 1624));
        objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("square_balloon_inner_mask"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (UIView *)objc_msgSend(v68, "initWithImage:", v69);

        -[UIView setFrame:](v70, "setFrame:", v66, v66, v65, v65);
        innerBackgroundView = self->_innerBackgroundView;
        self->_innerBackgroundView = v70;

      }
    }
    else
    {
      v72 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v66, v66, v64, v64);
      v73 = self->_innerBackgroundView;
      self->_innerBackgroundView = v72;

      -[UIView layer](self->_innerBackgroundView, "layer");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setMasksToBounds:", 1);

      -[UIView layer](self->_innerBackgroundView, "layer");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setCornerRadius:", floor(v65 * 0.5));

    }
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_innerBackgroundView);
    v76 = (UIImageView *)objc_msgSend(objc_alloc(*(Class *)(v14 + 1624)), "initWithFrame:", v66, v66, v65, v65);
    imageView = self->_imageView;
    self->_imageView = v76;

    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 2);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_imageView);
    -[_MKBalloonCalloutView addSubview:](self, "addSubview:", self->_containerView);
    v78 = self->_style;
    MaxX = 0.0;
    if (v78 <= 4
      && (objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *off_1E20DC098[v78]), "frame"),
          MaxX = CGRectGetMaxX(v90),
          self->_style == 4))
    {
      v80 = self->_rectangularImageView;
    }
    else
    {
      v80 = (_MKMarkerAnnotationBaseImageView *)self->_tailView;
    }
    -[_MKMarkerAnnotationBaseImageView frame](v80, "frame");
    MaxY = CGRectGetMaxY(v91);
    self->_intrinsicSize.width = MaxX;
    self->_intrinsicSize.height = MaxY;
    -[_MKBalloonCalloutView frame](self, "frame");
    -[_MKBalloonCalloutView setFrame:](self, "setFrame:");
    -[UIView setFrame:](self->_containerView, "setFrame:", 0.0, 0.0, MaxX, 60.0);
    -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
    v87 = 0x3FF0000000000000;
    v82 = objc_opt_respondsToSelector();
    v83 = 1.0;
    if ((v82 & 1) != 0)
    {
      -[_MKBalloonCalloutView setOriginatesAsSmallBalloon:](self, "setOriginatesAsSmallBalloon:", objc_msgSend(v3, "_balloonCalloutShouldOriginateFromSmallSize:", &v87, 1.0));
      v83 = *(double *)&v87;
    }
    -[_MKBalloonCalloutView setSmallBalloonScale:](self, "setSmallBalloonScale:", v83);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_MKBalloonCalloutView setShowsArrow:animated:](self, "setShowsArrow:animated:", objc_msgSend(v3, "_balloonCalloutShouldShowArrow"), 0);
    v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTapOnCallout_);
    -[_MKBalloonCalloutView addGestureRecognizer:](self, "addGestureRecognizer:", v84);
    -[_MKBalloonCalloutView _updateStyle](self, "_updateStyle");
    objc_msgSend(MEMORY[0x1E0CEAB40], "systemTraitsAffectingColorAppearance");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (id)-[_MKBalloonCalloutView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v85, sel_traitEnvironment_didChangeTraitCollection_);

  }
  else
  {
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)&unk_1EE016DE8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ does not conform to %@"), v31, v32);

  }
}

- (void)_startObservingAnnotationView
{
  void *v3;
  _MKKVOProxy *kvoProxy;
  _MKKVOProxy *v5;
  _MKKVOProxy *v6;
  id obj;

  -[MKCalloutView annotationView](self, "annotationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    kvoProxy = self->_kvoProxy;
    obj = v3;
    if (!kvoProxy)
    {
      v5 = -[_MKKVOProxy initWithDelegate:]([_MKKVOProxy alloc], "initWithDelegate:", self);
      v6 = self->_kvoProxy;
      self->_kvoProxy = v5;

      kvoProxy = self->_kvoProxy;
    }
    -[_MKKVOProxy addObserverForObject:forKeyPath:options:context:](kvoProxy, "addObserverForObject:forKeyPath:options:context:", obj, CFSTR("balloonImage"), 0, 0);
    -[_MKKVOProxy addObserverForObject:forKeyPath:options:context:](self->_kvoProxy, "addObserverForObject:forKeyPath:options:context:", obj, CFSTR("balloonImageTintColor"), 0, 0);
    objc_storeStrong((id *)&self->_observedAnnotationView, obj);
    v3 = obj;
  }

}

- (void)_stopObservingAnnotationView
{
  MKAnnotationView *observedAnnotationView;
  _MKKVOProxy *kvoProxy;
  MKAnnotationView *v5;
  MKAnnotationView *v6;

  observedAnnotationView = self->_observedAnnotationView;
  if (observedAnnotationView)
  {
    kvoProxy = self->_kvoProxy;
    v6 = observedAnnotationView;
    -[_MKKVOProxy removeObserverForObject:forKeyPath:](kvoProxy, "removeObserverForObject:forKeyPath:", v6, CFSTR("balloonImage"));
    -[_MKKVOProxy removeObserverForObject:forKeyPath:](self->_kvoProxy, "removeObserverForObject:forKeyPath:", v6, CFSTR("balloonImageTintColor"));
    v5 = self->_observedAnnotationView;
    self->_observedAnnotationView = 0;

  }
}

- (void)_updateStyle
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int64_t style;
  _MKMarkerAnnotationBaseImageView *backgroundShapeGradientView;
  _MKMarkerAnnotationBaseImageContent *v10;
  void *v11;
  double v12;
  _MKMarkerAnnotationBaseImageContent *v13;
  _MKMarkerAnnotationBaseImageView *rectangularImageView;
  _MKMarkerAnnotationBaseImageContent *v15;
  _MKMarkerAnnotationBaseImageContent *v16;
  void *v17;
  id v18;

  -[MKCalloutView annotationView](self, "annotationView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "conformsToProtocol:", &unk_1EE016DE8) & 1) == 0)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)&unk_1EE016DE8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ does not conform to %@"), v6, v7);
LABEL_15:

    goto LABEL_16;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v18, "_balloonContentView"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    -[_MKBalloonCalloutView setContentView:](self, "setContentView:", v3);
  }
  else
  {
    objc_msgSend(v18, "_balloonImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKBalloonCalloutView setImage:](self, "setImage:", v4);
  }

  style = self->_style;
  if (style == 4)
  {
    rectangularImageView = self->_rectangularImageView;
    v15 = [_MKMarkerAnnotationBaseImageContent alloc];
    objc_msgSend(v18, "_balloonTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_balloonStrokeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_MKMarkerAnnotationBaseImageContent initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:](v15, "initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:", v6, v7, 3, 6, 0.0);
    -[_MKMarkerAnnotationBaseImageView _setBaseImageContent:](rectangularImageView, "_setBaseImageContent:", v16);

    goto LABEL_15;
  }
  if (style == 3)
  {
    backgroundShapeGradientView = self->_backgroundShapeGradientView;
    v10 = [_MKMarkerAnnotationBaseImageContent alloc];
    objc_msgSend(v18, "_balloonTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_balloonStrokeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_balloonStrokeColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0.5;
    if (!v11)
      v12 = 0.0;
    v13 = -[_MKMarkerAnnotationBaseImageContent initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:](v10, "initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:", v6, v7, 3, 5, v12);
    -[_MKMarkerAnnotationBaseImageView _setBaseImageContent:](backgroundShapeGradientView, "_setBaseImageContent:", v13);

    goto LABEL_15;
  }
  objc_msgSend(v18, "_balloonTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKBalloonCalloutView setBalloonTintColor:](self, "setBalloonTintColor:", v6);
  objc_msgSend(v18, "_balloonStrokeColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKBalloonCalloutView setStrokeColor:](self, "setStrokeColor:", v17);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v18, "_balloonInnerStrokeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKBalloonCalloutView setInnerStrokeColor:](self, "setInnerStrokeColor:", v7);
    goto LABEL_15;
  }
LABEL_16:

}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a4;
  -[_MKBalloonCalloutView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

  if (v7)
    -[_MKBalloonCalloutView _updateStyle](self, "_updateStyle");
}

- (void)_handleTapOnCallout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MKCalloutView annotationView](self, "annotationView", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCalloutView annotationView](self, "annotationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_annotationContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCalloutView annotationView](self, "annotationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotationContainer:calloutPrimaryActionTriggeredForAnnotationView:", v6, v7);

}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicSize.width;
  height = self->_intrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)_centerFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_innerBackgroundView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)_innerDiameter
{
  double result;

  result = *(double *)&_MKBalloonCalloutInnerDiameterUserLocation;
  if (self->_style != 2)
    return 56.0;
  return result;
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  double v5;
  double width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_MKBalloonCalloutView;
  -[_MKBalloonCalloutView layoutSubviews](&v19, sel_layoutSubviews);
  if (self->_style == 1)
  {
    v3 = self->_shadowSize.width + -60.0;
    v4 = self->_intrinsicSize.height - self->_shadowSize.height + 8.0;
    v5 = v3 * -0.5;
    width = v3 + self->_intrinsicSize.width;
  }
  else
  {
    width = self->_shadowSize.width;
    v5 = self->_intrinsicSize.width * 0.5 - width * 0.5;
    v4 = self->_intrinsicSize.height - self->_shadowSize.height + 11.0;
  }
  -[UIView setFrame:](self->_shadowView, "setFrame:", v5, v4, width);
  if (self->_contentView)
  {
    -[_MKBalloonCalloutView _centerFrame](self, "_centerFrame");
    -[UIView setFrame:](self->_contentView, "setFrame:");
  }
  if (self->_style == 1)
  {
    -[UIView layer](self->_shadowView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;

    -[UIView layer](self->_shadowView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sublayers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9 * 0.5;
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v15, v11);

    -[UIView layer](self->_shadowView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sublayers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v15, 0.0, v15, v11);

  }
  -[UIImageView frame](self->_tailView, "frame");
  -[UIImageView setFrame:](self->_tailView, "setFrame:");
}

- (void)setStrokeColor:(id)a3
{
  UIColor *v4;
  UIColor *strokeColor;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a3;
  v4 = (UIColor *)objc_msgSend(v9, "copy");
  strokeColor = self->_strokeColor;
  self->_strokeColor = v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("balloon_tail"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", self->_strokeColor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setImage:](self->_tailView, "setImage:", v7);
  -[UIImageView setTintColor:](self->_balloonBodyImageView, "setTintColor:", self->_strokeColor);
  if (v9)
    v8 = 0.5;
  else
    v8 = 0.0;
  -[_MKBezierPathView setStrokeColor:width:](self->_backgroundShapeView, "setStrokeColor:width:", v8);
  if (!self->_innerStrokeColor)
    -[_MKBezierPathView setFillColor:](self->_backgroundShapeView, "setFillColor:", self->_strokeColor);

}

- (void)setInnerStrokeColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_innerStrokeColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_innerStrokeColor, a3);
    -[_MKBezierPathView setFillColor:](self->_backgroundShapeView, "setFillColor:");
    v5 = v6;
  }

}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  UIImageView *contentViewMaskView;
  int64_t style;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  UIImageView *v17;
  UIImageView *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat MaxX;
  CGFloat MaxY;
  UIView *v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView == v5)
    goto LABEL_11;
  v31 = v5;
  -[UIView removeFromSuperview](contentView, "removeFromSuperview");
  contentViewMaskView = self->_contentViewMaskView;
  self->_contentViewMaskView = 0;

  objc_storeStrong((id *)&self->_contentView, a3);
  v5 = v31;
  if (!v31)
    goto LABEL_11;
  style = self->_style;
  if ((unint64_t)(style - 2) >= 2)
  {
    if (style == 1)
    {
      v15 = objc_alloc(MEMORY[0x1E0CEA658]);
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("square_balloon_inner_mask"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (UIImageView *)objc_msgSend(v15, "initWithImage:", v16);
      v18 = self->_contentViewMaskView;
      self->_contentViewMaskView = v17;

      -[UIImageView setFrame:](self->_contentViewMaskView, "setFrame:", 0.0, 0.0, 60.0, 60.0);
      -[UIImageView layer](self->_contentViewMaskView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](v31, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMask:", v11);
      goto LABEL_8;
    }
    if (style)
      goto LABEL_9;
  }
  -[UIView layer](v31, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMasksToBounds:", 1);

  -[UIView layer](self->_innerBackgroundView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cornerRadius");
  v13 = v12;
  -[UIView layer](v31, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v13);
LABEL_8:

LABEL_9:
  -[UIView _mapkit_insertSubviewAboveAllOtherSubviews:](self->_containerView, "_mapkit_insertSubviewAboveAllOtherSubviews:", v31);
  -[_MKBalloonCalloutView _innerDiameter](self, "_innerDiameter");
  v5 = v31;
  if (self->_style == 1)
  {
    v20 = v19;
    -[UIView _mapkit_fittingSize](v31, "_mapkit_fittingSize");
    v22 = v21;
    -[UIImageView setFrame:](self->_balloonBodyImageView, "setFrame:", 0.0, 0.0, 60.0 - v20 + v21, 60.0);
    -[UIImageView frame](self->_tailView, "frame");
    v24 = v23;
    v26 = v25;
    -[UIImageView frame](self->_balloonBodyImageView, "frame");
    -[UIImageView setFrame:](self->_tailView, "setFrame:", CGRectGetMidX(v32) - v24 * 0.5, 59.0, v24, v26);
    -[UIView setFrame:](self->_innerBackgroundView, "setFrame:", (60.0 - v20) * 0.5, (60.0 - v20) * 0.5, v22, v20);
    -[UIView bounds](*p_contentView, "bounds");
    -[UIView setFrame:](*p_contentView, "setFrame:", round((60.0 - v20) * 0.5 + (v22 - v27) * 0.5), round((60.0 - v20) * 0.5 + (v20 - v28) * 0.5));
    -[UIView convertRect:fromView:](*p_contentView, "convertRect:fromView:", self, (60.0 - v20) * 0.5, (60.0 - v20) * 0.5, v22, v20);
    -[UIImageView setFrame:](self->_contentViewMaskView, "setFrame:");
    -[UIImageView frame](self->_balloonBodyImageView, "frame");
    MaxX = CGRectGetMaxX(v33);
    -[UIImageView frame](self->_tailView, "frame");
    MaxY = CGRectGetMaxY(v34);
    self->_intrinsicSize.width = MaxX;
    self->_intrinsicSize.height = MaxY;
    -[_MKBalloonCalloutView frame](self, "frame");
    -[_MKBalloonCalloutView setFrame:](self, "setFrame:");
    -[UIImageView frame](self->_balloonBodyImageView, "frame");
    -[UIView setFrame:](self->_containerView, "setFrame:", 0.0, 0.0, CGRectGetMaxX(v35), 60.0);
    -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
    v5 = v31;
  }
LABEL_11:

}

- (void)setShowsArrow:(BOOL)a3
{
  -[_MKBalloonCalloutView setShowsArrow:animated:](self, "setShowsArrow:animated:", a3, 1);
}

- (void)_configureForArrowStateWithDuration:(double)a3
{
  _BOOL4 showsArrow;
  void *v6;
  void *v7;
  CGPath *v8;
  UIView *backgroundView;
  void *v10;
  double v11;
  CGPath *v12;
  UIView *v13;
  id v14;

  showsArrow = self->_showsArrow;
  -[_MKBalloonCalloutView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (showsArrow)
  {
    objc_msgSend(v6, "setAnchorPoint:", 0.5, 1.0);

    -[_MKBalloonCalloutView _idealFrame](self, "_idealFrame");
    -[_MKBalloonCalloutView setFrame:](self, "setFrame:");
    v8 = +[_MKBezierPathView _createSmoothTransitionPathForBalloonRadius:tailLength:](_MKBezierPathView, "_createSmoothTransitionPathForBalloonRadius:tailLength:", 30.0, 6.0);
    -[_MKBezierPathView setPath:duration:](self->_backgroundShapeView, "setPath:duration:", v8, a3);
    CGPathRelease(v8);
    -[UIView setAlpha:](self->_shadowView, "setAlpha:", 1.0);
    backgroundView = self->_backgroundView;
    if (!backgroundView)
      return;
    -[UIView layer](backgroundView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 0;
  }
  else
  {
    objc_msgSend(v6, "setAnchorPoint:", 0.5, 0.5);

    -[_MKBalloonCalloutView _idealFrame](self, "_idealFrame");
    -[_MKBalloonCalloutView setFrame:](self, "setFrame:");
    v12 = +[_MKBezierPathView _createPathForBalloonRadius:tailLength:](_MKBezierPathView, "_createPathForBalloonRadius:tailLength:", 30.0, 0.0);
    -[_MKBezierPathView setPath:duration:](self->_backgroundShapeView, "setPath:duration:", v12, a3);
    CGPathRelease(v12);
    -[UIView setAlpha:](self->_shadowView, "setAlpha:", 0.0);
    v13 = self->_backgroundView;
    if (!v13)
      return;
    -[UIView layer](v13, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1045220557;
  }
  v14 = v10;
  objc_msgSend(v10, "setShadowOpacity:", v11);

}

- (void)setShowsArrow:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v5;
  _QWORD v6[6];

  if (self->_showsArrow != a3)
  {
    self->_showsArrow = a3;
    if (a4)
    {
      v5 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __48___MKBalloonCalloutView_setShowsArrow_animated___block_invoke;
      v6[3] = &unk_1E20D7DC0;
      v6[4] = self;
      v6[5] = 0x3FD0000000000000;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateWithDuration:animations:completion:", v6, 0, 0.25);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v5);
    }
    else
    {
      -[_MKBalloonCalloutView _configureForArrowStateWithDuration:](self, "_configureForArrowStateWithDuration:", 0.0);
      -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
    }
  }
}

- (CGRect)_idealFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MidX;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  -[MKCalloutView annotationView](self, "annotationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[MKCalloutView annotationView](self, "annotationView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "calloutOffset");
  v14 = v13;

  if (self->_showsArrow)
    -[_MKBalloonCalloutView frame](self, "frame");
  else
    v15 = 30.0;
  v16 = round(v14 - v15);
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  MidX = CGRectGetMidX(v25);
  -[_MKBalloonCalloutView frame](self, "frame");
  v18 = round(MidX + CGRectGetWidth(v26) * -0.5);
  -[_MKBalloonCalloutView frame](self, "frame");
  v20 = v19;
  -[_MKBalloonCalloutView frame](self, "frame");
  v22 = v18;
  v23 = v16;
  v24 = v20;
  result.size.height = v21;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)updateWithNewCalloutOffset
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
  uint64_t v15;
  _QWORD v16[5];
  CGRect v17;
  CGRect v18;

  -[_MKBalloonCalloutView _idealFrame](self, "_idealFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_MKBalloonCalloutView frame](self, "frame");
  v18.origin.x = v11;
  v18.origin.y = v12;
  v18.size.width = v13;
  v18.size.height = v14;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  if (!CGRectEqualToRect(v17, v18))
  {
    v15 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51___MKBalloonCalloutView_updateWithNewCalloutOffset__block_invoke;
    v16[3] = &unk_1E20D7D98;
    v16[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateWithDuration:animations:completion:", v16, 0, 0.25);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v15);
  }
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  -[_MKBalloonCalloutView _updateCroppedImage](self, "_updateCroppedImage");
}

- (void)didMoveToWindow
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKBalloonCalloutView;
  -[_MKBalloonCalloutView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[_MKBalloonCalloutView _currentScreenScale](self, "_currentScreenScale");
  if (vabdd_f64(v3, self->_croppedImageScale) >= 0.000001)
    -[_MKBalloonCalloutView _updateCroppedImage](self, "_updateCroppedImage");
}

- (void)_updateCroppedImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  size_t v9;
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v12;
  const CGPath *v13;
  id v14;
  CGImage *v15;
  CGImage *v16;
  double v17;
  double v18;
  double Width;
  double Height;
  CGImage *Image;
  void *v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKBalloonCalloutView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v4);

  -[_MKBalloonCalloutView _currentScreenScale](self, "_currentScreenScale");
  v6 = v5;
  -[_MKBalloonCalloutView _innerDiameter](self, "_innerDiameter");
  v8 = v7;
  v9 = vcvtpd_u64_f64(v6 * v7);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v12 = CGBitmapContextCreate(0, v9, v9, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = v8;
  v24.size.height = v8;
  CGContextClearRect(v12, v24);
  CGContextScaleCTM(v12, v6, v6);
  CGContextGetCTM(&v23, v12);
  CGContextSetBaseCTM();
  switch(self->_style)
  {
    case 0:
    case 2:
    case 3:
      v25.origin.x = 0.0;
      v25.origin.y = 0.0;
      v25.size.width = v8;
      v25.size.height = v8;
      v13 = CGPathCreateWithEllipseInRect(v25, 0);
      CGContextAddPath(v12, v13);
      CGContextClip(v12);
      CGPathRelease(v13);
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("square_balloon_inner_mask"));
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (CGImage *)objc_msgSend(v14, "CGImage");
      v26.origin.x = 0.0;
      v26.origin.y = 0.0;
      v26.size.width = v8;
      v26.size.height = v8;
      CGContextClipToMask(v12, v26, v15);

      break;
    default:
      break;
  }
  v16 = -[UIImage CGImage](self->_image, "CGImage");
  v17 = ((double)v9 - (double)CGImageGetWidth(v16)) * 0.5;
  v18 = ((double)v9 - (double)CGImageGetHeight(v16)) * 0.5;
  Width = (double)CGImageGetWidth(v16);
  Height = (double)CGImageGetHeight(v16);
  CGContextResetCTM();
  v27.origin.x = v17;
  v27.origin.y = v18;
  v27.size.width = Width;
  v27.size.height = Height;
  CGContextDrawImage(v12, v27, v16);
  if (self->_imageTintColor)
  {
    CGContextSaveGState(v12);
    CGContextSetBlendMode(v12, kCGBlendModeSourceIn);
    CGContextSetFillColorWithColor(v12, -[UIColor CGColor](self->_imageTintColor, "CGColor"));
    v28.origin.x = v17;
    v28.origin.y = v18;
    v28.size.width = Width;
    v28.size.height = Height;
    CGContextFillRect(v12, v28);
    CGContextRestoreGState(v12);
  }
  Image = CGBitmapContextCreateImage(v12);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", Image, 0, v6);
  -[UIImageView setImage:](self->_imageView, "setImage:", v22);
  self->_croppedImageScale = v6;
  CGContextRelease(v12);
  CGColorSpaceRelease(DeviceRGB);
  CGImageRelease(Image);
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v3);

}

- (void)setBalloonTintColor:(id)a3
{
  UIColor *v4;
  UIColor *balloonTintColor;
  int64_t style;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_balloonTintColor) & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v7, "copy");
    balloonTintColor = self->_balloonTintColor;
    self->_balloonTintColor = v4;

    style = self->_style;
    switch(style)
    {
      case 2:
        goto LABEL_5;
      case 1:
        -[UIView setTintColor:](self->_innerBackgroundView, "setTintColor:", self->_balloonTintColor);
        break;
      case 0:
LABEL_5:
        -[UIView setBackgroundColor:](self->_innerBackgroundView, "setBackgroundColor:", self->_balloonTintColor);
        break;
    }
  }

}

- (void)showCalloutAnimated:(BOOL)a3
{
  -[_MKBalloonCalloutView showAnimated:completionBlock:](self, "showAnimated:completionBlock:", 1, &__block_literal_global_71);
}

- (void)hideCalloutAnimated:(BOOL)a3 completionHandler:(id)a4
{
  -[_MKBalloonCalloutView dismissAnimated:completionBlock:](self, "dismissAnimated:completionBlock:", a3, &__block_literal_global_127);
}

- (void)showAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[5];
  id v32;
  BOOL v33;
  CGRect v34;
  CGRect v35;

  v4 = a3;
  v6 = a4;
  if (!self->_centerAnnotationWhenOffscreen || !v4)
  {
    -[_MKBalloonCalloutView _showAnimated:completionBlock:](self, "_showAnimated:completionBlock:", v4, v6);
  }
  else
  {
    -[MKCalloutView annotationView](self, "annotationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_visibleCenteringRectInView:", v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[_MKBalloonCalloutView _idealFrame](self, "_idealFrame");
    v35.origin.x = v18;
    v35.origin.y = v19;
    v35.size.width = v20;
    v35.size.height = v21;
    v34.origin.x = v11;
    v34.origin.y = v13;
    v34.size.width = v15;
    v34.size.height = v17;
    if (CGRectContainsRect(v34, v35))
    {
      -[_MKBalloonCalloutView _showAnimated:completionBlock:](self, "_showAnimated:completionBlock:", 1, v6);
    }
    else
    {
      objc_msgSend(v8, "_mapView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_containerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKCalloutView annotationView](self, "annotationView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "annotation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "coordinate");
      v28 = v27;
      v30 = v29;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __54___MKBalloonCalloutView_showAnimated_completionBlock___block_invoke;
      v31[3] = &unk_1E20DC078;
      v31[4] = self;
      v33 = v4;
      v32 = v6;
      objc_msgSend(v23, "annotationContainer:scrollToRevealCalloutWithOffset:annotationCoordinate:completionHandler:", v24, v31, 1.79769313e308, 1.79769313e308, v28, v30);

    }
  }

}

- (void)_showAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BOOL4 originatesAsSmallBalloon;
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
  _QWORD v33[5];
  void (**v34)(_QWORD);
  _QWORD v35[5];
  void (**v36)(_QWORD);
  CATransform3D v37;
  CATransform3D v38;
  CATransform3D v39;
  CATransform3D v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  _QWORD v43[3];

  v4 = a3;
  v43[2] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  -[MKCalloutView annotationView](self, "annotationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self);
  objc_msgSend(v7, "calloutOffset");
  v9 = v8;
  -[_MKBalloonCalloutView _idealFrame](self, "_idealFrame");
  -[_MKBalloonCalloutView setFrame:](self, "setFrame:");
  -[_MKBalloonCalloutView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1.0;
  objc_msgSend(v10, "setOpacity:", v11);

  -[_MKBalloonCalloutView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == 3)
  {
    CGAffineTransformMakeScale(&v42, 0.75, 0.75);
  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v42.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v42.c = v14;
    *(_OWORD *)&v42.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v41 = v42;
  -[_MKBalloonCalloutView setTransform:](self, "setTransform:", &v41);
  memset(&v40, 0, sizeof(v40));
  if (v13 == 3)
  {
    CATransform3DMakeScale(&v40, 0.75, 0.75, 1.0);
    if (!v4)
    {
LABEL_6:
      v6[2](v6);
      goto LABEL_15;
    }
  }
  else
  {
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v40.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v40.m33 = v15;
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v40.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v40.m43 = v16;
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v40.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v40.m13 = v17;
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v40.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v40.m23 = v18;
    if (!v4)
      goto LABEL_6;
  }
  originatesAsSmallBalloon = self->_originatesAsSmallBalloon;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMass:", 3.0);
  objc_msgSend(v20, "setStiffness:", 1940.0);
  objc_msgSend(v20, "setDamping:", 91.4000015);
  objc_msgSend(v20, "setInitialVelocity:", 0.0);
  memset(&v39, 0, sizeof(v39));
  if (originatesAsSmallBalloon)
  {
    CATransform3DMakeScale(&v39, self->_smallBalloonScale, self->_smallBalloonScale, 1.0);
    v37 = v39;
    CATransform3DTranslate(&v38, &v37, 0.0, v9 + 2.0, 0.0);
    v39 = v38;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v38);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFromValue:", v21);

    v38 = v40;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setToValue:", v22);

    objc_msgSend(v20, "settlingDuration");
    objc_msgSend(v20, "setDuration:");
    -[_MKBalloonCalloutView layer](self, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __55___MKBalloonCalloutView__showAnimated_completionBlock___block_invoke;
    v35[3] = &unk_1E20D91C8;
    v35[4] = self;
    v36 = v6;
    objc_msgSend(v23, "_mapkit_addAnimation:forKey:completion:", v20, CFSTR("show"), v35);

  }
  else
  {
    CATransform3DMakeScale(&v39, 0.100000001, 0.100000001, 1.0);
    v37 = v39;
    CATransform3DTranslate(&v38, &v37, 0.0, -v9, 0.0);
    v39 = v38;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v38);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFromValue:", v24);

    v38 = v40;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setToValue:", v25);

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFromValue:", &unk_1E2158D10);
    objc_msgSend(v26, "setToValue:", &unk_1E2158D28);
    objc_msgSend(v26, "setDuration:", 0.24);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setRemovedOnCompletion:", 1);
    objc_msgSend(v20, "settlingDuration");
    objc_msgSend(v27, "setDuration:");
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTimingFunction:", v28);

    v43[0] = v20;
    v43[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAnimations:", v29);

    -[_MKBalloonCalloutView layer](self, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __55___MKBalloonCalloutView__showAnimated_completionBlock___block_invoke_144;
    v33[3] = &unk_1E20D91C8;
    v33[4] = self;
    v34 = v6;
    objc_msgSend(v30, "_mapkit_addAnimation:forKey:completion:", v27, CFSTR("show"), v33);

  }
  if (_MKMarkerAnnotationViewSelectionShouldSway())
  {
    _MKMarkerAnnotationViewSelectionSwayAnimation();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      -[_MKBalloonCalloutView layer](self, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addAnimation:forKey:", v31, CFSTR("sway"));

    }
  }
LABEL_15:

}

- (void)dismissAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
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
  _QWORD v31[4];
  void (**v32)(_QWORD);
  _QWORD v33[4];
  void (**v34)(_QWORD);
  CATransform3D v35;
  CATransform3D v36;
  CATransform3D v37;
  CATransform3D v38;
  CATransform3D v39;
  CATransform3D v40;
  _OWORD v41[3];
  _QWORD v42[3];

  v4 = a3;
  v42[2] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  self->_dismissed = 1;
  -[MKCalloutView annotationView](self, "annotationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calloutOffset");
  v9 = v8;

  if (!self->_originatesAsSmallBalloon)
  {
    -[_MKBalloonCalloutView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 0;
    objc_msgSend(v10, "setOpacity:", v11);

  }
  -[_MKBalloonCalloutView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v41[0] = *MEMORY[0x1E0C9BAA8];
  v41[1] = v14;
  v41[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[_MKBalloonCalloutView setTransform:](self, "setTransform:", v41);
  memset(&v40, 0, sizeof(v40));
  if (v13 == 3)
  {
    CATransform3DMakeScale(&v40, 0.75, 0.75, 1.0);
    if (!v4)
    {
LABEL_5:
      v6[2](v6);
      goto LABEL_11;
    }
  }
  else
  {
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v40.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v40.m33 = v15;
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v40.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v40.m43 = v16;
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v40.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v40.m13 = v17;
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v40.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v40.m23 = v18;
    if (!v4)
      goto LABEL_5;
  }
  if (self->_originatesAsSmallBalloon)
  {
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMass:", 3.0);
    objc_msgSend(v19, "setStiffness:", 1940.0);
    objc_msgSend(v19, "setDamping:", 91.4000015);
    objc_msgSend(v19, "setInitialVelocity:", 0.0);
    memset(&v39, 0, sizeof(v39));
    CATransform3DMakeScale(&v39, self->_smallBalloonScale, self->_smallBalloonScale, 1.0);
    v37 = v39;
    CATransform3DTranslate(&v38, &v37, 0.0, 2.0 - v9, 0.0);
    v39 = v38;
    v38 = v40;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v38);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFromValue:", v20);

    v38 = v39;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v38);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setToValue:", v21);

    objc_msgSend(v19, "settlingDuration");
    objc_msgSend(v19, "setDuration:");
    v36 = v39;
    -[_MKBalloonCalloutView layer](self, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v36;
    objc_msgSend(v22, "setTransform:", &v35);

    -[_MKBalloonCalloutView layer](self, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __57___MKBalloonCalloutView_dismissAnimated_completionBlock___block_invoke;
    v33[3] = &unk_1E20D8688;
    v34 = v6;
    objc_msgSend(v23, "_mapkit_addAnimation:forKey:completion:", v19, CFSTR("hide"), v33);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v39, 0, sizeof(v39));
    CATransform3DMakeScale(&v39, 0.100000001, 0.100000001, 1.0);
    v37 = v39;
    CATransform3DTranslate(&v38, &v37, 0.0, -v9, 0.0);
    v39 = v38;
    v38 = v40;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v38);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFromValue:", v24);

    v38 = v39;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setToValue:", v25);

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFromValue:", &unk_1E2158D28);
    objc_msgSend(v26, "setToValue:", &unk_1E2158D10);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTimingFunction:", v28);

    objc_msgSend(v27, "setDuration:", 0.13333);
    v42[0] = v19;
    v42[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAnimations:", v29);

    objc_msgSend(v27, "setRemovedOnCompletion:", 1);
    -[_MKBalloonCalloutView layer](self, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __57___MKBalloonCalloutView_dismissAnimated_completionBlock___block_invoke_2;
    v31[3] = &unk_1E20D8688;
    v32 = v6;
    objc_msgSend(v30, "_mapkit_addAnimation:forKey:completion:", v27, CFSTR("hide"), v31);

  }
LABEL_11:

}

- (BOOL)calloutContainsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _MKBezierPathView *backgroundShapeView;
  UIImageView *balloonBodyImageView;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  backgroundShapeView = self->_backgroundShapeView;
  if (backgroundShapeView)
  {
    -[_MKBezierPathView convertPoint:fromView:](backgroundShapeView, "convertPoint:fromView:", self, a3.x, a3.y);
    LOBYTE(balloonBodyImageView) = -[_MKBezierPathView containsPoint:](self->_backgroundShapeView, "containsPoint:");
  }
  else
  {
    balloonBodyImageView = self->_balloonBodyImageView;
    if (balloonBodyImageView)
    {
      -[UIImageView frame](balloonBodyImageView, "frame");
      v9.x = x;
      v9.y = y;
      LOBYTE(balloonBodyImageView) = CGRectContainsPoint(v10, v9);
    }
  }
  return (char)balloonBodyImageView;
}

- (void)_mkObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("balloonImage")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("balloonImageTintColor")))
  {
    -[_MKBalloonCalloutView _updateStyle](self, "_updateStyle");
  }

}

- (UIColor)balloonTintColor
{
  return self->_balloonTintColor;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)showsArrow
{
  return self->_showsArrow;
}

- (int64_t)style
{
  return self->_style;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)originatesAsSmallBalloon
{
  return self->_originatesAsSmallBalloon;
}

- (void)setOriginatesAsSmallBalloon:(BOOL)a3
{
  self->_originatesAsSmallBalloon = a3;
}

- (double)smallBalloonScale
{
  return self->_smallBalloonScale;
}

- (void)setSmallBalloonScale:(double)a3
{
  self->_smallBalloonScale = a3;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (UIColor)innerStrokeColor
{
  return self->_innerStrokeColor;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_observedAnnotationView, 0);
  objc_storeStrong((id *)&self->_kvoProxy, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_rectangularImageView, 0);
  objc_storeStrong((id *)&self->_backgroundShapeGradientView, 0);
  objc_storeStrong((id *)&self->_backgroundShapeView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentViewMaskView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_innerBackgroundView, 0);
  objc_storeStrong((id *)&self->_tailView, 0);
  objc_storeStrong((id *)&self->_balloonBodyImageView, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_innerStrokeColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_balloonTintColor, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end
