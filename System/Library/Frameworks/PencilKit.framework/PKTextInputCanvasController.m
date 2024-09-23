@implementation PKTextInputCanvasController

- (PKTextInputCanvasController)init
{
  PKTextInputCanvasController *v2;
  NSMutableSet *v3;
  NSMutableSet *recentlyRemovedStrokeIDs;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *strokeColorForStrokeUUID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKTextInputCanvasController;
  v2 = -[PKTextInputCanvasController init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    recentlyRemovedStrokeIDs = v2->_recentlyRemovedStrokeIDs;
    v2->_recentlyRemovedStrokeIDs = v3;

    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_useSlidingCanvas = objc_msgSend(v5, "useSlidingCanvas");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v6 = objc_claimAutoreleasedReturnValue();
    strokeColorForStrokeUUID = v2->_strokeColorForStrokeUUID;
    v2->_strokeColorForStrokeUUID = (NSMutableDictionary *)v6;

  }
  return v2;
}

- (void)dealloc
{
  PKTextInputCanvasController *v2;
  void *v3;
  objc_super v4;

  v2 = self;
  if (self)
    self = (PKTextInputCanvasController *)self->__canvasView;
  -[PKTextInputCanvasController drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDrawingTarget:", 0);

  v4.receiver = v2;
  v4.super_class = (Class)PKTextInputCanvasController;
  -[PKTextInputCanvasController dealloc](&v4, sel_dealloc);
}

+ (void)prewarmFutureCanvasesIfNecessarySecureRendering:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = objc_opt_self();
  +[PKTiledCanvasView prewarmFutureCanvasesIfNecessarySecureRendering:prewarmSharedResourceHandler:](PKTiledCanvasView, "prewarmFutureCanvasesIfNecessarySecureRendering:prewarmSharedResourceHandler:", a2, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = +[PKTextInputCanvasController defaultInkWithColor:](v3, v5);

}

+ (id)defaultInkWithColor:(uint64_t)a1
{
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  v2 = a2;
  objc_opt_self();
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inkWeightForIncreasedContrast");
  }
  else
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inkWeight");
  }
  v5 = v4;

  +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", CFSTR("com.apple.ink.pen"), v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateCanvasViewInkAnimated:(uint64_t)a1
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(a1 + 96))
  {
    v4 = *(id *)(a1 + 88);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v4;
    +[PKTextInputCanvasController defaultInkWithColor:]((uint64_t)PKTextInputCanvasController, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 96), "setInk:", v5);

    v6 = *(id *)(a1 + 88);
    v7 = *(void **)(a1 + 56);
    if (v7)
      -[PKTextInputCanvasController _recordColorForStroke:](a1, v7);
    objc_msgSend(*(id *)(a1 + 96), "setLiveRenderingOverrideColor:animated:", v6, a2);

  }
}

- (id)defaultStrokeColor
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_containerView
{
  id v1;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 9);
    objc_msgSend(WeakRetained, "canvasControllerContainerView:", v1);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)_updateCanvasView
{
  id WeakRetained;
  BOOL v3;
  void *v4;
  id *v5;
  BOOL v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  PKTiledCanvasView *v16;
  PKTiledCanvasView *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[5];

  v58[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 64) || *(_BYTE *)(a1 + 65))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      v3 = WeakRetained != 0;

      v5 = (id *)(a1 + 96);
      v4 = *(void **)(a1 + 96);
      v6 = v4 == 0;
      if (WeakRetained && !v4)
      {
        +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(a1 + 16) = objc_msgSend(v7, "useSlidingCanvas");

        +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "slidingCanvasWidth");
        v10 = v9;

        +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "slidingCanvasHeight");
        v13 = v12;

        +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "useSingleComponentCanvas");

        v16 = [PKTiledCanvasView alloc];
        v17 = -[PKTiledCanvasView initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:](v16, "initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:", 1, v15, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        -[PKTiledCanvasView setResourceCacheSize:](v17, "setResourceCacheSize:", 0x800000);
        -[PKTiledCanvasView setDisableAXDrawingAnnouncements:](v17, "setDisableAXDrawingAnnouncements:", 1);
        -[PKTiledCanvasView setOverrideUserInterfaceStyle:](v17, "setOverrideUserInterfaceStyle:", 1);
        -[PKTiledCanvasView setAccessibilityIgnoresInvertColors:](v17, "setAccessibilityIgnoresInvertColors:", 1);
        if (PK_UIApplicationIsSystemShell_onceToken != -1)
          dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_70);
        v18 = (unint64_t)v10;
        v19 = (unint64_t)v13;
        if (!PK_UIApplicationIsSystemShell___result)
        {
          v20 = MEMORY[0x1C3B7FF8C]();
          if (*(_BYTE *)(a1 + 16))
          {
            +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
            v22 = 18;
            if ((_DWORD)v15)
              v22 = 12;
            v23 = (unint64_t)((double)(v19 * v18 * v22) * v21 + 54457280.0);
          }
          else
          {
            v23 = 188743680;
          }
          if (v20 < v23)
            -[PKTiledCanvasView setMetalLayerContentsScaleOverride:](v17, "setMetalLayerContentsScaleOverride:", 1.0);
        }
        -[PKTiledCanvasView setDelegate:](v17, "setDelegate:", a1);
        -[PKTiledCanvasView setOpaque:](v17, "setOpaque:", 0);
        -[PKTiledCanvasView setLiveStrokeMode:](v17, "setLiveStrokeMode:", 1);
        -[PKTiledCanvasView setUseLuminanceColorFilter:](v17, "setUseLuminanceColorFilter:", 1);
        objc_storeStrong((id *)(a1 + 96), v17);
        -[PKTextInputCanvasController _updateCanvasViewInkAnimated:](a1, 0);
        v29 = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(v29, "canvasControllerContainerView:", a1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "addSubview:", v17);
        -[PKTiledCanvasView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        if (*(_BYTE *)(a1 + 16))
        {
          +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "slidingCanvasDebugBorder");

          if (v32)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
            v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v34 = objc_msgSend(v33, "CGColor");
            -[PKTiledCanvasView layer](v17, "layer");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setBorderColor:", v34);

            -[PKTiledCanvasView layer](v17, "layer");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setBorderWidth:", 1.0);

          }
          +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "slidingCanvasWidth");
          v39 = v38;
          +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "slidingCanvasHeight");
          v42 = v41;

          -[PKTiledCanvasView setLiveStrokeMaxSize:](v17, "setLiveStrokeMaxSize:", v39, v42);
          -[PKTiledCanvasView setEnableCanvasOffsetSupport:](v17, "setEnableCanvasOffsetSupport:", 1);
          -[PKTiledCanvasView setFrame:](v17, "setFrame:", 0.0, 0.0, (double)v18, (double)v19);
        }
        else
        {
          -[PKTiledCanvasView leadingAnchor](v17, "leadingAnchor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "leadingAnchor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "constraintEqualToAnchor:", v54);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = v53;
          -[PKTiledCanvasView trailingAnchor](v17, "trailingAnchor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "trailingAnchor");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "constraintEqualToAnchor:");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v58[1] = v51;
          -[PKTiledCanvasView topAnchor](v17, "topAnchor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "topAnchor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "constraintEqualToAnchor:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v58[2] = v44;
          -[PKTiledCanvasView bottomAnchor](v17, "bottomAnchor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "bottomAnchor");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "constraintEqualToAnchor:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v58[3] = v47;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v48);
        }
        v49 = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(v49, "canvasControllerDrawingGestureRecognizer:", a1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKTiledCanvasView setDrawingGestureRecognizer:](v17, "setDrawingGestureRecognizer:", v50);
        objc_msgSend(v50, "setDrawingTarget:", v17);
        +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");

LABEL_28:
        objc_msgSend(*(id *)(a1 + 96), "setHidden:", *(_BYTE *)(a1 + 64) == 0);
        -[PKTextInputCanvasController _updateFloatingBackground](a1);
        return;
      }
    }
    else
    {
      v3 = 0;
      v5 = (id *)(a1 + 96);
      v4 = *(void **)(a1 + 96);
      v6 = v4 == 0;
    }
    if (!v3 && !v6)
    {
      v24 = v4;
      objc_msgSend(v24, "drawingGestureRecognizer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "drawingTarget");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = *v5;

      if (v26 == v27)
      {
        objc_msgSend(*v5, "drawingGestureRecognizer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setDrawingTarget:", 0);

      }
      objc_msgSend(*v5, "removeFromSuperview");
      objc_msgSend(*v5, "setDelegate:", 0);
      objc_storeStrong(v5, 0);
      +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    }
    goto LABEL_28;
  }
}

- (uint64_t)canvasHasVisibleStrokes
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend(*(id *)(result + 96), "isDrawing") & 1) != 0)
      return 1;
    else
      return objc_msgSend(*(id *)(v1 + 96), "hasVisibleStrokes");
  }
  return result;
}

- (double)renderedStrokesBounds
{
  id v2;
  double v3;
  double v4;

  if (!a1)
    return 0.0;
  v2 = *(id *)(a1 + 96);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 96), "renderedStrokesBounds");
    v4 = v3;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D628];
  }

  return v4;
}

- (id)inProgressStroke
{
  void *v1;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 96), "currentStrokeWithStrokeDataCopy");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_setIsInProgressScribbleStroke:", 1);
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (void)setDelegate:(uint64_t)a1
{
  id WeakRetained;
  id obj;

  obj = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));

    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)(a1 + 72), obj);
      -[PKTextInputCanvasController _updateCanvasView](a1);
    }
  }

}

- (void)reloadPreferredStrokeColor
{
  id WeakRetained;
  void *v3;
  int v4;
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  char v10;
  unsigned __int8 v11;

  if (a1)
  {
    v11 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "canvasControllerPreferredStrokeColor:animated:", a1, &v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = v11;
    v5 = v3;
    v6 = *(id *)(a1 + 88);
    if (v6 == v5)
      goto LABEL_12;
    v7 = (unint64_t)v6;
    v8 = (unint64_t)v5;
    if (!(v8 | v7))
      goto LABEL_12;
    v9 = (void *)v8;
    if (v8 && v7)
    {
      v10 = objc_msgSend((id)v7, "isEqual:", v8);

      if ((v10 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    objc_storeStrong((id *)(a1 + 88), v3);
    -[PKTextInputCanvasController _updateCanvasViewInkAnimated:](a1, v4 != 0);
LABEL_12:

  }
}

- (double)convertRect:(double)a3 toCanvasFromCoordinateSpace:(double)a4
{
  id v11;
  void *v12;
  NSObject *v13;
  int v15;
  id *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  if (a1)
  {
    -[PKTextInputCanvasController _containerView](a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      a3 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v11, v12, a3, a4, a5, a6);
    }
    else
    {
      v13 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = a1;
        _os_log_error_impl(&dword_1BE213000, v13, OS_LOG_TYPE_ERROR, "Trying to convert a rect from a canvas view that has no container view. Canvas controller: %@", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  else
  {
    a3 = 0.0;
  }

  return a3;
}

- (id)canvasCoordinateSpace
{
  if (a1)
  {
    -[PKTextInputCanvasController _containerView](a1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)removeStrokes:(double)a3 animationDuration:
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[PKDrawing _uuidDescriptionForStrokes:](PKDrawing, "_uuidDescriptionForStrokes:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_INFO, "Fade out strokes from canvas: %@", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 96), "fadeOutAndHideStrokes:duration:", v5, a3);
    -[PKTextInputCanvasController _trackRecentlyRemovedStrokes:](a1, v5);
  }

}

- (void)_trackRecentlyRemovedStrokes:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "_strokeUUID", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 8), "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)animateAndRemoveStrokes:(uint64_t)a3 destinationFrame:(CGFloat)a4 animationDuration:(CGFloat)a5 useImpreciseAnimation:(CGFloat)a6
{
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  CGRect v24;

  v23 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  if (a1)
  {
    v16 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v24.origin.x = a4;
      v24.origin.y = a5;
      v24.size.width = a6;
      v24.size.height = a7;
      NSStringFromCGRect(v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKDrawing _uuidDescriptionForStrokes:](PKDrawing, "_uuidDescriptionForStrokes:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_1BE213000, v16, OS_LOG_TYPE_INFO, "Animate out strokes from canvas. Frame: %@, strokes: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 96), "animateStrokes:destinationFrame:duration:particles:", v15, a3, a4, a5, a6, a7, a8);
    -[PKTextInputCanvasController _trackRecentlyRemovedStrokes:](a1, v15);
  }

}

- (void)setFloatingBackgroundRect:(double)a3
{
  if (a1)
  {
    if (!CGRectEqualToRect(*(CGRect *)&a2, *(CGRect *)(a1 + 112)))
    {
      *(double *)(a1 + 112) = a2;
      *(double *)(a1 + 120) = a3;
      *(double *)(a1 + 128) = a4;
      *(double *)(a1 + 136) = a5;
      -[PKTextInputCanvasController _updateFloatingBackground](a1);
    }
  }
}

- (void)_updateFloatingBackground
{
  id v2;
  void *v3;
  _BOOL4 v4;
  void **v5;
  void *v6;
  PKTextInputFloatingBackgroundView *v7;
  PKTextInputFloatingBackgroundView *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  PKTextInputFloatingBackgroundView *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  double v34;
  _QWORD v35[9];
  _QWORD v36[4];
  PKTextInputFloatingBackgroundView *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = *(id *)(a1 + 96);
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 && !CGRectIsEmpty(*(CGRect *)(a1 + 112)) && !CGRectIsNull(*(CGRect *)(a1 + 112));

  v5 = (void **)(a1 + 104);
  v6 = *(void **)(a1 + 104);
  if (v4 && !v6)
  {
    v7 = [PKTextInputFloatingBackgroundView alloc];
    v8 = -[PKTextInputFloatingBackgroundView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_storeStrong((id *)(a1 + 104), v8);
    v9 = *(id *)(a1 + 96);
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:belowSubview:", v8, *(_QWORD *)(a1 + 96));

    -[PKTextInputFloatingBackgroundView setAlpha:](v8, "setAlpha:", 0.0);
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke;
    v40[3] = &unk_1E7776F38;
    v12 = v40;
    v13 = v8;
    v40[4] = v13;
    objc_msgSend(v11, "animateWithDuration:animations:", v40, 0.15);
LABEL_14:

    goto LABEL_15;
  }
  if (v6)
    v14 = v4;
  else
    v14 = 1;
  if ((v14 & 1) == 0)
  {
    v15 = v6;
    v16 = *v5;
    *v5 = 0;

    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textInputStrokeFadeOutDuration");
    v19 = v18;

    v20 = MEMORY[0x1E0C809B0];
    v21 = (void *)MEMORY[0x1E0DC3F10];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_2;
    v38[3] = &unk_1E7776F38;
    v12 = v38;
    v39 = v15;
    v36[0] = v20;
    v36[1] = 3221225472;
    v36[2] = __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_3;
    v36[3] = &unk_1E77770F8;
    v13 = (PKTextInputFloatingBackgroundView *)v39;
    v37 = v13;
    objc_msgSend(v21, "animateWithDuration:animations:completion:", v38, v36, v19);

    goto LABEL_14;
  }
LABEL_15:
  if (v4)
  {
    v23 = *(double *)(a1 + 112);
    v22 = *(double *)(a1 + 120);
    v25 = *(double *)(a1 + 128);
    v24 = *(double *)(a1 + 136);
    v26 = *(id *)(a1 + 104);
    objc_msgSend(v26, "superview");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[PKTextInputCanvasController _containerView]((id *)a1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v23 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v28, v27, v23, v22, v25, v24);
      v22 = v30;
      v25 = v31;
      v24 = v32;
    }
    else
    {
      v33 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = a1;
        _os_log_error_impl(&dword_1BE213000, v33, OS_LOG_TYPE_ERROR, "Trying to convert a rect to a canvas view that has no container view. Canvas controller: %@", buf, 0xCu);
      }

    }
    v34 = 0.2;
    if (!v6)
      v34 = 0.0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_4;
    v35[3] = &unk_1E77792B8;
    v35[4] = a1;
    *(double *)&v35[5] = v23;
    *(double *)&v35[6] = v22;
    *(double *)&v35[7] = v25;
    *(double *)&v35[8] = v24;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 131073, v35, 0, v34, 0.0);
  }
}

uint64_t __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_4(double *a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  void *v6;

  v1 = a1[5];
  v2 = a1[6];
  v3 = a1[7];
  v4 = a1[8];
  v5 = *((_QWORD *)a1 + 4);
  if (v5)
    v6 = *(void **)(v5 + 104);
  else
    v6 = 0;
  return objc_msgSend(v6, "setFrame:", v1, v2, v3, v4);
}

- (void)_recordColorForStroke:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    v3 = *(id *)(a1 + 48);
    objc_sync_enter(v3);
    v4 = *(_QWORD *)(a1 + 88);
    v5 = *(void **)(a1 + 48);
    objc_msgSend(v7, "_strokeUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);
    else
      objc_msgSend(v5, "removeObjectForKey:", v6);

    objc_sync_exit(v3);
  }

}

- (void)_updateCanvasViewOffsetFromTouch:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double *v17;
  double *v18;
  double *v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  _QWORD v26[5];
  uint64_t v27;
  double *v28;
  uint64_t v29;
  __n128 (*v30)(uint64_t, uint64_t);
  uint64_t (*v31)();
  const char *v32;
  __int128 v33;
  __int128 v34;

  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 16))
  {
    v27 = 0;
    v28 = (double *)&v27;
    v30 = __Block_byref_object_copy__16;
    v31 = __Block_byref_object_dispose__16;
    v29 = 0x5012000000;
    v32 = "";
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(*(id *)(a1 + 96), "frame");
    *(_QWORD *)&v33 = v4;
    *((_QWORD *)&v33 + 1) = v5;
    *(_QWORD *)&v34 = v6;
    *((_QWORD *)&v34 + 1) = v7;
    objc_msgSend(*(id *)(a1 + 96), "visibleStrokesBounds");
    v8 = v28;
    v8[6] = DKDUpdateFixedSizeRectToIncludeRectIfPossible(v28[6], v28[7], v28[8], v28[9], v9, v10, v11, v12, 16.0, 16.0);
    *((_QWORD *)v8 + 7) = v13;
    *((_QWORD *)v8 + 8) = v14;
    *((_QWORD *)v8 + 9) = v15;
    v16 = *(void **)(a1 + 96);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64__PKTextInputCanvasController__updateCanvasViewOffsetFromTouch___block_invoke;
    v26[3] = &unk_1E777A800;
    v26[4] = &v27;
    objc_msgSend(v16, "enumerateRenderedStrokesBounds:", v26);
    v17 = *(double **)(a1 + 24);
    v18 = *(double **)(a1 + 32);
    v19 = v28;
    if (v17 == v18)
    {
      v20 = v28[6];
      v21 = v28[7];
    }
    else
    {
      v20 = v28[6];
      v21 = v28[7];
      v22 = v28[8];
      v23 = v28[9];
      do
      {
        v24 = *v17;
        v25 = v17[1];
        v17 += 2;
        v20 = DKDUpdateFixedSizeRectToIncludePoint(v20, v21, v22, v23, v24, v25, 16.0, 16.0);
        v19[6] = v20;
        v19[7] = v21;
        v19[8] = v22;
        v19[9] = v23;
      }
      while (v17 != v18);
    }
    objc_msgSend(*(id *)(a1 + 96), "setCanvasOffset:", v20, v21);
    _Block_object_dispose(&v27, 8);
  }

}

void __64__PKTextInputCanvasController__updateCanvasViewOffsetFromTouch___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v5[6] = DKDUpdateFixedSizeRectToIncludeRectIfPossible(v5[6], v5[7], v5[8], v5[9], a2, a3, a4, a5, 16.0, 16.0);
  *((_QWORD *)v5 + 7) = v6;
  *((_QWORD *)v5 + 8) = v7;
  *((_QWORD *)v5 + 9) = v8;
}

- (void)_clearRecordedColorForStroke:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    v4 = *(id *)(a1 + 48);
    objc_sync_enter(v4);
    v5 = *(void **)(a1 + 48);
    objc_msgSend(v7, "_strokeUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

    objc_sync_exit(v4);
    v3 = v7;
  }

}

- (void)canvasView:(id)a3 didPresentWithCanvasOffset:(CGPoint)a4
{
  double y;
  double x;
  PKTiledCanvasView *canvasView;

  y = a4.y;
  x = a4.x;
  if (self)
  {
    -[PKTiledCanvasView frame](self->__canvasView, "frame", a3);
    canvasView = self->__canvasView;
  }
  else
  {
    objc_msgSend(0, "frame", a3);
    canvasView = 0;
  }
  -[PKTiledCanvasView setFrame:](canvasView, "setFrame:", x, y);
}

- (id)canvasView:(id)a3 inkForStroke:(id)a4
{
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *strokeColorForStrokeUUID;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;

  v5 = a4;
  v6 = self->_strokeColorForStrokeUUID;
  objc_sync_enter(v6);
  strokeColorForStrokeUUID = self->_strokeColorForStrokeUUID;
  objc_msgSend(v5, "_strokeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](strokeColorForStrokeUUID, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  objc_msgSend(v5, "ink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqual:", v12);

    if ((v13 & 1) == 0)
    {
      +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v11, v9);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
  }

  return v11;
}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "canvasControllerDidBeginDrawing:", self);

  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
}

- (void)canvasView:(id)a3 beganStroke:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_storeStrong((id *)&self->_currentStroke, a4);
  -[PKTextInputCanvasController _recordColorForStroke:]((uint64_t)self, v6);
  v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "_strokeUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_INFO, "canvasViewBeganStroke: %@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)canvasView:(id)a3 endedStroke:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  PKStroke *currentStroke;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "_strokeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_INFO, "canvasViewEndedStroke: %@", (uint8_t *)&v10, 0xCu);

  }
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "canvasControllerEndedStroke:", self);

  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  -[PKTextInputCanvasController _clearRecordedColorForStroke:]((uint64_t)self, v5);
  currentStroke = self->_currentStroke;
  self->_currentStroke = 0;

}

- (void)canvasView:(id)a3 cancelledStroke:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  PKStroke *currentStroke;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "canvasControllerDrawingGestureRecognizer:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "_strokeUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "canvasViewCancelledStroke: %@, gesture: %@", (uint8_t *)&v14, 0x16u);

  }
  if (self)
    v12 = objc_loadWeakRetained((id *)&self->_changeObserver);
  else
    v12 = 0;
  objc_msgSend(v12, "canvasControllerDidCancelStroke:strokeAcceptanceState:", self, objc_msgSend(v9, "strokeAcceptanceState"));

  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  -[PKTextInputCanvasController _clearRecordedColorForStroke:]((uint64_t)self, v7);
  currentStroke = self->_currentStroke;
  self->_currentStroke = 0;

}

- (void)canvasViewWillBeginNewStroke:(id)a3 withTouch:(id)a4 location:(CGPoint)a5
{
  PKStroke *currentStroke;
  id v7;

  v7 = a4;
  currentStroke = self->_currentStroke;
  self->_currentStroke = 0;

  std::vector<CGPoint>::resize((uint64_t)&self->_currentStrokePoints, 0);
  std::vector<CGPoint>::reserve((void **)&self->_currentStrokePoints.__begin_, 0x400uLL);
  -[PKTextInputCanvasController _updateCanvasViewOffsetFromTouch:]((uint64_t)self, v7);

}

- (void)canvasViewDrawingMoved:(id)a3 withTouch:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGPoint *value;
  CGPoint *end;
  CGPoint *v15;
  CGPoint *begin;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  CGPoint *v22;
  CGPoint *v23;
  id WeakRetained;
  CGPoint *v25;
  CGPoint *v26;
  double v27;
  double x;
  double v29;
  PKTiledCanvasView *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;

  v35 = a3;
  v6 = a4;
  v7 = v6;
  if (self)
  {
    if (v6)
    {
      -[PKTextInputCanvasController _containerView]((id *)&self->super.isa);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "PK_locationInView:", v8);
      v10 = v9;
      v12 = v11;

    }
    else
    {
      v10 = 0.0;
      v12 = 0.0;
    }
    value = self->_currentStrokePoints.__end_cap_.__value_;
    end = self->_currentStrokePoints.__end_;
    if (end >= value)
    {
      begin = self->_currentStrokePoints.__begin_;
      v17 = end - begin;
      v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 60)
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      v19 = (char *)value - (char *)begin;
      if (v19 >> 3 > v18)
        v18 = v19 >> 3;
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
        v20 = 0xFFFFFFFFFFFFFFFLL;
      else
        v20 = v18;
      if (v20)
      {
        v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&self->_currentStrokePoints.__end_cap_, v20);
        begin = self->_currentStrokePoints.__begin_;
        end = self->_currentStrokePoints.__end_;
      }
      else
      {
        v21 = 0;
      }
      v22 = (CGPoint *)&v21[16 * v17];
      v23 = (CGPoint *)&v21[16 * v20];
      v22->x = v10;
      v22->y = v12;
      v15 = v22 + 1;
      if (end != begin)
      {
        do
        {
          v22[-1] = end[-1];
          --v22;
          --end;
        }
        while (end != begin);
        begin = self->_currentStrokePoints.__begin_;
      }
      self->_currentStrokePoints.__begin_ = v22;
      self->_currentStrokePoints.__end_ = v15;
      self->_currentStrokePoints.__end_cap_.__value_ = v23;
      if (begin)
        operator delete(begin);
    }
    else
    {
      end->x = v10;
      end->y = v12;
      v15 = end + 1;
    }
    self->_currentStrokePoints.__end_ = v15;
    -[PKTextInputCanvasController _updateCanvasViewOffsetFromTouch:]((uint64_t)self, v7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
    objc_msgSend(WeakRetained, "canvasControllerInProgressStrokeDidChange:", self);

    v25 = self->_currentStrokePoints.__begin_;
    v26 = self->_currentStrokePoints.__end_ - 1;
    v27 = 0.0;
    if (v25 < v26)
    {
      x = v25->x;
      do
      {
        v29 = v25[1].x;
        ++v25;
        v27 = v27 + sqrt((v25[-1].y - v25->y) * (v25[-1].y - v25->y) + (x - v29) * (x - v29));
        x = v29;
      }
      while (v25 < v26);
    }
    v30 = self->__canvasView;
    -[PKTiledCanvasView liveStrokeMaxSize](v30, "liveStrokeMaxSize");
    v32 = v31;
    -[PKTiledCanvasView liveStrokeMaxSize](self->__canvasView, "liveStrokeMaxSize");
    v34 = (v32 + v33) * 10.0;

    if (v27 > v34)
      -[PKTiledCanvasView cancelCurrentStroke](self->__canvasView, "cancelCurrentStroke");
  }

}

- (void)canvasViewDidEndDrawing:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "canvasControllerDidEndDrawing:", self);

  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
}

- (void)canvasViewHasVisibleStrokesChanged:(id)a3
{
  PKTextInputCanvasController *v3;
  PKTextInputCanvasController *v4;

  v3 = self;
  if (self)
    self = (PKTextInputCanvasController *)objc_loadWeakRetained((id *)&self->_delegate);
  v4 = self;
  -[PKTextInputCanvasController canvasControllerHasVisibleStrokesChanged:](self, "canvasControllerHasVisibleStrokesChanged:", v3);

}

- (void)canvasViewDidFinishAnimatingStrokes:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_INFO, "canvasViewDidFinishAnimatingStrokes", v6, 2u);
  }

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "canvasControllerCanvasDidFinishAnimatingStrokes:", self);

}

- (void)canvasView:(id)a3 drawingDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "strokes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDrawing _uuidDescriptionForStrokes:](PKDrawing, "_uuidDescriptionForStrokes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_INFO, "canvasViewDrawingDidChange. Visible strokes: %@", (uint8_t *)&v12, 0xCu);

  }
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "canvasController:drawingDidChange:", self, v5);

  objc_msgSend(v5, "strokes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") == 0;

  if (v11)
    -[NSMutableSet removeAllObjects](self->_recentlyRemovedStrokeIDs, "removeAllObjects");
  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");

}

- (id)canvasViewTouchView:(id)a3
{
  -[PKTextInputCanvasController _containerView]((id *)&self->super.isa);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canvasViewAllowSnapToShape:(id)a3
{
  return 0;
}

- (void)reportDebugStateDescription:(id)a3
{
  PKTiledCanvasView *v3;
  _BOOL4 v5;
  PKTiledCanvasView *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void (**v11)(id, const __CFString *, void *);
  CGRect v12;

  v11 = (void (**)(id, const __CFString *, void *))a3;
  v5 = self != 0;
  if (self)
  {
    v6 = self->__canvasView;
    if (v6)
    {
      v3 = self->__canvasView;
      -[PKTiledCanvasView frame](v3, "frame");
      NSStringFromCGRect(v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v5 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_6:
  v11[2](v11, CFSTR("Canvas view"), v7);
  if (v5)
  {

  }
  v8 = CFSTR("No");
  if (self && self->_wantsCanvasVisible)
    v8 = CFSTR("Yes");
  v11[2](v11, CFSTR("wantsCanvasVisible"), (void *)v8);
  if (self)
  {
    if (-[PKTiledCanvasView isDrawing](self->__canvasView, "isDrawing"))
      v9 = CFSTR("Yes");
    else
      v9 = CFSTR("No");
  }
  else
  {
    v9 = CFSTR("No");
  }
  v11[2](v11, CFSTR("isDrawing"), (void *)v9);
  if (-[PKTextInputCanvasController canvasHasVisibleStrokes]((uint64_t)self))
    v10 = CFSTR("Yes");
  else
    v10 = CFSTR("No");
  v11[2](v11, CFSTR("hasVisibleStrokes"), (void *)v10);

}

- (void).cxx_destruct
{
  CGPoint *begin;

  objc_storeStrong((id *)&self->__floatingBackgroundView, 0);
  objc_storeStrong((id *)&self->__canvasView, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentStroke, 0);
  objc_storeStrong((id *)&self->_strokeColorForStrokeUUID, 0);
  begin = self->_currentStrokePoints.__begin_;
  if (begin)
  {
    self->_currentStrokePoints.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_recentlyRemovedStrokeIDs, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
