@implementation AKAdornmentLayer

+ (id)newAdornmentLayerForAnnotation:(id)a3 withPageController:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_adornmentClassForAnnotation:", v7)), "_initWithAnnotation:andPageController:", v7, v6);

  return v8;
}

- (id)_initWithAnnotation:(id)a3 andPageController:(id)a4
{
  id v6;
  id v7;
  AKAdornmentLayer *v8;
  AKAdornmentLayer *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AKAdornmentLayer;
  v8 = -[AKAdornmentLayer init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AKAdornmentLayer setAnnotation:](v8, "setAnnotation:", v6);
    -[AKAdornmentLayer setPageController:](v9, "setPageController:", v7);
    -[AKAdornmentLayer setCurrentScaleFactor:](v9, "setCurrentScaleFactor:", 9.22337204e18);
    objc_msgSend(v7, "geometryHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "adornmentLayerFrameForAnnotation:", v6);
    -[AKAdornmentLayer setFrame:](v9, "setFrame:");

    v11 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    -[AKAdornmentLayer setHandleContainerLayer:](v9, "setHandleContainerLayer:", v11);

    -[AKAdornmentLayer handleContainerLayer](v9, "handleContainerLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAdornmentLayer addSublayer:](v9, "addSublayer:", v12);

    -[AKAdornmentLayer updateAdornmentElements](v9, "updateAdornmentElements");
    -[AKAdornmentLayer _startObservingAnnotation](v9, "_startObservingAnnotation");
    if (-[AKAdornmentLayer needsUpdateWhenDraggingStartsOrEnds](v9, "needsUpdateWhenDraggingStartsOrEnds"))
      -[AKAdornmentLayer _startObservingAnnotationEventHandlers](v9, "_startObservingAnnotationEventHandlers");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[AKAdornmentLayer teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)AKAdornmentLayer;
  -[AKAdornmentLayer dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  -[AKAdornmentLayer _stopObservingAnnotation](self, "_stopObservingAnnotation");
  -[AKAdornmentLayer _stopObservingAnnotationEventHandlers](self, "_stopObservingAnnotationEventHandlers");
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == CFSTR("AKAdornmentLayer.modelAnnotationObservationContext"))
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("drawingBounds")))
    {
      -[AKAdornmentLayer pageController](self, "pageController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "geometryHelper");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAdornmentLayer annotation](self, "annotation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "adornmentLayerFrameForAnnotation:", v15);
      -[AKAdornmentLayer setFrame:](self, "setFrame:");

    }
    goto LABEL_6;
  }
  if (a6 == CFSTR("AKAdornmentLayer.eventHandlingObservationContext"))
  {
LABEL_6:
    -[AKAdornmentLayer updateAdornmentElements](self, "updateAdornmentElements");
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)AKAdornmentLayer;
  -[AKAdornmentLayer observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_7:

}

- (BOOL)needsUpdateWhenDraggingStartsOrEnds
{
  return 0;
}

- (unint64_t)currentlyDraggedArea
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  -[AKAdornmentLayer pageController](self, "pageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainEventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotationEventHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v6, "annotation"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[AKAdornmentLayer annotation](self, "annotation"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v7 == v8))
  {
    v9 = objc_msgSend(v6, "initiallyDraggedArea");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updatePixelAlignment
{
  void *v3;
  id v4;

  -[AKAdornmentLayer pageController](self, "pageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[AKAdornmentLayer updateAdornmentElements](self, "updateAdornmentElements");
    v3 = v4;
  }

}

- (void)updateAdornmentElements
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id *v26;
  id *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[2];
  _QWORD v33[4];
  id v34;
  _QWORD v35[2];
  BOOL v36;
  id v37;
  id v38;

  -[AKAdornmentLayer pageController](self, "pageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = 0;
  -[AKAdornmentLayer annotation](self, "annotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAnnotationPointOfInterestHelper pointsOfInterest:withVisualStyle:ofAnnotation:pageControllerForPixelAlignment:](AKAnnotationPointOfInterestHelper, "pointsOfInterest:withVisualStyle:ofAnnotation:pageControllerForPixelAlignment:", &v38, &v37, v4, v3);
  v5 = v38;
  v6 = v37;

  objc_msgSend(v5, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "reverseObjectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[AKAdornmentLayer handleContainerLayer](self, "handleContainerLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAdornmentLayer annotation](self, "annotation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEditingText"))
  {
    v16 = 0;
LABEL_12:

    goto LABEL_13;
  }
  -[AKAdornmentLayer annotation](self, "annotation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isMemberOfClass:", objc_opt_class());

  if (v14)
  {
    -[AKAdornmentLayer annotation](self, "annotation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fillColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v12, "strokeColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v12, "strokeWidth");
        v16 = v18 <= 0.0;
      }
      else
      {
        v16 = 1;
      }

    }
    goto LABEL_12;
  }
  v16 = 0;
LABEL_13:
  v19 = objc_msgSend(v8, "count");
  objc_msgSend(v11, "sublayers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v19 != v21 || v16)
  {
    objc_msgSend(v11, "sublayers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

  }
  objc_msgSend(v11, "sublayers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    objc_msgSend(v11, "sublayers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = sub_229026748;
    v30[3] = &unk_24F1A7D98;
    v26 = &v31;
    v31 = v8;
    v27 = (id *)v32;
    v32[0] = v3;
    v32[1] = self;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v30);

  }
  else
  {
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = sub_22902666C;
    v33[3] = &unk_24F1A7D70;
    v26 = &v34;
    v34 = v10;
    v36 = v16;
    v27 = (id *)v35;
    v35[0] = v3;
    v35[1] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v33);
  }

  -[AKAdornmentLayer handleContainerLayer](self, "handleContainerLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeFromSuperlayer");

  -[AKAdornmentLayer handleContainerLayer](self, "handleContainerLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAdornmentLayer addSublayer:](self, "addSublayer:", v29);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)updateSublayersWithScale:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  CGAffineTransform v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[AKAdornmentLayer setCurrentScaleFactor:](self, "setCurrentScaleFactor:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AKAdornmentLayer handleContainerLayer](self, "handleContainerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sublayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = 1.0 / a3;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        CGAffineTransformMakeScale(&v13, v10, v10);
        objc_msgSend(v12, "setAffineTransform:", &v13);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (id)handleSublayerWithStyle:(unint64_t)a3
{
  void *v4;
  double v5;
  CGAffineTransform v7;

  if (a3 > 2)
  {
    v4 = 0;
  }
  else
  {
    -[__objc2_class layer](*off_24F1A7DB8[a3], "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AKAdornmentLayer currentScaleFactor](self, "currentScaleFactor");
  if (v5 != 9.22337204e18)
  {
    CGAffineTransformMakeScale(&v7, 1.0 / v5, 1.0 / v5);
    objc_msgSend(v4, "setAffineTransform:", &v7);
  }
  return v4;
}

- (void)_addHandleSublayerAtPoint:(CGPoint)a3 withStyle:(unint64_t)a4
{
  double y;
  double x;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[AKAdornmentLayer handleSublayerWithStyle:](self, "handleSublayerWithStyle:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AKAdornmentLayer handleContainerLayer](self, "handleContainerLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v8);

    objc_msgSend(v8, "setPosition:", x, y);
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
  if (!-[AKAdornmentLayer isObservingAnnotation](self, "isObservingAnnotation"))
  {
    -[AKAdornmentLayer annotation](self, "annotation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keysForValuesToObserveForAdornments");
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
          objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0, CFSTR("AKAdornmentLayer.modelAnnotationObservationContext"));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    -[AKAdornmentLayer setIsObservingAnnotation:](self, "setIsObservingAnnotation:", 1);

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
  if (-[AKAdornmentLayer isObservingAnnotation](self, "isObservingAnnotation"))
  {
    -[AKAdornmentLayer annotation](self, "annotation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keysForValuesToObserveForAdornments");
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
          objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), CFSTR("AKAdornmentLayer.modelAnnotationObservationContext"));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    -[AKAdornmentLayer setIsObservingAnnotation:](self, "setIsObservingAnnotation:", 0);

  }
}

- (void)_startObservingAnnotationEventHandlers
{
  void *v3;
  void *v4;
  id v5;

  if (!-[AKAdornmentLayer isObservingEventHandling](self, "isObservingEventHandling"))
  {
    -[AKAdornmentLayer pageController](self, "pageController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mainEventHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("annotationEventHandler"), 0, CFSTR("AKAdornmentLayer.eventHandlingObservationContext"));
    -[AKAdornmentLayer setIsObservingEventHandling:](self, "setIsObservingEventHandling:", 1);

  }
}

- (void)_stopObservingAnnotationEventHandlers
{
  void *v3;
  void *v4;
  id v5;

  if (-[AKAdornmentLayer isObservingEventHandling](self, "isObservingEventHandling"))
  {
    -[AKAdornmentLayer pageController](self, "pageController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mainEventHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("annotationEventHandler"), CFSTR("AKAdornmentLayer.eventHandlingObservationContext"));
    -[AKAdornmentLayer setIsObservingEventHandling:](self, "setIsObservingEventHandling:", 0);

  }
}

+ (Class)_adornmentClassForAnnotation:(id)a3
{
  id v3;
  objc_class *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && !objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v3, "visualStyle");
          }
        }
      }
    }
  }
  v4 = (objc_class *)(id)objc_opt_class();

  return v4;
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

- (double)currentScaleFactor
{
  return self->_currentScaleFactor;
}

- (void)setCurrentScaleFactor:(double)a3
{
  self->_currentScaleFactor = a3;
}

- (BOOL)isObservingAnnotation
{
  return self->_isObservingAnnotation;
}

- (void)setIsObservingAnnotation:(BOOL)a3
{
  self->_isObservingAnnotation = a3;
}

- (CALayer)handleContainerLayer
{
  return (CALayer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHandleContainerLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isObservingEventHandling
{
  return self->_isObservingEventHandling;
}

- (void)setIsObservingEventHandling:(BOOL)a3
{
  self->_isObservingEventHandling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleContainerLayer, 0);
  objc_destroyWeak((id *)&self->_pageController);
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
