@implementation PKLassoRenderer

- (id)initForLiveSelectionWithRenderingDelegate:(id)a3
{
  id v4;
  PKLassoRenderer *v5;
  PKLassoRenderer *v6;
  uint64_t v7;
  CAShapeLayer *lassoLayer;
  uint64_t v9;
  CAShapeLayer *whiteLassoLayer;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKLassoRenderer;
  v5 = -[PKLassoRenderer init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_renderingDelegate, v4);
    if (!v6->_lassoLayer)
    {
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v7 = objc_claimAutoreleasedReturnValue();
      lassoLayer = v6->_lassoLayer;
      v6->_lassoLayer = (CAShapeLayer *)v7;

      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v9 = objc_claimAutoreleasedReturnValue();
      whiteLassoLayer = v6->_whiteLassoLayer;
      v6->_whiteLassoLayer = (CAShapeLayer *)v9;

      -[PKLassoRenderer _setupLassoLayerAppearanceWithBezierPath:]((id *)&v6->super.isa, 0);
      -[CAShapeLayer addSublayer:](v6->_lassoLayer, "addSublayer:", v6->_whiteLassoLayer);
      -[PKLassoRenderer _setupAccessibilityObservers](v6);
    }
  }

  return v6;
}

- (id)adornmentLayer
{
  return self->_lassoLayer;
}

- (void)_updateLassoForAccessibility:(id)a3
{
  double v4;
  _BOOL4 v5;
  id *v6;
  id v7;

  if (UIAccessibilityDarkerSystemColorsEnabled())
    v4 = 4.0;
  else
    v4 = 2.0;
  -[CAShapeLayer setLineWidth:](self->_lassoLayer, "setLineWidth:", v4);
  -[CAShapeLayer setLineWidth:](self->_whiteLassoLayer, "setLineWidth:", v4);
  v5 = UIAccessibilityDarkerSystemColorsEnabled();
  v6 = (id *)MEMORY[0x1E0CD3018];
  if (!v5)
    v6 = (id *)MEMORY[0x1E0CD3010];
  v7 = *v6;
  -[CAShapeLayer setLineCap:](self->_lassoLayer, "setLineCap:");
  -[CAShapeLayer setLineCap:](self->_whiteLassoLayer, "setLineCap:", v7);

}

- (void)_setupLassoLayerAppearanceWithBezierPath:(id *)a1
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  v29 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(a1[6], "drawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "scaleForDrawing:", v4);
  v6 = v5;

  v7 = a1[1];
  v8 = a1[2];
  objc_msgSend(v7, "setContentsScale:", v6);
  v9 = objc_retainAutorelease(v29);
  objc_msgSend(v7, "setPath:", objc_msgSend(v9, "CGPath"));
  objc_msgSend(v7, "setLineWidth:", 2.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setFillColor:", objc_msgSend(v10, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "CGColor");

  objc_msgSend(v7, "setStrokeColor:", v12);
  v13 = *MEMORY[0x1E0CD3030];
  objc_msgSend(v7, "setLineJoin:", *MEMORY[0x1E0CD3030]);
  v14 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithObjects:", v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineDashPattern:", v17);

  v18 = *MEMORY[0x1E0CD3010];
  objc_msgSend(v7, "setLineCap:", *MEMORY[0x1E0CD3010]);
  LODWORD(v19) = 0.5;
  objc_msgSend(v7, "setOpacity:", v19);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  objc_msgSend(v8, "setContentsScale:");

  v28 = objc_retainAutorelease(v9);
  objc_msgSend(v8, "setPath:", objc_msgSend(v28, "CGPath"));
  objc_msgSend(v8, "setLineWidth:", 2.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setFillColor:", objc_msgSend(v21, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v22, "CGColor"));

  LODWORD(v23) = 1.0;
  objc_msgSend(v8, "setOpacity:", v23);
  objc_msgSend(v8, "setLineJoin:", v13);
  v24 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayWithObjects:", v25, v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineDashPattern:", v27);

  objc_msgSend(v8, "setLineCap:", v18);
}

- (uint64_t)_setupAccessibilityObservers
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__updateLassoForAccessibility_, *MEMORY[0x1E0DC4508], 0);

  return objc_msgSend(a1, "_updateLassoForAccessibility:", 0);
}

- (PKLassoRenderer)initWithStrokeSelection:(id)a3 renderingDelegate:(id)a4
{
  id v7;
  id v8;
  PKLassoRenderer *v9;
  PKLassoRenderer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKLassoRenderer;
  v9 = -[PKLassoRenderer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_strokeSelection, a3);
    objc_storeWeak((id *)&v10->_renderingDelegate, v8);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  id calculateSelectionHullBlock;
  SEL v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self)
  {
    calculateSelectionHullBlock = self->_calculateSelectionHullBlock;
    if (calculateSelectionHullBlock)
    {
      dispatch_block_cancel(calculateSelectionHullBlock);
      objc_setProperty_nonatomic_copy(self, v5, 0, 64);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)PKLassoRenderer;
  -[PKLassoRenderer dealloc](&v6, sel_dealloc);
}

- (id)lassoPath
{
  return self->_lassoPath;
}

- (void)_setupSelectionAdornment
{
  -[PKLassoRenderer _setupAnimatedLasso]((uint64_t)self);
  if (self->_strokeSelection)
    -[PKLassoRenderer addAnimationsToSelectionLayer:whiteLayer:]((uint64_t)self, self->_lassoLayer, self->_whiteLassoLayer);
}

- (uint64_t)_setupAnimatedLasso
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  dispatch_block_t v29;
  SEL v30;
  id v31;
  NSObject *v32;
  double v33;
  double v34;
  const CGPath *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v46;
  CGAffineTransform v47;
  id from;
  id v49;
  id location;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *__p[2];
  void *v55;
  void *v56;
  uint64_t v57;
  _QWORD block[5];
  id v59;
  id v60;
  id v61[6];
  char v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 8))
    {
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(void **)(v1 + 8);
      *(_QWORD *)(v1 + 8) = v2;

      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(v1 + 16);
      *(_QWORD *)(v1 + 16) = v4;

      objc_msgSend(*(id *)(v1 + 48), "strokes");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(v1 + 8);
      v7 = *(void **)(v1 + 16);
      objc_msgSend(*(id *)(v1 + 48), "lassoStroke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      v9 = v6;
      v10 = v7;
      v11 = v8;
      WeakRetained = objc_loadWeakRetained((id *)(v1 + 56));
      v13 = *(id *)(v1 + 48);
      objc_msgSend(v13, "drawing");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "scaleForDrawing:", v14);
      v16 = v15;

      v56 = 0;
      v57 = 0;
      v55 = 0;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      *(_OWORD *)__p = 0u;
      v17 = v40;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, block, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v52 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "_appendPointsOfInterestForSelection:step:", &v55, 1.0);
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, block, 16);
        }
        while (v18);
      }

      *(_QWORD *)&v51 = 0;
      *((_QWORD *)&v51 + 1) = &v51;
      *((_QWORD *)&v52 + 1) = __Block_byref_object_copy__31;
      *(_QWORD *)&v53 = __Block_byref_object_dispose__31;
      *(_QWORD *)&v52 = 0x4812000000;
      *((_QWORD *)&v53 + 1) = "";
      +[PKPathUtility unorderedSimplifiedPointsFromPoints:factor:](PKPathUtility, "unorderedSimplifiedPointsFromPoints:factor:", &v55, 4.0 / *(double *)&v16);
      objc_initWeak(&location, v9);
      objc_initWeak(&v49, v10);
      objc_initWeak(&from, (id)v1);
      objc_msgSend(*(id *)(v1 + 48), "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke;
      block[3] = &unk_1E777D1A0;
      block[4] = &v51;
      objc_copyWeak(&v59, &from);
      v61[1] = v22;
      v61[2] = v24;
      v61[3] = v26;
      v61[4] = v28;
      v61[5] = v16;
      v62 = 1;
      objc_copyWeak(&v60, &location);
      objc_copyWeak(v61, &v49);
      v29 = dispatch_block_create((dispatch_block_flags_t)0, block);
      objc_setProperty_nonatomic_copy((id)v1, v30, v29, 64);

      v31 = objc_loadWeakRetained((id *)(v1 + 56));
      objc_msgSend(v31, "selectionHullQueue");
      v32 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v32, *(dispatch_block_t *)(v1 + 64));

      objc_msgSend(*(id *)(v1 + 48), "bounds");
      memset(&v47, 0, sizeof(v47));
      CGAffineTransformMakeTranslation(&v47, -v33, -v34);
      t1 = v47;
      CGAffineTransformMakeScale(&t2, *(CGFloat *)&v16, *(CGFloat *)&v16);
      CGAffineTransformConcat(&v46, &t1, &t2);
      v47 = v46;
      if (v11)
      {
        v35 = (const CGPath *)objc_msgSend(v11, "_newPathRepresentation");
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithCGPath:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v46, 0, sizeof(v46));
        objc_msgSend(v11, "_transform");
        v42 = v47;
        CGAffineTransformConcat(&v46, &v43, &v42);
        v41 = v46;
        objc_msgSend(v36, "applyTransform:", &v41);
        CGPathRelease(v35);
        -[PKLassoRenderer _expandBezierPathIfNecessary:](v36);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = *(void **)(v1 + 40);
        *(_QWORD *)(v1 + 40) = v37;

      }
      else
      {
        v36 = 0;
      }
      -[PKLassoRenderer _setupLassoLayerAppearanceWithBezierPath:]((id *)v1, v36);

      objc_destroyWeak(v61);
      objc_destroyWeak(&v60);
      objc_destroyWeak(&v59);
      objc_destroyWeak(&from);
      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v51, 8);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v55)
      {
        v56 = v55;
        operator delete(v55);
      }

      objc_msgSend(*(id *)(v1 + 8), "addSublayer:", *(_QWORD *)(v1 + 16));
      return -[PKLassoRenderer _setupAccessibilityObservers]((void *)v1);
    }
  }
  return result;
}

- (void)addAnimationsToSelectionLayer:(void *)a3 whiteLayer:
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  id v18;

  v18 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("lineDashPhase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 14.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFromValue:", v8);

    LODWORD(v9) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setToValue:", v10);

    objc_msgSend(v6, "setDuration:", 1.0);
    LODWORD(v11) = 2139095039;
    objc_msgSend(v6, "setRepeatCount:", v11);
    objc_msgSend(v18, "addAnimation:forKey:", v6, CFSTR("linePhase"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("lineDashPhase"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 21.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFromValue:", v14);

    LODWORD(v15) = 7.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setToValue:", v16);

    objc_msgSend(v12, "setDuration:", 1.0);
    LODWORD(v17) = 2139095039;
    objc_msgSend(v12, "setRepeatCount:", v17);
    objc_msgSend(v5, "addAnimation:forKey:", v12, CFSTR("linePhase"));

  }
}

- (void)_didBeginDraggingSelection
{
  double v2;

  LODWORD(v2) = 0;
  -[CAShapeLayer setOpacity:](self->_lassoLayer, "setOpacity:", v2);
}

- (void)_didEndDraggingSelection
{
  double v2;

  LODWORD(v2) = 0.5;
  -[CAShapeLayer setOpacity:](self->_lassoLayer, "setOpacity:", v2);
}

- (CGPoint)editMenuLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_editMenuLocation.x;
  y = self->_editMenuLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_renderLiveSelectionPath:(CGPath *)a3 forStrokes:(id)a4 inDrawing:(id)a5 liveScrollOffset:(CGPoint)a6
{
  -[PKLassoRenderer _setupAnimatedLasso]((uint64_t)self);
  if (self)
  {
    -[CAShapeLayer setPath:](self->_lassoLayer, "setPath:", a3);
    -[CAShapeLayer setPath:](self->_whiteLassoLayer, "setPath:", a3);
  }
  if (a3)
  {
    -[PKLassoRenderer addAnimationsToSelectionLayer:whiteLayer:]((uint64_t)self, self->_lassoLayer, self->_whiteLassoLayer);
  }
  else
  {
    -[CAShapeLayer removeAllAnimations](self->_lassoLayer, "removeAllAnimations");
    -[CAShapeLayer removeAllAnimations](self->_whiteLassoLayer, "removeAllAnimations");
  }
}

void __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  char v11;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_2;
  v4[3] = &unk_1E777D178;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v3 = *(_OWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 64);
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 96);
  v11 = *(_BYTE *)(a1 + 104);
  objc_copyWeak(&v6, (id *)(a1 + 48));
  objc_copyWeak(&v7, (id *)(a1 + 56));
  +[PKPathUtility smoothedHullForPoints:completion:](PKPathUtility, "smoothedHullForPoints:completion:", v2, v4);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_3;
  v6[3] = &unk_1E777D150;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v4 = *(_OWORD *)(a1 + 72);
  v11 = *(_OWORD *)(a1 + 56);
  v12 = v4;
  v13 = *(_QWORD *)(a1 + 88);
  v7 = v3;
  v14 = *(_BYTE *)(a1 + 96);
  v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  objc_copyWeak(&v10, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x1E0C80D38], v6);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v8);
}

void __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  double v3;
  double v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double MidX;
  _OWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  __int128 *v20;
  __int128 v21;
  unsigned __int8 v22;
  uint64_t v23;
  double v24;
  _OWORD *v25;
  _BYTE *v26;
  uint64_t v27;
  double v28;
  double v29;
  _QWORD v30[4];
  id v31;
  id v32[2];
  CGAffineTransform v33;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v36;
  _OWORD v37[2];
  CGAffineTransform v38;
  uint64_t v39;
  CGRect BoundingBox;

  v39 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(double *)(a1 + 64);
    v4 = *(double *)(a1 + 72);
    memset(&v36, 0, sizeof(v36));
    CGAffineTransformMakeTranslation(&v36, -v3, -v4);
    t1 = v36;
    CGAffineTransformMakeScale(&t2, *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 96));
    CGAffineTransformConcat(&v38, &t1, &t2);
    v36 = v38;
    v5 = *(void **)(a1 + 32);
    v33 = v38;
    objc_msgSend(v5, "applyTransform:", &v33);
    v6 = *(id *)(a1 + 32);
    v7 = v6;
    if (*(_BYTE *)(a1 + 104))
    {
      -[PKLassoRenderer _expandBezierPathIfNecessary:](v6);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)WeakRetained[5];
      WeakRetained[5] = v8;

    }
    objc_msgSend(WeakRetained, "lassoPath");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (void *)objc_msgSend(v10, "CGPath");

    v12 = (void *)MEMORY[0x1E0DC3F10];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_4;
    v30[3] = &unk_1E777D128;
    objc_copyWeak(&v31, (id *)(a1 + 48));
    v32[1] = v11;
    objc_copyWeak(v32, (id *)(a1 + 56));
    objc_msgSend(v12, "animateWithDuration:animations:completion:", v30, 0, 0.300000012);
    BoundingBox = CGPathGetBoundingBox((CGPathRef)v11);
    MidX = CGRectGetMidX(BoundingBox);
    v25 = 0;
    v26 = 0;
    v27 = 0;
    PKPointsFromPath((const CGPath *)v11, (const void **)&v25, 1.79769313e308, 0.0);
    v38.a = MidX;
    v38.b = 0.0;
    v38.c = MidX;
    v38.d = 10000.0;
    v14 = v25;
    v15 = v26 - (_BYTE *)v25;
    if (v26 == (_BYTE *)v25)
    {
      v14 = v26;
      if (!v26)
      {
LABEL_16:
        objc_destroyWeak(v32);
        objc_destroyWeak(&v31);

        goto LABEL_17;
      }
    }
    else
    {
      v16 = 0;
      v17 = v15 >> 4;
      if ((unint64_t)(v15 >> 4) <= 1)
        v18 = 1;
      else
        v18 = v15 >> 4;
      v19 = 1.79769313e308;
      v20 = v25;
      do
      {
        ++v16;
        v23 = 0;
        v21 = *v20++;
        v37[0] = v21;
        v37[1] = v14[v16 % v17];
        v22 = DKDIntersectionOfLines(&v38.a, (double *)v37, (double *)&v23, &v24, &v28, 0, 0);
        if ((v22 & (v29 < v19)) != 0)
        {
          MidX = v28;
          v19 = v29;
        }
      }
      while (v18 != v16);
      if (v19 < 1.79769313e308)
      {
        *((double *)WeakRetained + 3) = MidX;
        *((double *)WeakRetained + 4) = v19;
      }
    }
    v26 = v14;
    operator delete(v14);
    goto LABEL_16;
  }
LABEL_17:

}

- (id)_expandBezierPathIfNecessary:(void *)a1
{
  id v1;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  CGFloat y;
  double MidX;
  uint64_t v8;
  id v9;
  CGRect BoundingBox;
  CGRect v12;

  v1 = objc_retainAutorelease(a1);
  BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v1, "CGPath"));
  x = BoundingBox.origin.x;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  if (BoundingBox.size.width < 60.0 && BoundingBox.size.height < 60.0)
  {
    y = BoundingBox.origin.y;
    MidX = CGRectGetMidX(BoundingBox);
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", MidX + -30.0, CGRectGetMidY(v12) + -30.0, 60.0);
    v8 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v8;
  }
  v9 = v1;

  return v9;
}

void __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPath:", v2);

  v3 = *(_QWORD *)(a1 + 48);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "setPath:", v3);

}

- (id)_accessibilityUserTestingChildren
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_calculateSelectionHullBlock, 0);
  objc_destroyWeak((id *)&self->_renderingDelegate);
  objc_storeStrong((id *)&self->_strokeSelection, 0);
  objc_storeStrong((id *)&self->_lassoPath, 0);
  objc_storeStrong((id *)&self->_whiteLassoLayer, 0);
  objc_storeStrong((id *)&self->_lassoLayer, 0);
}

@end
