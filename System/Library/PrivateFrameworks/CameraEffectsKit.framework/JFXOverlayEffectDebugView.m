@implementation JFXOverlayEffectDebugView

- (JFXOverlayEffectDebugView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  JFXOverlayEffectDebugView *v10;
  JFXOverlayEffectDebugView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)JFXOverlayEffectDebugView;
  v10 = -[JFXOverlayEffectDebugView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[JFXOverlayEffectDebugView setDelegate:](v10, "setDelegate:", v9);
    -[JFXOverlayEffectDebugView setupViews](v11, "setupViews");
  }

  return v11;
}

- (JFXOverlayEffectDebugView)initWithCoder:(id)a3
{
  JFXOverlayEffectDebugView *v3;
  JFXOverlayEffectDebugView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXOverlayEffectDebugView;
  v3 = -[JFXOverlayEffectDebugView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[JFXOverlayEffectDebugView setupViews](v3, "setupViews");
  return v4;
}

- (void)setupViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
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
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  JFXOverlayEffectDebugView *v61;
  uint64_t v62;
  id v63;

  -[JFXOverlayEffectDebugView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[JFXOverlayEffectDebugView setRootContainerView:](self, "setRootContainerView:", v4);

  -[JFXOverlayEffectDebugView rootContainerView](self, "rootContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[JFXOverlayEffectDebugView rootContainerView](self, "rootContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView addSubview:](self, "addSubview:", v6);

  -[JFXOverlayEffectDebugView rootContainerView](self, "rootContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setRootLayer:](self, "setRootLayer:", v8);

  objc_msgSend(MEMORY[0x24BDE57E0], "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setRootTransformLayer:](self, "setRootTransformLayer:", v9);

  v10 = *MEMORY[0x24BDBEFB0];
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnchorPoint:", v10, v11);

  -[JFXOverlayEffectDebugView rootLayer](self, "rootLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSublayer:", v14);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setDocumentBoundingBoxLayer:](self, "setDocumentBoundingBoxLayer:", v15);

  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView documentBoundingBoxLayer](self, "documentBoundingBoxLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSublayer:", v17);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setOutputROILayer:](self, "setOutputROILayer:", v18);

  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView outputROILayer](self, "outputROILayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSublayer:", v20);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setObjectAlignedBoundingBoxLayer:](self, "setObjectAlignedBoundingBoxLayer:", v21);

  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView objectAlignedBoundingBoxLayer](self, "objectAlignedBoundingBoxLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSublayer:", v23);

  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setTextBoundingBoxesContainerLayer:](self, "setTextBoundingBoxesContainerLayer:", v24);

  -[JFXOverlayEffectDebugView rootLayer](self, "rootLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSublayer:", v26);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setHitAreaBoundingBoxLayer:](self, "setHitAreaBoundingBoxLayer:", v27);

  -[JFXOverlayEffectDebugView rootLayer](self, "rootLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView hitAreaBoundingBoxLayer](self, "hitAreaBoundingBoxLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSublayer:", v29);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setHitAreaMinimumSizeBoundingBoxLayer:](self, "setHitAreaMinimumSizeBoundingBoxLayer:", v30);

  -[JFXOverlayEffectDebugView rootLayer](self, "rootLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSublayer:", v32);

  -[JFXOverlayEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = 1050253722;
  objc_msgSend(v33, "setOpacity:", v34);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setMidpointLayer:](self, "setMidpointLayer:", v35);

  -[JFXOverlayEffectDebugView rootLayer](self, "rootLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView midpointLayer](self, "midpointLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSublayer:", v37);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setOverlayCenterLayer:](self, "setOverlayCenterLayer:", v38);

  -[JFXOverlayEffectDebugView rootLayer](self, "rootLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView overlayCenterLayer](self, "overlayCenterLayer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addSublayer:", v40);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setOriginCrosshairLayer:](self, "setOriginCrosshairLayer:", v41);

  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView originCrosshairLayer](self, "originCrosshairLayer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSublayer:", v43);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setCornerPointsLayer:](self, "setCornerPointsLayer:", v44);

  -[JFXOverlayEffectDebugView rootLayer](self, "rootLayer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addSublayer:", v46);

  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setTextCornerPointsContainerLayer:](self, "setTextCornerPointsContainerLayer:", v47);

  -[JFXOverlayEffectDebugView rootLayer](self, "rootLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addSublayer:", v49);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setHitAreaPointsLayer:](self, "setHitAreaPointsLayer:", v50);

  -[JFXOverlayEffectDebugView rootLayer](self, "rootLayer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addSublayer:", v52);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setAdditionalRectsLayer:](self, "setAdditionalRectsLayer:", v53);

  -[JFXOverlayEffectDebugView rootLayer](self, "rootLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView additionalRectsLayer](self, "additionalRectsLayer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addSublayer:", v55);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView setAdditionalRectsTransformedLayer:](self, "setAdditionalRectsTransformedLayer:", v56);

  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView additionalRectsTransformedLayer](self, "additionalRectsTransformedLayer");
  v58 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addSublayer:", v58);

  -[JFXOverlayEffectDebugView delegate](self, "delegate");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v58) = objc_opt_respondsToSelector();

  if ((v58 & 1) != 0
    && (-[JFXOverlayEffectDebugView delegate](self, "delegate"),
        v60 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v60, "overlayEffectDebugViewOptions"),
        v63 = (id)objc_claimAutoreleasedReturnValue(),
        v60,
        v63))
  {
    v61 = self;
    v62 = (uint64_t)v63;
  }
  else
  {
    v62 = objc_opt_new();
    v61 = self;
    v63 = (id)v62;
  }
  -[JFXOverlayEffectDebugView setOptions:](v61, "setOptions:", v62);

}

- (void)updateDottedBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6 borderPhase:(double)a7 borderDashPattern:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a8;
  v17 = a6;
  v18 = a3;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  pv_CGRect_to_NSArray(v21);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v18, v20, v19, v17, v16, a7, a5 * 0.5);

}

- (void)updateBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  void *v14;
  id v15;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a6;
  v13 = a3;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  pv_CGRect_to_NSArray(v16);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v13, v15, v14, v12, 0, 0.0, a5);

}

- (void)updatePolygonLayer:(id)a3 points:(id)a4 borderWidth:(double)a5 borderColor:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = (void *)MEMORY[0x24BDF6950];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "clearColor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v12, v11, v13, v10, 0, 0.0, a5);

}

- (void)updateFilledPolygonLayer:(id)a3 path:(CGPath *)a4 fillColor:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDF6950];
  v9 = a5;
  objc_msgSend(v8, "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  v14 = v7;
  v12 = objc_msgSend(v11, "CGColor");

  objc_msgSend(v14, "setFillColor:", v12);
  v13 = objc_retainAutorelease(v10);
  objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v13, "CGColor"));
  objc_msgSend(v14, "setLineDashPhase:", 0.0);
  objc_msgSend(v14, "setLineDashPattern:", 0);
  objc_msgSend(v14, "setLineWidth:", 0.0);
  objc_msgSend(v14, "setPath:", a4);

}

- (void)updatePointsLayers:(id)a3 points:(id)a4 colors:(id)a5 size:(double)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;

  v9 = a4;
  v10 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__JFXOverlayEffectDebugView_updatePointsLayers_points_colors_size___block_invoke;
  v13[3] = &unk_24EE5C148;
  v16 = a6;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v13);

}

void __67__JFXOverlayEffectDebugView_updatePointsLayers_points_colors_size___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGPointValue");
  v9 = v8;

  v13.origin.x = CGRectMakeSquareWithSizeAndCenterPoint(*(double *)(a1 + 48), v9);
  pv_CGRect_to_NSArray(v13);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 % objc_msgSend(*(id *)(a1 + 40), "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v6, v12, v10, v11, 0, 0.0, 0.0);

}

- (void)updateFilledCircleLayer:(id)a3 center:(CGPoint)a4 radius:(double)a5 fillColor:(id)a6
{
  double x;
  id v9;
  id v10;
  const CGPath *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  CGRect v17;

  x = a4.x;
  v9 = a3;
  v10 = a6;
  v17.origin.x = CGRectMakeSquareWithSizeAndCenterPoint(a5 + a5, x);
  v11 = CGPathCreateWithEllipseInRect(v17, 0);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_retainAutorelease(v10);
  v16 = v9;
  v14 = objc_msgSend(v13, "CGColor");

  objc_msgSend(v16, "setFillColor:", v14);
  v15 = objc_retainAutorelease(v12);
  objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v15, "CGColor"));
  objc_msgSend(v16, "setLineDashPhase:", 0.0);
  objc_msgSend(v16, "setLineDashPattern:", 0);
  objc_msgSend(v16, "setLineWidth:", 0.0);
  objc_msgSend(v16, "setPath:", v11);

  CGPathRelease(v11);
}

- (void)updateCrosshairLayer:(id)a3 center:(CGPoint)a4 color:(id)a5 size:(CGSize)a6 thickness:(CGSize)a7
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  double v25[25];

  height = a7.height;
  width = a7.width;
  v9 = a6.height;
  v10 = a6.width;
  y = a4.y;
  x = a4.x;
  v25[24] = *(double *)MEMORY[0x24BDAC8D0];
  v24 = a3;
  v14 = a5;
  v15 = CGSizeScale(v10, v9, 0.5);
  v17 = v16;
  v18 = CGSizeScale(width, height, 0.5);
  v25[0] = -v18;
  v25[1] = v19;
  v25[2] = -v15;
  v25[3] = v19;
  v25[4] = -v15;
  v25[5] = -v19;
  v25[6] = -v18;
  v25[7] = -v19;
  v25[8] = -v18;
  v25[9] = -v17;
  v25[10] = v18;
  v25[11] = -v17;
  v25[12] = v18;
  v25[13] = -v19;
  v25[14] = v15;
  v25[15] = -v19;
  v25[16] = v15;
  v25[17] = v19;
  v25[18] = v18;
  v25[19] = v19;
  v25[20] = v18;
  v25[21] = v17;
  v25[22] = -v18;
  v25[23] = v17;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 24; i += 2)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x + v25[i], y + v25[i + 1], v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v22);

  }
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v24, v20, v14, v23, 0, 0.0, 0.0);

}

- (void)updateAdditionalRects:(id)a3 transformedLayer:(id)a4 effectScale:(double)a5 rects:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  double v19;

  v15 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(v15, "setHidden:", objc_msgSend(v10, "count") == 0);
  objc_msgSend(v9, "setHidden:", objc_msgSend(v15, "isHidden"));
  if ((objc_msgSend(v15, "isHidden") & 1) == 0)
  {
    objc_msgSend(v15, "sublayers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_68);
    objc_msgSend(v9, "sublayers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_44_0);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __86__JFXOverlayEffectDebugView_updateAdditionalRects_transformedLayer_effectScale_rects___block_invoke_3;
    v16[3] = &unk_24EE5C1D0;
    v19 = a5;
    v17 = v15;
    v18 = v9;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);

  }
}

uint64_t __86__JFXOverlayEffectDebugView_updateAdditionalRects_transformedLayer_effectScale_rects___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperlayer");
}

uint64_t __86__JFXOverlayEffectDebugView_updateAdditionalRects_transformedLayer_effectScale_rects___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperlayer");
}

void __86__JFXOverlayEffectDebugView_updateAdditionalRects_transformedLayer_effectScale_rects___block_invoke_3(uint64_t x0_0, void *a2)
{
  char v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  CGRect v13;

  v12 = a2;
  v3 = objc_msgSend(v12, "ignoreTransform");
  objc_msgSend(v12, "borderWidth");
  v5 = v4;
  if ((v3 & 1) == 0)
    v5 = v4 / *(double *)(x0_0 + 48);
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  pv_CGRect_to_NSArray(v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "borderColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v6, v7, v8, v9, 0, 0.0, v5);

  v10 = objc_msgSend(v12, "ignoreTransform");
  v11 = 40;
  if (v10)
    v11 = 32;
  objc_msgSend(*(id *)(x0_0 + v11), "addSublayer:", v6);

}

- (void)updateWithEffectFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  __int128 v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  double SquareWithSize;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  int v68;
  uint64_t v69;
  CGFloat v70;
  CGFloat v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  int v107;
  uint64_t v108;
  double v109;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  int v129;
  uint64_t v130;
  void *v131;
  void *v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  int v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  double v194;
  double v195;
  double v196;
  double v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  id v213;
  void *v214;
  void *v215;
  void *v216;
  int v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  int v228;
  uint64_t v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  __int128 v234;
  double v235;
  __int128 v236;
  double v237;
  __int128 v238;
  double v239;
  __int128 v240;
  double v241;
  __int128 v242;
  double v243;
  __int128 v244;
  CGFloat v245;
  double v246;
  __int128 v247;
  double v248;
  double v249;
  __int128 v250;
  double v251;
  double v252;
  _QWORD v253[4];
  id v254;
  PVCGPointQuad v255;
  _QWORD v256[5];
  id v257;
  double v258;
  double v259;
  double v260;
  double v261;
  _OWORD v262[20];
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  _OWORD v267[8];
  _OWORD v268[3];
  _OWORD v269[3];
  __int128 v270;
  __int128 v271;
  __int128 v272;
  CGAffineTransform v273;
  CGAffineTransform v274;
  CGAffineTransform v275;
  void *v276;
  void *v277;
  void *v278;
  _QWORD v279[2];
  _QWORD v280[2];
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  double v288;
  uint64_t v289;
  CGRect v290;
  CGRect v291;

  v289 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "isTrackedButTrackingUnavailable"))
  {
    -[JFXOverlayEffectDebugView rootContainerView](self, "rootContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    goto LABEL_65;
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[JFXOverlayEffectDebugView rootContainerView](self, "rootContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  objc_msgSend(v5, "relativeToSize");
  v290.origin.x = CGRectMakeWithSize();
  x = v290.origin.x;
  y = v290.origin.y;
  width = v290.size.width;
  height = v290.size.height;
  MidX = CGRectGetMidX(v290);
  v291.origin.x = x;
  v291.origin.y = y;
  v291.size.width = width;
  v291.size.height = height;
  MidY = CGRectGetMidY(v291);
  v271 = 0u;
  v272 = 0u;
  v270 = 0u;
  -[JFXOverlayEffectDebugView transform](self, "transform");
  v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v269[0] = *MEMORY[0x24BDBD8B8];
  v269[1] = v14;
  v269[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[JFXOverlayEffectDebugView setTransform:](self, "setTransform:", v269);
  -[JFXOverlayEffectDebugView setFrame:](self, "setFrame:", x, y, width, height);
  v268[0] = v270;
  v268[1] = v271;
  v268[2] = v272;
  -[JFXOverlayEffectDebugView setTransform:](self, "setTransform:", v268);
  -[JFXOverlayEffectDebugView rootContainerView](self, "rootContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", x, y, width, height);

  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v267[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v267[5] = v17;
  v18 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v267[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v267[7] = v18;
  v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v267[0] = *MEMORY[0x24BDE5598];
  v267[1] = v19;
  v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v267[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v267[3] = v20;
  objc_msgSend(v16, "setTransform:", v267);

  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBounds:", x, y, width, height);

  v23 = *MEMORY[0x24BDBEFB0];
  v22 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v246 = v22;
  objc_msgSend(v24, "setPosition:", v23, v22);

  v265 = 0u;
  v266 = 0u;
  v263 = 0u;
  v264 = 0u;
  memset(&v262[16], 0, 64);
  objc_msgSend(v5, "transformInfo");
  v25 = fmax(fabs(*(double *)&v263), 0.001);
  objc_msgSend(v5, "transform");
  v247 = v262[11];
  v250 = v262[9];
  v238 = v262[10];
  v240 = v262[8];
  v242 = v262[15];
  v244 = v262[13];
  v234 = v262[14];
  v236 = v262[12];
  -[JFXOverlayEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v262[0] = v240;
  v262[1] = v250;
  v262[2] = v238;
  v262[3] = v247;
  v262[4] = v236;
  v262[5] = v244;
  v262[6] = v234;
  v262[7] = v242;
  objc_msgSend(v26, "setTransform:", v262);

  -[JFXOverlayEffectDebugView documentBoundingBoxLayer](self, "documentBoundingBoxLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView documentBoundingBoxLayer](self, "documentBoundingBoxLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView outputROILayer](self, "outputROILayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView outputROILayer](self, "outputROILayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView objectAlignedBoundingBoxLayer](self, "objectAlignedBoundingBoxLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView objectAlignedBoundingBoxLayer](self, "objectAlignedBoundingBoxLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView midpointLayer](self, "midpointLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView midpointLayer](self, "midpointLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView overlayCenterLayer](self, "overlayCenterLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView overlayCenterLayer](self, "overlayCenterLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView originCrosshairLayer](self, "originCrosshairLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView originCrosshairLayer](self, "originCrosshairLayer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView additionalRectsLayer](self, "additionalRectsLayer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBounds:", x, y, width, height);

  -[JFXOverlayEffectDebugView additionalRectsLayer](self, "additionalRectsLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView additionalRectsTransformedLayer](self, "additionalRectsTransformedLayer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v243 = x;
  v241 = y;
  v239 = width;
  v237 = height;
  v50 = height;
  v51 = v25;
  objc_msgSend(v49, "setBounds:", x, y, width, v50);

  -[JFXOverlayEffectDebugView additionalRectsTransformedLayer](self, "additionalRectsTransformedLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPosition:", MidX, MidY);

  -[JFXOverlayEffectDebugView options](self, "options");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "showDocumentBoundingBox");

  v55 = v54 ^ 1u;
  -[JFXOverlayEffectDebugView documentBoundingBoxLayer](self, "documentBoundingBoxLayer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setHidden:", v55);

  if ((v55 & 1) == 0)
  {
    SquareWithSize = CGRectMakeSquareWithSize();
    v59 = v58;
    v61 = v60;
    v63 = v62;
    objc_msgSend(v5, "effectSize");
    v65 = v64;
    v67 = v66;
    v68 = objc_msgSend(v5, "effectOrigin");
    v69 = 0;
    v281 = SquareWithSize;
    v282 = v59;
    v283 = SquareWithSize + v61;
    v284 = v59;
    v285 = SquareWithSize + v61;
    v286 = v59 + v63;
    v287 = SquareWithSize;
    v288 = v59 + v63;
    while (1)
    {
      v251 = *(double *)((char *)&v281 + v69);
      v248 = *(double *)((char *)&v281 + v69 + 8);
      if (v68 == 2)
        break;
      v70 = v246;
      v71 = v23;
      if (v68 != 1)
        goto LABEL_10;
      memset(&v273, 0, sizeof(v273));
      CGAffineTransformMakeScale(&v273, v65, v67);
      v274 = v273;
      CGAffineTransformTranslate(&v275, &v274, v23, 1.0);
      v273 = v275;
      v274 = v275;
      CGAffineTransformScale(&v275, &v274, 1.0, -1.0);
LABEL_11:
      v273 = v275;
      *(float64x2_t *)((char *)&v281 + v69) = vaddq_f64(*(float64x2_t *)&v275.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v275.c, v248), *(float64x2_t *)&v275.a, v251));
      v69 += 16;
      if (v69 == 64)
      {
        v72 = 0;
        v73 = -1.79769313e308;
        v74 = 1.79769313e308;
        v75 = -1.79769313e308;
        v76 = 1.79769313e308;
        do
        {
          v77 = *(double *)((char *)&v281 + v72);
          v78 = *(double *)((char *)&v281 + v72 + 8);
          if (v77 < v76)
            v76 = *(double *)((char *)&v281 + v72);
          if (v77 > v75)
            v75 = *(double *)((char *)&v281 + v72);
          if (v78 > v73)
            v73 = *(double *)((char *)&v281 + v72 + 8);
          if (v78 < v74)
            v74 = *(double *)((char *)&v281 + v72 + 8);
          v72 += 16;
        }
        while (v72 != 64);
        v79 = v75 - v76;
        v80 = v73 - v74;
        -[JFXOverlayEffectDebugView documentBoundingBoxLayer](self, "documentBoundingBoxLayer");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXOverlayEffectDebugView options](self, "options");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "documentBoundingBoxColor");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 8.0 / v51);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v280[0] = v84;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 5.0 / v51);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v280[1] = v85;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v280, 2);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXOverlayEffectDebugView updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v81, v83, v86, v76, v74, v79, v80, 2.0 / v51, 0.0);

        goto LABEL_23;
      }
    }
    v70 = -0.5;
    v71 = -0.5;
LABEL_10:
    memset(&v273, 0, sizeof(v273));
    CGAffineTransformMakeScale(&v273, v65, v67);
    v274 = v273;
    CGAffineTransformTranslate(&v275, &v274, v71, v70);
    goto LABEL_11;
  }
LABEL_23:
  -[JFXOverlayEffectDebugView options](self, "options");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "showDocumentBoundingBox");

  v89 = v88 ^ 1u;
  -[JFXOverlayEffectDebugView outputROILayer](self, "outputROILayer");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setHidden:", v89);

  v245 = v23;
  if ((v89 & 1) != 0)
    goto LABEL_42;
  v235 = v51;
  objc_msgSend(v5, "outputROI");
  v92 = v91;
  v94 = v93;
  v96 = v95;
  v98 = v97;
  objc_msgSend(v5, "effectSize");
  v100 = v99;
  v102 = v101;
  objc_msgSend(v5, "effectSize");
  v104 = v103;
  v106 = v105;
  v107 = objc_msgSend(v5, "effectOrigin");
  v108 = 0;
  v281 = v92;
  v282 = v94;
  v283 = v92 + v96;
  v284 = v94;
  v285 = v92 + v96;
  v286 = v94 + v98;
  v287 = v92;
  v288 = v94 + v98;
  v109 = v104 / v100;
  v110 = v106 / v102;
  do
  {
    v252 = *(double *)((char *)&v281 + v108);
    v249 = *(double *)((char *)&v281 + v108 + 8);
    if (v107 == 2)
    {
      v111 = v102 * -0.5;
      v112 = v100 * -0.5;
    }
    else
    {
      v111 = v246;
      v112 = v245;
      if (v107 == 1)
      {
        memset(&v273, 0, sizeof(v273));
        CGAffineTransformMakeScale(&v273, v109, v110);
        v274 = v273;
        CGAffineTransformTranslate(&v275, &v274, v245, v102);
        v273 = v275;
        v274 = v275;
        CGAffineTransformScale(&v275, &v274, 1.0, -1.0);
        goto LABEL_30;
      }
    }
    memset(&v273, 0, sizeof(v273));
    CGAffineTransformMakeScale(&v273, v109, v110);
    v274 = v273;
    CGAffineTransformTranslate(&v275, &v274, v112, v111);
LABEL_30:
    v273 = v275;
    *(float64x2_t *)((char *)&v281 + v108) = vaddq_f64(*(float64x2_t *)&v275.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v275.c, v249), *(float64x2_t *)&v275.a, v252));
    v108 += 16;
  }
  while (v108 != 64);
  v113 = 0;
  v114 = -1.79769313e308;
  v115 = 1.79769313e308;
  v116 = -1.79769313e308;
  v117 = 1.79769313e308;
  do
  {
    v118 = *(double *)((char *)&v281 + v113);
    v119 = *(double *)((char *)&v281 + v113 + 8);
    if (v118 < v117)
      v117 = *(double *)((char *)&v281 + v113);
    if (v118 > v116)
      v116 = *(double *)((char *)&v281 + v113);
    if (v119 > v114)
      v114 = *(double *)((char *)&v281 + v113 + 8);
    if (v119 < v115)
      v115 = *(double *)((char *)&v281 + v113 + 8);
    v113 += 16;
  }
  while (v113 != 64);
  v120 = v116 - v117;
  v121 = v114 - v115;
  -[JFXOverlayEffectDebugView outputROILayer](self, "outputROILayer");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v235;
  -[JFXOverlayEffectDebugView options](self, "options");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "outputROIColor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 6.0 / v235);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v279[0] = v125;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 4.0 / v235);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v279[1] = v126;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v279, 2);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffectDebugView updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v122, v124, v127, v117, v115, v120, v121, 2.0 / v235, 0.0);

  v23 = v245;
LABEL_42:
  -[JFXOverlayEffectDebugView options](self, "options");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v128, "showObjectAlignedBoundingBox");

  v130 = v129 ^ 1u;
  -[JFXOverlayEffectDebugView objectAlignedBoundingBoxLayer](self, "objectAlignedBoundingBoxLayer");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setHidden:", v130);

  if ((v130 & 1) == 0)
  {
    -[JFXOverlayEffectDebugView objectAlignedBoundingBoxLayer](self, "objectAlignedBoundingBoxLayer");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectBounds");
    v134 = v133;
    v136 = v135;
    v138 = v137;
    v140 = v139;
    -[JFXOverlayEffectDebugView options](self, "options");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "objectAlignedBoundingBoxColor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v245;
    -[JFXOverlayEffectDebugView updateBorderedLayer:borderRect:borderWidth:borderColor:](self, "updateBorderedLayer:borderRect:borderWidth:borderColor:", v132, v142, v134, v136, v138, v140, 2.0 / v51);

  }
  -[JFXOverlayEffectDebugView options](self, "options");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v143, "showTextBoundingBoxes"))
  {
    objc_msgSend(v5, "textFrames");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = objc_msgSend(v144, "count");

    -[JFXOverlayEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "setHidden:", v145 == 0);

    if (v145)
    {
      -[JFXOverlayEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textFrames");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      ensureNSublayers(v147, objc_msgSend(v148, "count"));

      objc_msgSend(v5, "textFrames");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v256[0] = MEMORY[0x24BDAC760];
      v256[1] = 3221225472;
      v256[2] = __51__JFXOverlayEffectDebugView_updateWithEffectFrame___block_invoke;
      v256[3] = &unk_24EE5C1F8;
      v256[4] = self;
      v258 = v243;
      v259 = v241;
      v260 = v239;
      v261 = v237;
      v257 = v5;
      objc_msgSend(v149, "enumerateObjectsUsingBlock:", v256);

    }
  }
  else
  {

    -[JFXOverlayEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setHidden:", 1);

  }
  -[JFXOverlayEffectDebugView options](self, "options");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = objc_msgSend(v151, "showHitAreaBoundingBox");

  -[JFXOverlayEffectDebugView hitAreaBoundingBoxLayer](self, "hitAreaBoundingBoxLayer");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v153;
  if (v152)
  {
    objc_msgSend(v153, "setHidden:", 0);

    -[JFXOverlayEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setHidden:", 0);

    -[JFXOverlayEffectDebugView hitAreaBoundingBoxLayer](self, "hitAreaBoundingBoxLayer");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hitAreaPoints");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView options](self, "options");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "hitAreaBoundingBoxColor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView updatePolygonLayer:points:borderWidth:borderColor:](self, "updatePolygonLayer:points:borderWidth:borderColor:", v156, v157, v159, 3.0);

    -[JFXOverlayEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    ensureNSublayers(v160, 1uLL);

    -[JFXOverlayEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "sublayers");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "firstObject");
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    v164 = objc_msgSend(v5, "hitAreaPath");
    -[JFXOverlayEffectDebugView options](self, "options");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "hitAreaBoundingBoxColor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView updateFilledPolygonLayer:path:fillColor:](self, "updateFilledPolygonLayer:path:fillColor:", v163, v164, v166);

    -[JFXOverlayEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = objc_msgSend(v5, "expandedHitAreaPath");
    -[JFXOverlayEffectDebugView options](self, "options");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "hitAreaBoundingBoxColor");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView updateFilledPolygonLayer:path:fillColor:](self, "updateFilledPolygonLayer:path:fillColor:", v167, v168, v170);

  }
  else
  {
    objc_msgSend(v153, "setHidden:", 1);

    -[JFXOverlayEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "setHidden:", 1);
  }

  -[JFXOverlayEffectDebugView options](self, "options");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = objc_msgSend(v171, "showCornerPoints");

  v173 = v172 ^ 1u;
  -[JFXOverlayEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "setHidden:", v173);

  if ((v173 & 1) == 0)
  {
    -[JFXOverlayEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    ensureNSublayers(v175, 4uLL);

    -[JFXOverlayEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "sublayers");
    v177 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "cornerPoints");
    PVCGPointQuad_to_NSArray(&v255);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView options](self, "options");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "cornerPointColors");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView updatePointsLayers:points:colors:size:](self, "updatePointsLayers:points:colors:size:", v177, v178, v180, 4.0);

  }
  -[JFXOverlayEffectDebugView options](self, "options");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = objc_msgSend(v181, "showMidpoint");

  v183 = v182 ^ 1u;
  -[JFXOverlayEffectDebugView midpointLayer](self, "midpointLayer");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "setHidden:", v183);

  if ((v183 & 1) == 0)
  {
    -[JFXOverlayEffectDebugView midpointLayer](self, "midpointLayer");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v278 = v185;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v278, 1);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(v5, "center");
    objc_msgSend(v187, "valueWithCGPoint:");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v277 = v188;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v277, 1);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView options](self, "options");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "midpointColor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v276 = v191;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v276, 1);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView updatePointsLayers:points:colors:size:](self, "updatePointsLayers:points:colors:size:", v186, v189, v192, 6.0);

    -[JFXOverlayEffectDebugView overlayCenterLayer](self, "overlayCenterLayer");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "overlayCenter");
    v195 = v194;
    v197 = v196;
    -[JFXOverlayEffectDebugView options](self, "options");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "overlayCenterColor");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView updateFilledCircleLayer:center:radius:fillColor:](self, "updateFilledCircleLayer:center:radius:fillColor:", v193, v199, v195, v197, 6.0);

    -[JFXOverlayEffectDebugView originCrosshairLayer](self, "originCrosshairLayer");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView options](self, "options");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "originCrosshairColor");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView updateCrosshairLayer:center:color:size:thickness:](self, "updateCrosshairLayer:center:color:size:thickness:", v200, v202, v23, v246, 10.0 / v51, 10.0 / v51, 2.0 / v51, 2.0 / v51);

  }
  -[JFXOverlayEffectDebugView options](self, "options");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v203, "showTextCornerPoints"))
  {
    objc_msgSend(v5, "textFrames");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = objc_msgSend(v204, "count");

    -[JFXOverlayEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "setHidden:", v205 == 0);

    if (v205)
    {
      -[JFXOverlayEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textFrames");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      ensureNSublayers(v207, 4 * objc_msgSend(v208, "count"));

      -[JFXOverlayEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "sublayers");
      v210 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v210, "count"));
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textFrames");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v253[0] = MEMORY[0x24BDAC760];
      v253[1] = 3221225472;
      v253[2] = __51__JFXOverlayEffectDebugView_updateWithEffectFrame___block_invoke_2;
      v253[3] = &unk_24EE5C220;
      v254 = v211;
      v213 = v211;
      objc_msgSend(v212, "enumerateObjectsUsingBlock:", v253);

      -[JFXOverlayEffectDebugView options](self, "options");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "textCornerPointColors");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXOverlayEffectDebugView updatePointsLayers:points:colors:size:](self, "updatePointsLayers:points:colors:size:", v210, v213, v215, 4.0);

      goto LABEL_59;
    }
  }
  else
  {

    -[JFXOverlayEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v210, "setHidden:", 1);
LABEL_59:

  }
  -[JFXOverlayEffectDebugView options](self, "options");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = objc_msgSend(v216, "showHitAreaPoints");

  v218 = v217 ^ 1u;
  -[JFXOverlayEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "setHidden:", v218);

  if ((v218 & 1) == 0)
  {
    -[JFXOverlayEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hitAreaPoints");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    ensureNSublayers(v220, objc_msgSend(v221, "count"));

    -[JFXOverlayEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "sublayers");
    v223 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "hitAreaPoints");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView options](self, "options");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "hitAreaPointColors");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView updatePointsLayers:points:colors:size:](self, "updatePointsLayers:points:colors:size:", v223, v224, v226, 4.0);

  }
  -[JFXOverlayEffectDebugView options](self, "options");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v228 = objc_msgSend(v227, "showAdditionalRects");

  v229 = v228 ^ 1u;
  -[JFXOverlayEffectDebugView additionalRectsLayer](self, "additionalRectsLayer");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "setHidden:", v229);

  if ((v229 & 1) == 0)
  {
    -[JFXOverlayEffectDebugView additionalRectsLayer](self, "additionalRectsLayer");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView additionalRectsTransformedLayer](self, "additionalRectsTransformedLayer");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView additionalRectsToDraw](self, "additionalRectsToDraw");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugView updateAdditionalRects:transformedLayer:effectScale:rects:](self, "updateAdditionalRects:transformedLayer:effectScale:rects:", v231, v232, v233, v51);

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
LABEL_65:

}

void __51__JFXOverlayEffectDebugView_updateWithEffectFrame___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _OWORD v43[8];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _OWORD v52[8];
  _QWORD v53[4];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "textBoundingBoxesContainerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sublayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ensureNSublayers(v8, 1uLL);
  v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v52[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v52[5] = v9;
  v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v52[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v52[7] = v10;
  v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v52[0] = *MEMORY[0x24BDE5598];
  v52[1] = v11;
  v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v52[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v52[3] = v12;
  objc_msgSend(v8, "setTransform:", v52);
  objc_msgSend(v8, "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v13 = *MEMORY[0x24BDBEFB0];
  v14 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v8, "setPosition:", *MEMORY[0x24BDBEFB0], v14);
  objc_msgSend(v8, "setAnchorPoint:", v13, v14);
  if (v5)
  {
    objc_msgSend(v5, "transform");
    v16 = v44;
    v15 = v45;
    v18 = v46;
    v17 = v47;
    v20 = v48;
    v19 = v49;
    v21 = v50;
    v22 = v51;
  }
  else
  {
    v21 = 0uLL;
    v50 = 0u;
    v51 = 0u;
    v22 = 0uLL;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v20 = 0uLL;
    v19 = 0uLL;
    v18 = 0uLL;
    v17 = 0uLL;
    v16 = 0uLL;
    v15 = 0uLL;
    v44 = 0u;
    v45 = 0u;
  }
  v43[0] = v16;
  v43[1] = v15;
  v43[2] = v18;
  v43[3] = v17;
  v43[4] = v20;
  v43[5] = v19;
  v43[6] = v21;
  v43[7] = v22;
  objc_msgSend(v8, "setTransform:", v43);
  if (v5)
    objc_msgSend(v5, "transformInfo");
  v23 = fmax(fabs(0.0), 0.001);
  objc_msgSend(v8, "sublayers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = *(void **)(a1 + 32);
  objc_msgSend(v5, "objectBounds");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  objc_msgSend(*(id *)(a1 + 32), "options");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "textBoundingBoxColors");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "textFrames");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectAtIndexedSubscript:", a3 % objc_msgSend(v37, "count"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 6.0 / v23);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v39;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 3.0 / v23);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v25, v38, v41, v28, v30, v32, v34, 1.0 / v23, 0.0);

}

void __51__JFXOverlayEffectDebugView_updateWithEffectFrame___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  PVCGPointQuad v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
    objc_msgSend(a2, "cornerPoints");
  else
    memset(&v4, 0, sizeof(v4));
  PVCGPointQuad_to_NSArray(&v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (id)additionalRectsToDraw
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[JFXOverlayEffectDebugView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[JFXOverlayEffectDebugView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "overlayEffectDebugViewAdditionalRectsToDraw");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (UIView)rootContainerView
{
  return self->_rootContainerView;
}

- (void)setRootContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_rootContainerView, a3);
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootLayer, a3);
}

- (CATransformLayer)rootTransformLayer
{
  return self->_rootTransformLayer;
}

- (void)setRootTransformLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootTransformLayer, a3);
}

- (CAShapeLayer)documentBoundingBoxLayer
{
  return self->_documentBoundingBoxLayer;
}

- (void)setDocumentBoundingBoxLayer:(id)a3
{
  objc_storeStrong((id *)&self->_documentBoundingBoxLayer, a3);
}

- (CAShapeLayer)outputROILayer
{
  return self->_outputROILayer;
}

- (void)setOutputROILayer:(id)a3
{
  objc_storeStrong((id *)&self->_outputROILayer, a3);
}

- (CAShapeLayer)objectAlignedBoundingBoxLayer
{
  return self->_objectAlignedBoundingBoxLayer;
}

- (void)setObjectAlignedBoundingBoxLayer:(id)a3
{
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxLayer, a3);
}

- (CALayer)textBoundingBoxesContainerLayer
{
  return self->_textBoundingBoxesContainerLayer;
}

- (void)setTextBoundingBoxesContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_textBoundingBoxesContainerLayer, a3);
}

- (CAShapeLayer)hitAreaBoundingBoxLayer
{
  return self->_hitAreaBoundingBoxLayer;
}

- (void)setHitAreaBoundingBoxLayer:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaBoundingBoxLayer, a3);
}

- (CAShapeLayer)hitAreaMinimumSizeBoundingBoxLayer
{
  return self->_hitAreaMinimumSizeBoundingBoxLayer;
}

- (void)setHitAreaMinimumSizeBoundingBoxLayer:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaMinimumSizeBoundingBoxLayer, a3);
}

- (CAShapeLayer)midpointLayer
{
  return self->_midpointLayer;
}

- (void)setMidpointLayer:(id)a3
{
  objc_storeStrong((id *)&self->_midpointLayer, a3);
}

- (CAShapeLayer)overlayCenterLayer
{
  return self->_overlayCenterLayer;
}

- (void)setOverlayCenterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_overlayCenterLayer, a3);
}

- (CAShapeLayer)originCrosshairLayer
{
  return self->_originCrosshairLayer;
}

- (void)setOriginCrosshairLayer:(id)a3
{
  objc_storeStrong((id *)&self->_originCrosshairLayer, a3);
}

- (CAShapeLayer)cornerPointsLayer
{
  return self->_cornerPointsLayer;
}

- (void)setCornerPointsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_cornerPointsLayer, a3);
}

- (CALayer)textCornerPointsContainerLayer
{
  return self->_textCornerPointsContainerLayer;
}

- (void)setTextCornerPointsContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_textCornerPointsContainerLayer, a3);
}

- (CAShapeLayer)hitAreaPointsLayer
{
  return self->_hitAreaPointsLayer;
}

- (void)setHitAreaPointsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaPointsLayer, a3);
}

- (CAShapeLayer)additionalRectsLayer
{
  return self->_additionalRectsLayer;
}

- (void)setAdditionalRectsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_additionalRectsLayer, a3);
}

- (CAShapeLayer)additionalRectsTransformedLayer
{
  return self->_additionalRectsTransformedLayer;
}

- (void)setAdditionalRectsTransformedLayer:(id)a3
{
  objc_storeStrong((id *)&self->_additionalRectsTransformedLayer, a3);
}

- (JFXOverlayEffectDebugViewOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (JFXOverlayEffectDebugViewDelegate)delegate
{
  return (JFXOverlayEffectDebugViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_additionalRectsTransformedLayer, 0);
  objc_storeStrong((id *)&self->_additionalRectsLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaPointsLayer, 0);
  objc_storeStrong((id *)&self->_textCornerPointsContainerLayer, 0);
  objc_storeStrong((id *)&self->_cornerPointsLayer, 0);
  objc_storeStrong((id *)&self->_originCrosshairLayer, 0);
  objc_storeStrong((id *)&self->_overlayCenterLayer, 0);
  objc_storeStrong((id *)&self->_midpointLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaMinimumSizeBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_textBoundingBoxesContainerLayer, 0);
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_outputROILayer, 0);
  objc_storeStrong((id *)&self->_documentBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_rootTransformLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_rootContainerView, 0);
}

@end
