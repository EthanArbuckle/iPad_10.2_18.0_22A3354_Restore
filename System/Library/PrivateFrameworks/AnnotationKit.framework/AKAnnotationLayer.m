@implementation AKAnnotationLayer

+ (id)newAnnotationLayerForAnnotation:(id)a3 withPageController:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAnnotation:andPageController:", v7, v6);

  return v8;
}

- (id)_initWithAnnotation:(id)a3 andPageController:(id)a4
{
  id v6;
  id v7;
  AKAnnotationLayer *v8;
  AKAnnotationLayer *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  _QWORD block[4];
  id v25;
  id v26;
  id location;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AKAnnotationLayer;
  v8 = -[AKAnnotationLayer init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AKAnnotationLayer setAnnotation:](v8, "setAnnotation:", v6);
    -[AKAnnotationLayer setPageController:](v9, "setPageController:", v7);
    -[AKAnnotationLayer setShouldRecalculateLoupeImage:](v9, "setShouldRecalculateLoupeImage:", 1);
    -[AKAnnotationLayer setDrawsAsynchronously:](v9, "setDrawsAsynchronously:", 1);
    objc_msgSend(v7, "geometryHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAnnotationLayer annotation](v9, "annotation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "annotationLayerFrameForAnnotation:layerIsClipped:", v11, 0);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    -[AKAnnotationLayer setFrame:](v9, "setFrame:", v13, v15, v17, v19);
    -[AKAnnotationLayer _startObservingAnnotation](v9, "_startObservingAnnotation");
    -[AKAnnotationLayer _updateAnnotationLayerWithLoupeFastPath:](v9, "_updateAnnotationLayerWithLoupeFastPath:", 1);
    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BA0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAnnotationLayer setCompositingFilter:](v9, "setCompositingFilter:", v22);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_initWeak(&location, v9);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_229010460;
      block[3] = &unk_24F1A7770;
      objc_copyWeak(&v26, &location);
      v25 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    if (sub_22906F8F4())
      -[AKAnnotationLayer _addDebugVisuals](v9, "_addDebugVisuals");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[AKAnnotationLayer _stopObservingAnnotation](self, "_stopObservingAnnotation");
  v3.receiver = self;
  v3.super_class = (Class)AKAnnotationLayer;
  -[AKAnnotationLayer dealloc](&v3, sel_dealloc);
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  CGContextSaveGState(a3);
  v7.receiver = self;
  v7.super_class = (Class)AKAnnotationLayer;
  -[AKAnnotationLayer drawInContext:](&v7, sel_drawInContext_, a3);
  -[AKAnnotationLayer pageController](self, "pageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationLayer annotation](self, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAnnotationRenderer renderAnnotation:intoContext:forDisplay:pageControllerOrNil:](AKAnnotationRenderer, "renderAnnotation:intoContext:forDisplay:pageControllerOrNil:", v6, a3, 1, v5);

  CGContextRestoreGState(a3);
}

- (void)updateContents
{
  -[AKAnnotationLayer _updateAnnotationLayerWithLoupeFastPath:](self, "_updateAnnotationLayerWithLoupeFastPath:", 0);
  -[AKAnnotationLayer setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)updatePixelAlignment
{
  void *v3;
  void *v4;
  void *v5;
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
  id v16;

  -[AKAnnotationLayer pageController](self, "pageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = v3;
    objc_msgSend(v3, "geometryHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAnnotationLayer annotation](self, "annotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "annotationLayerFrameForAnnotation:layerIsClipped:", v5, 0);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[AKAnnotationLayer setFrame:](self, "setFrame:", v7, v9, v11, v13);
    -[AKAnnotationLayer borderWidth](self, "borderWidth");
    if ((((v14 != 1.0) ^ sub_22906F8F4()) & 1) == 0)
    {
      -[AKAnnotationLayer borderWidth](self, "borderWidth");
      if (v15 == 0.0)
        -[AKAnnotationLayer _addDebugVisuals](self, "_addDebugVisuals");
      else
        -[AKAnnotationLayer _removeDebugVisuals](self, "_removeDebugVisuals");
    }
    -[AKAnnotationLayer setNeedsDisplay](self, "setNeedsDisplay");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    v3 = v16;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  int v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  char v42;

  v10 = a3;
  if (a6 == CFSTR("AKAnnotationLayer.modelAnnotationObservationContext"))
  {
    -[AKAnnotationLayer pageController](self, "pageController");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_30;
    v12 = (void *)v11;
    v13 = -[AKAnnotationLayer lastRedrawWasForDrawingBounds](self, "lastRedrawWasForDrawingBounds");
    -[AKAnnotationLayer setLastRedrawWasForDrawingBounds:](self, "setLastRedrawWasForDrawingBounds:", 0);
    -[AKAnnotationLayer setShouldRecalculateLoupeImage:](self, "setShouldRecalculateLoupeImage:", objc_msgSend(v10, "isEqualToString:", CFSTR("strokeColor")) ^ 1);
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("drawingBounds")))
    {
      if (v13 && (objc_msgSend(v10, "isEqualToString:", CFSTR("rectangle")) & 1) != 0)
        goto LABEL_29;
      -[AKAnnotationLayer annotation](self, "annotation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "isTranslating") & 1) != 0)
      {
        -[AKAnnotationLayer annotation](self, "annotation");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_29;
      }
      else
      {

      }
      -[AKAnnotationLayer annotation](self, "annotation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAnnotationLayer _updateAnnotationLayerWithLoupeFastPath:](self, "_updateAnnotationLayerWithLoupeFastPath:", objc_msgSend(v38, "isDraggingHandle"));

LABEL_29:
      -[AKAnnotationLayer setShouldRecalculateLoupeImage:](self, "setShouldRecalculateLoupeImage:", 1);

      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v14 = 1;
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v42 = 0;
    objc_msgSend(v12, "geometryHelper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAnnotationLayer annotation](self, "annotation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "annotationLayerFrameForAnnotation:layerIsClipped:", v16, &v42);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    if (v42)
    {
      v25 = 0;
    }
    else
    {
      v25 = -[AKAnnotationLayer wasLastDrawingClipped](self, "wasLastDrawingClipped");
      v14 = v42 != 0;
    }
    -[AKAnnotationLayer setWasLastDrawingClipped:](self, "setWasLastDrawingClipped:", v14);
    -[AKAnnotationLayer annotation](self, "annotation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v30 = objc_opt_isKindOfClass();

    if (!v42 && !v25 && (v30 & 1) == 0)
    {
      -[AKAnnotationLayer annotation](self, "annotation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v31, "isTranslating") & 1) != 0)
      {
        -[AKAnnotationLayer annotation](self, "annotation");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEditingText");

        if ((v33 & 1) == 0)
        {
          -[AKAnnotationLayer annotation](self, "annotation");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "isTranslating");

          if (v35)
          {
            -[AKAnnotationLayer frame](self, "frame");
            v22 = v36;
            v24 = v37;
          }
          -[AKAnnotationLayer setFrame:](self, "setFrame:", v18, v20, v22, v24);
          goto LABEL_28;
        }
      }
      else
      {

      }
    }
    -[AKAnnotationLayer setFrame:](self, "setFrame:", v18, v20, v22, v24);
    -[AKAnnotationLayer setLastRedrawWasForDrawingBounds:](self, "setLastRedrawWasForDrawingBounds:", 1);
    -[AKAnnotationLayer annotation](self, "annotation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "isTranslating"))
    {
      -[AKAnnotationLayer _updateAnnotationLayerWithLoupeFastPath:](self, "_updateAnnotationLayerWithLoupeFastPath:", 1);
    }
    else
    {
      -[AKAnnotationLayer annotation](self, "annotation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAnnotationLayer _updateAnnotationLayerWithLoupeFastPath:](self, "_updateAnnotationLayerWithLoupeFastPath:", objc_msgSend(v40, "isDraggingHandle"));

    }
LABEL_28:
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    goto LABEL_29;
  }
  v41.receiver = self;
  v41.super_class = (Class)AKAnnotationLayer;
  -[AKAnnotationLayer observeValueForKeyPath:ofObject:change:context:](&v41, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
LABEL_30:

}

- (void)_updateAnnotationLayerWithLoupeFastPath:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  _OWORD v37[3];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v7 = MEMORY[0x24BDBD1C8];
  else
    v7 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("AKAnnotationRendererIsFastPathRenderingOnCurrentThread"));
  -[AKAnnotationLayer annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || !+[AKAnnotationRenderer annotationShouldAvoidRedrawDuringLiveResize:](AKAnnotationRenderer, "annotationShouldAvoidRedrawDuringLiveResize:", v8))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AKAnnotationLayer pageController](self, "pageController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v10;
      if (v3)
      {
        -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(MEMORY[0x24BDE5758], "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setFillRule:", *MEMORY[0x24BDE5988]);
          objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v13, "setFillColor:", objc_msgSend(v14, "CGColor"));

          objc_msgSend(MEMORY[0x24BDE56D0], "layer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKAnnotationLayer setFastPathLayer:](self, "setFastPathLayer:", v15);

          -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setMask:", v13);

          v17 = *MEMORY[0x24BDE5BB0];
          -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setMinificationFilter:", v17);

          -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setMagnificationFilter:", v17);

          -[AKAnnotationLayer superlayer](self, "superlayer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addSublayer:", v21);

          -[AKAnnotationLayer zPosition](self, "zPosition");
          v23 = v22 + -0.5;
          -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setZPosition:", v23);

          objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v26 = objc_msgSend(v25, "CGColor");
          -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setBackgroundColor:", v26);

          v42 = 0u;
          v43 = 0u;
          v41 = 0u;
          -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[AKLoupeAnnotationImageUpdaterHelper transformForFastPathLayer:ofLoupeAnnotation:onPageController:](AKLoupeAnnotationImageUpdaterHelper, "transformForFastPathLayer:ofLoupeAnnotation:onPageController:", v28, v11, v9);

          v38 = v41;
          v39 = v42;
          v40 = v43;
          -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = v38;
          v37[1] = v39;
          v37[2] = v40;
          objc_msgSend(v29, "setAffineTransform:", v37);

        }
        -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[AKLoupeAnnotationImageUpdaterHelper updateFastPathImageOnLoupeAnnotation:withFastPathLayer:onPageController:](AKLoupeAnnotationImageUpdaterHelper, "updateFastPathImageOnLoupeAnnotation:withFastPathLayer:onPageController:", v11, v30, v9);

      }
      else
      {
        objc_msgSend(v10, "imageData");
        v31 = objc_claimAutoreleasedReturnValue();
        if (!v31
          || (v32 = (void *)v31,
              v33 = -[AKAnnotationLayer shouldRecalculateLoupeImage](self, "shouldRecalculateLoupeImage"),
              v32,
              v33))
        {
          +[AKLoupeAnnotationImageUpdaterHelper updateModelImageOnLoupeAnnotation:onPageController:](AKLoupeAnnotationImageUpdaterHelper, "updateModelImageOnLoupeAnnotation:onPageController:", v11, v9);
        }
        -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "removeFromSuperlayer");

          -[AKAnnotationLayer fastPathLayer](self, "fastPathLayer");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setContents:", 0);

          -[AKAnnotationLayer setFastPathLayer:](self, "setFastPathLayer:", 0);
        }
      }

    }
    -[AKAnnotationLayer setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)_startObservingAnnotation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!-[AKAnnotationLayer isObservingAnnotation](self, "isObservingAnnotation"))
  {
    -[AKAnnotationLayer annotation](self, "annotation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keysForValuesToObserveForRedrawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0, CFSTR("AKAnnotationLayer.modelAnnotationObservationContext"));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    -[AKAnnotationLayer setIsObservingAnnotation:](self, "setIsObservingAnnotation:", 1);

  }
}

- (void)_stopObservingAnnotation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[AKAnnotationLayer isObservingAnnotation](self, "isObservingAnnotation"))
  {
    -[AKAnnotationLayer annotation](self, "annotation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keysForValuesToObserveForRedrawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), CFSTR("AKAnnotationLayer.modelAnnotationObservationContext"));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    -[AKAnnotationLayer setIsObservingAnnotation:](self, "setIsObservingAnnotation:", 0);

  }
}

- (void)_addDebugVisuals
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[AKAnnotationLayer setBorderColor:](self, "setBorderColor:", objc_msgSend(v3, "CGColor"));

  -[AKAnnotationLayer setBorderWidth:](self, "setBorderWidth:", 1.0);
  v8 = objc_alloc_init(MEMORY[0x24BDE5758]);
  objc_msgSend(v8, "setZPosition:", 100.0);
  objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  objc_msgSend(v8, "setBorderWidth:", 2.0);
  objc_msgSend(v8, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, 50.0, 50.0);
  objc_msgSend(v8, "setPosition:", 0.0, 0.0);
  v6 = objc_alloc_init(MEMORY[0x24BDE5758]);
  objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  objc_msgSend(v6, "setAnchorPoint:", 0.0, 0.0);
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, 12.5, 20.0);
  objc_msgSend(v6, "setPosition:", 37.5, 30.0);
  objc_msgSend(v8, "addSublayer:", v6);
  -[AKAnnotationLayer addSublayer:](self, "addSublayer:", v8);

}

- (void)_removeDebugVisuals
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[AKAnnotationLayer setBorderWidth:](self, "setBorderWidth:", 0.0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AKAnnotationLayer sublayers](self, "sublayers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "borderWidth");
          if (v9 == 2.0)
            objc_msgSend(v8, "removeFromSuperlayer");
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (AKAnnotation)annotation
{
  return (AKAnnotation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (CALayer)fastPathLayer
{
  return self->_fastPathLayer;
}

- (void)setFastPathLayer:(id)a3
{
  objc_storeStrong((id *)&self->_fastPathLayer, a3);
}

- (BOOL)isObservingAnnotation
{
  return self->_isObservingAnnotation;
}

- (void)setIsObservingAnnotation:(BOOL)a3
{
  self->_isObservingAnnotation = a3;
}

- (BOOL)wasLastDrawingClipped
{
  return self->_wasLastDrawingClipped;
}

- (void)setWasLastDrawingClipped:(BOOL)a3
{
  self->_wasLastDrawingClipped = a3;
}

- (BOOL)lastRedrawWasForDrawingBounds
{
  return self->_lastRedrawWasForDrawingBounds;
}

- (void)setLastRedrawWasForDrawingBounds:(BOOL)a3
{
  self->_lastRedrawWasForDrawingBounds = a3;
}

- (BOOL)shouldRecalculateLoupeImage
{
  return self->_shouldRecalculateLoupeImage;
}

- (void)setShouldRecalculateLoupeImage:(BOOL)a3
{
  self->_shouldRecalculateLoupeImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastPathLayer, 0);
  objc_destroyWeak((id *)&self->_pageController);
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
