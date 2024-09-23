@implementation FMAnnotationView

+ (void)preloadAssets
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_circle_small"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_circle_large"), v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_location_outer"), v2, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

}

+ (void)setImagePadding:(double)a3
{
  FMAnnotationViewImagePadding = *(_QWORD *)&a3;
}

+ (void)setLargeAnnotationBorderVisible:(BOOL)a3
{
  FMAnnotationViewLargeRingVisible = a3;
}

+ (void)setThickAnnotationBorder:(BOOL)a3
{
  FMThickAnnotationBorder = a3;
  FMAnnotationViewLargeRingPadding = 0x4014000000000000;
}

+ (void)setShouldMaskLayer:(BOOL)a3
{
  FMAnnotationViewShouldMaskLayer = a3;
}

- (FMAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  FMAnnotationView *v12;

  v7 = (void *)MEMORY[0x24BDD1448];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMAnnotationView.m"), 213, CFSTR("Don't call this!"));

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FMAnnotationView initWithAnnotation:reuseIdentifier:tintColor:](self, "initWithAnnotation:reuseIdentifier:tintColor:", v9, v8, v11);

  return v12;
}

- (FMAnnotationView)initWithCoder:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  FMAnnotationView *v8;

  v5 = (void *)MEMORY[0x24BDD1448];
  v6 = a3;
  objc_msgSend(v5, "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMAnnotationView.m"), 222, CFSTR("Don't call this!"));

  v8 = -[FMAnnotationView initWithCoder:](self, "initWithCoder:", v6);
  return v8;
}

- (FMAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4 tintColor:(id)a5
{
  id v8;
  id v9;
  FMAnnotationView *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  id v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  id v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  void *v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double MidX;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  objc_super v90;
  _QWORD v91[8];
  _BYTE v92[128];
  uint64_t v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v93 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v90.receiver = self;
  v90.super_class = (Class)FMAnnotationView;
  v10 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v90, sel_initWithAnnotation_reuseIdentifier_, v8, a4);
  if (v10)
  {
    v84 = v9;
    v85 = v8;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12;

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView setSmallCircleLayer:](v10, "setSmallCircleLayer:", v14);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView setLargeCircleLayer:](v10, "setLargeCircleLayer:", v15);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView setSmallPersonImageLayer:](v10, "setSmallPersonImageLayer:", v16);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView setLargePersonImageLayer:](v10, "setLargePersonImageLayer:", v17);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView setLocationOuterLayer:](v10, "setLocationOuterLayer:", v18);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView setLocationInnerLayer:](v10, "setLocationInnerLayer:", v19);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView setSmallRingLayer:](v10, "setSmallRingLayer:", v20);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView setLargeRingLayer:](v10, "setLargeRingLayer:", v21);

    -[FMAnnotationView smallRingLayer](v10, "smallRingLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShouldRasterize:", 1);

    -[FMAnnotationView largeRingLayer](v10, "largeRingLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShouldRasterize:", 1);

    -[FMAnnotationView smallRingLayer](v10, "smallRingLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRasterizationScale:", v13);

    -[FMAnnotationView largeRingLayer](v10, "largeRingLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRasterizationScale:", v13);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v10, sel_invertColorStatusDidChange_, *MEMORY[0x24BDF7258], 0);

    -[FMAnnotationView invertColorStatusDidChange:](v10, "invertColorStatusDidChange:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_circle_small"), v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_circle_large"), v27, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = (void *)v27;
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_location_outer"), v27, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_retainAutorelease(v28);
    -[CALayer setContents:](v10->_smallCircleLayer, "setContents:", objc_msgSend(v31, "CGImage"));
    v32 = objc_retainAutorelease(v29);
    -[CALayer setContents:](v10->_largeCircleLayer, "setContents:", objc_msgSend(v32, "CGImage"));
    v33 = objc_retainAutorelease(v30);
    -[CALayer setContents:](v10->_locationOuterLayer, "setContents:", objc_msgSend(v33, "CGImage"));
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v10->_smallRingLayer, "setFillColor:", objc_msgSend(v34, "CGColor"));

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v10->_largeRingLayer, "setFillColor:", objc_msgSend(v35, "CGColor"));

    v36 = *MEMORY[0x24BDBEFB0];
    v37 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v82 = v31;
    objc_msgSend(v31, "size");
    -[CALayer setBounds:](v10->_smallCircleLayer, "setBounds:", v36, v37, v38, v39);
    objc_msgSend(v32, "size");
    -[CALayer setBounds:](v10->_largeCircleLayer, "setBounds:", v36, v37, v40, v41);
    -[CALayer setBounds:](v10->_smallPersonImageLayer, "setBounds:", *(double *)&FMAnnotationViewImagePadding * 0.5, *(double *)&FMAnnotationViewImagePadding * 0.5, 28.0 - *(double *)&FMAnnotationViewImagePadding * 0.5, 28.0 - *(double *)&FMAnnotationViewImagePadding * 0.5);
    -[CALayer setBounds:](v10->_largePersonImageLayer, "setBounds:", *(double *)&FMAnnotationViewImagePadding, *(double *)&FMAnnotationViewImagePadding, 72.0 - *(double *)&FMAnnotationViewImagePadding, 72.0 - *(double *)&FMAnnotationViewImagePadding);
    -[CALayer bounds](v10->_smallPersonImageLayer, "bounds");
    -[CALayer setCornerRadius:](v10->_smallPersonImageLayer, "setCornerRadius:", v42 * 0.5);
    -[CALayer bounds](v10->_largePersonImageLayer, "bounds");
    -[CALayer setCornerRadius:](v10->_largePersonImageLayer, "setCornerRadius:", v43 * 0.5);
    v44 = FMAnnotationViewShouldMaskLayer;
    -[CALayer setMasksToBounds:](v10->_largePersonImageLayer, "setMasksToBounds:", FMAnnotationViewShouldMaskLayer);
    -[CALayer setMasksToBounds:](v10->_smallPersonImageLayer, "setMasksToBounds:", v44);
    v81 = v33;
    objc_msgSend(v33, "size");
    -[CALayer setBounds:](v10->_locationOuterLayer, "setBounds:", v36, v37, v45, v46);
    -[CALayer bounds](v10->_smallCircleLayer, "bounds");
    -[CAShapeLayer setBounds:](v10->_smallRingLayer, "setBounds:");
    -[CALayer bounds](v10->_largeCircleLayer, "bounds");
    -[CAShapeLayer setBounds:](v10->_largeRingLayer, "setBounds:");
    -[CALayer bounds](v10->_smallCircleLayer, "bounds");
    v94.size.width = v47 + -1.5;
    v94.size.height = v48 + -1.5;
    v94.origin.x = v49 + 0.75;
    v94.origin.y = v50 + 0.75;
    v51 = (void *)MEMORY[0x24BDF6870];
    v95 = CGRectInset(v94, 14.0, 14.0);
    objc_msgSend(v51, "bezierPathWithOvalInRect:", v95.origin.x, v95.origin.y, v95.size.width, v95.size.height);
    v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](v10->_smallRingLayer, "setPath:", objc_msgSend(v52, "CGPath"));

    -[CALayer bounds](v10->_largeCircleLayer, "bounds");
    v96.size.width = v53 - *(double *)&FMAnnotationViewLargeRingPadding;
    v96.size.height = v54 - *(double *)&FMAnnotationViewLargeRingPadding;
    v96.origin.x = v55 + *(double *)&FMAnnotationViewLargeRingPadding * 0.5;
    v96.origin.y = v56 + *(double *)&FMAnnotationViewLargeRingPadding * 0.5;
    v57 = (void *)MEMORY[0x24BDF6870];
    v97 = CGRectInset(v96, 25.0, 25.0);
    objc_msgSend(v57, "bezierPathWithOvalInRect:", v97.origin.x, v97.origin.y, v97.size.width, v97.size.height);
    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](v10->_largeRingLayer, "setPath:", objc_msgSend(v58, "CGPath"));

    -[MKAnnotationView setBounds:](v10, "setBounds:", 0.0, 0.0, 30.0, 30.0);
    v59 = 1.0;
    if (FMThickAnnotationBorder)
      v59 = 1.5;
    -[CAShapeLayer setLineWidth:](v10->_smallRingLayer, "setLineWidth:", v59);
    v60 = 3.0;
    if (!FMThickAnnotationBorder)
      v60 = 1.5;
    -[CAShapeLayer setLineWidth:](v10->_largeRingLayer, "setLineWidth:", v60);
    -[CALayer setAnchorPoint:](v10->_largeCircleLayer, "setAnchorPoint:", 0.5, 0.915);
    -[FMAnnotationView layer](v10, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSublayer:", v10->_locationOuterLayer);

    -[CALayer addSublayer:](v10->_locationOuterLayer, "addSublayer:", v10->_locationInnerLayer);
    -[FMAnnotationView layer](v10, "layer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addSublayer:", v10->_smallCircleLayer);

    -[CALayer addSublayer:](v10->_smallCircleLayer, "addSublayer:", v10->_smallPersonImageLayer);
    -[CALayer addSublayer:](v10->_smallCircleLayer, "addSublayer:", v10->_smallRingLayer);
    -[FMAnnotationView layer](v10, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addSublayer:", v10->_largeCircleLayer);

    -[CALayer addSublayer:](v10->_largeCircleLayer, "addSublayer:", v10->_largePersonImageLayer);
    -[CALayer addSublayer:](v10->_largeCircleLayer, "addSublayer:", v10->_largeRingLayer);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v91[0] = v10->_smallCircleLayer;
    v91[1] = v10->_largeCircleLayer;
    v91[2] = v10->_locationOuterLayer;
    v91[3] = v10->_locationInnerLayer;
    v91[4] = v10->_smallPersonImageLayer;
    v91[5] = v10->_largePersonImageLayer;
    v91[6] = v10->_smallRingLayer;
    v91[7] = v10->_largeRingLayer;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 8);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v66; ++i)
        {
          if (*(_QWORD *)v87 != v67)
            objc_enumerationMutation(v64);
          v69 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
          objc_msgSend(v69, "superlayer");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "bounds");
          v72 = v71;
          v74 = v73;
          v76 = v75;
          v78 = v77;

          v98.origin.x = v72;
          v98.origin.y = v74;
          v98.size.width = v76;
          v98.size.height = v78;
          MidX = CGRectGetMidX(v98);
          v99.origin.x = v72;
          v99.origin.y = v74;
          v99.size.width = v76;
          v99.size.height = v78;
          objc_msgSend(v69, "setPosition:", MidX, CGRectGetMidY(v99));
        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
      }
      while (v66);
    }

    v9 = v84;
    -[FMAnnotationView setTintColor:](v10, "setTintColor:", v84);
    v8 = v85;
    -[FMAnnotationView updateStyleForAnnotation:](v10, "updateStyleForAnnotation:", v85);
    -[FMAnnotationView _setupSpringActions](v10, "_setupSpringActions");

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FMAnnotationView;
  -[MKAnnotationView dealloc](&v4, sel_dealloc);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)FMAnnotationView;
  -[FMAnnotationView traitCollectionDidChange:](&v25, sel_traitCollectionDidChange_, a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_location_inner"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMAnnotationView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintedImageWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_location_outer"), v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_circle_small"), v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_circle_large"), v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v7);
  -[CALayer setContents:](self->_locationInnerLayer, "setContents:", objc_msgSend(v11, "CGImage"));
  v12 = *MEMORY[0x24BDBEFB0];
  v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v11, "size");
  -[CALayer setBounds:](self->_locationInnerLayer, "setBounds:", v12, v13, v14, v15);
  v16 = objc_retainAutorelease(v9);
  -[CALayer setContents:](self->_smallCircleLayer, "setContents:", objc_msgSend(v16, "CGImage"));
  v17 = objc_retainAutorelease(v10);
  -[CALayer setContents:](self->_largeCircleLayer, "setContents:", objc_msgSend(v17, "CGImage"));
  v18 = objc_retainAutorelease(v8);
  -[CALayer setContents:](self->_locationOuterLayer, "setContents:", objc_msgSend(v18, "CGImage"));
  -[MKAnnotationView annotation](self, "annotation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "smallAnnotationIcon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKAnnotationView annotation](self, "annotation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "largeAnnotationIcon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_retainAutorelease(v20);
  -[CALayer setContents:](self->_smallPersonImageLayer, "setContents:", objc_msgSend(v23, "CGImage"));
  v24 = objc_retainAutorelease(v22);
  -[CALayer setContents:](self->_largePersonImageLayer, "setContents:", objc_msgSend(v24, "CGImage"));

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;

  -[FMAnnotationView setIsDelayed:](self, "setIsDelayed:", 0);
  -[FMAnnotationView setHasPhotoImage:](self, "setHasPhotoImage:", 0);
  -[FMAnnotationView smallPersonImageLayer](self, "smallPersonImageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContents:", 0);

  -[FMAnnotationView largePersonImageLayer](self, "largePersonImageLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContents:", 0);

  -[FMAnnotationView setSelected:animated:](self, "setSelected:animated:", 0, 0);
}

- (void)updateStyleForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[FMAnnotationView tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || (objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
      -[FMAnnotationView setTintColor:](self, "setTintColor:", v6);
    v7 = (void *)MEMORY[0x24BDF6F90];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __45__FMAnnotationView_updateStyleForAnnotation___block_invoke;
    v9[3] = &unk_24C837090;
    v9[4] = self;
    v10 = v8;
    objc_msgSend(v7, "performWithoutAnimation:", v9);
    -[FMAnnotationView _updateAnnotationStyle](self, "_updateAnnotationStyle");

    v4 = v8;
  }

}

void __45__FMAnnotationView_updateStyleForAnnotation___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 40), "smallAnnotationIcon");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "CGImage");
  objc_msgSend(*(id *)(a1 + 32), "smallPersonImageLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContents:", v3);

  objc_msgSend(*(id *)(a1 + 40), "largeAnnotationIcon");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGImage");
  objc_msgSend(*(id *)(a1 + 32), "largePersonImageLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v6);

  objc_msgSend(*(id *)(a1 + 40), "smallAnnotationIcon");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(a1 + 32), "setHasPhotoImage:", objc_msgSend(v8, "CGImage") != 0);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 delay:(double)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v6 = a4;
  v7 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  LogCategory_Unspecified();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v12 = v7;
    v13 = 1024;
    v14 = v6;
    v15 = 2048;
    v16 = a5;
    _os_log_impl(&dword_20DBDA000, v9, OS_LOG_TYPE_DEFAULT, "FMAnnotationView: setSelected: %d, animated: %d delay: %f", buf, 0x18u);
  }

  v10.receiver = self;
  v10.super_class = (Class)FMAnnotationView;
  -[MKAnnotationView setSelected:animated:](&v10, sel_setSelected_animated_, v7, v6);
  -[FMAnnotationView setIsDelayed:](self, "setIsDelayed:", 1);
  -[FMAnnotationView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_animateDelayedAnimation, 0, a5);
}

- (void)animateDelayedAnimation
{
  if (-[FMAnnotationView isDelayed](self, "isDelayed"))
  {
    -[FMAnnotationView setIsDelayed:](self, "setIsDelayed:", 0);
    -[FMAnnotationView _selectionWasUpdated:](self, "_selectionWasUpdated:", 1);
  }
}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  FMAnnotationView *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FMAnnotationView;
  -[FMAnnotationView setTintColor:](&v21, sel_setTintColor_, v4);
  v5 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("annotation_location_inner"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__FMAnnotationView_setTintColor___block_invoke;
  block[3] = &unk_24C837198;
  v18 = v7;
  v19 = v4;
  v20 = self;
  v9 = v4;
  v10 = v7;
  dispatch_async(v8, block);

  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "CGColor");
  -[FMAnnotationView smallRingLayer](self, "smallRingLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStrokeColor:", v12);

  v14 = objc_retainAutorelease(v11);
  v15 = objc_msgSend(v14, "CGColor");
  -[FMAnnotationView largeRingLayer](self, "largeRingLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStrokeColor:", v15);

}

void __33__FMAnnotationView_setTintColor___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "tintedImageWithColor:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__FMAnnotationView_setTintColor___block_invoke_2;
  v4[3] = &unk_24C837090;
  v4[4] = *(_QWORD *)(a1 + 48);
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

void __33__FMAnnotationView_setTintColor___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v2 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage");
  objc_msgSend(*(id *)(a1 + 32), "locationInnerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContents:", v2);

  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(*(id *)(a1 + 40), "size");
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "locationInnerLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBounds:", v4, v5, v7, v9);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a4;
  v5 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v10 = v5;
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_20DBDA000, v7, OS_LOG_TYPE_DEFAULT, "FMAnnotationView: setSelected: %d, animated: %d", buf, 0xEu);
  }

  v8.receiver = self;
  v8.super_class = (Class)FMAnnotationView;
  -[MKAnnotationView setSelected:animated:](&v8, sel_setSelected_animated_, v5, v4);
  -[FMAnnotationView _selectionWasUpdated:](self, "_selectionWasUpdated:", v4);
}

- (void)_selectionWasUpdated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = -[FMAnnotationView isShowingLargeSelectedAnnotation](self, "isShowingLargeSelectedAnnotation");
    v7 = 1024;
    v8 = -[MKAnnotationView isSelected](self, "isSelected");
    _os_log_impl(&dword_20DBDA000, v5, OS_LOG_TYPE_DEFAULT, "FMAnnotationView: _selectionWasUpdated isShowingLargeAnotation: %d, isSelected: %d", (uint8_t *)v6, 0xEu);
  }

  if (-[FMAnnotationView isShowingLargeSelectedAnnotation](self, "isShowingLargeSelectedAnnotation")
    && !-[MKAnnotationView isSelected](self, "isSelected")
    || !-[FMAnnotationView isShowingLargeSelectedAnnotation](self, "isShowingLargeSelectedAnnotation")
    && -[MKAnnotationView isSelected](self, "isSelected"))
  {
    -[FMAnnotationView _transitionToNewSize:](self, "_transitionToNewSize:", v3);
  }
}

- (void)_transitionToNewSize:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_20DBDA000, v5, OS_LOG_TYPE_DEFAULT, "FMAnnotationView: _transitionToNewSize delayed?: %d", (uint8_t *)v9, 8u);
  }

  if (!-[FMAnnotationView isDelayed](self, "isDelayed"))
  {
    -[FMAnnotationView _setupSpringActions](self, "_setupSpringActions");
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    if (!v3)
    {
      -[FMAnnotationView smallCircleLayer](self, "smallCircleLayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAllAnimations");

      -[FMAnnotationView locationOuterLayer](self, "locationOuterLayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeAllAnimations");

      -[FMAnnotationView largeCircleLayer](self, "largeCircleLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeAllAnimations");

      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    }
    -[FMAnnotationView _updateAnnotationStyle](self, "_updateAnnotationStyle");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)_updateAnnotationStyle
{
  _BOOL4 v3;
  int v4;
  float v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  float v23;
  double v24;
  int v25;
  void *v26;
  double v27;
  int v28;
  float v29;
  void *v30;
  double v31;
  int v32;
  float v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  CATransform3D v39;
  CATransform3D v40;
  CATransform3D v41;
  CATransform3D v42;
  CATransform3D v43;
  CATransform3D v44;
  CATransform3D v45;

  if (-[MKAnnotationView isSelected](self, "isSelected"))
  {
    v3 = -[FMAnnotationView shouldPreventLargeAnnotationState](self, "shouldPreventLargeAnnotationState");
    v4 = !v3;
    if (v3)
      v5 = 1.0;
    else
      v5 = 0.0;
  }
  else
  {
    v4 = 0;
    v5 = 1.0;
  }
  -[FMAnnotationView smallCircleLayer](self, "smallCircleLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = v5;
  objc_msgSend(v6, "setOpacity:", v7);

  -[FMAnnotationView largeCircleLayer](self, "largeCircleLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  LODWORD(v10) = 0;
  if (v4)
  {
    *(float *)&v10 = 1.0;
    v11 = 0.100000001;
  }
  else
  {
    v11 = 1.0;
  }
  if (v4)
    v12 = 1.0;
  else
    v12 = 0.100000001;
  objc_msgSend(v8, "setOpacity:", v10);

  CATransform3DMakeScale(&v45, v11, v11, 1.0);
  -[FMAnnotationView smallCircleLayer](self, "smallCircleLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v45;
  objc_msgSend(v13, "setTransform:", &v44);

  CATransform3DMakeScale(&v43, v12, v12, 1.0);
  -[FMAnnotationView locationOuterLayer](self, "locationOuterLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v43;
  objc_msgSend(v14, "setTransform:", &v42);

  -[MKAnnotationView annotation](self, "annotation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isThisDevice"))
  {
    v16 = +[FMMapView hasUserLocation](FMMapView, "hasUserLocation");

    if (v16)
    {
      -[FMAnnotationView smallRingLayer](self, "smallRingLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = 0;
      objc_msgSend(v17, "setOpacity:", v18);
      -[FMAnnotationView locationOuterLayer](self, "locationOuterLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = 0;
      objc_msgSend(v19, "setOpacity:", v20);
      -[FMAnnotationView smallCircleLayer](self, "smallCircleLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 0;
      objc_msgSend(v21, "setOpacity:", v22);

LABEL_19:
      goto LABEL_20;
    }
  }
  else
  {

  }
  -[FMAnnotationView locationOuterLayer](self, "locationOuterLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 1.0;
  LODWORD(v24) = 1.0;
  objc_msgSend(v17, "setOpacity:", v24);

  v25 = FMAnnotationViewLargeRingVisible;
  if (!FMAnnotationViewLargeRingVisible)
  {
    -[MKAnnotationView annotation](self, "annotation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (float)objc_msgSend(v17, "isBorderEnabled");
  }
  -[FMAnnotationView smallRingLayer](self, "smallRingLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v27 = v23;
  objc_msgSend(v26, "setOpacity:", v27);

  if (!v25)
    goto LABEL_19;
LABEL_20:
  v28 = FMAnnotationViewLargeRingVisible;
  if (FMAnnotationViewLargeRingVisible)
  {
    v29 = 1.0;
  }
  else
  {
    -[MKAnnotationView annotation](self, "annotation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (float)objc_msgSend(v17, "isBorderEnabled");
  }
  -[FMAnnotationView largeRingLayer](self, "largeRingLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v31 = v29;
  objc_msgSend(v30, "setOpacity:", v31);

  if (!v28)
  v32 = FMAnnotationViewLargeRingVisible;
  if (FMAnnotationViewLargeRingVisible)
  {
    v33 = 1.0;
  }
  else
  {
    -[MKAnnotationView annotation](self, "annotation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (float)objc_msgSend(v17, "isBorderEnabled");
  }
  -[FMAnnotationView smallRingLayer](self, "smallRingLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v35 = v33;
  objc_msgSend(v34, "setOpacity:", v35);

  if (!v32)
  v36 = -5.0;
  if (!v4)
    v36 = 15.0;
  CATransform3DMakeTranslation(&v40, 0.0, v36, 0.0);
  CATransform3DScale(&v41, &v40, v12, v12, 1.0);
  -[FMAnnotationView largeCircleLayer](self, "largeCircleLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v41;
  objc_msgSend(v37, "setTransform:", &v39);

  if (-[MKAnnotationView isSelected](self, "isSelected"))
    v38 = -[FMAnnotationView shouldPreventLargeAnnotationState](self, "shouldPreventLargeAnnotationState") ^ 1;
  else
    v38 = 0;
  -[FMAnnotationView setIsShowingLargeSelectedAnnotation:](self, "setIsShowingLargeSelectedAnnotation:", v38);
  -[FMAnnotationView invertColorStatusDidChange:](self, "invertColorStatusDidChange:", 0);
}

- (void)_setupSpringActions
{
  uint64_t v3;
  id v4;
  id v5;
  double (**v6)(_QWORD, double);
  id v7;
  double (**v8)(_QWORD, double);
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double (*v20)(uint64_t, double);
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  _QWORD v32[5];
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v33 = CFSTR("transform");
  v3 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __parametersOfSpringAnimation_block_invoke;
  v32[3] = &__block_descriptor_40_e8_d16__0d8l;
  v32[4] = 0x3FEC4780E0000000;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __parametersOfSpringAnimation_block_invoke_2;
  v29[3] = &unk_24C837350;
  v31 = xmmword_20DBF3470;
  v30 = (id)MEMORY[0x212BB0C68](v32, a2);
  v4 = v30;
  v26[0] = v29[0];
  v26[1] = 3221225472;
  v26[2] = __parametersOfSpringAnimation_block_invoke_3;
  v26[3] = &unk_24C837350;
  v28 = xmmword_20DBF3480;
  v5 = (id)MEMORY[0x212BB0C68](v29);
  v27 = v5;
  v6 = (double (**)(_QWORD, double))MEMORY[0x212BB0C68](v26);
  v18 = v3;
  v19 = 3221225472;
  v20 = __parametersOfSpringAnimation_block_invoke_4;
  v21 = &unk_24C837378;
  v22 = v5;
  v23 = xmmword_20DBF3490;
  v24 = xmmword_20DBF34A0;
  v25 = 0x3FEC4780E0000000;
  v7 = v5;
  v8 = (double (**)(_QWORD, double))MEMORY[0x212BB0C68](&v18);

  v9 = 12;
  v10 = 7.8369906;
  do
  {
    v11 = v6[2](v6, v10);
    v10 = v10 - v11 / v8[2](v8, v10);
    --v9;
  }
  while (v9);
  v12 = v10 * v10;
  v13 = sqrt(v12);
  v14 = (v13 + v13) * 0.468;

  objc_msgSend(MEMORY[0x24BDE5760], "animation", v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMass:", 1.0);
  objc_msgSend(v15, "setVelocity:", 1.0);
  objc_msgSend(v15, "setStiffness:", v12);
  objc_msgSend(v15, "setDamping:", v14);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v16);

  objc_msgSend(v15, "setDuration:", 0.638);
  v34[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setActions:](self->_largeCircleLayer, "setActions:", v17);

}

- (void)setAnnotation:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMAnnotationView;
  v4 = a3;
  -[MKAnnotationView setAnnotation:](&v5, sel_setAnnotation_, v4);
  -[FMAnnotationView updateStyleForAnnotation:](self, "updateStyleForAnnotation:", v4, v5.receiver, v5.super_class);

}

+ (BOOL)_followsTerrain
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  FMAnnotationView *v17;
  FMAnnotationView *v18;
  objc_super v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[FMAnnotationView isShowingLargeSelectedAnnotation](self, "isShowingLargeSelectedAnnotation"))
  {
    -[FMAnnotationView largeCircleLayer](self, "largeCircleLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    if (sqrt((y - (v12 + v16 * 0.5)) * (y - (v12 + v16 * 0.5)) + (x - (v10 + v14 * 0.5)) * (x - (v10 + v14 * 0.5))) >= 36.0)
    {
      v18 = 0;
      goto LABEL_7;
    }
    v17 = self;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)FMAnnotationView;
    -[MKAnnotationView hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7, x, y);
    v17 = (FMAnnotationView *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
LABEL_7:

  return v18;
}

- (void)addColorInvertFilterToLayer:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (objc_msgSend(v10, "filters"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_3),
        v4,
        v5 == 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v10, "filters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v10, "filters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59F0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", CFSTR("FMColorInvertFilter"));
    objc_msgSend(v8, "addObject:", v9);
    objc_msgSend(v10, "setFilters:", v8);

  }
}

uint64_t __48__FMAnnotationView_addColorInvertFilterToLayer___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("FMColorInvertFilter"));

  if ((_DWORD)v6)
    *a4 = 1;
  return v6;
}

- (void)removeColorInvertFilterToLayer:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v8, "filters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_47);

    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "filters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      objc_msgSend(v7, "removeObjectAtIndex:", v5);
      objc_msgSend(v8, "setFilters:", v7);

    }
  }

}

uint64_t __51__FMAnnotationView_removeColorInvertFilterToLayer___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("FMColorInvertFilter"));

  if ((_DWORD)v6)
    *a4 = 1;
  return v6;
}

- (void)invertColorStatusDidChange:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  if (UIAccessibilityIsInvertColorsEnabled()
    && (-[MKAnnotationView annotation](self, "annotation"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isBorderEnabled"),
        v4,
        (v5 & 1) == 0))
  {
    -[FMAnnotationView smallPersonImageLayer](self, "smallPersonImageLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView addColorInvertFilterToLayer:](self, "addColorInvertFilterToLayer:", v8);

    -[FMAnnotationView largePersonImageLayer](self, "largePersonImageLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView addColorInvertFilterToLayer:](self, "addColorInvertFilterToLayer:", v7);
  }
  else
  {
    -[FMAnnotationView smallPersonImageLayer](self, "smallPersonImageLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView removeColorInvertFilterToLayer:](self, "removeColorInvertFilterToLayer:", v6);

    -[FMAnnotationView largePersonImageLayer](self, "largePersonImageLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAnnotationView removeColorInvertFilterToLayer:](self, "removeColorInvertFilterToLayer:", v7);
  }

  -[FMAnnotationView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)shouldPreventLargeAnnotationState
{
  return self->_shouldPreventLargeAnnotationState;
}

- (void)setShouldPreventLargeAnnotationState:(BOOL)a3
{
  self->_shouldPreventLargeAnnotationState = a3;
}

- (BOOL)isDelayed
{
  return self->_isDelayed;
}

- (void)setIsDelayed:(BOOL)a3
{
  self->_isDelayed = a3;
}

- (CAShapeLayer)smallRingLayer
{
  return self->_smallRingLayer;
}

- (void)setSmallRingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_smallRingLayer, a3);
}

- (CAShapeLayer)largeRingLayer
{
  return self->_largeRingLayer;
}

- (void)setLargeRingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_largeRingLayer, a3);
}

- (CALayer)smallCircleLayer
{
  return self->_smallCircleLayer;
}

- (void)setSmallCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_smallCircleLayer, a3);
}

- (CALayer)largeCircleLayer
{
  return self->_largeCircleLayer;
}

- (void)setLargeCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_largeCircleLayer, a3);
}

- (CALayer)locationOuterLayer
{
  return self->_locationOuterLayer;
}

- (void)setLocationOuterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_locationOuterLayer, a3);
}

- (CALayer)locationInnerLayer
{
  return self->_locationInnerLayer;
}

- (void)setLocationInnerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_locationInnerLayer, a3);
}

- (CALayer)smallPersonImageLayer
{
  return self->_smallPersonImageLayer;
}

- (void)setSmallPersonImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_smallPersonImageLayer, a3);
}

- (CALayer)largePersonImageLayer
{
  return self->_largePersonImageLayer;
}

- (void)setLargePersonImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_largePersonImageLayer, a3);
}

- (BOOL)isShowingLargeSelectedAnnotation
{
  return self->_isShowingLargeSelectedAnnotation;
}

- (void)setIsShowingLargeSelectedAnnotation:(BOOL)a3
{
  self->_isShowingLargeSelectedAnnotation = a3;
}

- (BOOL)hasPhotoImage
{
  return self->_hasPhotoImage;
}

- (void)setHasPhotoImage:(BOOL)a3
{
  self->_hasPhotoImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largePersonImageLayer, 0);
  objc_storeStrong((id *)&self->_smallPersonImageLayer, 0);
  objc_storeStrong((id *)&self->_locationInnerLayer, 0);
  objc_storeStrong((id *)&self->_locationOuterLayer, 0);
  objc_storeStrong((id *)&self->_largeCircleLayer, 0);
  objc_storeStrong((id *)&self->_smallCircleLayer, 0);
  objc_storeStrong((id *)&self->_largeRingLayer, 0);
  objc_storeStrong((id *)&self->_smallRingLayer, 0);
}

@end
