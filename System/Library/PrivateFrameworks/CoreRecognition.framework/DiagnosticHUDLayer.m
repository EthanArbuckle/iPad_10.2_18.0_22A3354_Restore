@implementation DiagnosticHUDLayer

+ (id)layer
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (DiagnosticHUDLayer)init
{
  DiagnosticHUDLayer *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CGPathRef v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CGPathRef v34;
  void *v35;
  void *v36;
  double v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  CGFloat v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  CGPathRef v56;
  void *v57;
  void *v58;
  double v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  objc_super v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v68.receiver = self;
  v68.super_class = (Class)DiagnosticHUDLayer;
  v2 = -[DiagnosticHUDLayer init](&v68, sel_init);
  if (v2)
  {
    +[CRColor greenColor](CRColor, "greenColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer setFreshPointColor:](v2, "setFreshPointColor:", v3);

    +[CRColor yellowColor](CRColor, "yellowColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer setStalePointColor:](v2, "setStalePointColor:", v4);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer setCameraAreaLayer:](v2, "setCameraAreaLayer:", v5);

    +[CRColor blackColor](CRColor, "blackColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[DiagnosticHUDLayer cameraAreaLayer](v2, "cameraAreaLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    +[CRColor yellowColor](CRColor, "yellowColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");
    -[DiagnosticHUDLayer cameraAreaLayer](v2, "cameraAreaLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFillColor:", v10);

    -[DiagnosticHUDLayer cameraAreaLayer](v2, "cameraAreaLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 0.5;
    objc_msgSend(v12, "setOpacity:", v13);

    -[DiagnosticHUDLayer cameraAreaLayer](v2, "cameraAreaLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer addSublayer:](v2, "addSublayer:", v14);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer setPointLayers:](v2, "setPointLayers:", v15);

    v16 = 0.0;
    v17 = 4;
    do
    {
      objc_msgSend(MEMORY[0x24BDE5758], "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setBounds:", 0.0, 0.0, v16 * -2.5 + 20.0, v16 * -2.5 + 20.0);
      objc_msgSend(v18, "setHidden:", 1);
      objc_msgSend(v18, "bounds");
      objc_msgSend(v18, "setPath:", CGPathCreateWithEllipseInRect(v69, 0));
      -[DiagnosticHUDLayer addSublayer:](v2, "addSublayer:", v18);
      -[DiagnosticHUDLayer pointLayers](v2, "pointLayers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v18);

      v16 = v16 + 1.0;
      --v17;
    }
    while (v17);
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer setFocusIndicatorLayer:](v2, "setFocusIndicatorLayer:", v20);

    -[DiagnosticHUDLayer focusIndicatorLayer](v2, "focusIndicatorLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBounds:", 0.0, 0.0, 20.0, 20.0);

    -[DiagnosticHUDLayer focusIndicatorLayer](v2, "focusIndicatorLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 1);

    -[DiagnosticHUDLayer focusIndicatorLayer](v2, "focusIndicatorLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v24 = CGPathCreateWithEllipseInRect(v70, 0);
    -[DiagnosticHUDLayer focusIndicatorLayer](v2, "focusIndicatorLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPath:", v24);

    +[CRColor blueColor](CRColor, "blueColor");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = objc_msgSend(v26, "CGColor");
    -[DiagnosticHUDLayer focusIndicatorLayer](v2, "focusIndicatorLayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFillColor:", v27);

    -[DiagnosticHUDLayer focusIndicatorLayer](v2, "focusIndicatorLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer addSublayer:](v2, "addSublayer:", v29);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer setFocusPointLayer:](v2, "setFocusPointLayer:", v30);

    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBounds:", 0.0, 0.0, 30.0, 30.0);

    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHidden:", 1);

    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bounds");
    v34 = CGPathCreateWithEllipseInRect(v71, 0);
    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPath:", v34);

    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = 0.5;
    objc_msgSend(v36, "setOpacity:", v37);

    +[CRColor clearColor](CRColor, "clearColor");
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v39 = objc_msgSend(v38, "CGColor");
    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFillColor:", v39);

    +[CRColor grayColor](CRColor, "grayColor");
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = objc_msgSend(v41, "CGColor");
    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setStrokeColor:", v42);

    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setLineWidth:", 4.0);

    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bounds");
    v46 = CGRectGetWidth(v72) * 3.14159265 / 20.0;

    v47 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "arrayWithObjects:", v48, v49, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setLineDashPattern:", v50);

    -[DiagnosticHUDLayer focusPointLayer](v2, "focusPointLayer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer addSublayer:](v2, "addSublayer:", v52);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer setFrameIndicator:](v2, "setFrameIndicator:", v53);

    -[DiagnosticHUDLayer frameIndicator](v2, "frameIndicator");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setBounds:", 0.0, 0.0, 20.0, 20.0);

    -[DiagnosticHUDLayer frameIndicator](v2, "frameIndicator");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bounds");
    v56 = CGPathCreateWithEllipseInRect(v73, 0);
    -[DiagnosticHUDLayer frameIndicator](v2, "frameIndicator");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setPath:", v56);

    -[DiagnosticHUDLayer frameIndicator](v2, "frameIndicator");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v59) = 0.5;
    objc_msgSend(v58, "setOpacity:", v59);

    +[CRColor redColor](CRColor, "redColor");
    v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v61 = objc_msgSend(v60, "CGColor");
    -[DiagnosticHUDLayer frameIndicator](v2, "frameIndicator");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setFillColor:", v61);

    +[CRColor grayColor](CRColor, "grayColor");
    v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v64 = objc_msgSend(v63, "CGColor");
    -[DiagnosticHUDLayer frameIndicator](v2, "frameIndicator");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setStrokeColor:", v64);

    -[DiagnosticHUDLayer frameIndicator](v2, "frameIndicator");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer addSublayer:](v2, "addSublayer:", v66);

  }
  return v2;
}

- (void)layoutSublayers
{
  void *v3;
  double v4;
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double Width;
  double Height;
  uint64_t v14;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v27;
  double v28;
  void *v29;
  CGFloat v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  double MinX;
  double v37;
  CGFloat v38;
  double MinY;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  CGPathRef v47;
  CFTypeRef v48;
  void *v49;
  CGFloat v50;
  CGFloat v51;
  void *v52;
  CGFloat v53;
  CGFloat v54;
  void *v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  -[DiagnosticHUDLayer previewLayer](self, "previewLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DiagnosticHUDLayer cameraResolution](self, "cameraResolution");
    if (v5 == *MEMORY[0x24BDBF148] && v4 == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      -[DiagnosticHUDLayer cameraAreaLayer](self, "cameraAreaLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPath:", 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      -[DiagnosticHUDLayer cameraResolution](self, "cameraResolution");
      v8 = v7;
      -[DiagnosticHUDLayer cameraResolution](self, "cameraResolution");
      v10 = v9;
      -[DiagnosticHUDLayer cameraAreaLayer](self, "cameraAreaLayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, v10);

      -[DiagnosticHUDLayer bounds](self, "bounds");
      Width = CGRectGetWidth(v58);
      -[DiagnosticHUDLayer bounds](self, "bounds");
      Height = CGRectGetHeight(v59);
      -[DiagnosticHUDLayer bounds](self, "bounds");
      if (Width <= Height)
        v18 = CGRectGetHeight(*(CGRect *)&v14);
      else
        v18 = CGRectGetWidth(*(CGRect *)&v14);
      v20 = v18 / 5.0;
      -[DiagnosticHUDLayer bounds](self, "bounds");
      v21 = CGRectGetWidth(v60);
      -[DiagnosticHUDLayer bounds](self, "bounds");
      v22 = CGRectGetHeight(v61);
      -[DiagnosticHUDLayer bounds](self, "bounds");
      if (v21 <= v22)
        v27 = CGRectGetWidth(*(CGRect *)&v23);
      else
        v27 = CGRectGetHeight(*(CGRect *)&v23);
      v28 = v27 / 15.0;
      -[DiagnosticHUDLayer cameraAreaLayer](self, "cameraAreaLayer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bounds");
      v30 = v20 / CGRectGetWidth(v62);

      CGAffineTransformMakeScale(&v57, v30, v30);
      -[DiagnosticHUDLayer cameraAreaLayer](self, "cameraAreaLayer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v57;
      objc_msgSend(v31, "setAffineTransform:", &v56);

      -[DiagnosticHUDLayer cameraAreaLayer](self, "cameraAreaLayer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAnchorPoint:", 1.0, 1.0);

      -[DiagnosticHUDLayer bounds](self, "bounds");
      v33 = CGRectGetMaxX(v63) - v28;
      -[DiagnosticHUDLayer bounds](self, "bounds");
      v34 = CGRectGetMaxY(v64) - v28;
      -[DiagnosticHUDLayer cameraAreaLayer](self, "cameraAreaLayer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPosition:", v33, v34);

      -[DiagnosticHUDLayer visibleRect](self, "visibleRect");
      MinX = CGRectGetMinX(v65);
      -[DiagnosticHUDLayer cameraResolution](self, "cameraResolution");
      v38 = MinX * v37;
      -[DiagnosticHUDLayer visibleRect](self, "visibleRect");
      MinY = CGRectGetMinY(v66);
      -[DiagnosticHUDLayer cameraResolution](self, "cameraResolution");
      v41 = MinY * v40;
      -[DiagnosticHUDLayer visibleRect](self, "visibleRect");
      v42 = CGRectGetWidth(v67);
      -[DiagnosticHUDLayer cameraResolution](self, "cameraResolution");
      v44 = v42 * v43;
      -[DiagnosticHUDLayer visibleRect](self, "visibleRect");
      v45 = CGRectGetHeight(v68);
      -[DiagnosticHUDLayer cameraResolution](self, "cameraResolution");
      v69.size.height = v45 * v46;
      v69.origin.x = v38;
      v69.origin.y = v41;
      v69.size.width = v44;
      v47 = CGPathCreateWithRect(v69, 0);
      v48 = CFAutorelease(v47);
      -[DiagnosticHUDLayer cameraAreaLayer](self, "cameraAreaLayer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setPath:", v48);

      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    }
  }
  -[DiagnosticHUDLayer bounds](self, "bounds");
  v50 = CGRectGetMaxX(v70) + -40.0;
  -[DiagnosticHUDLayer bounds](self, "bounds");
  v51 = CGRectGetMinY(v71) + 40.0;
  -[DiagnosticHUDLayer focusIndicatorLayer](self, "focusIndicatorLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPosition:", v50, v51);

  -[DiagnosticHUDLayer bounds](self, "bounds");
  v53 = CGRectGetMinX(v72) + 40.0;
  -[DiagnosticHUDLayer bounds](self, "bounds");
  v54 = CGRectGetMinY(v73) + 80.0;
  -[DiagnosticHUDLayer frameIndicator](self, "frameIndicator");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setPosition:", v53, v54);

}

- (void)setBoxPoints:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("fillColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticHUDLayer freshPointColor](self, "freshPointColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setFromValue:", objc_msgSend(v5, "CGColor"));

  -[DiagnosticHUDLayer stalePointColor](self, "stalePointColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setToValue:", objc_msgSend(v6, "CGColor"));

  objc_msgSend(v4, "setDuration:", 1.0);
  for (i = 0; i != 4; ++i)
  {
    objc_msgSend(v16, "objectAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticHUDLayer pointLayers](self, "pointLayers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "removeAllAnimations");
    objc_msgSend(v10, "setHidden:", v8 == 0);
    objc_msgSend(v8, "CGPointValue");
    objc_msgSend(v10, "setPosition:");
    v11 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, CFSTR("hidden"), v13, CFSTR("position"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActions:", v14);

    objc_msgSend(v10, "addAnimation:forKey:", v4, CFSTR("fillColor"));
    objc_msgSend(v4, "toValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFillColor:", v15);

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (void)setPreviewLayer:(id)a3 visibleRect:(CGRect)a4 cameraResolution:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double y;
  double x;

  height = a5.height;
  width = a5.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[DiagnosticHUDLayer setPreviewLayer:](self, "setPreviewLayer:", a3);
  -[DiagnosticHUDLayer setPreviewLayerVisibleRect:](self, "setPreviewLayerVisibleRect:", x, y, v8, v7);
  -[DiagnosticHUDLayer setCameraResolution:](self, "setCameraResolution:", width, height);
  -[DiagnosticHUDLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAdjustingFocus:(BOOL)a3 pointOfInterestSupported:(BOOL)a4 focusPoint:(CGPoint)a5
{
  double y;
  double x;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;

  y = a5.y;
  x = a5.x;
  v7 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[DiagnosticHUDLayer focusIndicatorLayer](self, "focusIndicatorLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", !v8);

  -[DiagnosticHUDLayer focusPointLayer](self, "focusPointLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7)
  {
    objc_msgSend(v11, "setHidden:", 0);

    if (v8)
      +[CRColor blueColor](CRColor, "blueColor");
    else
      +[CRColor grayColor](CRColor, "grayColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "CGColor");
    -[DiagnosticHUDLayer focusPointLayer](self, "focusPointLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStrokeColor:", v14);

    -[DiagnosticHUDLayer focusPointLayer](self, "focusPointLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPosition:", x, y);
  }
  else
  {
    objc_msgSend(v11, "setHidden:", 1);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)refreshFrameIndicator
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 0);
  -[DiagnosticHUDLayer frameIndicator](self, "frameIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__DiagnosticHUDLayer_refreshFrameIndicator__block_invoke;
  v4[3] = &unk_24C58B188;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v4);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __43__DiagnosticHUDLayer_refreshFrameIndicator__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 0);
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 2.0);
  objc_msgSend(*(id *)(a1 + 32), "frameIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  return objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (CALayer)previewLayer
{
  return (CALayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPreviewLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CGRect)previewLayerVisibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_previewLayerVisibleRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPreviewLayerVisibleRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_previewLayerVisibleRect, &v3, 32, 1, 0);
}

- (CGSize)cameraResolution
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_cameraResolution, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCameraResolution:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_cameraResolution, &v3, 16, 1, 0);
}

- (CRColor)freshPointColor
{
  return (CRColor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFreshPointColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CRColor)stalePointColor
{
  return (CRColor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStalePointColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)pointLayers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPointLayers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CAShapeLayer)cameraAreaLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCameraAreaLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CAShapeLayer)focusIndicatorLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFocusIndicatorLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CAShapeLayer)focusPointLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFocusPointLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CAShapeLayer)frameIndicator
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFrameIndicator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameIndicator, 0);
  objc_storeStrong((id *)&self->_focusPointLayer, 0);
  objc_storeStrong((id *)&self->_focusIndicatorLayer, 0);
  objc_storeStrong((id *)&self->_cameraAreaLayer, 0);
  objc_storeStrong((id *)&self->_pointLayers, 0);
  objc_storeStrong((id *)&self->_stalePointColor, 0);
  objc_storeStrong((id *)&self->_freshPointColor, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
}

@end
