@implementation ICDocCamOverlayView

- (ICDocCamOverlayView)initWithFrame:(CGRect)a3
{
  ICDocCamOverlayView *v3;
  dispatch_semaphore_t v4;
  OS_dispatch_semaphore *sem;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICDocCamOverlayView;
  v3 = -[ICDocCamOverlayView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = dispatch_semaphore_create(1);
    sem = v3->sem;
    v3->sem = (OS_dispatch_semaphore *)v4;

    v3->_showGridAnimation = 1;
  }
  return v3;
}

- (ICDocCamOverlayView)initWithCoder:(id)a3
{
  ICDocCamOverlayView *v3;
  dispatch_semaphore_t v4;
  OS_dispatch_semaphore *sem;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICDocCamOverlayView;
  v3 = -[ICDocCamOverlayView initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v3)
  {
    v4 = dispatch_semaphore_create(1);
    sem = v3->sem;
    v3->sem = (OS_dispatch_semaphore *)v4;

    v3->_showGridAnimation = 1;
  }
  return v3;
}

- (double)crossProduct:(CGPoint)a3 v2:(CGPoint)a4
{
  return a3.x * a4.y - a3.y * a4.x;
}

- (NSString)displayString
{
  ICDocCamOverlayView *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_displayString;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDisplayString:(id)a3
{
  id v5;
  ICDocCamOverlayView *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  ICDocCamOverlayView *v10;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_displayString, a3);
  objc_sync_exit(v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__ICDocCamOverlayView_setDisplayString___block_invoke;
  v8[3] = &unk_24C5B7BF0;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __40__ICDocCamOverlayView_setDisplayString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
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
  uint64_t v19;
  id v20;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  objc_msgSend(*(id *)(a1 + 40), "displayStringLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {

    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDF6B68]);
      objc_msgSend(*(id *)(a1 + 40), "setDisplayStringLabel:", v5);

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 1.0, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "displayStringLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTextColor:", v6);

      objc_msgSend(*(id *)(a1 + 40), "displayStringLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v9 = *(void **)(a1 + 40);
      objc_msgSend(v9, "displayStringLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);

      objc_msgSend(*(id *)(a1 + 40), "displayStringLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 40.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setActive:", 1);

      objc_msgSend(*(id *)(a1 + 40), "displayStringLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "leadingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "leadingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 30.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActive:", 1);

    }
    v19 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "displayStringLabel");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

  }
  else
  {
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 40), "setDisplayStringLabel:", 0);
  }
}

- (void)setDebugRects:(id)a3
{
  id v5;
  ICDocCamOverlayView *v6;
  _QWORD block[5];

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_debugRects, a3);
  objc_sync_exit(v6);

  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__ICDocCamOverlayView_setDebugRects___block_invoke;
    block[3] = &unk_24C5B7AE0;
    block[4] = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __37__ICDocCamOverlayView_setDebugRects___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

- (NSArray)debugRects
{
  ICDocCamOverlayView *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_debugRects;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDocumentQuad:(id)a3
{
  id v5;
  ICDocCamOverlayView *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t *p_block;
  uint64_t v9;
  uint64_t block;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_documentQuad, a3);
  objc_sync_exit(v6);

  if (v5)
  {
    -[ICDocCamOverlayView setNumberOfMissedFrames:](v6, "setNumberOfMissedFrames:", 0);
    v9 = MEMORY[0x24BDAC760];
    v7 = __39__ICDocCamOverlayView_setDocumentQuad___block_invoke_2;
    p_block = &v9;
LABEL_5:
    p_block[1] = 3221225472;
    p_block[2] = (uint64_t)v7;
    p_block[3] = (uint64_t)&unk_24C5B7AE0;
    p_block[4] = (uint64_t)v6;
    dispatch_async(MEMORY[0x24BDAC9B8], p_block);
    goto LABEL_6;
  }
  -[ICDocCamOverlayView setNumberOfMissedFrames:](v6, "setNumberOfMissedFrames:", -[ICDocCamOverlayView numberOfMissedFrames](v6, "numberOfMissedFrames") + 1);
  if (-[ICDocCamOverlayView numberOfMissedFrames](v6, "numberOfMissedFrames") >= 3)
  {
    block = MEMORY[0x24BDAC760];
    v7 = __39__ICDocCamOverlayView_setDocumentQuad___block_invoke;
    p_block = &block;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __39__ICDocCamOverlayView_setDocumentQuad___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateShapeLayers");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

uint64_t __39__ICDocCamOverlayView_setDocumentQuad___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateShapeLayers");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

- (ICDocCamImageQuad)documentQuad
{
  ICDocCamOverlayView *v2;
  ICDocCamImageQuad *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_documentQuad;
  objc_sync_exit(v2);

  return v3;
}

- (void)clearRectangles
{
  ICDocCamOverlayView *v3;
  ICDocCamImageQuad *documentQuad;
  NSArray *debugRects;
  void *v6;
  void *v7;
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    v3 = self;
    objc_sync_enter(v3);
    documentQuad = v3->_documentQuad;
    v3->_documentQuad = 0;

    v3->_numberOfMissedFrames = 0;
    debugRects = v3->_debugRects;
    v3->_debugRects = 0;

    objc_sync_exit(v3);
    -[ICDocCamOverlayView setRectangleIsActive:](v3, "setRectangleIsActive:", 0);
    -[ICDocCamOverlayView stopGridAnimation](v3, "stopGridAnimation");
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[ICDocCamOverlayView rectangleShapeLayer](v3, "rectangleShapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPath:", 0);

    -[ICDocCamOverlayView rectangleShapeLayer](v3, "rectangleShapeLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStrokeColor:", 0);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[ICDocCamOverlayView updateShapeLayers](v3, "updateShapeLayers");
    -[ICDocCamOverlayView setNeedsDisplay](v3, "setNeedsDisplay");
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__ICDocCamOverlayView_clearRectangles__block_invoke;
    block[3] = &unk_24C5B7AE0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __38__ICDocCamOverlayView_clearRectangles__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearRectangles");
}

- (void)updateShapeLayers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[ICDocCamOverlayView setupShapeLayersIfNeeded](self, "setupShapeLayersIfNeeded");
  -[ICDocCamOverlayView documentQuad](self, "documentQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICDocCamOverlayView documentQuad](self, "documentQuad");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamOverlayView calculateCurrentRectangleFromDocumentQuad:](self, "calculateCurrentRectangleFromDocumentQuad:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[ICDocCamOverlayView updateRectangleLayerFromRect:](self, "updateRectangleLayerFromRect:", v9);
  if (-[ICDocCamOverlayView showGridAnimation](self, "showGridAnimation"))
  {
    -[ICDocCamOverlayView gridAnimation](self, "gridAnimation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICDocCamOverlayView updateGridLayerFromRect:](self, "updateGridLayerFromRect:", v9);
    }
    else if (-[ICDocCamOverlayView rectangleIsActive](self, "rectangleIsActive"))
    {
      -[ICDocCamOverlayView dateToStartGridAnimation](self, "dateToStartGridAnimation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "compare:", v7);

      if (v8 == -1)
        -[ICDocCamOverlayView startGridAnimationFromRect:](self, "startGridAnimationFromRect:", v9);
    }
  }

}

- (CGRect)frameForContentInView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  float v24;
  double v25;
  float v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  -[ICDocCamOverlayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ICDocCamOverlayView previewBounds](self, "previewBounds");
  v12 = v11;
  v14 = v13;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  v15 = CGRectGetWidth(v29) / v12;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  v16 = CGRectGetHeight(v30) / v14;
  v17 = fminf(v15, v16);
  v18 = v12 * v17;
  v19 = v14 * v17;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  v20 = (CGRectGetWidth(v31) - v18) * 0.5;
  v21 = roundf(v20);
  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  v22 = (CGRectGetHeight(v32) - v19) * 0.5;
  v23 = roundf(v22);
  v24 = v18;
  v25 = roundf(v24);
  v26 = v19;
  v27 = roundf(v26);
  v28 = v21;
  result.size.height = v27;
  result.size.width = v25;
  result.origin.y = v23;
  result.origin.x = v28;
  return result;
}

- (id)calculateCurrentRectangleFromDocumentQuad:(id)a3
{
  id v4;
  ICDocCamImageQuad *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  float64x2_t v19;
  float64x2_t v20;
  double *v26;
  float64x2_t v27;
  float64x2_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  float64x2x2_t v49;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(ICDocCamImageQuad);
  -[ICDocCamOverlayView previewBounds](self, "previewBounds");
  v38 = v6;
  v39 = v7;
  v36 = v9;
  v37 = v8;
  objc_msgSend(v4, "bottomLeft");
  v40 = v10;
  v41 = v11;
  objc_msgSend(v4, "bottomRight");
  v42 = v12;
  v43 = v13;
  objc_msgSend(v4, "topRight");
  v44 = v14;
  v45 = v15;
  objc_msgSend(v4, "topLeft");
  v16 = 0;
  v46 = v17;
  v47 = v18;
  v19 = (float64x2_t)vdupq_lane_s64(v38, 0);
  v20 = (float64x2_t)vdupq_lane_s64(v39, 0);
  __asm { FMOV            V2.2D, #1.0 }
  do
  {
    v26 = (double *)((char *)&v40 + v16);
    v49 = vld2q_f64(v26);
    v27 = vmulq_n_f64(v49.val[0], v37);
    v49.val[0] = vmulq_n_f64(vsubq_f64(_Q2, v49.val[1]), v36);
    v49.val[1] = vaddq_f64(v19, v27);
    v28 = vaddq_f64(v20, v49.val[0]);
    vst2q_f64(v26, *(float64x2x2_t *)((char *)&v49 + 16));
    v16 += 32;
  }
  while (v16 != 64);
  v29 = v42;
  v30 = v43;
  v31 = v44;
  v32 = v45;
  v33 = v46;
  v34 = v47;
  -[ICDocCamImageQuad setBottomLeft:](v5, "setBottomLeft:", v40, v41);
  -[ICDocCamImageQuad setBottomRight:](v5, "setBottomRight:", v29, v30);
  -[ICDocCamImageQuad setTopRight:](v5, "setTopRight:", v31, v32);
  -[ICDocCamImageQuad setTopLeft:](v5, "setTopLeft:", v33, v34);

  return v5;
}

- (CGPath)newPathFromRect:(id)a3
{
  id v3;
  CGPath *Mutable;
  double v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;

  v3 = a3;
  Mutable = CGPathCreateMutable();
  objc_msgSend(v3, "bottomLeft");
  v6 = v5;
  objc_msgSend(v3, "bottomLeft");
  CGPathMoveToPoint(Mutable, 0, v6, v7);
  objc_msgSend(v3, "topLeft");
  v9 = v8;
  objc_msgSend(v3, "topLeft");
  CGPathAddLineToPoint(Mutable, 0, v9, v10);
  objc_msgSend(v3, "topRight");
  v12 = v11;
  objc_msgSend(v3, "topRight");
  CGPathAddLineToPoint(Mutable, 0, v12, v13);
  objc_msgSend(v3, "bottomRight");
  v15 = v14;
  objc_msgSend(v3, "bottomRight");
  CGPathAddLineToPoint(Mutable, 0, v15, v16);
  objc_msgSend(v3, "bottomLeft");
  v18 = v17;
  objc_msgSend(v3, "bottomLeft");
  v20 = v19;

  CGPathAddLineToPoint(Mutable, 0, v18, v20);
  return Mutable;
}

- (CGPath)newGridPathFromRect:(id)a3
{
  id v3;
  CGPath *Mutable;
  double v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
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
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
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
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CGFloat v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
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
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  CGFloat v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  CGFloat v136;
  CGFloat v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  CGFloat v144;
  CGFloat v145;

  v3 = a3;
  Mutable = CGPathCreateMutable();
  objc_msgSend(v3, "bottomLeft");
  v6 = v5;
  objc_msgSend(v3, "bottomLeft");
  CGPathMoveToPoint(Mutable, 0, v6, v7);
  objc_msgSend(v3, "topLeft");
  v9 = v8;
  objc_msgSend(v3, "topLeft");
  CGPathAddLineToPoint(Mutable, 0, v9, v10);
  objc_msgSend(v3, "topRight");
  v12 = v11;
  objc_msgSend(v3, "topRight");
  CGPathAddLineToPoint(Mutable, 0, v12, v13);
  objc_msgSend(v3, "bottomRight");
  v15 = v14;
  objc_msgSend(v3, "bottomRight");
  CGPathAddLineToPoint(Mutable, 0, v15, v16);
  objc_msgSend(v3, "bottomLeft");
  v18 = v17;
  objc_msgSend(v3, "bottomLeft");
  CGPathAddLineToPoint(Mutable, 0, v18, v19);
  objc_msgSend(v3, "bottomLeft");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v3, "topLeft");
  v25 = v24;
  v27 = v26;
  objc_msgSend(v3, "bottomLeft");
  v29 = DCTSDSubtractPoints(v25, v27, v28);
  v31 = DCTSDMultiplyPointScalar(v29, v30, 0.33);
  v32 = DCTSDAddPoints(v21, v23, v31);
  v142 = v33;
  v144 = v32;
  objc_msgSend(v3, "bottomLeft");
  v35 = v34;
  v37 = v36;
  objc_msgSend(v3, "topLeft");
  v39 = v38;
  v41 = v40;
  objc_msgSend(v3, "bottomLeft");
  v43 = DCTSDSubtractPoints(v39, v41, v42);
  v45 = DCTSDMultiplyPointScalar(v43, v44, 0.66);
  v46 = DCTSDAddPoints(v35, v37, v45);
  v138 = v47;
  v140 = v46;
  objc_msgSend(v3, "bottomRight");
  v49 = v48;
  v51 = v50;
  objc_msgSend(v3, "topRight");
  v53 = v52;
  v55 = v54;
  objc_msgSend(v3, "bottomRight");
  v57 = DCTSDSubtractPoints(v53, v55, v56);
  v59 = DCTSDMultiplyPointScalar(v57, v58, 0.33);
  v60 = DCTSDAddPoints(v49, v51, v59);
  v62 = v61;
  objc_msgSend(v3, "bottomRight");
  v64 = v63;
  v66 = v65;
  objc_msgSend(v3, "topRight");
  v68 = v67;
  v70 = v69;
  objc_msgSend(v3, "bottomRight");
  v72 = DCTSDSubtractPoints(v68, v70, v71);
  v74 = DCTSDMultiplyPointScalar(v72, v73, 0.66);
  v75 = DCTSDAddPoints(v64, v66, v74);
  v77 = v76;
  CGPathMoveToPoint(Mutable, 0, v144, v142);
  CGPathAddLineToPoint(Mutable, 0, v60, v62);
  CGPathMoveToPoint(Mutable, 0, v140, v138);
  CGPathAddLineToPoint(Mutable, 0, v75, v77);
  objc_msgSend(v3, "topLeft");
  v79 = v78;
  v81 = v80;
  objc_msgSend(v3, "topRight");
  v83 = v82;
  v85 = v84;
  objc_msgSend(v3, "topLeft");
  v87 = DCTSDSubtractPoints(v83, v85, v86);
  v89 = DCTSDMultiplyPointScalar(v87, v88, 0.33);
  v90 = DCTSDAddPoints(v79, v81, v89);
  v143 = v91;
  v145 = v90;
  objc_msgSend(v3, "topLeft");
  v93 = v92;
  v95 = v94;
  objc_msgSend(v3, "topRight");
  v97 = v96;
  v99 = v98;
  objc_msgSend(v3, "topLeft");
  v101 = DCTSDSubtractPoints(v97, v99, v100);
  v103 = DCTSDMultiplyPointScalar(v101, v102, 0.66);
  v104 = DCTSDAddPoints(v93, v95, v103);
  v139 = v105;
  v141 = v104;
  objc_msgSend(v3, "bottomLeft");
  v107 = v106;
  v109 = v108;
  objc_msgSend(v3, "bottomRight");
  v111 = v110;
  v113 = v112;
  objc_msgSend(v3, "bottomLeft");
  v115 = DCTSDSubtractPoints(v111, v113, v114);
  v117 = DCTSDMultiplyPointScalar(v115, v116, 0.33);
  v118 = DCTSDAddPoints(v107, v109, v117);
  v120 = v119;
  objc_msgSend(v3, "bottomLeft");
  v122 = v121;
  v124 = v123;
  objc_msgSend(v3, "bottomRight");
  v126 = v125;
  v128 = v127;
  objc_msgSend(v3, "bottomLeft");
  v130 = v129;

  v131 = DCTSDSubtractPoints(v126, v128, v130);
  v133 = DCTSDMultiplyPointScalar(v131, v132, 0.66);
  v134 = DCTSDAddPoints(v122, v124, v133);
  v136 = v135;
  CGPathMoveToPoint(Mutable, 0, v145, v143);
  CGPathAddLineToPoint(Mutable, 0, v118, v120);
  CGPathMoveToPoint(Mutable, 0, v141, v139);
  CGPathAddLineToPoint(Mutable, 0, v134, v136);
  return Mutable;
}

- (id)extrudedRectFromRect:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
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
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  ICDocCamImageQuad *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v100;
  double v101;
  double v102;

  v3 = a3;
  objc_msgSend(v3, "topLeft");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "bottomLeft");
  v9 = DCTSDSubtractPoints(v5, v7, v8);
  v11 = v10;
  objc_msgSend(v3, "bottomRight");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v3, "bottomLeft");
  v17 = DCTSDSubtractPoints(v13, v15, v16);
  v18 = DCTSDAddPoints(v9, v11, v17);
  v20 = DCTSDNormalizePoint(v18, v19);
  v101 = v21;
  v102 = v20;
  objc_msgSend(v3, "bottomLeft");
  v23 = v22;
  v25 = v24;
  objc_msgSend(v3, "bottomRight");
  v27 = DCTSDSubtractPoints(v23, v25, v26);
  v29 = v28;
  objc_msgSend(v3, "topRight");
  v31 = v30;
  v33 = v32;
  objc_msgSend(v3, "bottomRight");
  v35 = DCTSDSubtractPoints(v31, v33, v34);
  v36 = DCTSDAddPoints(v27, v29, v35);
  v100 = DCTSDNormalizePoint(v36, v37);
  v39 = v38;
  objc_msgSend(v3, "topLeft");
  v41 = v40;
  v43 = v42;
  objc_msgSend(v3, "topRight");
  v45 = DCTSDSubtractPoints(v41, v43, v44);
  v47 = v46;
  objc_msgSend(v3, "bottomRight");
  v49 = v48;
  v51 = v50;
  objc_msgSend(v3, "topRight");
  v53 = DCTSDSubtractPoints(v49, v51, v52);
  v54 = DCTSDAddPoints(v45, v47, v53);
  v56 = DCTSDNormalizePoint(v54, v55);
  v58 = v57;
  objc_msgSend(v3, "topRight");
  v60 = v59;
  v62 = v61;
  objc_msgSend(v3, "topLeft");
  v64 = DCTSDSubtractPoints(v60, v62, v63);
  v66 = v65;
  objc_msgSend(v3, "bottomLeft");
  v68 = v67;
  v70 = v69;
  objc_msgSend(v3, "topLeft");
  v72 = DCTSDSubtractPoints(v68, v70, v71);
  v73 = DCTSDAddPoints(v64, v66, v72);
  v75 = DCTSDNormalizePoint(v73, v74);
  v77 = v76;
  v78 = objc_alloc_init(ICDocCamImageQuad);
  objc_msgSend(v3, "bottomLeft");
  v80 = v79;
  v82 = v81;
  v83 = DCTSDMultiplyPointScalar(v102, v101, 50.0);
  -[ICDocCamImageQuad setBottomLeft:](v78, "setBottomLeft:", DCTSDSubtractPoints(v80, v82, v83));
  objc_msgSend(v3, "bottomRight");
  v85 = v84;
  v87 = v86;
  v88 = DCTSDMultiplyPointScalar(v100, v39, 50.0);
  -[ICDocCamImageQuad setBottomRight:](v78, "setBottomRight:", DCTSDSubtractPoints(v85, v87, v88));
  objc_msgSend(v3, "topRight");
  v90 = v89;
  v92 = v91;
  v93 = DCTSDMultiplyPointScalar(v56, v58, 50.0);
  -[ICDocCamImageQuad setTopRight:](v78, "setTopRight:", DCTSDSubtractPoints(v90, v92, v93));
  objc_msgSend(v3, "topLeft");
  v95 = v94;
  v97 = v96;

  v98 = DCTSDMultiplyPointScalar(v75, v77, 50.0);
  -[ICDocCamImageQuad setTopLeft:](v78, "setTopLeft:", DCTSDSubtractPoints(v95, v97, v98));
  return v78;
}

- (id)tintColorWithAlpha:(double)a3
{
  void *v4;
  void *v5;

  -[ICDocCamOverlayView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateRectangleLayerFromRect:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  CGPath *v11;
  const CGPath *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CGPath *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[ICDocCamOverlayView rectangleIsActive](self, "rectangleIsActive"))
    v5 = 0.1;
  else
    v5 = 0.2;
  -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  if (v4)
  {
    v11 = -[ICDocCamOverlayView newPathFromRect:](self, "newPathFromRect:", v4);
    if (-[ICDocCamOverlayView rectangleIsActive](self, "rectangleIsActive"))
    {
      if (v10)
      {
        v12 = CGPathRetain((CGPathRef)objc_msgSend(v10, "path"));
LABEL_16:
        v23 = (_QWORD *)MEMORY[0x24BDE5970];
        if (v12)
        {
          objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("path"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setDuration:", v5);
          objc_msgSend(v24, "setFromValue:", v12);
          objc_msgSend(v24, "setToValue:", v11);
          objc_msgSend(v24, "setFillMode:", *v23);
          -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setPath:", v11);

          -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addAnimation:forKey:", v24, CFSTR("path"));

          CGPathRelease(v12);
        }
        CGPathRelease(v11);
        if (!-[ICDocCamOverlayView rectangleIsActive](self, "rectangleIsActive"))
        {
          -[ICDocCamOverlayView setRectangleIsActive:](self, "setRectangleIsActive:", 1);
          -[ICDocCamOverlayView tintColorWithAlpha:](self, "tintColorWithAlpha:", 0.3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamOverlayView tintColorWithAlpha:](self, "tintColorWithAlpha:", 1.0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_retainAutorelease(v27);
          v29 = objc_msgSend(v47, "CGColor");
          -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setFillColor:", v29);

          objc_msgSend(MEMORY[0x24BDE57D8], "begin");
          objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
          objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeColor"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeColor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setDuration:", 0.2);
          v33 = *MEMORY[0x24BDE5D20];
          objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
          v34 = v23;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setTimingFunction:", v35);

          objc_msgSend(v31, "setFillMode:", *v34);
          objc_msgSend(v31, "setFromValue:", objc_msgSend(v10, "strokeColor"));
          v36 = objc_retainAutorelease(v28);
          objc_msgSend(v31, "setToValue:", objc_msgSend(v36, "CGColor"));
          objc_msgSend(v32, "setBeginTime:", 0.4);
          objc_msgSend(v32, "setDuration:", 0.7);
          objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setTimingFunction:", v37);

          objc_msgSend(v32, "setFillMode:", *MEMORY[0x24BDE5978]);
          v38 = objc_retainAutorelease(v36);
          objc_msgSend(v32, "setFromValue:", objc_msgSend(v38, "CGColor"));
          v39 = objc_retainAutorelease(v47);
          objc_msgSend(v32, "setToValue:", objc_msgSend(v39, "CGColor"));
          objc_msgSend(MEMORY[0x24BDE5638], "animation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setDuration:", 1.1);
          v48[0] = v31;
          v48[1] = v32;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setAnimations:", v41);

          v42 = objc_retainAutorelease(v39);
          v43 = objc_msgSend(v42, "CGColor");
          -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setStrokeColor:", v43);

          -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addAnimation:forKey:", v40, CFSTR("strokeColor"));

          objc_msgSend(MEMORY[0x24BDE57D8], "commit");
          -[ICDocCamOverlayView stopGridAnimation](self, "stopGridAnimation");
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.4);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamOverlayView setDateToStartGridAnimation:](self, "setDateToStartGridAnimation:", v46);

        }
        goto LABEL_20;
      }
      -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CGPathRetain((CGPathRef)objc_msgSend(v21, "path"));
    }
    else
    {
      -[ICDocCamOverlayView extrudedRectFromRect:](self, "extrudedRectFromRect:", v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[ICDocCamOverlayView newPathFromRect:](self, "newPathFromRect:", v21);
    }
    v12 = v22;

    goto LABEL_16;
  }
  if (-[ICDocCamOverlayView rectangleIsActive](self, "rectangleIsActive"))
  {
    -[ICDocCamOverlayView stopGridAnimation](self, "stopGridAnimation");
    -[ICDocCamOverlayView setRectangleIsActive:](self, "setRectangleIsActive:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "CGColor");
    -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFillColor:", v14);

    -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAnimationForKey:", CFSTR("strokeColor"));

    -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAnimationForKey:", CFSTR("path"));

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "CGColor");
    -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setStrokeColor:", v19);

  }
LABEL_20:

}

- (void)updateGridLayerFromRect:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const CGPath *v9;
  const CGPath *v10;
  CGPath *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (-[ICDocCamOverlayView rectangleIsActive](self, "rectangleIsActive"))
  {
    -[ICDocCamOverlayView rectangleGridLayer](self, "rectangleGridLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[ICDocCamOverlayView rectangleGridLayer](self, "rectangleGridLayer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    v9 = (const CGPath *)objc_msgSend(v8, "path");
    if (v9)
    {
      v10 = CGPathRetain(v9);
      if (!v10)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      -[ICDocCamOverlayView rectangleGridLayer](self, "rectangleGridLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CGPathRetain((CGPathRef)objc_msgSend(v15, "path"));

      if (!v10)
        goto LABEL_9;
    }
    v11 = -[ICDocCamOverlayView newGridPathFromRect:](self, "newGridPathFromRect:", v16);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDuration:", 0.1);
    objc_msgSend(v12, "setFromValue:", v10);
    objc_msgSend(v12, "setToValue:", v11);
    objc_msgSend(v12, "setFillMode:", *MEMORY[0x24BDE5970]);
    -[ICDocCamOverlayView rectangleGridLayer](self, "rectangleGridLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPath:", v11);

    -[ICDocCamOverlayView rectangleGridLayer](self, "rectangleGridLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAnimation:forKey:", v12, CFSTR("path"));

    CGPathRelease(v11);
    CGPathRelease(v10);

    goto LABEL_9;
  }
  -[ICDocCamOverlayView stopGridAnimation](self, "stopGridAnimation");
LABEL_10:

}

- (void)startGridAnimationFromRect:(id)a3
{
  CGPath *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  unint64_t i;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CGAffineTransform v30;
  CGAffineTransform v31;

  v4 = -[ICDocCamOverlayView newGridPathFromRect:](self, "newGridPathFromRect:", a3);
  -[ICDocCamOverlayView rectangleGridLayer](self, "rectangleGridLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPath:", v4);

  CGPathRelease(v4);
  -[ICDocCamOverlayView tintColorWithAlpha:](self, "tintColorWithAlpha:", 1.0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGColor");
  -[ICDocCamOverlayView rectangleGridLayer](self, "rectangleGridLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStrokeColor:", v7);

  objc_msgSend(MEMORY[0x24BDE56B8], "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamOverlayView bounds](self, "bounds");
  v12 = v10;
  v13 = v11;
  v14 = sqrt(v11 * v11 + v10 * v10);
  if (v10 >= v11)
    v15 = v10;
  else
    v15 = v11;
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v15 * v14, v15 * 0.25);
  CGAffineTransformMakeRotation(&v31, -0.785398163);
  v30 = v31;
  objc_msgSend(v9, "setAffineTransform:", &v30);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 30; ++i)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, (double)sin((double)i * 3.14159265 / 29.0));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v16, "addObject:", objc_msgSend(v18, "CGColor"));

  }
  objc_msgSend(v9, "setColors:", v16);
  -[ICDocCamOverlayView rectangleGridLayer](self, "rectangleGridLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMask:", v9);

  -[ICDocCamOverlayView setGradientMaskLayer:](self, "setGradientMaskLayer:", v9);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);
  objc_msgSend(v20, "setDuration:", 2.7);
  LODWORD(v21) = 1051361018;
  LODWORD(v22) = 1045220557;
  LODWORD(v23) = 0;
  LODWORD(v24) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v21, v23, v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTimingFunction:", v25);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFromValue:", v26);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v12, v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setToValue:", v27);

  objc_msgSend(v20, "setFillMode:", *MEMORY[0x24BDE5970]);
  -[ICDocCamOverlayView gradientMaskLayer](self, "gradientMaskLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addAnimation:forKey:", v20, CFSTR("position"));

  -[ICDocCamOverlayView setGridAnimation:](self, "setGridAnimation:", v20);
  -[ICDocCamOverlayView gridAnimation](self, "gridAnimation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDelegate:", self);

}

- (void)stopGridAnimation
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[ICDocCamOverlayView setDateToStartGridAnimation:](self, "setDateToStartGridAnimation:", 0);
  -[ICDocCamOverlayView gridAnimation](self, "gridAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[ICDocCamOverlayView rectangleGridLayer](self, "rectangleGridLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeColor:", v5);

  -[ICDocCamOverlayView gradientMaskLayer](self, "gradientMaskLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAnimationForKey:", CFSTR("position"));

  -[ICDocCamOverlayView setGridAnimation:](self, "setGridAnimation:", 0);
  -[ICDocCamOverlayView setGradientMaskLayer:](self, "setGradientMaskLayer:", 0);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[ICDocCamOverlayView gridAnimation](self, "gridAnimation");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[ICDocCamOverlayView stopGridAnimation](self, "stopGridAnimation");
}

- (void)setupShapeLayersIfNeeded
{
  -[ICDocCamOverlayView setupRectangleLayer](self, "setupRectangleLayer");
  -[ICDocCamOverlayView setupGridLayers](self, "setupGridLayers");
}

- (void)setupRectangleLayer
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDE5758]);
    -[ICDocCamOverlayView setRectangleShapeLayer:](self, "setRectangleShapeLayer:", v4);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStrokeColor:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFillColor:", v9);

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12 * 0.5;
    -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLineWidth:", v13);

    -[ICDocCamOverlayView layer](self, "layer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamOverlayView rectangleShapeLayer](self, "rectangleShapeLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v15);

  }
}

- (void)setupGridLayers
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  -[ICDocCamOverlayView rectangleGridLayer](self, "rectangleGridLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDE5758]);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setFillColor:", objc_msgSend(v5, "CGColor"));

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    objc_msgSend(v9, "setLineWidth:", v7 * 0.5);

    -[ICDocCamOverlayView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", v9);

    -[ICDocCamOverlayView setRectangleGridLayer:](self, "setRectangleGridLayer:", v9);
  }
}

- (CATransform3D)calculateRotationTransformForPoint:(SEL)a3 toPoint:(CGPoint)a4
{
  double v6;

  v6 = DCTSDNiceAngleFromDelta(a5.x - a4.x, a5.y - a4.y);
  return CATransform3DMakeRotation(retstr, v6, 0.0, 0.0, 1.0);
}

- (CGRect)previewBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_previewBounds, 32, 1, 0);
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

- (void)setPreviewBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_previewBounds, &v3, 32, 1, 0);
}

- (BOOL)showGridAnimation
{
  return self->_showGridAnimation;
}

- (void)setShowGridAnimation:(BOOL)a3
{
  self->_showGridAnimation = a3;
}

- (UIColor)rectColor
{
  return (UIColor *)objc_getProperty(self, a2, 456, 1);
}

- (void)setRectColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (BOOL)rectangleIsActive
{
  return self->_rectangleIsActive;
}

- (void)setRectangleIsActive:(BOOL)a3
{
  self->_rectangleIsActive = a3;
}

- (CAShapeLayer)llShapeLayer
{
  return self->_llShapeLayer;
}

- (void)setLlShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_llShapeLayer, a3);
}

- (CAShapeLayer)lrShapeLayer
{
  return self->_lrShapeLayer;
}

- (void)setLrShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_lrShapeLayer, a3);
}

- (CAShapeLayer)ulShapeLayer
{
  return self->_ulShapeLayer;
}

- (void)setUlShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_ulShapeLayer, a3);
}

- (CAShapeLayer)urShapeLayer
{
  return self->_urShapeLayer;
}

- (void)setUrShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_urShapeLayer, a3);
}

- (CAShapeLayer)rectangleShapeLayer
{
  return self->_rectangleShapeLayer;
}

- (void)setRectangleShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rectangleShapeLayer, a3);
}

- (unint64_t)numberOfMissedFrames
{
  return self->_numberOfMissedFrames;
}

- (void)setNumberOfMissedFrames:(unint64_t)a3
{
  self->_numberOfMissedFrames = a3;
}

- (UILabel)displayStringLabel
{
  return self->_displayStringLabel;
}

- (void)setDisplayStringLabel:(id)a3
{
  objc_storeStrong((id *)&self->_displayStringLabel, a3);
}

- (CAShapeLayer)rectangleGridLayer
{
  return self->_rectangleGridLayer;
}

- (void)setRectangleGridLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rectangleGridLayer, a3);
}

- (NSDate)dateToStartGridAnimation
{
  return self->_dateToStartGridAnimation;
}

- (void)setDateToStartGridAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_dateToStartGridAnimation, a3);
}

- (CAAnimation)gridAnimation
{
  return self->_gridAnimation;
}

- (void)setGridAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_gridAnimation, a3);
}

- (CAGradientLayer)gradientMaskLayer
{
  return self->_gradientMaskLayer;
}

- (void)setGradientMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientMaskLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientMaskLayer, 0);
  objc_storeStrong((id *)&self->_gridAnimation, 0);
  objc_storeStrong((id *)&self->_dateToStartGridAnimation, 0);
  objc_storeStrong((id *)&self->_rectangleGridLayer, 0);
  objc_storeStrong((id *)&self->_displayStringLabel, 0);
  objc_storeStrong((id *)&self->_rectangleShapeLayer, 0);
  objc_storeStrong((id *)&self->_urShapeLayer, 0);
  objc_storeStrong((id *)&self->_ulShapeLayer, 0);
  objc_storeStrong((id *)&self->_lrShapeLayer, 0);
  objc_storeStrong((id *)&self->_llShapeLayer, 0);
  objc_storeStrong((id *)&self->_rectColor, 0);
  objc_storeStrong((id *)&self->_debugRects, 0);
  objc_storeStrong((id *)&self->_documentQuad, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->sem, 0);
}

@end
